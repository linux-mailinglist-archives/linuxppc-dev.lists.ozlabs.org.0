Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6201B5C0497
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 18:49:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXksP2lyLz3c4S
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 02:49:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.175; helo=mail-qt1-f175.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXkry2n7sz3bc8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 02:49:04 +1000 (AEST)
Received: by mail-qt1-f175.google.com with SMTP id g23so4537489qtu.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 09:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=3qFaGkY9CCS42x3fMr78U/0joSy0gdPgTA8V50h7rRU=;
        b=UwsTXZtnz+x93ry4BK8G7s70G7N1tSVp4NxKBFknw3UF1tn3HbBh7Ap3Zlb8/sQsfl
         lyL9QwBXld4gCimhoJq6GHJ6JykC7p+u+MCwsYrVsPfvMaihUto8uOzBNrO+tQ9GTSce
         gs388iFtQKsqxQ1GVm13nSZPfUXn5LAKe590B8U1IEINhlOXQJtS1qFN/rGQc9nynl4t
         tThsmuByL/YWz+kCyaB7WYbaxM9TF8hBru3nl0K6+hzVZpjE8NK8YHtZo8Qv/kq97f0c
         W774tb+oU5EK6cEe96zeRiCtXS6xXwi9uDa66MRLWy66gwAvZ04e5xjfzvZePnnAE2Zp
         gmRg==
X-Gm-Message-State: ACrzQf2qmYnkOHBjXIcptdmqI5uG+8Rq78Kw9DRsMB7e1qM0YXE0+Jmg
	nLzGTMOv8YLq0V4EsF7DAM6f12wYkRkxCjDR
X-Google-Smtp-Source: AMsMyM4ZVOJXuOc05WX4LUqQvasOr9U8VBENWaqemcojmHCxGFwFX+iMiilrm81Y2UML4s5I1oXgZg==
X-Received: by 2002:a05:622a:c5:b0:35c:f238:b0a4 with SMTP id p5-20020a05622a00c500b0035cf238b0a4mr10917923qtw.92.1663778940758;
        Wed, 21 Sep 2022 09:49:00 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id bb4-20020a05622a1b0400b0035cf2995ad8sm1862672qtb.51.2022.09.21.09.48.58
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 09:48:59 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id s14so8935249ybe.7
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 09:48:58 -0700 (PDT)
X-Received: by 2002:a5b:506:0:b0:6af:ffac:4459 with SMTP id
 o6-20020a5b0506000000b006afffac4459mr23009053ybp.365.1663778938618; Wed, 21
 Sep 2022 09:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220720142732.32041-1-tzimmermann@suse.de> <20220720142732.32041-11-tzimmermann@suse.de>
 <4715518d0a6ec60349c76414815ae3f6e4ed977e.camel@kernel.crashing.org> <350bdc4b-7fb3-f04f-06ba-0a3a266041a0@suse.de>
In-Reply-To: <350bdc4b-7fb3-f04f-06ba-0a3a266041a0@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Sep 2022 18:48:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVE0X=8tXQAUPR8zUe9vSY1YKiavCxQQ0i7h5Dr1v4HZw@mail.gmail.com>
Message-ID: <CAMuHMdVE0X=8tXQAUPR8zUe9vSY1YKiavCxQQ0i7h5Dr1v4HZw@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] drm/ofdrm: Support color management
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-fbdev@vger.kernel.org, airlied@linux.ie, deller@gmx.de, linuxppc-dev@lists.ozlabs.org, mark.cave-ayland@ilande.co.uk, javierm@redhat.com, dri-devel@lists.freedesktop.org, paulus@samba.org, maxime@cerno.tech, daniel@ffwll.ch, msuchanek@suse.de, sam@ravnborg.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Thomas,

On Wed, Sep 21, 2022 at 2:55 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 05.08.22 um 02:19 schrieb Benjamin Herrenschmidt:
> > On Wed, 2022-07-20 at 16:27 +0200, Thomas Zimmermann wrote:
> >> +#if !defined(CONFIG_PPC)
> >> +static inline void out_8(void __iomem *addr, int val)
> >> +{ }
> >> +static inline void out_le32(void __iomem *addr, int val)
> >> +{ }
> >> +static inline unsigned int in_le32(const void __iomem *addr)
> >> +{
> >> +       return 0;
> >> +}
> >> +#endif
> >
> > These guys could just be replaced with readb/writel/readl respectively
> > (beware of the argument swap).
>
> I only added them for COMPILE_TEST. There appears to be no portable
> interface that implements out_le32() and in_le32()?

iowrite32() and ioread32()?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
