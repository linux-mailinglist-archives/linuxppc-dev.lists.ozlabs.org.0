Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F41631982
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 06:36:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NFx2g61bkz3cLF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 16:36:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tUz/meaj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tUz/meaj;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NFx1h3Jb8z2yQH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 16:35:36 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AL5VFNs016173;
	Mon, 21 Nov 2022 05:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=EdlrYswL8qqvWMetOSDsExrRbgVkd1zuCgrQzl5ZcvI=;
 b=tUz/meajZq1e32JV2pttJ+AZwhd3tJRL3GaauuczOk6q20EEHRmVZLRXODz45/gh12oT
 q3EQ5wScqLPu6Pff40wcS6YHOMFoIRxf1cx+mPT3dxZTrkSCTf3/d/+orBnCSQ48Zj7p
 TlGDyoiufYmYEKbVJglviZ8SzFzygrS5a3HSyM9UAz53By2WsWzXBE3NHRNHSaPwbYnH
 gLJoZDtEimaWxiYHMCYjq8kHfxSa8brfTieCBGi+0pZEK+jla/XLB+SyiP6aiKRZP7YH
 CocobJOJBNiOPSaQFhn17nQhDm8c/fAdoRlRYr3wIR9cQbzKDW+cV4//gx/flVt/bAO8 CA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ky8xsyknv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Nov 2022 05:35:23 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AL5ZFjX028594;
	Mon, 21 Nov 2022 05:35:21 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma02fra.de.ibm.com with ESMTP id 3kxps8sjxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Nov 2022 05:35:21 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AL5T9cI49742218
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Nov 2022 05:29:09 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C5B834207B;
	Mon, 21 Nov 2022 05:35:18 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 275244206E;
	Mon, 21 Nov 2022 05:35:18 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 21 Nov 2022 05:35:18 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2251E6032A;
	Mon, 21 Nov 2022 16:35:15 +1100 (AEDT)
Message-ID: <2bce0068c53426b41918e41eb1fa9f3cc3ce124d.camel@linux.ibm.com>
Subject: Re: [PATCH 2/2] cxl: fix possible null-ptr-deref in
 cxl_pci_init_afu|adapter()
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Yang Yingliang <yangyingliang@huawei.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 21 Nov 2022 16:35:14 +1100
In-Reply-To: <20221111145440.2426970-2-yangyingliang@huawei.com>
References: <20221111145440.2426970-1-yangyingliang@huawei.com>
	 <20221111145440.2426970-2-yangyingliang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SdBLBJbzxzpsUsun9y-vPAy2adozWwWU
