Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B57633388
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 03:47:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGTDh1d5Lz3cH9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 13:47:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bE6sRI36;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bE6sRI36;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGTCl1sD1z2yR9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 13:46:10 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AM1k5r8029896
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 02:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=W9XFsbpfBgs5DcjHPxPmt5dT36Ev/rkd8rL0E6L2n+k=;
 b=bE6sRI36zOlik2mkoBAIKVFuI8PDO5AeFsjUiKIs2As83naWCuKMo2rwGkHTGUITpM4N
 d86lI1qfCfSNCyH24myput3f3+UdzXr0pEg0VmctK/WHS+Q3U75DE0Z38ckiX+wkj8S7
 GfNuLLIR9xsfM+Yt6l2mCNn20r8J8y05OxaGsfAwk4GiMPhEUB7/w8I4zVRrhqFDGTsa
 RVQM5aYnnaxVpR/HRVjGOlWilwLOKA2advYyX2epElk59D90K8fdgbIRsbeu0Fp1NfqV
 m49l9ffPwx6N0kxSuxDNPP1GVh1Ko+60YaGD84TM4lFXNip9MD3FsTg3KGu+OeFP/qVH VQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0n22h1ds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 02:46:07 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AM2KtBs027314
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 02:46:07 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0n22h1dg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 02:46:07 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AM2aEn3014504;
	Tue, 22 Nov 2022 02:46:05 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06fra.de.ibm.com with ESMTP id 3kxpdj2k2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 02:46:05 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AM2dpTj47186182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Nov 2022 02:39:51 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08FD142041;
	Tue, 22 Nov 2022 02:46:03 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E80042045;
	Tue, 22 Nov 2022 02:46:02 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 22 Nov 2022 02:46:02 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DC7E860151;
	Tue, 22 Nov 2022 13:46:00 +1100 (AEDT)
Message-ID: <b4fbedbbf2009438946b9af884b2363f7886c606.camel@linux.ibm.com>
Subject: Re: [PATCH 01/13] powerpc/rtas: document rtas_call()
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 22 Nov 2022 13:46:00 +1100
In-Reply-To: <20221118150751.469393-2-nathanl@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
	 <20221118150751.469393-2-nathanl@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YYYaMrj3orRWZNJ6PidEed2ujoULp4qf
