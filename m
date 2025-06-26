Return-Path: <linuxppc-dev+bounces-9801-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 156E6AE9683
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 08:56:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSTwd6wM1z2xRw;
	Thu, 26 Jun 2025 16:55:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::135"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750920945;
	cv=none; b=VHKoTeaSCFwNuY1R3mU6VlAaTvIlRT14Puhpye4TjjOreYRCLCb7Xn1O5rq5KVLQFe04XCHFepK3KDTQCBjn3sxspd7gbRwCw7ucq/alIgkTs4/XbOaWPxHj+q0IbJieZIHaS7pNq4wUeF7lpKekXb1TSD+Go6uESQTNt4orBotPFgcwrxU6ltT0dUyVH3iCjCiB1J23vrq3TRXcQ+G7Zxvq0GD2Q6XbsFdDqlEenYfi7/CN+t/sK8CisLHHsnCRJkSoMv+TOMv0plvdJVI8Pa5A0dvLLFcgpNmyW3lNp+sMOSsldqs5nIuwyANgeMuoCr8DF8/jvVdocHwCxWipfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750920945; c=relaxed/relaxed;
	bh=W19DxCupecPWn8c98PocInKxtCZZgrUgI9zm1Er7U/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H75oIERW033d/5eG6x2UxOPze0VTStXUO7gfvyy5PleaXy1LOBFA0+XjOPKrv5gui7XfD3XBCRxwB/op5YXNuvclL2lVUN19IKQgu1a5vElACjqK/VaXCOXP95TzXaMJn2Osyvf7iwex6Y92mrxEm1hwUDSLggKNRKOjPxSWaEFqytXCoSBNPagm79cYKXsuxQuGo/88728W2fC6HdXpVkAEpIkrM7pBOT+NfaS4ItAhAbKNl6hCu8tNIPUcn4WRvxEBRGW+xADiQ2Z7330D3BNV9AFSu5alfqTfC+gXk9dwMcpNSrA1AEDvw80pQBl54TBBoxenXa9qkY7NYSD03g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WPL8xDKB; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WPL8xDKB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSTwc3Cwtz2xJ1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 16:55:43 +1000 (AEST)
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3da73df6c4eso5571865ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 23:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750920941; x=1751525741; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W19DxCupecPWn8c98PocInKxtCZZgrUgI9zm1Er7U/M=;
        b=WPL8xDKBPKh09YLgoF5Z//VVLST7YkkEO9n2IF2U9PKwc7d9uM/jMrnN/utls1Vt7c
         +pB9DXxriaGleskL1SszLr+7L9DrCr6L1VcDEROoDf2eX5CSzxNg3eeN+rWD8vwsgtjx
         QJMBMqOpXFBci7/cJISu7tVb0BJ73DVSbH4/EnIUvGpPm81LLM2eRCQbDGXCNdYQHGzQ
         sMe7djXMXzbekAPqls6cxQDcZWeBEdYDdpRVmXy7LM2Bm5+eSmTWU70MOOoVUlH74EHK
         305fr/ZVTvWU+h9gbcI4MhIffPlkQqjRuHwheM5EpY4CWjci4m2vIG+qe40ydPLpu8bG
         scSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750920941; x=1751525741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W19DxCupecPWn8c98PocInKxtCZZgrUgI9zm1Er7U/M=;
        b=A5m/7ZRT+UArAwYxBXc7ctersOV5qUAJlj+C389hdpDPlY1O1Hr0iPOH4FbVyTsJjU
         6znz9xhYApx3OIuHgI0ljKbVTOmC1Jdwzy7Vgl3blk3q6rLzdzwYRoMxYbI7t/Cvmx/j
         4aMGphbjCzPqWeAob2TgvSi5txzS02o+HEOGaDhHRx2mBrwQaduCkWpfurAwxkuNDz1k
         i6NM/iZhzTrk4Kz/XjYhzMhnyLD5GaFZiAWoUq4+PYPPS/9TCVklbliE1OryeRlcMz8t
         WjxN6NVZtC3Ywwea9UUL/Wpbjvb3myiebGLHaS+OGo7f2O1/HLPI9iCmOFk69o5pZzXE
         CvJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnjasAmBDww2aeldnODgvn0sON4IvbbUhfsqS1nGJCZHZbQhecqlUyNKUHU+ERGPaBoPfqoMl85CxBiO8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywd2OHgNj7I45PcgnCNqTLYyS/Kf6Rz7DPagzbJWQZ+U3Fjj7QK
	eWktd38rvCzDJLZaHYRqxPu/mzNYA8Mhu+JoMdyajM7OXeZBoC5Oyy1YqOkM92ns1zOsSdLbc87
	vGSJBqpvuss/rA+llP2H6e1Awk0+5uAU=
