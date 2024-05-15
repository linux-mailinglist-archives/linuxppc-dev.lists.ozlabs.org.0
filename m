Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A690E8C64EF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 12:22:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=osfCs+ZD;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7YEKYFmQ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=osfCs+ZD;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7YEKYFmQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfTnP0HYRz3cSq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 20:22:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=osfCs+ZD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7YEKYFmQ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=osfCs+ZD;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7YEKYFmQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 50098 seconds by postgrey-1.37 at boromir; Wed, 15 May 2024 20:22:12 AEST
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfTmh19Bdz30Wh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 20:22:11 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 479BE2050B;
	Wed, 15 May 2024 10:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715768522; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bvnm5h9Dm1o+r/HqlbIr30i3nlCVPpxQO8iGYoJ/oZs=;
	b=osfCs+ZDMySdssvcMGMbx0XH5WEA3dYR8XeMeO2WEbM+zOFp5pXTLthlcyjJwZTiDQaMaO
	VRvf+xfkEhs8CjC/OHJBKTpTgYm96uvH6V9ZSyzJlnHYJlsrwXrmqSJf5ZkE7vsJZRkoRN
	meER9rkMfyaCIwtzhdP0sqoekBwdiSc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715768522;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bvnm5h9Dm1o+r/HqlbIr30i3nlCVPpxQO8iGYoJ/oZs=;
	b=7YEKYFmQ+oTHb7De1VDCZo6Q0SgjUQQpJNuv7sC0p34RRxzmqFebeTGRNwRitQER1MDXDT
	JZD2wQKdQlPdaTBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715768522; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bvnm5h9Dm1o+r/HqlbIr30i3nlCVPpxQO8iGYoJ/oZs=;
	b=osfCs+ZDMySdssvcMGMbx0XH5WEA3dYR8XeMeO2WEbM+zOFp5pXTLthlcyjJwZTiDQaMaO
	VRvf+xfkEhs8CjC/OHJBKTpTgYm96uvH6V9ZSyzJlnHYJlsrwXrmqSJf5ZkE7vsJZRkoRN
	meER9rkMfyaCIwtzhdP0sqoekBwdiSc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715768522;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bvnm5h9Dm1o+r/HqlbIr30i3nlCVPpxQO8iGYoJ/oZs=;
	b=7YEKYFmQ+oTHb7De1VDCZo6Q0SgjUQQpJNuv7sC0p34RRxzmqFebeTGRNwRitQER1MDXDT
	JZD2wQKdQlPdaTBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C9992139B3;
	Wed, 15 May 2024 10:22:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id C3aFLsiMRGZzXwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 15 May 2024 10:22:00 +0000
Date: Wed, 15 May 2024 12:21:51 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 1/1] arch/fault: don't print logs for pte marker
 poison errors
