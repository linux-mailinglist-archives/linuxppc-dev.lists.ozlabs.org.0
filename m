Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0816C5DCB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 05:10:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhsMJ4M9jz3c4Y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 15:10:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NeCZiste;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NeCZiste;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhsLM550Wz30Ky
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 15:09:47 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32N2gHIS022815;
	Thu, 23 Mar 2023 04:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=3hMqwub7n1WFq/zdeaUYmE5WsI0Vswb9e85ybc5MM3M=;
 b=NeCZistedEqVr4S+mvB6EjjMihZtiZdh7N9Okg5CChXkQYVoS71Zbl8cXQ3EfvsXUH+o
 VSksBiIQcP+RLM6P9sjLPnsOk9ciGgKlFgsQ2K1iBYVKNU3mukV+ejW4wasCb/6ts9F5
 MKg3+kTlTIKk/uTdHuAiHnURnJfgBcaVKuVQvLZraCJsLgiMPwGmiPCQXgHw9ZeSIjt+
 ZIzMVXeCzPHfXUwHrggcAfc7VIKVpUjKLIQ8A+zzcrK24YNGJTIHyUXazgPZaGtGKs4R
 Wq4M/McqE8m6nwmTCsDVfORC/m03ozRpFg1wx0hiGlrz9HI1hxAog2pXix6PamIGYnAe gQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pge779f88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 04:09:38 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32N3xWid018759;
	Thu, 23 Mar 2023 04:09:38 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pge779f7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 04:09:38 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32MNx147006800;
	Thu, 23 Mar 2023 04:09:35 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3pd4x65pyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 04:09:35 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32N49XFI53739932
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Mar 2023 04:09:33 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E1D72004D;
	Thu, 23 Mar 2023 04:09:33 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8248920040;
	Thu, 23 Mar 2023 04:09:32 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Mar 2023 04:09:32 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3C6E760217;
	Thu, 23 Mar 2023 15:09:29 +1100 (AEDT)
Message-ID: <164939b3a083e8932a589d506a9929f7313e65df.camel@linux.ibm.com>
Subject: Re: [PATCH 2/8] powerpc/rtas: use memmove for potentially
 overlapping buffer copy
From: Andrew Donnellan <ajd@linux.ibm.com>
To: nathanl@linux.ibm.com, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas
	Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Date: Thu, 23 Mar 2023 15:09:29 +1100
In-Reply-To: <20230220-rtas-queue-for-6-4-v1-2-010e4416f13f@linux.ibm.com>
References: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
	 <20230220-rtas-queue-for-6-4-v1-2-010e4416f13f@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JAmbCAts8P1Zu3_OGQICaFk-I9ICQL-3
X-Proofpoint-ORIG-GUID: Nxr4sUrjwA_vewRkUV39zD0csRw9F-pv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 clxscore=1015 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 mlxlogscore=905
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303230030
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
IAo+IFVzaW5nIG1lbWNweSgpIGlzbid0IHNhZmUgd2hlbiBidWYgaXMgaWRlbnRpY2FsIHRvIHJ0
YXNfZXJyX2J1ZiwKPiB3aGljaAo+IGNhbiBoYXBwZW4gZHVyaW5nIGJvb3QgYmVmb3JlIHNsYWIg
aXMgdXAuIEZ1bGwgY29udGV4dCB3aGljaCBtYXkgbm90Cj4gYmUgb2J2aW91cyBmcm9tIHRoZSBk
aWZmOgo+IAo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoYWx0YnVmKSB7Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBidWYgPSBhbHRidWY7Cj4gwqDCoMKgwqDCoMKgwqDCoH0gZWxzZSB7
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBidWYgPSBydGFzX2Vycl9idWY7Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoc2xhYl9pc19hdmFpbGFibGUoKSkK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBidWYgPSBr
bWFsbG9jKFJUQVNfRVJST1JfTE9HX01BWCwKPiBHRlBfQVRPTUlDKTsKPiDCoMKgwqDCoMKgwqDC
oMKgfQo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoYnVmKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgbWVtY3B5KGJ1ZiwgcnRhc19lcnJfYnVmLCBSVEFTX0VSUk9SX0xPR19NQVgpOwo+
IAo+IFRoaXMgd2FzIGZvdW5kIGJ5IGluc3BlY3Rpb24gYW5kIEknbSBub3QgYXdhcmUgb2YgaXQg
Y2F1c2luZyBwcm9ibGVtcwo+IGluIHByYWN0aWNlLiBJdCBhcHBlYXJzIHRvIGhhdmUgYmVlbiBp
bnRyb2R1Y2VkIGJ5IGNvbW1pdAo+IDAzM2VmMzM4YjZlMCAoInBvd2VycGM6IE1lcmdlIHJ0YXMu
YyBpbnRvIGFyY2gvcG93ZXJwYy9rZXJuZWwiKTsgdGhlCj4gb2xkIHBwYzY0IHZlcnNpb24gb2Yg
dGhpcyBjb2RlIGRpZCBub3QgaGF2ZSB0aGlzIHByb2JsZW0uCj4gCj4gVXNlIG1lbW1vdmUoKSBp
bnN0ZWFkLgo+IAo+IEZpeGVzOiAwMzNlZjMzOGI2ZTAgKCJwb3dlcnBjOiBNZXJnZSBydGFzLmMg
aW50bwo+IGFyY2gvcG93ZXJwYy9rZXJuZWwiKQo+IFNpZ25lZC1vZmYtYnk6IE5hdGhhbiBMeW5j
aCA8bmF0aGFubEBsaW51eC5pYm0uY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHJldyBEb25uZWxsYW4g
PGFqZEBsaW51eC5pYm0uY29tPgoKLS0gCkFuZHJldyBEb25uZWxsYW4gICAgT3pMYWJzLCBBREwg
Q2FuYmVycmEKYWpkQGxpbnV4LmlibS5jb20gICBJQk0gQXVzdHJhbGlhIExpbWl0ZWQK

