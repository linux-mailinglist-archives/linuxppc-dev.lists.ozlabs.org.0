Return-Path: <linuxppc-dev+bounces-3784-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B73579E3721
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 11:04:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3Cmj413Pz30Vy;
	Wed,  4 Dec 2024 21:04:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733306677;
	cv=none; b=KxhIYkWbwnQw6zMPTXniTfYn6RESqaE442HpbBcRtgS40qo0od7CWc3brTCK5z1OCFnPJVA1c4yxQ9IDmhtURIh7UoLzK8VQhISHQFA/2yKYfzdHkXzW3LxEXEh2kk8CVr55r4qCi4RfK95U/QEmR5NJz+K3oJ56wBlJ2yV9AF1eBsYR5XALRIL3jxF4Uo+jvKM7a8Kz1KpONiA+SXsLa/f1nEtGMnSgkbi7gxtWZZC5hmyxQwwY3qM6nyPdFTIBHcxh9qwIXrNr2a78lUj+6QaZVNTYm6MZnkqR3NQaHyMoSMVfbQITh4Ic2rO66VuCbja5tV/03fPoM7HBcyZb9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733306677; c=relaxed/relaxed;
	bh=Xy7OLEHT9rPxg4WvTixZV3fgQXGtfE/zFSKuC+qdFso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aIew/NvEQK7bT6A2289NKrNLZ/vt/n3kO9JOWJ7eLtsDueXDxy4pBjL+x8d/TeGTi+PuJ6JV0t1O/hO+VblKyBgzVpjaF3hP4Wd3ZoFm+BNR1rB0lO0VaSUpJwKJSneufGxM48wjVKtLe2USnu4lmSYGGM7qKdUs9es0M71aX2TmS09HSyySFqgR25Ozz9r+Buhik0USGM4M9f38Um17odD3kR8cNQ64wqD4NxevA+IeQN7rtboLGEFZwiwDYTvbzzKXNqmusJBV+umSx0HDX5lcT0MvEn6Qo+ERqz9h9VYl04wSfsSGx/we8YRiq4Gi3OSfDF3LaFrulOKZ3ZmJIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AUbPhStJ; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=dkyMDhkV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AUbPhStJ; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=dkyMDhkV; dkim-atps=neutral; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AUbPhStJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=dkyMDhkV;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AUbPhStJ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=dkyMDhkV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3Cmg1YtWz30Vb
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 21:04:34 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C1E402115E;
	Wed,  4 Dec 2024 10:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733306670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xy7OLEHT9rPxg4WvTixZV3fgQXGtfE/zFSKuC+qdFso=;
	b=AUbPhStJ9yLoo6V50DDcNOU42gZHOU/H3vOQfmxAS7nnzu3mUSgDU/5wbUoWW2ncTaNGpD
	BbGdUg0waSbq+6zkHZ/ATIAUXIX7VCyiLnFz1o8url87wKJoiBaXhDJ8M1XRemRPlMPCbj
	HGWj4jgvFngkJBE8qYMVi50PgwUkvFc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733306670;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xy7OLEHT9rPxg4WvTixZV3fgQXGtfE/zFSKuC+qdFso=;
	b=dkyMDhkVk9mDPsH6MkoIidfsFFWuhjQdK3ZtCKOSv3p4X1FupD0yvwe+1mxVzqnkchxQfY
	TWUOPOj1YIi5flAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733306670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xy7OLEHT9rPxg4WvTixZV3fgQXGtfE/zFSKuC+qdFso=;
	b=AUbPhStJ9yLoo6V50DDcNOU42gZHOU/H3vOQfmxAS7nnzu3mUSgDU/5wbUoWW2ncTaNGpD
	BbGdUg0waSbq+6zkHZ/ATIAUXIX7VCyiLnFz1o8url87wKJoiBaXhDJ8M1XRemRPlMPCbj
	HGWj4jgvFngkJBE8qYMVi50PgwUkvFc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733306670;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xy7OLEHT9rPxg4WvTixZV3fgQXGtfE/zFSKuC+qdFso=;
	b=dkyMDhkVk9mDPsH6MkoIidfsFFWuhjQdK3ZtCKOSv3p4X1FupD0yvwe+1mxVzqnkchxQfY
	TWUOPOj1YIi5flAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 20F8C1396E;
	Wed,  4 Dec 2024 10:04:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id toxJBS4pUGfEdwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 04 Dec 2024 10:04:30 +0000
