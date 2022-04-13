Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C77684FFAEE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 18:06:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdnXJ6h6zz3bgS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Apr 2022 02:06:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256 header.s=google header.b=SMSq1vzh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ffwll.ch
 (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=daniel@ffwll.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256
 header.s=google header.b=SMSq1vzh; dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdnWZ6ftdz2ygC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Apr 2022 02:06:01 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id m14so3323487wrb.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 09:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nPdGkgfedd/A4OP8KwTTe+FHIMRJcA3jhSUiZu8tE4s=;
 b=SMSq1vzhpdQ78zUIkOaNXUt3O9fifj0rXSBWRdwImunuLxqHLuE58sPWO9jCz+Rqps
 JUzCFp9Yp9LHRB2XxmnmQ9qMlaMqOe/uqH8ZYfYk5GGsbLwpVLKfasf4LLCNxk4lJP5O
 Njosm3BtBMYcp5sEyZed8HqQKM9BYZM73WQO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nPdGkgfedd/A4OP8KwTTe+FHIMRJcA3jhSUiZu8tE4s=;
 b=ZFFF9Z0Uc0d1jq9RX/4mOZQ0K2vAfROHkxDF521Ih3NT84fsJQxSxga5gZFE4PAtx4
 Lg4vYYos9ygvM3GD6gXSis/szikNOdYWzSEL0ZiZaqofNhurlyPGraWf0jwYz/UAwOzH
 XoZ7mVluaf2HVox5X8bSMdIq5NbtzLPABd231psZiWBavC6c91C2RQ4e02iB2bbgVyAu
 QsyNr0V3uA8qRFb361YLLp8W55QVXuIzj2qkqqXPPSNxHtzZbUaPCYteVWcvkbFvDo9N
 x640OjuB8KVrlOyt1IHXzGIC8NTplqP06Imbhg/O3stc8qcnDZ1dV3abcNVm6Ws1fSGf
 4x6w==
X-Gm-Message-State: AOAM533GdLVUUIpJQ7wWur4hYqTTH4mDnGOLJTa/0XdxgXmSAqCyE455
 jwjzdkQvRvTtkn/7rwFiZyhNsw==
X-Google-Smtp-Source: ABdhPJxCHSZR6sOhR82MWDqkHkKQxYBi5t7yzBdb+67OAJKLu81jjVxRF6LbEco5kZi775i1Cfk2zw==
X-Received: by 2002:adf:e944:0:b0:207:af9e:a4e7 with SMTP id
 m4-20020adfe944000000b00207af9ea4e7mr6330680wrn.296.1649865953497; 
 Wed, 13 Apr 2022 09:05:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c378600b0038eca3cdbb3sm2716964wmr.13.2022.04.13.09.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 09:05:53 -0700 (PDT)
Date: Wed, 13 Apr 2022 18:05:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 2/2] fbdev: Remove hot-unplug workaround for framebuffers
 without device
Message-ID: <Ylb0316ABOhOe1Rb@phenom.ffwll.local>
References: <20220413092454.1073-1-tzimmermann@suse.de>
 <20220413092454.1073-3-tzimmermann@suse.de>
 <2e183cc9-603d-f038-54aa-5601f11b0484@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e183cc9-603d-f038-54aa-5601f11b0484@redhat.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, frowand.list@gmail.com, deller@gmx.de,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, paulus@samba.org, daniel@ffwll.ch, sam@ravnborg.org,
 linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 13, 2022 at 12:50:50PM +0200, Javier Martinez Canillas wrote:
> On 4/13/22 11:24, Thomas Zimmermann wrote:
> > A workaround makes fbdev hot-unplugging work for framebuffers without
> > device. The only user for this feature was offb. As each OF framebuffer
> > now has an associated platform device, the workaround is no longer
> > needed. Remove it. Effectively reverts commit 0f525289ff0d ("fbdev: Fix
> > unregistering of framebuffers without device").
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> >  drivers/video/fbdev/core/fbmem.c | 9 +--------
> >  1 file changed, 1 insertion(+), 8 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> > index bc6ed750e915..bdd00d381bbc 100644
> > --- a/drivers/video/fbdev/core/fbmem.c
> > +++ b/drivers/video/fbdev/core/fbmem.c
> > @@ -1579,14 +1579,7 @@ static void do_remove_conflicting_framebuffers(struct apertures_struct *a,
> >  			 * If it's not a platform device, at least print a warning. A
> >  			 * fix would add code to remove the device from the system.
> >  			 */
> > -			if (!device) {
> > -				/* TODO: Represent each OF framebuffer as its own
> > -				 * device in the device hierarchy. For now, offb
> > -				 * doesn't have such a device, so unregister the
> > -				 * framebuffer as before without warning.
> > -				 */
> > -				do_unregister_framebuffer(registered_fb[i]);
> 
> Maybe we could still keep this for a couple of releases but with a big
> warning that's not supported in case there are out-of-tree drivers out
> there that still do this ?
> 
> Or at least a warning if the do_unregister_framebuffer() call is removed.

Yeah dying while holding console_lock isn't fun, and not having a WARN_ON
+ bail-out code pretty much forces bug reporters to do a bisect here to
give us something more than "machine dies at boot with no messages".

I'd just outright keep the WARN_ON here for 1-2 years even to really make
sure we got all the bug reports, since often these older machines only
update onto LTS releases.

And it needs to be a WARN_ON + bail out since BUG_ON is as bad as just
oopsing.
-Daniel

> 
> Regardless of what you chose to do, the patch looks good to me.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> -- 
> Best regards,
> 
> Javier Martinez Canillas
> Linux Engineering
> Red Hat
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
