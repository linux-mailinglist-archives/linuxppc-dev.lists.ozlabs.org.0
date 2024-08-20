Return-Path: <linuxppc-dev+bounces-198-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1702957BAD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 04:53:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnvD571j3z2xy3;
	Tue, 20 Aug 2024 12:53:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::12c"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GmOS1CGJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnvD52dFlz2xdR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 12:53:24 +1000 (AEST)
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-39d3cd4fa49so7023365ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2024 19:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724122401; x=1724727201; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fT6vSqFxRxEeg2TyE8vAmieBZnT3qlYo8e/6USKHH/E=;
        b=GmOS1CGJBDN5GXUued3osk2D0gmv4W8QsgGezqPtM5G4L6u9o+eNSzausG4I/rUYyc
         HAYX35Ykcniovd5VghPrYMzq4ecjX15i317ekWnQxOzhoRC3gw6xdfk4vJMFBiII7Q44
         TOS8/77aCl6o1/rWcKarC5P3TTz8aTklOQenmjn3z1HGFH9gGWNT62VCO/rIvR2ItT+R
         IRfaVaihOf6iL2wGPb2LHTaVlaj518wCgVHMRcksRSYbTg1BSLkYPuonX+Pptd01gKZ9
         aseGmq7k0ngoPeUhYOQP35JhbRKp8HL20kSjg5MUa9F6jSnffv9Yf27XURwS68J1tqJ+
         Hmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724122401; x=1724727201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fT6vSqFxRxEeg2TyE8vAmieBZnT3qlYo8e/6USKHH/E=;
        b=Q0YANdWK8Vv38vyVS19ow4qGyTTZz40lanPSP5QNAPyOwTXc0oWrj9Mk8LSBYkQPTn
         MMsXSJFTmuTq/5C9WVsoCdQ2G+piylCkpypyLux4cTl+jpi/QDj8vBzaH6eAWQPpm5mQ
         lWVDg4BZMg97yeWWcb7OpcdekmE1p6sjqrjPmJeamyMF485YTfqykOCjuPk3nKTnJ3W7
         jcEOCnYR8dR2aKc2LRicz122TfY723VK39GbpM0HA8dXQKBY+/pRMaZ2SXUAg7ztNC+d
         KXGheVNXlrbcXer20JEkIVrBZ78CIC3HvfyGviMhd1PnGQH+kIkT22xaS2AhVabXDPIy
         U0Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUuEcOiCwDLL/mw2858jbXHfojRAAi6Hvoq5VIiioRbuTfKP2t3q6K8pcThTD11Z6zBXi7lSClyPlkj5I0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyRBLVpYDAQFhGFEuLWGjQYl10ZEiODL4D79VE8JXXOlvwx7QAZ
	ErRWDcRGz4gpNElhpXmmbAcvvxIrY31tlH11XPo5l6OnL4rj1H+T52DDbbx/ztHf/wGknXxmYhn
	s7M9M3KzbF0NIoRZ19LHE3IcOIoI=
X-Google-Smtp-Source: AGHT+IGl4gRPN5RAOxKXugMK43Dh6VHASCDS5Twf9YsdPNqPWrRzvf3PhVgc7lqQMpYhRDm7MWOvnuVY3lUtLNY/Lo4=
X-Received: by 2002:a05:6e02:20cb:b0:39d:4d2d:d0de with SMTP id
 e9e14a558f8ab-39d56dd773emr21812545ab.3.1724122401038; Mon, 19 Aug 2024
 19:53:21 -0700 (PDT)
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
In-Reply-To: <6d83cd58-5f02-414b-b627-a0022e071052@linux.intel.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 20 Aug 2024 10:53:10 +0800
Message-ID: <CAA+D8ANDAxS42=9zOLQY_h_ihvJCmaXzE+_iZyxbSuikqt1CBw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/6] ASoC: fsl_asrc_m2m: Add memory to memory function
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, 
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 3:42=E2=80=AFPM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 8/16/24 12:42, Shengjiu Wang wrote:
> > Implement the ASRC memory to memory function using
> > the compress framework, user can use this function with
> > compress ioctl interface.
> >
> > Define below private metadata key value for output
> > format, output rate and ratio modifier configuration.
> > ASRC_OUTPUT_FORMAT 0x80000001
> > ASRC_OUTPUT_RATE   0x80000002
> > ASRC_RATIO_MOD     0x80000003
>
> Can the output format/rate change at run-time?

