Return-Path: <linuxppc-dev+bounces-13751-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D94C32321
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 18:01:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1F8m0zldz3bfN;
	Wed,  5 Nov 2025 04:01:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762275672;
	cv=none; b=E7r16LnHVPxGjiu7tYVqqgq0X5J+hXJKDAugYJawhaW9eFNgutgzYj3VS9+9EwDSfUXo6c1jXX3X7UvLzPf0uRh9POnrgKS9YIldDXzIrU96JF/YnImkeTSPlAyw1XTs8uWjzEdaRvjROvHobuBvRbNPEI3UaCRI+gakJ5bxJ3239FJTx0uM4OmwI7/ywwyamIdBwLK3D6ntvTFP71vDkLT8KlVDzSr8yOhD3Pc+vSU8ieqVbC1tuIznUfU/C8/3/GwcWs2/ZtVGLHVUJZSbjd0rw02Vy2/SHPEp1PbTiDUvx+mLAysuWS3aAfTCT/pMxWeGTtMHZD23nHZvZ6IFAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762275672; c=relaxed/relaxed;
	bh=msCviUOqQwqvVyFOk3rEYYAZXEGn9KpBa6b6nSF729k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oFO6Hl7RAZYDaIOwFy9kucGHSieMQsUPeD08ae4dqrQ4W4Lg66/uBHWj/Vh9ECcYDHP9eg/mGGA0YkFm5WVjS8/7H4Zww3d/2cejxTXy3Hp148spTxjywbp6Y4oxiby2lr3sC/nA7VIe3r2fletkua81JWAZC7F8jzV76KVdgnx9e9V2KLsb57zkuYyGAeQcA0n1oHicakNKVCPvC3O4JhM5Qq99WhS99obBm8yeG3d2JfllXoUva35hUjETciEEQu+EMWd5r1knqYEJlCR+urgAfR1DXD5f4mKIPwWDAFaFzWniDwVrijqqJAcd59Ot88UoKwvesciSXPt1/8kefQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HUOSlfUN; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HUOSlfUN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1F8l1PMYz3bf8
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 04:01:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 191F04053E;
	Tue,  4 Nov 2025 17:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D304CC4CEF7;
	Tue,  4 Nov 2025 17:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762275669;
	bh=A5hVs65aVEjMq28wLqSGze1IxyHY/ziAOGAuCp034rU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HUOSlfUNGPF0XIHP239Y3KM2928OhCG/CMcUKqlFDLASvpETQEkQyq/5IIazW/w0S
	 wInfDwWPBMyjRGsWLjHji+VtSUmxr28A4Syxr1a8f6JDcmbgHgYXhzvxBehospKbPY
	 SycxH1UXRaCXTqPoV3f5LW00sD3+9313yA8FXb24FCOLAX7zrPwzO9DpiRLboBc+q8
	 XvqilpF5OoYQu2ZINL4nfSnnxZw+7XzH/WHKCq/ul1vcOF+zJPWHp36JIkyRwa+XAl
	 xJNKMGlLBKmIYLfr7tlTyGKkieEXhikFDwc0DjZu8FvZx7ckV+dqpodmIY69IEzor7
	 J4gJgJaSqDntQ==
Date: Tue, 4 Nov 2025 10:01:04 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	linuxppc-dev@lists.ozlabs.org, patches@lists.linux.dev
Subject: Re: [PATCH 2/2] macintosh/via-pmu-backlight: Include linux/of.h and
 uapi/linux/fb.h
Message-ID: <20251104170104.GA1416336@ax162>
References: <20250925-ppc-fixes-for-backlight-fb-h-removal-v1-0-d256858d86a6@kernel.org>
 <20250925-ppc-fixes-for-backlight-fb-h-removal-v1-2-d256858d86a6@kernel.org>
 <c1aecfba-fa12-4572-885d-925e9afa1494@suse.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1aecfba-fa12-4572-885d-925e9afa1494@suse.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Nov 04, 2025 at 01:43:26PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 26.09.25 um 01:46 schrieb Nathan Chancellor:
> > After the recent removal of the fb.h include from backlight.h, which
> > transitively included of.h, there are several errors from
> > via-pmu-backlight.c (errors from bl_curve not being properly defined
> > omitted):
> > 
> >    drivers/macintosh/via-pmu-backlight.c:22:20: error: 'FB_BACKLIGHT_LEVELS' undeclared here (not in a function)
> >       22 | static u8 bl_curve[FB_BACKLIGHT_LEVELS];
> >          |                    ^~~~~~~~~~~~~~~~~~~
> >    drivers/macintosh/via-pmu-backlight.c: In function 'pmu_backlight_get_level_brightness':
> >    drivers/macintosh/via-pmu-backlight.c:63:38: error: 'FB_BACKLIGHT_MAX' undeclared (first use in this function); did you mean 'BACKLIGHT_RAW'?
> >       63 |         pmulevel = bl_curve[level] * FB_BACKLIGHT_MAX / MAX_PMU_LEVEL;
> >          |                                      ^~~~~~~~~~~~~~~~
> >          |                                      BACKLIGHT_RAW
> >    drivers/macintosh/via-pmu-backlight.c: In function 'pmu_backlight_init':
> >    drivers/macintosh/via-pmu-backlight.c:144:17: error: implicit declaration of function 'of_machine_is_compatible' [-Wimplicit-function-declaration]
> >      144 |                 of_machine_is_compatible("AAPL,3400/2400") ||
> >          |                 ^~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > FB_BACKLIGHT_{LEVELS,MAX} are available from the userspace API fb.h so
> > just include that avoid dragging in the full fb.h header unnecessarily.
> > Include linux/of.h for of_machine_is_compatible().
> > 
> > Fixes: 9f218f9bb9d2 ("backlight: Do not include <linux/fb.h> in header file")
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> >   drivers/macintosh/via-pmu-backlight.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/macintosh/via-pmu-backlight.c b/drivers/macintosh/via-pmu-backlight.c
> > index 26bd9ed5e664..f7b7853b3802 100644
> > --- a/drivers/macintosh/via-pmu-backlight.c
> > +++ b/drivers/macintosh/via-pmu-backlight.c
> > @@ -11,7 +11,9 @@
> >   #include <asm/ptrace.h>
> >   #include <linux/adb.h>
> >   #include <linux/backlight.h>
> > +#include <linux/of.h>
> >   #include <linux/pmu.h>
> > +#include <uapi/linux/fb.h>
> 
> Should this not be <linux/fb.h> ?

It could be but as I mention above, this file only needs the UAPI
FB_BACKLIGHT_LEVELS and FB_BACKLIGHT_MAX constants so I did not really
feel like it was worth it to drag in the whole fb.h header.

> >   #include <asm/backlight.h>
> >   #define MAX_PMU_LEVEL 0xFF
> > 
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
> GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)
> 
> 

