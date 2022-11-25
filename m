Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9E96382B7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Nov 2022 04:32:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NJL610fKcz2xG6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Nov 2022 14:32:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f6t8Uwhd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f6t8Uwhd;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NJL505clbz3byZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Nov 2022 14:31:48 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AP18QI9009908;
	Fri, 25 Nov 2022 03:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=9qQBtyMZBeOlAn8ArOB4JQH7GYOpXj7iG4OrNq02rU0=;
 b=f6t8UwhduI7jCm5gKO+NODHPOEBkZVX8GkmFpZbfFqJCXe1lB6VITMgyFmy4ZpW4lWaK
 McgYybJSZ+T8/V5w1H2gUzjXRf1Z3747j0XNlMYLPRCC6rpSSeojbViyRQSGMy6fL8FM
 KC44DtPpaqFebTqoTBrBeEv0t4KwbPbbg6ADbsDwA2mpYbE7JaRo9SRpKg1+tL1BPeBW
 aeoutdIN0v7UHov1nPic1B0i8vCI7pSRVhV3AZ7VXlfA5p4L57Xqq/DrNxM3UXYdGGnI
 5iK1E+UzPe9RKTKFopLKrUOX1jJc17pJ0ViHNdRqGkJX5NLyZJrZwqnENyPKnpApf52x Eg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m2k2nu23r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Nov 2022 03:31:41 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AP3VeiW020420;
	Fri, 25 Nov 2022 03:31:40 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m2k2nu237-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Nov 2022 03:31:40 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AP3KiIv028543;
	Fri, 25 Nov 2022 03:31:38 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma01fra.de.ibm.com with ESMTP id 3kxps96fvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Nov 2022 03:31:38 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AP3VarA38470086
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Nov 2022 03:31:36 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02F1911C050;
	Fri, 25 Nov 2022 03:31:36 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A115111C04C;
	Fri, 25 Nov 2022 03:31:35 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 25 Nov 2022 03:31:35 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A19B56038E;
	Fri, 25 Nov 2022 14:31:33 +1100 (AEDT)
Message-ID: <4a247c2e9e9da0726a9890648c0e25cd2f9a3c89.camel@linux.ibm.com>
Subject: Re: [PATCH 5/6] powerpc/pseries: replace kmalloc with kzalloc in
 PLPKS driver
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 25 Nov 2022 14:31:33 +1100
In-Reply-To: <20221106205839.600442-6-nayna@linux.ibm.com>
References: <20221106205839.600442-1-nayna@linux.ibm.com>
	 <20221106205839.600442-6-nayna@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vwQJni75aCIuR8eyfyqoePKEBE3csiEv
X-Proofpoint-ORIG-GUID: 1Yhz_aBLLLtdPPsnP0mLEZ1kjApoLOj5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_14,2022-11-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 suspectscore=0 adultscore=0
 phishscore=0 mlxscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211250025
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
Cc: gjoyce@linux.vnet.ibm.com, npiggin@gmail.com, George Wilson <gcwilson@linux.ibm.com>, bjking1@us.ibmcom
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gU3VuLCAyMDIyLTExLTA2IGF0IDE1OjU4IC0wNTAwLCBOYXluYSBKYWluIHdyb3RlOgo+IFJl
cGxhY2Uga21hbGxvYyB3aXRoIGt6YWxsb2MgaW4gY29uc3RydWN0X2F1dGgoKSBmdW5jdGlvbiB0
byBkZWZhdWx0Cj4gaW5pdGlhbGl6ZSBzdHJ1Y3R1cmUgd2l0aCB6ZXJvZXMuCj4gCj4gU2lnbmVk
LW9mZi1ieTogTmF5bmEgSmFpbiA8bmF5bmFAbGludXguaWJtLmNvbT4KClRoaXMgc2VlbXMgc2Vu
c2libGUuCgo+IC0tLQo+IMKgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL3BscGtzLmMg
fCA4ICsrLS0tLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzZXJpZXMv
cGxwa3MuYwo+IGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL3BscGtzLmMKPiBpbmRl
eCA3MmQ5ZGViZjE4YzAuLmU4YzAyNzM1YjcwMiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Bvd2VycGMv
cGxhdGZvcm1zL3BzZXJpZXMvcGxwa3MuYwo+ICsrKyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMv
cHNlcmllcy9wbHBrcy5jCj4gQEAgLTE2MiwxOSArMTYyLDE1IEBAIHN0YXRpYyBzdHJ1Y3QgcGxw
a3NfYXV0aCAqY29uc3RydWN0X2F1dGgodTgKPiBjb25zdW1lcikKPiDCoMKgwqDCoMKgwqDCoMKg
aWYgKGNvbnN1bWVyID4gUEtTX09TX09XTkVSKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqBhdXRo
ID0ga21hbGxvYyhzdHJ1Y3Rfc2l6ZShhdXRoLCBwYXNzd29yZCwgbWF4cHdzaXplKSwKPiBHRlBf
S0VSTkVMKTsKPiArwqDCoMKgwqDCoMKgwqBhdXRoID0ga3phbGxvYyhzdHJ1Y3Rfc2l6ZShhdXRo
LCBwYXNzd29yZCwgbWF4cHdzaXplKSwKPiBHRlBfS0VSTkVMKTsKPiDCoMKgwqDCoMKgwqDCoMKg
aWYgKCFhdXRoKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIEVSUl9Q
VFIoLUVOT01FTSk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgYXV0aC0+dmVyc2lvbiA9IDE7Cj4g
wqDCoMKgwqDCoMKgwqDCoGF1dGgtPmNvbnN1bWVyID0gY29uc3VtZXI7Cj4gLcKgwqDCoMKgwqDC
oMKgYXV0aC0+cnN2ZDAgPSAwOwo+IC3CoMKgwqDCoMKgwqDCoGF1dGgtPnJzdmQxID0gMDsKPiDC
oAo+IC3CoMKgwqDCoMKgwqDCoGlmIChjb25zdW1lciA9PSBQS1NfRldfT1dORVIgfHwgY29uc3Vt
ZXIgPT0KPiBQS1NfQk9PVExPQURFUl9PV05FUikgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBhdXRoLT5wYXNzd29yZGxlbmd0aCA9IDA7Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKGNv
bnN1bWVyID09IFBLU19GV19PV05FUiB8fCBjb25zdW1lciA9PQo+IFBLU19CT09UTE9BREVSX09X
TkVSKQoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBhdXRoOwo+IC3C
oMKgwqDCoMKgwqDCoH0KClRoaXMgYml0IHNlZW1zIHNwdXJpb3VzLgoKPiDCoAo+IMKgwqDCoMKg
wqDCoMKgwqBtZW1jcHkoYXV0aC0+cGFzc3dvcmQsIG9zcGFzc3dvcmQsIG9zcGFzc3dvcmRsZW5n
dGgpOwo+IMKgCgotLSAKQW5kcmV3IERvbm5lbGxhbiAgICBPekxhYnMsIEFETCBDYW5iZXJyYQph
amRAbGludXguaWJtLmNvbSAgIElCTSBBdXN0cmFsaWEgTGltaXRlZAo=

