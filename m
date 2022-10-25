Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A56A60D81D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 01:43:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxpQr3r0Kz3cFv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 10:43:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l30knxfd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l30knxfd;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxpPr5WGxz2xsc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Oct 2022 10:42:08 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29PM7oHH036731;
	Tue, 25 Oct 2022 23:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=FyBX5VMnzLOKSq6KavKCbmI+FZxBM+5Uay0XV4ohsXg=;
 b=l30knxfdE7H0Q37X9WrteOcdIeEd/dr0spoA22FXYc/1wuC1L+XOIip2vlNZnHDjmfjS
 WW/AV6ma/CK34D/LAOyscWrMvvUohzteB4sRG0GM369SiIVARPrgOsN9fdB1hLiRyjqt
 pWEQ9kW0ullj+O3gb3etXjaomTjpPT14jYexrlsEsTYE0YLhVSrj18eANiBZteJ8ZnCR
 XKLIp0eaBNEauO0lBylGMealpONX496+JOmcqO2xZcGL5Za9cyIru//52L911e2CMcG1
 4ET1XKdjN9Ao5DYyi0AKmXMXkXztMryM8HS+0W6hJbvJ/4wofmXOLGv4/hWIozDtfm0n cw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kee36fg7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 23:41:52 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29PNSe1Y033435;
	Tue, 25 Oct 2022 23:41:52 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kee36fg7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 23:41:51 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29PNZwnw005373;
	Tue, 25 Oct 2022 23:41:49 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04ams.nl.ibm.com with ESMTP id 3kc859edhq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 23:41:49 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29PNflQr42533170
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Oct 2022 23:41:47 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D983A4051;
	Tue, 25 Oct 2022 23:41:47 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 06CD6A4040;
	Tue, 25 Oct 2022 23:41:47 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 25 Oct 2022 23:41:46 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 255B260609;
	Wed, 26 Oct 2022 10:41:39 +1100 (AEDT)
Message-ID: <eb0c1f04e9b567936b2494ae9bf98859ce735915.camel@linux.ibm.com>
Subject: Re: [PATCH v4 2/6] powerpc/module: Handle caller-saved TOC in
 module linker
From: Benjamin Gray <bgray@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 26 Oct 2022 10:41:38 +1100
In-Reply-To: <05571d7c9bc1f8287cfd44ed519ba668d1cfdb86.camel@linux.ibm.com>
References: <20221010002957.128276-1-bgray@linux.ibm.com>
	 <20221010002957.128276-3-bgray@linux.ibm.com>
	 <05571d7c9bc1f8287cfd44ed519ba668d1cfdb86.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: U0YHBGMrBi9wnN3UVnAipssZ0seR7q5D
