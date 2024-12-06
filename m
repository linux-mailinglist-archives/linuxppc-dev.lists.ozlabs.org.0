Return-Path: <linuxppc-dev+bounces-3839-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 325A79E642E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2024 03:31:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y4FdC6yG6z2yL0;
	Fri,  6 Dec 2024 13:31:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::d33"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733452303;
	cv=none; b=EPwXT1SzeWCPqJZANpn1TNW56DENBarBGg5aa7DytOIeNpxdU3z4cxXznp8BqHcuitysNGTdNbYV3Gt/QK2TFAIh6dynRxQ3uONPeW1PTxB4KvZ6Txla2WeNyB+jKPuqFHnnTMYpqBqK0BsilYyTlw+f1nLpCoMrAwvY4JRpNVpTgLy3BRdRpv2W0UAmDYN3EZsZX7t9tBzSFEaDJ03hPb5I4mf0mgFGI2WSUhi229Ph1v6lLYP6wkoUFnPoEesJj8muQNg6tsuzcc/0bZTfc2Dg/LQQPur0yckraZLV0e8E2DTe5f6OB3u3d/z7IQfShoh19eaHdqGFIiHjiTMS1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733452303; c=relaxed/relaxed;
	bh=5G5neezgsTGxLzETVl0pMokr7OCbZY4F/agzhpz39dI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XHRtw6MrRADL0VU/DAN/wI3kyp3bodPojGgf4rkAbhblkAtwJ67IRl2eJfW7/JJwAk4MOUarKzkvN/EUn2S8H2xwKc+mw5mz+ehcflymV3ZrR5WbSjmtOuKxqiBOQWudQE5kmbb686vAGdGUyhKNI/dnX1cPPxi+v/1BMQZZUPInL7YfUM2MngMtMz6ma5d4XfhyFUc+q+mn+OwHCv3RbqZ+aKhkHM4tBWF3qDaeAId+PP1B18sShI0zL42KBq+OBpWQxEm1SaEyPFV8Ox1Nosw2lcDRdvFHiNo6H2gd+Jp5smIgobKG0Q42TvrNswSItaAvhhVHvpnG1zyzsYV71A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S/fhDoaF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S/fhDoaF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y4FdB1fHHz2y8n
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2024 13:31:40 +1100 (AEDT)
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-84183532291so108226539f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Dec 2024 18:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733452296; x=1734057096; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5G5neezgsTGxLzETVl0pMokr7OCbZY4F/agzhpz39dI=;
        b=S/fhDoaFod9LoBdtUQ82eiFplkvSG/9DJxEw06dNntrXfxvQ2VhvjhBFRahU9gT/yB
         crieB2bSdQoAi1JJ/AKmDmWDfpV8ajU9NrfrRaYYWzqUVf4nveV6n2qLrVp2hyNklA4H
         XDBATGoWd6ZMQeFjRNoq18kvmPxOiK5THBqVwlyObQNHAWOl+rmFAd8iBmyrwJwtMVvl
         ovguC8P1SjVNeRPzyGwUgwaxbg5oQSAFX/GCbA+rvm9jkFG+2OEuHBLPgOQmg59FW5sg
         cVPJqNfSx8O2wlHBadM1s+9sB5UW5vHkRZXrDlgf54DljXMahjepgbcQtyS2qauW12qG
         C5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733452296; x=1734057096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5G5neezgsTGxLzETVl0pMokr7OCbZY4F/agzhpz39dI=;
        b=gyvoejwm7K10HJd7ksvemZ/d5puXajujHLzc2iToWNOpqYVCu6EHkcxKTwqU52hquO
         ZCJgkVpUFqQByZIbdkbcbMg/FbayFGVxeDKxc+ZZUW8KbKGy4p1KJaMCZb2SOVEYTx82
         lZCJ13b0Xw3nz2Q/mpMXBXwnAauZxy4YgWMLXXBuBDVK9GlcRKluWiAJUDzxSTFYSiGe
         pWTx7l97r5AopdIhZXQFO4vqGjITcJgX7oYhoT0WUBFDTM9kW8oJn2PEKWdfcs6kIonO
         XeaFAQnNN1pvgeTOw4EjVlN8Pag280G9QD1nyVpJLFgufjDrYbJH7XTUc5ljy13QctpJ
         IqIw==
X-Forwarded-Encrypted: i=1; AJvYcCUlaqVvz7coRZKNTjsUj2AWliQRk/fY4SEqbFeVT4O54Ri9azOM7eITW63WIWeLqrQ0sWI88wmJlk7OrGE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywp58xOQYz0nBTMhAEiuCR4Slm9pv6HgTsJ2c4TZApaz4lzJ/3+
	dByCxoUefFqH+uOnoBYN6+MxszZpMTLvnT/AFPlehTgwbK/wgAFFJWYIte1YSa94NbPFkAis2Ej
	GfQ40a+m5arbyKOoY0yHKo2VUC0I=
X-Gm-Gg: ASbGncs2fVeSSJgvQuONjvhgyRqimBAGB1yWqturM36CyDXl62fFVZPLkZR+zs6xeks
	P68sL7RpTiGaZZ0hMuOH4xsqMjBSNxR4=
X-Google-Smtp-Source: AGHT+IHBwODJh3fSmtZCBLrwIs+Ngf+HZUOxxOtohdvIuiHQgJWd2OceEpnS1WS3tUvHKi17wjDrahJ2yPiH9dCDQ1w=
X-Received: by 2002:a05:6602:6d01:b0:837:7f69:eac2 with SMTP id
 ca18e2360f4ac-8447e1dac49mr181291239f.1.1733452296087; Thu, 05 Dec 2024
 18:31:36 -0800 (PST)
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
References: <20241126115440.3929061-1-chancel.liu@nxp.com>
In-Reply-To: <20241126115440.3929061-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 6 Dec 2024 10:31:24 +0800
Message-ID: <CAA+D8APMm4K7m-aa1XbGJuv9pfP1fXz+QoohuSieT9Zo4-BJtA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add function to constrain rates
To: Chancel Liu <chancel.liu@nxp.com>
Cc: Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com, 
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Nov 26, 2024 at 7:55=E2=80=AFPM Chancel Liu <chancel.liu@nxp.com> w=
rote:
>
> Platforms like i.MX93/91 only have one audio PLL. Some sample rates are
> not supported. If the PLL source is used for 8kHz series rates, then
> 11kHz series rates can't be supported. Add common function to constrain
> rates according to different clock sources.
>
> In ASoC drivers switch to this new function.

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
>
> Chancel Liu (4):
>   ASoC: fsl_utils: Add function to constrain rates
>   ASoC: fsl_micfil: Switch to common sample rate constraint function
>   ASoC: fsl_xcvr: Add sample rate constraint
>   ASoC: fsl_sai: Add sample rate constraint
>
>  sound/soc/fsl/fsl_micfil.c | 33 ++++++++++++++--------------
>  sound/soc/fsl/fsl_sai.c    |  7 +++++-
>  sound/soc/fsl/fsl_sai.h    |  3 +++
>  sound/soc/fsl/fsl_utils.c  | 45 ++++++++++++++++++++++++++++++++++++++
>  sound/soc/fsl/fsl_utils.h  |  5 +++++
>  sound/soc/fsl/fsl_xcvr.c   | 20 +++++++++++++++--
>  6 files changed, 93 insertions(+), 20 deletions(-)
>
> --
> 2.46.2
>

