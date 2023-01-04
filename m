Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A2365CDA3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 08:32:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nn1Wx2JNDz3c8g
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 18:32:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F7rS+fPz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F7rS+fPz;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nn1W04x4mz2yPD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jan 2023 18:31:24 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3045HmGX024034;
	Wed, 4 Jan 2023 07:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=enX6vrsQyZauCvGhpRrVoHm2/GDBnNUaB8pVultaQ6s=;
 b=F7rS+fPzxa48bR8nZEDRUXTmpEwnECRHmnIcsqhQIgnlZ6oHCbHsCHLawy4Uav5HI6n8
 oF2KpCTLrdaeG3ZMrNwZ7k3q/vwkCergQW8V62YnrS0Gt3DDc8f4j3pvTOlbskNjexG5
 nV4D2bBKWUS6f2e0IIlh4Tjm8C4HXc3bTxEhskTa5i39HQhJKe/uluk5KFmbYnkkD5dt
 iztj8XfOua9zDOn5ZFwNQ9cSVp91naIas5XMKd29z48gD8HcxJWX7PmoGaBhv58oXw43
 KRy/NzxCiv8xuKZWxVi8oBi6m3jR9liTBa5Nc1GXDrcJr1GjUNAe98egxRrmVcuQD6Ft bw== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mvhh51r7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jan 2023 07:31:18 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 303JUK1f023379;
	Wed, 4 Jan 2023 07:31:16 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3mtcq6bjm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jan 2023 07:31:15 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3047VCa219399274
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Jan 2023 07:31:12 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD21C20049;
	Wed,  4 Jan 2023 07:31:12 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D5B9C20043;
	Wed,  4 Jan 2023 07:31:11 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  4 Jan 2023 07:31:11 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9A96D60060;
	Wed,  4 Jan 2023 18:31:08 +1100 (AEDT)
Message-ID: <64b4d32ce3434aa2dcd571123eaad082f6bed796.camel@linux.ibm.com>
Subject: Re: [PATCH v2 4/7] powerpc/secvar: Handle format string in the
 consumer
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 04 Jan 2023 18:31:08 +1100
In-Reply-To: <20221230042014.154483-5-ruscur@russell.cc>
References: <20221230042014.154483-1-ruscur@russell.cc>
	 <20221230042014.154483-5-ruscur@russell.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SPKBo4o151JQjiIx4N2fdkAj8ZKoDlXd
