Return-Path: <linuxppc-dev+bounces-73-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1435951243
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2024 04:22:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KD0s5qGS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WkBqc4tF3z2y1l;
	Wed, 14 Aug 2024 12:22:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KD0s5qGS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkBqc0tXSz2xbd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2024 12:22:50 +1000 (AEST)
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-39b3ffc570bso28498275ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2024 19:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723602167; x=1724206967; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89JHmaWrb++n3w64WkT++R6JNihPGry7EvRTcS8lWyw=;
        b=KD0s5qGSWSeGWJ8WS2tyiuHDC1mTJ6/8N2jU4FDaAQub7xTlXriQ2k23n/f0hipN3g
         VMLYGmw7RHQ+UbXRv/mL0ZO+7LvOIqX3pNvx9t1bu9k7Hx9bB/7ldTJayCU2ya7XK5De
         NwczmJ0S0y8VR8ly3qTnxlqCq84c6NCZoI96Fkn5j7p8AFMfEvQEk/xjmuPhRvdTtUc/
         B4muY+UpWzXiITOGxQzqvVJyvWVvZfmpf+FyxnDwRbbT+uLuGSwlvdFVNOy4z8pjKasm
         PRnv7p1HGQzoNIMkuxnHUVzKd4HDqPbXpKhMx7AprW5fJOdyI/Ts6Q7s0/58OvV9fpH9
         VGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723602167; x=1724206967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89JHmaWrb++n3w64WkT++R6JNihPGry7EvRTcS8lWyw=;
        b=cU3SUS/y0Xa9+hleVE1UJ35m67HcgpMOzmllZ5PezdLWiO8bmSXolrh/nHCGNnaA6m
         tm/E6xcuUByUrN3IigNlIi+mBQnPKUWTed0aWSjKJMDgClNklzmNHyEhpZRbUWWE/a3g
         wOINERJ3uqJfEENrHI+cJV/yPp4zgciIstaVNYumSg01vsaNKR8iwkSZSgVMt3dm3uVN
         y5oc9kSLept7ipYe2Xf/KyQWMgQTERErpVprp1kAozoe55X5cQeJGyriVLGNBOv8QR9L
         D//m7ueBRZGpU9Ypu0yfuN1KwQOiWsgXkEMe4147aAu3NMGZnt+laWAJsuKNEWK5ZCZZ
         VptQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFssB0yoXz9uzBLTz9YCPq+mhFKqwZ7sqR+4U/rG7jGB+lypOk42Z6iSn4CMb0y/RhhhAWZNQIijX6Fu5Ppnp349GsnScxsO0uNGQCXA==
X-Gm-Message-State: AOJu0YyQ4siZS+hpRfrMvLYEyzXMbtB2zOFsLo/6yJwLtied2e84vL9+
	49IBkGJraHRe/3GE324LOIz5m3NFHHdRGZNO6iU2M3Jfc853DLFhoTEHIWZdJubZQiRQDmDFFPj
	W5+qWZAE/vLgo/whfE3owlUyHUNs=
X-Google-Smtp-Source: AGHT+IFPVUkZK6h4SS7dzEMo826uVZIEi+fljxMmUw43807CP8vAA2UHQF5gxQfwfaTavdVKDSVhT479wlqQfJ6aRnI=
X-Received: by 2002:a05:6e02:1d9d:b0:397:c5da:dc02 with SMTP id
 e9e14a558f8ab-39d12484a08mr20645625ab.4.1723602167332; Tue, 13 Aug 2024
 19:22:47 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <1722940003-20126-1-git-send-email-shengjiu.wang@nxp.com>
 <1722940003-20126-2-git-send-email-shengjiu.wang@nxp.com> <e89a56bf-c377-43d8-bba8-6a09e571ed64@linux.intel.com>
 <CAA+D8AN9JXJr-BZf8aY7d4rB6M60pXS_DG=qv=P6=2r1A18ATA@mail.gmail.com>
 <ffa85004-8d86-4168-b278-afd24d79f9d8@linux.intel.com> <116041ee-7139-4b77-89be-3a68f699c01b@perex.cz>
 <930bb152-860a-4ec5-9ef0-1c96f554f365@linux.intel.com> <c9039808-cd04-452d-9f6c-f91811088456@perex.cz>
 <ed1192e0-00e7-4739-a687-c96dc2d62898@linux.intel.com> <CAA+D8AMOh=G7W5-dYw_=Xx-s0PqEu2suKYorscoWku86Rn-=+A@mail.gmail.com>
 <542d47c5-7ce3-4c17-8c0a-3a2b2a9e6c6a@linux.intel.com> <c3b8f7b8-fc5e-4285-bee8-7edd448a405d@perex.cz>
 <CAA+D8ANg7C7vuxU44mAG8EnmcZjB_te5N_=4M4v_-Q9ZyPZ49g@mail.gmail.com>
 <2be4303e-58e1-4ad7-92cf-f06fa6fa0f08@perex.cz> <7dc039db-ecce-4650-8eb7-96d0cfde09a2@linux.intel.com>
