Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE89A633194
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 01:48:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGQcN3vBHz3ccv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 11:48:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XhXkXX2o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XhXkXX2o;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGQbR4yvyz2xkD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 11:48:02 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ALM4Ak3037884;
	Tue, 22 Nov 2022 00:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=/xjzCBHyNEKTWGb+oHFtt+eziEjJqSYZ1L9g4zUdSh4=;
 b=XhXkXX2ot8mopgdKMCHJHSatnkiD7l4TUVLhaCiUKEudnQN4hNNc/BILIBPdhRbon60L
 B1EeAotO2tRWnMAUXIkMb4L/7JmsqUEkqHRR7DL7kTJdxjAY4hECLtkQwX3tX+1tRSur
 jYoz5pygVKlSNdLXn//xjM5+UUqec2ayYKwO9HKllYrv+bHiGwmHxJsj2dQNUAdeY4+c
 cvNrle4gf5T2tHB8jM2/HYH4oZEbGf6EeJ/o3hQuQfOj6jmJ39AsSSnvKl+6go7qkTsa
 SGxy/eR6G0sRix28EMk0sEs2W0XuH2r8Qr7fFVlyAFc4+eEdUTj8V4BhviOEq5FIfEpV nQ== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0fgues7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 00:47:48 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AM0ZANW011606;
	Tue, 22 Nov 2022 00:47:46 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma05fra.de.ibm.com with ESMTP id 3kxps8jg3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 00:47:46 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AM0lixO1114876
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Nov 2022 00:47:44 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 51148A405B;
	Tue, 22 Nov 2022 00:47:44 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A6214A4054;
	Tue, 22 Nov 2022 00:47:43 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 22 Nov 2022 00:47:43 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0AB7A6012E;
	Tue, 22 Nov 2022 11:47:40 +1100 (AEDT)
