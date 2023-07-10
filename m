Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEB474DF2E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 22:25:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=FOqO3cdm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0Fqv38Hkz3c4V
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 06:25:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0Fps1Cd7z3bhr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 06:24:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=G0ut9Msx8avXgkOpqAa+A7Dar6d8OWfnht1FICkF8CU=; b=FOqO3cdm12VAe6nUmn7GX8ljm1
	IVWHYgztJseuOAdpb0Kl7UTesY1zGNKYMs5e5EBFqrZ0ooTqGXwH4QeLUQbdv8JXL7fENKqEe6VjM
	SQXo/iyUUboIV1vXsJOTyGvNvvsYwJ5gWy8hUjxBQylojeQqUVVDk4Ovc3cmoCOmdphg5mAVEP7Uf
	kRZ+dXmJA1uRht41tVmc5AzHGP5F+rFYYcIAo7BH8Z6T/u7Q9ThfhPZILyYI1SpBKAx3x4ScvmVJX
	IrVLMuAKMIcKwmG/6tZECnJSU/lD3HpvUDf7IhlthMI3jSUs6ymuZ6XM25REdQ3J2tYwnjueQOVet
	T7JE38Vg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qIxQd-00Etrn-OE; Mon, 10 Jul 2023 20:24:15 +0000
Date: Mon, 10 Jul 2023 21:24:15 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v4 20/36] powerpc: Implement the new page table range API
Message-ID: <ZKxo79JYjEvMGAW3@casper.infradead.org>
References: <20230315051444.3229621-1-willy@infradead.org>
 <20230315051444.3229621-21-willy@infradead.org>
 <1743d96f-8efe-0127-2cae-7368ce0eb2e6@csgroup.eu>
 <c7f08247-8bcd-184c-5e06-91f91257f1f6@csgroup.eu>
 <ZBPizB6TmDp0psOl@casper.infradead.org>
 <eb8ad2f2-06ae-4daf-5163-11b950e640ad@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb8ad2f2-06ae-4daf-5163-11b950e640ad@csgroup.eu>
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 18, 2023 at 09:19:04AM +0000, Christophe Leroy wrote:
> void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
> 		pte_t pte, unsigned int nr)
> {
> 	pgprot_t prot;
> 	unsigned long pfn;
> 	/*
> 	 * Make sure hardware valid bit is not set. We don't do
> 	 * tlb flush for this update.
> 	 */
> 	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
> 
> 	/* Note: mm->context.id might not yet have been assigned as
> 	 * this context might not have been activated yet when this
> 	 * is called.
> 	 */
> 	pte = set_pte_filter(pte);
> 
> 	prot = pte_pgprot(pte);
> 	pfn = pte_pfn(pte);
> 	/* Perform the setting of the PTE */
> 	for (;;) {
> 		__set_pte_at(mm, addr, ptep, pfn_pte(pfn, prot), 0);
> 		if (--nr == 0)
> 			break;
> 		ptep++;
> 		pfn++;
> 		addr += PAGE_SIZE;
> 	}
> }

I'd rather the per-arch code were as similar to each other and the
generic implementation as possible.  Fewer bugs that way and easier
for other people to make changes that have to touch every architecture
in the future.
