Return-Path: <linuxppc-dev+bounces-13306-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0F2C0BD5D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 06:39:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cw2Pp2Xykz306S;
	Mon, 27 Oct 2025 16:39:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1033"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761543566;
	cv=none; b=UnE4+dfAHWZcqe+rBdjmGwg4OLO7GKyV7isqd2cOZ9UguN94kt98cfcesrnDVWMMAffgewVChi9HTcuVnF8/kwXpX2d/dT0DVTAkHj6XJFwKqNiv/5GkNl4kEP+2oePp4u7A+xODnMw2Ku63/VlDqhhaUY0b7Qomoaws3MOXnfeSa7DZFPN+EvQSY7w9zDE3XJo8V5+qn9iBAC1G4lIU2eTU++957DCDHLY+/JOPgU7nxIBeZ05FyiMfEZsP9kG0w0cgwKMAw5uXDqHUDcRXSmJ1ELX9N7LUoV4nn0uO2uJG/DCzGXqsAsNOx7UDAXwwmYFlWbVhspynhBjhQ33BkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761543566; c=relaxed/relaxed;
	bh=xGtjzD1BeaBjDHddgtdZ9WU8el5Ygry6H8PZ/jMJrRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YC5IMlVU3g7H2iuBMKHZro+04LWSYnYSy2jXzmejFO+0+Prmw8qfrNnrEWL5X8BchB9iKY2QJMZD1HIDBr3wQdtXZqynaHJrOECQtxAgufcVaGQdVdWkFUeLihQs2D9ZbfTGtVyBul9CbLs8RmDlIR/Z/CYLIDLNrFhfi2hcEtPUwQo67XZR+/3DNDGwc0MCefdPBG+4f//EdwA5vhmO24fNu+r0tP/Nf1SM0bDpV2pLFhZeTpt9+9HV9TfWOrA8HAsrMLktJh/1DwP5ILrxP55t8Qu/qV7s4wdmI+ZOSe7Qw5aFo+XNQ7n8jtEu8JwPddo0wqIqTmXJyeA3FiVYRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VlfRNAgN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VlfRNAgN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cw2Pm44LBz2xR2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 16:39:23 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-33bbeec2ed7so3816908a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Oct 2025 22:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761543560; x=1762148360; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGtjzD1BeaBjDHddgtdZ9WU8el5Ygry6H8PZ/jMJrRs=;
        b=VlfRNAgNrr/NaCqypcxW6rqgD3rsu1G5kULpBsvyCFx6eFW+0+2/jf3b4h3k9X33TG
         udsygdqLmDELC9bKRpL0+Nuvl0D/Jd/JGFi0VTbkT8+GRB7+6cCP+8V7UhjdNmBOThaV
         GqNY1om823bJRR3HbRxoGPsq6ukxje/VYUigDtth7rp/f+C+xtFGnqgPw25ITIdsJB5u
         iepZdW7O8UtqCBr3pMOzCQpk+G25Z+j4JmtwrHXMCx7zEm7ze7iMSsofb7klA489si+5
         tMjVODRS1f7V/lZYRWfk2ZJ+99K4NtMHatt9VQRGjRsa3kknp3qhrTpYR7wwG4p7EhhD
         1x7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761543560; x=1762148360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xGtjzD1BeaBjDHddgtdZ9WU8el5Ygry6H8PZ/jMJrRs=;
        b=PUQ90l/+VV+qkvi4l6Ifnwn+ThvR2cREF3xkc3hDd5iF4lrSIFBGJtuvlt1MXOR5vM
         1+8TLiFTCi5CmJ5i0xKsCRrVwPXtkFgPwa5BsPy+1LGIDgFrcIPPsECZt52h0Va/xXH8
         XMdXhuylYkKRK3C671Mibf0pfZFeOGM7GAUPJzsalqfqs4DAepljwdqxcKtBY4XXVOEr
         wk0dhn1IXqfuGkfzDlypzuPTG2U2aulOIniDsYTcVD+GxF0AQs8yQ5ZnAiyWiiYtYLTC
         U35rUxIWa9VHS4UP8XOeozFc8RSj7vWbFTVgE0nhe0osFMwUCPgMDMJd4/IF1eVSwH5d
         FQaA==
X-Forwarded-Encrypted: i=1; AJvYcCWHaqdegLCay5WIBVabrajV2+9Q/ev+cVKRsCp0hBGgMRGIBmAV1Z6qa5zQmYiUD5YHHEKjaFrQ+cTRuqc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxV8CabCkV2sV2y9IPZmVQga8xfXSW/hkv7/evXrqPxIosGMz3k
	wycj+lBQFh3GB6idRlWJvhjTZHJwm6lUtkFn1wJa7B//ZsZMVmNNjmmxg6Pb22ooKRTKb7VAh+m
	8wKMlUnWr6TXwkd3oADxFESEjCq2UhPI=
