Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5F45AF44F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 21:17:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMZsG5wz0z3c3W
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 05:17:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256 header.s=google header.b=cdseVbcC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ffwll.ch (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=daniel@ffwll.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256 header.s=google header.b=cdseVbcC;
	dkim-atps=neutral
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMZrc1Hkhz2yxc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 05:17:02 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id n17-20020a05600c501100b003a84bf9b68bso8016734wmr.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Sep 2022 12:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=JEvsSrJgYklFhGk6ahEcCPzEIfyEDAvxEZnTiVWC9eA=;
        b=cdseVbcCEW+0adnYE1ZJVO9jG5brWhQdSFqN3fOdlrEMZH5usP0dx1z/CJ0XD0J0RL
         bAkiZpqCPSjVrxFM44dQKbC/U98L530af+pqaLl1etXUF0NmN9x37EU2WVo8cMWKcIDI
         7lb6E97Ia78hjxUPcO4toxnqlaOGHpwjpM0oU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=JEvsSrJgYklFhGk6ahEcCPzEIfyEDAvxEZnTiVWC9eA=;
        b=f7OvPuH/5CXddY5MiYZkSU5eBPAUOesEeBmpbSapLB+/2pU7T23R6+QJL12qFufGHE
         od/aJl0Oucw+D1MHj8pclNkQnDrQoHJQiInHD/js2s1XlOpCMEa0D4+AVlFWEEKkUPLj
         JH10oYvS/4GwHlA9i/yuZddiMdtpZyr79e+ggP1/JtC9x+z7o+LIJYxnOwIHIV5jQ/xz
         JfyWt/DB63QHdwIZe5hGduSAzLToRO4k95nSL2II4C9IAqcYE+pHDBZs/LjjwGKtwc0X
         Eat7Hu2MAm6MmAVs6ibj9CO/C1gA/C0WH9bH2HeODP99y+c6s0x5rEpwyDlsoIXqBEkh
         mbSQ==
X-Gm-Message-State: ACgBeo2Jx0YyRvuKJvaX+MXNqifJ4laKYQe12FKDj69lADa7Ogz9Uhng
	Gmv31PepvzH+RMsP45AUWKVFCw==
X-Google-Smtp-Source: AA6agR6OuHVb2pFJPiq3+DrxkjfxbowfIdQDMa1KkVrRU9rkHXQXlViPuHiqyxK7ZR4ooN7yTicD5Q==
X-Received: by 2002:a05:600c:2e03:b0:3a5:3928:7958 with SMTP id o3-20020a05600c2e0300b003a539287958mr2411wmf.77.1662491817741;
        Tue, 06 Sep 2022 12:16:57 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id i14-20020a05600c354e00b003a5dde32e4bsm23272538wmq.37.2022.09.06.12.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 12:16:56 -0700 (PDT)
Date: Tue, 6 Sep 2022 21:16:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 04/10] drm/simpledrm: Compute framebuffer stride if
 not set
Message-ID: <YxecprE8c8pwy5PB@phenom.ffwll.local>
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-5-tzimmermann@suse.de>
 <CAMuHMdWEah62Ho4C8NQr-qwz62pKQiJiTi8Fa4KcXNRzo7ySJA@mail.gmail.com>
 <4a7c2c1d-2bf9-84e7-9257-41fcfd66ab9d@redhat.com>
 <20f4e5e6-2ff2-af21-1f85-70a545d147bc@suse.de>
 <CAKMK7uGr_SbHAm7r5VNWgpM2cPMFYpCmyE_Aq8TYc84rOAtJpA@mail.gmail.com>
 <33ce5744-5d41-2501-6105-2585529820d2@suse.de>
 <b22b363c-187b-0783-32ab-f9683af2e20a@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b22b363c-187b-0783-32ab-f9683af2e20a@suse.de>
