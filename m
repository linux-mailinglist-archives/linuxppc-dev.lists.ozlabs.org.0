Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DE16C5FB4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 07:27:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhwPS2mWQz3f4R
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 17:27:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KN+HwJEb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KN+HwJEb;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhwNT55zWz3cFW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 17:26:49 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32N6J9eW022965;
	Thu, 23 Mar 2023 06:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=8DztOWEShHGxoLA94JdvJNxg1Y1GqBd47/lujePmA4I=;
 b=KN+HwJEbz0/tUdKpXzG6onkEe/GV26KlypL8JAbk4aE3+afSQ2zQIUIs8tUwWU1TFpdF
 fmsyIzR87EJ9fsLxa+kZmVc6BeATp2ESrajCA+Sb2jUEeMnxgsJg7qxAdnnYbJc+a2LB
 b7VLzzfJngKQ18AD/RkFLIbrYDY7h5kCX0c0Ws0/uY2NbAwSpT4E/pzVgCnICqGEKnYW
 QxRYl0tCyHLh0fF6/v7pXZ7TCbRxA6QCibzhOyPtO6oCcnO7Ht8UAe6Cc27KgmngbFe0
 J0mHif12ZcaLTer0grA0KJSFtF2TRHS5ALj9gc2A+ezdZb9CxHlpEyrsTY77Awov7ld4 Pw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pge77c0vg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 06:26:41 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32N66QYD019110;
	Thu, 23 Mar 2023 06:26:40 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pge77c0uk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 06:26:40 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32MGuXDT022346;
	Thu, 23 Mar 2023 06:26:38 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3pd4x6exq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 06:26:38 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32N6QZl646203218
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Mar 2023 06:26:35 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C6B7020043;
	Thu, 23 Mar 2023 06:26:35 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C705220040;
	Thu, 23 Mar 2023 06:26:34 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Mar 2023 06:26:34 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id F339C602EB;
	Thu, 23 Mar 2023 17:26:29 +1100 (AEDT)
Message-ID: <35f3e3c9486fe2a841bbf590349e8386c1bba390.camel@linux.ibm.com>
Subject: Re: [PATCH 8/8] powerpc/rtas: consume retry statuses in sys_rtas()
From: Andrew Donnellan <ajd@linux.ibm.com>
To: nathanl@linux.ibm.com, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas
	Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Date: Thu, 23 Mar 2023 17:26:29 +1100
In-Reply-To: <20230220-rtas-queue-for-6-4-v1-8-010e4416f13f@linux.ibm.com>
References: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
	 <20230220-rtas-queue-for-6-4-v1-8-010e4416f13f@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BkZ7J6FMRbdM93q97w7hFxRj7nvhuBWK
