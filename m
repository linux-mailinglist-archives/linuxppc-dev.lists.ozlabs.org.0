Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AACE52D3DA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 15:23:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3rCs4923z3blF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 23:23:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kqyqe4kq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635;
 helo=mail-ej1-x635.google.com; envelope-from=festevam@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=kqyqe4kq; dkim-atps=neutral
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3rCC1PDCz2yw3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 23:23:18 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id tk15so9930542ejc.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 06:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u0w8abIetG2abMfdqOSd7Y82vyjnsYTVbT2dM/SJUnQ=;
 b=kqyqe4kqxe8fIM4wT/Lk+TKu3gZPfVVJL7C4awAbF1WarDBgMnhX/jTNZMl/vxTt85
 O+Z6wBabc4+ZNCx8n0IHE9REoVXdCMvPJlFCnZZYhFj1hzZxP+8mcqFOUhlVZbDAzPre
 Kc/q7pYmg1xfxtbb3BFBaHJS52S/wJHPIZsXAseZ8vOuQdzGf7Q8TolTfts249OnHSX2
 Zvvj5lEJ4vqVz5G0WslC0SbW4MlQrCVSSX7e6+KrAampo/iIcwlgZWo1YulA6XmleJ2q
 lrwd2wIj2hyi5kx1AWJ3qxAkGhNfEyLpl2qlX5PGPoPvv92sBJrzSyZNuz9JxC/w48oG
 d3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u0w8abIetG2abMfdqOSd7Y82vyjnsYTVbT2dM/SJUnQ=;
 b=ot67syLY8AVWaGBgoJrR6Kl+YzCwaFuIfd+j4NOMCpAJW0NLfpXcG8GAxTDn8SzZE2
 +IzfwdZ0mZ+c0q0wnDQO6QN8nVD6h8nnFsfbGOWV6CQXa5CQTowrbV7o4pGawFAePB3/
 2h4b7A+O3U7uSDyLrnaxYxVue1S306D5Wq1/enxM4vmO3iRs6JRZ8ytB+zFA8kdBjMBL
 eeXZDaKNomPwCsF/Hpb3DdGnSJlkKThvStu3R6dl9bqNYqNfmpIh9kj34uFKKeorFL1u
 GdmY57hcKjI9+n4hU0f065PpmEiCyFAg/Q1y2inPfdACyJufVCSfaF00d7rP7OdBdaP8
 asSQ==
X-Gm-Message-State: AOAM53139vu6bF9m6fbWO/ypUPK22EWIkXicJH6Z7e9LE9YXa61u00GH
 Ok0dJt/RRW0P2i7vkf2jKOB+JnXsaiuX2D7a6Lo=
X-Google-Smtp-Source: ABdhPJxNRiGcRFJtK3UBMZH041EXrP1arR0vXHoGPqJhbNCeJrxP1aggikIpmh71PFSM0Xke5vQam54J3vaSYyrXjBg=
X-Received: by 2002:a17:907:7b9f:b0:6f4:d8c5:392c with SMTP id
 ne31-20020a1709077b9f00b006f4d8c5392cmr4265502ejc.652.1652966594102; Thu, 19
 May 2022 06:23:14 -0700 (PDT)
MIME-Version: 1.0
References: <1652963808-14515-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1652963808-14515-1-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 19 May 2022 10:23:06 -0300
Message-ID: <CAOMZO5DtpoH0dLDX3=Sv4UUpX_=66VEZPsJUWQNnYviApfMLKQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Shengjiu,

On Thu, May 19, 2022 at 9:49 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:

> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index fa950dde5310..dae16a14f177 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -437,6 +437,12 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
>                                    FSL_SAI_CR2_DIV_MASK | FSL_SAI_CR2_BYP,
>                                    savediv / 2 - 1);
>
> +       if (sai->soc_data->max_register >= FSL_SAI_MCTL) {

Isn't it a bit fragile to take this decision based on the number of
SAI registers in the SoC?

What about adding a specific field in soc_data for such a purpose?
