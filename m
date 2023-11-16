Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E52F7EE136
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 14:14:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWL8n0p1Qz3dRs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 00:14:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.171; helo=mail-yw1-f171.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWL8F2J9Jz2yjD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 00:13:48 +1100 (AEDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5a90d6ab962so8368147b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 05:13:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700140425; x=1700745225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIlzYfO2Ms3adHoFgSONl5i8POJ8DPO0QqHqcNpaY0s=;
        b=NtNI/aTUyAcVoJcWknEE/yAtWmuFaxDZ1+cGQ04/bSW83JHOkRorGpgnlsIf4mJocW
         gfH2weX5Yez8vahyUS4ezEJd6mn6L3KTPjV63bUND9t2bpxmDk0glLEj236qDjtiEMOG
         nSWStqWXtV2XgZQWQxIgzHbBTyLtEEJeVyaPOR1eeoFTsal7OfMd2Hb5eKQxiQUhI0rC
         swdkmIzbe1DLuVks+RO3eTqcJvY9WtuAyiFZQz00oWxF6XDkWFWLxNq7qz2d9qrNO4xd
         WZgzUuQLn9JxBb7apYyr/PiPQ3zqYX2RfZJ1FdsX1wrJhewb77l/sQvgOjs4O34l2gEI
         3AdQ==
X-Gm-Message-State: AOJu0YygNa9RAsQmiHz0zQl3yNEi14dyb98G1qcZQ9YqpHSMcxskczoM
	HfJOpcCeKBFefWgTVfAnI7RwSqh2WM6Pow==
X-Google-Smtp-Source: AGHT+IFm71/XTzWAE97+MzD44od9j9IdVzVT+JDHp7pDrFxo4A9B5J8hHc38AIU5XsilOmLaPNWe2A==
X-Received: by 2002:a81:9141:0:b0:5b3:60c2:5781 with SMTP id i62-20020a819141000000b005b360c25781mr17605903ywg.32.1700140424974;
        Thu, 16 Nov 2023 05:13:44 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id n4-20020a817204000000b005869cf151ebsm968868ywc.144.2023.11.16.05.13.44
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 05:13:44 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d9ca471cf3aso737552276.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 05:13:44 -0800 (PST)
X-Received: by 2002:a25:b21f:0:b0:db0:3962:fce4 with SMTP id
 i31-20020a25b21f000000b00db03962fce4mr5009733ybj.20.1700140424481; Thu, 16
 Nov 2023 05:13:44 -0800 (PST)
MIME-Version: 1.0
References: <a1d9e09b-f533-5e2c-7a13-af96647e1a71@embeddedor.com>
 <10D1983F-33EF-46C3-976E-463D1CB5A6E9@xenosoft.de> <9bb5fcbd-daf5-1669-b3e7-b8624b3c36f9@xenosoft.de>
 <c47fba21-3ae9-4021-9f4a-09c2670ebdbc@xenosoft.de> <0d89bcd0-9b68-4c0a-acd8-2c7532e62f6d@xenosoft.de>
 <6530cea3-4507-454e-bc36-a6970c8e7578@xenosoft.de> <CAMuHMdU-8Fu55C2zu_XxmG8n5paOQYfqNA84JNvXo4c87D-kFw@mail.gmail.com>
 <fee4eb69-97ea-4b02-9e36-0962ebe3faa9@xenosoft.de> <CAMuHMdWu6Q3ew0m4xugjF_hgSt0RFFr+ccoBrSzt0FGLgtxJtA@mail.gmail.com>
 <uxr4sf6kirv32tfbd6qjzxqd53zpoknjfa4ucr4zs5ktkks2re@spgj4j64raaa>
In-Reply-To: <uxr4sf6kirv32tfbd6qjzxqd53zpoknjfa4ucr4zs5ktkks2re@spgj4j64raaa>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Nov 2023 14:13:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU_3riPCSf_WDnUQWZENtDjaQmGf6cQn2-Dfsgf2HKHfA@mail.gmail.com>
Message-ID: <CAMuHMdU_3riPCSf_WDnUQWZENtDjaQmGf6cQn2-Dfsgf2HKHfA@mail.gmail.com>
Subject: Re: Fbdev issue after the drm updates 'drm-next-2023-10-31-1'
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Thomas Zimmermann <tzimmermann@suse.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>, virtualization@lists.linux.dev, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, mad skateman <madskateman@gmail.com>, Christian Zigotzky <chzigotzky@xenosoft.de>, airlied@gmail.com, deller@gmx.de, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Gerd,

On Wed, Nov 15, 2023 at 10:22=E2=80=AFAM Gerd Hoffmann <kraxel@redhat.com> =
wrote:
> On Wed, Nov 15, 2023 at 09:33:28AM +0100, Geert Uytterhoeven wrote:
> > On Tue, Nov 14, 2023 at 10:45=E2=80=AFAM Christian Zigotzky
> > <chzigotzky@xenosoft.de> wrote:
> > > On 13 November 2023 at 01:48 pm, Geert Uytterhoeven wrote:
> > > > I can confirm there is no graphics output with m68k/virt, and
> >
> > Before the error message you reported:
> >
> >     virtio-mmio virtio-mmio.125: [drm] *ERROR* fbdev: Failed to setup
> > generic emulation (ret=3D-2)
> >
> > it also prints:
> >
> >     virtio-mmio virtio-mmio.125: [drm] bpp/depth value of 32/24 not sup=
ported
> >     virtio-mmio virtio-mmio.125: [drm] No compatible format found
> >
> > Upon closer look, it turns out virtgpu is special in that its main
> > plane supports only a single format: DRM_FORMAT_HOST_XRGB8888, which
> > is XR24 on little-endian, and BX24 on big-endian.  I.e. on big-endian,
> > virtgpu does not support XR24.
>
> Driver and device support both XR24 and BX24 on both little endian and
> big endian just fine.

OK.

> Problem is both fbdev interfaces and the ADDFB ioctl specify the format
> using bpp instead of fourcc, and advertising only one framebuffer format
> -- in native byte order -- used to worked best, especially on bigendian
> machines.
>
> That was years ago though, IIRC predating the generic fbdev emulation,
> so maybe it's time to revisit that.  Changing it should be as simple as
> updating the format arrays:
>
> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> @@ -30,11 +30,13 @@
>  #include "virtgpu_drv.h"
>
>  static const uint32_t virtio_gpu_formats[] =3D {
> -       DRM_FORMAT_HOST_XRGB8888,
> +       DRM_FORMAT_XRGB8888,
> +       DRM_FORMAT_BGRX8888,
>  };
>
>  static const uint32_t virtio_gpu_cursor_formats[] =3D {
> -       DRM_FORMAT_HOST_ARGB8888,
> +       DRM_FORMAT_ARGB8888,
> +       DRM_FORMAT_BGRA8888,
>  };
>
>  uint32_t virtio_gpu_translate_format(uint32_t drm_fourcc)

Thanks!
Almost there, the check in virtio_gpu_user_framebuffer_create()
must be extended, too.

I have submitted a patch
https://lore.kernel.org/r/282a31154172a78165912c832a09f6502515d139.17001401=
78.git.geert@linux-m68k.org/

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
