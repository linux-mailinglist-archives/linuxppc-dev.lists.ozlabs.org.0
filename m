Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F578C8811
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 16:27:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=IQGJUkqk;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=d93YTo6p;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=IQGJUkqk;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=d93YTo6p;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vgq7J66kqz3bhD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2024 00:27:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=IQGJUkqk;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=d93YTo6p;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=IQGJUkqk;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=d93YTo6p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vgq6X2w9qz3cXt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 May 2024 00:27:16 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 277C03753E;
	Fri, 17 May 2024 14:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715956033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jFIvzqT1E77ELTg/8u02x5Dv1NLQX6WrR+4hhQiT4oM=;
	b=IQGJUkqkkohUkV66RGC0pnNG0TgpepqS59fTIPw+Z7nvfEFzM+llsBAe/AI2704WalsXw3
	8/SXxt6dJmfCR506rd25Vdl9elilP4wDnZoxxZkAFw9Lr4MRML47/DXry/FA0RK86m9ZmA
	ncgCd3+jXDvYY2ZfWKood7VRMUOLjP4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715956033;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jFIvzqT1E77ELTg/8u02x5Dv1NLQX6WrR+4hhQiT4oM=;
	b=d93YTo6ppEpbIMm6E++0P43k5l8zG+mImUCLwKIVLmOn54pWg4sV5khUUnFpcs5eRFWcYd
	urwDymmLzA+I8ZBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715956033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jFIvzqT1E77ELTg/8u02x5Dv1NLQX6WrR+4hhQiT4oM=;
	b=IQGJUkqkkohUkV66RGC0pnNG0TgpepqS59fTIPw+Z7nvfEFzM+llsBAe/AI2704WalsXw3
	8/SXxt6dJmfCR506rd25Vdl9elilP4wDnZoxxZkAFw9Lr4MRML47/DXry/FA0RK86m9ZmA
	ncgCd3+jXDvYY2ZfWKood7VRMUOLjP4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715956033;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jFIvzqT1E77ELTg/8u02x5Dv1NLQX6WrR+4hhQiT4oM=;
	b=d93YTo6ppEpbIMm6E++0P43k5l8zG+mImUCLwKIVLmOn54pWg4sV5khUUnFpcs5eRFWcYd
	urwDymmLzA+I8ZBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B59AD13942;
	Fri, 17 May 2024 14:27:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PrieKUBpR2YlegAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 17 May 2024 14:27:12 +0000
Date: Fri, 17 May 2024 16:27:11 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH 0/8] Reimplement huge pages without hugepd on powerpc
 8xx
Message-ID: <ZkdpP-6znZS5Fvz2@localhost.localdomain>
References: <cover.1711377230.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1711377230.git.christophe.leroy@csgroup.eu>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
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
Cc: linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 25, 2024 at 03:55:53PM +0100, Christophe Leroy wrote:
> This series reimplements hugepages with hugepd on powerpc 8xx.
> 
> Unlike most architectures, powerpc 8xx HW requires a two-level
> pagetable topology for all page sizes. So a leaf PMD-contig approach
> is not feasible as such.
> 
> Possible sizes are 4k, 16k, 512k and 8M.
> 
> First level (PGD/PMD) covers 4M per entry. For 8M pages, two PMD entries
> must point to a single entry level-2 page table. Until now that was
> done using hugepd. This series changes it to use standard page tables
> where the entry is replicated 1024 times on each of the two pagetables
> refered by the two associated PMD entries for that 8M page.
> 
> At the moment it has to look into each helper to know if the
> hugepage ptep is a PTE or a PMD in order to know it is a 8M page or
> a lower size. I hope this can me handled by core-mm in the future.
> 
> There are probably several ways to implement stuff, so feedback is
> very welcome.


Hi Christophe,

I have been looking into this because I am interested in the ongoing work of
the hugetlb unification, but my knowledge of ppc pagetables tends to zero,
So be prepared for some stupid questions.

First, let me have a clear picture of the current situation:

power8xx has 4KB, 16KB, 512KB, and 8MB page sizes, and operate on a 2Level 
pagetables. Wiki [1] mentions PGD + PTE, here you seem to be referring them
as PMD + PTE though.

And we can have 1024 PGDs, each of one covers 4MB, so we can cover a total of
of 4GB.

Looking at the page table diagram for power8xx, it seems power8xx has also some
sort of CONTIG_PTE? (same as arm64 does) So we can have contig_ptes representing
bigger page sizes?
I also guess that although power8xx supports all these different sizes, only one
of them can be active at any time, right?

It also seems that this whole hugepd thing is only used when we are using 8MB
PAGE_SIZE, right?
And when that is active, we do have 2 PGDs(4MB each) pointing to the same 8MB
hugepd.
E.g:
                        ____________
 [PGD#0] ------------> |            |
                       | 8MB hugepd |
 [PGD#1] ------------> |____________|

What you want to do with this work is to get rid of that hugepd abstraction
because it is something power8xx/hugetlb specific and cannot be represented
with our "normal" page table layout (PGD,P4D,PUD,PMD,PTE).
I did not check, but I guess we cannot walk the hugepd thing with a normal
page table walker, or can we? (how special is a hugepd? can you describe its
internal layout?)

So, what you proprose, is something like the following?

 [PGD#X] -----------> [PTE#0]
         -----------> [PTE..#1023]
 [PGD#Y] -----------> [PTE#0]
         -----------> [PTE..#1023]

so a 8MB hugepage will be covered by PGD#X and PGD#Y using contiguos PTEs.

The diagram at [1] for 8xx 16K seems a bit misleading to me (or maybe it is
just me). They say that a Level2 table (aka PTE) covers 4KB chunks regardless
of the pagesize, but either I read that wrong or..else.
Because on 16K page size, they show that each pte covers for 16KB memory chunk.
But that would mean 16KB << 10 = 16M each PGD, which is not really that, so what
is the deal there? Or it is just that we always use 4KB PTEs, and use contiguous
PTEs for bigger sizes?

Now, it seems that power8xx has no-p4d, no-pud and no-pmd, right?

Peter mentioned that we should have something like:

X       X
[PGD] - [P4D] - [PUD] - [PMD] - [PTE]

where the PMD and PTE would be the ones we use for representing the 2Level
ptage table, and PGD,P4D and PUD would just be dummies.

But, is not the convention to at least have PGD-PTE always, and have anything
in between as optional? E.g:

  X       ?       ?       ?       X
[PGD] - [P4D] - [PUD] - [PMD] - [PTE]

I mean, are page table walkers ready to deal with non-PGD? I thought they were
not.

Also, in patch#1, you mentioned:

"At the time being, for 512k pages the flag is kept in the PTE and inserted in
the PMD entry at TLB miss exception".

Can you point out where to look for that in the code?

Also, what exactly is the "sz" parameter that gets passed down to pmd_populate_size()?
Is the size of the current mapping we are establishing?
I see that you only make a distinction when the mapping size is 8MB.
So the PMD will have _PMD_PAGE_8MB, so it works that all 1024 PTEs below are contiguous
representing a 4MB chunk?

I will start looking deeper into this series on Monday, but just wanted to have a better
insight of what is going on.

PD: I think we could make the changelog of the coverletter a bit fatter and cover some
details in there, e.g: layout of page-tables for different page sizes, layout of hugepd,
expected layout after the work, etc.
I think it would help in reviewing this series.

Thanks!

[1] https://github.com/linuxppc/wiki/wiki/Huge-pages


-- 
Oscar Salvador
SUSE Labs
