@isTest public class {{ api_name }} implements HttpCalloutMock {

    protected Integer code;
    protected String status;
    protected String body;
    protected Map<String, String> responseHeaders;

    public {{ api_name }}(Integer code, String status, String body, Map<String, String> responseHeaders) {
        this.code = code;
        this.status = status;
        this.body = body;
        this.responseHeaders = responseHeaders;
    }

    public HTTPResponse respond(HTTPRequest req) {

        HttpResponse res = new HttpResponse();
        for (String key : responseHeaders.keySet()) {
            res.setHeader(key, responseHeaders.get(key));
        }
        res.setBody(body);
        res.setStatusCode(code);
        res.setStatus(status);
        return res;
    }

}
