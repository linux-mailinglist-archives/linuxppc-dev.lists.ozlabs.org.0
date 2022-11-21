Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50203631974
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 06:20:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NFwgq1qf6z3cLX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 16:20:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vw2aOEUx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vw2aOEUx;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NFwfq1zzkz2yph
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 16:19:14 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AL4eAYI032518;
	Mon, 21 Nov 2022 05:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=VpDAI8Z3+gbJ05x6zPgVS21Kl6zdsj9Jf2hQ12xu6oY=;
 b=Vw2aOEUx3sHLfpg8VrO8/E6CW7fUPGXX3exdkoJa/kC/KSyz0BTyJ2jurTx+Apvtf1Rd
 YUkMebHD/+9hXhNJwmaaU8AC6+sgSbn4snP3xipKfZD8i9RsKd0petC7iqgNmbSswvwP
 r1bzBsE97ejpiBqlvbsxzMNBc2k1q/bsRliY82jx5MPau+ETlgdlwomAvkWvLbqWUzyT
 nbwW5Yl8U5m97igE5ArSfLQ7Weaav8r/mlwSDvi41KeiDt2U/QvjkQGqg/axN/fV/M+A
 c1X9nBH3Q8lcHxkP+9xvmzxBgcV5Pk/HMVUxRPnxvQn4wi5bzs5WZpT7XLed163u+PDk Pw== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ky8wc7db6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Nov 2022 05:19:02 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AL570sL022194;
	Mon, 21 Nov 2022 05:19:00 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma04fra.de.ibm.com with ESMTP id 3kxps8sjek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Nov 2022 05:18:59 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AL5IvcZ6423256
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Nov 2022 05:18:57 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88A4711C081;
	Mon, 21 Nov 2022 05:18:57 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD84D11C08E;
	Mon, 21 Nov 2022 05:18:56 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 21 Nov 2022 05:18:56 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C0AF760151;
	Mon, 21 Nov 2022 16:18:55 +1100 (AEDT)
