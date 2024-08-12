Return-Path: <linuxppc-dev+bounces-12-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B80FB94EB40
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 12:35:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=btJLpJh0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wj9rg1nQfz2xH9;
	Mon, 12 Aug 2024 20:35:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=btJLpJh0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wj9cG1171z2xPZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 20:24:28 +1000 (AEST)
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-39aeccc6377so15473775ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 03:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723458263; x=1724063063; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPC3vtsqYn5XJUeqo67iJn2rVnzxW9E5GvxuWYZUQ5I=;
        b=btJLpJh0vCHi05/ZDacGv63FsRVEeOYK1TtsPXDaP3VIZNXgXfHcB12x5x1V6Jqjrw
         kn13WuNAiJy8eqacLxQqVpgfGTqgS1uAN2vADbsmFqg3Jb0qltH4tD+DjOXZ5YqmG0wB
         p80VKMzCW79uNVXXHZnKjKDMhKJ4+pcmic72E3iiZWdRAqGnha/8/eR7Z2yaS4ilfFWl
         Zn6nCY2I0u7EqPvQjo629zfiaOlfE5aSkNnCUdlpujDJS0PenksobNaYf3LEOEwRC4wh
         sJ+kyXf7nC9vWGYOu9CbEzAYPGFuJ1HSU6POn3pDGXqrQySTJPunXPxkW03S31EskM89
         TUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723458263; x=1724063063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mPC3vtsqYn5XJUeqo67iJn2rVnzxW9E5GvxuWYZUQ5I=;
        b=G0i6g0ctJeNIxJpjPfHQcMewzC/liq/MStIwL3EohOL3ca2bzDFyXJvcVs4vuo/V47
         IftRkuEKeOAt1Ck2Ll2zcvpS/aKdrZ+TDfdgB/ZRPOuWU6F/uNmpKmA4Bia8r3zDropu
         O9ick4mr5f7tzeh3eKVHWhshjEmWcme48/lJp3wKPuWlp28k762qlAboTi+xYkLwaqws
         bNU4wbvZ4gr+0BsTefbiCzlUb/LZNrRykjkEVgFF6vdNQmnvF71bMrIzeJIqFY6Vwr1e
         Jl6BF5RNzSsxPsTF5H3wVlv8XSMYOekvnFetZV4zyLV1rz3lWxI/w5DkIlfrZEpCdL2V
         w1uw==
X-Forwarded-Encrypted: i=1; AJvYcCUDbMWzY+hEFG0Y1uNF/1F5wUTMjAvfUK0fM7a29GTjeIFvOb5rRUic+DvbnMsK3uEnT659/JSMwADZIKh/larUiKLkghahQHOiRXtilw==
X-Gm-Message-State: AOJu0YwI5iti2aZ5JdVCl9z8hxcRwl0iY9QhNljsbuRZQmFostXEFPOV
	EHGYUW7C4QoT4jh99oss1TxBOTkrd6s5wirwfFPWJN7sWbW7CJ/MlnvWSGDQFJ3Y9VWJt66oFyq
	c6sNu28nvMKP7+DN8JX1KjBp7Z38=
X-Google-Smtp-Source: AGHT+IHdQ3RNrczHyEp+b16RjNhnMCOeSegrx7nTq50uxdHKAwi7ql6H7scu59mGUC+Dyrjh2BuMJ/sg9salc/H/EqI=
X-Received: by 2002:a05:6e02:1a04:b0:397:2dcd:80e5 with SMTP id
 e9e14a558f8ab-39b7a463914mr85661235ab.27.1723458263144; Mon, 12 Aug 2024
 03:24:23 -0700 (PDT)
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
In-Reply-To: <c3b8f7b8-fc5e-4285-bee8-7edd448a405d@perex.cz>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 12 Aug 2024 18:24:11 +0800
Message-ID: <CAA+D8ANg7C7vuxU44mAG8EnmcZjB_te5N_=4M4v_-Q9ZyPZ49g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] ALSA: compress: add Sample Rate Converter codec support
To: Jaroslav Kysela <perex@perex.cz>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, tiwai@suse.com, 
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 10:01=E2=80=AFPM Jaroslav Kysela <perex@perex.cz> wr=
ote:
>
> On 09. 08. 24 14:52, Pierre-Louis Bossart wrote:
>
> >> And metadata
> >> ioctl can be called many times which can meet the ratio modifier
> >> requirement (ratio may be drift on the fly)
> >
> > Interesting, that's yet another way of handling the drift with userspac=
e
> > modifying the ratio dynamically. That's different to what I've seen bef=
ore.
>
> Note that the "timing" is managed by the user space with this scheme.
>
> >> And compress API uses codec as the unit for capability query and
> >> parameter setting,  So I think need to define "SND_AUDIOCODEC_SRC'
> >> and 'struct snd_dec_src',  for the 'snd_dec_src' just defined output
> >> format and output rate, channels definition just reuse the snd_codec.c=
h_in.
> >
> > The capability query is an interesting point as well, it's not clear ho=
w
> > to expose to userspace what this specific implementation can do, while
> > at the same time *requiring* userpace to update the ratio dynamically.
> > For something like this to work, userspace needs to have pre-existing
> > information on how the SRC works.
>
> Yes, it's about abstraction. The user space wants to push data, read data=
 back
> converted to the target rate and eventually modify the drift using a cont=
rol
> managing clocks using own way. We can eventually assume, that if this con=
trol
> does not exist, the drift cannot be controlled. Also, nice thing is that =
the
> control has min and max values (range), so driver can specify the drift r=
ange,
> too.
>
> And again, look to "PCM Rate Shift 100000" control implementation in
> sound/drivers/aloop.c. It would be nice to have the base offset for the
> shift/drift/pitch value standardized.

Thanks.

But the ASRC driver I implemented is different, I just register one sound
card, one device/subdevice.  but the ASRC hardware support 4 instances
together, so user can open the card device 4 times to create 4 instances
then the controls can only bind with compress streams.

I think I can remove the 'SNDRV_COMPRESS_SRC_RATIO_MOD',
Only define a private type for driver,  which means only the ASRC driver
and its user application know the type.

For the change in 'include/uapi/sound/compress_params.h",  should I
keep them,  is there any other suggestion for them?

Best regards
Shengjiu Wang

>
>                                         Jaroslav
>
> --
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
>

