Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F6565CDE0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 08:51:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nn1xn6Td5z3c8d
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 18:51:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IvNAPIwS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IvNAPIwS;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nn1ws4pcRz2yyZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jan 2023 18:50:21 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30470TJA004692;
	Wed, 4 Jan 2023 07:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=nlR5v9LbmlouqW9g8B2hSA5SQ8aDtdzdBWD3vT1ml/4=;
 b=IvNAPIwSCM4p7CTfxdvMmqTSJvTDygbrSyZn8NX6PixRIZuq6B8iYA3kf8DDtmVhIpmz
 VUCiG6P/s5qpcvf7IKLajnrNOBrizO0y9/Ok1D3JDFK3Zk6Y+JHKDa2P8KI+gabeOxZy
 N2/gAV/Ih3Xn0h2rsqXyY0e60BtY8lJsV1ZhT78EHuCANRVneZjkF1bFzhRtIDAFSYtK
 ggf0sRTYP7Tl3b9FcWNZF8MA5eepVdr3P0tGYu74mxM0MRRiXjjCbdU/Ifnasb2gwZZo
 UqqBZmM9V65Qh9nEnXCVjP496k4xrYdNYAnjeWzZq0gDrPfFsrTPG/ll0ZuVvAZHmZS3 CQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mvjk2rj6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jan 2023 07:50:16 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 303Mh0KM003741;
	Wed, 4 Jan 2023 07:50:13 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3mtcbfcxa6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jan 2023 07:50:12 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3047oAOg45679070
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Jan 2023 07:50:10 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7230B2004F;
	Wed,  4 Jan 2023 07:50:10 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 757FA2004D;
	Wed,  4 Jan 2023 07:50:09 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  4 Jan 2023 07:50:09 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 25F1060060;
	Wed,  4 Jan 2023 18:50:06 +1100 (AEDT)
Message-ID: <01993c7ec9d4d97906dc54c165c32b6d8a30f1ec.camel@linux.ibm.com>
Subject: Re: [PATCH v2 5/7] powerpc/secvar: Handle max object size in the
 consumer
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 04 Jan 2023 18:50:05 +1100
In-Reply-To: <20221230042014.154483-6-ruscur@russell.cc>
References: <20221230042014.154483-1-ruscur@russell.cc>
	 <20221230042014.154483-6-ruscur@russell.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ltg5V2iHgSJbFfI-qLhijx_YaW9q10bf
