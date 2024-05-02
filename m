Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEA88B957E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2024 09:46:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0kCiASM+;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3PxaclT8;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0kCiASM+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3PxaclT8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVQxP3Xm0z3cZn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2024 17:46:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0kCiASM+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3PxaclT8;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0kCiASM+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3PxaclT8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 85770 seconds by postgrey-1.37 at boromir; Thu, 02 May 2024 17:46:11 AEST
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VVQwg54Gkz3c2Z
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2024 17:46:11 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1B2CD1FBAF;
	Thu,  2 May 2024 07:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714635962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=grBrX5v5BMK7IiisGU8WUSwT0CHWzdkb4PZ4mBQewnU=;
	b=0kCiASM+3jGMhAqvGONuClyTbpR7p5db0zoU56cfzvj8ZLM1TibUzz1w1xMxYaPoEj0nk6
	6zO1slhkluZbunRsjK6LWnAoTDdxAEpLlgdWt82+iXrCk6ut27P3+9mux6/YtGiRHsPce0
	Q8WT8XRSSoZkls9WDZVKmlEqOdAX5gg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714635962;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=grBrX5v5BMK7IiisGU8WUSwT0CHWzdkb4PZ4mBQewnU=;
	b=3PxaclT8gno2WpuhwwnPIbk2kacgToaytnBHEwFzPUF+xZlvTtA4HU3gxAeJNZNwsBPr8W
	2eKgWDE02MgRsmCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0kCiASM+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3PxaclT8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714635962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=grBrX5v5BMK7IiisGU8WUSwT0CHWzdkb4PZ4mBQewnU=;
	b=0kCiASM+3jGMhAqvGONuClyTbpR7p5db0zoU56cfzvj8ZLM1TibUzz1w1xMxYaPoEj0nk6
	6zO1slhkluZbunRsjK6LWnAoTDdxAEpLlgdWt82+iXrCk6ut27P3+9mux6/YtGiRHsPce0
	Q8WT8XRSSoZkls9WDZVKmlEqOdAX5gg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714635962;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=grBrX5v5BMK7IiisGU8WUSwT0CHWzdkb4PZ4mBQewnU=;
	b=3PxaclT8gno2WpuhwwnPIbk2kacgToaytnBHEwFzPUF+xZlvTtA4HU3gxAeJNZNwsBPr8W
	2eKgWDE02MgRsmCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9AA6B13957;
	Thu,  2 May 2024 07:46:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hL2KJLlEM2biUwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 02 May 2024 07:46:01 +0000
Date: Thu, 02 May 2024 09:46:14 +0200
Message-ID: <87sez0k661.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
In-Reply-To: <ZjGhPz-bokg6ZbDJ@finisterre.sirena.org.uk>
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
	<20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310>
	<ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk>
	<20240430172752.20ffcd56@sal.lan>
	<ZjGhPz-bokg6ZbDJ@finisterre.sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 1B2CD1FBAF
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TAGGED_RCPT(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,xs4all.nl];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,nxp.com,xs4all.nl,iki.fi,chromium.org,samsung.com,vger.kernel.org,gmail.com,perex.cz,suse.com,alsa-project.org,lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Sebastian Fricke <sebastian.fricke@collabora.com>, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, hverkuil@xs4all.nl, linuxppc-dev@lists.ozlabs.org, sakari.ailus@iki.fi, festevam@gmail.com, perex@perex.cz, Mauro Carvalho Chehab <mchehab@kernel.org>, shengjiu.wang@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 01 May 2024 03:56:15 +0200,
Mark Brown wrote:
> 
> On Tue, Apr 30, 2024 at 05:27:52PM +0100, Mauro Carvalho Chehab wrote:
> > Mark Brown <broonie@kernel.org> escreveu:
> > > On Tue, Apr 30, 2024 at 10:21:12AM +0200, Sebastian Fricke wrote:
> 
> > > The discussion around this originally was that all the audio APIs are
> > > very much centered around real time operations rather than completely
> 
> > The media subsystem is also centered around real time. Without real
> > time, you can't have a decent video conference system. Having
> > mem2mem transfers actually help reducing real time delays, as it 
> > avoids extra latency due to CPU congestion and/or data transfers
> > from/to userspace.
> 
> Real time means strongly tied to wall clock times rather than fast - the
> issue was that all the ALSA APIs are based around pushing data through
> the system based on a clock.
> 
> > > That doesn't sound like an immediate solution to maintainer overload
> > > issues...  if something like this is going to happen the DRM solution
> > > does seem more general but I'm not sure the amount of stop energy is
> > > proportionate.
> 
> > I don't think maintainer overload is the issue here. The main
> > point is to avoid a fork at the audio uAPI, plus the burden
> > of re-inventing the wheel with new codes for audio formats,
> > new documentation for them, etc.
> 
> I thought that discussion had been had already at one of the earlier
> versions?  TBH I've not really been paying attention to this since the
> very early versions where I raised some similar "why is this in media"
> points and I thought everyone had decided that this did actually make
> sense.

Yeah, it was discussed in v1 and v2 threads, e.g.
  https://patchwork.kernel.org/project/linux-media/cover/1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com/#25485573

My argument at that time was how the operation would be, and the point
was that it'd be a "batch-like" operation via M2M without any timing
control.  It'd be a very special usage for for ALSA, and if any, it'd
be hwdep -- that is a very hardware-specific API implementation -- or
try compress-offload API, which looks dubious.

OTOH, the argument was that there is already a framework for M2M in
media API and that also fits for the batch-like operation, too.  So
was the thread evolved until now.


thanks,

Takashi