Message-ID: <ZkSMv31Cwx080no7@localhost.localdomain>
References: <20240510182926.763131-1-axelrasmussen@google.com>
 <20240510182926.763131-2-axelrasmussen@google.com>
 <Zj51rEwZeSK4Vr1G@x1n>
 <ZkPJCc5N1Eotpa4u@localhost.localdomain>
 <ZkPY4CSnZWZnxjTa@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZkPY4CSnZWZnxjTa@x1n>
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[google.com,linux-foundation.org,kernel.org,alien8.de,csgroup.eu,linux.intel.com,redhat.com,zytor.com,gmx.de,hansenpartnership.com,nvidia.com,huawei.com,infradead.org,ellerman.id.au,linux.dev,linux.ibm.com,gmail.com,linutronix.de,vger.kernel.org,kvack.org,lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLj6zumtikrrmnnbmzkety5zmd)]
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Suren Baghdasaryan <surenb@google.com>, Liu Shixin <liushixin2@huawei.com>, linux-parisc@vger.kernel.org, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 14, 2024 at 03:34:24PM -0600, Peter Xu wrote:
> The question is whether we can't.
> 
> Now we reserved a swp entry just for hwpoison and it makes sense only
> because we cached the poisoned pfn inside.  My long standing question is
> why do we ever need that pfn after all.  If we don't need the pfn, we
> simply need a bit in the pgtable entry saying that it's poisoned, if
> accessed we should kill the process using sigbus.
> 
> I used to comment on this before, the only path that uses that pfn is
> check_hwpoisoned_entry(), which was introduced in:
> 
> commit a3f5d80ea401ac857f2910e28b15f35b2cf902f4
> Author: Naoya Horiguchi <nao.horiguchi@gmail.com>
> Date:   Mon Jun 28 19:43:14 2021 -0700
> 
>     mm,hwpoison: send SIGBUS with error virutal address
>     
>     Now an action required MCE in already hwpoisoned address surely sends a
>     SIGBUS to current process, but the SIGBUS doesn't convey error virtual
>     address.  That's not optimal for hwpoison-aware applications.
>     
>     To fix the issue, make memory_failure() call kill_accessing_process(),
>     that does pagetable walk to find the error virtual address.  It could find
>     multiple virtual addresses for the same error page, and it seems hard to
>     tell which virtual address is correct one.  But that's rare and sending
>     incorrect virtual address could be better than no address.  So let's
>     report the first found virtual address for now.
> 
> So this time I read more on this and Naoya explained why - it's only used
> so far to dump the VA of the poisoned entry.

Well, not really dumped, but we just pass the VA down the chain to the
signal handler.

But on the question whether we need the pfn encoded, I am not sure
actually.
check_hwpoisoned_entry() checks whether the pfn where the pte sits is
the same as the hwpoisoned one, so we know if the process has to be
killed.

Now, could we get away with using pte_page() instead of pte_pfn() in there, and
passing the hwpoisoned page instead ot the pfn?
I am trying to think of the implications, then we should not need the
encoded pfn?


> However what confused me is, if an entry is poisoned already logically we
> dump that message in the fault handler not memory_failure(), which is:
> 
> MCE: Killing uffd-unit-tests:650 due to hardware memory corruption fault at 7f3589d7e000
> 
> So perhaps we're trying to also dump that when the MCEs (points to the same
> pfn) are only generated concurrently?  I donno much on hwpoison so I cannot
> tell, there's also implication where it's only triggered if
> MF_ACTION_REQUIRED.  But I think it means hwpoison may work without pfn
> encoded, but I don't know the implication to lose that dmesg line.

Not necesarily concurrently, but simply if for any reason the page could
not have been unmapped.
Let us say you have ProcessA and ProcessB mapping the same page.
We get an MCE for that page but we could not unmapped it, at least not
from all processes (maybe just ProcessA).

memory-failure code will mark it as hwpoison, now ProcessA faults it in
and gets killed because we see that the page is hwpoisoned in the fault
path, so we sill send VM_FAULT_HWPOISON all the way down till you see
the:

"MCE: Killing uffd-unit-tests:650 due to hardware memory corruption
fault at 7f3589d7e000" from e.g: arch/x86/mm/fault.c:do_sigbus()

Now, ProcessB still has the page mapped, so upon re-accessing it,
it will trigger a new MCE event. memory-failure code will see that this
page has already been marked as hwpoisoned, but since we failed to
unmap it (otherwise no one should be re-accessing it), it goes: "ok,
let's just kill everybody who has this page mapped".


> We used to not dump error for swapin error.  Note that here what I am
> saying is not that Axel is doing things wrong, but it's just that logically
> swapin error (as pte marker) can also be with !QUIET, so my final point is
> we may want to avoid having the assumption that "pte marker should always
> be QUITE", because I want to make it clear that pte marker can used in any
> form, so itself shouldn't imply anything..

I think it would make more sense if we have a separate marker for swapin
errors?
I mean, deep down, they do not mean the same as poison, right?

Then you can choose which events get to be silent because you do not
care, and which ones need to scream loud.
I think swapin errors belong to the latter. At least I a heads-up why a
process is getting killed is appreciated, IMHO.
 

-- 
Oscar Salvador
SUSE Labs
