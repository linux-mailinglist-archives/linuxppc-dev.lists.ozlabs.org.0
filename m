Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8CD583D7D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 13:32:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtpQr2gK4z3bnH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 21:32:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=WKraLZd3;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Gh/HNYvu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=WKraLZd3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Gh/HNYvu;
	dkim-atps=neutral
X-Greylist: delayed 161468 seconds by postgrey-1.36 at boromir; Thu, 28 Jul 2022 21:31:44 AEST
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtpQ84l4Yz2xHV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 21:31:44 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id B1CFA22D9F;
	Thu, 28 Jul 2022 11:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1659007896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T4hQ/srl6ezx6qKxwYZFZoIzdHVMVGWAztMtWSsODRU=;
	b=WKraLZd3Nx1mQi2HCCD6z59bZmbtSTHs2bmXmI6OQ3rVhAwOgBSCRZcdwvb/ikns0uqwrt
	tGIgXCIY+4dbUN7I273qjDjRWtuA1q/1Q6xTHivSXnpJM955uXQltYYcY2zKust3TXg6Tq
	k12UHAjsTAUsAVY4q3YoTsrsDmWuUuE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1659007896;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T4hQ/srl6ezx6qKxwYZFZoIzdHVMVGWAztMtWSsODRU=;
	b=Gh/HNYvu/lj5tV+p2GbSX4mtEPX6FWpozm40/6neq0aYbAiVlEACdEK6b4/xPj4MiFIioX
	TBy2Jz+a0EBUxCCA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 626C42C141;
	Thu, 28 Jul 2022 11:31:32 +0000 (UTC)
Date: Thu, 28 Jul 2022 13:31:31 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 00/10] drm: Add driver for PowerPC OF displays
Message-ID: <20220728113131.GS17705@kitsune.suse.cz>
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <871qu5cww8.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871qu5cww8.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie, deller@gmx.de, linuxppc-dev@lists.ozlabs.org, mark.cave-ayland@ilande.co.uk, javierm@redhat.com, dri-devel@lists.freedesktop.org, paulus@samba.org, maxime@cerno.tech, daniel@ffwll.ch, geert@linux-m68k.org, sam@ravnborg.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Thu, Jul 28, 2022 at 09:13:59PM +1000, Michael Ellerman wrote:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
> > (was: drm: Add driverof PowerPC OF displays)
> >
> > PowerPC's Open Firmware offers a simple display buffer for graphics
> > output. Add ofdrm, a DRM driver for the device. As with the existing
> > simpledrm driver, the graphics hardware is pre-initialized by the
> > firmware. The driver only provides blitting, no actual DRM modesetting
> > is possible.
> 
> Hi Thomas,
> 
> I tried to test this on a 32-bit ppc Mac Mini but didn't have much luck.
> But I'm probably doing something wrong because I'm a graphics noob.
> 
> The machine normally uses CONFIG_DRM_RADEON, so I turned that off, and
> turned DRM_OFDRM on.
> 
> When I boot I get boot messages but only one screen worth, the messages
> don't scroll at all, which is unusual. But I'm not sure if that's
> related to ofdrm or something else.

A somewhat interesting datapoint might be how this works with offb.

> The machine does come up, I can login via SSH. Is there some way to
> start X to exercise the driver from an SSH login?

The startx script provided by distribution usually works.

It's basically a very convoluted way to do something like

X :0&
DISPLAY=:0 xterm&

Thanks

Michal
