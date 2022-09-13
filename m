Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA8B5B650F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 03:22:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRQgy2Z4Yz3bmc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 11:22:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f8BjmcAl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f8BjmcAl;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRQgD1lrjz303t
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 11:22:15 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28CNDaHJ014851;
	Tue, 13 Sep 2022 01:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=2g4wdfuEZN3A/x84iebTqKqNEguh8wTAqlzAya7g67k=;
 b=f8BjmcAlmfMiWtc/B0ZHOPKVKge+j5wD+X0gQcletAl5wv9QQnej0k+QIvT+zpycCmhr
 nL9r4MPk6XyqdmJU7rPhmQi0MCSaMgWyal0geYfBVKC3ItPmgj6/Wm/mGDGZocRKQASN
 OjAhHzIeEvFnjWTekR/YFGD8/LAgfnQxczgNia9v4MeiTVLC1CSHoWCHpMD8fr2xhCqp
 3BGpF1ctZ8vrXBGD1ZJU7l0QwbxKSr7oKR8XyoLF5AuNs61Xf3ZS2/vvIlUfj0P9aaNK
 +Z3k6wREIUlYsmcWrn6tSEx7MMSEL4SdLtZe0fGwwnar9V95yXnk8qjQuytg5eklQpzk ow== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jje8qjm3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 01:22:09 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28D1KuYx026847;
	Tue, 13 Sep 2022 01:22:06 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma04ams.nl.ibm.com with ESMTP id 3jgj79u2ya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 01:22:06 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28D1M4M237814582
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Sep 2022 01:22:04 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8FD92AE04D;
	Tue, 13 Sep 2022 01:22:04 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A922AE045;
	Tue, 13 Sep 2022 01:22:04 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 13 Sep 2022 01:22:04 +0000 (GMT)
Received: from smtpclient.apple (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2840760525;
	Tue, 13 Sep 2022 11:22:00 +1000 (AEST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 3/3] powerpc: mm: support page table check
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <29425071-eace-5046-dfe4-815dfadddf1c@csgroup.eu>
Date: Tue, 13 Sep 2022 11:21:57 +1000
Content-Transfer-Encoding: quoted-printable
Message-Id: <7F7F6B90-C1A8-4ECA-9485-23D9D0B56D66@linux.ibm.com>
References: <20220912014703.185471-1-rmclure@linux.ibm.com>
 <20220912014703.185471-3-rmclure@linux.ibm.com>
 <29425071-eace-5046-dfe4-815dfadddf1c@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MUtqog6fComRSXkRFuvPuzfE2F9-PS4S
X-Proofpoint-ORIG-GUID: MUtqog6fComRSXkRFuvPuzfE2F9-PS4S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_16,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 mlxlogscore=980 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209130003
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 12 Sep 2022, at 4:11 pm, Christophe Leroy =
<christophe.leroy@csgroup.eu> wrote:
>=20
>=20
>=20
> Le 12/09/2022 =C3=A0 03:47, Rohan McLure a =C3=A9crit :
>> On creation and clearing of a page table mapping, instrument such =
calls
>> by invoking page_table_check_pte_set and page_table_check_pte_clear
>> respectively. These calls serve as a sanity check against illegal
>> mappings.
>>=20
>> Enable ARCH_SUPPORTS_PAGE_TABLE_CHECK for all ppc64, and 32-bit
>> platforms implementing Book3S.
>=20
> Why only book3s on 32 bits ?

Sorry. I failed to update that commit message. This patch instead =
supports,
page table checks on all platforms, but I began writing this patch =
series to
target just Book3S, and then updated it to include all platforms. The =
only
barrier to doing so was the need for the pud_pfn and
page_table_check_pud_{clear,set} bloat.

>> +++ b/arch/powerpc/include/asm/pgtable.h
>> @@ -166,7 +166,11 @@ static inline int pud_pfn(pud_t pud)
>>  	 * check so this should never be used. If it grows another user =
we
>>  	 * want to know about it.
>>  	 */
>> +#ifndef CONFIG_PAGE_TABLE_CHECK
>>  	BUILD_BUG();
>> +#else
>> +	BUG();
>> +#endif
>=20
> Awfull.

Quite right. I suspect you can infer the intention here, which is to =
enforce
that this dead code must not be included anywhere in generic code, but =
rather
be gated by pud_devmap. I will relax this to a WARN().

