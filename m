Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A70093AFAAF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 03:45:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G88NY3DxBz3bsy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 11:45:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=eRVgBkLk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12f;
 helo=mail-lf1-x12f.google.com; envelope-from=festevam@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eRVgBkLk; dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G88N15pr0z2yQm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 11:44:47 +1000 (AEST)
Received: by mail-lf1-x12f.google.com with SMTP id d16so25796833lfn.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 18:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2T+4u9U452MLDrV2sYabqwjNLxExFpoXzhYGSkfV/Ws=;
 b=eRVgBkLkEobSTUu2RowLHRnirDS2+IwYWobxfQcL1BQgaljFpmhjb4Nq7LOUQ+Hj3M
 s4W6phGuKaUSejFuFkfCQ4U9v3NjqK4FOKXIomQNR81jfOE//up36OIDU7Mnx3DX4qpF
 l2cY4IJK/9UAsJPc6Nu/AETIeST4OORcrqv75/Seg1CHIvvQvQwe7iXiAz1dgNtUnBcG
 DgCCoGbUjaPkgkzK5U0tufNBgh54zK8J7B2+UnH6aXqk04V4W4S73ISaRvv9kqG8brSA
 n6TnhwiWH1Rk99hHEuAwK9kMtmxRFbKyGkRfUZqJk36daIK2zyCxk4SzQqKiRu4dDBb1
 U2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2T+4u9U452MLDrV2sYabqwjNLxExFpoXzhYGSkfV/Ws=;
 b=RWeNuNuKoQsH53P9uobjncEWFXRQqi4UlFSf/UTATMxaQMEIrPox66juvMF2GRljWq
 YRTv7AmsCxex+RJOv+m7jw0rSqQNttxNaVyn51loyFNMjGh00s5IGfppANqR4wOoYo7r
 nFxW7GFqDDjS4tYVsZMXAjK+dt/o2dy6FU5Lf2Q4l5szhmluUkmMwDhffQdHJ1qfFkyu
 O55iZ/uguvGE8BZ6qui3bKSCcZ1+YXhPfb6jtwgPhOM25QBmL0TNkDIGSNOzDIZnpPgi
 IMgMmL1rI9y1nmyAsb0FeEMs2nMgXX4RYQ01uOFjKX7X9pN7LtD7GWTKrobVuayMpUC5
 alGA==
X-Gm-Message-State: AOAM5303in3kGG9waLBwdX9DjTc8cM2qOIVaQL8pg+B5ogpkNXWorm5D
 6gaG7dyYbst8Uuxcxz6cuN3sbjSN1ixxxxXMBmM=
X-Google-Smtp-Source: ABdhPJyQXRfM5h/ViEgeFaxz2ca/NMheg2Er/toj2fzJ2zsb2j4LEy+PdmZbxxtQc2bwjuQGToAOvFBERb0c4+GEbxw=
X-Received: by 2002:a05:6512:1583:: with SMTP id
 bp3mr864286lfb.500.1624326278809; 
 Mon, 21 Jun 2021 18:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <1624324395-7260-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1624324395-7260-1-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 21 Jun 2021 22:44:27 -0300
Message-ID: <CAOMZO5Bh6J8=E=P1btDdgkYm9bvBN1ituRHLLOtW1cFsheQBdg@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] ASoC: fsl-asoc-card: change dev_err to
 dev_err_probe for defer probe
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Shengjiu,

On Mon, Jun 21, 2021 at 10:31 PM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> Don't need to print error message for defer probe
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in v2:
> - use dev_err_probe instead of dev_dbg
>
>  sound/soc/fsl/fsl-asoc-card.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> index 121e08c2af2a..24c890d76da0 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -708,8 +708,8 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>         of_node_put(framemaster);
>
>         if (!fsl_asoc_card_is_ac97(priv) && !codec_dev) {
> -               dev_err(&pdev->dev, "failed to find codec device\n");
>                 ret = -EPROBE_DEFER;
> +               dev_err_probe(&pdev->dev, ret, "failed to find codec device\n");

I know I suggested dev_err_probe() before, but looking at this again, I realized
that the error message will never be printed.

Maybe the error message could just be deleted?