Message-ID: <25cdf1560bc577dd45106436e7d808f8eafdc4b0.camel@linux.ibm.com>
Subject: Re: [PATCH 1/2] cxl: fix possible null-ptr-deref in
 cxl_guest_init_afu|adapter()
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Yang Yingliang <yangyingliang@huawei.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 21 Nov 2022 16:18:40 +1100
In-Reply-To: <20221111145440.2426970-1-yangyingliang@huawei.com>
References: <20221111145440.2426970-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: v8UhHJwUjJaRSPrJrTjN9Ub2f0Sk7DOi
X-Proofpoint-GUID: v8UhHJwUjJaRSPrJrTjN9Ub2f0Sk7DOi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_03,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211210039
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
PiBJZiBkZXZpY2VfcmVnaXN0ZXIoKSBmYWlscyBpbiBjeGxfcmVnaXN0ZXJfYWZ1fGFkYXB0ZXIo
KSwgdGhlIGRldmljZQo+IGlzIG5vdCBhZGRlZCwgZGV2aWNlX3VucmVnaXN0ZXIoKSBjYW4gbm90
IGJlIGNhbGxlZCBpbiB0aGUgZXJyb3IKPiBwYXRoLAo+IG90aGVyd2lzZSBpdCB3aWxsIGNhdXNl
IGEgbnVsbC1wdHItZGVyZWYgYmVjYXVzZSBvZiByZW1vdmluZyBub3QKPiBhZGRlZAo+IGRldmlj
ZS4KPiAKPiBBcyBjb21tZW50IG9mIGRldmljZV9yZWdpc3RlcigpIHNheXMsIGl0IHNob3VsZCB1
c2UgcHV0X2RldmljZSgpIHRvCj4gZ2l2ZQo+IHVwIHRoZSByZWZlcmVuY2UgaW4gdGhlIGVycm9y
IHBhdGguIFNvIHNwbGl0IGRldmljZV91bnJlZ2lzdGVyKCkgaW50bwo+IGRldmljZV9kZWwoKSBh
bmQgcHV0X2RldmljZSgpLCB0aGVuIGdvZXMgdG8gcHV0IGRldiB3aGVuIHJlZ2lzdGVyCj4gZmFp
bHMuCgpUaGUgY29tbWVudCBhcm91bmQgZGV2aWNlX2FkZCgpIGlzIHJlbGV2YW50IHRvbzoKCiAg
UnVsZSBvZiB0aHVtYiBpczogaWYgZGV2aWNlX2FkZCgpIHN1Y2NlZWRzLCB5b3Ugc2hvdWxkIGNh
bGwKICBkZXZpY2VfZGVsKCkgd2hlbiB5b3Ugd2FudCB0byBnZXQgcmlkIG9mIGl0LiBJZiBkZXZp
Y2VfYWRkKCkgaGFzCiAgKm5vdCogc3VjY2VlZGVkLCB1c2UgKm9ubHkqIHB1dF9kZXZpY2UoKSB0
byBkcm9wIHRoZSByZWZlcmVuY2UgY291bnQuCgo+IAo+IEZpeGVzOiAxNGJhZjRkOWM3MzkgKCJj
eGw6IEFkZCBndWVzdC1zcGVjaWZpYyBjb2RlIikKPiBTaWduZWQtb2ZmLWJ5OiBZYW5nIFlpbmds
aWFuZyA8eWFuZ3lpbmdsaWFuZ0BodWF3ZWkuY29tPgoKVGhhbmtzIGZvciB0aGUgZml4IQoKQWNr
ZWQtYnk6IEFuZHJldyBEb25uZWxsYW4gPGFqZEBsaW51eC5pYm0uY29tPgoKPiAtLS0KPiDCoGRy
aXZlcnMvbWlzYy9jeGwvZ3Vlc3QuYyB8IDI0ICsrKysrKysrKysrKysrLS0tLS0tLS0tLQo+IMKg
MSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL21pc2MvY3hsL2d1ZXN0LmMgYi9kcml2ZXJzL21pc2MvY3hsL2d1
ZXN0LmMKPiBpbmRleCAzNzVmNjkyYWU5ZDYuLmZiOTVhMmQ1Y2VmNCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL21pc2MvY3hsL2d1ZXN0LmMKPiArKysgYi9kcml2ZXJzL21pc2MvY3hsL2d1ZXN0LmMK
PiBAQCAtOTY1LDEwICs5NjUsMTAgQEAgaW50IGN4bF9ndWVzdF9pbml0X2FmdShzdHJ1Y3QgY3hs
ICphZGFwdGVyLCBpbnQKPiBzbGljZSwgc3RydWN0IGRldmljZV9ub2RlICphZnVfbgo+IMKgwqDC
oMKgwqDCoMKgwqAgKiBpZiBpdCByZXR1cm5zIGFuIGVycm9yIQo+IMKgwqDCoMKgwqDCoMKgwqAg
Ki8KPiDCoMKgwqDCoMKgwqDCoMKgaWYgKChyYyA9IGN4bF9yZWdpc3Rlcl9hZnUoYWZ1KSkpCj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZXJyX3B1dDE7Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZXJyX3B1dF9kZXY7Cj4gwqAKPiDCoMKgwqDCoMKg
wqDCoMKgaWYgKChyYyA9IGN4bF9zeXNmc19hZnVfYWRkKGFmdSkpKQo+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBnb3RvIGVycl9wdXQxOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBnb3RvIGVycl9kZWxfZGV2Owo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoC8qCj4gwqDC
oMKgwqDCoMKgwqDCoCAqIHBIeXAgZG9lc24ndCBleHBvc2UgdGhlIHByb2dyYW1taW5nIG1vZGVs
cyBzdXBwb3J0ZWQgYnkKPiB0aGUKPiBAQCAtOTg0LDcgKzk4NCw3IEBAIGludCBjeGxfZ3Vlc3Rf
aW5pdF9hZnUoc3RydWN0IGN4bCAqYWRhcHRlciwgaW50Cj4gc2xpY2UsIHN0cnVjdCBkZXZpY2Vf
bm9kZSAqYWZ1X24KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGFmdS0+bW9kZXNf
c3VwcG9ydGVkID0gQ1hMX01PREVfRElSRUNURUQ7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgaWYg
KChyYyA9IGN4bF9hZnVfc2VsZWN0X2Jlc3RfbW9kZShhZnUpKSkKPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgZ290byBlcnJfcHV0MjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgZ290byBlcnJfcmVtb3ZlX3N5c2ZzOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGFkYXB0
ZXItPmFmdVthZnUtPnNsaWNlXSA9IGFmdTsKPiDCoAo+IEBAIC0xMDA0LDEwICsxMDA0LDEyIEBA
IGludCBjeGxfZ3Vlc3RfaW5pdF9hZnUoc3RydWN0IGN4bCAqYWRhcHRlciwKPiBpbnQgc2xpY2Us
IHN0cnVjdCBkZXZpY2Vfbm9kZSAqYWZ1X24KPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4g
MDsKPiDCoAo+IC1lcnJfcHV0MjoKPiArZXJyX3JlbW92ZV9zeXNmczoKPiDCoMKgwqDCoMKgwqDC
oMKgY3hsX3N5c2ZzX2FmdV9yZW1vdmUoYWZ1KTsKPiAtZXJyX3B1dDE6Cj4gLcKgwqDCoMKgwqDC
oMKgZGV2aWNlX3VucmVnaXN0ZXIoJmFmdS0+ZGV2KTsKPiArZXJyX2RlbF9kZXY6Cj4gK8KgwqDC
oMKgwqDCoMKgZGV2aWNlX2RlbCgmYWZ1LT5kZXYpOwo+ICtlcnJfcHV0X2RldjoKPiArwqDCoMKg
wqDCoMKgwqBwdXRfZGV2aWNlKCZhZnUtPmRldik7Cj4gwqDCoMKgwqDCoMKgwqDCoGZyZWUgPSBm
YWxzZTsKPiDCoMKgwqDCoMKgwqDCoMKgZ3Vlc3RfcmVsZWFzZV9zZXJyX2lycShhZnUpOwo+IMKg
ZXJyMjoKPiBAQCAtMTE0MSwxOCArMTE0MywyMCBAQCBzdHJ1Y3QgY3hsICpjeGxfZ3Vlc3RfaW5p
dF9hZGFwdGVyKHN0cnVjdAo+IGRldmljZV9ub2RlICpucCwgc3RydWN0IHBsYXRmb3JtX2Rldmlj
Cj4gwqDCoMKgwqDCoMKgwqDCoCAqIGV2ZW4gaWYgaXQgcmV0dXJucyBhbiBlcnJvciEKPiDCoMKg
wqDCoMKgwqDCoMKgICovCj4gwqDCoMKgwqDCoMKgwqDCoGlmICgocmMgPSBjeGxfcmVnaXN0ZXJf
YWRhcHRlcihhZGFwdGVyKSkpCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8g
ZXJyX3B1dDE7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZXJyX3B1dF9k
ZXY7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKChyYyA9IGN4bF9zeXNmc19hZGFwdGVyX2Fk
ZChhZGFwdGVyKSkpCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZXJyX3B1
dDE7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZXJyX2RlbF9kZXY7Cj4g
wqAKPiDCoMKgwqDCoMKgwqDCoMKgLyogcmVsZWFzZSB0aGUgY29udGV4dCBsb2NrIGFzIHRoZSBh
ZGFwdGVyIGlzIGNvbmZpZ3VyZWQgKi8KPiDCoMKgwqDCoMKgwqDCoMKgY3hsX2FkYXB0ZXJfY29u
dGV4dF91bmxvY2soYWRhcHRlcik7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGFkYXB0
ZXI7Cj4gwqAKPiAtZXJyX3B1dDE6Cj4gLcKgwqDCoMKgwqDCoMKgZGV2aWNlX3VucmVnaXN0ZXIo
JmFkYXB0ZXItPmRldik7Cj4gK2Vycl9kZWxfZGV2Ogo+ICvCoMKgwqDCoMKgwqDCoGRldmljZV9k
ZWwoJmFkYXB0ZXItPmRldik7Cj4gK2Vycl9wdXRfZGV2Ogo+ICvCoMKgwqDCoMKgwqDCoHB1dF9k
ZXZpY2UoJmFkYXB0ZXItPmRldik7Cj4gwqDCoMKgwqDCoMKgwqDCoGZyZWUgPSBmYWxzZTsKPiDC
oMKgwqDCoMKgwqDCoMKgY3hsX2d1ZXN0X3JlbW92ZV9jaGFyZGV2KGFkYXB0ZXIpOwo+IMKgZXJy
MToKCi0tIApBbmRyZXcgRG9ubmVsbGFuICAgIE96TGFicywgQURMIENhbmJlcnJhCmFqZEBsaW51
eC5pYm0uY29tICAgSUJNIEF1c3RyYWxpYSBMaW1pdGVkCg==

