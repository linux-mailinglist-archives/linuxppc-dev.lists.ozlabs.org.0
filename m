Return-Path: <linuxppc-dev+bounces-3782-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC829E3654
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 10:15:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3Bh21Jzvz30W4;
	Wed,  4 Dec 2024 20:15:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733303730;
	cv=none; b=B1fYj5HFu/d38xCSkhrFBOB3zTiFmjJISDcKQh8bGZNxlTR93WF9TwfIiWgJrSpa1NIT1QtUNdQrs0FIsILhwLTzqveWcgYncWqWmp2uiXKibbDxeN7NdX5y3i7EBbM1CkswTuswCxu+ETHgdCseD5GXw/k+JKseXvLWOga8QizD1+fnYyi+oBRitnLGpRB1Wu9MpwGd6f+S27ShrMYFlyy+DDiSu/3hAQAuYqmIjIF41dEeUVdyZRaogXPRRYo0czwIroCLI7GcU3WqNcEyCCiAXM8rboIXg8Q53VppVxLoqXuv1e5BC/F5EItNO3iImEF+gPHZchGcYG8qQsdKww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733303730; c=relaxed/relaxed;
	bh=/xTdJKRQEzILVq1FIyzNiL8lvaQRqJgK/zyGTatPF1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8hxs3HNjYluHkwYYH/s6W9T2L/pGS56nb6XSh0yyNcpcdlTBuve71/8ikHE5hcwH0CjWOxeRNNi6u4wf39HV1Ltdb3tjlfmI8jaXsEYK++YtUF55EixjKscOAO3mjWrijPVj+oCtBom/6LUCk3yH9GZFsic97HFT16u5KAZntroJ/FcdQ5B43epMd5Ben98uxOODHIK8OCIOCu2h2w4Qqgc73NxTq0d0VY5pbuW1FkFOyASHNglAODLSvZ3MX4qSK0YWhe6eAs36aKx2GC3k2f9RBTN24m21F0dBYeoOoq14RaFh4t56HaoHB5gvxgIpI/5hDV2UZe9NOOotFxyAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3Bh10z3Nz30Vm
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 20:15:28 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F26A72115C;
	Wed,  4 Dec 2024 09:15:24 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 51565139C2;
	Wed,  4 Dec 2024 09:15:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wN0nEawdUGfYaAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 04 Dec 2024 09:15:24 +0000
Date: Wed, 4 Dec 2024 10:15:14 +0100
From: Oscar Salvador <osalvador@suse.de>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
	Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH RESEND v2 4/6] mm/page_alloc: sort out the
 alloc_contig_range() gfp flags mess
Message-ID: <Z1AdotZfAJG-zVZX@localhost.localdomain>
References: <20241203094732.200195-1-david@redhat.com>
 <20241203094732.200195-5-david@redhat.com>
 <feffbbe8-4176-48e8-b503-ef53d7914197@suse.cz>
 <96c92857-4850-4f85-9474-ac193c5ea48c@redhat.com>
 <04c1d28e-bbea-4499-9a6d-770f9ca53ba9@suse.cz>
 <d736f1c0-343e-4031-88ba-3b33b73dbeba@redhat.com>
 <Z1AaC5Hj2RV_5FDD@localhost.localdomain>
 <15096b27-6f27-45fc-8a8b-de781a9c42a5@suse.cz>
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
In-Reply-To: <15096b27-6f27-45fc-8a8b-de781a9c42a5@suse.cz>
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: F26A72115C
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Dec 04, 2024 at 10:03:28AM +0100, Vlastimil Babka wrote:
> On 12/4/24 09:59, Oscar Salvador wrote:
> > On Tue, Dec 03, 2024 at 08:19:02PM +0100, David Hildenbrand wrote:
> >> It was always set using "GFP_USER | __GFP_MOVABLE | __GFP_RETRY_MAYFAIL",
> >> and I removed the same flag combination in #2 from memory offline code, and
> >> we do have the exact same thing in do_migrate_range() in
> >> mm/memory_hotplug.c.
> >> 
> >> We should investigate if__GFP_HARDWALL is the right thing to use here, and
> >> if we can get rid of that by switching to GFP_KERNEL in all these places.
> > 
> > Why would not we want __GFP_HARDWALL set?
> > Without it, we could potentially migrate the page to a node which is not
> > part of the cpuset of the task that originally allocated it, thus violating the
> > policy? Is not that a problem?
> 
> The task doing the alloc_contig_range() will likely not be the same task as
> the one that originally allocated the page, so its policy would be
> different, no? So even with __GFP_HARDWALL we might be already migrating
> outside the original tasks's constraint? Am I missing something?

Yes, that is right, I thought we derive the policy from the old page
somehow when migrating it, but reading the code does not seem to be the
case.

Looking at prepare_alloc_pages(), if !ac->nodemask, which would be the
case here, we would get the policy from the current task
(alloc_contig_range()) when cpusets are enabled.

So yes, I am a bit puzzled why __GFP_HARDWALL was chosen in the first
place.


-- 
Oscar Salvador
SUSE Labs

