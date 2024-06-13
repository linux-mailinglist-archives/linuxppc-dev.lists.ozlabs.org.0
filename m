Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4986A9064CD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 09:20:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=l8ViJ5DV;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fVMKfSb4;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=l8ViJ5DV;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fVMKfSb4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0DMv2D2yz3cVs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 17:20:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=l8ViJ5DV;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fVMKfSb4;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=l8ViJ5DV;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fVMKfSb4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0DM72M4rz3bxZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 17:20:02 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CBDC935011;
	Thu, 13 Jun 2024 07:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718263197; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5vB0B07P2+DuuejZFzMWZoJyc2y0Vfw/uEPye59MNaU=;
	b=l8ViJ5DVLW76yFotFw/cV8vahWRyrO809JHirtZtZjLyvf+LSR6DbA2dHv8z2/z1huiRPU
	HvQWqCdlTxVe7eHURYrkU+Mxt8L7Zd9GTvMnXesBJgqxvhzG3f6yl/hd1yYEoJr+Yd8ntn
	LLg7Le3IOok3oDEhZwOwYPgnrHfqbGI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718263197;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5vB0B07P2+DuuejZFzMWZoJyc2y0Vfw/uEPye59MNaU=;
	b=fVMKfSb4JEVOhWLp/vpZlVLX1FT0spQlCukyyxI+ZmXsvlZnkaxBwhwsBTtKQCmT4voltA
	5A0oY84OFL7IxWDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718263197; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5vB0B07P2+DuuejZFzMWZoJyc2y0Vfw/uEPye59MNaU=;
	b=l8ViJ5DVLW76yFotFw/cV8vahWRyrO809JHirtZtZjLyvf+LSR6DbA2dHv8z2/z1huiRPU
	HvQWqCdlTxVe7eHURYrkU+Mxt8L7Zd9GTvMnXesBJgqxvhzG3f6yl/hd1yYEoJr+Yd8ntn
	LLg7Le3IOok3oDEhZwOwYPgnrHfqbGI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718263197;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5vB0B07P2+DuuejZFzMWZoJyc2y0Vfw/uEPye59MNaU=;
	b=fVMKfSb4JEVOhWLp/vpZlVLX1FT0spQlCukyyxI+ZmXsvlZnkaxBwhwsBTtKQCmT4voltA
	5A0oY84OFL7IxWDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4EF4513A87;
	Thu, 13 Jun 2024 07:19:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BzZwEJ2damYySAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 13 Jun 2024 07:19:57 +0000
Date: Thu, 13 Jun 2024 09:19:51 +0200
From: Oscar Salvador <osalvador@suse.de>
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Subject: Re: [PATCH v5 02/18] mm: Define __pte_leaf_size() to also take a PMD
 entry
Message-ID: <Zmqdl1aqmU9BgYzo@localhost.localdomain>
References: <cover.1717955558.git.christophe.leroy@csgroup.eu>
 <172b11c93e0de7a84937af2da9f80bd17c56b8c9.1717955558.git.christophe.leroy@csgroup.eu>
 <ZmgaHyS0izhtKbx6@localhost.localdomain>
 <ZmhcepJrkDpJ7mSC@x1n>
 <ZmhofWIiMC3I0aMF@localhost.localdomain>
 <ZmhrIdh3PLzvZU07@x1n>
 <Zmh282yJjxc7zqbL@localhost.localdomain>
 <e9583aa5-4ad7-4bcf-b3ff-f42b983231f5@cs-soprasteria.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9583aa5-4ad7-4bcf-b3ff-f42b983231f5@cs-soprasteria.com>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-0.995];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,linux-foundation.org,nvidia.com,ellerman.id.au,gmail.com,vger.kernel.org,kvack.org,lists.ozlabs.org];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 11, 2024 at 07:00:14PM +0000, LEROY Christophe wrote:
> We have space available in PMD if we need more flags, but in PTE I can't 
> see anything possible without additional churn that would require 
> additional instructions in TLB miss handlers, which is what I want to 
> avoid most.
> 
> Bits mapped to HW PTE:
> 
> #define _PAGE_PRESENT	0x0001	/* V: Page is valid */
> #define _PAGE_NO_CACHE	0x0002	/* CI: cache inhibit */
> #define _PAGE_SH	0x0004	/* SH: No ASID (context) compare */
> #define _PAGE_SPS	0x0008	/* SPS: Small Page Size (1 if 16k, 512k or 8M)*/
> #define _PAGE_DIRTY	0x0100	/* C: page changed */
> #define _PAGE_NA	0x0200	/* Supervisor NA, User no access */
> #define _PAGE_RO	0x0600	/* Supervisor RO, User no access */
> 
> SW bits masked out in TLB miss handler:
> 
> #define _PAGE_GUARDED	0x0010	/* Copied to L1 G entry in DTLB */
> #define _PAGE_ACCESSED	0x0020	/* Copied to L1 APG 1 entry in I/DTLB */
> #define _PAGE_EXEC	0x0040	/* Copied to PP (bit 21) in ITLB */
> #define _PAGE_SPECIAL	0x0080	/* SW entry */
> #define _PAGE_HUGE	0x0800	/* Copied to L1 PS bit 29 */
> 
> All bits are used. The only thing would could do but that would have a 
> performance cost is to retrieve _PAGE_SH from the PMD and use that bit 
> for something else.

I guess that this would be the last resort if we run out of options.
But at least it is good to know that there is a plan B (or Z if you will
:-))

> But I was maybe thinking another way. Lets take the exemple of 
> pmd_write() helper:
> 
> #define pmd_write(pmd)		pte_write(pmd_pte(pmd))
> 
> At the time being we have
> 
> static inline pte_t pmd_pte(pmd_t pmd)
> {
> 	return __pte(pmd_val(pmd));
> }
> 
> But what about something like
> 
> static inline pte_t pmd_pte(pmd_t pmd)
> {
> 	return *(pte_t *)pmd_page_vaddr(pmd);
> }

I think this could work, yes.

So, we should define all pmd_*(pmd) operations for 8xx the way they are defined
in include/asm/book3s/64/pgtable.h.

Other page size would not interfere because they already can perform
operations on pte level.

Ok, I think we might have a shot here.

I would help testing, but I do not have 8xx hardware, and Qemu does not support
8xx emulation, but I think that if we are careful enough, this can work.

Actually, as a smoketest would be enough to have a task with a 8MB huge
mapped, and then do:

 static const struct mm_walk_ops test_walk_ops = {
         .pmd_entry = test_8mbp_hugepage,
         .pte_entry = test_16k_and_512k_hugepage,
         .hugetlb_entry = check_hugetlb_entry,
         .walk_lock = PGWALK_RDLOCK,
 };

 static int test(void) 
 {
 
          pr_info("%s: %s [0 - %lx]\n", __func__, current->comm, TASK_SIZE);
          mmap_read_lock(current->mm);
          ret = walk_page_range(current->mm, 0, TASK_SIZE, &test_walk_ops, NULL);
          mmap_read_unlock(current->mm);
          
          pr_info("%s: %s ret: %d\n", __func__, current->comm, ret);
          
          return 0;
 }

This is an extract of a debugging mechanism I have to check that I am
not going off rails when unifying hugetlb and normal walkers.

test_8mbp_hugepage() could so some checks with pmd_ operations, print
the results, and then compare them with those that check_hugetlb_entry()
would give us.
If everything is alright, both results should be the same.

I can write the tests up, so we run some sort of smoketests.

So yes, I do think that this is a good initiative.

Thanks a lot Christoph

-- 
Oscar Salvador
SUSE Labs
