Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D026A8BA911
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 10:43:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JIt7IELV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VW4843CWYz3cVx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 18:43:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JIt7IELV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=mchehab@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VW47J1nk0z2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 18:42:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E42F61CDF;
	Fri,  3 May 2024 08:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B42C116B1;
	Fri,  3 May 2024 08:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714725753;
	bh=MET1Qlb3RINT8Dmpmt3ZV/bGlWPZcEfr50B9DIeHIIU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JIt7IELVzP41blGAllJ9i8j/HS//Q/20ZO9vPGBh8jb46CD6lFpzHqh6QbE6VgOY2
	 rJ0dQ5I+IE0MHPV9U+hn8BD4+lTOpcGpli29Gue6Q+GNcsz3a7uW5wTQIFIANNh+Ih
	 c90B5GxcJU4Cen1jbpOB4Zq19rfVUU6XKR22jYI1ONTpok0fBVYIjBsIR3QRN0ahOE
	 EVgqqfIW5tpxj3/tw0fzx3mKx7ybFh3xANShJf3fLXLHHirdNjAi6igogfygNFNiq/
	 SpV2vQXcG/lvkopazpgf9f7UFEovF26N5XMXxRn63f9Z9ZxfaOK5OjI2Mh6NBcdWM8
	 01uL84MAgn/gw==
Date: Fri, 3 May 2024 09:42:25 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
Message-ID: <20240503094225.47fe4836@sal.lan>
In-Reply-To: <ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk>
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
	<20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310>
	<ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk>
	<20240430172752.20ffcd56@sal.lan>
	<ZjGhPz-bokg6ZbDJ@finisterre.sirena.org.uk>
	<87sez0k661.wl-tiwai@suse.de>
	<20240502095956.0a8c5b26@sal.lan>
	<20240502102643.4ee7f6c2@sal.lan>
	<ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Sebastian Fricke <sebastian.fricke@collabora.com>, Xiubo.Lee@gmail.com, Takashi Iwai <tiwai@suse.de>, festevam@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-kernel@vger.kernel.org, tfiga@chromium.org, hverkuil@xs4all.nl, linuxppc-dev@lists.ozlabs.org, sakari.ailus@iki.fi, perex@perex.cz, linux-media@vger.kernel.org, shengjiu.wang@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Fri, 3 May 2024 10:47:19 +0900
Mark Brown <broonie@kernel.org> escreveu:

> On Thu, May 02, 2024 at 10:26:43AM +0100, Mauro Carvalho Chehab wrote:
> > Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:  
> 
> > > There are still time control associated with it, as audio and video
> > > needs to be in sync. This is done by controlling the buffers size 
> > > and could be fine-tuned by checking when the buffer transfer is done.  
> 
> ...
> 
> > Just complementing: on media, we do this per video buffer (or
> > per half video buffer). A typical use case on cameras is to have
> > buffers transferred 30 times per second, if the video was streamed 
> > at 30 frames per second.   
> 
> IIRC some big use case for this hardware was transcoding so there was a
> desire to just go at whatever rate the hardware could support as there
> is no interactive user consuming the output as it is generated.

Indeed, codecs could be used to just do transcoding, but I would
expect it to be a border use case. See, as the chipsets implementing 
codecs are typically the ones used on mobiles, I would expect that
the major use cases to be to watch audio and video and to participate
on audio/video conferences.

Going further, the codec API may end supporting not only transcoding
(which is something that CPU can usually handle without too much
processing) but also audio processing that may require more 
complex algorithms - even deep learning ones - like background noise
removal, echo detection/removal, volume auto-gain, audio enhancement
and such.

On other words, the typical use cases will either have input
or output being a physical hardware (microphone or speaker).

> > I would assume that, on an audio/video stream, the audio data
> > transfer will be programmed to also happen on a regular interval.  
> 
> With audio the API is very much "wake userspace every Xms".
