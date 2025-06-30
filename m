Return-Path: <linuxppc-dev+bounces-9868-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF99AED3E0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 07:35:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bVvxb4Nc2z2ydj;
	Mon, 30 Jun 2025 15:34:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::12b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751261699;
	cv=none; b=BO/wZTcNA4o876KT3JHn8Y/DC2pLO7XQmeVG+ImWsPCD5k7Yf+HBAukxUyfxhgbEk0sgMojQHK/wiIJIhch538Z8GgG7zX7s2OX7bME8QFQtm9SLEkp8A5O4C38ERt505awvQ0MK9W+YuyR1kY2Q8iZbUP6ib49j80iEHVo6HqVdpdSjaQw93IkkwN+AISTOL6edW0D4xc0IsAJ2r7U7BSFE4kxlvBbwn+gjaOVqjtm7K5tIwERD+vENlEfujGRcV+TZ8H/zYW4SVOFVS2+H+GB/rOTiL6UsdVH0wBgmPJfzv+chNd2AT1I0R7ieTF/DH5DOl2lmoLF+9htgWfSFNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751261699; c=relaxed/relaxed;
	bh=mGWiywgRxXZ4TpCKa9WNBlA/Whc9Wp3uQ8q4wg+3L+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VxdZ8Nzg74wbKDXTrytLTmV9eiChQj5c2evQhEsZ4khlwcZL0/KuaEA25xBadUOexFEWfXaGWryqwa2oC0uLNLKmao9iSuDDEdv3WDXHmcxoZi5N7kq/3g/cdU7rf4X1EGkhTTWVMrgp6uwDWmHmg0iRp5LqvwB9r8Dpkr7JQugBDZ0//V9nGwD/UexGia3XKosvYV5YCRohcG+LQhiq3RMK9aJlwGaL0ZiOizDW8HxhKPRunMOLwr5pE8C+uDhMHF7W/OjJ/Hn4LI0upXSUXEJuc84Mf8uonTojtaETmqVmDX1IHJXN2isik8iLaZDgwInodTFE5GrIUK0vBNbYtQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UzRG1m+Z; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UzRG1m+Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bVvxY6hSmz2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 15:34:56 +1000 (AEST)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3de2b02c69eso9580825ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Jun 2025 22:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751261693; x=1751866493; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGWiywgRxXZ4TpCKa9WNBlA/Whc9Wp3uQ8q4wg+3L+M=;
        b=UzRG1m+Z7S5+oAqcaaNM/PBazzXd9ZbB+Rp2Uv/Xd6UChmDWJJBmzPIb1Xa++rf/4C
         mdPJLWaq5RctdO6WUCyu80iphtc58xiWNc1JPU6fI0L0wO83tbVLzUjuCLaEIffYjSkJ
         kR4HGIjkjz2tpEtCmHoe0vlohA8XIZHUn2EqCBhykzhEBlmKRirfb8rEoGdOfLCe0HWJ
         eL12xNtPYWy+iHRWVYEXGxm6zLoUmbvm8R/Xrn0X5WVrUjeAme2ntKT74oSjIvV7aHMp
         BWwVi7UsW8bhQ4qqYTuPP/EN7cNrb+v1LhS2DzjHA95lpFoD3HazrcOYdybjQrEU+zxF
         jTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751261693; x=1751866493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mGWiywgRxXZ4TpCKa9WNBlA/Whc9Wp3uQ8q4wg+3L+M=;
        b=aXX/KG1d8K+8hgvp40sbEHjNiQoZMUEdOgOCrF1w32Rs5t3HGE8guixN9Az2sW3Jcf
         Zbpw9T1CdGyCukcSA0JT5ZvC0IOG94bcfYeZOCGZjETb91x/cANNiriebkqooB345pEU
         Ig/F4xMnMmz+X4PzJToTQrPYopY+IPuW5T1vr5BHqViB2TgirWsQxmoVT1RHsNPDrWxU
         eUBk5QfHCU67rsKXIY5tIoDCLaov1LrfWqC9UJMuNRhiEDmFIj/fHYwOFjIvdGkRwmhJ
         8P7s8x+MHkGKZa1jiIb0K8OHlDjdyHOPPbDiMb7beM35lRWen94Fu4fzaJftwhMH62A5
         o87Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0twYypT6kiTwMHXScxRDU7AnOmsYlcK7J72ZiwV2VGHMjiQ7/MZYYoQZzcOLXm2WrcPFJs1BUaJcKEso=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywy0Sw4IZfjm2As9LB2zs8fh5Tevnb+jjaPapIXI03sW8UIwnxn
	temO+qs+oQZCMbGDQ7mXx2QD6CyEzbueafiCfhA4SJDsYEyOhkb6hDWEAdd+MfNP4CZUPKX9nhQ
	c7pxwGp2Gi+lpbIhQEQGP10mNyUjD9cw=
