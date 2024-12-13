Return-Path: <linuxppc-dev+bounces-4088-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA6F9F05B9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 08:46:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8hGn2Shqz30hY;
	Fri, 13 Dec 2024 18:46:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::12e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734075969;
	cv=none; b=R9SwgTbNbzW9U3LQkst7trdcOL6cbzTDMBP3RaDbMZmh5aV1aNJqYr9o9SylhVy+AaV07oYHZMYewdW3Kq5NGDeoVscF6zFhdWNco0rO2laT0uJiWO5FXuJgc6Z7FPY8Ed/cEXnpxmc4nHvoZSLS4Gy+R2mBuFQk/sY9FABTcRrXzP5rTGV8FncP4HGgHMqU43HeklC1YKfUVdLeaM2JjkIsgd+o//N9u7esK4YlxLC8j8aQxz3gvIhf4kphlpP3jLwklTR5ONw4lttI6XHm9L3RXlIRjompwl2wyYpWUSc8wG09SFbIMaxF4U2i9jCKRxN39Wbv5Vj0N3+WcapEVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734075969; c=relaxed/relaxed;
	bh=QYYkz5wo0agid+Six8DIqpuAadZaRu0O1Lrum3LM5+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dhuFh70YpB9gZFmBr07ayXhHCCtopLuTBLLkeLDgnIgBdSDudrxqLNWLZ/5xb2urkjlM0m7OlV7sQfHIrjSv0hSmEkn8EUctO3BqD8ocRA5DCfLCJwXKwhUhaq32E5eEW+wvW6cEFGG8GJkRoPIkT2m2HQtpZGkAPqVXwjzyJihMbA41Dd83TytONYOcMC6UOuFFRsHQsg+tmC3JMQd/uJavwaoNnGqTqiqP8X1GPOMCv+UaReAWRTjY9Cf73PgmhbhIbD+eavoeVnfYtsEYRMVeJBdXcM4rOXi1mxzpGveL3XBQTvXcQ4Sg/tN8iuOGwTGq8aChk++G+v9qY4LRmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cq3VFNjD; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cq3VFNjD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8hGf3mTmz30hW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 18:46:01 +1100 (AEDT)
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3a7d7c1b190so5179275ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 23:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734075959; x=1734680759; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYYkz5wo0agid+Six8DIqpuAadZaRu0O1Lrum3LM5+Y=;
        b=cq3VFNjDLWMeQok1p7LQEyIsk9xqxmZIxQT3FQ54RIJ4JVziDyfY7/fsh79j8+CR+o
         207DyNGq34l9dmcXGCyZPceCRdB0yyFIf4ZWuTdMNztzT/bgHwgIZvMUUq/S1n1M+aJb
         AaQZHCle3lqneVPa1RY2jj7u6pedF8zpGJMDSn0XWTpEFFhF9N5cmpk4sy/M7JSrXxLF
         SeA+EoQ/yWYoIUT1Z95nRXB+VRx1r/8y4Uh2EoW8yUHHvLXaG48+xGZMOfm7x2kh22GP
         jTB0/UaG8z2si6OvKZN+vIrI/dRhIQa6oTq3LrDVRatA3vz+O7gdxlcGROgdqZZmusY/
         jMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734075959; x=1734680759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYYkz5wo0agid+Six8DIqpuAadZaRu0O1Lrum3LM5+Y=;
        b=HzXNIKqlCR/QmedPngC/X2G5Ko+zAb0gLpfC+JRjOK7ilUE6/JfCgAlTHHPMEmvejS
         R+V86IzNOxTQf1fYaSbLXBM6d3nhIADbbBof/6jKYsx/5hPbVkNOlVhvp8loQU83+VRZ
         VUp6g/DfuL+IVdReffZfi2V+mRKQbIoJDuq+zbwjn1Lg9MSjIhVzxvxnP1Ckf53ZYO5B
         /alyS5DhpxLXFDI7JzHLXR9jKKJ5tv7vGWk822MHaYdTKcO9KPK0wbPintfpdZIVcBrS
         9a0QL13pN1n3OfaWlWVcxu/KDV1Bg9OOqHaHimpidt3cJiB1p3BgvlpOUu8rb+MSmGuF
         pwxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU93BSKJIj+wIXiBEB1YqG+QzYpI5JxkoZC2reWKRcahmaVVcLaW9afq26YarW2CgjZ52LfgYUmG+wL/bM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YztC4obU40PRLKKidcGcGO6CQQMqktd1+rAXwfnzYaBGVhOVcvI
	lKOjb8Okd3x6wMnr5WZKxlNSq5bqvjWCGp24BWo5zrSZxH6dt6VCVfTBTJVhLojgvCNoOaO0O44
	D7d/EoSjxj0OEiL0Z7Xv4tDXqpR4=
