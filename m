Return-Path: <linuxppc-dev+bounces-17446-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2B9QF3Goomkn4wQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17446-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Feb 2026 09:33:53 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 288951C16A0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Feb 2026 09:33:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fNJPk4xtrz3bjN;
	Sat, 28 Feb 2026 19:33:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772267626;
	cv=none; b=lXna91UeUyNMtVaBzT4vi/iXcbcjqNGi9SjkqPgMUymbYFejkg5kOVEw37aqyPSxmOxA9fToVVmF7PAnJIf70sqp94rLZxDP9T5eWOzgBPrIIjrwV2rCUG8Vm0DPqYe2+RsDt84V/v7LHMEA9K5Fmv5ty49ok17dOGcEfM6VlNIZOO7Mtg0QPmHuwl5Qf/AKzayBPYU/n6RB64fgZc3qye6ElwvhEJ+rgGVwynbqXcOk2xw3UTAuzmbbXAaGoEe0O8i/DTchmXQaOWpoGsHDMvpjpQ3t7hZzys3qV//PPdPj4MrDian5+nARII9S2CFKdZU0yGJ/xWkbHtR8/jXcmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772267626; c=relaxed/relaxed;
	bh=eXNJRNBKCpIULn24va1xFS7lT+j21mcqoDyWxckYkJU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jIyzxHLCxhaKHRElzhf2zYCWBqceWuup6rpMyRDF5EjO7t6ZgPaLNsoXQ/VEsUOWfmnQKHbjiF5s4Rr8v2S0s2grXJoRwfay+oSs4iSTmocraLEudep8M0oveSUoq3FAYVl+gsN1CMWcoDtv6bbbk+DimxueLIAQb8QxDdfOH7+vfWRzzaBZ44fK1aUka52QCzBz4WuUJdtUrQkWllfV/pfkbA8m1AIx7fG2izs7aN7D9x3WRm3OXIi+N+oTAsDP4iIoC2mxYDwBrLesCJHrYLKSP1JgLHc9SJQU18dAEbzS3dWnxfzXzZpdY0o7j8IHq0y4W6cwopt3skZjpDPTZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GcSG9wfh; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=v2Tpj0jq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=stYtJ938; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=z7ONblRo; dkim-atps=neutral; spf=pass (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GcSG9wfh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=v2Tpj0jq;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=stYtJ938;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=z7ONblRo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fNJPh57f2z30BR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Feb 2026 19:33:44 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ACD6A3F8E7;
	Sat, 28 Feb 2026 08:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772267613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eXNJRNBKCpIULn24va1xFS7lT+j21mcqoDyWxckYkJU=;
	b=GcSG9wfh7MXdVEH4anojkW3R5eYh7VqH2o8eJUpraFCSd0ioxPuOcqoF1+BPbFOWQ7jYnp
	UHFpnQtggIAkMMErtit1Tb2NWowBoI3TwtDVaouHP/XYychr+Czccpgdne3EhOcsY7Gu34
	REqDi67deh7vBEBgE3ix2Ek/+kiYuKQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772267613;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eXNJRNBKCpIULn24va1xFS7lT+j21mcqoDyWxckYkJU=;
	b=v2Tpj0jqtwVouxVCkSNrtpNVjQGf0IyDAuIuYdcLm1FM5RZW3aK177hafKGIChiO1PBS3X
	m3HUsVKjFHg3OrBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=stYtJ938;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=z7ONblRo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772267611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eXNJRNBKCpIULn24va1xFS7lT+j21mcqoDyWxckYkJU=;
	b=stYtJ938Z7u4ehosRybMS+f0aGVbgPuduOmgfZs0C/5rZI9yk3eXXnsgAk8YH24lJx60mj
	Zwu60BPK3fhQspdwgJCjtGWzRC+bpCJJMrh5eo4YacjiqC1ykisfpP0dKjFkUhtNTPQni6
	9FaAuDrJ5uxsx/dfA7Q9b4VvqcaedAg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772267611;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eXNJRNBKCpIULn24va1xFS7lT+j21mcqoDyWxckYkJU=;
	b=z7ONblRo7DyDe+Ikjg5ycJYke/fpkaQJynqvXKkji/kv70az+dGJdntWrmVeoeAJsGYLbk
	ik8MK7QfgudjRXCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7079B3EA65;
	Sat, 28 Feb 2026 08:33:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mUwiGluoomlyTAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 28 Feb 2026 08:33:31 +0000
Date: Sat, 28 Feb 2026 09:33:31 +0100
Message-ID: <87a4wt6zdw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v1] ALSA: aoa: Constify struct codec_connection
In-Reply-To: <4009c337cc1a1a57795562279270c03687973b3b.1772138640.git.christophe.jaillet@wanadoo.fr>
References: <4009c337cc1a1a57795562279270c03687973b3b.1772138640.git.christophe.jaillet@wanadoo.fr>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
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
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17446-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[wanadoo.fr];
	FORGED_SENDER(0.00)[tiwai@suse.de,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:christophe.jaillet@wanadoo.fr,m:johannes@sipsolutions.net,m:perex@perex.cz,m:tiwai@suse.com,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-sound@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tiwai@suse.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim]
X-Rspamd-Queue-Id: 288951C16A0
X-Rspamd-Action: no action

On Thu, 26 Feb 2026 21:44:10 +0100,
Christophe JAILLET wrote:
> 
> 'struct codec_connection' are not modified in this driver.
> 
> Constifying these structures moves some data to a read-only section, so
> increases overall security.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   10034	   3392	     12	  13438	   347e	sound/aoa/fabrics/layout.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   10370	   3040	     12	  13422	   346e	sound/aoa/fabrics/layout.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
> 
> The fabric_data field in struct aoa_codecis is only used in
> sound/aoa/fabrics/layout.c, so there should be no side effect for other
> files that include sound/aoa/aoa.h

Applied to for-next branch now.  Thanks.


Takashi

