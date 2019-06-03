Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B66AB328B4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 08:44:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HQX927YdzDqQM
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 16:44:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HQVt1WgSzDqNN
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 16:43:32 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x536gNpD113809
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 3 Jun 2019 02:43:29 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2svwak2qgb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2019 02:43:29 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Mon, 3 Jun 2019 07:43:28 +0100
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 3 Jun 2019 07:43:26 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x536hPnd41615626
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Jun 2019 06:43:25 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F918AC059;
 Mon,  3 Jun 2019 06:43:25 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85164AC062;
 Mon,  3 Jun 2019 06:43:24 +0000 (GMT)
Received: from [9.124.35.135] (unknown [9.124.35.135])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  3 Jun 2019 06:43:24 +0000 (GMT)
Subject: Re: [PATCH] powerpc/64s: Fix THP PMD collapse serialisation
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20190603060531.13088-1-npiggin@gmail.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Date: Mon, 3 Jun 2019 12:13:23 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190603060531.13088-1-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19060306-0072-0000-0000-00000436A88D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011207; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01212514; UDB=6.00637209; IPR=6.00993574; 
 MB=3.00027161; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-03 06:43:27
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060306-0073-0000-0000-00004C76EE49
Message-Id: <bb7eabc7-8dbb-14e9-f797-6dfd339bb0ba@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-03_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906030049
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/3/19 11:35 AM, Nicholas Piggin wrote:
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
> Fixes: 1b2443a547f9 ("powerpc/book3s64: Avoid multiple endian conversion in pte helpers")
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/book3s/64/pgtable.h | 19 ++++++++++++++++++-
>   arch/powerpc/mm/book3s64/pgtable.c           |  3 +++
>   2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index 7dede2e34b70..aaa72aa1b765 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -1092,7 +1092,24 @@ static inline int pmd_protnone(pmd_t pmd)
>   #define pmd_access_permitted pmd_access_permitted
>   static inline bool pmd_access_permitted(pmd_t pmd, bool write)
>   {
> -	return pte_access_permitted(pmd_pte(pmd), write);
> +	pte_t pte = pmd_pte(pmd);
> +	unsigned long pteval = pte_val(pte);
> +
> +	/*
> +	 * pmdp_invalidate sets this combination (that is not caught by
> +	 * !pte_present() check in pte_access_permitted), to prevent
> +	 * lock-free lookups, as part of the serialize_against_pte_lookup()
> +	 * synchronisation.
> +	 *
> +	 * This check inadvertently catches the case where the PTE's hardware
> +	 * PRESENT bit is cleared while TLB is flushed, to work around
> +	 * hardware TLB issues. This is suboptimal, but should not be hit
> +	 * frequently and should be harmless.
> +	 */
> +	if ((pteval & _PAGE_INVALID) && !(pteval & _PAGE_PRESENT))
> +		return false;
> +
> +	return pte_access_permitted(pte, write);
>   }
>   


you need to do similar for other lockless page table walk like 
find_linux_pte

>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> index 16bda049187a..ff98b663c83e 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -116,6 +116,9 @@ pmd_t pmdp_invalidate(struct vm_area_struct *vma, unsigned long address,
>   	/*
>   	 * This ensures that generic code that rely on IRQ disabling
>   	 * to prevent a parallel THP split work as expected.
> +	 *
> +	 * Marking the entry with _PAGE_INVALID && ~_PAGE_PRESENT requires
> +	 * a special case check in pmd_access_permitted.
>   	 */
>   	serialize_against_pte_lookup(vma->vm_mm);
>   	return __pmd(old_pmd);
> 


-anesh

