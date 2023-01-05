Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5A665E60E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 08:29:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NndQF4FMSz3c8N
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 18:29:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kSfL7gvE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kSfL7gvE;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NndPF5cvcz2xHJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jan 2023 18:28:33 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3056hdea023052;
	Thu, 5 Jan 2023 07:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=0ZqWfpEWKdJqFzp4KsjrnYoNMDEmX6W7KWnwcqrc+10=;
 b=kSfL7gvE5OlxA/Rpcm82VOeu1mB6C3AHoHfYaZvgz3AHltEjEluNWBXLWL3nWv4GmU30
 u+W9/btuq/KnwC9swz8U7YbpJbLPFQkgaB3pmlTTb2KsXo5/CJ2osVEY9lQdv0PFG1MO
 5o8guImeYSctnwzcSLTBCeBy4GlWvi2x5eYbPTKcNXvM/YE+U8dVNyrqIUOLeMa5LgQU
 nVJHHWzOVSlKbUH64v6fIdBaZ1STg2d0XehYgJ93YxUvQdhy7FV7ZROe89Wi45yXO9Jk
 h75dm4vNVj3kxutmVfABGuYgdwOKgzUlZQtfbdIdWlfiTprckpBC9nCbD9MbAR42uyHi nw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mwshnryv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jan 2023 07:28:27 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3054vfLo020172;
	Thu, 5 Jan 2023 07:28:25 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3mtcq6ed1e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jan 2023 07:28:24 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3057SMDg45351338
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Jan 2023 07:28:22 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F8DC20043;
	Thu,  5 Jan 2023 07:28:22 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6EDDC20040;
	Thu,  5 Jan 2023 07:28:21 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  5 Jan 2023 07:28:21 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 60D8D60431;
	Thu,  5 Jan 2023 18:28:17 +1100 (AEDT)
Message-ID: <20729da992c608ed40f5f037a7314395075a4254.camel@linux.ibm.com>
Subject: Re: [PATCH v2 6/7] powerpc/secvar: Extend sysfs to include config
 vars
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 05 Jan 2023 18:28:16 +1100
In-Reply-To: <20221230042014.154483-7-ruscur@russell.cc>
References: <20221230042014.154483-1-ruscur@russell.cc>
	 <20221230042014.154483-7-ruscur@russell.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5SnJrs8iOIZ39TN1muwGd-B2d2MLVV03