X-Gm-Gg: ASbGncsLZhzmmf0fRfdo/63ZYC1/kg7YCpVXS1Dq1PXX3382nc/jXdv2f0Q9tcnLTOT
	ObAuGMAfLSQSbqMWk0d1OGklYanF5Vf4raLYXR88jU4tTtp4FP0eknGoDtSkuXyIqRrhtldQJeT
	KZwiS6VEOt4wdvSy3/2RcIuqvUmfvapL9cfLHTNfEeZYY=
X-Google-Smtp-Source: AGHT+IGJf8zxb+wvtJ9W2Up4OO/G3M37ER/D2K1w3AMwNSKqh2NBW2TNl09JoLmmOhY3hctTOb+G9b9HY1YmMW6aBSg=
X-Received: by 2002:a05:6e02:5e09:b0:3df:52fc:42ea with SMTP id
 e9e14a558f8ab-3df52fc43ebmr64519965ab.13.1751261693432; Sun, 29 Jun 2025
 22:34:53 -0700 (PDT)
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
References: <20250626130858.163825-1-arun@arunraghavan.net>
In-Reply-To: <20250626130858.163825-1-arun@arunraghavan.net>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 30 Jun 2025 13:34:35 +0800
X-Gm-Features: Ac12FXyRcEw2c8QCNueRD8i-vzu3N_uIrpDLEDkz208eeIELpAidj2GdbDKk77M
Message-ID: <CAA+D8ANDnPaadSwgvxGuKE1w=pwh+fRgG2J-_NQDDN82wx7K9Q@mail.gmail.com>
Subject: Re: [PATCH v4] ASoC: fsl_sai: Force a software reset when starting in
 consumer mode
To: Arun Raghavan <arun@arunraghavan.net>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Pieterjan Camerlynck <p.camerlynck@televic.com>, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Arun Raghavan <arun@asymptotic.io>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jun 26, 2025 at 9:09=E2=80=AFPM Arun Raghavan <arun@arunraghavan.ne=
t> wrote:
>
> From: Arun Raghavan <arun@asymptotic.io>
>
> On an imx8mm platform with an external clock provider, when running the
> receiver (arecord) and triggering an xrun with xrun_injection, we see a
> channel swap/offset. This happens sometimes when running only the
> receiver, but occurs reliably if a transmitter (aplay) is also
> concurrently running.
>
> It seems that the SAI loses track of frame sync during the trigger stop
> -> trigger start cycle that occurs during an xrun. Doing just a FIFO
> reset in this case does not suffice, and only a software reset seems to
> get it back on track.
>
> This looks like the same h/w bug that is already handled for the
> producer case, so we now do the reset unconditionally on config disable.
>
> Signed-off-by: Arun Raghavan <arun@asymptotic.io>
> Reported-by: Pieterjan Camerlynck <p.camerlynck@televic.com>
> Fixes: 3e3f8bd56955 ("ASoC: fsl_sai: fix no frame clk in master mode")
> Cc: stable@vger.kernel.org

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>
> v4
> - Add Fixes and cc stable
>
> v3
> - Incorporate feedback from Shengjiu Wang to consolidate with the
>   existing handling of this issue in producer mode
>
> v2 (no longer relevant)
> - Address build warning from kernel test robot
>
>  sound/soc/fsl/fsl_sai.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index af1a168d35e3..50af6b725670 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -803,13 +803,15 @@ static void fsl_sai_config_disable(struct fsl_sai *=
sai, int dir)
>          * anymore. Add software reset to fix this issue.
>          * This is a hardware bug, and will be fix in the
>          * next sai version.
> +        *
> +        * In consumer mode, this can happen even after a
> +        * single open/close, especially if both tx and rx
> +        * are running concurrently.
>          */
> -       if (!sai->is_consumer_mode[tx]) {
> -               /* Software Reset */
> -               regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), FSL_SAI_=
CSR_SR);
> -               /* Clear SR bit to finish the reset */
> -               regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), 0);
> -       }
> +       /* Software Reset */
> +       regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), FSL_SAI_CSR_SR);
> +       /* Clear SR bit to finish the reset */
> +       regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), 0);
>  }
>
>  static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
> --
> 2.49.0
>

