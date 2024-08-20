Return-Path: <linuxppc-dev+bounces-214-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6798C95804C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 09:52:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wp1sH0V5Nz2y8X;
	Tue, 20 Aug 2024 17:52:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::d29"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q5TvBW1+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wp1sG3vYvz2y7K
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 17:52:33 +1000 (AEST)
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-81fd520fe0dso189681339f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 00:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724140351; x=1724745151; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2IPnhCGoD3q9tMfApbwEBiQbgRS87uwpXJiohxsSxo=;
        b=Q5TvBW1+4hxZRq1mpEFyraj0HbDF/Osa7PDwJX8cqn99ys3mI+eZirW0m5Ohelz8g5
         g7ow5gVXl0Junj4ZBWG+l5DdbGK+Jky8n6v8r7ucRSrnGdivg4C8Dcc/sYhjeqNewrXe
         X8MfIuHRv+kucq4M3vFA+qw5QIQ1Gca0eQkfhc5yTZyqC+d3d6YOjFIDSWUZIABw/jW1
         QMdzsU407UHw6L3bKokSAHuQNw4QOQGs33r+2KtH1x3O1SriH++J+RvSqhU4I/MQVkZ5
         55pea9ryEEcxq/Ldpu/K31s0sm0gslfhy04Y4aStMyv4NaTNO55HG5+hsyNoujg3W2Y5
         xNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724140351; x=1724745151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2IPnhCGoD3q9tMfApbwEBiQbgRS87uwpXJiohxsSxo=;
        b=BqKPIhVPj3wGiVaYdyJraiglw14bcZ29FJiuNdJjnuPZ78btvWfxbvK6xG6XfSTxCv
         3cuHX+0d2db6pxJx4N63vEDKD5nA4pamsFNEZS7vLX6XqvG1LLvhZkWjjizFWGj7r80R
         /dPXy1QzdO/U3tLWvdai1ryO6oJ0Wub5uwWc2DJGYEUFKBokgPc46L9ALdtCf56Zruu5
         bTeYPMjIbVFZADTxJP6Yh40ahonTL0lltxRf9sPBYgbpBHoJwwKbFO8C/9Pv/zhZyp3n
         h9LHOeCB28Gv3I55aSLIGL6T7n0FXaESN03LnCmV91ltXx+VJKrT2eHoZKB7ZhmLArLo
         wpZg==
X-Forwarded-Encrypted: i=1; AJvYcCXRdL7xcLunz0TaC4psXl1ITRCbJVpEOxilv3k6OUDAhSZuc7CWlbmsaATpQxqPZzoVTZjqC7NCtDshW3Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy3xqqX4xI6+0FOI/ij7PeFs9O/wpp70OMH4zGd4GdJoCub7tGi
	UaHAlMjurhYA+/eSz9UXgwxDQkdSkOGt79WC1h1kcgwChxyDNo6nriHPuVD3yblrwJzf6iXEim2
	ooEbyIog6JzAb4f5BOITK4l6EsKE=
X-Google-Smtp-Source: AGHT+IEO2EWDuz6eY2EowaDwGtJ0jIVrmGJxLUqdqJsxC8SyVkLr3sdjBBMTIcU/r8joe3Kel+0mWeYYnFgqJYzgQmc=
X-Received: by 2002:a05:6e02:1a25:b0:398:36c0:7968 with SMTP id
 e9e14a558f8ab-39d26ce6426mr141331125ab.6.1724140350868; Tue, 20 Aug 2024
 00:52:30 -0700 (PDT)
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
 <CAA+D8ANDAxS42=9zOLQY_h_ihvJCmaXzE+_iZyxbSuikqt1CBw@mail.gmail.com>
 <ceb54a27-144b-40ed-8de5-482f2b0664a0@linux.intel.com> <CAA+D8ANqb89UavAXTiHvcHyv9uMt8_MYR9hfBaxEJDPNy5C=-g@mail.gmail.com>
 <eceafeef-2dba-48aa-b8b3-198b9bb39fb6@perex.cz>
In-Reply-To: <eceafeef-2dba-48aa-b8b3-198b9bb39fb6@perex.cz>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 20 Aug 2024 15:52:20 +0800
Message-ID: <CAA+D8AMOr8=JS7A0DvOEatL79CwwT4De7vDs6H-VDi05AnkjHQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/6] ASoC: fsl_asrc_m2m: Add memory to memory function
To: Jaroslav Kysela <perex@perex.cz>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, tiwai@suse.com, 
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 3:42=E2=80=AFPM Jaroslav Kysela <perex@perex.cz> wr=
ote:
>
> On 20. 08. 24 9:37, Shengjiu Wang wrote:
> > On Tue, Aug 20, 2024 at 2:59=E2=80=AFPM Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.intel.com> wrote:
> >>
> >>
> >>
> >> On 8/20/24 04:53, Shengjiu Wang wrote:
> >>> On Mon, Aug 19, 2024 at 3:42=E2=80=AFPM Pierre-Louis Bossart
> >>> <pierre-louis.bossart@linux.intel.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 8/16/24 12:42, Shengjiu Wang wrote:
> >>>>> Implement the ASRC memory to memory function using
> >>>>> the compress framework, user can use this function with
> >>>>> compress ioctl interface.
> >>>>>
> >>>>> Define below private metadata key value for output
> >>>>> format, output rate and ratio modifier configuration.
> >>>>> ASRC_OUTPUT_FORMAT 0x80000001
> >>>>> ASRC_OUTPUT_RATE   0x80000002
> >>>>> ASRC_RATIO_MOD     0x80000003
> >>>>
> >>>> Can the output format/rate change at run-time?
> >>>
> >>> Seldom I think.
> >>>
> >>>>
> >>>> If no, then these parameters should be moved somewhere else - e.g.
> >>>> hw_params or something.
> >>>
> >>> This means I will do some changes in compress_params.h, add
> >>> output format and output rate definition, follow Jaroslav's example
> >>> right?
> >>
> >> yes, having parameters for the PCM case would make sense.
> >>
> >>>> I am still not very clear on the expanding the SET_METADATA ioctl to
> >>>> deal with the ratio changes. This isn't linked to the control layer =
as
> >>>> suggested before, and there's no precedent of calling it multiple ti=
mes
> >>>> during streaming.
> >>>
> >>> Which control layer? if you means the snd_kcontrol_new?  it is bound
> >>> with sound card,  but in my case,  I need to the control bind with
> >>> the snd_compr_stream to support multi streams/instances.
> >>
> >> I can only quote Jaroslav's previous answer:
> >>
> >> "
> >> This argument is not valid. The controls are bound to the card, but th=
e
> >> element identifiers have already iface (interface), device and subdevi=
ce
> >> numbers. We are using controls for PCM devices for example. The bindin=
g
> >> is straight.
> >>
> >> Just add SNDRV_CTL_ELEM_IFACE_COMPRESS define and specify the compress
> >> device number in the 'struct snd_ctl_elem_id'.
> >> "
> >
> > I don't think it is doable,  or at least I don't know how to do it.
> >
> > My case is just one card/one device/one subdevice.  can't use it to
> > distinguish multi streams.
>
> I already wrote that the compress core code should be extended to support
> subdevices like other ALSA APIs. I'll work on it. For now, just add suppo=
rt
> for one converter.

Thanks.

What does this subdevices mean?  Is it equal to the compress streams?

When I call snd_compr_ops.open(),  it means to create an instance, the inst=
ance
is created at runtime (call open()), not created when the sound card is cre=
ated.

Best regards
Shengjiu Wang




>
>                                         Jaroslav
>
> --
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
>