X-Proofpoint-GUID: SPKBo4o151JQjiIx4N2fdkAj8ZKoDlXd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_04,2023-01-03_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 mlxscore=0 phishscore=0 spamscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301040063
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
Cc: gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gRnJpLCAyMDIyLTEyLTMwIGF0IDE1OjIwICsxMTAwLCBSdXNzZWxsIEN1cnJleSB3cm90ZToK
PiBUaGUgY29kZSB0aGF0IGhhbmRsZXMgdGhlIGZvcm1hdCBzdHJpbmcgaW4gc2VjdmFyLXN5c2Zz
LmMgaXMgZW50aXJlbHkKPiBPUEFMIHNwZWNpZmljLCBzbyBjcmVhdGUgYSBuZXcgImZvcm1hdCIg
b3AgaW4gc2VjdmFyX29wZXJhdGlvbnMgdG8KPiBtYWtlCj4gdGhlIHNlY3ZhciBjb2RlIG1vcmUg
Z2VuZXJpYy7CoCBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSdXNz
ZWxsIEN1cnJleSA8cnVzY3VyQHJ1c3NlbGwuY2M+CgpMR1RNCgpSZXZpZXdlZC1ieTogQW5kcmV3
IERvbm5lbGxhbiA8YWpkQGxpbnV4LmlibS5jb20+Cgo+IC0tLQo+IMKgYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL3NlY3Zhci5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSArCj4gwqBhcmNo
L3Bvd2VycGMva2VybmVsL3NlY3Zhci1zeXNmcy5jwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyMSAr
LS0tLS0tLS0tLS0tLS0tCj4gwqBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybnYvb3BhbC1z
ZWN2YXIuYyB8IDI1Cj4gKysrKysrKysrKysrKysrKysrKysKPiDCoDMgZmlsZXMgY2hhbmdlZCwg
MjcgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9zZWN2YXIuaAo+IGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L3NlY3Zhci5oCj4gaW5kZXggNGNjMzViNThiOTg2Li4zYjdlNWEzNjI1YmQgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3NlY3Zhci5oCj4gKysrIGIvYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL3NlY3Zhci5oCj4gQEAgLTIwLDYgKzIwLDcgQEAgc3RydWN0IHNlY3Zhcl9v
cGVyYXRpb25zIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqB1aW50NjRfdCBrZXlidWZzaXplKTsKPiDCoMKgwqDCoMKgwqDCoMKgaW50ICgqc2V0KShj
b25zdCBjaGFyICprZXksIHVpbnQ2NF90IGtleV9sZW4sIHU4ICpkYXRhLAo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50NjRfdCBkYXRhX3NpemUpOwo+ICvCoMKgwqDC
oMKgwqDCoHNzaXplX3QgKCpmb3JtYXQpKGNoYXIgKmJ1Zik7Cj4gwqB9Owo+IMKgCj4gwqAjaWZk
ZWYgQ09ORklHX1BQQ19TRUNVUkVfQk9PVAo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2Vy
bmVsL3NlY3Zhci1zeXNmcy5jCj4gYi9hcmNoL3Bvd2VycGMva2VybmVsL3NlY3Zhci1zeXNmcy5j
Cj4gaW5kZXggMDJlOWZlZTE1NTJlLi4xOTAyMzhmNTEzMzUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9w
b3dlcnBjL2tlcm5lbC9zZWN2YXItc3lzZnMuYwo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwv
c2VjdmFyLXN5c2ZzLmMKPiBAQCAtMjEsMjYgKzIxLDcgQEAgc3RhdGljIHN0cnVjdCBrc2V0ICpz
ZWN2YXJfa3NldDsKPiDCoHN0YXRpYyBzc2l6ZV90IGZvcm1hdF9zaG93KHN0cnVjdCBrb2JqZWN0
ICprb2JqLCBzdHJ1Y3QKPiBrb2JqX2F0dHJpYnV0ZSAqYXR0ciwKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNoYXIgKmJ1ZikKPiDCoHsKPiAt
wqDCoMKgwqDCoMKgwqBzc2l6ZV90IHJjID0gMDsKPiAtwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZGV2
aWNlX25vZGUgKm5vZGU7Cj4gLcKgwqDCoMKgwqDCoMKgY29uc3QgY2hhciAqZm9ybWF0Owo+IC0K
PiAtwqDCoMKgwqDCoMKgwqBub2RlID0gb2ZfZmluZF9jb21wYXRpYmxlX25vZGUoTlVMTCwgTlVM
TCwgImlibSxzZWN2YXItCj4gYmFja2VuZCIpOwo+IC3CoMKgwqDCoMKgwqDCoGlmICghb2ZfZGV2
aWNlX2lzX2F2YWlsYWJsZShub2RlKSkgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqByYyA9IC1FTk9ERVY7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gb3V0
Owo+IC3CoMKgwqDCoMKgwqDCoH0KPiAtCj4gLcKgwqDCoMKgwqDCoMKgcmMgPSBvZl9wcm9wZXJ0
eV9yZWFkX3N0cmluZyhub2RlLCAiZm9ybWF0IiwgJmZvcm1hdCk7Cj4gLcKgwqDCoMKgwqDCoMKg
aWYgKHJjKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIG91dDsKPiAtCj4g
LcKgwqDCoMKgwqDCoMKgcmMgPSBzeXNmc19lbWl0KGJ1ZiwgIiVzXG4iLCBmb3JtYXQpOwo+IC0K
PiAtb3V0Ogo+IC3CoMKgwqDCoMKgwqDCoG9mX25vZGVfcHV0KG5vZGUpOwo+IC0KPiAtwqDCoMKg
wqDCoMKgwqByZXR1cm4gcmM7Cj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIHNlY3Zhcl9vcHMtPmZv
cm1hdChidWYpOwo+IMKgfQo+IMKgCj4gwqAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL3Bs
YXRmb3Jtcy9wb3dlcm52L29wYWwtc2VjdmFyLmMKPiBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMv
cG93ZXJudi9vcGFsLXNlY3Zhci5jCj4gaW5kZXggMTQxMzNlMTIwYmRkLi41ZTlkZTA2YjI1MzMg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wb3dlcm52L29wYWwtc2VjdmFy
LmMKPiArKysgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybnYvb3BhbC1zZWN2YXIuYwo+
IEBAIC0xMDEsMTAgKzEwMSwzNSBAQCBzdGF0aWMgaW50IG9wYWxfc2V0X3ZhcmlhYmxlKGNvbnN0
IGNoYXIgKmtleSwKPiB1aW50NjRfdCBrc2l6ZSwgdTggKmRhdGEsCj4gwqDCoMKgwqDCoMKgwqDC
oHJldHVybiBvcGFsX3N0YXR1c190b19lcnIocmMpOwo+IMKgfQo+IMKgCj4gK3N0YXRpYyBzc2l6
ZV90IG9wYWxfc2VjdmFyX2Zvcm1hdChjaGFyICpidWYpCj4gK3sKPiArwqDCoMKgwqDCoMKgwqBz
c2l6ZV90IHJjID0gMDsKPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGU7
Cj4gK8KgwqDCoMKgwqDCoMKgY29uc3QgY2hhciAqZm9ybWF0Owo+ICsKPiArwqDCoMKgwqDCoMKg
wqBub2RlID0gb2ZfZmluZF9jb21wYXRpYmxlX25vZGUoTlVMTCwgTlVMTCwgImlibSxzZWN2YXIt
Cj4gYmFja2VuZCIpOwo+ICvCoMKgwqDCoMKgwqDCoGlmICghb2ZfZGV2aWNlX2lzX2F2YWlsYWJs
ZShub2RlKSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByYyA9IC1FTk9ERVY7
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gb3V0Owo+ICvCoMKgwqDCoMKg
wqDCoH0KPiArCj4gK8KgwqDCoMKgwqDCoMKgcmMgPSBvZl9wcm9wZXJ0eV9yZWFkX3N0cmluZyhu
b2RlLCAiZm9ybWF0IiwgJmZvcm1hdCk7Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKHJjKQo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIG91dDsKPiArCj4gK8KgwqDCoMKgwqDCoMKg
cmMgPSBzeXNmc19lbWl0KGJ1ZiwgIiVzXG4iLCBmb3JtYXQpOwo+ICsKPiArb3V0Ogo+ICvCoMKg
wqDCoMKgwqDCoG9mX25vZGVfcHV0KG5vZGUpOwo+ICsKPiArwqDCoMKgwqDCoMKgwqByZXR1cm4g
cmM7Cj4gK30KPiArCj4gwqBzdGF0aWMgY29uc3Qgc3RydWN0IHNlY3Zhcl9vcGVyYXRpb25zIG9w
YWxfc2VjdmFyX29wcyA9IHsKPiDCoMKgwqDCoMKgwqDCoMKgLmdldCA9IG9wYWxfZ2V0X3Zhcmlh
YmxlLAo+IMKgwqDCoMKgwqDCoMKgwqAuZ2V0X25leHQgPSBvcGFsX2dldF9uZXh0X3ZhcmlhYmxl
LAo+IMKgwqDCoMKgwqDCoMKgwqAuc2V0ID0gb3BhbF9zZXRfdmFyaWFibGUsCj4gK8KgwqDCoMKg
wqDCoMKgLmZvcm1hdCA9IG9wYWxfc2VjdmFyX2Zvcm1hdCwKPiDCoH07Cj4gwqAKPiDCoHN0YXRp
YyBpbnQgb3BhbF9zZWN2YXJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKCi0t
IApBbmRyZXcgRG9ubmVsbGFuICAgIE96TGFicywgQURMIENhbmJlcnJhCmFqZEBsaW51eC5pYm0u
Y29tICAgSUJNIEF1c3RyYWxpYSBMaW1pdGVkCg==

