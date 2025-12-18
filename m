Return-Path: <linuxppc-dev+bounces-14857-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DA9CCA8C9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Dec 2025 07:56:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dX1g06yGFz2xrM;
	Thu, 18 Dec 2025 17:56:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766041004;
	cv=none; b=E8VwF76BCHh0VFudKcAiDBY5CuoWL/j+WvFDdnclreeVBchhKs7El3+tyVHzw0UBdbFtenl0nz6RFXV/caDCHCAOYjEPJSBpffCMA8AG24e4DHhh0UH9ZDsMj6Pt7zbvdYcRmV6y/Ipm8lpmEtfWBiQdhlv5ULGuD5WDPSZb9dNMV1TuhGFfTPyaxn5pt4EnC4l6CqeiLajVMaOF4S4yKs7vYY55HEJjOuquf81tgEhTi20XxDOe+S/DSchIfKkcjIj88UlOSla6MSGFNTOxWff5h1gZdAI+wlxDvhKSKD1VyVvCLrmrVocsP4hQNu6mUs4/K3YzaIro2J+pLhX91Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766041004; c=relaxed/relaxed;
	bh=QrVE2KcGXBi0Atmn8mFR85kpZV1jO4gtfgfLILXctrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ahhfpuivF9K4cka268prWgvXN3RIaqbjzzw3dobXYHI12G4341uZQVpFghuudZgzfzqanMWYAUrECs0Px259aOchdD3SqBWP1NLyqQ3BTLsnXvY50hXj2EcZgQkBlCFDQrh5tCpyq4TuNXquIkaQXIfpOHTwbKYJqDenHxa0peQWrdne+YbF1w/N/qQAIBCtTaZrtH4ASbJkgFtG586R8xyVr3QODPCE7U84RJn9+EFrvouIs6fQ3Mhb4hdDnrzAwhrQ7cRKSWKv0Exvr+KXO0bw1AzLiNl/FjEOBBPVzlwoc45qdcK3a/n21qH8IRDR63Hx718Sa3Ooqo9B5YSaeA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kKSkKFha; dkim-atps=neutral; spf=pass (client-ip=209.85.218.50; helo=mail-ej1-f50.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kKSkKFha;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.50; helo=mail-ej1-f50.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dX1fz23WNz2xS7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Dec 2025 17:56:42 +1100 (AEDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b735e278fa1so51824466b.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 22:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766040939; x=1766645739; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrVE2KcGXBi0Atmn8mFR85kpZV1jO4gtfgfLILXctrE=;
        b=kKSkKFhahPVPGZuZsZrTtzuLpUXkrh4/cxzlmzu6wL5EIVatSKGCFxSJe2fGYogQWt
         VqdtCJGSoKe2c2L3HpLDEHJNcs1xsY5fdnr4fK765/nq+abigJD2t1axliohsk5+qafX
         jKvzOpeI6R3EKJYS3kr1GRLVxT3jh9vSf+Htmykfe62eSP4L8h3kzO/Q1ZZxQHCuc+1u
         ubL/Oi6dokiPOz6rI4wiRpNTxxLNfYOgluCjHngi+WpEF6wzg/2zAY97SXYayjbKQGlC
         sMsLbh/8TzViOrhn9Nv9vvWxvedIagWW3eeNbFYMO95tt2g5XC7ihKv0wGQ9A/T0u+9O
         XNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766040939; x=1766645739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QrVE2KcGXBi0Atmn8mFR85kpZV1jO4gtfgfLILXctrE=;
        b=JhiwNjSi63qviIZ3cinQw314IBsnAZjVoCWAlKYSp179p1NGnt9r6W0MF6KUGrESb9
         FOwLSwsIzl835rCq8trOc1kvN+0wFfjRxD0M6o7u2cjVSa630WC8dMoNwAOvacdQAkty
         Uyo60pIa2eE9j7jn1366J5sNbBndizmNs76CYca+NaauQB5+rdM1h03RH2l5zcYsSahZ
         hNIc4imtEA/3kUk3Es+Q4Xp4N/xSJdwu6k8dK39bc5d67a+NCJz4+Tbth6+mw5vA96os
         hdBqJrEP2rOl97PJ3Q/B4hZBFUPGd32Qk7SEC/AZU8zUh+/KcwGDIYTGtyCOWdWkLlIG
         RrSA==
X-Forwarded-Encrypted: i=1; AJvYcCWdIm8bFdMfeVTJM4qrta+ntCiZRwfE4iPc4v/B2UAzl/Xm55lLhl6iYSnoGpxuf/iRjR+eX8+MpgQdM6c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwMx30wci9xnr5i97rlGCIC65z9a0JY195tbls434nqj8XB862v
	x3IyhC6Yx58WIMrCNpBW+MrXkWjyWAMI0pYj7JoiVPbTytibt8c0WZS2xYngWd1r9YMnrH5tfT+
	EXdOTAv2t4AHJ1Q4oAZ5//HV5nUBrHws=
X-Gm-Gg: AY/fxX6kE5vqw5IZKZyiPSMIOKgBv/TDI1mLnB+SACbPQfud/jqWbVztE1apBMYNmkX
	lsVz06nwBB+4HcCu3ykkh9dMj6xrxlDQo14tIspV5SMMuCJN1m/qyqt87doFkLDsfnpaKj1slWc
	b3Pdu0ZweD7C3qggERRkKCLXAvHm9gNW1hNxit5FPATEq7PWH8758zNtcyDYlloqr/kdlnoCzKA
	Hq3ChvS/pj1lqp/+Fi3fgmK/alqs/0fl0uwc5lCQDnJy+2UmdPgIghRfGohu7fAauCDq9o=
X-Google-Smtp-Source: AGHT+IFVtv3SN7EhG9yj2zoF3CpDy9wfUrXmSKZEO64lRC9GjDK1c1PjO8dPKUA6ldDWoTTkudxxn5ZUjz9/pHO0ALM=
X-Received: by 2002:a17:907:7fa2:b0:b72:a899:169f with SMTP id
 a640c23a62f3a-b7d235c8368mr2164552066b.4.1766040938417; Wed, 17 Dec 2025
 22:55:38 -0800 (PST)
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
Precedence: list
MIME-Version: 1.0
References: <20251216084931.553328-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20251216084931.553328-1-alexander.stein@ew.tq-group.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 18 Dec 2025 14:55:20 +0800
X-Gm-Features: AQt7F2qzuMCgg_s91NKhEOxMP9BqcCaEF3579ygcC2BtXPNDjH8HY_EZGntRn4Q
Message-ID: <CAA+D8AMd-4qwYEBQ-JC1D88MRCj9ogeVspN+w-87P8-MWP4FmA@mail.gmail.com>
Subject: Re: [PATCH 1/1] ASoC: fsl_xcvr: provide regmap names
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Dec 16, 2025 at 4:50=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> This driver uses multiple regmaps, which will causes name conflicts
> in debugfs like:
>   debugfs: '30cc0000.xcvr' already exists in 'regmap'
> Fix this by adding a name for the non-core regmap configurations.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/fsl_xcvr.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
> index 06434b2c9a0fb..a268fb81a2f86 100644
> --- a/sound/soc/fsl/fsl_xcvr.c
> +++ b/sound/soc/fsl/fsl_xcvr.c
> @@ -1323,6 +1323,7 @@ static const struct reg_default fsl_xcvr_phy_reg_de=
faults[] =3D {
>  };
>
>  static const struct regmap_config fsl_xcvr_regmap_phy_cfg =3D {
> +       .name =3D "phy",
>         .reg_bits =3D 8,
>         .reg_stride =3D 4,
>         .val_bits =3D 32,
> @@ -1335,6 +1336,7 @@ static const struct regmap_config fsl_xcvr_regmap_p=
hy_cfg =3D {
>  };
>
>  static const struct regmap_config fsl_xcvr_regmap_pllv0_cfg =3D {
> +       .name =3D "pllv0",
>         .reg_bits =3D 8,
>         .reg_stride =3D 4,
>         .val_bits =3D 32,
> @@ -1345,6 +1347,7 @@ static const struct regmap_config fsl_xcvr_regmap_p=
llv0_cfg =3D {
>  };
>
>  static const struct regmap_config fsl_xcvr_regmap_pllv1_cfg =3D {
> +       .name =3D "pllv1",
>         .reg_bits =3D 8,
>         .reg_stride =3D 4,
>         .val_bits =3D 32,
> --
> 2.43.0
>

