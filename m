Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D8F58158B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 16:41:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lsfjl00fJz3c6k
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 00:41:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=slnjENGe;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+9jOMyM9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=slnjENGe;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+9jOMyM9;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lsfj41GmBz3bZY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 00:40:40 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id ED8121FEAA;
	Tue, 26 Jul 2022 14:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1658846426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eTmDdk3BCJXU66FNIOyDwXn3D4Z4E7It/BpD50zR37c=;
	b=slnjENGecyoF9cdEgc3AdMM/bgS3ZaMTCjuJhT/ATqsSIq8r2k+z9jerENWV2+GKZiz019
	IydVJQpgTKEvbsa17clvsvC2q/L4NvNOwqgQQMgtpcrTLiiusoTKu3CofLq1DdztGY4bLt
	dpm80iIgIcQHtQLXGDZzjssGyaBIWPw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1658846426;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eTmDdk3BCJXU66FNIOyDwXn3D4Z4E7It/BpD50zR37c=;
	b=+9jOMyM9GYJd8e7hl0Ul/rnbsYdkLNTVLbIlMof86f5aY6/bt7N77Vxg7HIHi07pzV74et
	uKa9ispc+GfyPZDA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 45C7B2C141;
	Tue, 26 Jul 2022 14:40:25 +0000 (UTC)
Date: Tue, 26 Jul 2022 16:40:24 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 09/10] drm/ofdrm: Add per-model device function
Message-ID: <20220726144024.GP17705@kitsune.suse.cz>
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-10-tzimmermann@suse.de>
 <7b1a2807-59c7-d524-af8e-1ec634c740a7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b1a2807-59c7-d524-af8e-1ec634c740a7@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie, deller@gmx.de, mark.cave-ayland@ilande.co.uk, linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org, paulus@samba.org, maxime@cerno.tech, daniel@ffwll.ch, geert@linux-m68k.org, sam@ravnborg.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Tue, Jul 26, 2022 at 03:38:37PM +0200, Javier Martinez Canillas wrote:
> On 7/20/22 16:27, Thomas Zimmermann wrote:
> > Add a per-model device-function structure in preparation of adding
> > color-management support. Detection of the individual models has been
> > taken from fbdev's offb.
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> [...]
> 
> > +static bool is_avivo(__be32 vendor, __be32 device)
> > +{
> > +	/* This will match most R5xx */
> > +	return (vendor == 0x1002) &&
> > +	       ((device >= 0x7100 && device < 0x7800) || (device >= 0x9400));
> > +}
> 
> Maybe add some constant macros to not have these magic numbers ?

This is based on the existing fbdev implementation's magic numbers:

drivers/video/fbdev/offb.c:                 ((*did >= 0x7100 && *did < 0x7800) ||

Of course, it would be great if somebody knowledgeable could clarify
those.

Thanks

Michal
