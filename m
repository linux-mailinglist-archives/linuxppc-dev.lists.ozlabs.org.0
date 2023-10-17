Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF71A7CD04B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 01:15:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=HxtKZKLs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S98wW6NX0z3cK8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 10:15:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=HxtKZKLs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=80.241.56.152; helo=mout-p-102.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S98vc47Q0z30NP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 10:14:51 +1100 (AEDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4S98vV5cBmz9sXg;
	Wed, 18 Oct 2023 01:14:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1697584486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cmtq4fWj5Rl8hlT+/wDd4j3/Uz9lprd8zFd/8pF1nPY=;
	b=HxtKZKLsmXiXc3pFtY43GBAEzKy09Otq7ByZ3x2MMcWctFaedNZJxCMReVUq0+VgnYehlx
	J99ULnk1lQtml6cJdQJWZNxnlVbuUgDNH6GRJ1oRd5sL6mhjusK4/7gEBNpN7OuPIbgfOW
	o7WRjdk5MGSNNH/UzePyoyKGqQqVtAW2YNVsu8LUoCTxm0IlWHal/iCL5MG0BMQqETyN4A
	8JhnRsCBX8iiDrAtM3C9fN11lKtxen6f9lQbS8exoYMRoRNzYkw2GquORS6/iAPC9ChEAn
	t0q7yqdgM+klxvv0EcFgZqTq4ZpDCeqV9jjt0Y7hFUr6LIsUgAQJ3LLH1GqCwA==
Date: Wed, 18 Oct 2023 01:14:43 +0200
From: Erhard Furtner <erhard_f@mailbox.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH 0/2] Allow nesting of lazy MMU mode
Message-ID: <20231018011443.3bd8b366@yea>
In-Reply-To: <875y35zswo.fsf@linux.ibm.com>
References: <20231012195415.282357-1-willy@infradead.org>
	<20231013154220.02fb2e6d@yea>
	<875y35zswo.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 99c3693f2065b8fe824
X-MBO-RS-META: dcbcmyejoc5m4xaoafkbxmyubyh5pkqz
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
Cc: Juergen Gross <jgross@suse.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-sparc@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 17 Oct 2023 11:34:23 +0530
"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:

> ie, we can do something like below. The change also make sure we call
> set_pte_filter on all the ptes we are setting via set_ptes(). I haven't
> sent this as a proper patch because we still are not able to fix the
> issue Erhard reported. 
> 
> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
> index 3ba9fe411604..95ab20cca2da 100644
> --- a/arch/powerpc/mm/pgtable.c
> +++ b/arch/powerpc/mm/pgtable.c
> @@ -191,28 +191,35 @@ void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
>  		pte_t pte, unsigned int nr)
>  {
>  	/*
> -	 * Make sure hardware valid bit is not set. We don't do
> -	 * tlb flush for this update.
> +	 * We don't need to call arch_enter/leave_lazy_mmu_mode()
> +	 * because we expect set_ptes to be only be used on not present
> +	 * and not hw_valid ptes. Hence there is not translation cache flush
> +	 * involved that need to be batched.
>  	 */
> -	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
> +	for (;;) {
>  
> -	/* Note: mm->context.id might not yet have been assigned as
> -	 * this context might not have been activated yet when this
> -	 * is called.
> -	 */
> -	pte = set_pte_filter(pte);
> +		/*
> +		 * Make sure hardware valid bit is not set. We don't do
> +		 * tlb flush for this update.
> +		 */
> +		VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
>  
> -	/* Perform the setting of the PTE */
> -	arch_enter_lazy_mmu_mode();
> -	for (;;) {
> +		/* Note: mm->context.id might not yet have been assigned as
> +		 * this context might not have been activated yet when this
> +		 * is called.
> +		 */
> +		pte = set_pte_filter(pte);
> +
> +		/* Perform the setting of the PTE */
>  		__set_pte_at(mm, addr, ptep, pte, 0);
>  		if (--nr == 0)
>  			break;
>  		ptep++;
> -		pte = __pte(pte_val(pte) + (1UL << PTE_RPN_SHIFT));
>  		addr += PAGE_SIZE;
> +		/* increment the pfn */
> +		pte = __pte(pte_val(pte) + PAGE_SIZE);
> +
>  	}
> -	arch_leave_lazy_mmu_mode();
>  }
>  
>  void unmap_kernel_page(unsigned long va)

Was this a new version of the patch for me to test? Sorry for asking but this was a bit unclear to me.

In any case I tried it on top of v6.6-rc6 and it did not help with the issue I reported.

Regards,
Erhard
