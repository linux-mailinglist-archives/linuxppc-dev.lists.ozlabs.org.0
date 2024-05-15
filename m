Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D9E8C64EA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 12:20:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=LuntKrpi;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Ic6aR64+;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=LuntKrpi;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Ic6aR64+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfTkk00xfz3cXs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 20:20:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=LuntKrpi;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Ic6aR64+;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=LuntKrpi;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Ic6aR64+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfTjy0dkNz30Wn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 20:19:49 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4719833A33;
	Wed, 15 May 2024 10:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715768383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/WcIX7aYgrF5z87fxeBmfRGYcPU8ynjCCVZypleGzlQ=;
	b=LuntKrpiFO0c3TV3TilWxFY+6ACqhtdTjrgI9mEDVJnMIeh++UG6f7bnw6Nhnp96+Wq1jh
	rkSEi4Tf8r/lJJFdQ2GNA7hDvLi40zf37RH/kkLnX26UOHz8TQj+p+TgPMmeCVloOlRLuH
	uVbxQo7cy30DmknHdjS9cDBrgSpBiFk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715768383;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/WcIX7aYgrF5z87fxeBmfRGYcPU8ynjCCVZypleGzlQ=;
	b=Ic6aR64+5T59q/QkWj7My1F1gI0I76pVeHSGYkinZvkHxW1hsrkFisriLEYnbPuBfm5rhl
	TpfNNAGQHtrBsfBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715768383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/WcIX7aYgrF5z87fxeBmfRGYcPU8ynjCCVZypleGzlQ=;
	b=LuntKrpiFO0c3TV3TilWxFY+6ACqhtdTjrgI9mEDVJnMIeh++UG6f7bnw6Nhnp96+Wq1jh
	rkSEi4Tf8r/lJJFdQ2GNA7hDvLi40zf37RH/kkLnX26UOHz8TQj+p+TgPMmeCVloOlRLuH
	uVbxQo7cy30DmknHdjS9cDBrgSpBiFk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715768383;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/WcIX7aYgrF5z87fxeBmfRGYcPU8ynjCCVZypleGzlQ=;
	b=Ic6aR64+5T59q/QkWj7My1F1gI0I76pVeHSGYkinZvkHxW1hsrkFisriLEYnbPuBfm5rhl
	TpfNNAGQHtrBsfBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B5BFB139B3;
	Wed, 15 May 2024 10:19:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jrUhKz6MRGZoNAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 May 2024 10:19:42 +0000
