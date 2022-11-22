Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 835E363340C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 04:41:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGVS52wsjz3cJq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 14:41:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JqVXNHdP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JqVXNHdP;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGVR83v6jz2xHK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 14:41:07 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AM1K7aV021602
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 03:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=MSg4c7dEXBpz1WpENoC/6cxMJzXeGO8T3UKX2CPqzR8=;
 b=JqVXNHdPPFFDzWTro0iwwWQ7y5OtVNZRaI3R4iyXGVM5k9xUdp23qrrjoYvWW+4OqQbK
 IDCKlzhlNxwqIIucZ5ctPvzZxBZefZrjVUaN0rIOybOAylnzVA7xu2PvcMEzW28sdyGl
 pF+OVdAZ8tvfZPuKcB+NOm4OHYpr19oDPvCCzd/EXAxeuEEhrIinrdz0gV5+7OGAmEhO
 yBMDxZCcFlRQx3wMViix5py1cGygdlRU3peUWePI0JeOAmAT9uNwT7P0YkvMAnfr2H2n
 oCTbUgjf13+z+rQgh9u5i0BpMYvVs7wXnF2pt/YtBhp0d2VROi8nvVDK8UYjoIwSrkJK Lw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0hg2pubn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 03:41:05 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AM3f5ao014622
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 03:41:05 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0hg2puap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 03:41:05 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AM3Ys3B017395;
	Tue, 22 Nov 2022 03:41:02 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma05fra.de.ibm.com with ESMTP id 3kxps8jkc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 03:41:02 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AM3ffPI50397532
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Nov 2022 03:41:41 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5537E4C040;
	Tue, 22 Nov 2022 03:41:00 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB5904C046;
	Tue, 22 Nov 2022 03:40:59 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 22 Nov 2022 03:40:59 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id BFE6460151;
	Tue, 22 Nov 2022 14:40:52 +1100 (AEDT)
Message-ID: <59134437139dfda21e019fca56ff4a0223ebebb1.camel@linux.ibm.com>
Subject: Re: [PATCH 06/13] powerpc/rtas: clean up rtas_error_log_max
 initialization
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 22 Nov 2022 14:40:52 +1100
In-Reply-To: <20221118150751.469393-7-nathanl@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
	 <20221118150751.469393-7-nathanl@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: j-bxNBFzIdSnnJkWZzdVBtj7H8LSIBjY
