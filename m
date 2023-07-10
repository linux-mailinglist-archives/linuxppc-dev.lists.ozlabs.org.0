Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D383F74DF66
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 22:36:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa1 header.b=CcwAZRGz;
	dkim=fail reason="signature verification failed" header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed1 header.b=vxQog57O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0G4g5bw8z3bwX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 06:36:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa1 header.b=CcwAZRGz;
	dkim=pass header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed1 header.b=vxQog57O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mailrelay6-1.pub.mailoutpod2-cph3.one.com (client-ip=2a02:2350:5:405::1; helo=mailrelay6-1.pub.mailoutpod2-cph3.one.com; envelope-from=sam@ravnborg.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 11725 seconds by postgrey-1.37 at boromir; Tue, 11 Jul 2023 06:35:43 AEST
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com (mailrelay6-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:405::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0G3g4k7fz3bNp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 06:35:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=IgD20OUQ8wy5rFFsoBYb/VGqjIM7D6p+vuvVuio9hik=;
	b=CcwAZRGze1nz78tsTeGG31sH+B/tjdH+6ekcCAKy3lsh8Fx6Y+YXCD/TmIei/HlJU/+CjyCRKUyPh
	 4CUMeeNCmxnxg5WnN8WYc+Y/3TRBu3GgBHOLLMWNEmjaKunSp3X6NAJPGuB+DxEkEZX+QnanSr3FYn
	 2wlZ5UBU9Zu+O246GL/D/HneI1rQcFtBUkUV1dNMCwn+vM9M1hVrPjLsgJxFcU87WZ4nq2Vtx30nj9
	 ArzioTOrLCz4P2HsQj4ZOuK/Fmh+TNaxaKUMNXnO1dvheypIb7/oOCjfcrCaYpZhivEpRMotLSbonb
	 DLfigJoJ7elOqxhN67CrfrrG5kpNeWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=IgD20OUQ8wy5rFFsoBYb/VGqjIM7D6p+vuvVuio9hik=;
	b=vxQog57Oi39/DPw2NHC1MnZmnCknkQQw5bg9fTJIlcxSuaigVTP3V2Z7GSu+tbSUPTOKht6NYG4oF
	 2pB/Sc4AQ==
X-HalOne-ID: de71c874-1f45-11ee-b17e-6f01c1d0a443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay6 (Halon) with ESMTPSA
	id de71c874-1f45-11ee-b17e-6f01c1d0a443;
	Mon, 10 Jul 2023 17:19:05 +0000 (UTC)
Date: Mon, 10 Jul 2023 19:19:03 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/17] fbdev: Remove FBINFO_DEFAULT and
 FBINFO_FLAG_DEFAULT flags
Message-ID: <20230710171903.GA14712@ravnborg.org>
References: <20230710130113.14563-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710130113.14563-1-tzimmermann@suse.de>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, linux-sh@vger.kernel.org, deller@gmx.de, linux-staging@lists.linux.dev, javierm@redhat.com, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, linux-input@vger.kernel.org, linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-geode@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Thomas,

On Mon, Jul 10, 2023 at 02:50:04PM +0200, Thomas Zimmermann wrote:
> Remove the unused flags FBINFO_DEFAULT and FBINFO_FLAG_DEFAULT from
> fbdev and drivers, as briefly discussed at [1]. Both flags were maybe
> useful when fbdev had special handling for driver modules. With
> commit 376b3ff54c9a ("fbdev: Nuke FBINFO_MODULE"), they are both 0
> and have no further effect.
> 
> Patches 1 to 7 remove FBINFO_DEFAULT from drivers. Patches 2 to 5
> split this by the way the fb_info struct is being allocated. All flags
> are cleared to zero during the allocation.
> 
> Patches 8 to 16 do the same for FBINFO_FLAG_DEFAULT. Patch 8 fixes
> an actual bug in how arch/sh uses the tokne for struct fb_videomode,
> which is unrelated.
> 
> Patch 17 removes both flag constants from <linux/fb.h>

We have a few more flags that are unused - should they be nuked too?
FBINFO_HWACCEL_FILLRECT
FBINFO_HWACCEL_ROTATE
FBINFO_HWACCEL_XPAN

Unused as in no references from fbdev/core/*

I would rather see one series nuke all unused FBINFO flags in one go.
Assuming my quick grep are right and the above can be dropped.

	Sam
