Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id DE68E8CF89C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 May 2024 07:06:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=OFtu+AIv;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gKgvAIJr;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=OFtu+AIv;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gKgvAIJr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vnjzb5k1Bz79Fb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 May 2024 14:56:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=OFtu+AIv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gKgvAIJr;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=OFtu+AIv;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gKgvAIJr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vnjyt5fBgz3gMW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 May 2024 14:56:06 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1D5601F8BD;
	Mon, 27 May 2024 04:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716785763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xC5zp4HlZu07QkP75GPGGYKgpdHreqvBoXt6mnZlkEs=;
	b=OFtu+AIvEFBHI7CLLozC3h/eRZHm8F+B2wBXLlvWcSR+3kbPqOHglqZW6aTQ7l75/l1e4x
	XZfAbxQqlMCOH3ujBeCuGIFJeSUsqGMEl63asJ8IH/j6Di1uvzBemsF2ICZ4vlLm7rlzit
	DftKcNb86yaaxN+Mlh9ls7ix4sKsLqo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716785763;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xC5zp4HlZu07QkP75GPGGYKgpdHreqvBoXt6mnZlkEs=;
	b=gKgvAIJrkIFFeoKTrAZkAnnA+2IeuOQm55UrZ0Sh6aHkWiHBHRpf5XdVO55mjjnQGk0brV
	ak70Quay7XyHLjAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716785763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xC5zp4HlZu07QkP75GPGGYKgpdHreqvBoXt6mnZlkEs=;
	b=OFtu+AIvEFBHI7CLLozC3h/eRZHm8F+B2wBXLlvWcSR+3kbPqOHglqZW6aTQ7l75/l1e4x
	XZfAbxQqlMCOH3ujBeCuGIFJeSUsqGMEl63asJ8IH/j6Di1uvzBemsF2ICZ4vlLm7rlzit
	DftKcNb86yaaxN+Mlh9ls7ix4sKsLqo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716785763;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xC5zp4HlZu07QkP75GPGGYKgpdHreqvBoXt6mnZlkEs=;
	b=gKgvAIJrkIFFeoKTrAZkAnnA+2IeuOQm55UrZ0Sh6aHkWiHBHRpf5XdVO55mjjnQGk0brV
	ak70Quay7XyHLjAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9786713A6B;
	Mon, 27 May 2024 04:56:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9T1yImISVGaodAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 27 May 2024 04:56:02 +0000
Date: Mon, 27 May 2024 06:55:53 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v3 05/16] powerpc/mm: Fix __find_linux_pte() on 32
 bits with PMD leaf entries
Message-ID: <ZlQSWRvZuyaY886M@localhost.localdomain>
References: <cover.1716714720.git.christophe.leroy@csgroup.eu>
 <aa54834e9ee5e40179def32ff5834a8a2a02c413.1716714720.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa54834e9ee5e40179def32ff5834a8a2a02c413.1716714720.git.christophe.leroy@csgroup.eu>
X-Spam-Flag: NO
X-Spam-Score: -8.30
X-Spam-Level: 
X-Spamd-Result: default: False [-8.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.977];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,nvidia.com,redhat.com,ellerman.id.au,gmail.com,vger.kernel.org,kvack.org,lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
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

On Sun, May 26, 2024 at 11:22:25AM +0200, Christophe Leroy wrote:
> Building on 32 bits with pmd_leaf() not returning always false leads
> to the following error:
> 
>   CC      arch/powerpc/mm/pgtable.o
> arch/powerpc/mm/pgtable.c: In function '__find_linux_pte':
> arch/powerpc/mm/pgtable.c:506:1: error: function may return address of local variable [-Werror=return-local-addr]
>   506 | }
>       | ^
> arch/powerpc/mm/pgtable.c:394:15: note: declared here
>   394 |         pud_t pud, *pudp;
>       |               ^~~
> arch/powerpc/mm/pgtable.c:394:15: note: declared here
> 
> This is due to pmd_offset() being a no-op in that case.
> 
> So rework it for powerpc/32 so that pXd_offset() are used on real
> pointers and not on on-stack copies.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Maybe this could be folded into the patch that makes pmd_leaf() not returning
always false, but no strong feelings:

Reviewed-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
