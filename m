Return-Path: <linuxppc-dev+bounces-212-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B596957FF3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 09:37:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wp1X76cQFz2y8F;
	Tue, 20 Aug 2024 17:37:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::129"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Qr3yP6RH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wp1X71H5zz2y7K
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 17:37:42 +1000 (AEST)
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-39b32f258c8so20220425ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 00:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724139457; x=1724744257; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESAgy9UsFkZjXObfHjLXJ6mFs9WzkZOFNGN0vocQLSg=;
        b=Qr3yP6RHjCYQr+KA/e1x1AYL2kpu+Twzk3eMEZ/n43cQYPzasJ53d6v78KBBpwXa6J
         PeP2idJ0GsgdQiQqckf6mzx2+l8uF1gWKdLoCdhN01nh8uM0+e0kui5qiXk9od6C9/ov
         MmBtUXoXgs9jRO+4OGGTaZ+VgmZRKiGtrQ1LLh2lKhP3bue8Fmyp1g6dw4oE3ojWiYi4
         CGCgWNC8+Te9pYJRRADwelhsBz8j9uC/LBRIoVskr1DYrnfi6unYAFSrKzczDpr3DEGt
         PKIeQK4H1XzFtHT5Aelqkg06gp6GeIdVc1RXlNYvEQ5TUvTMmKp47qFPx5P+itMb3HCL
         MRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724139457; x=1724744257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ESAgy9UsFkZjXObfHjLXJ6mFs9WzkZOFNGN0vocQLSg=;
        b=aT8awUwmi+Z4US5qxkKQkU2KZJ7WndIQnExnnUMCDHqFoHXbzeZKMHQNBdb/dZkGhy
         r4HRY3anoZFhXnfLS4GCXRaKRKBIBbsKxRLelC/+ddLtpMpV17u4s4+93MA588Ll0Ew8
         lNhSak3ZhYu6eawjE7tqNrtk8vQZh3Sxz30EsNH/BL6nrcGOoILNw8ftlE4Od37k6kmH
         HSh6ihPBut0HyCOMC6vdzLpk/VOxcyp7k1bLORj52IR/Bowa5H+fQ8i8PhoLPDvRE4Yy
         WKZYLh8Oub78G/SLNFTfzKL80W5sG/tTeqLKILUExO7bIliFgYqF6yDqPxUKLUKZjsPS
         uX0w==
X-Forwarded-Encrypted: i=1; AJvYcCVoyPoVNWZgNVSVX0lG73cyE2WPEWYUrd4lsr/rx7d8kIn2aF8H1Rz3J4XbVzhENN18QAy43Dv/pvL1i/U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YywP4rmZzpq8WdqOA+dqWfYKhHsnzV+xUlcL059das6znr5WySx
	af2zFekfNNAO700koR8q4WXz2i4SwrXfDLU6JOCT0QQuGLs6oMqQFoSPpHc9iXcL1cg0UP/kZem
	Tcc606KP4E2ug55/SmB3xvkC8ij8=
X-Google-Smtp-Source: AGHT+IF3Z75tnUCIWaHElh56/4EfY+u1ZLx/Lr/zVfzQqGwkZqc/a+ZOpnEs7iqOAwYF28bTrcvMJNXJwNSMy8sllm4=
X-Received: by 2002:a05:6e02:144b:b0:39a:16b2:7290 with SMTP id
 e9e14a558f8ab-39d56e2aaf8mr34555605ab.9.1724139457335; Tue, 20 Aug 2024
 00:37:37 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <1723804959-31921-1-git-send-email-shengjiu.wang@nxp.com>
 <1723804959-31921-5-git-send-email-shengjiu.wang@nxp.com> <6d83cd58-5f02-414b-b627-a0022e071052@linux.intel.com>
 <CAA+D8ANDAxS42=9zOLQY_h_ihvJCmaXzE+_iZyxbSuikqt1CBw@mail.gmail.com> <ceb54a27-144b-40ed-8de5-482f2b0664a0@linux.intel.com>
