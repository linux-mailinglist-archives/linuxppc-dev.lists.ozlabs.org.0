Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A950565E692
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 09:16:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NnfSm46cnz3c7C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 19:16:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hloYh6b7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hloYh6b7;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NnfRm4xJXz2y32
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jan 2023 19:15:48 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3057hdDf009270;
	Thu, 5 Jan 2023 08:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=1pBl7g1XNpDaNU0GnkdzngxOoaH1buEfuior16cUyo4=;
 b=hloYh6b7xGnAoi+/VZsqfnU7CCcBtH4HfTO6rUS7c/r/MBAFZ7t11VBiTxbbphvHdgrM
 r49Rr9DJ8yJMl/2EjT57JypG5DkC2obyouy9Eo25zL4s2h4wGaV42NsS3HUbTTEH+2hu
 wxfIAR8fdbTo0IQk81jyjz5do/hM9NE1efHhfPrv3JIN3diF1hlc3QtCfxzoKchcphCy
 gZ53C1Oyc9GCeD7Ma1Zy/XQoXBhMTceoYTOA+Dz/aFF70YUgrozlHaUPVMftrTlYaLWK
 H1gpzx80lvh5Mq8DkevAfMFfp4vIArMY+jI53gMdHHv9GgxQrZrEzc8BOLyfSCJlbbJl Jw== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mwsmtsm4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jan 2023 08:15:41 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3050rmH5008404;
	Thu, 5 Jan 2023 08:15:39 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3mtcbfmr7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jan 2023 08:15:39 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3058Fbq844958172
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Jan 2023 08:15:37 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE5D120043;
	Thu,  5 Jan 2023 08:15:36 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D855820049;
	Thu,  5 Jan 2023 08:15:35 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  5 Jan 2023 08:15:35 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2657E60431;
	Thu,  5 Jan 2023 19:15:30 +1100 (AEDT)
Message-ID: <8b1183aa0e84363545a956118c970220670a636d.camel@linux.ibm.com>
Subject: Re: [PATCH v2 7/7] powerpc/pseries: Implement secvars for dynamic
 secure boot
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 05 Jan 2023 19:15:29 +1100
In-Reply-To: <20221230042014.154483-8-ruscur@russell.cc>
References: <20221230042014.154483-1-ruscur@russell.cc>
	 <20221230042014.154483-8-ruscur@russell.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: D_96lqsplXoXY4mHMA2dawx8tpUM6CqW
