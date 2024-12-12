Return-Path: <linuxppc-dev+bounces-4023-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C349EDD54
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 03:07:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7wpL6y2rz30TG;
	Thu, 12 Dec 2024 13:07:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::132"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733969242;
	cv=none; b=bBSXGLeRZq5I+oByUZcbTeUjXyQDd8OLt8zYZDIBs6vGelnXMfBW64n5zHykRUIBxXAza6hD3d9RkVil8yErqyDZdtE3ikWwmWfuS4rClJV2r/oor0vJLtvn+Ys+bnMbNygaM2eiaUUZIWh95VaUD28tuwFdhZo5wDjVi0WlLI/8EoR92TgtwV8AS/FEjwxehWOTrIwRNlmJ87IKrSdAg+VWzs8AGaKrTx+4jwyUeKjCZG6i7ojQxOJxxWrd1aLg8S3iWXMrA0Dor1R9b9m3Rm0bS/QEIHRBvEm5RARK+gBTBQmeugG7uDSaZmXou+YUwVeAkQOVbZzXdfP1p8fcfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733969242; c=relaxed/relaxed;
	bh=zsEQWcKkwE2tUR4EtqQ/7dt4QrY1pJqjE2F4WHaD4wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IhAKBnX24X4qrZbBc5kss+ncUzOrDjKnFi2pGW4hyBQh3sSv36MOOo1ggCbncDk2xEgHz32+iRtELY1EHyvZDXwZ+k6DnVQ2BNyd3rX4jCTutdKIIR9a+aHY+JVlEpQmf5BF5iXnxCjuXgG7+kgSK01NWYSo9ivN2gD5QKN5b3whLlC3wnH/C2mfkmFhazZrvMv7dxBJX9StNUnY9kLu3mUqm6UlKI3QJMlOvN9M9bc+JYSFc19+VF2xFxAwyP/k/XfE3AV/OEYIwSr/J4tZKf8QQhEp0hUYXH24P/D9dLXz2UjjEZ32o9TXDnH62HMQNPH6YNu2Qv3dd5qCPjT6sg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JRHdm3Gn; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JRHdm3Gn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7wpK3tz2z30T2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 13:07:21 +1100 (AEDT)
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3a7dd54af4bso568325ab.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 18:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733969237; x=1734574037; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsEQWcKkwE2tUR4EtqQ/7dt4QrY1pJqjE2F4WHaD4wk=;
        b=JRHdm3GnyKe3L2ekkv4oZQiD6mmBT5Asrc8TBpYy760bDMn73zg0+KSmxvdqtFNAdr
         cs1Ob8oyVNxIuKQ1QlK+VcUJIgcMx6xMpWDrienY1eUuef4vnuvg7fuT+uytocnvjHSv
         ntT5t/y5Tt4nQEWFHGgZ80K9DUNVHhLDq02EjKOqFekbHfSYfDd186fpTmINN1WSRUND
         ChXuUFBFlcWCeMnmnIzLL90eVpXgPRU8scWOZIl4rLqS9ghvyT7dOMpl+MazAGZKZwZ4
         aPFPRTIZOITZPL15hAcDyGQndOuqEqdgPrZ8Gfdg8pZnsSGzblo4H1xp2IazgL/xNVuC
         orOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733969237; x=1734574037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zsEQWcKkwE2tUR4EtqQ/7dt4QrY1pJqjE2F4WHaD4wk=;
        b=arynG6pGFNUHuZFQtt1W3IZ3fhzHOazar5tRasWFpLIVlZewdA3mCA4ghD2vCg8dyq
         WnhD12dCmz5/Dx/Vsaw0Zvj1rcodFKC74pM24NbUthmr7vzl7Gsxw3ScFx5TXM5dHoWb
         PynP2jWmYcSCLL1mIfBwfgPHOVFPvTq/PHfxiFeSVcQo4jrfcy9Q2EqElAXIsT+CzxJE
         1Gt81dnWZxO2XazioSInLVoiJBFpzR8teDpeirgNVHqWTeoDsx3hZJbX4Y8gql4dWRjT
         bhHq8803EclN20ODnUQ3co7BRiLgeCDUaSGbU8owyCwTr4iEWuCWFKf+P5fjCyNpflT7
         TH9A==
X-Forwarded-Encrypted: i=1; AJvYcCVnB8gRdRHBtS+4t6dmjmDhjItbn6fNo3FAaKxw7nFCFlGS5fVeGk2mS5Iz8+kt1c2b5qrxDWGmdXSvqfI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwNf8vkJpgQDcwKPF12H7rHS/PC5WmPkCEnsIbTLRfmRI1ue+T1
	lzyGGBfq1+ibLDPjDHTXHnnHDIKdsep17Ak+qRGR8ZG00YiP4bwVnhWqM4+XZFRFrRQxGC28LSz
	PTLZzvSXWM2UuTxzuboiuSdF3c78=
X-Gm-Gg: ASbGncsEXOhutiwFjWM1PQEEvXbh2ioyUxpAnbau/4bKm7AZT2uIlBZhkTU6z+2ZwKQ
	d9G4S+igfmBy0tLFcSYbgamEOVsc19XhzT8cbsg==
X-Google-Smtp-Source: AGHT+IFgbF3rpxFbC9uUWYHJ8NsiDEgvcpbD8m2ahheY6thhWrFNrML3gGOs0Uohbe0DWv40CeetB1K5Pc+PD5GSQGg=
X-Received: by 2002:a05:6e02:1b05:b0:3a7:fe47:6228 with SMTP id
 e9e14a558f8ab-3ac483ff34emr18454135ab.6.1733969237518; Wed, 11 Dec 2024
 18:07:17 -0800 (PST)
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
References: <20241211030849.1834450-1-shengjiu.wang@nxp.com>
 <20241211030849.1834450-5-shengjiu.wang@nxp.com> <dc52c945-b292-4cd8-97ae-369a45f5a4ad@sirena.org.uk>
In-Reply-To: <dc52c945-b292-4cd8-97ae-369a45f5a4ad@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 12 Dec 2024 10:07:04 +0800
Message-ID: <CAA+D8ANG6enRKp7msjBs3Hxn8QozjT2tEvAmHDZjO7xtQYB4Jw@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] ASoC: fsl_asrc_m2m: Add memory to memory function
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, 
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Dec 11, 2024 at 11:28=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Wed, Dec 11, 2024 at 11:08:47AM +0800, Shengjiu Wang wrote:
> > Implement the ASRC memory to memory function using
> > the compress framework, user can use this function with
> > compress ioctl interface.
> >
> > This feature can be shared by ASRC and EASRC drivers
>
> This breaks an imx_v6_v7_defconfig build:
>
> arm-linux-gnueabihf-ld: sound/soc/fsl/fsl_asrc_m2m.o: in function `fsl_as=
rc_m2m_
> init':
> fsl_asrc_m2m.c:(.text+0x7ac): undefined reference to `snd_compress_new'
>
> Looks like we're missing some select statements.

Thanks for noticing this issue.
Sorry about that, I will fix it.

Best regards
Shengjiu Wang