X-Proofpoint-ORIG-GUID: SdBLBJbzxzpsUsun9y-vPAy2adozWwWU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_03,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211210043
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: fbarrat@linux.ibm.com, gregkh@linuxfoundation.org, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gRnJpLCAyMDIyLTExLTExIGF0IDIyOjU0ICswODAwLCBZYW5nIFlpbmdsaWFuZyB3cm90ZToK
PiBJZiBkZXZpY2VfcmVnaXN0ZXIoKSBmYWlscyBpbiBjeGxfcGNpX2FmdXxhZGFwdGVyKCksIHRo
ZSBkZXZpY2UKPiBpcyBub3QgYWRkZWQsIGRldmljZV91bnJlZ2lzdGVyKCkgY2FuIG5vdCBiZSBj
YWxsZWQgaW4gdGhlIGVycm9yCj4gcGF0aCwgb3RoZXJ3aXNlIGl0IHdpbGwgY2F1c2UgYSBudWxs
LXB0ci1kZXJlZiBiZWNhdXNlIG9mIHJlbW92aW5nCj4gbm90IGFkZGVkIGRldmljZS4KPiAKPiBB
cyBjb21tZW50IG9mIGRldmljZV9yZWdpc3RlcigpIHNheXMsIGl0IHNob3VsZCB1c2UgcHV0X2Rl
dmljZSgpIHRvCj4gZ2l2ZQo+IHVwIHRoZSByZWZlcmVuY2UgaW4gdGhlIGVycm9yIHBhdGguIFNv
IHNwbGl0IGRldmljZV91bnJlZ2lzdGVyKCkgaW50bwo+IGRldmljZV9kZWwoKSBhbmQgcHV0X2Rl
dmljZSgpLCB0aGVuIGdvZXMgdG8gcHV0IGRldiB3aGVuIHJlZ2lzdGVyCj4gZmFpbHMuCj4gCj4g
Rml4ZXM6IGYyMDRlMGI4Y2VkZCAoImN4bDogRHJpdmVyIGNvZGUgZm9yIHBvd2VybnYgUENJZSBi
YXNlZCBjYXJkcwo+IGZvciB1c2Vyc3BhY2UgYWNjZXNzIikKPiBTaWduZWQtb2ZmLWJ5OiBZYW5n
IFlpbmdsaWFuZyA8eWFuZ3lpbmdsaWFuZ0BodWF3ZWkuY29tPgoKU2VlIHJlcGx5IHRvIHBhdGNo
ICMxLgoKVGhpcyBwYXRjaCBwdXRzIGEgZmV3IHRoaW5ncyBiZXR3ZWVuIHRoZSBkZXZpY2VfZGVs
KCkgY2FsbCBhbmQgdGhlCnB1dF9kZXZpY2UoKSBjYWxsLCBidXQgdGhhdCBsb29rcyBmaW5lIC0g
d2UgZG9uJ3QgdG91Y2ggYWZ1LT5kZXYgaW4gdGhlCm1pZGRsZS4KClRoYW5rcyBmb3IgdGhlIGZp
eCEKCkFja2VkLWJ5OiBBbmRyZXcgRG9ubmVsbGFuIDxhamRAbGludXguaWJtLmNvbT4KCj4gLS0t
Cj4gwqBkcml2ZXJzL21pc2MvY3hsL3BjaS5jIHwgMjAgKysrKysrKysrKysrLS0tLS0tLS0KPiDC
oDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL21pc2MvY3hsL3BjaS5jIGIvZHJpdmVycy9taXNjL2N4bC9wY2ku
Ywo+IGluZGV4IDNkZTBhZWE2MmFkZS4uNmQ0OTVkNjQxYzk1IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvbWlzYy9jeGwvcGNpLmMKPiArKysgYi9kcml2ZXJzL21pc2MvY3hsL3BjaS5jCj4gQEAgLTEx
NjQsMTAgKzExNjQsMTAgQEAgc3RhdGljIGludCBwY2lfaW5pdF9hZnUoc3RydWN0IGN4bCAqYWRh
cHRlciwKPiBpbnQgc2xpY2UsIHN0cnVjdCBwY2lfZGV2ICpkZXYpCj4gwqDCoMKgwqDCoMKgwqDC
oCAqIGlmIGl0IHJldHVybnMgYW4gZXJyb3IhCj4gwqDCoMKgwqDCoMKgwqDCoCAqLwo+IMKgwqDC
oMKgwqDCoMKgwqBpZiAoKHJjID0gY3hsX3JlZ2lzdGVyX2FmdShhZnUpKSkKPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBlcnJfcHV0MTsKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgZ290byBlcnJfcHV0X2RldjsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBpZiAo
KHJjID0gY3hsX3N5c2ZzX2FmdV9hZGQoYWZ1KSkpCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGdvdG8gZXJyX3B1dDE7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdv
dG8gZXJyX2RlbF9kZXY7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgYWRhcHRlci0+YWZ1W2FmdS0+
c2xpY2VdID0gYWZ1Owo+IMKgCj4gQEAgLTExNzYsMTAgKzExNzYsMTIgQEAgc3RhdGljIGludCBw
Y2lfaW5pdF9hZnUoc3RydWN0IGN4bCAqYWRhcHRlciwKPiBpbnQgc2xpY2UsIHN0cnVjdCBwY2lf
ZGV2ICpkZXYpCj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gwqAKPiAtZXJyX3B1
dDE6Cj4gK2Vycl9kZWxfZGV2Ogo+ICvCoMKgwqDCoMKgwqDCoGRldmljZV9kZWwoJmFmdS0+ZGV2
KTsKPiArZXJyX3B1dF9kZXY6Cj4gwqDCoMKgwqDCoMKgwqDCoHBjaV9kZWNvbmZpZ3VyZV9hZnUo
YWZ1KTsKPiDCoMKgwqDCoMKgwqDCoMKgY3hsX2RlYnVnZnNfYWZ1X3JlbW92ZShhZnUpOwo+IC3C
oMKgwqDCoMKgwqDCoGRldmljZV91bnJlZ2lzdGVyKCZhZnUtPmRldik7Cj4gK8KgwqDCoMKgwqDC
oMKgcHV0X2RldmljZSgmYWZ1LT5kZXYpOwo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmM7Cj4g
wqAKPiDCoGVycl9mcmVlX25hdGl2ZToKPiBAQCAtMTY2NywyMyArMTY2OSwyNSBAQCBzdGF0aWMg
c3RydWN0IGN4bAo+ICpjeGxfcGNpX2luaXRfYWRhcHRlcihzdHJ1Y3QgcGNpX2RldiAqZGV2KQo+
IMKgwqDCoMKgwqDCoMKgwqAgKiBldmVuIGlmIGl0IHJldHVybnMgYW4gZXJyb3IhCj4gwqDCoMKg
wqDCoMKgwqDCoCAqLwo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoKHJjID0gY3hsX3JlZ2lzdGVyX2Fk
YXB0ZXIoYWRhcHRlcikpKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGVy
cl9wdXQxOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGVycl9wdXRfZGV2
Owo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGlmICgocmMgPSBjeGxfc3lzZnNfYWRhcHRlcl9hZGQo
YWRhcHRlcikpKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGVycl9wdXQx
Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGVycl9kZWxfZGV2Owo+IMKg
Cj4gwqDCoMKgwqDCoMKgwqDCoC8qIFJlbGVhc2UgdGhlIGNvbnRleHQgbG9jayBhcyBhZGFwdGVy
IGlzIGNvbmZpZ3VyZWQgKi8KPiDCoMKgwqDCoMKgwqDCoMKgY3hsX2FkYXB0ZXJfY29udGV4dF91
bmxvY2soYWRhcHRlcik7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGFkYXB0ZXI7Cj4g
wqAKPiAtZXJyX3B1dDE6Cj4gK2Vycl9kZWxfZGV2Ogo+ICvCoMKgwqDCoMKgwqDCoGRldmljZV9k
ZWwoJmFkYXB0ZXItPmRldik7Cj4gK2Vycl9wdXRfZGV2Ogo+IMKgwqDCoMKgwqDCoMKgwqAvKiBU
aGlzIHNob3VsZCBtaXJyb3IgY3hsX3JlbW92ZV9hZGFwdGVyLCBleGNlcHQgd2l0aG91dCB0aGUK
PiDCoMKgwqDCoMKgwqDCoMKgICogc3lzZnMgcGFydHMKPiDCoMKgwqDCoMKgwqDCoMKgICovCj4g
wqDCoMKgwqDCoMKgwqDCoGN4bF9kZWJ1Z2ZzX2FkYXB0ZXJfcmVtb3ZlKGFkYXB0ZXIpOwo+IMKg
wqDCoMKgwqDCoMKgwqBjeGxfZGVjb25maWd1cmVfYWRhcHRlcihhZGFwdGVyKTsKPiAtwqDCoMKg
wqDCoMKgwqBkZXZpY2VfdW5yZWdpc3RlcigmYWRhcHRlci0+ZGV2KTsKPiArwqDCoMKgwqDCoMKg
wqBwdXRfZGV2aWNlKCZhZGFwdGVyLT5kZXYpOwo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gRVJS
X1BUUihyYyk7Cj4gwqAKPiDCoGVycl9yZWxlYXNlOgoKLS0gCkFuZHJldyBEb25uZWxsYW4gICAg
T3pMYWJzLCBBREwgQ2FuYmVycmEKYWpkQGxpbnV4LmlibS5jb20gICBJQk0gQXVzdHJhbGlhIExp
bWl0ZWQK