X-Gm-Gg: ASbGnctV38+8B2lPlFc+Y9sGqeiW+DUoCJNwWNshFTiFMcy5/NTQKx93yLKePxrzeq1
	53wPeZgCJsM7+4j5ED4Rc/i7uhysDGn+dyhclmA==
X-Google-Smtp-Source: AGHT+IEZp59bOt9C+xTIkk05sua6DTUcqnvF1/4kOUynOScRvwUkj4Pb9JtHkrWiwmRLpAQs8Kn/IRepKMWS2L8ZLWk=
X-Received: by 2002:a05:6e02:168b:b0:3a7:a69c:9692 with SMTP id
 e9e14a558f8ab-3aff8c91543mr15440795ab.21.1734075958652; Thu, 12 Dec 2024
 23:45:58 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20241212074509.3445859-1-shengjiu.wang@nxp.com>
 <20241212074509.3445859-5-shengjiu.wang@nxp.com> <58b4a167-5a13-49b2-9b08-58c3041b772b@sirena.org.uk>
In-Reply-To: <58b4a167-5a13-49b2-9b08-58c3041b772b@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 13 Dec 2024 15:45:46 +0800
Message-ID: <CAA+D8AMKLFJx3Z03rLthaH-7_tAmb8c1c4wCSOee-t5uxZg2oA@mail.gmail.com>
Subject: Re: [PATCH v7 4/6] ASoC: fsl_asrc_m2m: Add memory to memory function
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, 
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Dec 12, 2024 at 7:45=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Dec 12, 2024 at 03:45:07PM +0800, Shengjiu Wang wrote:
> > Implement the ASRC memory to memory function using
> > the compress framework, user can use this function with
> > compress ioctl interface.
> >
> > This feature can be shared by ASRC and EASRC drivers
>
> This breaks an x86 allmodconfig build (using GCC 13):
>
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:186:68: warning: =E2=80=
=98struct snd_compr_task_runtime=E2=80=99 declared inside parameter list wi=
ll not be visible outside of this definition or declaration
>   186 | static void asrc_m2m_device_run(struct fsl_asrc_pair *pair, struc=
t snd_compr_task_runtime *task)
>       |                                                                  =
  ^~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c: In function =E2=80=98asr=