Date: Wed, 15 May 2024 12:19:59 +0200
Message-ID: <87o7975qcw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
In-Reply-To: <8a6f84ac-5813-4954-b852-84f5118e607c@perex.cz>
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
	<20240430172752.20ffcd56@sal.lan>
	<ZjGhPz-bokg6ZbDJ@finisterre.sirena.org.uk>
	<87sez0k661.wl-tiwai@suse.de>
	<20240502095956.0a8c5b26@sal.lan>
	<20240502102643.4ee7f6c2@sal.lan>
	<ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk>
	<20240503094225.47fe4836@sal.lan>
	<CAA+D8APfM3ayXHAPadHLty52PYE9soQM6o780=mZs+R4px-AOQ@mail.gmail.com>
	<22d94c69-7e9f-4aba-ae71-50cc2e5dd8ab@xs4all.nl>
	<51408e79-646d-4d23-bc5b-cd173d363327@linux.intel.com>
	<CAA+D8AM7+SvXBi=LKRqvJkLsrYW=nkHTfFe957z2Qzm89bc48g@mail.gmail.com>
	<cd71e8e8-b4dc-40ed-935e-a84c222997e6@linux.intel.com>
	<CAA+D8AMpLB0N++_iLWLN_qettNz-gKGQz2c2yLsY8qSycibkYg@mail.gmail.com>
	<2f771fe9-7c09-4e74-9b04-de52581133fd@linux.intel.com>
	<CAA+D8AMJKPVR99jzYCR5EsbMa8P95jQrDL=4ayYMuz+Cu1d2mQ@mail.gmail.com>
	<28d423b1-49d8-4180-8394-622b1afd9cd9@perex.cz>
	<850a80b2-d952-4c14-bd0b-98cb5a5c0233@perex.cz>
	<c5dbb765-8c93-4050-84e1-c0f63b43d6c2@xs4all.nl>
	<8a6f84ac-5813-4954-b852-84f5118e607c@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,xs4all.nl];
	FREEMAIL_CC(0.00)[xs4all.nl,gmail.com,linux.intel.com,kernel.org,collabora.com,nxp.com,iki.fi,chromium.org,samsung.com,vger.kernel.org,suse.com,alsa-project.org,lists.ozlabs.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -1.80
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Sebastian Fricke <sebastian.fricke@collabora.com>, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, Hans Verkuil <hverkuil@xs4all.nl>, linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, sakari.ailus@iki.fi, festevam@gmail.com, Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?= <amadeuszx.slawinski@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 15 May 2024 11:50:52 +0200,
Jaroslav Kysela wrote:
> 
> On 15. 05. 24 11:17, Hans Verkuil wrote:
> > Hi Jaroslav,
> > 
> > On 5/13/24 13:56, Jaroslav Kysela wrote:
> >> On 09. 05. 24 13:13, Jaroslav Kysela wrote:
> >>> On 09. 05. 24 12:44, Shengjiu Wang wrote:
> >>>>>> mem2mem is just like the decoder in the compress pipeline. which is
> >>>>>> one of the components in the pipeline.
> >>>>> 
> >>>>> I was thinking of loopback with endpoints using compress streams,
> >>>>> without physical endpoint, something like:
> >>>>> 
> >>>>> compress playback (to feed data from userspace) -> DSP (processing) ->
> >>>>> compress capture (send data back to userspace)
> >>>>> 
> >>>>> Unless I'm missing something, you should be able to process data as fast
> >>>>> as you can feed it and consume it in such case.
> >>>>> 
> >>>> 
> >>>> Actually in the beginning I tried this,  but it did not work well.
> >>>> ALSA needs time control for playback and capture, playback and capture
> >>>> needs to synchronize.  Usually the playback and capture pipeline is
> >>>> independent in ALSA design,  but in this case, the playback and capture
> >>>> should synchronize, they are not independent.
> >>> 
> >>> The core compress API core no strict timing constraints. You can eventually0
> >>> have two half-duplex compress devices, if you like to have really independent
> >>> mechanism. If something is missing in API, you can extend this API (like to
> >>> inform the user space that it's a producer/consumer processing without any
> >>> relation to the real time). I like this idea.
> >> 
> >> I was thinking more about this. If I am right, the mentioned use in gstreamer
> >> is supposed to run the conversion (DSP) job in "one shot" (can be handled
> >> using one system call like blocking ioctl).  The goal is just to offload the
> >> CPU work to the DSP (co-processor). If there are no requirements for the
> >> queuing, we can implement this ioctl in the compress ALSA API easily using the
> >> data management through the dma-buf API. We can eventually define a new
> >> direction (enum snd_compr_direction) like SND_COMPRESS_CONVERT or so to allow
> >> handle this new data scheme. The API may be extended later on real demand, of
> >> course.
> >> 
> >> Otherwise all pieces are already in the current ALSA compress API
> >> (capabilities, params, enumeration). The realtime controls may be created
> >> using ALSA control API.
> > 
> > So does this mean that Shengjiu should attempt to use this ALSA approach first?
> 
> I've not seen any argument to use v4l2 mem2mem buffer scheme for this
> data conversion forcefully. It looks like a simple job and ALSA APIs
> may be extended for this simple purpose.
> 
> Shengjiu, what are your requirements for gstreamer support? Would be a
> new blocking ioctl enough for the initial support in the compress ALSA
> API?

If it works with compress API, it'd be great, yeah.
So, your idea is to open compress-offload devices for read and write,
then and let them convert a la batch jobs without timing control?

For full-duplex usages, we might need some more extensions, so that
both read and write parameters can be synchronized.  (So far the
compress stream is a unidirectional, and the runtime buffer for a
single stream.)

And the buffer management is based on the fixed size fragments.  I
hope this doesn't matter much for the intended operation?


thanks,

Takashi
