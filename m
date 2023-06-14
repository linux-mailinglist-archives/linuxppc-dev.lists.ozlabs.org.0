Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3988972F36C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 06:13:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HMkGJH8a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgsVq17Wdz30gv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 14:13:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HMkGJH8a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgsTv66hhz301Q
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 14:13:07 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35E3qhDD031375;
	Wed, 14 Jun 2023 04:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=A15YXGTilOsOFgUA+1xDhKKQW33166Va1kgOKMRNIUI=;
 b=HMkGJH8aydhcPDFsERDshXZILNgeCVrBaKfZ1+/vTZsCF1GpxS/hUFTqk9a9PQeFuhQm
 Nv66q75LGxqhdGuFBkzOhMfMbz8FNb8RiPAX1a/s5c0JjMK7FdCgwTwAEmjyJl0Reugc
 zxo4hwnPgdJwmkqsYIdSwliy4HQNbFGxkt7Rhu+i/lwm4dxr8PH+5lP+Sj4JtdRuvWH+
 My46UMBk5tzfkeniznGTq1I4Z2IpUfNNNB1HO1eTqlv7ovfprDGAnfuhOJULQ7oXi8gV
 w9L1x1OebjAK6i2zITFg8CdmFJaGPALW9bs3jbVocBxNcdwJHxUMx1g0L1by3bZ87X0b YA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r76198euf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jun 2023 04:12:44 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35E499Kk011305;
	Wed, 14 Jun 2023 04:12:09 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r76198e0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jun 2023 04:12:09 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35E0u0J2014073;
	Wed, 14 Jun 2023 04:11:12 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([9.208.130.100])
	by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3r4gt5kruv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jun 2023 04:11:12 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35E4BBcS57737584
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Jun 2023 04:11:11 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73ABA5805C;
	Wed, 14 Jun 2023 04:11:11 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B080558054;
	Wed, 14 Jun 2023 04:11:06 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.10.53])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 Jun 2023 04:11:06 +0000 (GMT)
X-Mailer: emacs 29.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: Re: [PATCH 00/16] Add support for DAX vmemmap optimization for ppc64
In-Reply-To: <20230606045608.55127-1-aneesh.kumar@linux.ibm.com>
References: <20230606045608.55127-1-aneesh.kumar@linux.ibm.com>
Date: Wed, 14 Jun 2023 09:41:02 +0530
Message-ID: <87fs6u65ux.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ruuX-Zz0vE5wfoaRZI1RBaJ06ZaAEjKp
X-Proofpoint-ORIG-GUID: ANs9AGt8YhxqOHyl226tXh2pwSWivLrt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-14_01,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 bulkscore=0 clxscore=1015 mlxlogscore=884 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306140032
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
Cc: Will Deacon <will@kernel.org>, Muchun Song <muchun.song@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> This patch series implements changes required to support DAX vmemmap
> optimization for ppc64. The vmemmap optimization is only enabled with radix MMU
> translation and 1GB PUD mapping with 64K page size. The patch series also split
> hugetlb vmemmap optimization as a separate Kconfig variable so that
> architectures can enable DAX vmemmap optimization without enabling hugetlb
> vmemmap optimization. This should enable architectures like arm64 to enable DAX
> vmemmap optimization while they can't enable hugetlb vmemmap optimization. More
> details of the same are in patch "mm/vmemmap optimization: Split hugetlb and
> d
>
> Aneesh Kumar K.V (16):
>   powerpc/mm/book3s64: Use pmdp_ptep helper instead of typecasting.
>   powerpc/book3s64/mm: mmu_vmemmap_psize is used by radix
>   powerpc/book3s64/mm: Fix DirectMap stats in /proc/meminfo
>   powerpc/book3s64/mm: Use PAGE_KERNEL instead of opencoding
>   powerpc/mm/dax: Fix the condition when checking if altmap vmemap can
>     cross-boundary
>   mm/hugepage pud: Allow arch-specific helper function to check huge
>     page pud support
>   mm: Change pudp_huge_get_and_clear_full take vm_area_struct as arg
>   mm/vmemmap: Improve vmemmap_can_optimize and allow architectures to
>     override
>   mm/vmemmap: Allow architectures to override how vmemmap optimization
>     works
>   mm: Add __HAVE_ARCH_PUD_SAME similar to __HAVE_ARCH_P4D_SAME
>   mm/huge pud: Use transparent huge pud helpers only with
>     CONFIG_TRANSPARENT_HUGEPAGE
>   mm/vmemmap optimization: Split hugetlb and devdax vmemmap optimization
>   powerpc/book3s64/mm: Enable transparent pud hugepage
>   powerpc/book3s64/vmemmap: Switch radix to use a different vmemmap
>     handling function
>   powerpc/book3s64/radix: Add support for vmemmap optimization for radix
>   powerpc/book3s64/radix: Remove mmu_vmemmap_psize

   Gentle ping. Any objections for this series? 

   -aneesh