Date: Wed, 4 Dec 2024 11:04:24 +0100
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
	Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH RESEND v2 4/6] mm/page_alloc: sort out the
 alloc_contig_range() gfp flags mess
Message-ID: <Z1ApKEC-_OPPreun@localhost.localdomain>
References: <20241203094732.200195-1-david@redhat.com>
 <20241203094732.200195-5-david@redhat.com>
 <feffbbe8-4176-48e8-b503-ef53d7914197@suse.cz>
 <96c92857-4850-4f85-9474-ac193c5ea48c@redhat.com>
 <04c1d28e-bbea-4499-9a6d-770f9ca53ba9@suse.cz>
 <d736f1c0-343e-4031-88ba-3b33b73dbeba@redhat.com>
 <Z1AaC5Hj2RV_5FDD@localhost.localdomain>
 <15096b27-6f27-45fc-8a8b-de781a9c42a5@suse.cz>
 <Z1AdotZfAJG-zVZX@localhost.localdomain>
 <cee06baa-8561-4be3-8f5c-ca453f58950b@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cee06baa-8561-4be3-8f5c-ca453f58950b@redhat.com>
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
	RCPT_COUNT_TWELVE(0.00)[12];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.cz,vger.kernel.org,kvack.org,lists.ozlabs.org,linux-foundation.org,nvidia.com,ellerman.id.au,gmail.com,csgroup.eu,kernel.org,linux.ibm.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Dec 04, 2024 at 10:28:39AM +0100, David Hildenbrand wrote:
> On 04.12.24 10:15, Oscar Salvador wrote:
> > On Wed, Dec 04, 2024 at 10:03:28AM +0100, Vlastimil Babka wrote:
> > > On 12/4/24 09:59, Oscar Salvador wrote:
> > > > On Tue, Dec 03, 2024 at 08:19:02PM +0100, David Hildenbrand wrote:
> > > > > It was always set using "GFP_USER | __GFP_MOVABLE | __GFP_RETRY_MAYFAIL",
> > > > > and I removed the same flag combination in #2 from memory offline code, and
> > > > > we do have the exact same thing in do_migrate_range() in
> > > > > mm/memory_hotplug.c.
> > > > > 
> > > > > We should investigate if__GFP_HARDWALL is the right thing to use here, and
> > > > > if we can get rid of that by switching to GFP_KERNEL in all these places.
> > > > 
> > > > Why would not we want __GFP_HARDWALL set?
> > > > Without it, we could potentially migrate the page to a node which is not
> > > > part of the cpuset of the task that originally allocated it, thus violating the
> > > > policy? Is not that a problem?
> > > 
> > > The task doing the alloc_contig_range() will likely not be the same task as
> > > the one that originally allocated the page, so its policy would be
> > > different, no? So even with __GFP_HARDWALL we might be already migrating
> > > outside the original tasks's constraint? Am I missing something?
> > 
> > Yes, that is right, I thought we derive the policy from the old page
> > somehow when migrating it, but reading the code does not seem to be the
> > case.
> > 
> > Looking at prepare_alloc_pages(), if !ac->nodemask, which would be the
> > case here, we would get the policy from the current task
> > (alloc_contig_range()) when cpusets are enabled.
> > 
> > So yes, I am a bit puzzled why __GFP_HARDWALL was chosen in the first
> > place.
> 
> I suspect because "GFP_USER" felt like the appropriate thing to do.

Looking back at when the whole contiguous allocator patchset was posted,
it seems that it kinda copied what memory-offline code was doing, which
was migrating pages with GFP_HIGHUSER_MOVABLE (hotremove_migrate_alloc()).

Then, the HIGHMEM modifier was dropped due to HIGHMEM restrictions on
some systems, ending up with GFP_USER.


-- 
Oscar Salvador
SUSE Labs

