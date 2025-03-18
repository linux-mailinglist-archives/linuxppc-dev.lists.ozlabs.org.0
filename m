Return-Path: <linuxppc-dev+bounces-7168-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BFAA66984
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Mar 2025 06:39:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZH0yN4MH1z2yVv;
	Tue, 18 Mar 2025 16:39:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742276348;
	cv=none; b=czMZdf/w2YBBrVKnH4lQ+81BIBBOlz5sZT3x5D1tI8u6YO84OoFiJVrtq+Yg0Thcm6F4mnpTQMnK6Nkkn1ivYQtT4SyxRENGO4ZYPDw2ojGyg4WwADSPPoQwFSWxxG6/uZmInNM2V818vWoy71oiDJdE3bCzjctKH3cVtSxHzKURlDID6+tGTvPrAQGSABRB6UMWOw/EecXH/0JX8YPZyeEnr3Hf0pr6o9mcXgTAGs9/x6sQQPbwSKsqww7eK0vqx3ORpT9VYgXFYF7HAXEnRLmBShtzXlywGUDRBs+vOpQPZENuX6NOCcnCfznUDKSEYJlDTWl4zMLJn7WQZ2869w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742276348; c=relaxed/relaxed;
	bh=DioCaqQk0CryK0PbM4g67zBKbEP75bAXPCKEk2n/rJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GZSN0OQPcdLeoCqyVuWr8Pz+6jlboFsK2OCyn9mFMcs6nmPQFjOuccqQSVkSkkEpAtZHf/fFJyy4gqcmKZaUI8jOpr0wJWORcJb652qquOmJjv496X/b8Mg3CCFDPNrNorW8ipf9gA4JGhRuN/KDEEPeyKCf8YVGwYLk7lySUN9q0NEDigz6EnKSGrB9pCQz/3RDYE7YQl9syEQG9Nbrq1ZexgHRmYoxOYnQEbBcOMde0wPqTzBd56VfzURelSAldUXSveMy0V/ECd2ynKZ1dNCJBB3iZbLCeccSk6itPrCmMaTK4nqRgZhvql5W7cUtnc7mr/RXz7Vy7JLia5ZpAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A/MKBvxg; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A/MKBvxg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZH0yM49T3z2yDr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 16:39:07 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HKpnst011320;
	Tue, 18 Mar 2025 05:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=DioCaq
	Qk0CryK0PbM4g67zBKbEP75bAXPCKEk2n/rJE=; b=A/MKBvxgMO+AjzBPdR4piH
	owaMe0gV3nyCYKcmUF4Yj+5e6/Bdeu9UXzwC6Gw1dYD58EjPhnMs7chyToN+bM+b
	pQQpOJJ/XTt5fTzyw6LhxwN1TLrFThrThelJlrFntLVcfKeKpKOErV429PFpC1Rm
	4UR9pH9AUK9h15sDrQff0CdGqUqvJiCxUEp88Yf6QPiRDIRuXp3c3DL7/m7BQLVl
	JrrbQRFTtH7gKZ5Wz6m9DW6rRxJTnp5R4LPv87yqr9oCNm3EN8MnNbdUOIpJyNng
	1C9PH0F0/lFG91tesMaz1oETViSSodDKGOrLfuy9vllD8j1MJw4PQu+7mqT/H9kw
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45eu55sphd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 05:38:54 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52I4BjAD001076;
	Tue, 18 Mar 2025 05:38:54 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45dp3khxqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 05:38:54 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52I5crwj33358338
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Mar 2025 05:38:53 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 19E955805D;
	Tue, 18 Mar 2025 05:38:53 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D726F58057;
	Tue, 18 Mar 2025 05:38:47 +0000 (GMT)
Received: from [9.66.75.14] (unknown [9.66.75.14])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 18 Mar 2025 05:38:47 +0000 (GMT)
Message-ID: <67bff00d-eca7-41bd-ad9c-7ee6d5dac040@linux.ibm.com>
Date: Tue, 18 Mar 2025 11:08:45 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/11] Support page table check on PowerPC
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me
References: <20250211161404.850215-1-ajd@linux.ibm.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20250211161404.850215-1-ajd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9pxqW5-JFDH7ipa2HtNalmErx99yR2nv
X-Proofpoint-GUID: 9pxqW5-JFDH7ipa2HtNalmErx99yR2nv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_02,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1011 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503180037
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 2/11/25 9:43 PM, Andrew Donnellan wrote:
> Support page table check on all PowerPC platforms. This works by
> serialising assignments, reassignments and clears of page table
> entries at each level in order to ensure that anonymous mappings
> have at most one writable consumer, and likewise that file-backed
> mappings are not simultaneously also anonymous mappings.
> 
> In order to support this infrastructure, a number of stubs must be
> defined for all powerpc platforms. Additionally, seperate set_pte_at()
> and set_pte_at_unchecked(), to allow for internal, uninstrumented mappings.
> 
> (This series was written by Rohan McLure, who has left IBM and is no longer
> working on powerpc - I've taken far too long to pick this up and finally
> send it.)
> 

For powerpc changes
Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>

