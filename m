Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E408B7CD4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 18:28:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OCiswKJN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTQcR59M9z3cYl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 02:28:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OCiswKJN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mchehab@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTQbl3Qnmz3cPW
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2024 02:28:03 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 188D8614AE;
	Tue, 30 Apr 2024 16:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B2C0C2BBFC;
	Tue, 30 Apr 2024 16:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714494479;
	bh=u27bGd4V0G96pi8D9gvQaaGAkmUp7bSeoFGhoO/A8XE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OCiswKJNOu0sfl6Oov4FuPcbIbdEIAUmabyt1qX3yut7X6jtOUtNez6dT2UiSY6rd
	 UmyD5qSfJyubO8kEyMTErYCZFFaSEvieHPnBf/O2A4ovxK9v590e5J/L2+RHeaDufu
	 3aLtZ/r7wpN+MjcKfycQd3ZruzmmING/5cJxi/GHSRw/rwljtTiMnDsS3wfXBynfUg
	 B4fyEoVTtsQN7u/8lKgsS41p9O3Kp948p3GmD1zd0hA8sXXiyo/YefgCGzFrpWqMJ/
	 rBedlv16kTuD1X+QNkL5ru7Fpfk26uvfe2RSEm1+a4lgLtmlZkk9sQ1OLC8jaC+EHZ
	 oFr1SVAafVguA==
Date: Tue, 30 Apr 2024 17:27:52 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
Message-ID: <20240430172752.20ffcd56@sal.lan>
In-Reply-To: <ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk>
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
	<20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310>
	<ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk>
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Sebastian Fricke <sebastian.fricke@collabora.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-kernel@vger.kernel.org, tfiga@chromium.org, hverkuil@xs4all.nl, linuxppc-dev@lists.ozlabs.org, sakari.ailus@iki.fi, perex@perex.cz, linux-media@vger.kernel.org, shengjiu.wang@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Tue, 30 Apr 2024 23:46:03 +0900
Mark Brown <broonie@kernel.org> escreveu:

> On Tue, Apr 30, 2024 at 10:21:12AM +0200, Sebastian Fricke wrote:
> 
> > first of all thanks for all of this work and I am very sorry for only
> > emerging this late into the series, I sadly didn't notice it earlier.  
> 
> It might be worth checking out the discussion on earlier versions...
> 
> > 1. The biggest objection is, that the Linux Kernel has a subsystem
> > specifically targeted for audio devices, adding support for these
> > devices in another subsystem are counterproductive as they work around
> > the shortcomings of the audio subsystem while forcing support for a
> > device into a subsystem that was never designed for such devices.
> > Instead, the audio subsystem has to be adjusted to be able to support
> > all of the required workflows, otherwise, the next audio driver with
> > similar requirements will have to move to the media subsystem as well,
> > the audio subsystem would then never experience the required change and
> > soon we would have two audio subsystems.  
> 
> The discussion around this originally was that all the audio APIs are
> very much centered around real time operations rather than completely
> async memory to memory operations and that it's not clear that it's
> worth reinventing the wheel simply for the sake of having things in
> ALSA when that's already pretty idiomatic for the media subsystem.  It
> wasn't the memory to memory bit per se, it was the disconnection from
> any timing.

The media subsystem is also centered around real time. Without real
time, you can't have a decent video conference system. Having
mem2mem transfers actually help reducing real time delays, as it 
avoids extra latency due to CPU congestion and/or data transfers
from/to userspace.

> 
> > So instead of hammering a driver into the wrong destination, I would
> > suggest bundling our forces and implementing a general memory-to-memory
> > framework that both the media and the audio subsystem can use, that
> > addresses the current shortcomings of the implementation and allows you
> > to upload the driver where it is supposed to be.  
> 
> That doesn't sound like an immediate solution to maintainer overload
> issues...  if something like this is going to happen the DRM solution
> does seem more general but I'm not sure the amount of stop energy is
> proportionate.

I don't think maintainer overload is the issue here. The main
point is to avoid a fork at the audio uAPI, plus the burden
of re-inventing the wheel with new codes for audio formats,
new documentation for them, etc.

Regards,
Mauro