In-Reply-To: <7dc039db-ecce-4650-8eb7-96d0cfde09a2@linux.intel.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 14 Aug 2024 10:22:35 +0800
Message-ID: <CAA+D8AMv=tHV3b-Rfo9Pjqs0bX5SVschD=WD06qxjJOk5zQmiQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] ALSA: compress: add Sample Rate Converter codec support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, 
	tiwai@suse.com, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 9:44=E2=80=AFPM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 8/12/24 15:31, Jaroslav Kysela wrote:
> > On 12. 08. 24 12:24, Shengjiu Wang wrote:
> >> On Fri, Aug 9, 2024 at 10:01=E2=80=AFPM Jaroslav Kysela <perex@perex.c=
z> wrote:
> >>>
> >>> On 09. 08. 24 14:52, Pierre-Louis Bossart wrote:
> >>>
> >>>>> And metadata
> >>>>> ioctl can be called many times which can meet the ratio modifier
> >>>>> requirement (ratio may be drift on the fly)
> >>>>
> >>>> Interesting, that's yet another way of handling the drift with
> >>>> userspace
> >>>> modifying the ratio dynamically. That's different to what I've seen
> >>>> before.
> >>>
> >>> Note that the "timing" is managed by the user space with this scheme.
> >>>
> >>>>> And compress API uses codec as the unit for capability query and
> >>>>> parameter setting,  So I think need to define "SND_AUDIOCODEC_SRC'
> >>>>> and 'struct snd_dec_src',  for the 'snd_dec_src' just defined outpu=
t
> >>>>> format and output rate, channels definition just reuse the
> >>>>> snd_codec.ch_in.
> >>>>
> >>>> The capability query is an interesting point as well, it's not clear
> >>>> how
> >>>> to expose to userspace what this specific implementation can do, whi=
le
> >>>> at the same time *requiring* userpace to update the ratio dynamicall=
y.
> >>>> For something like this to work, userspace needs to have pre-existin=
g
> >>>> information on how the SRC works.
> >>>
> >>> Yes, it's about abstraction. The user space wants to push data, read
> >>> data back
> >>> converted to the target rate and eventually modify the drift using a
> >>> control
> >>> managing clocks using own way. We can eventually assume, that if this
> >>> control
> >>> does not exist, the drift cannot be controlled. Also, nice thing is
> >>> that the
> >>> control has min and max values (range), so driver can specify the
> >>> drift range,
> >>> too.
> >>>
> >>> And again, look to "PCM Rate Shift 100000" control implementation in
> >>> sound/drivers/aloop.c. It would be nice to have the base offset for t=
he
> >>> shift/drift/pitch value standardized.
> >>
> >> Thanks.
> >>
> >> But the ASRC driver I implemented is different, I just register one so=
und
> >> card, one device/subdevice.  but the ASRC hardware support 4 instances
> >> together, so user can open the card device 4 times to create 4 instanc=
es
> >> then the controls can only bind with compress streams.
> >
> > It's just a reason to add the subdevice code for the compress offload
> > layer like we have in other APIs for overall consistency. I'll try to
> > work on this.
>
> I thought this was supported already? I remember there was a request to
> enable more than one compressed stream for enhanced cross-fade support
> with different formats? That isn't supported with the single-device +
> PARTIAL_DRAIN method.
>
> Vinod?
>
> >> I think I can remove the 'SNDRV_COMPRESS_SRC_RATIO_MOD',
> >
> > Yes.
> >
> >> Only define a private type for driver,  which means only the ASRC driv=
er
> >> and its user application know the type.
> >
> > The control API should be used for this IMHO.
>
> Agree, this would be a 'clean' split where the compress API is used for
> the data parts and the control parts used otherwise to alter the ratio
> or whatever else is needed.
>
> >> For the change in 'include/uapi/sound/compress_params.h",  should I
> >> keep them,  is there any other suggestion for them?
>
> You can add the SRC type but if you use a control for the parameters you
> don't need to add anything for the encoder options, do you?
>

Yes, to go further, I think we can use SND_AUDIOCODEC_PCM, then
the SRC type will be dropped.

But my understanding of the control means the .set_metadata() API, right?
As I said, the output rate, output format, and ratio modifier are applied t=
o
the instances of ASRC,  which is the snd_compr_stream in driver.
so only the .set_metadata() API can be used for these purposes.

Best regards
Shengjiu Wang