In-Reply-To: <ceb54a27-144b-40ed-8de5-482f2b0664a0@linux.intel.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 20 Aug 2024 15:37:26 +0800
Message-ID: <CAA+D8ANqb89UavAXTiHvcHyv9uMt8_MYR9hfBaxEJDPNy5C=-g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/6] ASoC: fsl_asrc_m2m: Add memory to memory function
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, 
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 2:59=E2=80=AFPM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 8/20/24 04:53, Shengjiu Wang wrote:
> > On Mon, Aug 19, 2024 at 3:42=E2=80=AFPM Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.intel.com> wrote:
> >>
> >>
> >>
> >> On 8/16/24 12:42, Shengjiu Wang wrote:
> >>> Implement the ASRC memory to memory function using
> >>> the compress framework, user can use this function with
> >>> compress ioctl interface.
> >>>
> >>> Define below private metadata key value for output
> >>> format, output rate and ratio modifier configuration.
> >>> ASRC_OUTPUT_FORMAT 0x80000001
> >>> ASRC_OUTPUT_RATE   0x80000002
> >>> ASRC_RATIO_MOD     0x80000003
> >>
> >> Can the output format/rate change at run-time?
> >
> > Seldom I think.
> >
> >>
> >> If no, then these parameters should be moved somewhere else - e.g.
> >> hw_params or something.
> >
> > This means I will do some changes in compress_params.h, add
> > output format and output rate definition, follow Jaroslav's example
> > right?
>
> yes, having parameters for the PCM case would make sense.
>
> >> I am still not very clear on the expanding the SET_METADATA ioctl to
> >> deal with the ratio changes. This isn't linked to the control layer as
> >> suggested before, and there's no precedent of calling it multiple time=
s
> >> during streaming.
> >
> > Which control layer? if you means the snd_kcontrol_new?  it is bound
> > with sound card,  but in my case,  I need to the control bind with
> > the snd_compr_stream to support multi streams/instances.
>
> I can only quote Jaroslav's previous answer:
>
> "
> This argument is not valid. The controls are bound to the card, but the
> element identifiers have already iface (interface), device and subdevice
> numbers. We are using controls for PCM devices for example. The binding
> is straight.
>
> Just add SNDRV_CTL_ELEM_IFACE_COMPRESS define and specify the compress
> device number in the 'struct snd_ctl_elem_id'.
> "

I don't think it is doable,  or at least I don't know how to do it.

My case is just one card/one device/one subdevice.  can't use it to
distinguish multi streams.

>
> >> I also wonder how it was tested since tinycompress does not support th=
is?
> >
> > I wrote a unit test to test these ASRC M2M functions.
>
> This should be shared IMHO, usually when we add/extend a new interface
> it's best to have a userspace test program that can be used by others.

After Jaroslav updates the tinycompress,  I can update this example to it.

>
> >>> +static int fsl_asrc_m2m_fill_codec_caps(struct fsl_asrc *asrc,
> >>> +                                     struct snd_compr_codec_caps *co=
dec)
> >>> +{
> >>> +     struct fsl_asrc_m2m_cap cap;
> >>> +     __u32 rates[MAX_NUM_BITRATES];
> >>> +     snd_pcm_format_t k;
> >>> +     int i =3D 0, j =3D 0;
> >>> +     int ret;
> >>> +
> >>> +     ret =3D asrc->m2m_get_cap(&cap);
> >>> +     if (ret)
> >>> +             return -EINVAL;
> >>> +
> >>> +     if (cap.rate_in & SNDRV_PCM_RATE_5512)
> >>> +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_=
5512);
> >>
> >> this doesn't sound compatible with the patch2 definitions?
> >>
> >> cap->rate_in =3D SNDRV_PCM_RATE_8000_768000;
> >
> > This ASRC M2M driver is designed for two kinds of hw ASRC modules.
> >
> > one cap is : cap->rate_in =3D SNDRV_PCM_RATE_8000_192000 | SNDRV_PCM_RA=
TE_5512;
> > another is : cap->rate_in =3D SNDRV_PCM_RATE_8000_768000;
> > they are in patch2 and patch3
> >
> >
> >>
> >>> +     if (cap.rate_in & SNDRV_PCM_RATE_8000)
> >>> +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_=
8000);
> >>> +     if (cap.rate_in & SNDRV_PCM_RATE_11025)
> >>> +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_=
11025);
> >>> +     if (cap.rate_in & SNDRV_PCM_RATE_16000)
> >>> +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_=
16000);
> >>> +     if (cap.rate_in & SNDRV_PCM_RATE_22050)
> >>> +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_=
22050);
> >>
> >> missing 24 kHz
> >
> > There is no SNDRV_PCM_RATE_24000 in ALSA.
>
> Right, but that doesn't mean 24kHz cannot be supported. We use
> constraints in those cases. see quote from Takashi found with a 2s
> Google search
>
> https://mailman.alsa-project.org/pipermail/alsa-devel/2013-November/06935=
6.html
>
> "
> CONTINUOUS means that any rate between the specified min and max is
> fine, if no min or max is specified any rate is fine. KNOT means there
> are rates supported other than the standard rates defines by ALSA, but
> the other rates are enumerable. You'd typically specify them by
> explicitly listing them all and use a list constraint or you'd use one
> of the ratio constraints.
> "
>
> >>> +     if (cap.rate_in & SNDRV_PCM_RATE_32000)
> >>> +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_=
32000);
> >>> +     if (cap.rate_in & SNDRV_PCM_RATE_44100)
> >>> +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_=
44100);
> >>> +     if (cap.rate_in & SNDRV_PCM_RATE_48000)
> >>> +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_=
48000);
> >>
> >> missing 64kHz
> >
> > Yes, will add it.
>

