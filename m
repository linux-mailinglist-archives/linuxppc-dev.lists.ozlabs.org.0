Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 283A1881B75
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 04:27:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OP0Uf632;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0W9L6knmz3f0P
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 14:27:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OP0Uf632;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0W8b4MXnz3cWB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 14:26:37 +1100 (AEDT)
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-366a4bcb2a8so2535925ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Mar 2024 20:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710991595; x=1711596395; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0MuB5ySDlf80mKLJwWBjBqQwGvGCqX7FdKX4jErWIQ=;
        b=OP0Uf632j2zxYmje1f5YlXkXZ7shQ60FygI9NTRnjjNK8PBBgFL+PKQrFTrcrTdp/2
         mJMaXUtlQLIIp6z4cqlCOVe/jHO3KBnSeKeKbsBZJL7M4s1MM5kufc+jgUBKHjwfLcIJ
         7rJp3h6e2NXElqBU427JvjuUjRSSTavkC5vK2MPFajQFKw19ktnX+kMJ+AfgVBi7r8UJ
         FfuKeQ8hozxFTXKO+HIXxJEjbuseV/ksFFoP+KDCvr0RsbCRLtV6LSdQPK+0K5ua2B95
         vHcE/17UyDJP7tFdGKtQT0WZ+sKiXhXGW+/YUFA9KCgvuEkhhAHbw4PYdm6Ev0XQ9kLO
         AnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710991595; x=1711596395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0MuB5ySDlf80mKLJwWBjBqQwGvGCqX7FdKX4jErWIQ=;
        b=NYcXZpvEdySO9qL1gwvZWKgY0QYNes/VHof2E1a12kZLO/xf5N+w7/SK1uBXS+gnb7
         +VeVpgW74fjJKLutA6Cg602ippn2si0Oh9e7sz8kND9Vm4G10Byar6rqQipyRAxSy3PO
         A+kqUUu9IcCfvg/OlxZZ6i2j4YHaI79wgekvQqYMS52smuReNqBRqZK5VQ+kh7s1t0Mn
         oUwiHaGZ+rhkRewW1GvCqIXpidpCqkwRP+0MvugUyKWV1iDuX+9a1crykYQIotn9mGK9
         EaaL+rSwUCg43EECjgOJwx4MdYv098J1UtZ0/GFViyeEs8KMZH5eHTt3OnS4h60KluKy
         PmPw==
X-Forwarded-Encrypted: i=1; AJvYcCXbN2bYVH27qbR76nwP7qqjBbW2rKZzmrUcmpkD+6TuGyLpI9FLKLh98WFducEDfZSf89JBENHjQXOPfVVhJs1kFWWI99/guovS2wUpQg==
X-Gm-Message-State: AOJu0YzIZkOuZzADL2fMDoqJAR4TbzEisHmK6PDh3HYZo0kkWPwLiJQT
	OpSUhEblSZk8X1/VuoscRg+fWpWHa/z3VwVfoLUV2p1EjS+2XjceuaKVjCLj3NJv4i1G+gTSl1V
	3u1RWt8J3FO8ysOR2wcwg3Hz7NV4=
X-Google-Smtp-Source: AGHT+IFc9RGbcaS9BK4282AsGdS9WHC1k3cMjtHAAfPxbdpowTsLcJUO6T6GCfuC6nwd3Y1eBaJZ6K2ufci7CeLK2Bg=
X-Received: by 2002:a92:d812:0:b0:366:43bd:f0f5 with SMTP id
 y18-20020a92d812000000b0036643bdf0f5mr4561373ilm.17.1710991594728; Wed, 20
 Mar 2024 20:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240311111349.723256-1-chancel.liu@nxp.com>
In-Reply-To: <20240311111349.723256-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 21 Mar 2024 11:26:23 +0800
Message-ID: <CAA+D8ANGAw3MVPiR7oXY0-FDxvGfs3KDQ5CqxhLQa3Oaxd5jwg@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] ASoC: fsl: Support register and unregister rpmsg
 sound card through remoteproc
To: Chancel Liu <chancel.liu@nxp.com>
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
Cc: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de, tiwai@suse.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org, perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 11, 2024 at 7:14=E2=80=AFPM Chancel Liu <chancel.liu@nxp.com> w=
rote:
>
>         echo /lib/firmware/fw.elf > /sys/class/remoteproc/remoteproc0/fir=
mware
> (A)     echo start > /sys/class/remoteproc/remoteproc0/state
> (B)     echo stop > /sys/class/remoteproc/remoteproc0/state
>
> The rpmsg sound card is registered in (A) and unregistered in (B).
> After "start", imx-audio-rpmsg registers devices for ASoC platform driver
> and machine driver. Then sound card is registered. After "stop",
> imx-audio-rpmsg unregisters devices for ASoC platform driver and machine
> driver. Then sound card is unregistered.

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang

>
> changes in v2
> - Fix build errors reported by kernel test robot
>
> changes in v3
> - Add a new patch for fsl_rpmsg to register CPU DAI with rpmsg channel
>   name
> - Update imx-rpmsg.c to get DT node of ASoC CPU DAI device with rpmsg
>   channel name instead of using undocumented bindings
>
> Chancel Liu (5):
>   ASoC: fsl: imx-pcm-rpmsg: Register component with rpmsg channel name
>   ASoC: fsl: imx-audio-rpmsg: Register device with rpmsg channel name
>   ASoC: fsl: Let imx-audio-rpmsg register platform device for card
>   ASoC: fsl: fsl_rpmsg: Register CPU DAI with name of rpmsg channel
>   ASoC: fsl: imx-rpmsg: Update to correct DT node
>
>  sound/soc/fsl/fsl_rpmsg.c       | 43 ++++++++++++++++++++-------------
>  sound/soc/fsl/imx-audio-rpmsg.c | 21 +++++++++++++---
>  sound/soc/fsl/imx-pcm-rpmsg.c   | 11 ++++++---
>  sound/soc/fsl/imx-rpmsg.c       | 28 ++++++++++++++-------
>  4 files changed, 71 insertions(+), 32 deletions(-)
>
> --
> 2.43.0
>
