Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA56C52CC96
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 09:12:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3gyw56KTz3c31
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 17:12:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.170;
 helo=mail-qk1-f170.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3gyV16zyz301B
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 17:11:45 +1000 (AEST)
Received: by mail-qk1-f170.google.com with SMTP id 135so1622084qkm.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 00:11:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=REdU6yQ0LkgcyYqOaju3zdpW9ygW1nqPdZvdg9KIbtw=;
 b=Ts3rrkjf0PeR+qBxU0BrNdbY6/fT3f3rHWB47S+ob9xwJ7r4f9XA6jrlmw89rCuiRa
 CZEdxS0QXQWFliKcR7k/SoqfbCNL1snMkhXn/F36ETTO5JeieMB5QM426x3WzLIdXumP
 Se/IBqIYqUP/VNyhsw9bYGeXe5MigdoeYmfDfFVPUXO+mT1PAAGILLdXbVtR4XawQF1X
 u27hpplRIzXd/sepjcDCjfboeSsmGMm/6IMNm0teH4YbVnZoseenLSJWs1BmGG7++hUA
 qunv/6DRIGKk6KWK5uyMi67d8GBlmL4uILUbNYP9SQ+vDOoXhARK8jk6VW9RH4coTNSj
 Z6xA==
X-Gm-Message-State: AOAM530b546zUvp+724uh6SIB6cbqSO/id2zLks5qjAAVP/9mGRArDEZ
 33VqXCT7WgwZJ+obzCdbQj3xctH48L8kdQ==
X-Google-Smtp-Source: ABdhPJxm8QK4fWBYzVM2E1uZQvX5fpg5IrnK3wpftJr7kXlYXjyi6IstS5Q8rz1XJP8M92gARKayaw==
X-Received: by 2002:a05:620a:1981:b0:477:6e45:3e7d with SMTP id
 bm1-20020a05620a198100b004776e453e7dmr2061339qkb.407.1652944300871; 
 Thu, 19 May 2022 00:11:40 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180]) by smtp.gmail.com with ESMTPSA id
 139-20020a370591000000b0069fc13ce24fsm878895qkf.128.2022.05.19.00.11.36
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 00:11:38 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-2fefb051547so47705747b3.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 00:11:36 -0700 (PDT)
X-Received: by 2002:a81:9b0c:0:b0:2f4:c522:7d3c with SMTP id
 s12-20020a819b0c000000b002f4c5227d3cmr3231864ywg.316.1652944295889; Thu, 19
 May 2022 00:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220518183006.14548-1-tzimmermann@suse.de>
 <20220518183006.14548-3-tzimmermann@suse.de>
 <20220518185156.GJ163591@kunlun.suse.cz>
In-Reply-To: <20220518185156.GJ163591@kunlun.suse.cz>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 May 2022 09:11:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUws2eJ4pHng4GD0PjuvMj5Hef_y_YyM4fUJV9xdUVuEQ@mail.gmail.com>
Message-ID: <CAMuHMdUws2eJ4pHng4GD0PjuvMj5Hef_y_YyM4fUJV9xdUVuEQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/tiny: Add ofdrm for Open Firmware framebuffers
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Helge Deller <deller@gmx.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michal,

On Wed, May 18, 2022 at 8:54 PM Michal Such=C3=A1nek <msuchanek@suse.de> wr=
ote:
> On Wed, May 18, 2022 at 08:30:06PM +0200, Thomas Zimmermann wrote:
> > --- a/drivers/gpu/drm/tiny/Kconfig
> > +++ b/drivers/gpu/drm/tiny/Kconfig
> > @@ -51,6 +51,18 @@ config DRM_GM12U320
> >        This is a KMS driver for projectors which use the GM12U320 chips=
et
> >        for video transfer over USB2/3, such as the Acer C120 mini proje=
ctor.
> >
> > +config DRM_OFDRM
> > +     tristate "Open Firmware display driver"
> > +     depends on DRM && MMU && PPC
>
> Does this build with !PCI?
>
> The driver uses some PCI functions, so it might possibly break with
> randconfig. I don't think there are practical !PCI PPC configurations.

IIRC, the first PowerMacs didn't have PCI.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
