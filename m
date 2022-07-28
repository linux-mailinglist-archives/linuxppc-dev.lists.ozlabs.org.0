Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0D7583CEA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 13:14:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ltp2R3hSLz2xkT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 21:14:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EvOuNhle;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ltp1r0X4bz2xHZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 21:14:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EvOuNhle;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ltp1h3XKzz4x1N;
	Thu, 28 Jul 2022 21:14:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1659006843;
	bh=wZItW5ZtKMHAK45zLNIh7lLY/k1xgG/tdE8BGbTrDhk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EvOuNhleqMSiHu7f5rYL6A7uO+J/Jiy3M00zpvoXyk2JKm3DFUp7iDR+lS3Y9doXt
	 pHsrS1Wz9/I3Uhn/+zUXi7njnfawpMliYynInvWYu+h3cRSobhCqiNjLfj98vAUu13
	 OAET0Ecz/FZdocX905JEmh3hY2QnI2QALYADJkoBMgcnXPnuetJ04OnWIQA38KHUVF
	 JyTcR+Ls9ax70KHCbAEFm6PkHhRglRzjm91nlbRtn/ChitPlpY3kvf2Q5z93oS/hms
	 LRbGTIFzRvZCrKGDbHZZHPzIdSEGe/2DlCWH3y26Q+dfV4jv0uKob/aCKd4HB0x7Y+
	 K4stznoQSRTyQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech,
 sam@ravnborg.org, msuchanek@suse.de, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 00/10] drm: Add driver for PowerPC OF displays
In-Reply-To: <20220720142732.32041-1-tzimmermann@suse.de>
References: <20220720142732.32041-1-tzimmermann@suse.de>
Date: Thu, 28 Jul 2022 21:13:59 +1000
Message-ID: <871qu5cww8.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:
> (was: drm: Add driverof PowerPC OF displays)
>
> PowerPC's Open Firmware offers a simple display buffer for graphics
> output. Add ofdrm, a DRM driver for the device. As with the existing
> simpledrm driver, the graphics hardware is pre-initialized by the
> firmware. The driver only provides blitting, no actual DRM modesetting
> is possible.

Hi Thomas,

I tried to test this on a 32-bit ppc Mac Mini but didn't have much luck.
But I'm probably doing something wrong because I'm a graphics noob.

The machine normally uses CONFIG_DRM_RADEON, so I turned that off, and
turned DRM_OFDRM on.

When I boot I get boot messages but only one screen worth, the messages
don't scroll at all, which is unusual. But I'm not sure if that's
related to ofdrm or something else.

The machine does come up, I can login via SSH. Is there some way to
start X to exercise the driver from an SSH login?

cheers