X-Operating-System: Linux phenom 5.18.0-4-amd64 
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>, David Airlie <airlied@linux.ie>, Helge Deller <deller@gmx.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Javier Martinez Canillas <javierm@redhat.com>, DRI Development <dri-devel@lists.freedesktop.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>, Paul Mackerras <paulus@samba.org>, Michal Suchanek <msuchanek@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 11, 2022 at 08:27:42PM +0200, Thomas Zimmermann wrote:
> 
> 
> Am 11.08.22 um 20:26 schrieb Thomas Zimmermann:
> > Hi Daniel
> > 
> > Am 11.08.22 um 19:23 schrieb Daniel Vetter:
> > > On Wed, 27 Jul 2022 at 09:53, Thomas Zimmermann
> > > <tzimmermann@suse.de> wrote:
> > > > 
> > > > Hi
> > > > 
> > > > Am 25.07.22 um 17:13 schrieb Javier Martinez Canillas:
> > > > > Hello Geert,
> > > > > 
> > > > > On 7/21/22 16:46, Geert Uytterhoeven wrote:
> > > > > > Hi Thomas,
> > > > > > 
> > > > > > On Wed, Jul 20, 2022 at 4:27 PM Thomas Zimmermann
> > > > > > <tzimmermann@suse.de> wrote:
> > > > > > > Compute the framebuffer's scanline stride length if not given by
> > > > > > > the simplefb data.
> > > > > > > 
> > > > > > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > > 
> > > > > > Thanks for your patch!
> > > > > > 
> > > > > > > --- a/drivers/gpu/drm/tiny/simpledrm.c
> > > > > > > +++ b/drivers/gpu/drm/tiny/simpledrm.c
> > > > > > > @@ -743,6 +743,9 @@ static struct simpledrm_device
> > > > > > > *simpledrm_device_create(struct drm_driver *drv,
> > > > > > >                   drm_err(dev, "no simplefb configuration found\n");
> > > > > > >                   return ERR_PTR(-ENODEV);
> > > > > > >           }
> > > > > > > +       if (!stride)
> > > > > > > +               stride = format->cpp[0] * width;
> > > > > > 
> > > > > > DIV_ROUND_UP(drm_format_info_bpp(format) * width, 8)
> > > > > > 
> > > > > 
> > > > > I think you meant here:
> > > > > 
> > > > > DIV_ROUND_UP(drm_format_info_bpp(format, 0) * width, 8) ?
> > > > 
> > > > I guess, that's the right function. My original code is correct, but cpp
> > > > is also deprecated.
> > > 
> > > You all mean drm_format_info_min_pitch().
> > 
> > Thanks a lot. I wasn't even aware of this function, but I had almost
> > written my own implementation of it.  I'll update the patch accordingly.
> 
> Arghh, too late. I merged that patch already.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Preemptively, if you can do the fixup patch (and it's not yet merged)?
-Daniel

> 
> > 
> > Best regards
> > Thomas
> > 
> > > 
> > > I really don't want drivers to go grab any of the legacy format info
> > > fields like bpp or depth. switch() statements on the fourcc code for
> > > programming registers, or one of the real helper functions in
> > > drm_fourcc.c (there might be some gaps), but not ever going through
> > > legacy concepts. Anything else just leads to subtle bugs when new
> > > formats get added and oops suddenly the assumptions don't hold.
> > > 
> > > Those should be strictly limited to legacy (i.e. not drm_fourcc aware)
> > > interfaces. Heck I think even fbdev emulation should completely switch
> > > over to drm_fourcc/drm_format_info, but alas that's a pile of work and
> > > not much payoff.
> > > 
> > > I'm trying to volunteer Same to add a legacy_bpp tag to the above
> > > helper and appropriately limit it, I think limiting to formats with
> > > depth!=0 is probably the right thing. And then we should probably
> > > remove a pile of the cargo-culted depth!=0 entries too.
> > > -Daniel
> > > 
> > > > 
> > > > Best regards
> > > > Thomas
> > > > 
> > > > > 
> > > > > With that change,
> > > > > 
> > > > > Acked-by: Javier Martinez Canillas <javierm@redhat.com>
> > > > > 
> > > > 
> > > > -- 
> > > > Thomas Zimmermann
> > > > Graphics Driver Developer
> > > > SUSE Software Solutions Germany GmbH
> > > > Maxfeldstr. 5, 90409 Nürnberg, Germany
> > > > (HRB 36809, AG Nürnberg)
> > > > Geschäftsführer: Ivo Totev
> > > 
> > > 
> > > 
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