c_m2m_device_run=E2=80=99:
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:212:26: error: invalid us=
e of undefined type =E2=80=98struct snd_compr_task_runtime=E2=80=99
>   212 |         in_buf_len =3D task->input_size;
>       |                          ^~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:279:13: error: invalid us=
e of undefined type =E2=80=98struct snd_compr_task_runtime=E2=80=99
>   279 |         task->output_size =3D out_dma_len;
>       |             ^~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c: At top level:
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:451:49: warning: =E2=80=
=98struct snd_compr_task_runtime=E2=80=99 declared inside parameter list wi=
ll not be visible outside of this definition or declaration
>   451 |                                          struct snd_compr_task_ru=
ntime *task)
>       |                                                 ^~~~~~~~~~~~~~~~~=
~~~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c: In function =E2=80=98fsl=
_asrc_m2m_comp_task_create=E2=80=99:
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:465:13: error: invalid us=
e of undefined type =E2=80=98struct snd_compr_task_runtime=E2=80=99
>   465 |         task->input =3D dma_buf_export(&exp_info_in);
>       |             ^~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:466:24: error: invalid us=
e of undefined type =E2=80=98struct snd_compr_task_runtime=E2=80=99
>   466 |         if (IS_ERR(task->input)) {
>       |                        ^~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:467:35: error: invalid us=
e of undefined type =E2=80=98struct snd_compr_task_runtime=E2=80=99
>   467 |                 ret =3D PTR_ERR(task->input);
>       |                                   ^~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:475:13: error: invalid us=
e of undefined type =E2=80=98struct snd_compr_task_runtime=E2=80=99
>   475 |         task->output =3D dma_buf_export(&exp_info_out);
>       |             ^~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:476:24: error: invalid us=
e of undefined type =E2=80=98struct snd_compr_task_runtime=E2=80=99
>   476 |         if (IS_ERR(task->output)) {
>       |                        ^~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:477:35: error: invalid us=
e of undefined type =E2=80=98struct snd_compr_task_runtime=E2=80=99
>   477 |                 ret =3D PTR_ERR(task->output);
>       |                                   ^~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c: At top level:
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:523:48: warning: =E2=80=
=98struct snd_compr_task_runtime=E2=80=99 declared inside parameter list wi=
ll not be visible outside of this definition or declaration
>   523 |                                         struct snd_compr_task_run=
time *task)
>       |                                                ^~~~~~~~~~~~~~~~~~=
~~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c: In function =E2=80=98fsl=
_asrc_m2m_comp_task_start=E2=80=99:
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:528:35: error: passing ar=
gument 2 of =E2=80=98asrc_m2m_device_run=E2=80=99 from incompatible pointer=
 type [-Werror=3Dincompatible-pointer-types]
>   528 |         asrc_m2m_device_run(pair, task);
>       |                                   ^~~~
>       |                                   |
>       |                                   struct snd_compr_task_runtime *
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:186:92: note: expected =
=E2=80=98struct snd_compr_task_runtime *=E2=80=99 but argument is of type =
=E2=80=98struct snd_compr_task_runtime *=E2=80=99
>   186 | static void asrc_m2m_device_run(struct fsl_asrc_pair *pair, struc=
t snd_compr_task_runtime *task)
>       |                                                             ~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c: At top level:
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:534:47: warning: =E2=80=
=98struct snd_compr_task_runtime=E2=80=99 declared inside parameter list wi=
ll not be visible outside of this definition or declaration
>   534 |                                        struct snd_compr_task_runt=
ime *task)
>       |                                               ^~~~~~~~~~~~~~~~~~~=
~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:540:47: warning: =E2=80=
=98struct snd_compr_task_runtime=E2=80=99 declared inside parameter list wi=
ll not be visible outside of this definition or declaration
>   540 |                                        struct snd_compr_task_runt=
ime *task)
>       |                                               ^~~~~~~~~~~~~~~~~~~=
~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:623:10: error: =E2=80=98s=
truct snd_compr_ops=E2=80=99 has no member named =E2=80=98task_create=E2=80=
=99
>   623 |         .task_create =3D fsl_asrc_m2m_comp_task_create,
>       |          ^~~~~~~~~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:623:24: warning: excess e=
lements in struct initializer
>   623 |         .task_create =3D fsl_asrc_m2m_comp_task_create,
>       |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:623:24: note: (near initi=
alization for =E2=80=98fsl_asrc_m2m_compr_ops=E2=80=99)
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:624:10: error: =E2=80=98s=
truct snd_compr_ops=E2=80=99 has no member named =E2=80=98task_start=E2=80=
=99
>   624 |         .task_start =3D fsl_asrc_m2m_comp_task_start,
>       |          ^~~~~~~~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:624:23: warning: excess e=
lements in struct initializer
>   624 |         .task_start =3D fsl_asrc_m2m_comp_task_start,
>       |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:624:23: note: (near initi=
alization for =E2=80=98fsl_asrc_m2m_compr_ops=E2=80=99)
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:625:10: error: =E2=80=98s=
truct snd_compr_ops=E2=80=99 has no member named =E2=80=98task_stop=E2=80=
=99
>   625 |         .task_stop =3D fsl_asrc_m2m_comp_task_stop,
>       |          ^~~~~~~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:625:22: warning: excess e=
lements in struct initializer
>   625 |         .task_stop =3D fsl_asrc_m2m_comp_task_stop,
>       |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:625:22: note: (near initi=
alization for =E2=80=98fsl_asrc_m2m_compr_ops=E2=80=99)
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:626:10: error: =E2=80=98s=
truct snd_compr_ops=E2=80=99 has no member named =E2=80=98task_free=E2=80=
=99
>   626 |         .task_free =3D fsl_asrc_m2m_comp_task_free,
>       |          ^~~~~~~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:626:22: warning: excess e=
lements in struct initializer
>   626 |         .task_free =3D fsl_asrc_m2m_comp_task_free,
>       |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:626:22: note: (near initi=
alization for =E2=80=98fsl_asrc_m2m_compr_ops=E2=80=99)
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c: In function =E2=80=98fsl=
_asrc_m2m_init=E2=80=99:
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:701:41: error: =E2=80=98S=
ND_COMPRESS_ACCEL=E2=80=99 undeclared (first use in this function); did you=
 mean =E2=80=98SNDRV_COMPRESS_AVAIL=E2=80=99?
>   701 |         ret =3D snd_compress_new(card, 0, SND_COMPRESS_ACCEL, "AS=
RC M2M", compr);
>       |                                         ^~~~~~~~~~~~~~~~~~
>       |                                         SNDRV_COMPRESS_AVAIL
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:701:41: note: each undecl=
ared identifier is reported only once for each function it appears in
> cc1: some warnings being treated as errors

Hi Mark

     I can't reproduce this issue with 'make allmodconfig'.
I tried the branches: for-6.13/for-6.14/for-next.

     I suspect you are using the wrong branch, because I can
reproduce this issue on for-6.12. which is caused by the below
commit that is only applied from for-6.13.
04177158cf98 ("ALSA: compress_offload: introduce accel operation mode")

    But could you please tell me your steps in detail?, so that I can
try more.

Best regards
Shengjiu Wang

