Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E41269037EF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 11:35:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1h9kfKoU;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Wyti0idM;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1h9kfKoU;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Wyti0idM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vz3Sn5tcxz3dTw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 19:35:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1h9kfKoU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Wyti0idM;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1h9kfKoU;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Wyti0idM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vz3R801f5z3cb4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 19:34:27 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2FB9133686;
	Tue, 11 Jun 2024 09:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718098465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bXl9G+kh6CJWJjfSYdY3mI/mE/xXvq102BbFQ15gmgk=;
	b=1h9kfKoUjzUX7Pg0FYO4/Hn86ca25G+Dw0AJG6LeaEH4SJ+Pr27qT5mX6xNgxC6+O6nlft
	br7k3/K0BFcSDett6c63kGZre4r1PJdSH5PsMsFXqyiITD7SPqMSS1uvPAn4oCFafdgeLW
	Px/kUM1cWdNYU4YVxTTrQ2a7A0yPIFM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718098465;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bXl9G+kh6CJWJjfSYdY3mI/mE/xXvq102BbFQ15gmgk=;
	b=Wyti0idMR4rKs3LoThTM+Y8V0nVad7j2jppVkPhnwFxzg/7HdB6YPRlKnU0DR4KISNMvTk
	44kaEKvNEVIr0MBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718098465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bXl9G+kh6CJWJjfSYdY3mI/mE/xXvq102BbFQ15gmgk=;
	b=1h9kfKoUjzUX7Pg0FYO4/Hn86ca25G+Dw0AJG6LeaEH4SJ+Pr27qT5mX6xNgxC6+O6nlft
	br7k3/K0BFcSDett6c63kGZre4r1PJdSH5PsMsFXqyiITD7SPqMSS1uvPAn4oCFafdgeLW
	Px/kUM1cWdNYU4YVxTTrQ2a7A0yPIFM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718098465;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bXl9G+kh6CJWJjfSYdY3mI/mE/xXvq102BbFQ15gmgk=;
	b=Wyti0idMR4rKs3LoThTM+Y8V0nVad7j2jppVkPhnwFxzg/7HdB6YPRlKnU0DR4KISNMvTk
	44kaEKvNEVIr0MBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A858413A55;
	Tue, 11 Jun 2024 09:34:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Jbt2JiAaaGapdAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 11 Jun 2024 09:34:24 +0000
Date: Tue, 11 Jun 2024 11:34:23 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v5 02/18] mm: Define __pte_leaf_size() to also take a PMD
 entry
Message-ID: <ZmgaHyS0izhtKbx6@localhost.localdomain>
References: <cover.1717955558.git.christophe.leroy@csgroup.eu>
 <172b11c93e0de7a84937af2da9f80bd17c56b8c9.1717955558.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172b11c93e0de7a84937af2da9f80bd17c56b8c9.1717955558.git.christophe.leroy@csgroup.eu>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,nvidia.com,redhat.com,ellerman.id.au,gmail.com,vger.kernel.org,kvack.org,lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Flag: NO
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 10, 2024 at 07:54:47AM +0200, Christophe Leroy wrote:
> On powerpc 8xx, when a page is 8M size, the information is in the PMD
> entry. So allow architectures to provide __pte_leaf_size() instead of
> pte_leaf_size() and provide the PMD entry to that function.
> 
> When __pte_leaf_size() is not defined, define it as a pte_leaf_size()
> so that architectures not interested in the PMD arguments are not
> impacted.
> 
> Only define a default pte_leaf_size() when __pte_leaf_size() is not
> defined to make sure nobody adds new calls to pte_leaf_size() in the
> core.

Hi Christophe,

Now I am going to give you a hard time, so sorry in advance.
I should have raised this before, but I was not fully aware of it.

There is an ongoing effort of unifying pagewalkers [1], so hugetlb does not have
to be special-cased anymore, and the operations we do for THP on page-table basis
work for hugetlb as well.

The most special bit about this is huge_ptep_get.
huge_ptep_get() gets special handled on arm/arm64/riscv and s390.

arm64 and riscv is about cont-pmd/pte and propagate the dirty/young bits bits, so that
is fine as walkers can already understand that.
s390 is a funny one because it converts pud/pmd to pte and viceversa, because hugetlb
*works* with ptes, so before returning the pte it has to transfer all
bits from PUD/PMD level into a something that PTE level can understand.
As you can imagine, this can be gone as we already have all the
information in PUD/PMD and that is all pagewalkers need.

But we are left with the one you will introduce in patch#8.

8MB pages get mapped as cont-pte, but all the information is stored in
the PMD entries (size, dirtiness, present etc).
huge_ptep_get() will return the PMD for 8MB, and so all operations hugetlb
code performs with what huge_ptep_get returns will be performed on those PMDs.

Which brings me to this point:

I do not think __pte_leaf_size is needed. AFAICS, it should be enough to define
pmd_leaf on 8xx, and return 8MB if it is a 8MB hugepage.

   #define pmd_leaf pmd_leaf
   static inline bool pmd_leaf(pmd_t pmd)
   {
          return pmd_val(pmd) & _PMD_PAGE_8M);
   }

   and then pmd_leaf_size to return _PMD_PAGE_8M.
   
This will help because on the ongoing effort of unifying hugetlb and
getting rid of huge_ptep_get() [1], pagewalkers will stumble upon the
8mb-PMD as they do for regular PMDs.

Which means that they would be caught in the following code:

        ptl = pmd_huge_lock(pmd, vma);
        if (ptl) {
	        - 8MB hugepages will be handled here
                smaps_pmd_entry(pmd, addr, walk);
                spin_unlock(ptl);
        }
	/* pte stuff */
	...

where pmd_huge_lock is:

 static inline spinlock_t *pmd_huge_lock(pmd_t *pmd, struct vm_area_struct *vma)
 {
        spinlock_t *ptl = pmd_lock(vma->vm_mm, pmd);

        if (pmd_leaf(*pmd) || pmd_devmap(*pmd))
                return ptl;
        spin_unlock(ptl);
        return NULL;
 }

So, since pmd_leaf() will return true for 8MB hugepages, we are fine,
because anyway we want to perform pagetable operations on *that* PMD and
not the ptes that are cont-mapped, which is different for e.g: 512K
hugepages, where we perform it on pte level.

So I would suggest that instead of this patch, we have one implementing pmd_leaf
and pmd_leaf_size for 8Mb hugepages on power8xx, as that takes us closer to our goal of
unifying hugetlb.

[1] https://github.com/leberus/linux/tree/hugetlb-pagewalk-v2


-- 
Oscar Salvador
SUSE Labs
