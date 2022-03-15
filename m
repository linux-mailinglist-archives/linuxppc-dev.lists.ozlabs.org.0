Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F084D9FEA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 17:22:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHzGM46mkz3bP6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 03:22:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VOEhXfV2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=gerald.schaefer@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VOEhXfV2; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHzFc1tbNz2xsb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 03:22:11 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22FGEQbg019652; 
 Tue, 15 Mar 2022 16:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=UW+pjKjsIWdwIjUe8EKCM7nF6A55i4kkxk6KEUWHHTw=;
 b=VOEhXfV24hITYknHaw/91LuBkl5CFArG8mxjFbgCMaObzXkpr8ceek5tHxjI0OQBtUEk
 8tCGGJ8saE0Ycxh/pGbhMujl/nzzGGRkoH8E67+Kg5MpPpv6SQsFUwu6Ue7Em/d1VsjL
 SRyNuSVTaBGZyUd6FNkzcYQ26+d18Br/wKuxZb14JpVnMBjL3dnPz3ZM2vBp1ycYMb/6
 A/bcSMWEa0Zgfeqcxp7kbTKb04ih3AdPtxsCdJbl3UJNxmYhLOBm+I6J322vwsZhTfci
 8aGv75kavHaK6ldEgH60zyuOQSE9jyk4PoZDaYC+wqSa3u4WT7uX8fshnnky85VjXo7/ 1A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3etvbmbbtx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 16:21:13 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22FGEq1i024701;
 Tue, 15 Mar 2022 16:21:13 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3etvbmbbs1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 16:21:12 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22FFxLUG017851;
 Tue, 15 Mar 2022 16:21:10 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3erk58p0g5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 16:21:10 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22FGL6rF27066832
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Mar 2022 16:21:06 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BC08AE055;
 Tue, 15 Mar 2022 16:21:06 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EE82AE045;
 Tue, 15 Mar 2022 16:21:04 +0000 (GMT)
Received: from thinkpad (unknown [9.171.6.24])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 15 Mar 2022 16:21:04 +0000 (GMT)
Date: Tue, 15 Mar 2022 17:21:02 +0100
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 5/7] s390/pgtable: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Message-ID: <20220315172102.771bd2cf@thinkpad>
In-Reply-To: <20220315141837.137118-6-david@redhat.com>
References: <20220315141837.137118-1-david@redhat.com>
 <20220315141837.137118-6-david@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eRCSI5w-tlE5sK1rQh4ufLQ4p6TxCS6h
X-Proofpoint-ORIG-GUID: 7RtkXXw2cQTrBuz4kjlLUBH_amFhVLPx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-15_03,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1011 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203150102
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

On Tue, 15 Mar 2022 15:18:35 +0100
David Hildenbrand <david@redhat.com> wrote:

> Let's steal one bit from the offset. While at it, document the meaning
> of bit 62 for swap ptes.

You define _PAGE_SWP_EXCLUSIVE as _PAGE_LARGE, which is bit 52, and
this is not part of the swap pte offset IIUC. So stealing any bit might
actually not be necessary, see below.

Also, bit 62 should be the soft dirty bit for normal PTEs, and this
doesn't seem to be used for swap PTEs at all. But I might be missing
some use case where softdirty also needs to be preserved in swap PTEs.

> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  arch/s390/include/asm/pgtable.h | 37 ++++++++++++++++++++++++++-------
>  1 file changed, 30 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
> index 008a6c856fa4..c182212a2b44 100644
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
> @@ -796,6 +798,24 @@ static inline int pmd_protnone(pmd_t pmd)
>  }
>  #endif
>  
> +#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
> +static inline pte_t pte_swp_mkexclusive(pte_t pte)
> +{
> +	pte_val(pte) |= _PAGE_SWP_EXCLUSIVE;
> +	return pte;
> +}
> +
> +static inline int pte_swp_exclusive(pte_t pte)
> +{
> +	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
> +}
> +
> +static inline pte_t pte_swp_clear_exclusive(pte_t pte)
> +{
> +	pte_val(pte) &= ~_PAGE_SWP_EXCLUSIVE;
> +	return pte;
> +}
> +
>  static inline int pte_soft_dirty(pte_t pte)
>  {
>  	return pte_val(pte) & _PAGE_SOFT_DIRTY;
> @@ -1675,16 +1695,19 @@ static inline int has_transparent_hugepage(void)
>   * information in the lowcore.
>   * Bits 54 and 63 are used to indicate the page type.
>   * A swap pte is indicated by bit pattern (pte & 0x201) == 0x200
> - * This leaves the bits 0-51 and bits 56-62 to store type and offset.
> - * We use the 5 bits from 57-61 for the type and the 52 bits from 0-51
> + * This leaves the bits 0-50 and bits 56-61 to store type and offset.
> + * We use the 5 bits from 57-61 for the type and the 51 bits from 0-50
>   * for the offset.
> - * |			  offset			|01100|type |00|
> - * |0000000000111111111122222222223333333333444444444455|55555|55566|66|
> - * |0123456789012345678901234567890123456789012345678901|23456|78901|23|
> + * |			  offset		       |E|01100|type |S0|
> + * |000000000011111111112222222222333333333344444444445|5|55555|55566|66|
> + * |012345678901234567890123456789012345678901234567890|1|23456|78901|23|
> + *
> + * S (bit 62) is used for softdirty tracking.

Unless there is some use for softdirty tracking in swap PTEs, I think
this description does not belong here, to the swap PTE layout.

> + * E (bit 51) is used to remember PG_anon_exclusive.

It is bit 52, at least with this patch, so I guess this could all be
done w/o stealing anything. That is, of course, only if it is allowed
to use bit 52 in this case. The POP says bit 52 has to be 0, or else
a "translation-specification exception" is recognized. However, I think
it could be OK for PTEs marked as invalid, like it is the case for swap
PTEs.

The comment here says at the beginning:
/*
 * 64 bit swap entry format:
 * A page-table entry has some bits we have to treat in a special way.
 * Bits 52 and bit 55 have to be zero, otherwise a specification
 * exception will occur instead of a page translation exception. The
 * specification exception has the bad habit not to store necessary
 * information in the lowcore.

This would mean that it is not OK to have bit 52 not zero for swap PTEs.
But if I read the POP correctly, all bits except for the DAT-protection
would be ignored for invalid PTEs, so maybe this comment needs some update
(for both bits 52 and also 55).

Heiko might also have some more insight.

Anyway, stealing bit 51 might still be an option, but then
_PAGE_SWP_EXCLUSIVE would need to be defined appropriately.
