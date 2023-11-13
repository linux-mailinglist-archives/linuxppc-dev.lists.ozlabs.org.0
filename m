Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CA07E9C64
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 13:49:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STTlK4k8Kz3dHL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 23:49:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.181; helo=mail-yw1-f181.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STTkp4FTlz2ytV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 23:48:49 +1100 (AEDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5a90d6ab962so50466677b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 04:48:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699879727; x=1700484527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NpcagooPlgB42zJ8lCFvRZKrafl2J7642p6A31Uxcs=;
        b=PLUmIbw22ieBnvukQQJDJkqrr0u7r43+Wh+ss02/Hyz3MUsKrPNDEfxMXhxFMMWt7W
         Rb1EwSynkAF2ko3vhpWurTuOQyCrIhveFTBAfPDO4n7dTVCf2LhAO5C4C5p0eDHMdhhJ
         u3aDpMdb5N4sojYTEMMNniW2YiHgQhIoLBPMXZjL5TJtvRyPXroFiUNXyHMli2jm2oL2
         h81vmggsW+OBXMgAb+PISua8qVUFx6empAO/SSqpcjcdK73gIWCIpYIvKdmb+O6jRron
         cyrnvRoIOeDpQhhqd/eVKdzRTpO2yuN805y5J2xCW0gBHBPUZV0q7XFD9KFOKlRmuTbF
         utOA==
X-Gm-Message-State: AOJu0Yx4eR5Cb1V08JoKLXUUxgL94TlhLFfF9/3eWmBzzsB0d6jt5fhW
	4DXyPgTkh10C2oKv2k+ombL6K/4VSXFLlA==
X-Google-Smtp-Source: AGHT+IEpMoBeVggm1pGgZe4Ja4VMQf5tOnDpqukOVR3UeXxGKklWtW8xtymfvaLpUoZ+0R/WxvVqpg==
X-Received: by 2002:a0d:e294:0:b0:5a7:ab51:af5c with SMTP id l142-20020a0de294000000b005a7ab51af5cmr6471465ywe.13.1699879726582;
        Mon, 13 Nov 2023 04:48:46 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id y3-20020a81a103000000b005a7a92a62besm1759489ywg.8.2023.11.13.04.48.45
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 04:48:45 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-da41e70e334so4421551276.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 04:48:45 -0800 (PST)
X-Received: by 2002:a25:4409:0:b0:daf:6519:5e53 with SMTP id
 r9-20020a254409000000b00daf65195e53mr4012822yba.53.1699879725649; Mon, 13 Nov
 2023 04:48:45 -0800 (PST)
MIME-Version: 1.0
References: <a1d9e09b-f533-5e2c-7a13-af96647e1a71@embeddedor.com>
 <10D1983F-33EF-46C3-976E-463D1CB5A6E9@xenosoft.de> <9bb5fcbd-daf5-1669-b3e7-b8624b3c36f9@xenosoft.de>
 <c47fba21-3ae9-4021-9f4a-09c2670ebdbc@xenosoft.de> <0d89bcd0-9b68-4c0a-acd8-2c7532e62f6d@xenosoft.de>
 <6530cea3-4507-454e-bc36-a6970c8e7578@xenosoft.de>
In-Reply-To: <6530cea3-4507-454e-bc36-a6970c8e7578@xenosoft.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Nov 2023 13:48:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU-8Fu55C2zu_XxmG8n5paOQYfqNA84JNvXo4c87D-kFw@mail.gmail.com>
Message-ID: <CAMuHMdU-8Fu55C2zu_XxmG8n5paOQYfqNA84JNvXo4c87D-kFw@mail.gmail.com>
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Thomas Zimmermann <tzimmermann@suse.de>, kraxel@cs.tu-berlin.de, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, mad skateman <madskateman@gmail.com>, airlied@gmail.com, deller@gmx.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christian,

On Sun, Nov 12, 2023 at 3:23=E2=80=AFPM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
> On 07 November 2023 at 09:36 am, Christian Zigotzky wrote:
> > I have found out that fbdev no longer works with virtio-gpu-pci and
> > virtio-vga. It is not a problem with the penguin logos.
> >
> > Could you please check fbdev in QEMU virtual machines with
> > virtio-gpu-pci and virtio-vga graphics?
>
> > On 02 November 2023 at 03:45 pm, Christian Zigotzky wrote:
> >> There is a fbdev issue with the virtio-gpu-pci and virtio-vga. (The
> >> penguins are not displayed at boot time)
> >>
> >> Error message:  [    0.889302] virtio-pci 0000:00:02.0: [drm] *ERROR*
> >> fbdev: Failed to setup generic emulation (ret=3D-2)
> >>
> >> The kernel 6.6 final doesn't have this issue.
> >>
> >> Please check the fbdev changes in the drm updates
> >> 'drm-next-2023-10-31-1'.

Thanks for your report!

I can confirm there is no graphics output with m68k/virt, and
bisected this to my own commit 6ae2ff23aa43a0c4 ("drm/client: Convert
drm_client_buffer_addfb() to drm_mode_addfb2()"), ouch...

It turns out the old call to drm_mode_addfb() caused a translation
from a fourcc to a bpp/depth pair to a _different_ fourcc, due to the
quirk processing in drm_driver_legacy_fb_format().
I.e. on m68k/virt, the original requested format was XR24, which was
translated to BX24. The former doesn't work, the latter works.

The following (gmail-whitespace-damaged) patch fixed the issue for me:

--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -400,6 +400,16 @@ static int drm_client_buffer_addfb(struct
drm_client_buffer *buffer,

        fb_req.width =3D width;
        fb_req.height =3D height;
+       if (client->dev->mode_config.quirk_addfb_prefer_host_byte_order) {
+               if (format =3D=3D DRM_FORMAT_XRGB8888)
+                       format =3D DRM_FORMAT_HOST_XRGB8888;
+               if (format =3D=3D DRM_FORMAT_ARGB8888)
+                       format =3D DRM_FORMAT_HOST_ARGB8888;
+               if (format =3D=3D DRM_FORMAT_RGB565)
+                       format =3D DRM_FORMAT_HOST_RGB565;
+               if (format =3D=3D DRM_FORMAT_XRGB1555)
+                       format =3D DRM_FORMAT_HOST_XRGB1555;
+       }
        fb_req.pixel_format =3D format;
        fb_req.handles[0] =3D handle;
        fb_req.pitches[0] =3D buffer->pitch;

However, I don't think we want to sprinkle more of these
translations around... So perhaps we should (re)add a call to
drm_driver_legacy_fb_format() to drm_client_buffer_addfb()?

Second, as I doubt you are using a big-endian system, you are probably
running into a slightly different issue.

Oh wait, you did CC linuxppc-dev, so perhaps you are running on a
big-endian machine?

If not, please add

    pr_info("%s: format =3D %p4cc\n", __func__, &format);

to drivers/gpu/drm/drm_client.c:drm_client_buffer_addfb(), and,
after reverting commit 6ae2ff23aa43a0c4, add

    pr_info("%s: bpp %u/depth %u =3D> r.pixel_format =3D %p4cc\n",
__func__, or->bpp, or->depth, &r.pixel_format);

to drivers/gpu/drm/drm_framebuffer.c:drm_mode_addfb(), so we know the
translation in your case?

Thanks!

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
