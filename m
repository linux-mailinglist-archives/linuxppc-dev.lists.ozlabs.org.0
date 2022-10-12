Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C88DB5FC75D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 16:28:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnZkZ650rz3bls
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 01:28:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=HyPb1yFQ;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pRJzz5ay;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=HyPb1yFQ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pRJzz5ay;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnZjb106kz2x9J
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 01:27:14 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 936DF1F45F;
	Wed, 12 Oct 2022 14:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1665584830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bUIoEZRTB9r1lwBbrkvBK28f0PkDXtp6GQxBtOrWsPI=;
	b=HyPb1yFQquCok37hotWVp1+Zij1t1706TKbh4gACWlWrc5llFVQAubq5qlfdM1tGfbLTgi
	ezhLbkMtSQWqUd9V6dSfc+LEIHIjxy69utiEs0a4E4IcG2c0XP3HSe0u88uFDnXHm0FlVq
	eIp4ihby3219zuNZU47kbkC73YglsD8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1665584830;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bUIoEZRTB9r1lwBbrkvBK28f0PkDXtp6GQxBtOrWsPI=;
	b=pRJzz5ayEEG0IBdG1KJosmLHta58ronj+wi2sA0HDRLfAlEyZonma7ygjpcxKNKwRVx+qE
	yKf4wDpmaaHxn/BQ==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 8B2BA2C141;
	Wed, 12 Oct 2022 14:27:08 +0000 (UTC)
Date: Wed, 12 Oct 2022 16:27:07 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
Message-ID: <20221012142707.GD28810@kitsune.suse.cz>
References: <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
 <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
 <fda959d7-1bae-716f-f01b-66d9db9096e0@suse.de>
 <654e3cfe-80d7-46c9-8e5e-461846e4df35@app.fastmail.com>
 <866c7033-0d4e-7b5d-008c-8eb16f99498b@suse.de>
 <f26ca6a1-feb1-4822-ac96-bc484b22f8a0@app.fastmail.com>
 <c80a6e2d-a3b9-8186-cc95-97c4775171ed@suse.de>
 <fc33ebf7-ecb7-4686-ac31-0118a40595f6@app.fastmail.com>
 <0a15ecf5-939d-3b00-bcde-0fc7b449cfda@suse.de>
 <76d8a408-fc3e-4bd1-91c5-8278f7469979@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76d8a408-fc3e-4bd1-91c5-8278f7469979@app.fastmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, Helge Deller <deller@gmx.de>, linuxppc-dev@lists.ozlabs.org, mark.cave-ayland@ilande.co.uk, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>, Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>, Geert Uytterhoeven <geert@linux-m68k.org>, sam@ravnborg.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Wed, Oct 12, 2022 at 03:12:35PM +0200, Arnd Bergmann wrote:
> On Wed, Oct 12, 2022, at 2:00 PM, Thomas Zimmermann wrote:
> >
> > Could well be. But ofdrm intents to replace offb and this test has 
> > worked well in offb for almost 15 yrs. If there are bug reports, I'm 
> > happy to take patches, but until then I see no reason to change it.
> 
> I wouldn't change the code in offb unless a user reports a bug,
> but I don't see a point in adding the same mistake to ofdrm if we
> know it can't work on real hardware.
> 
> I tried to find out where this is configured in qemu, but it seems
> to depend on the framebuffer backend there: most are always little-endian,
> ati/bochs/vga-pci/virtio-vga are configurable from the guest through
> some register setting, but vga.c picks a default from the
> 'TARGET_WORDS_BIGENDIAN' macro, which I think is set differently
> between qemu-system-ppc64le and qemu-system-ppc64.
> 
> If you are using the framebuffer code from vga.c, I would guess that
> that you can run a big-endian kernel with qemu-system-ppc64,
> or a little-endian kernel with qemu-system-ppc64le and get the
> correct colors, while running a little-endian kernel with
> qemu-system-ppc64 and vga.c, or using a different framebuffer
> emulation on a big-endian kernel would give you the wrong colors.

Thanks for digging this up.

That makes one thing clear: qemu does not emulate this framebuffer
property correctly, and cannot be relied on for verification.

If you can provide test results from real hardware that show the current
logic as flawed it should be changed.

In absence of such test results I think the most reasonable thing is to
keep the logic that nobody complained about for 10+ years.

Thanks

Michal
