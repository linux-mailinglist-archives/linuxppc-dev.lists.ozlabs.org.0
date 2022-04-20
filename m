Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 498D3508E59
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 19:22:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kk6tm0xycz3bbB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Apr 2022 03:22:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=K7U7yAPV;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=NwzWMKJR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=vbabka@suse.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256
 header.s=susede2_rsa header.b=K7U7yAPV; 
 dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=NwzWMKJR; 
 dkim-atps=neutral
X-Greylist: delayed 465 seconds by postgrey-1.36 at boromir;
 Thu, 21 Apr 2022 03:22:04 AEST
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kk6t448Bhz2xh0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Apr 2022 03:22:04 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 53D461F380;
 Wed, 20 Apr 2022 17:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1650474856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cCyVaEehkrahTF4ZZE0t6pBOtUmw5LLz8/1wxeHDxX4=;
 b=K7U7yAPVtWoeKBCvI9IM0SUrBd3SuNQlXwbO69YYMvu/uQgJCBHLxvJUvYDJUM+CzMgGQE
 RVSlZxkoXhp1TqU71hUtulLocxn+2wyVtaobkUyEwzAopoea+zPD+x5OcZ/P14F7mUWQ0X
 9jy/5tEGm6a4qWbujDTO1fyNpFdYlOg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1650474856;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cCyVaEehkrahTF4ZZE0t6pBOtUmw5LLz8/1wxeHDxX4=;
 b=NwzWMKJRWqBiYsMEpHY2LSE0kR5L5AsWQDr46B/AzDDh+7ae+1bOHK7cbVF3M3crtt+AoJ
 6QSH0t6rY1IUvWBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9E94C13A30;
 Wed, 20 Apr 2022 17:14:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cLLMJWc/YGJFYAAAMHmgww
 (envelope-from <vbabka@suse.cz>); Wed, 20 Apr 2022 17:14:15 +0000
Message-ID: <e1b61853-143a-3691-2e6d-4fea5c049562@suse.cz>
Date: Wed, 20 Apr 2022 19:14:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/8] mm/debug_vm_pgtable: add tests for
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20220329164329.208407-1-david@redhat.com>
 <20220329164329.208407-3-david@redhat.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20220329164329.208407-3-david@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
 Ingo Molnar <mingo@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 David Rientjes <rientjes@google.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Pedro Gomes <pedrodemargomes@gmail.com>, Jann Horn <jannh@google.com>,
 John Hubbard <jhubbard@nvidia.com>, Heiko Carstens <hca@linux.ibm.com>,
 Shakeel Butt <shakeelb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Oded Gabbay <oded.gabbay@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Oleg Nesterov <oleg@redhat.com>,
 Nadav Amit <namit@vmware.com>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/29/22 18:43, David Hildenbrand wrote:
> Let's test that __HAVE_ARCH_PTE_SWP_EXCLUSIVE works as expected.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Vlastimil Babka <vbabka@suse.cz>

> ---
>  mm/debug_vm_pgtable.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index db2abd9e415b..55f1a8dc716f 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -837,6 +837,19 @@ static void __init pmd_soft_dirty_tests(struct pgtable_debug_args *args) { }
>  static void __init pmd_swap_soft_dirty_tests(struct pgtable_debug_args *args) { }
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>  
> +static void __init pte_swap_exclusive_tests(struct pgtable_debug_args *args)
> +{
> +#ifdef __HAVE_ARCH_PTE_SWP_EXCLUSIVE
> +	pte_t pte = pfn_pte(args->fixed_pte_pfn, args->page_prot);
> +
> +	pr_debug("Validating PTE swap exclusive\n");
> +	pte = pte_swp_mkexclusive(pte);
> +	WARN_ON(!pte_swp_exclusive(pte));

I guess only this WARN_ON must be guarded by the #ifdef, but doesn't matter
that much - won't gain significantly more test coverage.

> +	pte = pte_swp_clear_exclusive(pte);
> +	WARN_ON(pte_swp_exclusive(pte));
> +#endif /* __HAVE_ARCH_PTE_SWP_EXCLUSIVE */
> +}
> +
>  static void __init pte_swap_tests(struct pgtable_debug_args *args)
>  {
>  	swp_entry_t swp;
> @@ -1288,6 +1301,8 @@ static int __init debug_vm_pgtable(void)
>  	pte_swap_soft_dirty_tests(&args);
>  	pmd_swap_soft_dirty_tests(&args);
>  
> +	pte_swap_exclusive_tests(&args);
> +
>  	pte_swap_tests(&args);
>  	pmd_swap_tests(&args);
>  