X-Gm-Gg: ASbGncvDX/PPdqUuENqaXG39cJSMwp+rYkaZzv+OsFZk0SuXAjI7GtlIohjIVRK2ADc
	9iFq3ntthM4+WKVr7J7G6o7qvcozRamNvHKbzi9TjbcHaR7/VCviKzeqoTlWNwDzj9zZkiSXMT5
	AYmzzCxRO4cSsnoF82XS9lKxo5nSh372h0evDMrdjb8PkxSJtQtIHpIAtKz52YkCwsuIzr3Oqu3
	/KaPZ8ZE0KRQvor5XneG+dYOxMls1ZAGv4IcIloBM1rCpgYwxCQdnsFn7x5
X-Google-Smtp-Source: AGHT+IG5Sf9tB2N+w1t0iXdjYTK5KXV5g3IANtwtYYJO6ljlk9IRhJTfDvRLeuH3axMGpYEhZU1jh4opBb4+H/Jk7Js=
X-Received: by 2002:a17:90b:3d0d:b0:334:e020:2f16 with SMTP id
 98e67ed59e1d1-33fafbab2b3mr18325423a91.11.1761543560049; Sun, 26 Oct 2025
 22:39:20 -0700 (PDT)
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
References: <20251024135716.584265-1-maarten@zanders.be>
In-Reply-To: <20251024135716.584265-1-maarten@zanders.be>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 27 Oct 2025 13:39:07 +0800
X-Gm-Features: AWmQ_bkivSeLBDrdFcjjCqIEzy1egjp-oNFnxwaFGOsZDh-2ho7GB46pKzHMgAQ
Message-ID: <CAA+D8ANhErMaJWAOvjMWc=2xq+bsYBJ5eLeN+jg8B4=K+aQsnQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Fix sync error in consumer mode
To: Maarten Zanders <maarten@zanders.be>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Zidan Wang <zidan.wang@freescale.com>, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Oct 24, 2025 at 9:58=E2=80=AFPM Maarten Zanders <maarten@zanders.be=
> wrote:
>
> When configured for default synchronisation (Rx syncs to Tx) and the
> SAI operates in consumer mode (clocks provided externally to Tx), a
> synchronisation error occurs on Tx on the first attempt after device
> initialisation when the playback stream is started while a capture
> stream is already active. This results in channel shift/swap on the
> playback stream.
> Subsequent streams (ie after that first failing one) always work
> correctly, no matter the order, with or without the other stream active.
>
> This issue was observed (and fix tested) on an i.MX6UL board connected
> to an ADAU1761 codec, where the codec provides both frame and bit clock
> (connected to TX pins).
>
> To fix this, always initialize the 'other' xCR4 and xCR5 registers when
> we're starting a stream which is synced to the opposite one, irregardless
> of the producer/consumer status.
>
> Fixes: 51659ca069ce ("ASoC: fsl-sai: set xCR4/xCR5/xMR for SAI master mod=
e")
>
> Signed-off-by: Maarten Zanders <maarten@zanders.be>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu wang
> ---
>  sound/soc/fsl/fsl_sai.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 757e7868e322..178a6e8fbe2c 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -653,12 +653,12 @@ static int fsl_sai_hw_params(struct snd_pcm_substre=
am *substream,
>                 val_cr4 |=3D FSL_SAI_CR4_CHMOD;
>
>         /*
> -        * For SAI provider mode, when Tx(Rx) sync with Rx(Tx) clock, Rx(=
Tx) will
> -        * generate bclk and frame clock for Tx(Rx), we should set RCR4(T=
CR4),
> -        * RCR5(TCR5) for playback(capture), or there will be sync error.
> +        * When Tx(Rx) sync with Rx(Tx) clock, Rx(Tx) will provide bclk a=
nd
> +        * frame clock for Tx(Rx). We should set RCR4(TCR4), RCR5(TCR5)
> +        * for playback(capture), or there will be sync error.
>          */
>
> -       if (!sai->is_consumer_mode[tx] && fsl_sai_dir_is_synced(sai, adir=
)) {
> +       if (fsl_sai_dir_is_synced(sai, adir)) {
>                 regmap_update_bits(sai->regmap, FSL_SAI_xCR4(!tx, ofs),
>                                    FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FR=
SZ_MASK |
>                                    FSL_SAI_CR4_CHMOD_MASK,
> --
> 2.51.0
>