> v13:
>  * Rebase on mainline
>  * Don't use set_pte_at_unchecked() for early boot purposes (Pasha)
> 
> v12:
>  * Rename commits that revert changes to instead reflect that we are
>    reinstating old behaviour due to it providing more flexibility
>  * Add return line to pud_pfn() stub
>  * Instrument ptep_get_and_clear() for nohash
> Link: https://lore.kernel.org/linuxppc-dev/20240402051154.476244-1-rmclure@linux.ibm.com/
> 
> v11:
>  * The pud_pfn() stub, which previously had no legitimate users on any
>    powerpc platform, now has users in Book3s64 with transparent pages.
>    Include a stub of the same name for each platform that does not
>    define their own.
>  * Drop patch that standardised use of p*d_leaf(), as already included
>    upstream in v6.9.
>  * Provide fallback definitions of p{m,u}d_user_accessible_page() that
>    do not reference p*d_leaf(), p*d_pte(), as they are defined after
>    powerpc/mm headers by linux/mm headers.
>  * Ensure that set_pte_at_unchecked() has the same checks as
>    set_pte_at().
> Link: https://lore.kernel.org/linuxppc-dev/20240328045535.194800-14-rmclure@linux.ibm.com/ 
> 
> v10:
>  * Revert patches that removed address and mm parameters from page table
>    check routines, including consuming code from arm64, x86_64 and
>    riscv.
>  * Implement *_user_accessible_page() routines in terms of pte_user()
>    where available (64-bit, book3s) but otherwise by checking the
>    address (on platforms where the pte does not imply whether the
>    mapping is for user or kernel)
>  * Internal set_pte_at() calls replaced with set_pte_at_unchecked(), which
>    is identical, but prevents double instrumentation.
> Link: https://lore.kernel.org/linuxppc-dev/20240313042118.230397-9-rmclure@linux.ibm.com/T/
> 
> v9:
>  * Adapt to using the set_ptes() API, using __set_pte_at() where we need
>    must avoid instrumentation.
>  * Use the logic of *_access_permitted() for implementing
>    *_user_accessible_page(), which are required routines for page table
>    check.
>  * Even though we no longer need p{m,u,4}d_leaf(), still default
>    implement these to assist in refactoring out extant
>    p{m,u,4}_is_leaf().
>  * Add p{m,u}_pte() stubs where asm-generic does not provide them, as
>    page table check wants all *user_accessible_page() variants, and we
>    would like to default implement the variants in terms of
>    pte_user_accessible_page().
>  * Avoid the ugly pmdp_collapse_flush() macro nonsense! Just instrument
>    its constituent calls instead for radix and hash.
> Link: https://lore.kernel.org/linuxppc-dev/20231130025404.37179-2-rmclure@linux.ibm.com/
> 
> v8:
>  * Fix linux/page_table_check.h include in asm/pgtable.h breaking
>    32-bit.
> Link: https://lore.kernel.org/linuxppc-dev/20230215231153.2147454-1-rmclure@linux.ibm.com/
> 
> v7:
>  * Remove use of extern in set_pte prototypes
>  * Clean up pmdp_collapse_flush macro
>  * Replace set_pte_at with static inline function
>  * Fix commit message for patch 7
> Link: https://lore.kernel.org/linuxppc-dev/20230215020155.1969194-1-rmclure@linux.ibm.com/
> 
> v6:
>  * Support huge pages and p{m,u}d accounting.
>  * Remove instrumentation from set_pte from kernel internal pages.
>  * 64s: Implement pmdp_collapse_flush in terms of __pmdp_collapse_flush
>    as access to the mm_struct * is required.
> Link: https://lore.kernel.org/linuxppc-dev/20230214015939.1853438-1-rmclure@linux.ibm.com/
> 
> v5:
> Link: https://lore.kernel.org/linuxppc-dev/20221118002146.25979-1-rmclure@linux.ibm.com/
> 
> Rohan McLure (11):
>   mm/page_table_check: Reinstate address parameter in
>     [__]page_table_check_pud_set()
>   mm/page_table_check: Reinstate address parameter in
>     [__]page_table_check_pmd_set()
>   mm/page_table_check: Provide addr parameter to
>     page_table_check_pte_set()
>   mm/page_table_check: Reinstate address parameter in
>     [__]page_table_check_pud_clear()
>   mm/page_table_check: Reinstate address parameter in
>     [__]page_table_check_pmd_clear()
>   mm/page_table_check: Reinstate address parameter in
>     [__]page_table_check_pte_clear()
>   mm: Provide address parameter to p{te,md,ud}_user_accessible_page()
>   powerpc: mm: Add pud_pfn() stub
>   powerpc: mm: Implement *_user_accessible_page() for ptes
>   powerpc: mm: Use set_pte_at_unchecked() for internal usages
>   powerpc: mm: Support page table check
> 
>  arch/arm64/include/asm/pgtable.h             | 18 +++---
>  arch/powerpc/Kconfig                         |  1 +
>  arch/powerpc/include/asm/book3s/32/pgtable.h | 12 +++-
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 62 +++++++++++++++---
>  arch/powerpc/include/asm/nohash/pgtable.h    | 13 +++-
>  arch/powerpc/include/asm/pgtable.h           | 19 ++++++
>  arch/powerpc/mm/book3s64/hash_pgtable.c      |  4 ++
>  arch/powerpc/mm/book3s64/pgtable.c           | 17 +++--
>  arch/powerpc/mm/book3s64/radix_pgtable.c     |  9 ++-
>  arch/powerpc/mm/pgtable.c                    | 12 ++++
>  arch/riscv/include/asm/pgtable.h             | 18 +++---
>  arch/x86/include/asm/pgtable.h               | 20 +++---
>  include/linux/page_table_check.h             | 67 ++++++++++++--------
>  include/linux/pgtable.h                      | 10 +--
>  mm/page_table_check.c                        | 39 +++++++-----
>  15 files changed, 225 insertions(+), 96 deletions(-)
> 


