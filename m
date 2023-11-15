Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A73957EBE9B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 09:34:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVc034MqLz3dBv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 19:34:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.180; helo=mail-yw1-f180.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVbzZ4QcNz2xqp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 19:33:46 +1100 (AEDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5a7c011e113so76327947b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 00:33:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700037221; x=1700642021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loUWrR6eECAA+uv6HMt8OKh14KvU7DOewoh9g24/Sfw=;
        b=u1jraQjKUBX6ovWJjqTGSfCA42F8btZ6ncFv9y41SacShdzgExspT/PDVhQhmt5ED7
         mrWrL718fYNxLTEMOHWTLk1cqURsxC3OrmGr0DBjqsSyQy27sPmQ7l8pBhKsLTqZUbEF
         /RinvipeoyrA96BVjCpK8o2UMQydU+KwOeBABTaJhcuiFU5mAL5fm9YHHzvpp70Ds5QP
         +PLNPQG/K5gRfBghntMrADmWTvSRz/8xE+GiYwxjPw1uH2yA3NwQl5Xd+SfCllQ3O9ic
         hxX6x7ZCHImToIEdiLKV3sT2YkcZNqC9dANLoFtdf3TgG+3K1sEg+69cbd1NXezPNfVS
         Okkw==
X-Gm-Message-State: AOJu0YwKV/u7Dv6kY9UkpFcBE2KxsrgcuscyFJfDqEfY8FkfQDw4WTny
	I1bFSdiZuYgqdOdtesxg2SCYzcvt0W9mkQ==
X-Google-Smtp-Source: AGHT+IFDBqwT64zUeQwPasNJUiz45m9qkfR8o9cp9Sjn5kXiTLuIvq0qG+05oaAPQuIKUuGCM2mfmg==
X-Received: by 2002:a81:8002:0:b0:5ae:a8ac:ed6a with SMTP id q2-20020a818002000000b005aea8aced6amr12644053ywf.2.1700037221515;
        Wed, 15 Nov 2023 00:33:41 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id s123-20020a0de981000000b005ad586d2691sm256102ywe.43.2023.11.15.00.33.40
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 00:33:40 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5a92782615dso76213167b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 00:33:40 -0800 (PST)
X-Received: by 2002:a81:8408:0:b0:5a7:a81d:e410 with SMTP id
 u8-20020a818408000000b005a7a81de410mr13654199ywf.18.1700037220389; Wed, 15
 Nov 2023 00:33:40 -0800 (PST)
MIME-Version: 1.0
References: <a1d9e09b-f533-5e2c-7a13-af96647e1a71@embeddedor.com>
 <10D1983F-33EF-46C3-976E-463D1CB5A6E9@xenosoft.de> <9bb5fcbd-daf5-1669-b3e7-b8624b3c36f9@xenosoft.de>
 <c47fba21-3ae9-4021-9f4a-09c2670ebdbc@xenosoft.de> <0d89bcd0-9b68-4c0a-acd8-2c7532e62f6d@xenosoft.de>
 <6530cea3-4507-454e-bc36-a6970c8e7578@xenosoft.de> <CAMuHMdU-8Fu55C2zu_XxmG8n5paOQYfqNA84JNvXo4c87D-kFw@mail.gmail.com>
 <fee4eb69-97ea-4b02-9e36-0962ebe3faa9@xenosoft.de>
In-Reply-To: <fee4eb69-97ea-4b02-9e36-0962ebe3faa9@xenosoft.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Nov 2023 09:33:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWu6Q3ew0m4xugjF_hgSt0RFFr+ccoBrSzt0FGLgtxJtA@mail.gmail.com>
Message-ID: <CAMuHMdWu6Q3ew0m4xugjF_hgSt0RFFr+ccoBrSzt0FGLgtxJtA@mail.gmail.com>
Subject: Re: Fbdev issue after the drm updates 'drm-next-2023-10-31-1'
To: Christian Zigotzky <chzigotzky@xenosoft.de>
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Thomas Zimmermann <tzimmermann@suse.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>, virtualization@lists.linux.dev, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>, mad skateman <madskateman@gmail.com>, airlied@gmail.com, deller@gmx.de, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christian,

CC virtgpu

On Tue, Nov 14, 2023 at 10:45=E2=80=AFAM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
> On 13 November 2023 at 01:48 pm, Geert Uytterhoeven wrote:
> > I can confirm there is no graphics output with m68k/virt, and

Before the error message you reported:

    virtio-mmio virtio-mmio.125: [drm] *ERROR* fbdev: Failed to setup
generic emulation (ret=3D-2)

it also prints:

    virtio-mmio virtio-mmio.125: [drm] bpp/depth value of 32/24 not support=
ed
    virtio-mmio virtio-mmio.125: [drm] No compatible format found

Upon closer look, it turns out virtgpu is special in that its main
plane supports only a single format: DRM_FORMAT_HOST_XRGB8888, which
is XR24 on little-endian, and BX24 on big-endian.  I.e. on big-endian,
virtgpu does not support XR24.  Isn't this a violation of the DRM
rule that every driver must implement support for XR24?

> > bisected this to my own commit 6ae2ff23aa43a0c4 ("drm/client: Convert
> > drm_client_buffer_addfb() to drm_mode_addfb2()"), ouch...
> >
> > It turns out the old call to drm_mode_addfb() caused a translation
> > from a fourcc to a bpp/depth pair to a _different_ fourcc, due to the
> > quirk processing in drm_driver_legacy_fb_format().
> > I.e. on m68k/virt, the original requested format was XR24, which was
> > translated to BX24. The former doesn't work, the latter works.
> >
> > The following (gmail-whitespace-damaged) patch fixed the issue for me:
> >
> > --- a/drivers/gpu/drm/drm_client.c
> > +++ b/drivers/gpu/drm/drm_client.c
> > @@ -400,6 +400,16 @@ static int drm_client_buffer_addfb(struct
> > drm_client_buffer *buffer,
> >
> >         fb_req.width =3D width;
> >         fb_req.height =3D height;
> > +       if (client->dev->mode_config.quirk_addfb_prefer_host_byte_order=
) {
> > +               if (format =3D=3D DRM_FORMAT_XRGB8888)
> > +                       format =3D DRM_FORMAT_HOST_XRGB8888;
> > +               if (format =3D=3D DRM_FORMAT_ARGB8888)
> > +                       format =3D DRM_FORMAT_HOST_ARGB8888;
> > +               if (format =3D=3D DRM_FORMAT_RGB565)
> > +                       format =3D DRM_FORMAT_HOST_RGB565;
> > +               if (format =3D=3D DRM_FORMAT_XRGB1555)
> > +                       format =3D DRM_FORMAT_HOST_XRGB1555;
> > +       }
> >         fb_req.pixel_format =3D format;
> >         fb_req.handles[0] =3D handle;
> >         fb_req.pitches[0] =3D buffer->pitch;
> >
> > However, I don't think we want to sprinkle more of these
> > translations around... So perhaps we should (re)add a call to
> > drm_driver_legacy_fb_format() to drm_client_buffer_addfb()?
> >
> > Second, as I doubt you are using a big-endian system, you are probably
> > running into a slightly different issue.
> >
> > Oh wait, you did CC linuxppc-dev, so perhaps you are running on a
> > big-endian machine?
>
> Your patch works! :-) Thanks a lot!
>
> I tested it with the virtio-vga and with the virtio-gpu-pci device in a v=
irtual ppce500 QEMU/KVM HV machine with an e5500 CPU today.
>
> Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>

Thanks for testing!

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
