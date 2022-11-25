Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D567063836C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Nov 2022 06:18:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NJNS74Tvrz3f3f
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Nov 2022 16:18:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Mn5gGX6O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Mn5gGX6O;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NJNR613DNz2xFx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Nov 2022 16:17:37 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AP5EWuN014391;
	Fri, 25 Nov 2022 05:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=w35etatMVipc4HvQVv7+1Z3pkry+yBcSSqggSsuo7Nc=;
 b=Mn5gGX6OygEB/+XICJFJwv7ycr2qRbiWc4Si1w88vnT7QV4WgS/SOBf1JlhUav5MHFCV
 KyyK3gBPFhw9ppsGXs+3OMiWkYmkx9aKC1S/PUtxeOqueYdiHVDkmpl1syi6ZGUwySVg
 /a8M7+sv98PrZaVzHgO79nQauZHyPDk20j7yb4NHTJ6yVK4mWgGgIXKipWqTtTTmDVpa
 ap39YCsB10b3X9rr9IDjTarSwpEiPu4O+U83AFvf/fmruDcBxoNxakmEf710aKsr/yy2
 Y4wPPylPLeY5OxRBqNx8DPhSDRRMSuRBWyml4OJZi9OHoZpTK4cejPfrTASq4h0OdhpJ uw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m2qcr02n1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Nov 2022 05:17:27 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AP5GkT6023572;
	Fri, 25 Nov 2022 05:17:26 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m2qcr02m8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Nov 2022 05:17:26 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AP559OO003353;
	Fri, 25 Nov 2022 05:17:24 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma04fra.de.ibm.com with ESMTP id 3kxps8xhv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Nov 2022 05:17:24 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AP5HMqt30671518
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Nov 2022 05:17:22 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 290F9A405F;
	Fri, 25 Nov 2022 05:17:22 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7DE2DA4054;
	Fri, 25 Nov 2022 05:17:21 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 25 Nov 2022 05:17:21 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 90DCA6036F;
	Fri, 25 Nov 2022 16:17:12 +1100 (AEDT)
Message-ID: <948efb3ce68424ea0cde6ae5a5698647c03bebbc.camel@linux.ibm.com>
Subject: Re: [PATCH 2/6] powerpc/pseries: Fix the H_CALL error code in PLPKS
 driver
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 25 Nov 2022 16:17:12 +1100
In-Reply-To: <20221106205839.600442-3-nayna@linux.ibm.com>
References: <20221106205839.600442-1-nayna@linux.ibm.com>
	 <20221106205839.600442-3-nayna@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kWWvVyU5VLa2BwzpVR-K2fMz8C7GDJ9I