X-Proofpoint-ORIG-GUID: 7C1kEzvkiFGKvl1chsCTthpBkspKaqBU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_18,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0
 clxscore=1015 suspectscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211220023
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
VGhlIGNvZGUgaW4gcnRhc19nZXRfZXJyb3JfbG9nX21heCgpIGRvZXNuJ3QgY2F1c2UgcHJvYmxl
bXMgaW4KPiBwcmFjdGljZSwgYnV0IHRoZXJlIGFyZSBubyBtZWFzdXJlcyB0byBlbnN1cmUgdGhh
dCB0aGUgbGF6eQo+IGluaXRpYWxpemF0aW9uIG9mIHRoZSBzdGF0aWMgcnRhc19lcnJvcl9sb2df
bWF4IHZhcmlhYmxlIGlzIGF0b21pYywKPiBhbmQgaXQncyBub3Qgd29ydGggYWRkaW5nIHRoZW0u
Cj4gCj4gSW5pdGlhbGl6ZSB0aGUgc3RhdGljIHJ0YXNfZXJyb3JfbG9nX21heCB2YXJpYWJsZSBh
dCBib290IHdoZW4gd2UncmUKPiBzaW5nbGUtdGhyZWFkZWQgaW5zdGVhZCBvZiBsYXppbHkgb24g
Zmlyc3QgdXNlLiBVc2UgdGhlIG1vcmUKPiBhcHByb3ByaWF0ZSBvZl9wcm9wZXJ0eV9yZWFkX3Uz
MigpIEFQSSBpbnN0ZWFkIG9mIHJ0YXNfdG9rZW4oKSB0bwo+IGNvbnN1bHQgdGhlICJydGFzLWVy
cm9yLWxvZy1tYXgiIHByb3BlcnR5LCB3aGljaCBpcyBub3QgdGhlIG5hbWUgb2YKPiBhbgo+IFJU
QVMgZnVuY3Rpb24uIENvbnZlcnQgdXNlIG9mIHByaW50aygpIHRvIHByX3dhcm4oKSBhbmQgZGlz
dGluZ3Vpc2gKPiB0aGUgcG9zc2libGUgZXJyb3IgY2FzZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTog
TmF0aGFuIEx5bmNoIDxuYXRoYW5sQGxpbnV4LmlibS5jb20+CgpSZXZpZXdlZC1ieTogQW5kcmV3
IERvbm5lbGxhbiA8YWpkQGxpbnV4LmlibS5jb20+Cgo+IC0tLQo+IMKgYXJjaC9wb3dlcnBjL2tl
cm5lbC9ydGFzLmMgfCAzNyArKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPiAt
Cj4gwqAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvcnRhcy5jIGIvYXJjaC9wb3dlcnBj
L2tlcm5lbC9ydGFzLmMKPiBpbmRleCA1MWYwNTA4NTkzYTcuLjNmYTg0YzI0NzQxNSAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL3J0YXMuYwo+ICsrKyBiL2FyY2gvcG93ZXJwYy9r
ZXJuZWwvcnRhcy5jCj4gQEAgLTM1Myw2ICszNTMsOSBAQCBpbnQgcnRhc19zZXJ2aWNlX3ByZXNl
bnQoY29uc3QgY2hhciAqc2VydmljZSkKPiDCoEVYUE9SVF9TWU1CT0wocnRhc19zZXJ2aWNlX3By
ZXNlbnQpOwo+IMKgCj4gwqAjaWZkZWYgQ09ORklHX1JUQVNfRVJST1JfTE9HR0lORwo+ICsKPiAr
c3RhdGljIHUzMiBydGFzX2Vycm9yX2xvZ19tYXggX19yb19hZnRlcl9pbml0ID0gUlRBU19FUlJP
Ul9MT0dfTUFYOwo+ICsKPiDCoC8qCj4gwqAgKiBSZXR1cm4gdGhlIGZpcm13YXJlLXNwZWNpZmll
ZCBzaXplIG9mIHRoZSBlcnJvciBsb2cgYnVmZmVyCj4gwqAgKsKgIGZvciBhbGwgcnRhcyBjYWxs
cyB0aGF0IHJlcXVpcmUgYW4gZXJyb3IgYnVmZmVyIGFyZ3VtZW50Lgo+IEBAIC0zNjAsMjEgKzM2
MywzMCBAQCBFWFBPUlRfU1lNQk9MKHJ0YXNfc2VydmljZV9wcmVzZW50KTsKPiDCoCAqLwo+IMKg
aW50IHJ0YXNfZ2V0X2Vycm9yX2xvZ19tYXgodm9pZCkKPiDCoHsKPiAtwqDCoMKgwqDCoMKgwqBz
dGF0aWMgaW50IHJ0YXNfZXJyb3JfbG9nX21heDsKPiAtwqDCoMKgwqDCoMKgwqBpZiAocnRhc19l
cnJvcl9sb2dfbWF4KQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcnRh
c19lcnJvcl9sb2dfbWF4Owo+IC0KPiAtwqDCoMKgwqDCoMKgwqBydGFzX2Vycm9yX2xvZ19tYXgg
PSBydGFzX3Rva2VuICgicnRhcy1lcnJvci1sb2ctbWF4Iik7Cj4gLcKgwqDCoMKgwqDCoMKgaWYg
KChydGFzX2Vycm9yX2xvZ19tYXggPT0gUlRBU19VTktOT1dOX1NFUlZJQ0UpIHx8Cj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgIChydGFzX2Vycm9yX2xvZ19tYXggPiBSVEFTX0VSUk9SX0xPR19NQVgp
KSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHByaW50ayAoS0VSTl9XQVJOSU5H
ICJSVEFTOiBiYWQgbG9nIGJ1ZmZlciBzaXplCj4gJWRcbiIsCj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBydGFzX2Vycm9yX2xvZ19tYXgpOwo+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBydGFzX2Vycm9yX2xvZ19tYXggPSBSVEFTX0VSUk9S
X0xPR19NQVg7Cj4gLcKgwqDCoMKgwqDCoMKgfQo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcnRh
c19lcnJvcl9sb2dfbWF4Owo+IMKgfQo+IMKgRVhQT1JUX1NZTUJPTChydGFzX2dldF9lcnJvcl9s
b2dfbWF4KTsKPiDCoAo+ICtzdGF0aWMgdm9pZCBfX2luaXQgaW5pdF9lcnJvcl9sb2dfbWF4KHZv
aWQpCj4gK3sKPiArwqDCoMKgwqDCoMKgwqBzdGF0aWMgY29uc3QgY2hhciBwcm9wbmFtZVtdIF9f
aW5pdGNvbnN0ID0gInJ0YXMtZXJyb3ItbG9nLQo+IG1heCI7Cj4gK8KgwqDCoMKgwqDCoMKgdTMy
IG1heDsKPiArCj4gK8KgwqDCoMKgwqDCoMKgaWYgKG9mX3Byb3BlcnR5X3JlYWRfdTMyKHJ0YXMu
ZGV2LCBwcm9wbmFtZSwgJm1heCkpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cHJfd2FybigiJXMgbm90IGZvdW5kLCB1c2luZyBkZWZhdWx0IG9mICV1XG4iLAo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHJvcG5hbWUsIFJUQVNfRVJS
T1JfTE9HX01BWCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG1heCA9IFJUQVNf
RVJST1JfTE9HX01BWDsKPiArwqDCoMKgwqDCoMKgwqB9Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGlm
IChtYXggPiBSVEFTX0VSUk9SX0xPR19NQVgpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcHJfd2FybigiJXMgPSAldSwgY2xhbXBpbmcgbWF4IGVycm9yIGxvZyBzaXplIHRvCj4g
JXVcbiIsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBw
cm9wbmFtZSwgbWF4LCBSVEFTX0VSUk9SX0xPR19NQVgpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBtYXggPSBSVEFTX0VSUk9SX0xPR19NQVg7Cj4gK8KgwqDCoMKgwqDCoMKgfQo+
ICsKPiArwqDCoMKgwqDCoMKgwqBydGFzX2Vycm9yX2xvZ19tYXggPSBtYXg7Cj4gK30KPiArCj4g
wqAKPiDCoHN0YXRpYyBjaGFyIHJ0YXNfZXJyX2J1ZltSVEFTX0VSUk9SX0xPR19NQVhdOwo+IMKg
c3RhdGljIGludCBydGFzX2xhc3RfZXJyb3JfdG9rZW47Cj4gQEAgLTQzMiw2ICs0NDQsNyBAQCBz
dGF0aWMgY2hhciAqX19mZXRjaF9ydGFzX2xhc3RfZXJyb3IoY2hhcgo+ICphbHRidWYpCj4gwqAj
ZWxzZSAvKiBDT05GSUdfUlRBU19FUlJPUl9MT0dHSU5HICovCj4gwqAjZGVmaW5lIF9fZmV0Y2hf
cnRhc19sYXN0X2Vycm9yKHgpwqDCoMKgwqDCoE5VTEwKPiDCoCNkZWZpbmUgZ2V0X2Vycm9ybG9n
X2J1ZmZlcigpwqDCoMKgwqDCoMKgwqDCoMKgwqBOVUxMCj4gK3N0YXRpYyB2b2lkIF9faW5pdCBp
bml0X2Vycm9yX2xvZ19tYXgodm9pZCkge30KPiDCoCNlbmRpZgo+IMKgCj4gwqAKPiBAQCAtMTM0
MSw2ICsxMzU0LDggQEAgdm9pZCBfX2luaXQgcnRhc19pbml0aWFsaXplKHZvaWQpCj4gwqDCoMKg
wqDCoMKgwqDCoG5vX2VudHJ5ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIocnRhcy5kZXYsICJsaW51
eCxydGFzLWVudHJ5IiwKPiAmZW50cnkpOwo+IMKgwqDCoMKgwqDCoMKgwqBydGFzLmVudHJ5ID0g
bm9fZW50cnkgPyBydGFzLmJhc2UgOiBlbnRyeTsKPiDCoAo+ICvCoMKgwqDCoMKgwqDCoGluaXRf
ZXJyb3JfbG9nX21heCgpOwo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgLyoKPiDCoMKgwqDCoMKgwqDC
oMKgICogRGlzY292ZXIgdGhlc2Ugbm93IHRvIGF2b2lkIGRldmljZSB0cmVlIGxvb2t1cHMgaW4g
dGhlCj4gwqDCoMKgwqDCoMKgwqDCoCAqIHBhbmljIHBhdGguCgotLSAKQW5kcmV3IERvbm5lbGxh
biAgICBPekxhYnMsIEFETCBDYW5iZXJyYQphamRAbGludXguaWJtLmNvbSAgIElCTSBBdXN0cmFs
aWEgTGltaXRlZAo=

