Return-Path: <linuxppc-dev+bounces-3735-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 673FF9E2373
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 16:38:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2lCv0rSJz2xs7;
	Wed,  4 Dec 2024 02:38:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733240283;
	cv=none; b=ZZgGg7azxqP02LCOHvT/W/yNyTXg2TP4T3IwFLIAlSVKxaKrQOBS48ubHJ5oMl3z3ivGPAZ+XcViJ/fBFTMI9WcSjUfA0X5swp5io7RbQo8wXqrHc/uKZJhoChaXvn+IUP1OdpV76vzgZWgPMt1pO8E7xkpJWHHCLt2EHo3o8bl0Na1R558sQJ60Xz+UolyYtH9/l8F8I3dNQ2J9VKbJKL+vtm58sPvM+Z9DC9ecS2IC2N/VZSBYTHSpYw+DOfMq54TdOotZPbvoBym7ng1Nj4BbzS6RLLcKFvEJCx0olqBMM1j8pMwq0RwjN9up0ZEU+SuobRaEl2BHDls7R8Zf8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733240283; c=relaxed/relaxed;
	bh=RHb8MOnWhrezL6xDBmamy+BIYbJwg/hcDSsuLIyNMKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jo/ZbrGCifGichHmsuwXmLKjVNWxgb148BGr13FBLOWa4qJ8yVFoXpAoD0SP3CONIqXwl4IcxAmgh61nIm69KJw/RP/ulWPZIiapXBQb1pEALhYt7HMqAZFvXeQqKp8iBhQy1eFcH91Hm3zzTS+xB6b8yR/a1n8YyKyvsbWPKrQvBW8v0GlO5dtu3OWIiiwqodSTJt8U7BrAdGaq2a58LNiJP/Vm5MWkMtkBDED/sxvpD/nph18z0Cc04E7Hp6ypKRIMslG+xVoSZAKYO/Kr64qGcU0cXnkPZLmFej662JoQcLnc5MUlMdUoCFdt5kY9htjh4OPIdzB165tvVbHrOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PS54EpbB; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=P2746Q0s; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PS54EpbB; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=P2746Q0s; dkim-atps=neutral; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PS54EpbB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=P2746Q0s;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PS54EpbB;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=P2746Q0s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2lCs3qZZz2xs0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 02:38:01 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 066B51F445;
	Tue,  3 Dec 2024 15:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733239853; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RHb8MOnWhrezL6xDBmamy+BIYbJwg/hcDSsuLIyNMKs=;
	b=PS54EpbB3GsItM2TlmOBy9MwWXLh+ZtKNQPY9jKbgSYxnD4ODh6WKWO3wsJZyeMMcy8/8X
	THqYM/gYTMue0PF5FRt0pJlGPtmRtJLM9II/2lz+YV9kPSpIhWmgIbiJTaLlvZSzGhjCoS
	n4GKvQM7lOgDD/FJPPQZK1nJ40j5yjA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733239853;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RHb8MOnWhrezL6xDBmamy+BIYbJwg/hcDSsuLIyNMKs=;
	b=P2746Q0sIH/p8zHpc4SmyGUCWw1dQg+5ZsOLHETYVmbjcKXVxMeQxS39gv92jzbWEGeFMv
	PUSuHL2OuzgR3IDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733239853; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RHb8MOnWhrezL6xDBmamy+BIYbJwg/hcDSsuLIyNMKs=;
	b=PS54EpbB3GsItM2TlmOBy9MwWXLh+ZtKNQPY9jKbgSYxnD4ODh6WKWO3wsJZyeMMcy8/8X
	THqYM/gYTMue0PF5FRt0pJlGPtmRtJLM9II/2lz+YV9kPSpIhWmgIbiJTaLlvZSzGhjCoS
	n4GKvQM7lOgDD/FJPPQZK1nJ40j5yjA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733239853;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RHb8MOnWhrezL6xDBmamy+BIYbJwg/hcDSsuLIyNMKs=;
	b=P2746Q0sIH/p8zHpc4SmyGUCWw1dQg+5ZsOLHETYVmbjcKXVxMeQxS39gv92jzbWEGeFMv
	PUSuHL2OuzgR3IDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5739913A15;
	Tue,  3 Dec 2024 15:30:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZBpaEiwkT2ffSAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 03 Dec 2024 15:30:52 +0000
Date: Tue, 3 Dec 2024 16:30:50 +0100
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH RESEND v2 1/6] mm/page_isolation: don't pass gfp flags to
 isolate_single_pageblock()
Message-ID: <Z08kKtfC0F41WscX@localhost.localdomain>
References: <20241203094732.200195-1-david@redhat.com>
 <20241203094732.200195-2-david@redhat.com>
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
In-Reply-To: <20241203094732.200195-2-david@redhat.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-8.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,lists.ozlabs.org,linux-foundation.org,nvidia.com,ellerman.id.au,gmail.com,csgroup.eu,kernel.org,linux.ibm.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Score: -8.30
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Dec 03, 2024 at 10:47:27AM +0100, David Hildenbrand wrote:
> The flags are no longer used, we can stop passing them to
> isolate_single_pageblock().
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs

