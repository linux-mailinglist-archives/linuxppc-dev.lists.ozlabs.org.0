Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC36E859B3A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Feb 2024 05:05:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cVEnFbTG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TdTVD43ygz3d40
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Feb 2024 15:05:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cVEnFbTG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TdTTV2mlXz3c2K
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Feb 2024 15:05:16 +1100 (AEDT)
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-363b37b6799so11304885ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Feb 2024 20:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708315513; x=1708920313; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nna+GUj9CQ2WZrxvQX42Zjl9ya+Rgw72c7b/L2nye4Y=;
        b=cVEnFbTGLwSw/f3zGAVRakSNWlrKuc6fAybwaKmkbsJS2zTVED8vSMTa10ZiyOLgdO
         JnXc2rQa5DMCc4EeFeORHS1JjCARoBXtvDa53o2F3TCupoLRg7R7PuZU/zxWBAEasZT5
         gYRsyQOziAF4PtV21HuMF2ykplkKi/83p6HR5JhIP5UlQucKNoUZeboHetaAZEmPdlHZ
         C3r/zC69/F0HiPu9bA9YX+QBDrjXqLfN/Rrz4wiP5Y74jIldlUmrJL6JeEqIUcN7keTI
         u2l2iL8t1+OzxSNue1KNgZ1OIAnI1Yx/eYHceEjWnqq9XYDxicy3+xvp5wplmEJXVtCE
         qW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708315513; x=1708920313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nna+GUj9CQ2WZrxvQX42Zjl9ya+Rgw72c7b/L2nye4Y=;
        b=UEsO6N30qWbNw9QO54HUwXUxY6qd6aWjUKMiqWWej4NZtWWY2T66XLxyc0xpsXLYzE
         QinGzJKSYmhQMpfsMOFAwnWk0o0Iwy2miklzZqtgJOkWBnRYO8Si0eP2arc1EGWHfC09
         Z2ApvdHCccclUQqYQv95T8ntPWrGcXqYKjw5xi5TQCC20onAwyqdD6cHEnVxKQFSg7v1
         cQJ/1isodm+0J7IdEQ7WeSvC7EPuPh8teZCos94uqlwf+OsAH8rX4N05sDjm32qlp0Qs
         9Oa8S1lVS5KW/C1GzuQhGQkRs0eS4JoIroGXRilQbEwMMew6njIP3OhboBFrdgw8cBv5
         02+g==
X-Forwarded-Encrypted: i=1; AJvYcCVFQ5SS/cg8loLSS0XJH5zBXhNtjhAKByxnqcBYW6eXWUsYa1UZpb2FXK+JagBcH8Bv53k7u/MEoDRpPsh7eVm1f4nL5kGSfR2VqtRQag==
X-Gm-Message-State: AOJu0Ywavog7c7luXMlzOFDi3rgr3mEMtr961bYEzqCWWtVuIXtFVt5q
	//PUgxLOwqFZOIaX16I+CP/Fb6yJxfxIlM/BAcHVeW07KFI9iYg5pPqRK04LTfbvhyHkf4o7xBZ
	1S0rJ74s5AUaqc76dN/AWAX7Pb9g=
X-Google-Smtp-Source: AGHT+IFQWSfphwrdCpDlSHfIm999z2WafX/W5AQCf8lo0hMoTfctrWBIvXyD3UbQ4B6TlRI0mbwQoS6T/QusE/aP/ng=
X-Received: by 2002:a05:6e02:1d88:b0:365:6:b56b with SMTP id
 h8-20020a056e021d8800b003650006b56bmr9547570ila.8.1708315513621; Sun, 18 Feb
 2024 20:05:13 -0800 (PST)
MIME-Version: 1.0
References: <1705581128-4604-1-git-send-email-shengjiu.wang@nxp.com>
 <1705581128-4604-9-git-send-email-shengjiu.wang@nxp.com> <20240217101926.3f1d2452@coco.lan>
In-Reply-To: <20240217101926.3f1d2452@coco.lan>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 19 Feb 2024 12:05:02 +0800
Message-ID: <CAA+D8APD+zL0xYkf6FxPNfM3Y3O8+PhT7WEXO7XCLAmBjoMmUA@mail.gmail.com>
Subject: Re: [PATCH v12 08/15] media: uapi: Define audio sample format fourcc type
To: Mauro Carvalho Chehab <mchehab@kernel.org>
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, lgirdwood@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-kernel@vger.kernel.org, tfiga@chromium.org, hverkuil@xs4all.nl, broonie@kernel.org, sakari.ailus@iki.fi, perex@perex.cz, linux-media@vger.kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mauro

On Sat, Feb 17, 2024 at 5:19=E2=80=AFPM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
>
> Em Thu, 18 Jan 2024 20:32:01 +0800
> Shengjiu Wang <shengjiu.wang@nxp.com> escreveu:
>
> > The audio sample format definition is from alsa,
> > the header file is include/uapi/sound/asound.h, but
> > don't include this header file directly, because in
> > user space, there is another copy in alsa-lib.
> > There will be conflict in userspace for include
> > videodev2.h & asound.h and asoundlib.h
> >
> > Here still use the fourcc format.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../userspace-api/media/v4l/pixfmt-audio.rst  | 87 +++++++++++++++++++
> >  .../userspace-api/media/v4l/pixfmt.rst        |  1 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c          | 13 +++
> >  include/uapi/linux/videodev2.h                | 23 +++++
> >  4 files changed, 124 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-audio.=
rst
> >
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-audio.rst b/D=
ocumentation/userspace-api/media/v4l/pixfmt-audio.rst
> > new file mode 100644
> > index 000000000000..04b4a7fbd8f4
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
> > @@ -0,0 +1,87 @@
> > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > +
> > +.. _pixfmt-audio:
> > +
> > +*************
> > +Audio Formats
> > +*************
> > +
> > +These formats are used for :ref:`audiomem2mem` interface only.
> > +
> > +.. tabularcolumns:: |p{5.8cm}|p{1.2cm}|p{10.3cm}|
> > +
> > +.. cssclass:: longtable
> > +
> > +.. flat-table:: Audio Format
> > +    :header-rows:  1
> > +    :stub-columns: 0
> > +    :widths:       3 1 4
> > +
> > +    * - Identifier
> > +      - Code
> > +      - Details
> > +    * .. _V4L2-AUDIO-FMT-S8:
> > +
> > +      - ``V4L2_AUDIO_FMT_S8``
> > +      - 'S8'
> > +      - Corresponds to SNDRV_PCM_FORMAT_S8 in ALSA
> > +    * .. _V4L2-AUDIO-FMT-S16-LE:
>
> Hmm... why can't we just use SNDRV_*_FORMAT_*? Those are already part of
> an uAPI header. No need to add any abstraction here and/or redefine
> what is there already at include/uapi/sound/asound.h.
>
Actually I try to avoid including the include/uapi/sound/asound.h.
Because in user space, there is another copy in alsa-lib (asoundlib.h).
There will be conflict in userspace when including videodev2.h and
asoundlib.h.

And in the V4l framework, the fourcc type is commonly used in other
cases (video, radio, touch, meta....), to avoid changing common code
a lot, so I think using fourcc definition for audio may be simpler.

Best regards
Shengjiu Wang