X-Proofpoint-GUID: v_3iuDYrHM3ljITeQiXoPAT_G4Gwd9TD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_18,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211220015
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
cnRhc19jYWxsKCkgaGFzIGEgY29tcGxleCBjYWxsaW5nIGNvbnZlbnRpb24sIG5vbi1zdGFuZGFy
ZCByZXR1cm4KPiB2YWx1ZXMsIGFuZCBtYW55IHVzZXJzLiBBZGQga2VybmVsLWRvYyBmb3IgaXQg
YW5kIHJlbW92ZSB0aGUgbGVzcwo+IHN0cnVjdHVyZWQgY29tbWVudGFyeSBmcm9tIHJ0YXMuaC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gTHluY2ggPG5hdGhhbmxAbGludXguaWJtLmNvbT4K
CkV4Y2VsbGVudCB3b3JrIQoKSSdtIG5vdCBvdmVybHkgZmFtaWxpYXIgd2l0aCBzb21lIG9mIHRo
ZSBSVEFTIGludGVybmFsIHN0dWZmIHlvdQpkZXNjcmliZSwgYnV0IEkndmUgY2hlY2tlZCB0aGUg
c3RhdHVzIGNvZGVzIGFnYWluc3QgbXkgY29weSBvZiBQQVBSIGFuZAp0aGV5IGNvbmN1ciwgc28g
SSdsbCBnaXZlIHRoaXMgYToKClJldmlld2VkLWJ5OiBBbmRyZXcgRG9ubmVsbGFuIDxhamRAbGlu
dXguaWJtLmNvbT4KCj4gLS0tCj4gwqBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcnRhcy5oIHwg
MTUgLS0tLS0tLS0tCj4gwqBhcmNoL3Bvd2VycGMva2VybmVsL3J0YXMuY8KgwqDCoMKgwqAgfCA1
OAo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+IMKgMiBmaWxlcyBjaGFuZ2Vk
LCA1OCBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9wb3dlcnBjL2luY2x1ZGUvYXNtL3J0YXMuaAo+IGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L3J0YXMuaAo+IGluZGV4IDU2MzE5YWVhNjQ2ZS4uNDc5YTk1Y2IyNzcwIDEwMDY0NAo+IC0tLSBh
L2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ydGFzLmgKPiArKysgYi9hcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20vcnRhcy5oCj4gQEAgLTMzLDIxICszMyw2IEBACj4gwqAjZGVmaW5lIFJUQVNfVEhS
RUFEU19BQ1RJVkXCoMKgwqDCoCAtOTAwNSAvKiBNdWx0aXBsZSBwcm9jZXNzb3IgdGhyZWFkcwo+
IGFjdGl2ZSAqLwo+IMKgI2RlZmluZSBSVEFTX09VVFNUQU5ESU5HX0NPUFJPQyAtOTAwNiAvKiBP
dXRzdGFuZGluZyBjb3Byb2Nlc3Nvcgo+IG9wZXJhdGlvbnMgKi8KPiDCoAo+IC0vKgo+IC0gKiBJ
biBnZW5lcmFsIHRvIGNhbGwgUlRBUyB1c2UgcnRhc190b2tlbigic3RyaW5nIikgdG8gbG9va3Vw
Cj4gLSAqIGFuIFJUQVMgdG9rZW4gZm9yIHRoZSBnaXZlbiBzdHJpbmcgKGUuZy4gImV2ZW50LXNj
YW4iKS4KPiAtICogVG8gYWN0dWFsbHkgcGVyZm9ybSB0aGUgY2FsbCB1c2UKPiAtICrCoMKgwqAg
cmV0ID0gcnRhc19jYWxsKHRva2VuLCBuX2luLCBuX291dCwgLi4uKQo+IC0gKiBXaGVyZSBuX2lu
IGlzIHRoZSBudW1iZXIgb2YgaW5wdXQgcGFyYW1ldGVycyBhbmQKPiAtICrCoMKgwqDCoMKgwqAg
bl9vdXQgaXMgdGhlIG51bWJlciBvZiBvdXRwdXQgcGFyYW1ldGVycwo+IC0gKgo+IC0gKiBJZiB0
aGUgInN0cmluZyIgaXMgaW52YWxpZCBvbiB0aGlzIHN5c3RlbSwgUlRBU19VTktOT1dOX1NFUlZJ
Q0UKPiAtICogd2lsbCBiZSByZXR1cm5lZCBhcyBhIHRva2VuLsKgIHJ0YXNfY2FsbCgpIGRvZXMg
bG9vayBmb3IgdGhpcwo+IC0gKiB0b2tlbiBhbmQgZXJyb3Igb3V0IGdyYWNlZnVsbHkgc28gcnRh
c19jYWxsKHJ0YXNfdG9rZW4oInN0ciIpLAo+IC4uLikKPiAtICogbWF5IGJlIHNhZmVseSB1c2Vk
IGZvciBvbmUtc2hvdCBjYWxscyB0byBSVEFTLgo+IC0gKgo+IC0gKi8KPiAtCj4gwqAvKiBSVEFT
IGV2ZW50IGNsYXNzZXMgKi8KPiDCoCNkZWZpbmUgUlRBU19JTlRFUk5BTF9FUlJPUsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoDB4ODAwMDAwMDAgLyogc2V0IGJpdCAwICovCj4gwqAjZGVmaW5lIFJU
QVNfRVBPV19XQVJOSU5HwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDB4NDAwMDAwMDAgLyog
c2V0IGJpdCAxICovCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvcnRhcy5jIGIv
YXJjaC9wb3dlcnBjL2tlcm5lbC9ydGFzLmMKPiBpbmRleCBlODQ3ZjliMWM1YjkuLmMxMmRkNWVk
NWUwMCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL3J0YXMuYwo+ICsrKyBiL2Fy
Y2gvcG93ZXJwYy9rZXJuZWwvcnRhcy5jCj4gQEAgLTQ2Nyw2ICs0NjcsNjQgQEAgdm9pZCBydGFz
X2NhbGxfdW5sb2NrZWQoc3RydWN0IHJ0YXNfYXJncyAqYXJncywKPiBpbnQgdG9rZW4sIGludCBu
YXJncywgaW50IG5yZXQsCj4gwqBzdGF0aWMgaW50IGlibV9vcGVuX2VycmluamN0X3Rva2VuOwo+
IMKgc3RhdGljIGludCBpYm1fZXJyaW5qY3RfdG9rZW47Cj4gwqAKPiArLyoqCj4gKyAqIHJ0YXNf
Y2FsbCgpIC0gSW52b2tlIGFuIFJUQVMgZmlybXdhcmUgZnVuY3Rpb24uCj4gKyAqIEB0b2tlbjog
SWRlbnRpZmllcyB0aGUgZnVuY3Rpb24gYmVpbmcgaW52b2tlZC4KPiArICogQG5hcmdzOiBOdW1i
ZXIgb2YgaW5wdXQgcGFyYW1ldGVycy4gRG9lcyBub3QgaW5jbHVkZSB0b2tlbi4KPiArICogQG5y
ZXQ6IE51bWJlciBvZiBvdXRwdXQgcGFyYW1ldGVycywgaW5jbHVkaW5nIHRoZSBjYWxsIHN0YXR1
cy4KPiArICogQG91dHB1dHM6IEFycmF5IG9mIEBucmV0IG91dHB1dCB3b3Jkcy4KPiArICogQC4u
Li46IExpc3Qgb2YgQG5hcmdzIGlucHV0IHBhcmFtZXRlcnMuCj4gKyAqCj4gKyAqIEludm9rZXMg
dGhlIFJUQVMgZnVuY3Rpb24gaW5kaWNhdGVkIGJ5IEB0b2tlbiwgd2hpY2ggdGhlIGNhbGxlcgo+
ICsgKiBzaG91bGQgb2J0YWluIHZpYSBydGFzX3Rva2VuKCkuCj4gKyAqCj4gKyAqIFRoZSBAbmFy
Z3MgYW5kIEBucmV0IGFyZ3VtZW50cyBtdXN0IG1hdGNoIHRoZSBudW1iZXIgb2YgaW5wdXQgYW5k
Cj4gKyAqIG91dHB1dCBwYXJhbWV0ZXJzIHNwZWNpZmllZCBmb3IgdGhlIFJUQVMgZnVuY3Rpb24u
Cj4gKyAqCj4gKyAqIHJ0YXNfY2FsbCgpIHJldHVybnMgUlRBUyBzdGF0dXMgY29kZXMsIG5vdCBj
b252ZW50aW9uYWwgTGludXgKPiBlcnJubwo+ICsgKiB2YWx1ZXMuIENhbGxlcnMgbXVzdCB0cmFu
c2xhdGUgYW55IGZhaWx1cmUgdG8gYW4gYXBwcm9wcmlhdGUKPiBlcnJubwo+ICsgKiBpbiBzeXNj
YWxsIGNvbnRleHQuIE1vc3QgY2FsbGVycyBvZiBSVEFTIGZ1bmN0aW9ucyB0aGF0IGNhbgo+IHJl
dHVybgo+ICsgKiAtMiBvciA5OTB4IHNob3VsZCB1c2UgcnRhc19idXN5X2RlbGF5KCkgdG8gY29y
cmVjdGx5IGhhbmRsZSB0aG9zZQo+ICsgKiBzdGF0dXNlcyBiZWZvcmUgY2FsbGluZyBhZ2Fpbi4K
PiArICoKPiArICogVGhlIHJldHVybiB2YWx1ZSBkZXNjcmlwdGlvbnMgYXJlIGFkYXB0ZWQgZnJv
bSA3LjIuOCBbUlRBU10KPiBSZXR1cm4KPiArICogQ29kZXMgb2YgdGhlIFBBUFIgYW5kIENIUlAg
c3BlY2lmaWNhdGlvbnMuCj4gKyAqCj4gKyAqIENvbnRleHQ6IFByb2Nlc3MgY29udGV4dCBwcmVm
ZXJhYmx5LCBpbnRlcnJ1cHQgY29udGV4dCBpZgo+ICsgKsKgwqDCoMKgwqDCoMKgwqDCoCBuZWNl
c3NhcnkuwqAgQWNxdWlyZXMgYW4gaW50ZXJuYWwgc3BpbmxvY2sgYW5kIG1heQo+IHBlcmZvcm0K
PiArICrCoMKgwqDCoMKgwqDCoMKgwqAgR0ZQX0FUT01JQyBzbGFiIGFsbG9jYXRpb24gaW4gZXJy
b3IgcGF0aC4gVW5zYWZlIGZvciBOTUkKPiArICrCoMKgwqDCoMKgwqDCoMKgwqAgY29udGV4dC4K
PiArICogUmV0dXJuOgo+ICsgKiAqwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgMCAtIFJUQVMgZnVuY3Rpb24gY2FsbCBzdWNjZWVkZWQuCj4gKyAqICrC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLTEgLSBSVEFT
IGZ1bmN0aW9uIGVuY291bnRlcmVkIGEKPiBoYXJkd2FyZSBvcgo+ICsgKsKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBsYXRmb3Jt
IGVycm9yLCBvciB0aGUgdG9rZW4gaXMKPiBpbnZhbGlkLAo+ICsgKsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG9yIHRoZSBmdW5j
dGlvbiBpcyByZXN0cmljdGVkIGJ5Cj4ga2VybmVsIHBvbGljeS4KPiArICogKsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtMiAtIFNwZWNzIHNheSAiQSBu
ZWNlc3NhcnkgaGFyZHdhcmUKPiBkZXZpY2Ugd2FzIGJ1c3ksCj4gKyAqwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYW5kIHRoZSBy
ZXF1ZXN0ZWQgZnVuY3Rpb24gY291bGQKPiBub3QgYmUKPiArICrCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwZXJmb3JtZWQuIFRo
ZSBvcGVyYXRpb24gc2hvdWxkIGJlCj4gcmV0cmllZCBhdAo+ICsgKsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGEgbGF0ZXIgdGlt
ZS4iIFRoaXMgaXMgbWlzbGVhZGluZywKPiBhdCBsZWFzdCB3aXRoCj4gKyAqwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVzcGVj
dCB0byBjdXJyZW50IFJUQVMKPiBpbXBsZW1lbnRhdGlvbnMuIFdoYXQgaXQKPiArICrCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1
c3VhbGx5IG1lYW5zIGluIHByYWN0aWNlIGlzIHRoYXQKPiB0aGUgZnVuY3Rpb24KPiArICrCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjb3VsZCBub3QgYmUgY29tcGxldGVkIHdoaWxlCj4gbWVldGluZyBSVEFTJ3MKPiArICrCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBkZWFkbGluZSBmb3IgcmV0dXJuaW5nIGNvbnRyb2wgdG8KPiB0aGUgT1MgKDI1MHVzCj4gKyAq
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZm9yIFBBUFIvUG93ZXJWTSwgdHlwaWNhbGx5KSwgYnV0Cj4gdGhlIGNhbGwgbWF5IGJl
Cj4gKyAqwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaW1tZWRpYXRlbHkgcmVhdHRlbXB0ZWQgdG8gcmVzdW1lCj4gd29yayBvbiBp
dC4KPiArICogKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAtMyAtIFBhcmFtZXRlciBlcnJvci4KPiArICogKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtNyAtIFVuZXhwZWN0ZWQgc3RhdGUgY2hhbmdlLgo+ICsg
KiAqwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDkwMDAuLi45ODk5IC0gVmVuZG9yLXNw
ZWNpZmljIHN1Y2Nlc3MgY29kZXMuCj4gKyAqICrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgOTkwMC4uLjk5MDUgLSBBZHZpc29yeSBleHRlbmRlZCBkZWxheS4gQ2FsbGVyCj4gc2hvdWxk
IHRyeQo+ICsgKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGFnYWluIGFmdGVyIH4xMF54IG1zIGhhcyBlbGFwc2VkLAo+IHdoZXJl
IHggaXMKPiArICrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB0aGUgbGFzdCBkaWdpdCBvZiB0aGUgc3RhdHVzIFswLQo+IDVdLiBB
Z2FpbiBnb2luZwo+ICsgKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJleW9uZCB0aGUgUEFQUiB0ZXh0LCA5OTB4IG9uCj4gUG93
ZXJWTSBpbmRpY2F0ZXMKPiArICrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250ZW50aW9uIGZvciBSVEFTLWludGVybmFsCj4g
cmVzb3VyY2VzLiBPdGhlcgo+ICsgKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFJUQVMgY2FsbCBzZXF1ZW5jZXMgaW4gcHJvZ3Jl
c3MKPiBzaG91bGQgYmUKPiArICrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhbGxvd2VkIHRvIGNvbXBsZXRlIGJlZm9yZQo+IHJl
YXR0ZW1wdGluZyB0aGUKPiArICrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYWxsLgo+ICsgKiAqwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC05MDAwIC0gTXVsdGktbGV2ZWwgaXNvbGF0aW9uIGVy
cm9yLgo+ICsgKiAqwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLTk5OTkuLi4tOTAwNCAtIFZl
bmRvci1zcGVjaWZpYyBlcnJvciBjb2Rlcy4KPiArICogKiBBZGRpdGlvbmFsIG5lZ2F0aXZlIHZh
bHVlcyAtIEZ1bmN0aW9uLXNwZWNpZmljIGVycm9yLgo+ICsgKiAqIEFkZGl0aW9uYWwgcG9zaXRp
dmUgdmFsdWVzIC0gRnVuY3Rpb24tc3BlY2lmaWMgc3VjY2Vzcy4KPiArICovCj4gwqBpbnQgcnRh
c19jYWxsKGludCB0b2tlbiwgaW50IG5hcmdzLCBpbnQgbnJldCwgaW50ICpvdXRwdXRzLCAuLi4p
Cj4gwqB7Cj4gwqDCoMKgwqDCoMKgwqDCoHZhX2xpc3QgbGlzdDsKCi0tIApBbmRyZXcgRG9ubmVs
bGFuICAgIE96TGFicywgQURMIENhbmJlcnJhCmFqZEBsaW51eC5pYm0uY29tICAgSUJNIEF1c3Ry
YWxpYSBMaW1pdGVkCg==