X-Proofpoint-GUID: hjXpFTUVd-uW8RzK9xRYFi4wRcs2bC0H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-25_13,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=961
 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 phishscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210250129
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
Cc: peterz@infradead.org, rostedt@goodmis.org, jpoimboe@kernel.org, jbaron@akamai.com, npiggin@gmail.com, ardb@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gVHVlLCAyMDIyLTEwLTI1IGF0IDEzOjEwICsxMTAwLCBBbmRyZXcgRG9ubmVsbGFuIHdyb3Rl
Ogo+IE9uIE1vbiwgMjAyMi0xMC0xMCBhdCAxMToyOSArMTEwMCwgQmVuamFtaW4gR3JheSB3cm90
ZToKPiA+ID4gQSBmdW5jdGlvbiBzeW1ib2wgbWF5IHNldCBhIHZhbHVlIGluIHRoZSBzdF9vdGhl
ciBmaWVsZCB0bwo+ID4gPiBpbmRpY2F0ZQo+ID4gPiB0aGUgVE9DIHNob3VsZCBiZSB0cmVhdGVk
IGFzIGNhbGxlci1zYXZlZC4gVGhlIGxpbmtlciBzaG91bGQKPiA+ID4gZW5zdXJlPiB0aGUKPiA+
ID4gY3VycmVudCBUT0MgaXMgc2F2ZWQgYmVmb3JlIGNhbGxpbmcgaXQgYW5kIHJlc3RvcmUgdGhl
IFRPQz4KPiA+ID4gYWZ0ZXJ3YXJkcywKPiA+ID4gbXVjaCBsaWtlIGV4dGVybmFsIGNhbGxzLgo+
IAo+IEFzIEkgc3VnZ2VzdGVkIG9uIHRoZSBsYXN0IHJldmlzaW9uLCB3b3J0aCBtZW50aW9uaW5n
IGhlcmUgdGhhdCBpdCdzCj4gdGhlICcubG9jYWxlbnRyeSA8TkFNRT4sIDEnIGRpcmVjdGl2ZSB3
ZSdyZSB0YWxraW5nIGFib3V0IGhlcmUuCgpBaCByaWdodCwgd2hvb3BzLiBBZGRlZCAiRm9yIGV4
YW1wbGUsIEdDQyBhbmQgQ2xhbmcgc3VwcG9ydCBhCicubG9jYWxlbnRyeSA8TkFNRT4sIDEnIGRp
cmVjdGl2ZSB0byBzZXQgdGhpcyBleHBsaWNpdGx5IGluIGFzc2VtYmx5LiIKClRoZSBleGFjdCBt
ZXRob2QgZm9yIGRvaW5nIHRoaXMgc2VlbXMgdG8gYmUgbm9uc3RhbmRhcmQgKEdDQyBzdXBwb3J0
cwphcmJpdHJhcnkgdmFsdWUgaW4gMS0tNywgQ2xhbmcgc3BlY2lhbCBjYXNlcyBvbmx5IDEpLCBz
byBvcmlnaW5hbGx5IEkKd2FzIGF2b2lkaW5nIHNwZWNpZnlpbmcgaG93IGl0IGlzIHNldC4KCj4g
PiA+IEBAIC02MzIsNyArNjQzLDggQEAgaW50IGFwcGx5X3JlbG9jYXRlX2FkZChFbGY2NF9TaGRy
ICpzZWNoZHJzLAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNhc2UgUl9Q
UENfUkVMMjQ6Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoC8qIEZJWE1FOiBIYW5kbGUgd2VhayBzeW1ib2xzIGhlcmUgLS1SUgo+ID4gPiAqLwo+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAo
c3ltLT5zdF9zaG5keCA9PSBTSE5fVU5ERUYgfHwKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3ltLT5zdF9zaG5keCA9PSBTSE5fTElW
RVBBVENIKSB7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHN5bS0+c3Rfc2huZHggPT0gU0hOX0xJVkVQQVRDSCB8fAo+ID4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuZWVkX3Iy
c2F2ZV9zdHViKHN5bS0+c3Rfb3RoZXIpKSB7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBFeHRlcm5hbDogZ28g
dmlhIHN0dWIgKi8KPiAKPiBQZXJoYXBzIHRoaXMgY29tbWVudCBzaG91bGQgYmUgdXBkYXRlZCB0
byBtZW50aW9uIHRoYXQgdGhlcmUgYXJlIG5vbi0KPiBleHRlcm5hbCBidXQgZXh0ZXJuYWwtbGlr
ZSBjYWxscz8KPiAKPiBPdGhlcndpc2UKPiAKPiBSZXZpZXdlZC1ieTogQW5kcmV3IERvbm5lbGxh
biA8YWpkQGxpbnV4LmlibS5jb20+CgpVcGRhdGVkIHRvICIvKiBNYXkgdXNlIGRpZmZlcmVudCAv
IG5vdCBwcmVzZXJ2ZSBUT0M6IGdvIHZpYSBzdHViICovIiwKd2lsbCBhZGQgeW91ciByZXZpZXdl
ZC1ieSBpbiB0aGUgbmV4dCB2ZXJzaW9uLiBGb3Igbm93IEknbGwgd2FpdCBmb3IKYW55IG90aGVy
IGZlZWRiYWNrIGJlZm9yZSBzZW5kaW5nIGl0Lgo+ID4gCg==