X-Proofpoint-GUID: ltg5V2iHgSJbFfI-qLhijx_YaW9q10bf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_04,2023-01-03_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301040063
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
PiBDdXJyZW50bHkgdGhlIG1heCBvYmplY3Qgc2l6ZSBpcyBoYW5kbGVkIGluIHRoZSBjb3JlIHNl
Y3ZhciBjb2RlIHdpdGgKPiBhbgo+IGVudGlyZWx5IE9QQUwtc3BlY2lmaWMgaW1wbGVtZW50YXRp
b24sIHNvIGNyZWF0ZSBhIG5ldyBtYXhfc2l6ZSgpIG9wCj4gYW5kCj4gbW92ZSB0aGUgZXhpc3Rp
bmcgaW1wbGVtZW50YXRpb24gaW50byB0aGUgcG93ZXJudiBwbGF0Zm9ybS7CoCBTaG91bGQKPiBi
ZQo+IG5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwgQ3Vy
cmV5IDxydXNjdXJAcnVzc2VsbC5jYz4KCkxHVE0KClJldmlld2VkLWJ5OiBBbmRyZXcgRG9ubmVs
bGFuIDxhamRAbGludXguaWJtLmNvbT4KCj4gLS0tCj4gwqBhcmNoL3Bvd2VycGMvaW5jbHVkZS9h
c20vc2VjdmFyLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxICsKPiDCoGFyY2gvcG93ZXJw
Yy9rZXJuZWwvc2VjdmFyLXN5c2ZzLmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE3ICsrKy0tLS0t
LS0tLS0tLS0tCj4gwqBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybnYvb3BhbC1zZWN2YXIu
YyB8IDE5Cj4gKysrKysrKysrKysrKysrKysrKwo+IMKgMyBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNl
cnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL3NlY3Zhci5oCj4gYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vc2VjdmFy
LmgKPiBpbmRleCAzYjdlNWEzNjI1YmQuLjkyZDJjMDUxOTE4YiAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vc2VjdmFyLmgKPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vc2VjdmFyLmgKPiBAQCAtMjEsNiArMjEsNyBAQCBzdHJ1Y3Qgc2VjdmFyX29wZXJhdGlv
bnMgewo+IMKgwqDCoMKgwqDCoMKgwqBpbnQgKCpzZXQpKGNvbnN0IGNoYXIgKmtleSwgdWludDY0
X3Qga2V5X2xlbiwgdTggKmRhdGEsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHVpbnQ2NF90IGRhdGFfc2l6ZSk7Cj4gwqDCoMKgwqDCoMKgwqDCoHNzaXplX3QgKCpmb3Jt
YXQpKGNoYXIgKmJ1Zik7Cj4gK8KgwqDCoMKgwqDCoMKgaW50ICgqbWF4X3NpemUpKHVpbnQ2NF90
ICptYXhfc2l6ZSk7Cj4gwqB9Owo+IMKgCj4gwqAjaWZkZWYgQ09ORklHX1BQQ19TRUNVUkVfQk9P
VAo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL3NlY3Zhci1zeXNmcy5jCj4gYi9h
cmNoL3Bvd2VycGMva2VybmVsL3NlY3Zhci1zeXNmcy5jCj4gaW5kZXggMTkwMjM4ZjUxMzM1Li5h
YTFkYWVjNDgwZTEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9zZWN2YXItc3lz
ZnMuYwo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvc2VjdmFyLXN5c2ZzLmMKPiBAQCAtMTIy
LDI3ICsxMjIsMTYgQEAgc3RhdGljIHN0cnVjdCBrb2JqX3R5cGUgc2VjdmFyX2t0eXBlID0gewo+
IMKgc3RhdGljIGludCB1cGRhdGVfa29ial9zaXplKHZvaWQpCj4gwqB7Cj4gwqAKPiAtwqDCoMKg
wqDCoMKgwqBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGU7Cj4gwqDCoMKgwqDCoMKgwqDCoHU2NCB2
YXJzaXplOwo+IC3CoMKgwqDCoMKgwqDCoGludCByYyA9IDA7Cj4gK8KgwqDCoMKgwqDCoMKgaW50
IHJjID0gc2VjdmFyX29wcy0+bWF4X3NpemUoJnZhcnNpemUpOwo+IMKgCj4gLcKgwqDCoMKgwqDC
oMKgbm9kZSA9IG9mX2ZpbmRfY29tcGF0aWJsZV9ub2RlKE5VTEwsIE5VTEwsICJpYm0sc2VjdmFy
LQo+IGJhY2tlbmQiKTsKPiAtwqDCoMKgwqDCoMKgwqBpZiAoIW9mX2RldmljZV9pc19hdmFpbGFi
bGUobm9kZSkpIHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmMgPSAtRU5PREVW
Owo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIG91dDsKPiAtwqDCoMKgwqDC
oMKgwqB9Cj4gLQo+IC3CoMKgwqDCoMKgwqDCoHJjID0gb2ZfcHJvcGVydHlfcmVhZF91NjQobm9k
ZSwgIm1heC12YXItc2l6ZSIsICZ2YXJzaXplKTsKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHJjKQo+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIG91dDsKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJjOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGRhdGFf
YXR0ci5zaXplID0gdmFyc2l6ZTsKPiDCoMKgwqDCoMKgwqDCoMKgdXBkYXRlX2F0dHIuc2l6ZSA9
IHZhcnNpemU7Cj4gwqAKPiAtb3V0Ogo+IC3CoMKgwqDCoMKgwqDCoG9mX25vZGVfcHV0KG5vZGUp
Owo+IC0KPiAtwqDCoMKgwqDCoMKgwqByZXR1cm4gcmM7Cj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJu
IDA7Cj4gwqB9Cj4gwqAKPiDCoHN0YXRpYyBpbnQgc2VjdmFyX3N5c2ZzX2xvYWQodm9pZCkKPiBk
aWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wb3dlcm52L29wYWwtc2VjdmFyLmMK
PiBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJudi9vcGFsLXNlY3Zhci5jCj4gaW5kZXgg
NWU5ZGUwNmIyNTMzLi4wNzI2MDQ2MGU5NjYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL3Bs
YXRmb3Jtcy9wb3dlcm52L29wYWwtc2VjdmFyLmMKPiArKysgYi9hcmNoL3Bvd2VycGMvcGxhdGZv
cm1zL3Bvd2VybnYvb3BhbC1zZWN2YXIuYwo+IEBAIC0xMjUsMTEgKzEyNSwzMCBAQCBzdGF0aWMg
c3NpemVfdCBvcGFsX3NlY3Zhcl9mb3JtYXQoY2hhciAqYnVmKQo+IMKgwqDCoMKgwqDCoMKgwqBy
ZXR1cm4gcmM7Cj4gwqB9Cj4gwqAKPiArc3RhdGljIGludCBvcGFsX3NlY3Zhcl9tYXhfc2l6ZSh1
aW50NjRfdCAqbWF4X3NpemUpCj4gK3sKPiArwqDCoMKgwqDCoMKgwqBpbnQgcmM7Cj4gK8KgwqDC
oMKgwqDCoMKgc3RydWN0IGRldmljZV9ub2RlICpub2RlOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBu
b2RlID0gb2ZfZmluZF9jb21wYXRpYmxlX25vZGUoTlVMTCwgTlVMTCwgImlibSxzZWN2YXItCj4g
YmFja2VuZCIpOwo+ICvCoMKgwqDCoMKgwqDCoGlmICghb2ZfZGV2aWNlX2lzX2F2YWlsYWJsZShu
b2RlKSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByYyA9IC1FTk9ERVY7Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gb3V0Owo+ICvCoMKgwqDCoMKgwqDC
oH0KPiArCj4gK8KgwqDCoMKgwqDCoMKgcmMgPSBvZl9wcm9wZXJ0eV9yZWFkX3U2NChub2RlLCAi
bWF4LXZhci1zaXplIiwgbWF4X3NpemUpOwo+ICsKPiArb3V0Ogo+ICvCoMKgwqDCoMKgwqDCoG9m
X25vZGVfcHV0KG5vZGUpOwo+ICvCoMKgwqDCoMKgwqDCoHJldHVybiByYzsKPiArfQo+ICsKPiDC
oHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc2VjdmFyX29wZXJhdGlvbnMgb3BhbF9zZWN2YXJfb3BzID0g
ewo+IMKgwqDCoMKgwqDCoMKgwqAuZ2V0ID0gb3BhbF9nZXRfdmFyaWFibGUsCj4gwqDCoMKgwqDC
oMKgwqDCoC5nZXRfbmV4dCA9IG9wYWxfZ2V0X25leHRfdmFyaWFibGUsCj4gwqDCoMKgwqDCoMKg
wqDCoC5zZXQgPSBvcGFsX3NldF92YXJpYWJsZSwKPiDCoMKgwqDCoMKgwqDCoMKgLmZvcm1hdCA9
IG9wYWxfc2VjdmFyX2Zvcm1hdCwKPiArwqDCoMKgwqDCoMKgwqAubWF4X3NpemUgPSBvcGFsX3Nl
Y3Zhcl9tYXhfc2l6ZSwKPiDCoH07Cj4gwqAKPiDCoHN0YXRpYyBpbnQgb3BhbF9zZWN2YXJfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKCi0tIApBbmRyZXcgRG9ubmVsbGFuICAg
IE96TGFicywgQURMIENhbmJlcnJhCmFqZEBsaW51eC5pYm0uY29tICAgSUJNIEF1c3RyYWxpYSBM
aW1pdGVkCg==

