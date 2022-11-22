Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22748633456
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 05:08:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGW2W07yxz3cT4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 15:08:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kNc5ugTR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kNc5ugTR;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGW1W2QbLz2xjr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 15:07:26 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AM3jwQ4004911
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 04:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=kN9zwAyb47um9TOwXzrAJ6BEn2fOBpxrh/RJ8WY/PQc=;
 b=kNc5ugTRgb2OprvAalIiUkeoIXw1h4dOn6uWIovodR5drpHs/K6FkAH/DQkR0nvzQ5ob
 CaaV1Itkkf1zw+ZY4g1hA5C3IcG8yjIRH1GzBQMzRSBwiLSzUJRbpQRmV72ZMUP8X/vj
 uYguD0bmCEh7CFtm5Q1/kaTYWlrxPeBmTk/CnPSWsmuZ4QAIjiNi0dgGuEY+Q820cDQK
 H0WHxWA3kc66RyXqv93XtjOb1pQPLd54PK5+SDNCsqgAebxU3LCmAcPA9fSX9JZcjxmS
 a2LHXWDPl0Z/qkj88cZcYYvdhqRQaV2xnXjq25ywkb5S4F5Cl0N9arQoWv0w+11rOqyH jQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0hqjxwy3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 04:07:23 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AM3m7uR001720
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 04:07:22 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0hqjxwwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 04:07:22 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AM47KBl028334;
	Tue, 22 Nov 2022 04:07:20 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3kxpdhuj64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 04:07:20 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AM47x4u48300348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Nov 2022 04:07:59 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 70BE3A4051;
	Tue, 22 Nov 2022 04:07:18 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C67F7A4040;
	Tue, 22 Nov 2022 04:07:17 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 22 Nov 2022 04:07:17 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A98AB600F3;
	Tue, 22 Nov 2022 15:07:16 +1100 (AEDT)
Message-ID: <b6735c38be0e4273b6f302db436672f4d3c344e0.camel@linux.ibm.com>
Subject: Re: [PATCH 08/13] powerpc/rtas: define pr_fmt and convert printk
 call sites
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 22 Nov 2022 15:07:16 +1100
In-Reply-To: <20221118150751.469393-9-nathanl@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
	 <20221118150751.469393-9-nathanl@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MAGyCQhKs5GjnY1IyqnUpE_fgSlnlfwK
