Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C30D5FBD1A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 23:39:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mn8M0274wz3c2N
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 08:39:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wC/hF1Ny;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=TuFbMswD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wC/hF1Ny;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=TuFbMswD;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mn8L053pvz2xtF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 08:38:48 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id AF61F1FCF3;
	Tue, 11 Oct 2022 21:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1665524323; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HT6Li+iF0Huei/eJnoHamNCOr9aOW9HkL2tj0lBESgY=;
	b=wC/hF1Ny/hJY1jVHKsfExaX1+zfDSb84W4lZvBkL+iDBhyznquBZjNxSyD9cZMmCysJGlG
	eLJjFboUoFgxjA53maP3cgAQ9cgMM7URWuOtal12f5VFZwGgu34cVl07FXWdLCdgGsFrpf
	56vveVxG5mDY9Q/vF3X46n70Jj1HjtA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1665524323;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HT6Li+iF0Huei/eJnoHamNCOr9aOW9HkL2tj0lBESgY=;
	b=TuFbMswDOmZrTi3o8o5XH75BlGDCDWOHBFECy7skP9CenomkVYx40wAF/SE46A1oZgE16J
	oRs90C7DUPM6StAw==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 979B32C141;
	Tue, 11 Oct 2022 21:38:42 +0000 (UTC)
Date: Tue, 11 Oct 2022 23:38:41 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
Message-ID: <20221011213841.GA28810@kitsune.suse.cz>
References: <20220928105010.18880-1-tzimmermann@suse.de>
 <20220928105010.18880-6-tzimmermann@suse.de>
 <23333ff7-3ae1-494f-7abe-62da6698fd00@redhat.com>
 <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
 <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, Helge Deller <deller@gmx.de>, linuxppc-dev@lists.ozlabs.org, mark.cave-ayland@ilande.co.uk, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>, maxime@cerno.tech, Daniel Vetter <daniel@ffwll.ch>, Geert Uytterhoeven <geert@linux-m68k.org>, sam@ravnborg.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 11, 2022 at 10:06:59PM +0200, Arnd Bergmann wrote:
> On Tue, Oct 11, 2022, at 1:30 PM, Thomas Zimmermann wrote:
> > Am 11.10.22 um 09:46 schrieb Javier Martinez Canillas:
> >>> +static bool display_get_big_endian_of(struct drm_device *dev, struct device_node *of_node)
> >>> +{
> >>> +	bool big_endian;
> >>> +
> >>> +#ifdef __BIG_ENDIAN
> >>> +	big_endian = true;
> >>> +	if (of_get_property(of_node, "little-endian", NULL))
> >>> +		big_endian = false;
> >>> +#else
> >>> +	big_endian = false;
> >>> +	if (of_get_property(of_node, "big-endian", NULL))
> >>> +		big_endian = true;
> >>> +#endif
> >>> +
> >>> +	return big_endian;
> >>> +}
> >>> +
> >> 
> >> Ah, I see. The heuristic then is whether the build is BE or LE or if the Device
> >> Tree has an explicit node defining the endianess. The patch looks good to me:
> >
> > Yes. I took this test from offb.
> 
> Has the driver been tested with little-endian kernels though? While
> ppc32 kernels are always BE, you can build kernels as either big-endian
> or little-endian for most (modern) powerpc64 and arm/arm64 hardware,
> and I don't see why that should change the defaults of the driver
> when describing the same framebuffer hardware.

The original code was added with
commit 7f29b87a7779 ("powerpc: offb: add support for foreign endianness")

The hardware is either big-endian or runtime-switchable-endian. It makes
sense to assume big-endian when runnig big-endian and the DT does not
specify endian which is likely on a historical system.

It also makes sense to assume that on system with
runtime-switchable-endian the DT specifies the framebuffer endian.

If systems that only do little-endian exist or emerge later then it also
makes sense to assume that the framebuffer matches the host if not
specified.

I don't really see a problem here.

BTW is this used on arm and on what platform?

I do not see any bindings in dts.

Thanks

Michal
