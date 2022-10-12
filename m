Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1CB5FC624
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 15:14:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnY505HD8z3bxp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 00:13:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=gDDtqy2G;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=OWCSrc95;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=gDDtqy2G;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=OWCSrc95;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnY3y1RCYz3bjB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 00:13:00 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id C0B415C008B;
	Wed, 12 Oct 2022 09:12:56 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Wed, 12 Oct 2022 09:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1665580376; x=1665666776; bh=Ct4fEaGcnx
	W60ym69bXCH9mc9qXYaXsYB/Q4TrRfNec=; b=gDDtqy2G6/6ho8fsUc2YXwQBNy
	qDV9YtM36YfT/3GCfD5l/gpVQMsIkKRm1+8hVv7KWOBvguYwxYgrdc82rQYoR6j+
	Sprdv8wKqTKDxZ+5QCgLDsAm3SgRkU/g3bDfxfFgplzoGKQtPj4Nwz50AGvbxeOO
	hxrCnwMfk6eKrCenRifiNywRyiz1LYLBSA2OdFNbXS0BVSuoWBpaTfzyptQKHxLI
	urHMKY0Rq9CZlOESkHl6iI6Cx3w6SbXp14Ht89wEoj4JUWycoyHXwglQdvOx+0qc
	puBAbrYvDqm8+Xr4AWmLbdyfG5YIQDDCQIx/vzbWQy3f/LXNDnG1RSIFdh+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1665580376; x=1665666776; bh=Ct4fEaGcnxW60ym69bXCH9mc9qXY
	aXsYB/Q4TrRfNec=; b=OWCSrc95pvOMPngNghm6dRIUz7Fu8nhJoQ+BtGUnfmsK
	qLWORC8NXA5dMYP+euL376k3W2dX+gaOgp3NyJQN82POobBdn/jzpj+tpFMYSrS6
	cJcdRr3ERrJ06jXmLznEb0wiSXRvRdAOZ6mEEupKYqQCnTt+tLU5fqEfqdZGmGVV
	Z1o9Yqa7IJFDDLUXSvXpCIUbmCxrXugJS3K47ayuFjOk+7ev1TdQ3YYZHpWIUJuH
	vzb33UGIMNSSaYckRf426yL3PsCItJRTOSYszLwLwZK8hZ4BE4z0bRgejy3pf36d
	TAdEB9+WhwNOGRa9JZg6AxRLFRPjms5J1n+ZaXKPMQ==
X-ME-Sender: <xms:V71GY1tLyb_WNCtKs15Ax3e6mdFrSXDacvy9pZhhUKgWJjcObi0EpA>
    <xme:V71GY-fzQizqk0DYmFiix058HHWHSTXbbXoUDTHkcFX8kp2j9b3aqrgFkZnWMdttV
    GKOFQmSjxwWB7iaI6s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejkedgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:V71GY4y79yGSFADeJ9PKUx1GR9V7C-EhPqoHbNIB1yDBRljZ7diIxQ>
    <xmx:V71GY8MO7pr2wyWx3LQzjlnX1JDgzuQToLBlopABlU2rToG9UUJk0A>
    <xmx:V71GY18_p8p8ZKnhcSRjjtOXljK9OTHNgijLkAvXN-L-2sVMFDeP3w>
    <xmx:WL1GYzd62EJ-m16rv6rM-Nyi139F_5k6EdB13ttyD2lZD0pLxUQP_A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9653DB60086; Wed, 12 Oct 2022 09:12:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <76d8a408-fc3e-4bd1-91c5-8278f7469979@app.fastmail.com>
In-Reply-To: <0a15ecf5-939d-3b00-bcde-0fc7b449cfda@suse.de>
References: <20220928105010.18880-1-tzimmermann@suse.de>
 <20220928105010.18880-6-tzimmermann@suse.de>
 <23333ff7-3ae1-494f-7abe-62da6698fd00@redhat.com>
 <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
 <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
 <fda959d7-1bae-716f-f01b-66d9db9096e0@suse.de>
 <654e3cfe-80d7-46c9-8e5e-461846e4df35@app.fastmail.com>
 <866c7033-0d4e-7b5d-008c-8eb16f99498b@suse.de>
 <f26ca6a1-feb1-4822-ac96-bc484b22f8a0@app.fastmail.com>
 <c80a6e2d-a3b9-8186-cc95-97c4775171ed@suse.de>
 <fc33ebf7-ecb7-4686-ac31-0118a40595f6@app.fastmail.com>
 <0a15ecf5-939d-3b00-bcde-0fc7b449cfda@suse.de>
Date: Wed, 12 Oct 2022 15:12:35 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "David Airlie" <airlied@linux.ie>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Helge Deller" <deller@gmx.de>, "Maxime Ripard" <maxime@cerno.tech>,
 sam@ravnborg.org, "Michal Suchanek" <msuchanek@suse.de>,
 "Michael Ellerman" <mpe@ellerman.id.au>, benh@kernel.crashing.org,
 "Paul Mackerras" <paulus@samba.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>, mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 12, 2022, at 2:00 PM, Thomas Zimmermann wrote:
>
> Could well be. But ofdrm intents to replace offb and this test has 
> worked well in offb for almost 15 yrs. If there are bug reports, I'm 
> happy to take patches, but until then I see no reason to change it.

I wouldn't change the code in offb unless a user reports a bug,
but I don't see a point in adding the same mistake to ofdrm if we
know it can't work on real hardware.

I tried to find out where this is configured in qemu, but it seems
to depend on the framebuffer backend there: most are always little-endian,
ati/bochs/vga-pci/virtio-vga are configurable from the guest through
some register setting, but vga.c picks a default from the
'TARGET_WORDS_BIGENDIAN' macro, which I think is set differently
between qemu-system-ppc64le and qemu-system-ppc64.

If you are using the framebuffer code from vga.c, I would guess that
that you can run a big-endian kernel with qemu-system-ppc64,
or a little-endian kernel with qemu-system-ppc64le and get the
correct colors, while running a little-endian kernel with
qemu-system-ppc64 and vga.c, or using a different framebuffer
emulation on a big-endian kernel would give you the wrong colors.

Which combinations did you actually test?

     Arnd