X-Proofpoint-GUID: D_96lqsplXoXY4mHMA2dawx8tpUM6CqW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_02,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050066
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
PiBUaGUgcHNlcmllcyBwbGF0Zm9ybSBjYW4gc3VwcG9ydCBkeW5hbWljIHNlY3VyZSBib290IChp
LmUuIHNlY3VyZQo+IGJvb3QKPiB1c2luZyB1c2VyLWRlZmluZWQga2V5cykgdXNpbmcgdmFyaWFi
bGVzIGNvbnRhaW5lZCB3aXRoIHRoZSBQb3dlclZNCj4gTFBBUgo+IFBsYXRmb3JtIEtleVN0b3Jl
IChQTFBLUykuwqAgVXNpbmcgdGhlIHBvd2VycGMgc2VjdmFyIEFQSSwgZXhwb3NlIHRoZQo+IHJl
bGV2YW50IHZhcmlhYmxlcyBmb3IgcHNlcmllcyBkeW5hbWljIHNlY3VyZSBib290IHRocm91Z2gg
dGhlCj4gZXhpc3RpbmcKPiBzZWN2YXIgZmlsZXN5c3RlbSBsYXlvdXQuCj4gCj4gVGhlIHJlbGV2
YW50IHZhcmlhYmxlcyBmb3IgZHluYW1pYyBzZWN1cmUgYm9vdCBhcmUgc2lnbmVkIGluIHRoZQo+
IGtleXN0b3JlLCBhbmQgY2FuIG9ubHkgYmUgbW9kaWZpZWQgdXNpbmcgdGhlIEhfUEtTX1NJR05F
RF9VUERBVEUKPiBoY2FsbC4KPiBPYmplY3QgbGFiZWxzIGluIHRoZSBrZXlzdG9yZSBhcmUgZW5j
b2RlZCB1c2luZyB1Y3MyIGZvcm1hdC7CoCBXaXRoCj4gb3VyCj4gZml4ZWQgdmFyaWFibGUgbmFt
ZXMgd2UgZG9uJ3QgaGF2ZSB0byBjYXJlIGFib3V0IGVuY29kaW5nIG91dHNpZGUgb2YKPiB0aGUK
PiBuZWNlc3NhcnkgYnl0ZSBwYWRkaW5nLgo+IAo+IFdoZW4gYSB1c2VyIHdyaXRlcyB0byBhIHZh
cmlhYmxlLCB0aGUgZmlyc3QgOCBieXRlcyBvZiBkYXRhIG11c3QKPiBjb250YWluCj4gdGhlIHNp
Z25lZCB1cGRhdGUgZmxhZ3MgYXMgZGVmaW5lZCBieSB0aGUgaHlwZXJ2aXNvci4KPiAKPiBXaGVu
IGEgdXNlciByZWFkcyBhIHZhcmlhYmxlLCB0aGUgZmlyc3QgNCBieXRlcyBvZiBkYXRhIGNvbnRh
aW4gdGhlCj4gcG9saWNpZXMgZGVmaW5lZCBmb3IgdGhlIG9iamVjdC4KPiAKPiBMaW1pdGF0aW9u
cyBleGlzdCBkdWUgdG8gdGhlIHVuZGVybHlpbmcgaW1wbGVtZW50YXRpb24gb2Ygc3lzZnMKPiBi
aW5hcnkKPiBhdHRyaWJ1dGVzLCBhcyBpcyB0aGUgY2FzZSBmb3IgdGhlIE9QQUwgc2VjdmFyIGlt
cGxlbWVudGF0aW9uIC0KPiBwYXJ0aWFsIHdyaXRlcyBhcmUgdW5zdXBwb3J0ZWQgYW5kIHdyaXRl
cyBjYW5ub3QgYmUgbGFyZ2VyIHRoYW4KPiBQQUdFX1NJWkUuCgpUaGUgUEFHRV9TSVpFIGxpbWl0
LCBpbiBwcmFjdGljZSwgd2lsbCBiZSBhIG1ham9yIGxpbWl0YXRpb24gd2l0aCA0SwpwYWdlcyAo
d2UgZXhwZWN0IHNldmVyYWwgb2YgdGhlIHZhcmlhYmxlcyB0byByZWd1bGFybHkgYmUgbGFyZ2Vy
IHRoYW4KNEspIGJ1dCB3b24ndCBiZSBtdWNoIG9mIGFuIGlzc3VlIGZvciA2NEsgKHRoYXQncyBh
bGwgdGhlIHN0b3JhZ2Ugc3BhY2UKdGhlIGh5cGVydmlzb3Igd2lsbCBnaXZlIHlvdSBhbnl3YXkp
LgoKSW4gYSBwcmV2aW91cyBpbnRlcm5hbCB2ZXJzaW9uLCB3ZSBwcmludGVkIGEgbWVzc2FnZSB3
aGVuIFBBR0VfU0laRSA8CnBscGtzX2dldF9tYXhvYmplY3RzaXplKCksIG1pZ2h0IGJlIHdvcnRo
IHN0aWxsIGRvaW5nIHRoYXQ/Cgo+IAo+IENvLWRldmVsb3BlZC1ieTogTmF5bmEgSmFpbiA8bmF5
bmFAbGludXguaWJtLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBOYXluYSBKYWluIDxuYXluYUBsaW51
eC5pYm0uY29tPgo+IENvLWRldmVsb3BlZC1ieTogQW5kcmV3IERvbm5lbGxhbiA8YWpkQGxpbnV4
LmlibS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IERvbm5lbGxhbiA8YWpkQGxpbnV4Lmli
bS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUnVzc2VsbCBDdXJyZXkgPHJ1c2N1ckBydXNzZWxsLmNj
PgoKU29tZSBtaW5vciBjb21tZW50cyBmb3IgdjMgb24gYSBwYXRjaCB3aGljaCBhbHJlYWR5IGNh
cnJpZXMgbXkKc2lnbm9mZi4uLgoKPiAtLS0KPiB2MjogUmVtb3ZlIHVubmVjZXNzYXJ5IGNvbmZp
ZyB2YXJzIGZyb20gc3lzZnMgYW5kIGRvY3VtZW50IHRoZQo+IG90aGVycywKPiDCoMKgwqAgdGhh
bmtzIHRvIHJldmlldyBmcm9tIEdyZWcuwqAgSWYgd2UgZW5kIHVwIG5lZWRpbmcgdG8gZXhwb3Nl
IG1vcmUsCj4gd2UKPiDCoMKgwqAgY2FuIGFkZCB0aGVtIGxhdGVyIGFuZCB1cGRhdGUgdGhlIGRv
Y3MuCj4gCj4gwqDCoMKgIFVzZSBzeXNmc19lbWl0KCkgaW5zdGVhZCBvZiBzcHJpbnRmKCksIHRo
YW5rcyB0byBHcmVnLgo+IAo+IMKgwqDCoCBDaGFuZ2UgdGhlIHNpemUgb2YgdGhlIHN5c2ZzIGJp
bmFyeSBhdHRyaWJ1dGVzIHRvIGluY2x1ZGUgdGhlIDgtCj4gYnl0ZQo+IMKgwqDCoCBmbGFncyBo
ZWFkZXIsIHByZXZlbnRpbmcgdHJ1bmNhdGlvbiBvZiBsYXJnZSB3cml0ZXMuCj4gCj4gwqBEb2N1
bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLXNlY3ZhcsKgwqDCoMKgwqDCoMKgIHzCoCA2NyAr
KysrLQo+IMKgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL0tjb25maWfCoMKgwqDCoMKg
wqDCoCB8wqAgMTMgKwo+IMKgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL01ha2VmaWxl
wqDCoMKgwqDCoMKgIHzCoMKgIDQgKy0KPiDCoGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNlcmll
cy9wbHBrcy1zZWN2YXIuYyB8IDI0NQo+ICsrKysrKysrKysrKysrKysrKwo+IMKgNCBmaWxlcyBj
aGFuZ2VkLCAzMjYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiDCoGNyZWF0ZSBtb2Rl
IDEwMDY0NCBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzZXJpZXMvcGxwa3Mtc2VjdmFyLmMKPiAK
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1zZWN2YXIKPiBi
L0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtc2VjdmFyCj4gaW5kZXggZmVlYmI4YzU3
Mjk0Li40NjZhOGNiOTJiOTIgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGlu
Zy9zeXNmcy1zZWN2YXIKPiArKysgYi9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLXNl
Y3Zhcgo+IEBAIC0zNCw3ICszNCw3IEBAIERlc2NyaXB0aW9uOsKgwqBBbiBpbnRlZ2VyIHJlcHJl
c2VudGF0aW9uIG9mIHRoZSBzaXplCj4gb2YgdGhlIGNvbnRlbnQgb2YgdGhlCj4gwqAKPiDCoFdo
YXQ6wqDCoMKgwqDCoMKgwqDCoMKgwqAvc3lzL2Zpcm13YXJlL3NlY3Zhci92YXJzLzx2YXJpYWJs
ZV9uYW1lPi9kYXRhCj4gwqBEYXRlOsKgwqDCoMKgwqDCoMKgwqDCoMKgQXVndXN0IDIwMTkKPiAt
Q29udGFjdDrCoMKgwqDCoMKgwqDCoE5heW5hIEphaW4gaDxuYXluYUBsaW51eC5pYm0uY29tPgo+
ICtDb250YWN0OsKgwqDCoMKgwqDCoMKgTmF5bmEgSmFpbiA8bmF5bmFAbGludXguaWJtLmNvbT4K
PiDCoERlc2NyaXB0aW9uOsKgwqDCoEEgcmVhZC1vbmx5IGZpbGUgY29udGFpbmluZyB0aGUgdmFs
dWUgb2YgdGhlCj4gdmFyaWFibGUuIFRoZSBzaXplCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBvZiB0aGUgZmlsZSByZXByZXNlbnRzIHRoZSBtYXhpbXVtIHNpemUgb2YgdGhlCj4g
dmFyaWFibGUgZGF0YS4KPiDCoAo+IEBAIC00NCwzICs0NCw2OCBAQCBDb250YWN0OsKgwqDCoMKg
wqBOYXluYSBKYWluIDxuYXluYUBsaW51eC5pYm0uY29tPgo+IMKgRGVzY3JpcHRpb246wqDCoMKg
QSB3cml0ZS1vbmx5IGZpbGUgdGhhdCBpcyB1c2VkIHRvIHN1Ym1pdCB0aGUgbmV3Cj4gdmFsdWUg
Zm9yIHRoZQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdmFyaWFibGUuIFRoZSBz
aXplIG9mIHRoZSBmaWxlIHJlcHJlc2VudHMgdGhlIG1heGltdW0KPiBzaXplIG9mCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB0aGUgdmFyaWFibGUgZGF0YSB0aGF0IGNhbiBiZSB3
cml0dGVuLgo+ICsKPiArV2hhdDrCoMKgwqDCoMKgwqDCoMKgwqDCoC9zeXMvZmlybXdhcmUvc2Vj
dmFyL2NvbmZpZwo+ICtEYXRlOsKgwqDCoMKgwqDCoMKgwqDCoMKgRGVjZW1iZXIgMjAyMgo+ICtD
b250YWN0OsKgwqDCoMKgwqDCoMKgTmF5bmEgSmFpbiA8bmF5bmFAbGludXguaWJtLmNvbT4KPiAr
RGVzY3JpcHRpb246wqDCoMKgVGhpcyBvcHRpb25hbCBkaXJlY3RvcnkgY29udGFpbnMgcmVhZC1v
bmx5IGNvbmZpZwo+IGF0dHJpYnV0ZXMgYXMKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgZGVmaW5lZCBieSB0aGUgc2VjdXJlIHZhcmlhYmxlIGltcGxlbWVudGF0aW9uLsKgIEFsbAo+
IGRhdGEgaXMgaW4KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgQVNDSUkgZm9ybWF0
LiBUaGUgZGlyZWN0b3J5IGlzIG9ubHkgY3JlYXRlZCBpZiB0aGUKPiBiYWNraW5nCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGltcGxlbWVudGF0aW9uIHByb3ZpZGVzIHZhcmlhYmxl
cyB0byBwb3B1bGF0ZSBpdCwKPiB3aGljaCBhdAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBwcmVzZW50IGlzIG9ubHkgUExQS1Mgb24gdGhlIHBzZXJpZXMgcGxhdGZvcm0uCj4gKwo+
ICtXaGF0OsKgwqDCoMKgwqDCoMKgwqDCoMKgL3N5cy9maXJtd2FyZS9zZWN2YXIvY29uZmlnL3Zl
cnNpb24KPiArRGF0ZTrCoMKgwqDCoMKgwqDCoMKgwqDCoERlY2VtYmVyIDIwMjIKPiArQ29udGFj
dDrCoMKgwqDCoMKgwqDCoE5heW5hIEphaW4gPG5heW5hQGxpbnV4LmlibS5jb20+Cj4gK0Rlc2Ny
aXB0aW9uOsKgwqDCoFJPIGZpbGUsIG9ubHkgcHJlc2VudCBpZiB0aGUgc2VjdmFyIGltcGxlbWVu
dGF0aW9uIGlzCj4gUExQS1MuCj4gKwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBD
b250YWlucyB0aGUgY29uZmlnIHZlcnNpb24gYXMgcmVwb3J0ZWQgYnkgdGhlCj4gaHlwZXJ2aXNv
ciBpbgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBBU0NJSSBkZWNpbWFsIGZvcm1h
dC4KPiArCj4gK1doYXQ6wqDCoMKgwqDCoMKgwqDCoMKgwqAvc3lzL2Zpcm13YXJlL3NlY3Zhci9j
b25maWcvbWF4X29iamVjdF9zaXplCj4gK0RhdGU6wqDCoMKgwqDCoMKgwqDCoMKgwqBEZWNlbWJl
ciAyMDIyCj4gK0NvbnRhY3Q6wqDCoMKgwqDCoMKgwqBOYXluYSBKYWluIDxuYXluYUBsaW51eC5p
Ym0uY29tPgo+ICtEZXNjcmlwdGlvbjrCoMKgwqBSTyBmaWxlLCBvbmx5IHByZXNlbnQgaWYgdGhl
IHNlY3ZhciBpbXBsZW1lbnRhdGlvbiBpcwo+IFBMUEtTLgo+ICsKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgQ29udGFpbnMgdGhlIG1heGltdW0gYWxsb3dlZCBzaXplIG9mIG9iamVj
dHMgaW4gdGhlCj4ga2V5c3RvcmUKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW4g
Ynl0ZXMsIHJlcHJlc2VudGVkIGluIEFTQ0lJIGRlY2ltYWwgZm9ybWF0Lgo+ICsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgVGhpcyBpcyBub3QgbmVjZXNzYXJpbHkgdGhlIHNhbWUg
YXMgdGhlIG1heCBzaXplIHRoYXQKPiBjYW4gYmUKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgd3JpdHRlbiB0byBhbiB1cGRhdGUgZmlsZSBhcyB3cml0ZXMgY2FuIGNvbnRhaW4gbW9y
ZQo+IHRoYW4KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgb2JqZWN0IGRhdGEsIHlv
dSBzaG91bGQgdXNlIHRoZSBzaXplIG9mIHRoZSB1cGRhdGUKPiBmaWxlIGZvcgo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB0aGF0IHB1cnBvc2UuCj4gKwo+ICtXaGF0OsKgwqDCoMKg
wqDCoMKgwqDCoMKgL3N5cy9maXJtd2FyZS9zZWN2YXIvY29uZmlnL3RvdGFsX3NpemUKPiArRGF0
ZTrCoMKgwqDCoMKgwqDCoMKgwqDCoERlY2VtYmVyIDIwMjIKPiArQ29udGFjdDrCoMKgwqDCoMKg
wqDCoE5heW5hIEphaW4gPG5heW5hQGxpbnV4LmlibS5jb20+Cj4gK0Rlc2NyaXB0aW9uOsKgwqDC
oFJPIGZpbGUsIG9ubHkgcHJlc2VudCBpZiB0aGUgc2VjdmFyIGltcGxlbWVudGF0aW9uIGlzCj4g
UExQS1MuCj4gKwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBDb250YWlucyB0aGUg
dG90YWwgc2l6ZSBvZiB0aGUgUExQS1MgaW4gYnl0ZXMsCj4gcmVwcmVzZW50ZWQgaW4KPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgQVNDSUkgZGVjaW1hbCBmb3JtYXQuCj4gKwo+ICtX
aGF0OsKgwqDCoMKgwqDCoMKgwqDCoMKgL3N5cy9maXJtd2FyZS9zZWN2YXIvY29uZmlnL3VzZWRf
c3BhY2UKPiArRGF0ZTrCoMKgwqDCoMKgwqDCoMKgwqDCoERlY2VtYmVyIDIwMjIKPiArQ29udGFj
dDrCoMKgwqDCoMKgwqDCoE5heW5hIEphaW4gPG5heW5hQGxpbnV4LmlibS5jb20+Cj4gK0Rlc2Ny
aXB0aW9uOsKgwqDCoFJPIGZpbGUsIG9ubHkgcHJlc2VudCBpZiB0aGUgc2VjdmFyIGltcGxlbWVu
dGF0aW9uIGlzCj4gUExQS1MuCj4gKwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBD
b250YWlucyB0aGUgY3VycmVudCBzcGFjZSBjb25zdW1lZCBvZiB0aGUgUExQS1MgaW4KPiBieXRl
cywKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVwcmVzZW50ZWQgaW4gQVNDSUkg
ZGVjaW1hbCBmb3JtYXQuCgpOb3RlIHRoYXQgcHJlc2VudGx5LCB0aGlzIGlzbid0IGFjdHVhbGx5
IHVwZGF0ZWQgd2hlbiB0aGUgdXNlciB3cml0ZXMKb2JqZWN0cy4gSSBzdXBwb3NlIHdlIGNvdWxk
IGZpeCB0aGlzLgoKPiArCj4gK1doYXQ6wqDCoMKgwqDCoMKgwqDCoMKgwqAvc3lzL2Zpcm13YXJl
L3NlY3Zhci9jb25maWcvc3VwcG9ydGVkX3BvbGljaWVzCj4gK0RhdGU6wqDCoMKgwqDCoMKgwqDC
oMKgwqBEZWNlbWJlciAyMDIyCj4gK0NvbnRhY3Q6wqDCoMKgwqDCoMKgwqBOYXluYSBKYWluIDxu
YXluYUBsaW51eC5pYm0uY29tPgo+ICtEZXNjcmlwdGlvbjrCoMKgwqBSTyBmaWxlLCBvbmx5IHBy
ZXNlbnQgaWYgdGhlIHNlY3ZhciBpbXBsZW1lbnRhdGlvbiBpcwo+IFBMUEtTLgo+ICsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgQ29udGFpbnMgYSBiaXRtYXNrIG9mIHN1cHBvcnRl
ZCBwb2xpY3kgZmxhZ3MgYnkgdGhlCj4gaHlwZXJ2aXNvciwKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcmVwcmVzZW50ZWQgYXMgYW4gOCBieXRlIGhleGFkZWNpbWFsIEFTQ0lJIHN0
cmluZy7CoAo+IENvbnN1bHQgdGhlCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGh5
cGVydmlzb3IgZG9jdW1lbnRhdGlvbiBmb3Igd2hhdCB0aGVzZSBmbGFncyBhcmUuCj4gKwo+ICtX
aGF0OsKgwqDCoMKgwqDCoMKgwqDCoMKgL3N5cy9maXJtd2FyZS9zZWN2YXIvY29uZmlnL3NpZ25l
ZF91cGRhdGVfYWxnb3JpdGhtcwo+ICtEYXRlOsKgwqDCoMKgwqDCoMKgwqDCoMKgRGVjZW1iZXIg
MjAyMgo+ICtDb250YWN0OsKgwqDCoMKgwqDCoMKgTmF5bmEgSmFpbiA8bmF5bmFAbGludXguaWJt
LmNvbT4KPiArRGVzY3JpcHRpb246wqDCoMKgUk8gZmlsZSwgb25seSBwcmVzZW50IGlmIHRoZSBz
ZWN2YXIgaW1wbGVtZW50YXRpb24gaXMKPiBQTFBLUy4KPiArCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoENvbnRhaW5zIGEgYml0bWFzayBvZiBmbGFncyBpbmRpY2F0aW5nIHdoaWNo
Cj4gYWxnb3JpdGhtcyB0aGUKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaHlwZXJ2
aXNvciBzdXBwb3J0cyBvYmplY3RzIHRvIGJlIHNpZ25lZCB3aXRoIHdoZW4KPiBtb2RpZnlpbmcK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2VjdmFycywgcmVwcmVzZW50ZWQgYXMg
YSAxNiBieXRlIGhleGFkZWNpbWFsIEFTQ0lJCj4gc3RyaW5nLgo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBDb25zdWx0IHRoZSBoeXBlcnZpc29yIGRvY3VtZW50YXRpb24gZm9yIHdo
YXQgdGhlc2UKPiBmbGFncyBtZWFuLgo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvcGxhdGZv
cm1zL3BzZXJpZXMvS2NvbmZpZwo+IGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL0tj
b25maWcKPiBpbmRleCBhM2I0ZDk5NTY3Y2IuLjk0ZTA4YzQwNWQ1MCAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzZXJpZXMvS2NvbmZpZwo+ICsrKyBiL2FyY2gvcG93ZXJw
Yy9wbGF0Zm9ybXMvcHNlcmllcy9LY29uZmlnCj4gQEAgLTE2Miw2ICsxNjIsMTkgQEAgY29uZmln
IFBTRVJJRVNfUExQS1MKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqDCoCBJZiB1bnN1cmUsIHNlbGVj
dCBOLgo+IMKgCj4gK2NvbmZpZyBQU0VSSUVTX1BMUEtTX1NFQ1ZBUgo+ICvCoMKgwqDCoMKgwqDC
oGRlcGVuZHMgb24gUFNFUklFU19QTFBLUwoKUFNFUklFU19QTFBLUyBoYXMgbm8gdXNlIG9uIGl0
cyBvd24gd2l0aG91dCB0aGUgc2VjdmFyIGZyb250ZW5kLiBXZQpzaG91bGQgZWl0aGVyIGp1c3Qg
aGF2ZSBvbmUgb3B0aW9uLCBvciBmb3IgZnV0dXJlLXByb29maW5nIHB1cnBvc2VzCnR1cm4gdGhp
cyBkZXBlbmRzIGludG8gYSBzZWxlY3QgYW5kIGdldCBQU0VSSUVTX1BMUEtTIG91dCBvZgptZW51
Y29uZmlnLgoKPiArwqDCoMKgwqDCoMKgwqBkZXBlbmRzIG9uIFBQQ19TRUNVUkVfQk9PVAoKRldJ
Vywgc3RhcnRpbmcgZnJvbSBhIHBzZXJpZXNfbGVfZGVmY29uZmlnLCB0dXJuaW5nIG9uIGFsbCB0
aGUgb3B0aW9ucwp0aGF0IGFyZSByZXF1aXJlZCB0byBnZXQgdG8gUFBDX1NFQ1VSRV9CT09UIHdh
cyBhbm5veWluZy4gSSdkIGxpa2UgdG8KaGF2ZSBQU0VSSUVTX1BMUEtTX1NFQ1ZBUiBlbmFibGVk
IGluIHRoZSBkZWZjb25maWcgYnV0IGl0IGludm9sdmVzCnN3aXRjaGluZyBvbiBxdWl0ZSBhIGxv
dC4KCj4gK8KgwqDCoMKgwqDCoMKgYm9vbCAiU3VwcG9ydCBmb3IgdGhlIFBMUEtTIHNlY3ZhciBp
bnRlcmZhY2UiCj4gK8KgwqDCoMKgwqDCoMKgaGVscAo+ICvCoMKgwqDCoMKgwqDCoMKgIFBvd2Vy
Vk0gY2FuIHN1cHBvcnQgZHluYW1pYyBzZWN1cmUgYm9vdCB3aXRoIHVzZXItZGVmaW5lZAo+IGtl
eXMKPiArwqDCoMKgwqDCoMKgwqDCoCB0aHJvdWdoIHRoZSBQTFBLUy4gS2V5c3RvcmUgb2JqZWN0
cyB1c2VkIGluIGR5bmFtaWMgc2VjdXJlCj4gYm9vdAoKV2Ugc2hvdWxkIGFsc28gZXhwYW5kIFBM
UEtTIHRvIFBvd2VyVk0gTFBBUiBQbGF0Zm9ybSBLZXlTdG9yZS4KCj4gK8KgwqDCoMKgwqDCoMKg
wqAgY2FuIGJlIGV4cG9zZWQgdG8gdGhlIGtlcm5lbCBhbmQgdXNlcnNwYWNlIHRocm91Z2ggdGhl
Cj4gcG93ZXJwYwo+ICvCoMKgwqDCoMKgwqDCoMKgIHNlY3ZhciBpbmZyYXN0cnVjdHVyZS4gU2Vs
ZWN0IHRoaXMgdG8gZW5hYmxlIHRoZSBQTFBLUwo+IGJhY2tlbmQKPiArwqDCoMKgwqDCoMKgwqDC
oCBmb3Igc2VjdmFycyBmb3IgdXNlIGluIHBzZXJpZXMgZHluYW1pYyBzZWN1cmUgYm9vdC4KPiAr
Cj4gK8KgwqDCoMKgwqDCoMKgwqAgSWYgdW5zdXJlLCBzZWxlY3QgTi4KPiArCj4gwqBjb25maWcg
UEFQUl9TQ00KPiDCoMKgwqDCoMKgwqDCoMKgZGVwZW5kcyBvbiBQUENfUFNFUklFUyAmJiBNRU1P
UllfSE9UUExVRyAmJiBMSUJOVkRJTU0KPiDCoMKgwqDCoMKgwqDCoMKgdHJpc3RhdGUgIlN1cHBv
cnQgZm9yIHRoZSBQQVBSIFN0b3JhZ2UgQ2xhc3MgTWVtb3J5Cj4gaW50ZXJmYWNlIgo+IGRpZmYg
LS1naXQgYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzZXJpZXMvTWFrZWZpbGUKPiBiL2FyY2gv
cG93ZXJwYy9wbGF0Zm9ybXMvcHNlcmllcy9NYWtlZmlsZQo+IGluZGV4IDkyMzEwMjAyYmRkNy4u
ODA3NzU2OTkxZjlkIDEwMDY0NAo+IC0tLSBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNlcmll
cy9NYWtlZmlsZQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNlcmllcy9NYWtlZmls
ZQo+IEBAIC0yNyw4ICsyNyw4IEBAIG9iai0kKENPTkZJR19QQVBSX1NDTSnCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCs9IHBhcHJfc2NtLm8KPiDCoG9iai0kKENPTkZJR19QUENfU1BM
UEFSKcKgwqDCoMKgwqDCoMKgKz0gdnBobi5vCj4gwqBvYmotJChDT05GSUdfUFBDX1NWTSnCoMKg
wqDCoMKgwqDCoMKgwqDCoCs9IHN2bS5vCj4gwqBvYmotJChDT05GSUdfRkFfRFVNUCnCoMKgwqDC
oMKgwqDCoMKgwqDCoCs9IHJ0YXMtZmFkdW1wLm8KPiAtb2JqLSQoQ09ORklHX1BTRVJJRVNfUExQ
S1MpICs9IHBscGtzLm8KPiAtCj4gK29iai0kKENPTkZJR19QU0VSSUVTX1BMUEtTKcKgwqDCoMKg
Kz0gcGxwa3Mubwo+ICtvYmotJChDT05GSUdfUFNFUklFU19QTFBLU19TRUNWQVIpwqDCoMKgwqDC
oCs9IHBscGtzLXNlY3Zhci5vCj4gwqBvYmotJChDT05GSUdfU1VTUEVORCnCoMKgwqDCoMKgwqDC
oMKgwqDCoCs9IHN1c3BlbmQubwo+IMKgb2JqLSQoQ09ORklHX1BQQ19WQVMpwqDCoMKgwqDCoMKg
wqDCoMKgwqArPSB2YXMubyB2YXMtc3lzZnMubwo+IMKgCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93
ZXJwYy9wbGF0Zm9ybXMvcHNlcmllcy9wbHBrcy1zZWN2YXIuYwo+IGIvYXJjaC9wb3dlcnBjL3Bs
YXRmb3Jtcy9wc2VyaWVzL3BscGtzLXNlY3Zhci5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwMDAwMDAuLjgyOThmMDM5YmVmNAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9h
cmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzZXJpZXMvcGxwa3Mtc2VjdmFyLmMKPiBAQCAtMCwwICsx
LDI0NSBAQAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Cj4gKy8q
Cj4gKyAqIFNlY3VyZSB2YXJpYWJsZSBpbXBsZW1lbnRhdGlvbiB1c2luZyB0aGUgUG93ZXJWTSBM
UEFSIFBsYXRmb3JtCj4gS2V5U3RvcmUgKFBMUEtTKQo+ICsgKgo+ICsgKiBDb3B5cmlnaHQgMjAy
MiwgSUJNIENvcnBvcmF0aW9uCgpBbmQgYnkgdGhlIHRpbWUgdGhpcyBnZXRzIG1lcmdlZCwgMjAy
MwoKPiArICogQXV0aG9yczogUnVzc2VsbCBDdXJyZXkKPiArICrCoMKgwqDCoMKgwqDCoMKgwqAg
QW5kcmV3IERvbm5lbGxhbgo+ICsgKsKgwqDCoMKgwqDCoMKgwqDCoCBOYXluYSBKYWluCj4gKyAq
Lwo+ICsKPiArI2RlZmluZSBwcl9mbXQoZm10KSAic2VjdmFyOiAiZm10Cj4gKwo+ICsjaW5jbHVk
ZSA8bGludXgvcHJpbnRrLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9pbml0Lmg+Cj4gKyNpbmNsdWRl
IDxsaW51eC90eXBlcy5oPgo+ICsjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+ICsjaW5jbHVkZSA8
bGludXgvc3RyaW5nLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9rb2JqZWN0Lmg+Cj4gKyNpbmNsdWRl
IDxhc20vc2VjdmFyLmg+Cj4gKyNpbmNsdWRlICJwbHBrcy5oIgo+ICsKPiArLy8gQ29uZmlnIGF0
dHJpYnV0ZXMgZm9yIHN5c2ZzCj4gKyNkZWZpbmUgUExQS1NfQ09ORklHX0FUVFIobmFtZSwgZm10
LCBmdW5jKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFwKPiArwqDC
oMKgwqDCoMKgwqBzdGF0aWMgc3NpemVfdCBuYW1lIyNfc2hvdyhzdHJ1Y3Qga29iamVjdCAqa29i
aizCoMKgwqDCoMKgwqDCoMKgXAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGtvYmpfYXR0cmlidXRlICph
dHRyLMKgXAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY2hhciAqYnVmKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgXAo+ICvCoMKgwqDCoMKgwqDCoHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcmV0dXJuIHN5c2ZzX2VtaXQoYnVmLCBmbXQsIGZ1bmMoKSk7wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgXAo+ICvCoMKgwqDCoMKgwqDCoH3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFwKPiArwqDCoMKgwqDCoMKgwqBzdGF0aWMgc3RydWN0
IGtvYmpfYXR0cmlidXRlIGF0dHJfIyNuYW1lID0gX19BVFRSX1JPKG5hbWUpCj4gKwo+ICtQTFBL
U19DT05GSUdfQVRUUih2ZXJzaW9uLCAiJXVcbiIsIHBscGtzX2dldF92ZXJzaW9uKTsKPiArUExQ
S1NfQ09ORklHX0FUVFIobWF4X29iamVjdF9zaXplLCAiJXVcbiIsIHBscGtzX2dldF9tYXhvYmpl
Y3RzaXplKTsKPiArUExQS1NfQ09ORklHX0FUVFIodG90YWxfc2l6ZSwgIiV1XG4iLCBwbHBrc19n
ZXRfdG90YWxzaXplKTsKPiArUExQS1NfQ09ORklHX0FUVFIodXNlZF9zcGFjZSwgIiV1XG4iLCBw
bHBrc19nZXRfdXNlZHNwYWNlKTsKPiArUExQS1NfQ09ORklHX0FUVFIoc3VwcG9ydGVkX3BvbGlj
aWVzLCAiJTA4eFxuIiwKPiBwbHBrc19nZXRfc3VwcG9ydGVkcG9saWNpZXMpOwo+ICtQTFBLU19D
T05GSUdfQVRUUihzaWduZWRfdXBkYXRlX2FsZ29yaXRobXMsICIlMDE2bGx4XG4iLAo+IHBscGtz
X2dldF9zaWduZWR1cGRhdGVhbGdvcml0aG1zKTsKPiArCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
YXR0cmlidXRlICpjb25maWdfYXR0cnNbXSA9IHsKPiArwqDCoMKgwqDCoMKgwqAmYXR0cl92ZXJz
aW9uLmF0dHIsCj4gK8KgwqDCoMKgwqDCoMKgJmF0dHJfbWF4X29iamVjdF9zaXplLmF0dHIsCj4g
K8KgwqDCoMKgwqDCoMKgJmF0dHJfdG90YWxfc2l6ZS5hdHRyLAo+ICvCoMKgwqDCoMKgwqDCoCZh
dHRyX3VzZWRfc3BhY2UuYXR0ciwKPiArwqDCoMKgwqDCoMKgwqAmYXR0cl9zdXBwb3J0ZWRfcG9s
aWNpZXMuYXR0ciwKPiArwqDCoMKgwqDCoMKgwqAmYXR0cl9zaWduZWRfdXBkYXRlX2FsZ29yaXRo
bXMuYXR0ciwKPiArwqDCoMKgwqDCoMKgwqBOVUxMLAo+ICt9Owo+ICsKPiArc3RhdGljIHUxNiBn
ZXRfdWNzMm5hbWUoY29uc3QgY2hhciAqbmFtZSwgdWludDhfdCAqKnVjczJfbmFtZSkKPiArewo+
ICvCoMKgwqDCoMKgwqDCoGludCBuYW1lbGVuID0gc3RybGVuKG5hbWUpICogMjsKPiArwqDCoMKg
wqDCoMKgwqAqdWNzMl9uYW1lID0ga3phbGxvYyhuYW1lbGVuLCBHRlBfS0VSTkVMKTsKPiArCj4g
K8KgwqDCoMKgwqDCoMKgaWYgKCEqdWNzMl9uYW1lKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqByZXR1cm4gMDsKPiArCj4gK8KgwqDCoMKgwqDCoMKgZm9yIChpbnQgaSA9IDA7IG5h
bWVbaV07IGkrKykgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoKnVjczJfbmFt
ZSlbaSAqIDJdID0gbmFtZVtpXTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKCp1
Y3MyX25hbWUpW2kgKiAyICsgMV0gPSAnXDAnOwo+ICvCoMKgwqDCoMKgwqDCoH0KPiArCj4gK8Kg
wqDCoMKgwqDCoMKgcmV0dXJuIG5hbWVsZW47Cj4gK30KPiArCj4gK3N0YXRpYyB1MzIgZ2V0X3Bv
bGljeShjb25zdCBjaGFyICpuYW1lKQo+ICt7Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKChzdHJjbXAo
bmFtZSwgImRiIikgPT0gMCkgfHwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHN0cmNtcChuYW1l
LCAiZGJ4IikgPT0gMCkgfHwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHN0cmNtcChuYW1lLCAi
Z3J1YmRiIikgPT0gMCkgfHwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHN0cmNtcChuYW1lLCAi
c2JhdCIpID09IDApKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gKFdP
UkxEUkVBREFCTEUgfCBTSUdORURVUERBVEUpOwo+ICvCoMKgwqDCoMKgwqDCoGVsc2UKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIFNJR05FRFVQREFURTsKPiArfQo+ICsK
PiArI2RlZmluZSBQTFBLU19TRUNWQVJfQ09VTlQgOAo+ICtzdGF0aWMgY2hhciAqdmFyX25hbWVz
W1BMUEtTX1NFQ1ZBUl9DT1VOVF0gPSB7Cj4gK8KgwqDCoMKgwqDCoMKgIlBLIiwKPiArwqDCoMKg
wqDCoMKgwqAiS0VLIiwKPiArwqDCoMKgwqDCoMKgwqAiZGIiLAo+ICvCoMKgwqDCoMKgwqDCoCJk
YngiLAo+ICvCoMKgwqDCoMKgwqDCoCJncnViZGIiLAo+ICvCoMKgwqDCoMKgwqDCoCJzYmF0IiwK
PiArwqDCoMKgwqDCoMKgwqAibW9kdWxlZGIiLAo+ICvCoMKgwqDCoMKgwqDCoCJ0cnVzdGVkY2Fk
YiIsCj4gK307Cj4gKwo+ICtzdGF0aWMgaW50IHBscGtzX2dldF92YXJpYWJsZShjb25zdCBjaGFy
ICprZXksIHVpbnQ2NF90IGtleV9sZW4sCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHU4ICpkYXRhLCB1aW50NjRfdCAqZGF0YV9zaXpl
KQo+ICt7Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHBscGtzX3ZhciB2YXIgPSB7MH07Cj4gK8Kg
wqDCoMKgwqDCoMKgdTE2IHVjczJfbmFtZWxlbjsKPiArwqDCoMKgwqDCoMKgwqB1OCAqdWNzMl9u
YW1lOwo+ICvCoMKgwqDCoMKgwqDCoGludCByYyA9IDA7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHVj
czJfbmFtZWxlbiA9IGdldF91Y3MybmFtZShrZXksICZ1Y3MyX25hbWUpOwo+ICvCoMKgwqDCoMKg
wqDCoGlmICghdWNzMl9uYW1lbGVuKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBy
ZXR1cm4gLUVOT01FTTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgdmFyLm5hbWUgPSB1Y3MyX25hbWU7
Cj4gK8KgwqDCoMKgwqDCoMKgdmFyLm5hbWVsZW4gPSB1Y3MyX25hbWVsZW47Cj4gK8KgwqDCoMKg
wqDCoMKgdmFyLm9zID0gUExQS1NfVkFSX0xJTlVYOwo+ICvCoMKgwqDCoMKgwqDCoHJjID0gcGxw
a3NfcmVhZF9vc192YXIoJnZhcik7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGlmIChyYykKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBlcnI7Cj4gKwo+ICvCoMKgwqDCoMKgwqDC
oCpkYXRhX3NpemUgPSB2YXIuZGF0YWxlbiArIHNpemVvZih2YXIucG9saWN5KTsKPiArCj4gK8Kg
wqDCoMKgwqDCoMKgLy8gV2UgY2FuIGJlIGNhbGxlZCB3aXRoIGRhdGEgPSBOVUxMIHRvIGp1c3Qg
Z2V0IHRoZSBvYmplY3QKPiBzaXplLgo+ICvCoMKgwqDCoMKgwqDCoGlmIChkYXRhKSB7Cj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG1lbWNweShkYXRhLCAmdmFyLnBvbGljeSwgc2l6
ZW9mKHZhci5wb2xpY3kpKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbWVtY3B5
KGRhdGEgKyBzaXplb2YodmFyLnBvbGljeSksIHZhci5kYXRhLAo+IHZhci5kYXRhbGVuKTsKPiAr
wqDCoMKgwqDCoMKgwqB9Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGtmcmVlKHZhci5kYXRhKTsKPiAr
ZXJyOgo+ICvCoMKgwqDCoMKgwqDCoGtmcmVlKHVjczJfbmFtZSk7Cj4gK8KgwqDCoMKgwqDCoMKg
cmV0dXJuIHJjOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IHBscGtzX3NldF92YXJpYWJsZShjb25z
dCBjaGFyICprZXksIHVpbnQ2NF90IGtleV9sZW4sCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHU4ICpkYXRhLCB1aW50NjRfdCBkYXRh
X3NpemUpCj4gK3sKPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgcGxwa3NfdmFyIHZhciA9IHswfTsK
PiArwqDCoMKgwqDCoMKgwqB1MTYgdWNzMl9uYW1lbGVuOwo+ICvCoMKgwqDCoMKgwqDCoHU4ICp1
Y3MyX25hbWU7Cj4gK8KgwqDCoMKgwqDCoMKgaW50IHJjID0gMDsKPiArwqDCoMKgwqDCoMKgwqB1
NjQgZmxhZ3M7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoC8vIFNlY3VyZSB2YXJpYWJsZXMgbmVlZCB0
byBiZSBwcmVmaXhlZCB3aXRoIDggYnl0ZXMgb2YKPiBmbGFncy4KPiArwqDCoMKgwqDCoMKgwqAv
LyBXZSBvbmx5IHdhbnQgdG8gcGVyZm9ybSB0aGUgd3JpdGUgaWYgd2UgaGF2ZSBhdCBsZWFzdCBv
bmUKPiBieXRlIG9mIGRhdGEuCj4gK8KgwqDCoMKgwqDCoMKgaWYgKGRhdGFfc2l6ZSA8PSBzaXpl
b2YoZmxhZ3MpKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVJTlZB
TDsKPiArCj4gK8KgwqDCoMKgwqDCoMKgdWNzMl9uYW1lbGVuID0gZ2V0X3VjczJuYW1lKGtleSwg
JnVjczJfbmFtZSk7Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKCF1Y3MyX25hbWVsZW4pCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRU5PTUVNOwo+ICsKPiArwqDCoMKgwqDC
oMKgwqBtZW1jcHkoJmZsYWdzLCBkYXRhLCBzaXplb2YoZmxhZ3MpKTsKPiArCj4gK8KgwqDCoMKg
wqDCoMKgdmFyLmRhdGFsZW4gPSBkYXRhX3NpemUgLSBzaXplb2YoZmxhZ3MpOwo+ICvCoMKgwqDC
oMKgwqDCoHZhci5kYXRhID0ga3phbGxvYyh2YXIuZGF0YWxlbiwgR0ZQX0tFUk5FTCk7Cj4gK8Kg
wqDCoMKgwqDCoMKgaWYgKCF2YXIuZGF0YSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqByYyA9IC1FTk9NRU07Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8g
ZXJyOwo+ICvCoMKgwqDCoMKgwqDCoH0KPiArCj4gK8KgwqDCoMKgwqDCoMKgbWVtY3B5KHZhci5k
YXRhLCBkYXRhICsgc2l6ZW9mKGZsYWdzKSwgdmFyLmRhdGFsZW4pOwo+ICsKPiArwqDCoMKgwqDC
oMKgwqB2YXIubmFtZSA9IHVjczJfbmFtZTsKPiArwqDCoMKgwqDCoMKgwqB2YXIubmFtZWxlbiA9
IHVjczJfbmFtZWxlbjsKPiArwqDCoMKgwqDCoMKgwqB2YXIub3MgPSBQTFBLU19WQVJfTElOVVg7
Cj4gK8KgwqDCoMKgwqDCoMKgdmFyLnBvbGljeSA9IGdldF9wb2xpY3koa2V5KTsKPiArCj4gK8Kg
wqDCoMKgwqDCoMKgcmMgPSBwbHBrc19zaWduZWRfdXBkYXRlX3Zhcih2YXIsIGZsYWdzKTsKPiAr
Cj4gK8KgwqDCoMKgwqDCoMKga2ZyZWUodmFyLmRhdGEpOwo+ICtlcnI6Cj4gK8KgwqDCoMKgwqDC
oMKga2ZyZWUodWNzMl9uYW1lKTsKPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gcmM7Cj4gK30KPiAr
Cj4gKy8qCj4gKyAqIGdldF9uZXh0KCkgaW4gdGhlIHNlY3ZhciBBUEkgaXMgZGVzaWduZWQgZm9y
IHRoZSBPUEFMIEFQSS4KPiArICogSWYgKmtleSBpcyAwLCBpdCByZXR1cm5zIHRoZSBmaXJzdCB2
YXJpYWJsZSBpbiB0aGUga2V5c3RvcmUuCj4gKyAqIE90aGVyd2lzZSwgeW91IHBhc3MgdGhlIG5h
bWUgb2YgYSBrZXkgYW5kIGl0IHJldHVybnMgbmV4dCBpbgo+IGxpbmUuCj4gKyAqCj4gKyAqIFdl
J3JlIGdvaW5nIHRvIGNoZWF0IGhlcmUgLSBzaW5jZSB3ZSBoYXZlIGZpeGVkIGtleXMgYW5kIGRv
bid0Cj4gY2FyZSBhYm91dAo+ICsgKiBrZXlfbGVuLCB3ZSBjYW4ganVzdCB1c2UgaXQgYXMgYW4g
aW5kZXguCgpUaGlzIGlzIGtpbmRhIGdyb3NzLgoKPiArICovCgpJbmNvbnNpc3RlbnQgY29tbWVu
dCBzdHlsZQoKPiArc3RhdGljIGludCBwbHBrc19nZXRfbmV4dF92YXJpYWJsZShjb25zdCBjaGFy
ICprZXksIHVpbnQ2NF90Cj4gKmtleV9sZW4sIHVpbnQ2NF90IGtleWJ1ZnNpemUpCj4gK3sKPiAr
wqDCoMKgwqDCoMKgwqBpZiAoIWtleSB8fCAha2V5X2xlbikKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGlmICgqa2V5
X2xlbiA+PSBQTFBLU19TRUNWQVJfQ09VTlQpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHJldHVybiAtRU5PRU5UOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBpZiAoc3Ryc2NweSgoY2hh
ciAqKWtleSwgdmFyX25hbWVzWygqa2V5X2xlbikrK10sIGtleWJ1ZnNpemUpCj4gPCAwKQoKTm90
IHN1cmUgaG93IEkgZmVlbCBhYm91dCB0aGUgaW5jcmVtZW50IGJlaW5nIGJ1cmllZCBpbiBoZXJl
Cgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUUyQklHOwo+ICsKPiAr
wqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiArfQo+ICsKPiArLy8gUExQS1MgZHluYW1pYyBzZWN1
cmUgYm9vdCBkb2Vzbid0IGdpdmUgdXMgYSBmb3JtYXQgc3RyaW5nIGluIHRoZQo+IHNhbWUgd2F5
IE9QQUwgZG9lcy4KPiArLy8gSW5zdGVhZCwgcmVwb3J0IHRoZSBmb3JtYXQgdXNpbmcgdGhlIFNC
X1ZFUlNJT04gdmFyaWFibGUgaW4gdGhlCj4ga2V5c3RvcmUuCj4gK3N0YXRpYyBzc2l6ZV90IHBs
cGtzX3NlY3Zhcl9mb3JtYXQoY2hhciAqYnVmKQo+ICt7Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0
IHBscGtzX3ZhciB2YXIgPSB7MH07Cj4gK8KgwqDCoMKgwqDCoMKgc3NpemVfdCByZXQ7Cj4gKwo+
ICvCoMKgwqDCoMKgwqDCoHZhci5jb21wb25lbnQgPSBOVUxMOwo+ICvCoMKgwqDCoMKgwqDCoC8v
IE9ubHkgdGhlIHNpZ25lZCB2YXJpYWJsZXMgaGF2ZSB1Y3MyLWVuY29kZWQgbmFtZXMsIHRoaXMK
PiBvbmUgZG9lc24ndAo+ICvCoMKgwqDCoMKgwqDCoHZhci5uYW1lID0gIlNCX1ZFUlNJT04iOwo+
ICvCoMKgwqDCoMKgwqDCoHZhci5uYW1lbGVuID0gMTA7Cj4gK8KgwqDCoMKgwqDCoMKgdmFyLmRh
dGFsZW4gPSAwOwo+ICvCoMKgwqDCoMKgwqDCoHZhci5kYXRhID0gTlVMTDsKPiArCj4gK8KgwqDC
oMKgwqDCoMKgLy8gVW5saWtlIHRoZSBvdGhlciB2YXJzLCBTQl9WRVJTSU9OIGlzIG93bmVkIGJ5
IGZpcm13YXJlCj4gaW5zdGVhZCBvZiB0aGUgT1MKPiArwqDCoMKgwqDCoMKgwqByZXQgPSBwbHBr
c19yZWFkX2Z3X3ZhcigmdmFyKTsKPiArwqDCoMKgwqDCoMKgwqBpZiAocmV0KSB7Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQgPT0gLUVOT0VOVCkKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBzeXNmc19lbWl0KGJ1
ZiwgImlibSxwbHBrcy1zYi0KPiB1bmtub3duXG4iKTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHByX2VycigiRXJyb3IgJWxkIHJlYWRpbmcgU0JfVkVSU0lPTiBmcm9tCj4g
ZmlybXdhcmVcbiIsIHJldCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVy
biByZXQ7Cj4gK8KgwqDCoMKgwqDCoMKgfQo+ICsKPiArwqDCoMKgwqDCoMKgwqAvLyBIeXBlcnZp
c29yIGRlZmluZXMgU0JfVkVSU0lPTiBhcyBhICIxIGJ5dGUgdW5zaWduZWQKPiBpbnRlZ2VyIHZh
bHVlIgo+ICvCoMKgwqDCoMKgwqDCoHJldCA9IHN5c2ZzX2VtaXQoYnVmLCAiaWJtLHBscGtzLXNi
LSVoaHVcbiIsIHZhci5kYXRhWzBdKTsKPiArCj4gK8KgwqDCoMKgwqDCoMKga2ZyZWUodmFyLmRh
dGEpOwo+ICvCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQg
cGxwa3NfbWF4X3NpemUodWludDY0X3QgKm1heF9zaXplKQo+ICt7Cj4gK8KgwqDCoMKgwqDCoMKg
Ly8gVGhlIG1heCBvYmplY3Qgc2l6ZSByZXBvcnRlZCBieSB0aGUgaHlwZXJ2aXNvciBpcyBhY2N1
cmF0ZQo+IGZvciB0aGUKPiArwqDCoMKgwqDCoMKgwqAvLyBvYmplY3QgaXRzZWxmLCBidXQgd2Ug
dXNlIHRoZSBmaXJzdCA4IGJ5dGVzIG9mIGRhdGEgb24KPiB3cml0ZSBhcyB0aGUKPiArwqDCoMKg
wqDCoMKgwqAvLyBzaWduZWQgdXBkYXRlIGZsYWdzLCBzbyB0aGUgbWF4IHNpemUgYSB1c2VyIGNh
biB3cml0ZSBpcwo+IGxhcmdlci4KPiArwqDCoMKgwqDCoMKgwqAqbWF4X3NpemUgPSAodWludDY0
X3QpcGxwa3NfZ2V0X21heG9iamVjdHNpemUoKSArIDg7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHJl
dHVybiAwOwo+ICt9Cj4gKwo+ICsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBzZWN2YXJfb3BlcmF0
aW9ucyBwbHBrc19zZWN2YXJfb3BzID0gewo+ICvCoMKgwqDCoMKgwqDCoC5nZXQgPSBwbHBrc19n
ZXRfdmFyaWFibGUsCj4gK8KgwqDCoMKgwqDCoMKgLmdldF9uZXh0ID0gcGxwa3NfZ2V0X25leHRf
dmFyaWFibGUsCj4gK8KgwqDCoMKgwqDCoMKgLnNldCA9IHBscGtzX3NldF92YXJpYWJsZSwKPiAr
wqDCoMKgwqDCoMKgwqAuZm9ybWF0ID0gcGxwa3Nfc2VjdmFyX2Zvcm1hdCwKPiArwqDCoMKgwqDC
oMKgwqAubWF4X3NpemUgPSBwbHBrc19tYXhfc2l6ZSwKPiArfTsKPiArCj4gK3N0YXRpYyBpbnQg
cGxwa3Nfc2VjdmFyX2luaXQodm9pZCkKPiArewo+ICvCoMKgwqDCoMKgwqDCoGlmICghcGxwa3Nf
aXNfYXZhaWxhYmxlKCkpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAt
RU5PREVWOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBzZXRfc2VjdmFyX29wcygmcGxwa3Nfc2VjdmFy
X29wcyk7Cj4gK8KgwqDCoMKgwqDCoMKgc2V0X3NlY3Zhcl9jb25maWdfYXR0cnMoY29uZmlnX2F0
dHJzKTsKPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiArfQo+ICtkZXZpY2VfaW5pdGNhbGwo
cGxwa3Nfc2VjdmFyX2luaXQpOwoKLS0gCkFuZHJldyBEb25uZWxsYW4gICAgT3pMYWJzLCBBREwg
Q2FuYmVycmEKYWpkQGxpbnV4LmlibS5jb20gICBJQk0gQXVzdHJhbGlhIExpbWl0ZWQK