X-Proofpoint-ORIG-GUID: DQFIaDV-bITPo3eI9E1GPg-oDgunviC-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-25_02,2022-11-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211250039
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
Cc: gjoyce@linux.vnet.ibm.com, npiggin@gmail.com, brking@linux.ibm.com, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gU3VuLCAyMDIyLTExLTA2IGF0IDE1OjU4IC0wNTAwLCBOYXluYSBKYWluIHdyb3RlOgo+IFBB
UFIgU3BlYyBkZWZpbmVzIEhfUDEgYWN0dWFsbHkgYXMgSF9QQVJBTUVURVIgYW5kIG1hcHMgSF9B
Qk9SVEVEIHRvCj4gYSBkaWZmZXJlbnQgbnVtZXJpY2FsIHZhbHVlLgo+IAo+IEZpeCB0aGUgZXJy
b3IgY29kZXMgYXMgcGVyIFBBUFIgU3BlY2lmaWNhdGlvbi4KPiAKPiBGaXhlczogMjQ1NGE3YWYw
ZjJhICgicG93ZXJwYy9wc2VyaWVzOiBkZWZpbmUgZHJpdmVyIGZvciBQbGF0Zm9ybQo+IEtleVN0
b3JlIikKPiBTaWduZWQtb2ZmLWJ5OiBOYXluYSBKYWluIDxuYXluYUBsaW51eC5pYm0uY29tPgoK
VGhpcyBkb2VzIGluZGVlZCBtYXRjaCBteSB1bmRlcnN0YW5kaW5nIG9mIHRoZSBQQVBSIHNwZWMu
CgpSZXZpZXdlZC1ieTogQW5kcmV3IERvbm5lbGxhbiA8YWpkQGxpbnV4LmlibS5jb20+Cgo+IC0t
LQo+IMKgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2h2Y2FsbC5owqDCoMKgwqDCoCB8IDMgKy0t
Cj4gwqBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzZXJpZXMvcGxwa3MuYyB8IDIgKy0KPiDCoDIg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vaHZjYWxsLmgKPiBiL2FyY2gvcG93ZXJw
Yy9pbmNsdWRlL2FzbS9odmNhbGwuaAo+IGluZGV4IDhhYmFlNDYzZjZjMS4uOTVmZDdmOTQ4NWQ1
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9odmNhbGwuaAo+ICsrKyBi
L2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9odmNhbGwuaAo+IEBAIC03OSw3ICs3OSw3IEBACj4g
wqAjZGVmaW5lIEhfTk9UX0VOT1VHSF9SRVNPVVJDRVMgLTQ0Cj4gwqAjZGVmaW5lIEhfUl9TVEFU
RcKgwqDCoMKgwqDCoCAtNDUKPiDCoCNkZWZpbmUgSF9SRVNDSU5ERUTCoMKgwqDCoCAtNDYKPiAt
I2RlZmluZSBIX1AxwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC01NAo+ICsjZGVmaW5lIEhfQUJPUlRF
RMKgwqDCoMKgwqDCoC01NAo+IMKgI2RlZmluZSBIX1AywqDCoMKgwqDCoMKgwqDCoMKgwqDCoC01
NQo+IMKgI2RlZmluZSBIX1AzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC01Ngo+IMKgI2RlZmluZSBI
X1A0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoC01Nwo+IEBAIC0xMDAsNyArMTAwLDYgQEAKPiDCoCNk
ZWZpbmUgSF9DT1BfSFfCoMKgwqDCoMKgwqDCoC03NAo+IMKgI2RlZmluZSBIX1NUQVRFwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAtNzUKPiDCoCNkZWZpbmUgSF9JTl9VU0XCoMKgwqDC
oMKgwqDCoC03Nwo+IC0jZGVmaW5lIEhfQUJPUlRFRMKgwqDCoMKgwqDCoC03OAo+IMKgI2RlZmlu
ZSBIX1VOU1VQUE9SVEVEX0ZMQUdfU1RBUlTCoMKgwqDCoMKgwqDCoC0yNTYKPiDCoCNkZWZpbmUg
SF9VTlNVUFBPUlRFRF9GTEFHX0VORMKgwqDCoMKgwqDCoMKgwqDCoC01MTEKPiDCoCNkZWZpbmUg
SF9NVUxUSV9USFJFQURTX0FDVElWRcKgLTkwMDUKPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBj
L3BsYXRmb3Jtcy9wc2VyaWVzL3BscGtzLmMKPiBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNl
cmllcy9wbHBrcy5jCj4gaW5kZXggZjRiNWI1YTY0ZGIzLi4zMmNlNGQ3ODBkOGYgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL3BscGtzLmMKPiArKysgYi9hcmNo
L3Bvd2VycGMvcGxhdGZvcm1zL3BzZXJpZXMvcGxwa3MuYwo+IEBAIC03NSw3ICs3NSw3IEBAIHN0
YXRpYyBpbnQgcHNlcmllc19zdGF0dXNfdG9fZXJyKGludCByYykKPiDCoMKgwqDCoMKgwqDCoMKg
Y2FzZSBIX0ZVTkNUSU9OOgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZXJyID0g
LUVOWElPOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gLcKgwqDC
oMKgwqDCoMKgY2FzZSBIX1AxOgo+ICvCoMKgwqDCoMKgwqDCoGNhc2UgSF9QQVJBTUVURVI6Cj4g
wqDCoMKgwqDCoMKgwqDCoGNhc2UgSF9QMjoKPiDCoMKgwqDCoMKgwqDCoMKgY2FzZSBIX1AzOgo+
IMKgwqDCoMKgwqDCoMKgwqBjYXNlIEhfUDQ6CgotLSAKQW5kcmV3IERvbm5lbGxhbiAgICBPekxh
YnMsIEFETCBDYW5iZXJyYQphamRAbGludXguaWJtLmNvbSAgIElCTSBBdXN0cmFsaWEgTGltaXRl
ZAo=