Seldom I think.

>
> If no, then these parameters should be moved somewhere else - e.g.
> hw_params or something.

This means I will do some changes in compress_params.h, add
output format and output rate definition, follow Jaroslav's example
right?


>
> I am still not very clear on the expanding the SET_METADATA ioctl to
> deal with the ratio changes. This isn't linked to the control layer as
> suggested before, and there's no precedent of calling it multiple times
> during streaming.

Which control layer? if you means the snd_kcontrol_new?  it is bound
with sound card,  but in my case,  I need to the control bind with
the snd_compr_stream to support multi streams/instances.

>
> I also wonder how it was tested since tinycompress does not support this?

I wrote a unit test to test these ASRC M2M functions.

>
>
> > +static int fsl_asrc_m2m_fill_codec_caps(struct fsl_asrc *asrc,
> > +                                     struct snd_compr_codec_caps *code=
c)
> > +{
> > +     struct fsl_asrc_m2m_cap cap;
> > +     __u32 rates[MAX_NUM_BITRATES];
> > +     snd_pcm_format_t k;
> > +     int i =3D 0, j =3D 0;
> > +     int ret;
> > +
> > +     ret =3D asrc->m2m_get_cap(&cap);
> > +     if (ret)
> > +             return -EINVAL;
> > +
> > +     if (cap.rate_in & SNDRV_PCM_RATE_5512)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_55=
12);
>
> this doesn't sound compatible with the patch2 definitions?
>
> cap->rate_in =3D SNDRV_PCM_RATE_8000_768000;

This ASRC M2M driver is designed for two kinds of hw ASRC modules.

one cap is : cap->rate_in =3D SNDRV_PCM_RATE_8000_192000 | SNDRV_PCM_RATE_5=
512;
another is : cap->rate_in =3D SNDRV_PCM_RATE_8000_768000;
they are in patch2 and patch3


>
> > +     if (cap.rate_in & SNDRV_PCM_RATE_8000)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_80=
00);
> > +     if (cap.rate_in & SNDRV_PCM_RATE_11025)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_11=
025);
> > +     if (cap.rate_in & SNDRV_PCM_RATE_16000)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_16=
000);
> > +     if (cap.rate_in & SNDRV_PCM_RATE_22050)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_22=
050);
>
> missing 24 kHz

There is no SNDRV_PCM_RATE_24000 in ALSA.

>
> > +     if (cap.rate_in & SNDRV_PCM_RATE_32000)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_32=
000);
> > +     if (cap.rate_in & SNDRV_PCM_RATE_44100)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_44=
100);
> > +     if (cap.rate_in & SNDRV_PCM_RATE_48000)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_48=
000);
>
> missing 64kHz

Yes, will add it.

Best regards
Shengjiu Wang

>
> > +     if (cap.rate_in & SNDRV_PCM_RATE_88200)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_88=
200);
> > +     if (cap.rate_in & SNDRV_PCM_RATE_96000)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_96=
000);
> > +     if (cap.rate_in & SNDRV_PCM_RATE_176400)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_17=
6400);
> > +     if (cap.rate_in & SNDRV_PCM_RATE_192000)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_19=
2000);
> > +     if (cap.rate_in & SNDRV_PCM_RATE_352800)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_35=
2800);
> > +     if (cap.rate_in & SNDRV_PCM_RATE_384000)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_38=
4000);
> > +     if (cap.rate_in & SNDRV_PCM_RATE_705600)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_70=
5600);
> > +     if (cap.rate_in & SNDRV_PCM_RATE_768000)
> > +             rates[i++] =3D snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_76=
8000);
> > +
> > +     pcm_for_each_format(k) {
> > +             if (pcm_format_to_bits(k) & cap.fmt_in) {
> > +                     codec->descriptor[j].max_ch =3D cap.chan_max;
> > +                     memcpy(codec->descriptor[j].sample_rates, rates, =
i * sizeof(__u32));
> > +                     codec->descriptor[j].num_sample_rates =3D i;
> > +                     codec->descriptor[j].formats =3D k;
> > +                     j++;
> > +             }
> > +     }
> > +
> > +     codec->codec =3D SND_AUDIOCODEC_PCM;
> > +     codec->num_descriptors =3D j;
> > +     return 0;
>
>