Message-ID: <c906752934f6cf66ef9db422d943fc92240bfa09.camel@linux.ibm.com>
Subject: Re: [PATCH v2] ocxl: fix pci device refcount leak when calling
 get_function_0()
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Yang Yingliang <yangyingliang@huawei.com>, fbarrat@linux.ibm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, mpe@ellerman.id.au
Date: Tue, 22 Nov 2022 11:47:39 +1100
In-Reply-To: <20221121154339.4088935-1-yangyingliang@huawei.com>
References: <20221121154339.4088935-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 96zUIWQQRPkdUNfsKTmkEHMwM2ghXPfz
X-Proofpoint-ORIG-GUID: 96zUIWQQRPkdUNfsKTmkEHMwM2ghXPfz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_18,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 mlxscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=967 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211220001
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gTW9uLCAyMDIyLTExLTIxIGF0IDIzOjQzICswODAwLCBZYW5nIFlpbmdsaWFuZyB3cm90ZToK
PiBnZXRfZnVuY3Rpb25fMCgpIGNhbGxzIHBjaV9nZXRfZG9tYWluX2J1c19hbmRfc2xvdCgpLCBh
cyBjb21tZW50Cj4gc2F5cywgaXQgcmV0dXJucyBhIHBjaSBkZXZpY2Ugd2l0aCByZWZjb3VudCBp
bmNyZW1lbnQsIHNvIGFmdGVyCj4gdXNpbmcgaXQsIHBjaV9kZXZfcHV0KCkgbmVlZHMgYmUgY2Fs
bGVkLgo+IAo+IEdldCB0aGUgZGV2aWNlIHJlZmVyZW5jZSB3aGVuIGdldF9mdW5jdGlvbl8wKCkg
aXMgbm90IGNhbGxlZCwgc28KPiBwY2lfZGV2X3B1dCgpIGNhbiBiZSBjYWxsZWQgaW4gdGhlIGVy
cm9yIHBhdGggYW5kIGNhbGxlcnMKPiB1bmNvbmRpdGlvbmFsbHkuIEFuZCBhZGQgY29tbWVudCBh
Ym92ZSBnZXRfZHZzZWNfdmVuZG9yMCgpIHRvIHRlbGwKPiBjYWxsZXJzIHRvIGNhbGwgcGNpX2Rl
dl9wdXQoKS4KPiAKPiBGaXhlczogODdkYjc1NzllYmQ1ICgib2N4bDogY29udHJvbCB2aWEgc3lz
ZnMgd2hldGhlciB0aGUgRlBHQSBpcwo+IHJlbG9hZGVkIG9uIGEgbGluayByZXNldCIpCj4gU3Vn
Z2VzdGVkLWJ5OiBBbmRyZXcgRG9ubmVsbGFuIDxhamRAbGludXguaWJtLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBZYW5nIFlpbmdsaWFuZyA8eWFuZ3lpbmdsaWFuZ0BodWF3ZWkuY29tPgoKTG9va3Mg
Z29vZCEKCkFja2VkLWJ5OiBBbmRyZXcgRG9ubmVsbGFuIDxhamRAbGludXguaWJtLmNvbT4KCj4g
LS0tCj4gdjEgLT4gdjI6Cj4gwqAgQWRkIGNvbW1lbnQgYWJvdmUgZ2V0X2R2c2VjX3ZlbmRvcjAo
KS4KPiDCoCBHZXQgcmVmZXJlbmNlIHdoZXJlIGRldiBpcyBmdW5jdGlvbiAwLCBhbmQgY2FsbCBw
Y2lfZGV2X3B1dCgpCj4gwqAgdW5jb25kaXRpb25hbGx5IGluIGNhbGxlcnMuCj4gLS0tCj4gwqBk
cml2ZXJzL21pc2Mvb2N4bC9jb25maWcuYyB8IDIwICsrKysrKysrKysrKysrKysrKystCj4gwqAx
IGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL21pc2Mvb2N4bC9jb25maWcuYyBiL2RyaXZlcnMvbWlzYy9vY3hsL2Nv
bmZpZy5jCj4gaW5kZXggZTQwMWE1MTU5NmI5Li45MmFiNDk3MDVmNjQgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9taXNjL29jeGwvY29uZmlnLmMKPiArKysgYi9kcml2ZXJzL21pc2Mvb2N4bC9jb25m
aWcuYwo+IEBAIC0xOTMsNiArMTkzLDE4IEBAIHN0YXRpYyBpbnQgcmVhZF9kdnNlY192ZW5kb3Io
c3RydWN0IHBjaV9kZXYKPiAqZGV2KQo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiDCoH0K
PiDCoAo+ICsvKioKPiArICogZ2V0X2R2c2VjX3ZlbmRvcjAoKSAtIEZpbmQgYSByZWxhdGVkIFBD
SSBkZXZpY2UgKGZ1bmN0aW9uIDApCj4gKyAqIEBkZXY6IFBDSSBkZXZpY2UgdG8gbWF0Y2gKPiAr
ICogQGRldjA6IFRoZSBQQ0kgZGV2aWNlIChmdW5jdGlvbiAwKSBmb3VuZAo+ICsgKiBAb3V0X3Bv
czogVGhlIHBvc2l0aW9uIG9mIFBDSSBkZXZpY2UgKGZ1bmN0aW9uIDApCj4gKyAqCj4gKyAqIFJl
dHVybnMgMCBvbiBzdWNjZXNzLCBuZWdhdGl2ZSBvbiBmYWlsdXJlLgo+ICsgKgo+ICsgKiBOT1RF
OiBJZiBpdCdzIHN1Y2Nlc3NmdWwsIHRoZSByZWZlcmVuY2Ugb2YgZGV2MCBpcyBpbmNyZWFzZWQs
Cj4gKyAqIHNvIGFmdGVyIHVzaW5nIGl0LCB0aGUgY2FsbGVycyBtdXN0IGNhbGwgcGNpX2Rldl9w
dXQoKSB0byBnaXZlCj4gKyAqIHVwIHRoZSByZWZlcmVuY2UuCj4gKyAqLwo+IMKgc3RhdGljIGlu
dCBnZXRfZHZzZWNfdmVuZG9yMChzdHJ1Y3QgcGNpX2RldiAqZGV2LCBzdHJ1Y3QgcGNpX2Rldgo+
ICoqZGV2MCwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpbnQgKm91dF9wb3MpCj4gwqB7Cj4gQEAgLTIwMiwxMCArMjE0LDE0IEBAIHN0
YXRpYyBpbnQgZ2V0X2R2c2VjX3ZlbmRvcjAoc3RydWN0IHBjaV9kZXYKPiAqZGV2LCBzdHJ1Y3Qg
cGNpX2RldiAqKmRldjAsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZXYgPSBn
ZXRfZnVuY3Rpb25fMChkZXYpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYg
KCFkZXYpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cmV0dXJuIC0xOwo+ICvCoMKgwqDCoMKgwqDCoH0gZWxzZSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGRldiA9IHBjaV9kZXZfZ2V0KGRldik7Cj4gwqDCoMKgwqDCoMKgwqDCoH0K
PiDCoMKgwqDCoMKgwqDCoMKgcG9zID0gZmluZF9kdnNlYyhkZXYsIE9DWExfRFZTRUNfVkVORE9S
X0lEKTsKPiAtwqDCoMKgwqDCoMKgwqBpZiAoIXBvcykKPiArwqDCoMKgwqDCoMKgwqBpZiAoIXBv
cykgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwY2lfZGV2X3B1dChkZXYpOwo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC0xOwo+ICvCoMKgwqDCoMKg
wqDCoH0KPiDCoMKgwqDCoMKgwqDCoMKgKmRldjAgPSBkZXY7Cj4gwqDCoMKgwqDCoMKgwqDCoCpv
dXRfcG9zID0gcG9zOwo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiBAQCAtMjIyLDYgKzIz
OCw3IEBAIGludCBvY3hsX2NvbmZpZ19nZXRfcmVzZXRfcmVsb2FkKHN0cnVjdCBwY2lfZGV2Cj4g
KmRldiwgaW50ICp2YWwpCj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgcGNpX3JlYWRfY29uZmlnX2R3
b3JkKGRldjAsIHBvcyArCj4gT0NYTF9EVlNFQ19WRU5ET1JfUkVTRVRfUkVMT0FELAo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJnJl
c2V0X3JlbG9hZCk7Cj4gK8KgwqDCoMKgwqDCoMKgcGNpX2Rldl9wdXQoZGV2MCk7Cj4gwqDCoMKg
wqDCoMKgwqDCoCp2YWwgPSAhIShyZXNldF9yZWxvYWQgJiBCSVQoMCkpOwo+IMKgwqDCoMKgwqDC
oMKgwqByZXR1cm4gMDsKPiDCoH0KPiBAQCAtMjQzLDYgKzI2MCw3IEBAIGludCBvY3hsX2NvbmZp
Z19zZXRfcmVzZXRfcmVsb2FkKHN0cnVjdCBwY2lfZGV2Cj4gKmRldiwgaW50IHZhbCkKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlc2V0X3JlbG9hZCAmPSB+QklUKDApOwo+IMKg
wqDCoMKgwqDCoMKgwqBwY2lfd3JpdGVfY29uZmlnX2R3b3JkKGRldjAsIHBvcyArCj4gT0NYTF9E
VlNFQ19WRU5ET1JfUkVTRVRfUkVMT0FELAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXNldF9yZWxvYWQpOwo+ICvCoMKgwqDC
oMKgwqDCoHBjaV9kZXZfcHV0KGRldjApOwo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiDC
oH0KPiDCoAoKLS0gCkFuZHJldyBEb25uZWxsYW4gICAgT3pMYWJzLCBBREwgQ2FuYmVycmEKYWpk
QGxpbnV4LmlibS5jb20gICBJQk0gQXVzdHJhbGlhIExpbWl0ZWQK