X-Proofpoint-ORIG-GUID: Kar4dViF6lTT4XmUAM9WF53Ee42aMTeJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 clxscore=1015 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303230046
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Nick Child <nnac123@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gTW9uLCAyMDIzLTAzLTA2IGF0IDE1OjMzIC0wNjAwLCBOYXRoYW4gTHluY2ggdmlhIEI0IFJl
bGF5IHdyb3RlOgo+IEZyb206IE5hdGhhbiBMeW5jaCA8bmF0aGFubEBsaW51eC5pYm0uY29tPgo+
IAo+IFRoZSBrZXJuZWwgY2FuIGhhbmRsZSByZXRyeWluZyBSVEFTIGZ1bmN0aW9uIGNhbGxzIGlu
IHJlc3BvbnNlIHRvCj4gLTIvOTkweCBpbiB0aGUgc3lzX3J0YXMoKSBoYW5kbGVyIGluc3RlYWQg
b2YgcmVsYXlpbmcgdGhlCj4gaW50ZXJtZWRpYXRlCj4gc3RhdHVzIHRvIHVzZXIgc3BhY2UuCj4g
Cj4gSnVzdGlmaWNhdGlvbnM6Cj4gCj4gKiBDdXJyZW50bHkgaXQncyBub25kZXRlcm1pbmlzdGlj
IGFuZCBxdWl0ZSB2YXJpYWJsZSBpbiBwcmFjdGljZQo+IMKgIHdoZXRoZXIgYSByZXRyeSBzdGF0
dXMgaXMgcmV0dXJuZWQgZm9yIGFueSBnaXZlbiBpbnZvY2F0aW9uIG9mCj4gwqAgc3lzX3J0YXMo
KS4gVGhlcmVmb3JlIHVzZXIgc3BhY2UgY29kZSBjYW5ub3QgYmUgZXhwZWN0aW5nIGEgcmV0cnkK
PiDCoCByZXN1bHQgd2l0aG91dCBhbHJlYWR5IGJlaW5nIGJyb2tlbi4KPiAKPiAqIFRoaXMgdGVu
ZHMgdG8gc2lnbmlmaWNhbnRseSByZWR1Y2UgdGhlIHRvdGFsIG51bWJlciBvZiBzeXN0ZW0gY2Fs
bHMKPiDCoCBpc3N1ZWQgYnkgcHJvZ3JhbXMgc3VjaCBhcyBkcm1nciB3aGljaCBtYWtlIHVzZSBv
ZiBzeXNfcnRhcygpLAo+IMKgIGltcHJvdmluZyB0aGUgZXhwZXJpZW5jZSBvZiB0cmFjaW5nIGFu
ZCBkZWJ1Z2dpbmcgc3VjaAo+IMKgIHByb2dyYW1zLiBUaGlzIGlzIHRoZSBtYWluIG1vdGl2YXRp
b24gZm9yIG1lOiBJIHRoaW5rIHRoaXMgY2hhbmdlCj4gwqAgd2lsbCBtYWtlIGl0IGVhc2llciBm
b3IgdXMgdG8gY2hhcmFjdGVyaXplIGN1cnJlbnQgc3lzX3J0YXMoKSB1c2UKPiDCoCBjYXNlcyBh
cyB3ZSBtb3ZlIHRoZW0gdG8gb3RoZXIgaW50ZXJmYWNlcyBvdmVyIHRpbWUuCj4gCj4gKiBJdCBy
ZWR1Y2VzIHRoZSBudW1iZXIgb2Ygb3Bwb3J0dW5pdGllcyBmb3IgdXNlciBzcGFjZSB0byBsZWF2
ZQo+IMKgIGNvbXBsZXggb3BlcmF0aW9ucywgc3VjaCBhcyB0aG9zZSBhc3NvY2lhdGVkIHdpdGgg
RExQQVIsIGluY29tcGxldGUKPiDCoCBhbmQgZGlmZmN1bHQgdG8gcmVjb3Zlci4KPiAKPiAqIFdl
IGNhbiBleHBlY3QgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnRzIGZvciBleGlzdGluZyBzeXNfcnRh
cygpCj4gwqAgdXNlcnMsIG5vdCBvbmx5IGJlY2F1c2Ugb2Ygb3ZlcmFsbCByZWR1Y3Rpb24gaW4g
dGhlIG51bWJlciBvZgo+IHN5c3RlbQo+IMKgIGNhbGxzIGlzc3VlZCwgYnV0IGFsc28gZHVlIHRv
IHRoZSBiZXR0ZXIgaGFuZGxpbmcgb2YgLTIvOTkweCBpbiB0aGUKPiDCoCBrZXJuZWwuIEZvciBl
eGFtcGxlLCBsaWJydGFzIHN0aWxsIHNsZWVwcyBmb3IgMW1zIG9uIC0yLCB3aGljaCBpcwo+IMKg
IGNvbXBsZXRlbHkgdW5uZWNlc3NhcnkuCgpXb3VsZCBiZSBnb29kIHRvIHNlZSB0aGlzIGZpeGVk
IG9uIHRoZSBsaWJydGFzIHNpZGUuCgo+IAo+IFBlcmZvcm1hbmNlIGRpZmZlcmVuY2VzIGZvciBQ
SEIgYWRkIGFuZCByZW1vdmUgb24gYSBzbWFsbCBQMTAgUG93ZXJWTQo+IHBhcnRpdGlvbiBhcmUg
aW5jbHVkZWQgYmVsb3cuIEZvciBhZGQsIGVsYXBzZWQgdGltZSBpcyBzbGlnaHRseQo+IHJlZHVj
ZWQuIEZvciByZW1vdmUsIHRoZXJlIGFyZSBtb3JlIHNpZ25pZmljYW50IGltcHJvdmVtZW50czog
dGhlCj4gbnVtYmVyIG9mIGNvbnRleHQgc3dpdGNoZXMgaXMgcmVkdWNlZCBieSBhbiBvcmRlciBv
ZiBtYWduaXR1ZGUsIGFuZAo+IGVsYXBzZWQgdGltZSBpcyByZWR1Y2VkIGJ5IG92ZXIgaGFsZi4K
PiAKPiAoLSBiZWZvcmUsICsgYWZ0ZXIpOgo+IAo+IMKgIFBlcmZvcm1hbmNlIGNvdW50ZXIgc3Rh
dHMgZm9yICdkcm1nciAtYyBwaGIgLWEgLXMgUEhCIDIzJyAoNSBydW5zKToKPiAKPiAtwqDCoMKg
wqDCoMKgwqDCoMKgIDEsODQ3LjU4IG1zZWMgdGFzay1jbG9ja8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICPCoMKgwqAgMC4xMzUKPiBDUFVzIHV0aWxpemVkwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoICstIDE0LjE1JSApCj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgMTAsODY3wqDCoMKgwqDCoCBjc8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjwqDCoMKgIDkuODAwCj4gSy9zZWPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoICstIDE0LjE0JSApCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoCAxLDkwMS4xNSBtc2VjIHRhc2stY2xvY2vCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjwqDCoMKgIDAuMTQ4Cj4gQ1BVcyB1dGls
aXplZMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKCArLSAxNC4xMyUgKQo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIDEwLDQ1McKgwqDCoMKgwqAgY3PCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgI8KgwqDCoCA5LjE1OAo+IEsv
c2VjwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKCArLSAxNC4x
NCUgKQo+IAo+IC3CoMKgwqDCoMKgwqDCoMKgIDEzLjY1NjU1NyArLSAwLjAwMDEyNCBzZWNvbmRz
IHRpbWUgZWxhcHNlZMKgICggKy3CoCAwLjAwJSApCj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAxMi44
ODA4MCArLSAwLjAwNDA0IHNlY29uZHMgdGltZSBlbGFwc2VkwqAgKCArLcKgIDAuMDMlICkKPiAK
PiDCoCBQZXJmb3JtYW5jZSBjb3VudGVyIHN0YXRzIGZvciAnZHJtZ3IgLWMgcGhiIC1yIC1zIFBI
QiAyMycgKDUgcnVucyk6Cj4gCj4gLcKgwqDCoMKgwqDCoMKgwqDCoCAxLDQ3My43NSBtc2VjIHRh
c2stY2xvY2vCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjwqDC
oMKgIDAuMDkyCj4gQ1BVcyB1dGlsaXplZMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKCAr
LSAxNC4xNSUgKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMiw2NTLCoMKgwqDCoMKgIGNz
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICPCoMKgwqAgMy4wMDAKPiBLL3NlY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICggKy0gMTQuMTYlICkKPiArwqDCoMKgwqDCoMKgwqDCoMKgIDEsNDQ0LjU1
IG1zZWMgdGFzay1jbG9ja8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICPCoMKgwqAgMC4yMjEKPiBDUFVzIHV0aWxpemVkwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAoICstIDE0LjE0JSApCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMTA0wqDC
oMKgwqDCoCBjc8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAjwqAgMTE5Ljk1Nwo+IC9zZWPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICggKy0gMTQuNjMlICkKPiAKPiAtwqDCoMKgwqDCoMKgwqDC
oMKgIDE1Ljk5NzE4ICstIDAuMDA4MDEgc2Vjb25kcyB0aW1lIGVsYXBzZWTCoCAoICstwqAgMC4w
NSUgKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCA2LjU0MjU2ICstIDAuMDA4MzAgc2Vjb25kcyB0
aW1lIGVsYXBzZWTCoCAoICstwqAgMC4xMyUgKQo+IAo+IE1vdmUgdGhlIGV4aXN0aW5nIHJ0YXNf
bG9jay1ndWFyZGVkIGNyaXRpY2FsIHNlY3Rpb24gaW4gc3lzX3J0YXMoKQo+IGludG8gYSBjb252
ZW50aW9uYWwgcnRhc19idXN5X2RlbGF5KCktYmFzZWQgbG9vcCwgcmV0dXJuaW5nIHRvIHVzZXIK
PiBzcGFjZSBvbmx5IHdoZW4gYSBmaW5hbCBzdWNjZXNzIG9yIGZhaWx1cmUgcmVzdWx0IGlzIGF2
YWlsYWJsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gTHluY2ggPG5hdGhhbmxAbGludXgu
aWJtLmNvbT4KClNob3VsZCB0aGVyZSBiZSBzb21lIGtpbmQgb2YgdGltZW91dD8gSSdtIGEgYml0
IHdvcnJpZWQgYnkgc2xlZXBpbmcgaW4KYSBzeXNjYWxsIGZvciBhbiBleHRlbmRlZCBwZXJpb2Qu
CgotLSAKQW5kcmV3IERvbm5lbGxhbiAgICBPekxhYnMsIEFETCBDYW5iZXJyYQphamRAbGludXgu
aWJtLmNvbSAgIElCTSBBdXN0cmFsaWEgTGltaXRlZAo=

