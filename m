Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B59B8745D21
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:26:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=F05OyKor;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tuFNu4N3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qvms24YJdz3byX
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 23:25:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=F05OyKor;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tuFNu4N3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qvmr64nbFz2ym7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 23:25:10 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8851A219D0;
	Mon,  3 Jul 2023 13:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1688390705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pecUI4xOagetnVa0y89RSrIZk+VfXoyy55j+EXMIhrE=;
	b=F05OyKorIVsZtJqSMTMTx2t4OhAdEC/+OO3iv9HroaH4bvA/CM8OMjuNHFZ2+GEHEXkgqH
	uFTcf7/rSKY7BW3dM7dhnk9sWJ+2GIYX9wQmt+rLnjVoSivGha8kzGX57U01sopLZEhHYB
	IXoW6+Ab60AQaXMd1aiGey/SEvhI804=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688390705;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pecUI4xOagetnVa0y89RSrIZk+VfXoyy55j+EXMIhrE=;
	b=tuFNu4N3pjt+/HNuE1JNIS8OM3bR2Y7JFd2FQpVfNUN1FcT+bRDEe+pgdO0Pspz50R1ewD
	rihp3pAoxFfHeaBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EA3A6138FC;
	Mon,  3 Jul 2023 13:25:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 1n/1NzDMomQMGAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 03 Jul 2023 13:25:04 +0000
Date: Mon, 03 Jul 2023 15:25:04 +0200
Message-ID: <8735255dqn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH 1/6] media: v4l2: Add audio capture and output support
In-Reply-To: <d78e6ec3-a531-8fd4-a785-29b6712f83ae@xs4all.nl>
References: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
	<1688002673-28493-2-git-send-email-shengjiu.wang@nxp.com>
	<ZJ6o5fT4V4HXivFa@valkosipuli.retiisi.eu>
	<CAA+D8AND1yZ7eZLjBGxVF=i3hLMecUm-j7AVHN9npJi-4=3VrA@mail.gmail.com>
	<87h6ql5hch.wl-tiwai@suse.de>
	<43f0ecdf-7454-49ae-96b3-2eae5487e9a5@sirena.org.uk>
	<d78e6ec3-a531-8fd4-a785-29b6712f83ae@xs4all.nl>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, Jacopo Mondi <jacopo@jmondi.org>, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, nicoleotsuka@gmail.com, linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>, festevam@gmail.com, perex@perex.cz, mchehab@kernel.org, Shengjiu Wang <shengjiu.wang@gmail.com>, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 03 Jul 2023 15:12:55 +0200,
Hans Verkuil wrote:
> 
> On 03/07/2023 14:53, Mark Brown wrote:
> > On Mon, Jul 03, 2023 at 02:07:10PM +0200, Takashi Iwai wrote:
> >> Shengjiu Wang wrote:
> > 
> >>> There is no such memory to memory interface defined in ALSA.  Seems
> >>> ALSA is not designed for M2M cases.
> > 
> >> There is no restriction to implement memory-to-memory capture in ALSA
> >> framework.  It'd be a matter of the setup of PCM capture source, and
> >> you can create a corresponding kcontrol element to switch the mode or
> >> assign a dedicated PCM substream, for example.  It's just that there
> >> was little demand for that.
> > 
> > Yeah, it's not a terrible idea.  We might use it more if we ever get
> > better support for DSP audio, routing between the DSP and external
> > devices if driven from the CPU would be a memory to memory thing.
> > 
> >> I'm not much against adding the audio capture feature to V4L2,
> >> though, if it really makes sense.  But creating a crafted /dev/audio*
> >> doesn't look like a great idea to me, at least.
> > 
> > I've still not looked at the code at all.
> 
> My main concern is that these cross-subsystem drivers are a pain to
> maintain. So there have to be good reasons to do this.
> 
> Also it is kind of weird to have to use the V4L2 API in userspace to
> deal with a specific audio conversion. Quite unexpected.
> 
> But in the end, that's a decision I can't make.
> 
> So I wait for that feedback. Note that if the decision is made that this
> can use V4L2, then there is quite a lot more that needs to be done:
> documentation, new compliance tests, etc. It's adding a new API, and that
> comes with additional work...

All agreed.  Especially in this case, it doesn't have to be in V4L2
API, as it seems.

(Though, the support of audio on V4L2 might be useful if it's closely
tied with the a stream.  But that's another story.)


thanks,

Takashi
