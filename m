Return-Path: <linuxppc-dev+bounces-82-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE48A9519AD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2024 13:12:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CdX9LmsM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WkQZm6LzNz2yNc;
	Wed, 14 Aug 2024 21:12:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CdX9LmsM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkQZm1pcyz2xbd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2024 21:12:30 +1000 (AEST)
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-39b3f65b387so27388755ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2024 04:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723633947; x=1724238747; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wF+jCqkozllmCMkDBC4WnutIDupaU5S+6zMucrtIowA=;
        b=CdX9LmsMvwOc3VVtFsxoljmEGTEKo0pXl9fsNif43EiqySADNSP9+jBl9A4f1SLEs+
         BCJngj+YAL8EgEnnBus8hK8S4OtnhTDESr2i7oq4scIFl+jm++0V3spkQW2ilCE5nI6i
         8wo8nZeSlg7MAHIe3Lh18/sCJEluQS11jgie1pklcL/E/B8JlR8cHikYt7gOx5ZwK5Wg
         COLjkZg1bZa1I4Pa0sa0xejYQexJDNoOOkMLPkErRGz3gpN0SN5JQi84IQXzxDp3AcKR
         qlriE+kK/7Vk/eAZAPIxgSFENVapOG3IBrOXUNXmXHCFeLRPTZeTKTFZCbrBJb95nqa2
         1DDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723633947; x=1724238747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wF+jCqkozllmCMkDBC4WnutIDupaU5S+6zMucrtIowA=;
        b=QNMnIg8G8AgohPWUtDmcylSnmRGyXmTD4l5bb38bLwEHcZHGRO+Rk1/1tW5HjmrTVo
         JKfLFvyKOyHoP5Mi9AllVQcXkPhHyC009Nj0AYWyfktadLYxfBufrEHEeJ2COpAXeG/n
         0gAKud0Bnd8wLrdU0ezRi1NVkhaE8oww426fypl2B1MMrapPbo+TpBf8IXP8QFADIXFL
         ufjbJf8I2Jll8fe8olXIq1py9kjaZCtorWG+qdIWzLHFxhjUVbZKmfiFO+bW3qMuH/fE
         uBxRi3XhnqtzaIgT5eZ0soezN7l8/Pg9e7f40AG3+ANywqkDb1XutN9cXEBVIy/mSJb6
         oyZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+uTLOWVrdoOtq+r/3J4U4n+4bezI0WDVEjGWz4xzcwq2RCY7/gRITz48W04XzC82Ow27/xQWOPqujrampiQ7TbTK8IuoobegDROo4Gg==
X-Gm-Message-State: AOJu0Yw2goko1E8EXXsT/YioS9zkUTKyuHHe9CRHZ0uPEGEIDneK8wOE
	TbmeG3p8DgkZgdZe+QdzQoOIDbl9VTgtaq6h855Rkm0LYFKNkvWA9FIELfXpX7sTB0BPQtJYtC0
	Phs7vYId7KWCmbHNQd88+rRea4A8=
X-Google-Smtp-Source: AGHT+IG23mxNg9sYomPIR65C+wkvcVf1Nh6cR3dMcXd5IewSmI8C/wXzw+Jopbl3+u3Bq8STYJPegmialAMApjmL47Q=
X-Received: by 2002:a05:6e02:20cf:b0:39b:3205:6b93 with SMTP id
 e9e14a558f8ab-39d12520b17mr29843795ab.28.1723633947217; Wed, 14 Aug 2024
 04:12:27 -0700 (PDT)
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
 <CAA+D8AMv=tHV3b-Rfo9Pjqs0bX5SVschD=WD06qxjJOk5zQmiQ@mail.gmail.com> <3cdb2041-59d4-4d43-ac4d-39d7f9640cef@linux.intel.com>
In-Reply-To: <3cdb2041-59d4-4d43-ac4d-39d7f9640cef@linux.intel.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 14 Aug 2024 19:12:16 +0800
Message-ID: <CAA+D8APSrH_pum6Cm0YxDzWMs4Roi=h1hkBjPMfXocXt7z4oVA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] ALSA: compress: add Sample Rate Converter codec support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, 
	tiwai@suse.com, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 5:40=E2=80=AFPM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
> > Yes, to go further, I think we can use SND_AUDIOCODEC_PCM, then
> > the SRC type will be dropped.
>
> sounds good.
>
> > But my understanding of the control means the .set_metadata() API, righ=
t?
> > As I said, the output rate, output format, and ratio modifier are appli=
ed to
> > the instances of ASRC,  which is the snd_compr_stream in driver.
> > so only the .set_metadata() API can be used for these purposes.
>
> Humm, this is more controversial.
>
> The term 'metadata' really referred to known information present in
> headers or additional ID3 tags and not in the compressed file itself.
> The .set_metadata was assumed to be called ONCE before decoding.
>
> But here you have a need to update the ratio modifier on a regular basis
> to compensate for the drift. This isn't what this specific callback was
> designed for. We could change and allow this callback to be used
> multiple times, but then this could create problems for existing
> implementations which cannot deal with modified metadata on the fly.

.set_metadata can be called multi times now, no need to change currently.

>
> And then there's the problem of defining a 'key' for the metadata. the
> definition of the key is a u32, so there's plenty of space for different
> implementations, but a collision is possible. We'd need an agreement on
> how to allocate keys to different solutions without changing the header
> file for every implementation.

Can we define a private space for each case?   For example the key larger
than 0x80000000 is private, each driver can define it by themself?

>
> It sounds like we'd need a 'runtime params' callback - unless there's a
> better trick to tie the control and compress layers?
>

