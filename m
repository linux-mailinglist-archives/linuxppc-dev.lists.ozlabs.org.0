Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F34D7AACC7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 10:37:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsQcr3H0cz3dfr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 18:37:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ghiti.fr (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org)
X-Greylist: delayed 1198 seconds by postgrey-1.37 at boromir; Fri, 22 Sep 2023 18:14:47 AEST
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsQ6b0N95z3ht6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 18:14:46 +1000 (AEST)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 3045CD3FD8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 07:54:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 51B81FF809;
	Fri, 22 Sep 2023 07:54:21 +0000 (UTC)
Message-ID: <7bbceed4-c5f6-42d4-5d94-060032b73385@ghiti.fr>
Date: Fri, 22 Sep 2023 09:54:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 3/8] riscv: hugetlb: Convert set_huge_pte_at() to take
 vma
Content-Language: en-US
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>,
 Mike Kravetz <mike.kravetz@oracle.com>, Muchun Song <muchun.song@linux.dev>,
 SeongJae Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Lorenzo Stoakes <lstoakes@gmail.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Peter Xu <peterx@redhat.com>,
 Axel Rasmussen <axelrasmussen@google.com>,
 Qi Zheng <zhengqi.arch@bytedance.com>
References: <20230921162007.1630149-1-ryan.roberts@arm.com>
 <20230921162007.1630149-4-ryan.roberts@arm.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230921162007.1630149-4-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: alex@ghiti.fr
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
Cc: linux-s390@vger.kernel.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ryan,

On 21/09/2023 18:20, Ryan Roberts wrote:
> In order to fix a bug, arm64 needs access to the vma inside it's
> implementation of set_huge_pte_at(). Provide for this by converting the
> mm parameter to be a vma. Any implementations that require the mm can
> access it via vma->vm_mm.
>
> This commit makes the required riscv modifications. Separate commits
> update the other arches and core code, before the actual bug is fixed in
> arm64.
>
> No behavioral changes intended.
>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>   arch/riscv/include/asm/hugetlb.h | 2 +-
>   arch/riscv/mm/hugetlbpage.c      | 3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
> index 34e24f078cc1..be1ac8582bc2 100644
> --- a/arch/riscv/include/asm/hugetlb.h
> +++ b/arch/riscv/include/asm/hugetlb.h
> @@ -17,7 +17,7 @@ void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
>   		    pte_t *ptep, unsigned long sz);
>   
>   #define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
> -void set_huge_pte_at(struct mm_struct *mm,
> +void set_huge_pte_at(struct vm_area_struct *vma,
>   		     unsigned long addr, pte_t *ptep, pte_t pte);
>   
>   #define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
> diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
> index 96225a8533ad..7cdbf0960772 100644
> --- a/arch/riscv/mm/hugetlbpage.c
> +++ b/arch/riscv/mm/hugetlbpage.c
> @@ -177,11 +177,12 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
>   	return entry;
>   }
>   
> -void set_huge_pte_at(struct mm_struct *mm,
> +void set_huge_pte_at(struct vm_area_struct *vma,
>   		     unsigned long addr,
>   		     pte_t *ptep,
>   		     pte_t pte)
>   {
> +	struct mm_struct *mm = vma->vm_mm;
>   	int i, pte_num;
>   
>   	if (!pte_napot(pte)) {


You can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

I realize that we may have the same issue with our contig pte 
implementation (called napot in riscv) as we don't handle swap/migration 
entries at all. So I guess we need something similar, and I'll implement 
it (unless you want to do it of course, but I guess it's easier for me 
to test). One (maybe stupid) question though: wouldn't it be possible to 
extract the contig pte size from the value of ptep instead of using a vma?

Thanks,

Alex

