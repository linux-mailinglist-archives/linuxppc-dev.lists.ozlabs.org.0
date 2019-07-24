Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C34FC72C09
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 12:05:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45trZM3SM9zDqNy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 20:05:31 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45trS73Rg9zDqNf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 20:00:07 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6O9rJrB017805
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 06:00:05 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2txmrds578-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 06:00:04 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Wed, 24 Jul 2019 11:00:01 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 24 Jul 2019 10:59:59 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x6O9xhqZ40698150
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jul 2019 09:59:43 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FECE4C040;
 Wed, 24 Jul 2019 09:59:58 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE1614C04E;
 Wed, 24 Jul 2019 09:59:56 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.44.139])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 24 Jul 2019 09:59:56 +0000 (GMT)
X-Mailer: emacs 26.2 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 5/5] powerpc/64s/radix: Remove redundant pfn_pte bitop,
 add VM_BUG_ON
In-Reply-To: <20190724084638.24982-5-npiggin@gmail.com>
References: <20190724084638.24982-1-npiggin@gmail.com>
 <20190724084638.24982-5-npiggin@gmail.com>
Date: Wed, 24 Jul 2019 15:29:55 +0530
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19072410-0012-0000-0000-00000335AE49
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072409-0013-0000-0000-0000216F41AD
Message-Id: <877e87n46c.fsf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-24_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907240109
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
Cc: Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> pfn_pte is never given a pte above the addressable physical memory
> limit, so the masking is redundant. In case of a software bug, it
> is not obviously better to silently truncate the pfn than to corrupt
> the pte (either one will result in memory corruption or crashes),
> so there is no reason to add this to the fast path.
>
> Add VM_BUG_ON to catch cases where the pfn is invalid. These would
> catch the create_section_mapping bug fixed by a previous commit.
>
>   [16885.256466] ------------[ cut here ]------------
>   [16885.256492] kernel BUG at arch/powerpc/include/asm/book3s/64/pgtable.h:612!
>   cpu 0x0: Vector: 700 (Program Check) at [c0000000ee0a36d0]
>       pc: c000000000080738: __map_kernel_page+0x248/0x6f0
>       lr: c000000000080ac0: __map_kernel_page+0x5d0/0x6f0
>       sp: c0000000ee0a3960
>      msr: 9000000000029033
>     current = 0xc0000000ec63b400
>     paca    = 0xc0000000017f0000   irqmask: 0x03   irq_happened: 0x01
>       pid   = 85, comm = sh
>   kernel BUG at arch/powerpc/include/asm/book3s/64/pgtable.h:612!
>   Linux version 5.3.0-rc1-00001-g0fe93e5f3394
>   enter ? for help
>   [c0000000ee0a3a00] c000000000d37378 create_physical_mapping+0x260/0x360
>   [c0000000ee0a3b10] c000000000d370bc create_section_mapping+0x1c/0x3c
>   [c0000000ee0a3b30] c000000000071f54 arch_add_memory+0x74/0x130
>

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index 8308f32e9782..8e47fb85dfa6 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -608,8 +608,10 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
>   */
>  static inline pte_t pfn_pte(unsigned long pfn, pgprot_t pgprot)
>  {
> -	return __pte((((pte_basic_t)(pfn) << PAGE_SHIFT) & PTE_RPN_MASK) |
> -		     pgprot_val(pgprot));
> +	VM_BUG_ON(pfn >> (64 - PAGE_SHIFT));
> +	VM_BUG_ON((pfn << PAGE_SHIFT) & ~PTE_RPN_MASK);
> +
> +	return __pte(((pte_basic_t)pfn << PAGE_SHIFT) | pgprot_val(pgprot));
>  }
>  
>  static inline unsigned long pte_pfn(pte_t pte)
> -- 
> 2.22.0

