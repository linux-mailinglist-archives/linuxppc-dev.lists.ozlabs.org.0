Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 098393AFAF6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 04:16:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G894Q5k17z3bt0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 12:16:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=tu17vS/f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e;
 helo=mail-lf1-x12e.google.com; envelope-from=festevam@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tu17vS/f; dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G893v3LMvz2ykQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 12:15:54 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id h4so33381806lfu.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 19:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GpzA+s8lvFsctseOT+5uPm2562t7LAgE0eEfnLZ9Pnk=;
 b=tu17vS/fM+jlMjiPABq2Ut09SAl1FccrJO20rnttQ86LkZwVvGSLjgGo8vxGraZB+v
 kcutcVyqy70RxIUm+t7V9u0WCu+u4UCChFwziU/vtJb1tgoogLW9puWtsEu1V4WE1FNU
 pxDnM6H40WkKN3Njroyh9l5FIe73uWL5VgMpjgHhGrS0+rCibtx8js7T39nxX/ceZbMT
 EFhCT8yG+uOKWPMbwxwQnOo1CpZxS7ZdV9XuZH1Zr9vfwHUVFqIzaILq9wWcPw23WUHt
 iFjiwhWNw9uQ9/HsH1yNmM9Fk2mEMytMkJ3R46w2DEBKYQfk7sKd9Vrkxi8lUhJI+1um
 mQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GpzA+s8lvFsctseOT+5uPm2562t7LAgE0eEfnLZ9Pnk=;
 b=UZ4KXvzm48mB0rjIcvfCiaYHU5OgyQyFy/A5v9zIakPfqqMHjGyp5Ip8550KdW7rFG
 HLRPRtk6ejLhjkLfVVEIUOnD+lrANugAOsvrC0lGgjgyHBiN8gYMT5LFGsMdFpt3fxuf
 cvyOmyu7Bs7STCybLkM5AuXNKLlP9JpDgLidlTrexFBGXwDwBI5r2RZT0DxNqYYr+eHQ
 CJFtjlp6H+dnLL9so6lcQc6oxj3wTkl0tfhvg7vwpW9jkQfH/K5rOG++jelBQcYQ0aeM
 5KOutLyyVG7JNaUUCr/YaCuBXuHTVXoqeHwl6Iqzf827maZt+5ztQ8y7GZA3nRYc9Ek7
 WxBg==
X-Gm-Message-State: AOAM532Cq0xS6tA/cT/B5Ya4uE4nO6tFjy2jN93/pO8ivgGEU0LkbvXL
 WnqmUVy/ESnEAEnJsUKxFSvHO2MijRthz0/7Smc=
X-Google-Smtp-Source: ABdhPJySHFadxRfxD2SOtm1zWGyqRaIAuj8te+5MBb7/YjkBkJfWXviGXjXRVJYQppsXBO3rNOBU78QAAUAO4vVNiMw=
X-Received: by 2002:a05:6512:3b24:: with SMTP id
 f36mr927384lfv.443.1624328148749; 
 Mon, 21 Jun 2021 19:15:48 -0700 (PDT)
MIME-Version: 1.0
References: <1622616132-10391-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1622616132-10391-1-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 21 Jun 2021 23:15:37 -0300
Message-ID: <CAOMZO5A1+HUmUVhYv4en4Vgw93AoS62UwQx1GwC9i4XiG5QZvw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: change dev_err to dev_dbg for defer
 probe
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
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Shengjiu,

On Wed, Jun 2, 2021 at 3:59 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> Don't need to print error message for defer probe
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl-asoc-card.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> index 4f55b316cf0f..b40ba910ae9d 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -709,7 +709,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>         of_node_put(framemaster);
>
>         if (!fsl_asoc_card_is_ac97(priv) && !codec_dev) {
> -               dev_err(&pdev->dev, "failed to find codec device\n");
> +               dev_dbg(&pdev->dev, "failed to find codec device\n");
>                 ret = -EPROBE_DEFER;

This looks good:

Reviewed-by: Fabio Estevam <festevam@gmail.com>

My previous suggestion of using dev_err_probe() would make the message
never to be printed.

Thanks
