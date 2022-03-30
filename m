Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C32A24ECA07
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 18:51:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTC9x4ZzKz3c4r
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 03:51:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KRzoQsD6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gerald.schaefer@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KRzoQsD6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTC8V07cfz2ym7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 03:49:45 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22UEJLVv000462; 
 Wed, 30 Mar 2022 16:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=ARroIKBEvmL0KWXtnhmovWMBp2q8g4z6TFYDyygKASk=;
 b=KRzoQsD6PJq2G9kFzeRvUWII/EaOj8gNOezSHce7EUZzHFJYk8L3G7wMnqGHNUaYfBNZ
 tT0FrChzyFQQSOXdgfU4DqvUD21YnmntRVYIC5IoyJg9VaRBFvlEYjukvXmUyzAhVxAn
 eMHsoKuTPyn86zO1kum0w5/jhuBrdbbRmVLBCgTbugi2inIVv+Lh9lveTdlhj2B4rF+G
 vKb0KVbDWuGazpQt07aaINJeZRoiflDfzHQKUKmaAuQy6etr7v7t/qU/rxACRWa/n3oH
 Xn89v9c9Zfb2LM8sl55NZrAtVgRVU1tUgDpdpMqudv2KtvdBHywKKNEcBU38h19oPPbK uA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f4psu6gut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 16:48:56 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22UGfnPq005888;
 Wed, 30 Mar 2022 16:48:55 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f4psu6gtv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 16:48:55 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22UGhWGn024601;
 Wed, 30 Mar 2022 16:48:52 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3f3rs3m0ep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 16:48:52 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22UGmnpC41288138
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 16:48:49 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 095B14C046;
 Wed, 30 Mar 2022 16:48:49 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B3654C040;
 Wed, 30 Mar 2022 16:48:47 +0000 (GMT)
Received: from thinkpad (unknown [9.171.11.24])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 30 Mar 2022 16:48:47 +0000 (GMT)
Date: Wed, 30 Mar 2022 18:48:45 +0200
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 6/8] s390/pgtable: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Message-ID: <20220330184845.737efc45@thinkpad>
In-Reply-To: <20220329164329.208407-7-david@redhat.com>
References: <20220329164329.208407-1-david@redhat.com>
 <20220329164329.208407-7-david@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1QKLcZzt1jR5dzZvoETLyjNRF1Mo4qOd
X-Proofpoint-GUID: R2QabvWqUvukurysdgE-o4H0cb3QiG1t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_06,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 clxscore=1011 suspectscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203300081
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
Cc: x86@kernel.org, Jan Kara <jack@suse.cz>,
 Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Donald Dutile <ddutile@redhat.com>, Liang Zhang <zhangliang5@huawei.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Paul Mackerras <paulus@samba.org>, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Jason Gunthorpe <jgg@nvidia.com>, David Rientjes <rientjes@google.com>,
 Pedro Gomes <pedrodemargomes@gmail.com>, Jann Horn <jannh@google.com>,
 John Hubbard <jhubbard@nvidia.com>, Heiko Carstens <hca@linux.ibm.com>,
 Shakeel Butt <shakeelb@google.com>, Oleg Nesterov <oleg@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Oded Gabbay <oded.gabbay@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Nadav Amit <namit@vmware.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 29 Mar 2022 18:43:27 +0200
David Hildenbrand <david@redhat.com> wrote:

> Let's use bit 52, which is unused.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  arch/s390/include/asm/pgtable.h | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
> index 3982575bb586..a397b072a580 100644
> --- a/arch/s390/include/asm/pgtable.h
> +++ b/arch/s390/include/asm/pgtable.h
> @@ -181,6 +181,8 @@ static inline int is_module_addr(void *addr)
>  #define _PAGE_SOFT_DIRTY 0x000
>  #endif
>  
> +#define _PAGE_SWP_EXCLUSIVE _PAGE_LARGE	/* SW pte exclusive swap bit */
> +
>  /* Set of bits not changed in pte_modify */
>  #define _PAGE_CHG_MASK		(PAGE_MASK | _PAGE_SPECIAL | _PAGE_DIRTY | \
>  				 _PAGE_YOUNG | _PAGE_SOFT_DIRTY)
> @@ -826,6 +828,22 @@ static inline int pmd_protnone(pmd_t pmd)
>  }
>  #endif
>  
> +#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
> +static inline int pte_swp_exclusive(pte_t pte)
> +{
> +	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
> +}
> +
> +static inline pte_t pte_swp_mkexclusive(pte_t pte)
> +{
> +	return set_pte_bit(pte, __pgprot(_PAGE_SWP_EXCLUSIVE));
> +}
> +
> +static inline pte_t pte_swp_clear_exclusive(pte_t pte)
> +{
> +	return clear_pte_bit(pte, __pgprot(_PAGE_SWP_EXCLUSIVE));
> +}
> +
>  static inline int pte_soft_dirty(pte_t pte)
>  {
>  	return pte_val(pte) & _PAGE_SOFT_DIRTY;
> @@ -1715,14 +1733,15 @@ static inline int has_transparent_hugepage(void)
>   * Bits 54 and 63 are used to indicate the page type. Bit 53 marks the pte
>   * as invalid.
>   * A swap pte is indicated by bit pattern (pte & 0x201) == 0x200
> - * |			  offset			|X11XX|type |S0|
> + * |			  offset			|E11XX|type |S0|
>   * |0000000000111111111122222222223333333333444444444455|55555|55566|66|
>   * |0123456789012345678901234567890123456789012345678901|23456|78901|23|
>   *
>   * Bits 0-51 store the offset.
> + * Bit 52 (E) is used to remember PG_anon_exclusive.
>   * Bits 57-61 store the type.
>   * Bit 62 (S) is used for softdirty tracking.
> - * Bits 52, 55 and 56 (X) are unused.
> + * Bits 55 and 56 (X) are unused.
>   */
>  
>  #define __SWP_OFFSET_MASK	((1UL << 52) - 1)

Thanks David!

Reviewed-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