X-Gm-Gg: ASbGncukTbVU/xkN4SCeiGzwFW1N/FR0+vJbJwOPn15cO5D/fPrtmjOo/GeSlmjShS1
	M2O6hQAPzMockeLiKsf9TcBeVrFTlUoqxwV0l0tZu+TDs24cyCMfIxUrGxJhdlihO8PXDp4xHHM
	m6osM7BYaVkfkJGpianCdgkp6I0SOZI8IdP0BgVaL0B5MEubgbcoko2A==
X-Google-Smtp-Source: AGHT+IHwMBmagiYehfnzdEnifB4yQU/6UnplTUQv1H0lEqwu0zZ7n4O4uKX5Lmcip85xytB376fVrbXKR02UrAEC1i8=
X-Received: by 2002:a05:6e02:1c0d:b0:3dd:d321:79ab with SMTP id
 e9e14a558f8ab-3df3e0bfa41mr37204905ab.18.1750920940715; Wed, 25 Jun 2025
 23:55:40 -0700 (PDT)
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
References: <20250625130648.201331-1-arun@arunraghavan.net> <20250625235757.68058-3-arun@arunraghavan.net>
In-Reply-To: <20250625235757.68058-3-arun@arunraghavan.net>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 26 Jun 2025 14:55:28 +0800
X-Gm-Features: Ac12FXySMQmkpT_YsYbDsQjt-wcOijwcIWgsdYkyL9-_W9kvTa4M5UfaGlI-Ptc
Message-ID: <CAA+D8AN=K_ERUtc+mOW9Lm_B4wZT_qS5xg6RA2fDwrm9MTaCbw@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl_sai: Force a software reset when starting in
 consumer mode
To: Arun Raghavan <arun@arunraghavan.net>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Pieterjan Camerlynck <p.camerlynck@televic.com>, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Arun Raghavan <arun@asymptotic.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jun 26, 2025 at 7:58=E2=80=AFAM Arun Raghavan <arun@arunraghavan.ne=
t> wrote:
>
> From: Arun Raghavan <arun@asymptotic.io>
>
> In a setup with an external clock provider, when running the receiver
> (arecord) and triggering an xrun with xrun_injection, we see a channel
> swap/offset. This happens sometimes when running only the receiver, but
> occurs reliably if a transmitter (aplay) is also concurrently running.
>
> The theory is that SAI seems to lose track of frame sync during the
> trigger stop -> trigger start cycle that occurs during an xrun. Doing
> just a FIFO reset in this case does not suffice, and only a software
> reset seems to get it back on track.
>
> Signed-off-by: Arun Raghavan <arun@asymptotic.io>
> Reported-by: Pieterjan Camerlynck <p.camerlynck@televic.com>
> ---
>
> v2:
> - Address build warning from kernel test robot
>
>  sound/soc/fsl/fsl_sai.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index af1a168d35e3..d158352c7640 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -841,6 +841,18 @@ static int fsl_sai_trigger(struct snd_pcm_substream =
*substream, int cmd,
>         case SNDRV_PCM_TRIGGER_START:
>         case SNDRV_PCM_TRIGGER_RESUME:
>         case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +               /*
> +                * Force a software reset if we are not the clock provide=
r, as we
> +                * might have lost frame sync during xrun recovery.
> +                */
> +               if (sai->is_consumer_mode[tx]) {
> +                       regmap_update_bits(sai->regmap,
> +                                       FSL_SAI_xCSR(tx, ofs), FSL_SAI_CS=
R_SR,
> +                                       FSL_SAI_CSR_SR);
> +                       regmap_update_bits(sai->regmap,
> +                                       FSL_SAI_xCSR(tx, ofs), FSL_SAI_CS=
R_SR,
> +                                       0);
> +               }

Which platform are you using?  and please add chip info in your commit
message.

This change can be moved to fsl_sai_config_disable(). that is:

--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -798,18 +798,16 @@ static void fsl_sai_config_disable(struct
fsl_sai *sai, int dir)
                           FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);

        /*
-        * For sai master mode, after several open/close sai,
+        * For sai master/slave mode, after several open/close sai,
         * there will be no frame clock, and can't recover
         * anymore. Add software reset to fix this issue.
         * This is a hardware bug, and will be fix in the
         * next sai version.
         */
-       if (!sai->is_consumer_mode[tx]) {
-               /* Software Reset */
-               regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs),
FSL_SAI_CSR_SR);
-               /* Clear SR bit to finish the reset */
-               regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), 0);
-       }
+       /* Software Reset */
+       regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), FSL_SAI_CSR_SR);
+       /* Clear SR bit to finish the reset */
+       regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), 0);
 }

Could you please try the above change to also work for your case?

Best regards
Shengjiu Wang

>                 regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
>                                    FSL_SAI_CSR_FRDE, FSL_SAI_CSR_FRDE);
>
> --
> 2.49.0
>

