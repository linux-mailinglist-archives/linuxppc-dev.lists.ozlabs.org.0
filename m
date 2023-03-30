Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C63EB6CF910
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 04:14:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pn6S92kwKz3fRW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 13:14:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sImilZVu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sImilZVu;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pn6RG366Kz3ccs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 13:13:46 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32U1D18q010254;
	Thu, 30 Mar 2023 02:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=CKqP4ukLLwUG99G0oY+ALNTnRleCpCg2nSX0BsNZR58=;
 b=sImilZVuXe84Ubn+KB637idRkT7MIKwQyU9Dw+9jqTwzd8TxJa8Cij1lSVDHHroepVHs
 R1j6JnOWYydP+t9wAKP6gUMkYPYT0x+9rNwgwCpj8ATiQOI8lHl6UEgH8UtR3m0KVMTQ
 HuTkCdjRjVMq5+WF4FfV+t5SfRGDxsFf8t/qauXKw3QKt4KjCyDVMUhf4p1pNFjGX1/r
 8HkG0IRQJKzrdAX6W5a5wHexn6jSki50zFZmfXnTjIcEGLHAbZHm5fQzDEZU2nsG/K53
 F8ARtBVbUHjwp5KW4KEy96ffhAGI+qtTpd1pa7zT7/ggNwVSW6o8eUNknvCvoF1CJCRZ Yw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pmpr803ma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 02:13:35 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32U27GsL031520;
	Thu, 30 Mar 2023 02:13:35 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pmpr803kr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 02:13:35 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32TKGGVr028941;
	Thu, 30 Mar 2023 02:13:33 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3phr7fnfdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 02:13:32 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32U2DU6R63439142
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Mar 2023 02:13:30 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6FFF72004B;
	Thu, 30 Mar 2023 02:13:30 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7054C20043;
	Thu, 30 Mar 2023 02:13:29 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Mar 2023 02:13:29 +0000 (GMT)
Received: from smtpclient.apple (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B51F9600A5;
	Thu, 30 Mar 2023 13:13:27 +1100 (AEDT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH v8 0/7] Support page table check
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <20230215231153.2147454-1-rmclure@linux.ibm.com>
Date: Thu, 30 Mar 2023 13:11:24 +1100
Message-Id: <3D9F951A-5132-4EE8-8A28-A23F74306C8C@linux.ibm.com>
References: <20230215231153.2147454-1-rmclure@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xi6aYc1AYJnIDsK6TSZXqqu_Qzcc2q3O
X-Proofpoint-GUID: ZtlwCEwg7ltFiqUKd5PCEytqict2Q6_c
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_16,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 clxscore=1011 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303300014
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Anyone got time to review this one?

> On 16 Feb 2023, at 10:11 am, Rohan McLure <rmclure@linux.ibm.com> wrote:
>=20
> Support the page table check sanitiser on all PowerPC platforms. This
> sanitiser works by serialising assignments, reassignments and clears of
> page table entries at each level in order to ensure that anonymous
> mappings have at most one writable consumer, and likewise that
> file-backed mappings are not simultaneously also anonymous mappings.
>=20
> In order to support this infrastructure, a number of stubs must be
> defined for all powerpc platforms. Additionally, seperate set_pte_at
> and set_pte, to allow for internal, uninstrumented mappings.
>=20
> v8:
> * Fix linux/page_table_check.h include in asm/pgtable.h breaking
>   32-bit.
>=20
> v7:
> * Remove use of extern in set_pte prototypes
> * Clean up pmdp_collapse_flush macro
> * Replace set_pte_at with static inline function
> * Fix commit message for patch 7
> Link: https://lore.kernel.org/linuxppc-dev/20230215020155.1969194-1-rmclu=
re@linux.ibm.com/
>=20
> v6:
> * Support huge pages and p{m,u}d accounting.
> * Remove instrumentation from set_pte from kernel internal pages.
> * 64s: Implement pmdp_collapse_flush in terms of __pmdp_collapse_flush
>   as access to the mm_struct * is required.
> Link: https://lore.kernel.org/linuxppc-dev/20230214015939.1853438-1-rmclu=
re@linux.ibm.com/
>=20
> v5:
> Link: https://lore.kernel.org/linuxppc-dev/20221118002146.25979-1-rmclure=
@linux.ibm.com/
>=20
> Rohan McLure (7):
>  powerpc: mm: Separate set_pte, set_pte_at for internal, external use
>  powerpc/64s: mm: Introduce __pmdp_collapse_flush with mm_struct
>    argument
>  powerpc: mm: Replace p{u,m,4}d_is_leaf with p{u,m,4}_leaf
>  powerpc: mm: Implement p{m,u,4}d_leaf on all platforms
>  powerpc: mm: Add common pud_pfn stub for all platforms
>  powerpc: mm: Add p{te,md,ud}_user_accessible_page helpers
>  powerpc: mm: Support page table check
>=20
> arch/powerpc/Kconfig                         |  1 +
> arch/powerpc/include/asm/book3s/32/pgtable.h | 17 +++-
> arch/powerpc/include/asm/book3s/64/pgtable.h | 85 +++++++++++++-------
> arch/powerpc/include/asm/book3s/pgtable.h    |  3 +-
> arch/powerpc/include/asm/nohash/32/pgtable.h | 12 ++-
> arch/powerpc/include/asm/nohash/64/pgtable.h | 24 +++++-
> arch/powerpc/include/asm/nohash/pgtable.h    |  9 ++-
> arch/powerpc/include/asm/pgtable.h           | 60 +++++++++-----
> arch/powerpc/kvm/book3s_64_mmu_radix.c       | 12 +--
> arch/powerpc/mm/book3s64/hash_pgtable.c      |  2 +-
> arch/powerpc/mm/book3s64/pgtable.c           | 16 ++--
> arch/powerpc/mm/book3s64/radix_pgtable.c     | 24 +++---
> arch/powerpc/mm/nohash/book3e_pgtable.c      |  2 +-
> arch/powerpc/mm/pgtable.c                    |  9 +--
> arch/powerpc/mm/pgtable_32.c                 |  2 +-
> arch/powerpc/mm/pgtable_64.c                 |  6 +-
> arch/powerpc/xmon/xmon.c                     |  6 +-
> 17 files changed, 197 insertions(+), 93 deletions(-)
>=20
> --=20
> 2.37.2
>=20