X-Proofpoint-GUID: 5SnJrs8iOIZ39TN1muwGd-B2d2MLVV03
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_02,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 clxscore=1015 impostorscore=0 mlxlogscore=999
 mlxscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050058
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
PiBUaGUgZm9ydGhjb21pbmcgcHNlcmllcyBjb25zdW1lciBvZiB0aGUgc2VjdmFyIEFQSSB3YW50
cyB0byBleHBvc2UgYQo+IG51bWJlciBvZiBjb25maWcgdmFyaWFibGVzLsKgIEFsbG93aW5nIHNl
Y3ZhciBpbXBsZW1lbnRhdGlvbnMgdG8KPiBwcm92aWRlCj4gdGhlaXIgb3duIHN5c2ZzIGF0dHJp
YnV0ZXMgbWFrZXMgaXQgZWFzeSBmb3IgY29uc3VtZXJzIHRvIGV4cG9zZSB3aGF0Cj4gdGhleSBu
ZWVkIHRvLgo+IAo+IFRoaXMgaXMgbm90IGJlaW5nIHVzZWQgYnkgdGhlIE9QQUwgc2VjdmFyIGlt
cGxlbWVudGF0aW9uIGF0IHByZXNlbnQsCj4gYW5kCj4gdGhlIGNvbmZpZyBkaXJlY3Rvcnkgd2ls
bCBub3QgYmUgY3JlYXRlZCBpZiBubyBhdHRyaWJ1dGVzIGFyZSBzZXQuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogUnVzc2VsbCBDdXJyZXkgPHJ1c2N1ckBydXNzZWxsLmNjPgoKTWlub3IgY29tbWVudHMg
YmVsb3csIGJ1dCByZWdhcmRsZXNzOgoKUmV2aWV3ZWQtYnk6IEFuZHJldyBEb25uZWxsYW4gPGFq
ZEBsaW51eC5pYm0uY29tPgoKPiAtLS0KPiBJIHBsYXllZCBhcm91bmQgd2l0aCBhZGRpbmcgYW4g
QVBJIGNhbGwgdG8gZmFjaWxpdGF0ZSBhIG1vcmUgZ2VuZXJpYwo+IGtleS92YWx1ZSBpbnRlcmZh
Y2UgZm9yIGNvbmZpZyB2YXJpYWJsZXMgYW5kIGl0IHNlZW1lZCBsaWtlCj4gdW5uZWNlc3NhcnkK
PiBjb21wbGV4aXR5LsKgIEkgdGhpbmsgdGhpcyBpcyBjbGVhbmVyLsKgIElmIHRoZXJlIHdhcyBl
dmVyIGEgc2VjdmFyCj4gaW50ZXJmYWNlIG90aGVyIHRoYW4gc3lzZnMgd2UnZCBoYXZlIHRvIHJl
d29yayBpdCwgdGhvdWdoLgoKSSBjb25jdXIsIHRoaXMgY2FuIGJlIGRlYWx0IHdpdGggaWYvd2hl
biB0aGUgc2VjdmFyIGludGVyZmFjZSBpcwpleHBvc2VkIGJ5IHNvbWUgb3RoZXIgbWVhbnMgdGhh
biBzeXNmcy4KCj4gCj4gwqBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vc2VjdmFyLmjCoCB8wqAg
MyArKysKPiDCoGFyY2gvcG93ZXJwYy9rZXJuZWwvc2VjdmFyLXN5c2ZzLmMgfCA0MCArKysrKysr
KysrKysrKysrKysrKysrKysrKy0tCj4gLS0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL3NlY3Zhci5oCj4gYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vc2VjdmFyLmgK
PiBpbmRleCA5MmQyYzA1MTkxOGIuLjI1MGU3MDY2YjZkYSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vc2VjdmFyLmgKPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9h
c20vc2VjdmFyLmgKPiBAQCAtMTAsNiArMTAsNyBAQAo+IMKgCj4gwqAjaW5jbHVkZSA8bGludXgv
dHlwZXMuaD4KPiDCoCNpbmNsdWRlIDxsaW51eC9lcnJuby5oPgo+ICsjaW5jbHVkZSA8bGludXgv
c3lzZnMuaD4KPiDCoAo+IMKgZXh0ZXJuIGNvbnN0IHN0cnVjdCBzZWN2YXJfb3BlcmF0aW9ucyAq
c2VjdmFyX29wczsKPiDCoAo+IEBAIC0yNywxMCArMjgsMTIgQEAgc3RydWN0IHNlY3Zhcl9vcGVy
YXRpb25zIHsKPiDCoCNpZmRlZiBDT05GSUdfUFBDX1NFQ1VSRV9CT09UCj4gwqAKPiDCoGV4dGVy
biB2b2lkIHNldF9zZWN2YXJfb3BzKGNvbnN0IHN0cnVjdCBzZWN2YXJfb3BlcmF0aW9ucyAqb3Bz
KTsKPiArZXh0ZXJuIHZvaWQgc2V0X3NlY3Zhcl9jb25maWdfYXR0cnMoY29uc3Qgc3RydWN0IGF0
dHJpYnV0ZSAqKmF0dHJzKTsKPiDCoAo+IMKgI2Vsc2UKPiDCoAo+IMKgc3RhdGljIGlubGluZSB2
b2lkIHNldF9zZWN2YXJfb3BzKGNvbnN0IHN0cnVjdCBzZWN2YXJfb3BlcmF0aW9ucwo+ICpvcHMp
IHsgfQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgc2V0X3NlY3Zhcl9jb25maWdfYXR0cnMoY29uc3Qg
c3RydWN0IGF0dHJpYnV0ZQo+ICoqYXR0cnMpIHsgfQo+IMKgCj4gwqAjZW5kaWYKPiDCoAo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL3NlY3Zhci1zeXNmcy5jCj4gYi9hcmNoL3Bv
d2VycGMva2VybmVsL3NlY3Zhci1zeXNmcy5jCj4gaW5kZXggYWExZGFlYzQ4MGUxLi5hZDFlMWQ3
MmQyYWUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9zZWN2YXItc3lzZnMuYwo+
ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvc2VjdmFyLXN5c2ZzLmMKPiBAQCAtMTUsOSArMTUs
MTcgQEAKPiDCoAo+IMKgI2RlZmluZSBOQU1FX01BWF9TSVpFwqDCoMKgwqAgMTAyNAo+IMKgCj4g
K2NvbnN0IHN0cnVjdCBhdHRyaWJ1dGUgKipzZWN2YXJfY29uZmlnX2F0dHJzIF9fcm9fYWZ0ZXJf
aW5pdCA9IE5VTEw7Cj4gKwo+IMKgc3RhdGljIHN0cnVjdCBrb2JqZWN0ICpzZWN2YXJfa29iajsK
PiDCoHN0YXRpYyBzdHJ1Y3Qga3NldCAqc2VjdmFyX2tzZXQ7Cj4gwqAKPiArdm9pZCBzZXRfc2Vj
dmFyX2NvbmZpZ19hdHRycyhjb25zdCBzdHJ1Y3QgYXR0cmlidXRlICoqYXR0cnMpCj4gK3sKPiAr
wqDCoMKgwqDCoMKgwqBXQVJOX09OX09OQ0Uoc2VjdmFyX2NvbmZpZ19hdHRycyk7Cj4gK8KgwqDC
oMKgwqDCoMKgc2VjdmFyX2NvbmZpZ19hdHRycyA9IGF0dHJzOwo+ICt9Cj4gKwo+IMKgc3RhdGlj
IHNzaXplX3QgZm9ybWF0X3Nob3coc3RydWN0IGtvYmplY3QgKmtvYmosIHN0cnVjdAo+IGtvYmpf
YXR0cmlidXRlICphdHRyLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY2hhciAqYnVmKQo+IMKgewo+IEBAIC0xMzQsNiArMTQyLDE2IEBAIHN0
YXRpYyBpbnQgdXBkYXRlX2tvYmpfc2l6ZSh2b2lkKQo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4g
MDsKPiDCoH0KPiDCoAo+ICtzdGF0aWMgaW50IHNlY3Zhcl9zeXNmc19jb25maWcoc3RydWN0IGtv
YmplY3QgKmtvYmopCj4gK3sKPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgYXR0cmlidXRlX2dyb3Vw
IGNvbmZpZ19ncm91cCA9IHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLm5hbWUg
PSAiY29uZmlnIiwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLmF0dHJzID0gKHN0
cnVjdCBhdHRyaWJ1dGUgKiopc2VjdmFyX2NvbmZpZ19hdHRycywKPiArwqDCoMKgwqDCoMKgwqB9
OwoKSSB3YXMgc2xpZ2h0bHkgY29uY2VybmVkIHRoYXQgeW91J3JlIHB1dHRpbmcgdGhpcyBvbiB0
aGUgc3RhY2ssIGJ1dCBpdApkb2Vzbid0IGFwcGVhciB0aGF0IHN5c2ZzX2NyZWF0ZV9ncm91cCgp
IGtlZXBzIGFueSByZWZlcmVuY2VzIHRvIHRoZQpncm91cCBhcm91bmQgYWZ0ZXIgaXQgY3JlYXRl
cyBhbGwgdGhlIGZpbGVzLCBzbyBJIHRoaW5rIHRoaXMgaXMgZmluZS4KCj4gKwo+ICvCoMKgwqDC
oMKgwqDCoHJldHVybiBzeXNmc19jcmVhdGVfZ3JvdXAoa29iaiwgJmNvbmZpZ19ncm91cCk7Cj4g
K30KPiArCj4gwqBzdGF0aWMgaW50IHNlY3Zhcl9zeXNmc19sb2FkKHZvaWQpCj4gwqB7Cj4gwqDC
oMKgwqDCoMKgwqDCoGNoYXIgKm5hbWU7Cj4gQEAgLTE5NiwyNiArMjE0LDM4IEBAIHN0YXRpYyBp
bnQgc2VjdmFyX3N5c2ZzX2luaXQodm9pZCkKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqByYyA9IHN5
c2ZzX2NyZWF0ZV9maWxlKHNlY3Zhcl9rb2JqLCAmZm9ybWF0X2F0dHIuYXR0cik7Cj4gwqDCoMKg
wqDCoMKgwqDCoGlmIChyYykgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBrb2Jq
ZWN0X3B1dChzZWN2YXJfa29iaik7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
dHVybiAtRU5PTUVNOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwcl9lcnIoInNl
Y3ZhcjogRmFpbGVkIHRvIGNyZWF0ZSBmb3JtYXQgb2JqZWN0XG4iKTsKClRoaXMgZmlsZSBkZWZp
bmVzIHByX2ZtdCwgc28gdGhlIHNlY3ZhcjogcHJlZml4IGhlcmUgY2FuIGdvIGF3YXksCnRob3Vn
aCBJIG5vdGljZSB0aGF0IGlzIHRoZSBjYXNlIGZvciBhbGwgdGhlIGV4aXN0aW5nIHByaW50cyBp
biB0aGlzCmZ1bmN0aW9uIHRvby4KCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJj
ID0gLUVOT01FTTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBlcnI7Cj4g
wqDCoMKgwqDCoMKgwqDCoH0KPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBzZWN2YXJfa3NldCA9IGtz
ZXRfY3JlYXRlX2FuZF9hZGQoInZhcnMiLCBOVUxMLCBzZWN2YXJfa29iaik7Cj4gwqDCoMKgwqDC
oMKgwqDCoGlmICghc2VjdmFyX2tzZXQpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHByX2Vycigic2VjdmFyOiBzeXNmcyBrb2JqZWN0IHJlZ2lzdHJhdGlvbgo+IGZhaWxlZC5c
biIpOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBrb2JqZWN0X3B1dChzZWN2YXJf
a29iaik7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRU5PTUVNOwo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByYyA9IC1FTk9NRU07Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZXJyOwo+IMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqAK
PiDCoMKgwqDCoMKgwqDCoMKgcmMgPSB1cGRhdGVfa29ial9zaXplKCk7Cj4gwqDCoMKgwqDCoMKg
wqDCoGlmIChyYykgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHJfZXJyKCJD
YW5ub3QgcmVhZCB0aGUgc2l6ZSBvZiB0aGUgYXR0cmlidXRlXG4iKTsKPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJjOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBnb3RvIGVycjsKPiArwqDCoMKgwqDCoMKgwqB9Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGlm
IChzZWN2YXJfY29uZmlnX2F0dHJzKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHJjID0gc2VjdmFyX3N5c2ZzX2NvbmZpZyhzZWN2YXJfa29iaik7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGlmIChyYykgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcHJfZXJyKCJzZWN2YXI6IEZhaWxlZCB0byBjcmVhdGUgY29uZmln
Cj4gZGlyZWN0b3J5XG4iKTsKClNhbWUgY29tbWVudCBhcyBhYm92ZQoKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZXJyOwo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqDCoMKgwqDCoMKgwqDCoH0KPiDCoAo+IMKgwqDCoMKg
wqDCoMKgwqBzZWN2YXJfc3lzZnNfbG9hZCgpOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoHJldHVy
biAwOwo+ICtlcnI6Cj4gK8KgwqDCoMKgwqDCoMKga29iamVjdF9wdXQoc2VjdmFyX2tvYmopOwo+
ICvCoMKgwqDCoMKgwqDCoHJldHVybiByYzsKPiDCoH0KPiDCoAo+IMKgbGF0ZV9pbml0Y2FsbChz
ZWN2YXJfc3lzZnNfaW5pdCk7CgotLSAKQW5kcmV3IERvbm5lbGxhbiAgICBPekxhYnMsIEFETCBD
YW5iZXJyYQphamRAbGludXguaWJtLmNvbSAgIElCTSBBdXN0cmFsaWEgTGltaXRlZAo=

