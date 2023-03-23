Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E766C5B4D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 01:18:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhmCw3P55z3cjR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 11:18:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MGK2HBfs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MGK2HBfs;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhmC10Vj9z3bjx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 11:18:04 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32N02qvj027789;
	Thu, 23 Mar 2023 00:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=bKkDPxicMN7lqvHtLIxe3rMAXNhbr7akv3ICHyBGfkc=;
 b=MGK2HBfsuG27i49SP0UTMhBtEvbvSmRuUakXTOM9Xbh5dh5CMHG+ixp6x6H1/BNBu63Y
 Q08ptJyAZ2dyQ7NhngbR7o2/bIkEZ74Ak/XaVzURRDRq5FkPkGmXb6atmayOjxhzqh0p
 heMCypk6Wd35d+42Lx7sF8DK6EG4iOdl8hZyiUzE85s34CxExoRWXIx5lkYrhY3ANJ9l
 A0UojycHrDuFDjkpiDnxCYrfaQab/lgnCvGv5TbZksUB2bzbmPLrIOsJehzrCqueOcRT
 Zu291n+J644fbekAl7SPGtHptaNw3eqd5JqTjKV34ImFYIEervWYuO5qE2Bf98YrbdqC Hw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pgbvtg8bq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 00:17:54 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32N0HsLI013377;
	Thu, 23 Mar 2023 00:17:54 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pgbvtg8b4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 00:17:53 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32MGQ0OK015074;
	Thu, 23 Mar 2023 00:17:51 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3pd4jfejxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 00:17:51 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32N0Hn1C27853366
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Mar 2023 00:17:49 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 22A1B20049;
	Thu, 23 Mar 2023 00:17:49 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 96B0620040;
	Thu, 23 Mar 2023 00:17:48 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Mar 2023 00:17:48 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DA5D1602EB;
	Thu, 23 Mar 2023 11:17:46 +1100 (AEDT)
Message-ID: <c2dbe0a17af1c2816ac038715ec76ff96be2b633.camel@linux.ibm.com>
Subject: Re: [PATCH 4/8] powerpc/rtas: fix miswording in rtas_function
 kerneldoc
From: Andrew Donnellan <ajd@linux.ibm.com>
To: nathanl@linux.ibm.com, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas
	Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Date: Thu, 23 Mar 2023 11:17:46 +1100
In-Reply-To: <20230220-rtas-queue-for-6-4-v1-4-010e4416f13f@linux.ibm.com>
References: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
	 <20230220-rtas-queue-for-6-4-v1-4-010e4416f13f@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2fNS7oUArwU-DBmqCXhnSxxwR8j__f3A
X-Proofpoint-ORIG-GUID: SfLqmFSYWFy4mxT7KdJfPQaDkfwxROnv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_18,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303150002 definitions=main-2303220175
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
IAo+IFRoZSAnZmlsdGVyJyBtZW1iZXIgaXMgYSBwb2ludGVyLCBub3QgYSBib29sOyBmaXggdGhl
IHdvcmRpbmcKPiBhY2NvcmRpbmdseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gTHluY2gg
PG5hdGhhbmxAbGludXguaWJtLmNvbT4KClJldmlld2VkLWJ5OiBBbmRyZXcgRG9ubmVsbGFuIDxh
amRAbGludXguaWJtLmNvbT4KCj4gLS0tCj4gwqBhcmNoL3Bvd2VycGMva2VybmVsL3J0YXMuYyB8
IDIgKy0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL3J0YXMuYyBiL2FyY2gvcG93ZXJw
Yy9rZXJuZWwvcnRhcy5jCj4gaW5kZXggYzczYjAxZDcyMmY2Li5jMjljMzhiMWE1NWEgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9ydGFzLmMKPiArKysgYi9hcmNoL3Bvd2VycGMv
a2VybmVsL3J0YXMuYwo+IEBAIC02OCw3ICs2OCw3IEBAIHN0cnVjdCBydGFzX2ZpbHRlciB7Cj4g
wqAgKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBmdW5jdGlvbnMgYXJlIGJlbGlldmVkIHRvIGhhdmUgbm8KPiB1c2VycyBvbgo+IMKgICrCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHBjNjRs
ZSwgYW5kIHdlIHdhbnQgdG8ga2VlcCBpdCB0aGF0Cj4gd2F5LiBJdCBkb2VzCj4gwqAgKsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBub3QgbWFr
ZSBzZW5zZSBmb3IgdGhpcyB0byBiZSBzZXQgd2hlbgo+IEBmaWx0ZXIKPiAtICrCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaXMgZmFsc2UuCj4g
KyAqwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGlzIE5VTEwuCj4gwqAgKi8KPiDCoHN0cnVjdCBydGFzX2Z1bmN0aW9uIHsKPiDCoMKgwqDCoMKg
wqDCoMKgczMyIHRva2VuOwo+IAoKLS0gCkFuZHJldyBEb25uZWxsYW4gICAgT3pMYWJzLCBBREwg
Q2FuYmVycmEKYWpkQGxpbnV4LmlibS5jb20gICBJQk0gQXVzdHJhbGlhIExpbWl0ZWQK

