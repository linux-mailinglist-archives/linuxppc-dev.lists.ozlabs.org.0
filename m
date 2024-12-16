Return-Path: <linuxppc-dev+bounces-4209-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D669F3959
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 19:54:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBpy61HRCz2ykf;
	Tue, 17 Dec 2024 05:54:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734360103;
	cv=none; b=n4vkAGR/U+XyauQE2IyQX0N0eQHqIqNWi5HjKayT2n4Ga4367pXDZAu5KgX/i8NeC5KJTx+JxRbDWB6vMwVsn0MD0+RdjLfYig83+p6k3mtnTijbBaSm/63m5gFGoU4YBDMnquBfEFbKWmU2yDiNKHtgNP+jHl/wF31E1GGf2zvrWbJtt3QRDJefkllCDi28ai1GQ+8pkDUWN6tY/vlvc+S59IL5nNSCeuAc3/761wSOWfEecI2kzVLf+370tBGQdMpdMlxkKkq+rB2A8ZR54QvcQW4w7jbznNT/pD45G/+PRWAovUdUp5/5foA+kqzEIfIOGmusWcgq7MTtiKapEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734360103; c=relaxed/relaxed;
	bh=h4e0o/EChopge9iHDGlCcrGi54fhpHon4WXwZ2Or538=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lanOv+UdRpbw/nzqetJAfE2j+0P2LD7Kh3/uwzgyQ0Aznv65IsKYcrkte/sn2oM4SH3OtBGzRgeRjSAQzZK9o/TGhz6zYMrrsetLVjoqe4e5Aai/VhYIYB15FxSDDP5nTFDOlcXItknXcESkTiUGMO29YJBYbYHAdTUzR7hK9Uc1v07WEeabCIC0pkTxcLUF4Zo+QAMQWAfcH1M0Qp3ZIc320Eorvf7toE0oClyY0ZFChIi903rgp9+wciHylKvCDdBxh/jJhSjTM0x2AanAhhcAJ6GHLtmYDJW3Ck0h18nvBag2880cMDHP5FsD3AtaZejVsj8laL6IPMg+uzJtkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256 header.s=google header.b=bJGlC+3C; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=simona.vetter@ffwll.ch; receiver=lists.ozlabs.org) smtp.mailfrom=ffwll.ch
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256 header.s=google header.b=bJGlC+3C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ffwll.ch (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=simona.vetter@ffwll.ch; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBjLt02YMz2xYs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 01:41:40 +1100 (AEDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso27355805e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 06:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1734360093; x=1734964893; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h4e0o/EChopge9iHDGlCcrGi54fhpHon4WXwZ2Or538=;
        b=bJGlC+3CEr1fTN0yHPBEuW3gMxHmL020tRWYEtcz4IyF/Dnr1wvtOqWCZZX303CXH1
         yMMz8kpWliVfMQmbynfGmiN4rjQ8rAFK3nJQtDOCM+SzuYAlQywm8ceQfBZAes+054y9
         Upifswyin5DofGNjJu4OnrjHhtE4+MrovltXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734360093; x=1734964893;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h4e0o/EChopge9iHDGlCcrGi54fhpHon4WXwZ2Or538=;
        b=ZaLG2dETlgncIE+TfDYyxTIW/um2Ro73qqN+4aTGnDogThrLR9ighYsLtLs+YnB9nl
         ks4LKXJZBXkCjk1gzb4/1yd0q8GPFqjoroCPLAWKzu3UgGfGFy9mC1bTsS5sxqbwK1nk
         gcOLd6JVaUMTDbsd1kHUKJ+tb0LVS8/65xe3zxXqtI6qTZAjlzHSgPT5u2P7o2rhYcXQ
         3bFcISL3UCkNezND7qXMFZSlb7RKsp5ZtqzwDS36nAkZ/uQN4+i5MkIuf5oo0gQPGE8K
         ms7gkLD4CawQXvTBQk+ojPKuh4TVDTdgX9KLfkoCd0WrS2wyAvPmOqEEvy+HuBGwn+CH
         N+HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUO75ZNu4olCRhj6WlmLVLbcc8OdNKrfAXK3VcFmS60T8UeVYnGZXnMxz9mRIe4aUMvhVyZyobCQtFi4gw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyP6gYOepY/jjKnkvYjlk4Tbs7mqKFlcvlfDBwd38ZEUvhegb0d
	Tlb/u7+QF7rIdRnAevoCakxi0Nfz3nj1Di/6QbIR+2bOxZfcvDlSMrlr8iiz4cY=
X-Gm-Gg: ASbGnctu13bWckhKsbIwG62XBR7tgJU6Xddv5UvdJkrOsstIkZvirc0XEUSkStzvcbk
	ZS2PoVRGRHjzn7vMSSsz+QiO+CRuRPZbmVHnCaR9gd0Vr41p8MSVJzfFTXXQPhlm19kfB2vXM32
	pMTIL3dJQPO95upNXifu0KZXucXT5NJbCSzsDhIs1+S6kffpVwq2JJO35CGpZ2NuLmMTrhgcUJT
	ua+XJBJ+EAHqh3juSiZAwwI7CDe9TcwZfwnb0vqr7DizQFwHn5bxEBEgvkmd2Rp9mo7
X-Google-Smtp-Source: AGHT+IHNuXaQbcaOzWDlJLVdH2VVVV7M1p7IawdDEoc0b+Y3XGEWD6gvsewijzhv1O9NvZ73cJsOkA==
X-Received: by 2002:a05:6000:1544:b0:385:f47a:e9d1 with SMTP id ffacd0b85a97d-38880ac7641mr8437760f8f.17.1734360092860;
        Mon, 16 Dec 2024 06:41:32 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8016c0bsm8410974f8f.42.2024.12.16.06.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 06:41:32 -0800 (PST)
Date: Mon, 16 Dec 2024 15:41:30 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Helge Deller <deller@gmx.de>, Jani Nikula <jani.nikula@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Simona Vetter <simona@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
Message-ID: <Z2A8Guea5d7cZoBj@phenom.ffwll.local>
References: <20241212100636.45875-1-tzimmermann@suse.de>
 <20241212100636.45875-2-tzimmermann@suse.de>
 <09edb59a-527a-4ddb-bfaf-ea74fb5a3023@gmx.de>
 <88ce6863-4458-47cb-9b28-274c91bd8764@app.fastmail.com>
 <87frmstrhd.fsf@intel.com>
 <2701e824-d330-49c0-88fa-a26658a9710c@gmx.de>
 <5566a3f5-496a-4b39-a0fa-6a1a5af9a67a@suse.de>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5566a3f5-496a-4b39-a0fa-6a1a5af9a67a@suse.de>
X-Operating-System: Linux phenom 6.12.3-amd64 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
	URIBL_SBL_A autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Dec 13, 2024 at 08:26:19AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> 
> Am 13.12.24 um 00:56 schrieb Helge Deller:
> > On 12/13/24 00:24, Jani Nikula wrote:
> > > On Thu, 12 Dec 2024, "Arnd Bergmann" <arnd@arndb.de> wrote:
> > > > On Thu, Dec 12, 2024, at 19:44, Helge Deller wrote:
> > > > > On 12/12/24 11:04, Thomas Zimmermann wrote:
> > > > > > Do not select BACKLIGHT_CLASS_DEVICE from FB_BACKLIGHT. The latter
> > > > > > only controls backlight support within fbdev core code and data
> > > > > > structures.
> > > > > > 
> > > > > > Make fbdev drivers depend on BACKLIGHT_CLASS_DEVICE and let users
> > > > > > select it explicitly. Fixes warnings about recursive dependencies,
> > > > > > such as [...]
> > > > > 
> > > > > I think in the fbdev drivers themselves you should do:
> > > > >     select BACKLIGHT_CLASS_DEVICE
> > > > > instead of "depending" on it.
> > > > > This is the way as it's done in the DRM tiny and the
> > > > > i915/gma500 DRM drivers.
> > > > > 
> > > > > So, something like:
> > > > > 
> > > > > --- a/drivers/staging/fbtft/Kconfig
> > > > >          tristate "Support for small TFT LCD display modules"
> > > > >          depends on FB && SPI
> > > > >          depends on FB_DEVICE
> > > > >     +    select BACKLIGHT_DEVICE_CLASS
> > > > >          depends on GPIOLIB || COMPILE_TEST
> > > > >          select FB_BACKLIGHT
> > > > > 
> > > > > config FB_BACKLIGHT
> > > > >             tristate
> > > > >             depends on FB
> > > > >     -      select BACKLIGHT_CLASS_DEVICE
> > > > >     +       depends on BACKLIGHT_CLASS_DEVICE
> > > > > 
> > > > > 
> > > > > Would that fix the dependency warning?
> > > > 
> > > > The above is generally a mistake and the root cause of the
> > > > dependency loops. With very few exceptions, the solution in
> > > > these cases is to find the inconsistent 'select' and change
> > > > it into 'depends on'.
> > > 
> > > Agreed.
> > 
> > That's fine, but my point is that it should be consistent.
> > For example:
> > 
> > ~:/git-kernel/linux$ grep -r "select.*BACKLIGHT_CLASS_DEVICE"
> > drivers/gpu/
> > drivers/gpu/drm/tilcdc/Kconfig: select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/nouveau/Kconfig:        select BACKLIGHT_CLASS_DEVICE if
> > DRM_NOUVEAU_BACKLIGHT
> > drivers/gpu/drm/nouveau/Kconfig:        select BACKLIGHT_CLASS_DEVICE if
> > ACPI && X86
> > drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/fsl-dcu/Kconfig:        select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/i915/Kconfig:   select BACKLIGHT_CLASS_DEVICE if ACPI
> > drivers/gpu/drm/gma500/Kconfig: select BACKLIGHT_CLASS_DEVICE if ACPI
> > drivers/gpu/drm/amd/amdgpu/Kconfig:     select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/xe/Kconfig:     select BACKLIGHT_CLASS_DEVICE if ACPI
> > drivers/gpu/drm/solomon/Kconfig:        select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/radeon/Kconfig: select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/renesas/shmobile/Kconfig:       select
> > BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/gud/Kconfig:    select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/bridge/Kconfig: select BACKLIGHT_CLASS_DEVICE
> > 
> > All major drm graphics drivers *select* BACKLIGHT_CLASS_DEVICE.
> > Are you changing them to "depend on" as well?
> 
> All these drivers should be changed to either 'depends on' or maybe 'imply'.

Yeah, select on non-leaf/library function Kconfig symbols tends to be a
complete pain. There's some push to use select so it's easier for people
to enable complex drivers, but I honestly don't think it's worth it.
menuconfig can give you a list of things you need to enable first, so it's
all discoverable enough (but a bit painful to get them all if it's a
really complex driver with lots of dependencies).

tldr; I concur fully, please no more select but instead less.
-Sima

> 
> Best regards
> Thomas
> 
> > 
> > Helge
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