X-Proofpoint-GUID: 5dMSsCa6D_HHgKehqOId8ZmcRCBKH70u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_18,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 impostorscore=0 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211220028
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gRnJpLCAyMDIyLTExLTE4IGF0IDA5OjA3IC0wNjAwLCBOYXRoYW4gTHluY2ggd3JvdGU6Cj4g
U2V0IHByX2ZtdCB0byAicnRhczogIiBhbmQgY29udmVydCB0aGUgaGFuZGZ1bCBvZiBwcmludGso
KSB1c2VzIGluCj4gcnRhcy5jLCBhZGp1c3RpbmcgdGhlIG1lc3NhZ2VzIHRvIHJlbW92ZSBub3ct
cmVkdW5kYW50ICJSVEFTIgo+IHN0cmluZ3MuCj4gCj4gTm90ZSB0aGF0IHJ0YXNfcmVzdGFydCgp
LCBydGFzX3Bvd2VyX29mZigpLCBhbmQgcnRhc19oYWx0KCkgYWxsCj4gY3VycmVudGx5IHVzZSBw
cmludGsoKSB3aXRob3V0IHNwZWNpZnlpbmcgYSBsb2cgbGV2ZWwuIFRoZXNlIGhhdmUKPiBiZWVu
Cj4gY2hhbmdlZCB0byB1c2UgcHJfZW1lcmcoKSwgd2hpY2ggbWF0Y2hlcyB0aGUgYmVoYXZpb3Ig
b2YKPiBydGFzX29zX3Rlcm0oKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gTHluY2ggPG5h
dGhhbmxAbGludXguaWJtLmNvbT4KClJldmlld2VkLWJ5OiBBbmRyZXcgRG9ubmVsbGFuIDxhamRA
bGludXguaWJtLmNvbT4KCj4gLS0tCj4gwqBhcmNoL3Bvd2VycGMva2VybmVsL3J0YXMuYyB8IDE5
ICsrKysrKysrKystLS0tLS0tLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCsp
LCA5IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL3J0
YXMuYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvcnRhcy5jCj4gaW5kZXggN2E1ODEyNjI0ZTExLi5j
MzE0MmQzNTJmNDEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9ydGFzLmMKPiAr
KysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3J0YXMuYwo+IEBAIC03LDYgKzcsOCBAQAo+IMKgICog
Q29weXJpZ2h0IChDKSAyMDAxIElCTS4KPiDCoCAqLwo+IMKgCj4gKyNkZWZpbmUgcHJfZm10KGZt
dCnCoMKgwqDCoCJydGFzOiAiIGZtdAo+ICsKPiDCoCNpbmNsdWRlIDxsaW51eC9jYXBhYmlsaXR5
Lmg+Cj4gwqAjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4KPiDCoCNpbmNsdWRlIDxsaW51eC9leHBv
cnQuaD4KPiBAQCAtNzE4LDggKzcyMCw3IEBAIHN0YXRpYyBpbnQgcnRhc19lcnJvcl9yYyhpbnQg
cnRhc19yYykKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqByYyA9IC1FTk9ERVY7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgYnJlYWs7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZWZhdWx0
Ogo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHJpbnRr
KEtFUk5fRVJSICIlczogdW5leHBlY3RlZCBSVEFTIGVycm9yCj4gJWRcbiIsCj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoF9fZnVuY19fLCBydGFzX3JjKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHByX2VycigiJXM6IHVuZXhwZWN0ZWQgZXJyb3IgJWRc
biIsIF9fZnVuY19fLAo+IHJ0YXNfcmMpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHJjID0gLUVSQU5HRTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiDCoMKgwqDCoMKgwqDCoMKgfQo+IEBA
IC05MjMsOCArOTI0LDggQEAgdm9pZCBfX25vcmV0dXJuIHJ0YXNfcmVzdGFydChjaGFyICpjbWQp
Cj4gwqB7Cj4gwqDCoMKgwqDCoMKgwqDCoGlmIChydGFzX2ZsYXNoX3Rlcm1faG9vaykKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJ0YXNfZmxhc2hfdGVybV9ob29rKFNZU19SRVNU
QVJUKTsKPiAtwqDCoMKgwqDCoMKgwqBwcmludGsoIlJUQVMgc3lzdGVtLXJlYm9vdCByZXR1cm5l
ZCAlZFxuIiwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcnRhc19jYWxsKHJ0YXNfdG9r
ZW4oInN5c3RlbS1yZWJvb3QiKSwgMCwgMSwgTlVMTCkpOwo+ICvCoMKgwqDCoMKgwqDCoHByX2Vt
ZXJnKCJzeXN0ZW0tcmVib290IHJldHVybmVkICVkXG4iLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcnRhc19jYWxsKHJ0YXNfdG9rZW4oInN5c3RlbS1yZWJvb3QiKSwgMCwgMSwg
TlVMTCkpOwo+IMKgwqDCoMKgwqDCoMKgwqBmb3IgKDs7KTsKPiDCoH0KPiDCoAo+IEBAIC05MzMs
OCArOTM0LDggQEAgdm9pZCBydGFzX3Bvd2VyX29mZih2b2lkKQo+IMKgwqDCoMKgwqDCoMKgwqBp
ZiAocnRhc19mbGFzaF90ZXJtX2hvb2spCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBydGFzX2ZsYXNoX3Rlcm1faG9vayhTWVNfUE9XRVJfT0ZGKTsKPiDCoMKgwqDCoMKgwqDCoMKg
LyogYWxsb3cgcG93ZXIgb24gb25seSB3aXRoIHBvd2VyIGJ1dHRvbiBwcmVzcyAqLwo+IC3CoMKg
wqDCoMKgwqDCoHByaW50aygiUlRBUyBwb3dlci1vZmYgcmV0dXJuZWQgJWRcbiIsCj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJ0YXNfY2FsbChydGFzX3Rva2VuKCJwb3dlci1vZmYiKSwg
MiwgMSwgTlVMTCwgLTEsIC0KPiAxKSk7Cj4gK8KgwqDCoMKgwqDCoMKgcHJfZW1lcmcoInBvd2Vy
LW9mZiByZXR1cm5lZCAlZFxuIiwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJ0
YXNfY2FsbChydGFzX3Rva2VuKCJwb3dlci1vZmYiKSwgMiwgMSwgTlVMTCwgLTEsIC0KPiAxKSk7
Cj4gwqDCoMKgwqDCoMKgwqDCoGZvciAoOzspOwo+IMKgfQo+IMKgCj4gQEAgLTk0Myw4ICs5NDQs
OCBAQCB2b2lkIF9fbm9yZXR1cm4gcnRhc19oYWx0KHZvaWQpCj4gwqDCoMKgwqDCoMKgwqDCoGlm
IChydGFzX2ZsYXNoX3Rlcm1faG9vaykKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHJ0YXNfZmxhc2hfdGVybV9ob29rKFNZU19IQUxUKTsKPiDCoMKgwqDCoMKgwqDCoMKgLyogYWxs
b3cgcG93ZXIgb24gb25seSB3aXRoIHBvd2VyIGJ1dHRvbiBwcmVzcyAqLwo+IC3CoMKgwqDCoMKg
wqDCoHByaW50aygiUlRBUyBwb3dlci1vZmYgcmV0dXJuZWQgJWRcbiIsCj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJ0YXNfY2FsbChydGFzX3Rva2VuKCJwb3dlci1vZmYiKSwgMiwgMSwg
TlVMTCwgLTEsIC0KPiAxKSk7Cj4gK8KgwqDCoMKgwqDCoMKgcHJfZW1lcmcoInBvd2VyLW9mZiBy
ZXR1cm5lZCAlZFxuIiwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJ0YXNfY2Fs
bChydGFzX3Rva2VuKCJwb3dlci1vZmYiKSwgMiwgMSwgTlVMTCwgLTEsIC0KPiAxKSk7Cj4gwqDC
oMKgwqDCoMKgwqDCoGZvciAoOzspOwo+IMKgfQo+IMKgCj4gQEAgLTk3OSw3ICs5ODAsNyBAQCB2
b2lkIHJ0YXNfb3NfdGVybShjaGFyICpzdHIpCj4gwqDCoMKgwqDCoMKgwqDCoH0gd2hpbGUgKHJ0
YXNfYnVzeV9kZWxheV90aW1lKHN0YXR1cykpOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGlmIChz
dGF0dXMgIT0gMCkKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHJpbnRrKEtFUk5f
RU1FUkcgImlibSxvcy10ZXJtIGNhbGwgZmFpbGVkICVkXG4iLAo+IHN0YXR1cyk7Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHByX2VtZXJnKCJpYm0sb3MtdGVybSBjYWxsIGZhaWxl
ZCAlZFxuIiwgc3RhdHVzKTsKPiDCoH0KPiDCoAo+IMKgLyoqCgotLSAKQW5kcmV3IERvbm5lbGxh
biAgICBPekxhYnMsIEFETCBDYW5iZXJyYQphamRAbGludXguaWJtLmNvbSAgIElCTSBBdXN0cmFs
aWEgTGltaXRlZAo=

