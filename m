Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B7F7BBA08
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 16:13:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=OrWZqOUE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S29Pt0mDrz3vXq
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Oct 2023 01:13:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=OrWZqOUE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=80.241.56.172; helo=mout-p-202.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S29Nw1QrZz3cQ4
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Oct 2023 01:12:29 +1100 (AEDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4S29Nk1Wqtz9scV;
	Fri,  6 Oct 2023 16:12:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1696601542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5GjiqfrAVgxE/vjMsQHug29ldIkOVV702xSHzw/GA+g=;
	b=OrWZqOUEzTw/hhTVf31S/j2gDx4iqvA3QGpEXTfXmvRAyf7QV9RQa13DcrbYWE+GQjLzQL
	MU8+WkE2acpy4WS/aNLEs6M9dcFh9O29QypHRJGf9/Gx+WAfEv9XwU4sHaF/56x2sHHQ//
	lZxJ3q1Mv0AKyC7X45J6fp5TB+blmUfCHEfyh1HJTqtnBEuPjUQlG8S5Na8xjLHSjVS3Pb
	Kj+h/gG7vVzzVEfBdQjWQ2BXqtKO2MqNe3FTepqMb5JRNJ3sEeKlNMyW+WdUZRMdAxQPIB
	Gse0oV+2816hF90C0MJIEG9A5EFyBUyEsE6ggA5N0npufxHtRZ/B1qmzeCykfg==
Date: Fri, 6 Oct 2023 16:12:19 +0200
From: Erhard Furtner <erhard_f@mailbox.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [Bisected] PowerMac G5 fails booting kernel 6.6-rc3 (BUG:
 Unable to handle kernel data access at 0xfeffbb62ffec65fe)
Message-ID: <20231006161219.68bd2631@yea>
In-Reply-To: <87mswwnec1.fsf@linux.ibm.com>
References: <20230929132750.3cd98452@yea>
	<87sf6onwko.fsf@linux.ibm.com>
	<20231006124548.54d4b7a8@yea>
	<87mswwnec1.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 204a4096ddcd665029b
X-MBO-RS-META: tshg1yti1gpxxqtd8fnrqeydzw3u1snn
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
Cc: linuxppc-dev@lists.ozlabs.org, willy@infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 06 Oct 2023 17:38:14 +0530
"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:

> Sorry that I shared a change without build testing.  Here is the updated change
> 
> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
> index 3ba9fe411604..e563e13ffd88 100644
> --- a/arch/powerpc/mm/pgtable.c
> +++ b/arch/powerpc/mm/pgtable.c
> @@ -190,29 +190,28 @@ static pte_t set_access_flags_filter(pte_t pte, struct vm_area_struct *vma,
>  void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
>  		pte_t pte, unsigned int nr)
>  {
> -	/*
> -	 * Make sure hardware valid bit is not set. We don't do
> -	 * tlb flush for this update.
> -	 */
> -	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
> -
> -	/* Note: mm->context.id might not yet have been assigned as
> -	 * this context might not have been activated yet when this
> -	 * is called.
> -	 */
> -	pte = set_pte_filter(pte);
> -
>  	/* Perform the setting of the PTE */
> -	arch_enter_lazy_mmu_mode();
>  	for (;;) {
> +
> +		/*
> +		 * Make sure hardware valid bit is not set. We don't do
> +		 * tlb flush for this update.
> +		 */
> +		VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
> +
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
>  	}
> -	arch_leave_lazy_mmu_mode();
>  }
>  
>  void unmap_kernel_page(unsigned long va)

It applies cleanly on top of 6.6-rc4 but it doesn't work out.

I get the same Call Trace and very similar dmesg output like I posted in my last email.

Regards,
Erhard
