Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5588383C6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 07:37:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Krs04c4DzDqDc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 15:37:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Krpn2RC7zDqtd
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 15:35:44 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x575WUjO001622
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 7 Jun 2019 01:35:41 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sygs6tqca-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Jun 2019 01:35:41 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Fri, 7 Jun 2019 06:35:39 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 7 Jun 2019 06:35:38 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x575ZbLK29557098
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jun 2019 05:35:37 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D196AE04D;
 Fri,  7 Jun 2019 05:35:37 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABE6FAE045;
 Fri,  7 Jun 2019 05:35:36 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.124.35.207])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jun 2019 05:35:36 +0000 (GMT)
X-Mailer: emacs 26.2 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/2] powerpc/64s: Fix THP PMD collapse serialisation
In-Reply-To: <20190607035636.5446-1-npiggin@gmail.com>
References: <20190607035636.5446-1-npiggin@gmail.com>
Date: Fri, 07 Jun 2019 11:05:35 +0530
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19060705-0008-0000-0000-000002F11C47
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060705-0009-0000-0000-0000225E0B1E
Message-Id: <87zhmuez4o.fsf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-07_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906070039
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Commit 1b2443a547f9 ("powerpc/book3s64: Avoid multiple endian conversion
> in pte helpers") changed the actual bitwise tests in pte_access_permitted
> by using pte_write() and pte_present() helpers rather than raw bitwise
> testing _PAGE_WRITE and _PAGE_PRESENT bits.
>
> The pte_present change now returns true for ptes which are !_PAGE_PRESENT
> and _PAGE_INVALID, which is the combination used by pmdp_invalidate to
> synchronize access from lock-free lookups. pte_access_permitted is used by
> pmd_access_permitted, so allowing GUP lock free access to proceed with
> such PTEs breaks this synchronisation.
>
> This bug has been observed on HPT host, with random crashes and corruption
> in guests, usually together with bad PMD messages in the host.
>
> Fix this by adding an explicit check in pmd_access_permitted, and
> documenting the condition explicitly.
>
> The pte_write() change should be okay, and would prevent GUP from falling
> back to the slow path when encountering savedwrite ptes, which matches
> what x86 (that does not implement savedwrite) does.
>

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

> Fixes: 1b2443a547f9 ("powerpc/book3s64: Avoid multiple endian conversion in pte helpers")
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>
> I accounted for Aneesh's and Christophe's feedback, except I couldn't
> find a good way to replace the ifdef with IS_ENABLED because of
> _PAGE_INVALID etc., but at least cleaned that up a bit nicer.
>
> Patch 1 solves a problem I can hit quite reliably running HPT/HPT KVM.
> Patch 2 was noticed by Aneesh when inspecting code for similar bugs.
> They should probably both be merged in stable kernels after upstream.
>
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 30 ++++++++++++++++++++
>  arch/powerpc/mm/book3s64/pgtable.c           |  3 ++
>  2 files changed, 33 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index 7dede2e34b70..ccf00a8b98c6 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -876,6 +876,23 @@ static inline int pmd_present(pmd_t pmd)
>  	return false;
>  }
>  
> +static inline int pmd_is_serializing(pmd_t pmd)
> +{
> +	/*
> +	 * If the pmd is undergoing a split, the _PAGE_PRESENT bit is clear
> +	 * and _PAGE_INVALID is set (see pmd_present, pmdp_invalidate).
> +	 *
> +	 * This condition may also occur when flushing a pmd while flushing
> +	 * it (see ptep_modify_prot_start), so callers must ensure this
> +	 * case is fine as well.
> +	 */
> +	if ((pmd_raw(pmd) & cpu_to_be64(_PAGE_PRESENT | _PAGE_INVALID)) ==
> +						cpu_to_be64(_PAGE_INVALID))
> +		return true;
> +
> +	return false;
> +}
> +
>  static inline int pmd_bad(pmd_t pmd)
>  {
>  	if (radix_enabled())
> @@ -1092,6 +1109,19 @@ static inline int pmd_protnone(pmd_t pmd)
>  #define pmd_access_permitted pmd_access_permitted
>  static inline bool pmd_access_permitted(pmd_t pmd, bool write)
>  {
> +	/*
> +	 * pmdp_invalidate sets this combination (which is not caught by
> +	 * !pte_present() check in pte_access_permitted), to prevent
> +	 * lock-free lookups, as part of the serialize_against_pte_lookup()
> +	 * synchronisation.
> +	 *
> +	 * This also catches the case where the PTE's hardware PRESENT bit is
> +	 * cleared while TLB is flushed, which is suboptimal but should not
> +	 * be frequent.
> +	 */
> +	if (pmd_is_serializing(pmd))
> +		return false;
> +
>  	return pte_access_permitted(pmd_pte(pmd), write);
>  }
>  
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> index 16bda049187a..ff98b663c83e 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -116,6 +116,9 @@ pmd_t pmdp_invalidate(struct vm_area_struct *vma, unsigned long address,
>  	/*
>  	 * This ensures that generic code that rely on IRQ disabling
>  	 * to prevent a parallel THP split work as expected.
> +	 *
> +	 * Marking the entry with _PAGE_INVALID && ~_PAGE_PRESENT requires
> +	 * a special case check in pmd_access_permitted.
>  	 */
>  	serialize_against_pte_lookup(vma->vm_mm);
>  	return __pmd(old_pmd);
> -- 
> 2.20.1

