Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E875F20F4D7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 14:39:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49x3nz5TW5zDqTq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 22:39:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::244;
 helo=mail-lj1-x244.google.com; envelope-from=festevam@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=p+1avq+W; dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49x3lf6TpyzDqN9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 22:37:15 +1000 (AEST)
Received: by mail-lj1-x244.google.com with SMTP id s9so22210177ljm.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 05:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pjZ6pxTtSr9uxy/gwY+hSwq1zDBqrweQsuZnBCKIprM=;
 b=p+1avq+WJ5MS40d96OKyqyYSxO3pkEL1n6EmXdtseZ+6YX4nfvKqMa9GJEsluECWqU
 cd+Uy1Ua1W6INq+V0RwNjtjCT2Py5m+g7rZ7r8whvJIFmOdgL1wUayXf+08iCfAqvbNw
 pyWc9kpmPofFDJRC4avDXqO6o3bt8kYMZRPsjGYXIT7Io7+4q1ZBQDSCjuEvPfeBc1L/
 UsnZWXHMdtJw+fksTbIw3xGp5ZXbb02J/igC66udsYra3yAWTT5ru/Ai54aJEGelYwxX
 MbNlevxnzE0EWj5nsBlgNvo/Zf67PxhRRvv/1l+84WKLCy9oCiyYQC1NBBH6qIa6VonX
 lHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pjZ6pxTtSr9uxy/gwY+hSwq1zDBqrweQsuZnBCKIprM=;
 b=GqidQ79xGoAw6suc7f2K4tOyMLgDUVzRz+TAs6uYUlahj9K8p9XAKwPAWDhqU5Asu0
 ovM3C91h9VmxSJIH7hOV+4wDvEUhfA1HPjGMq6R2r/TrsSpdp3+nGlDD7X/DnOXtDjwH
 GhdEMjoRVKIywRQXMTxcIouzy8qFIKF4xLFPd6iTyjMQ5g6pcLGKiIwXgNUfQ4zvLTR3
 wlZpV4Av6Nw03PyI9WSUfji9+3NkiSRWe1HY2Eb+ec50oGOBobz2L9BoPIRGbiULqxXw
 XwvckFA307eDIg0/4dDV3kJuBZfD7bemfYAw1Ie9QuycIpw34olvYJrQ8jqqKwsKzv7T
 1Y1g==
X-Gm-Message-State: AOAM530fCEtFjg4hId5N3PBRgEkH886jF1wPTbHX/mIOyXordFmn9wJW
 ihqxHIwPlnD7eDlZQ3hlTQnLqW/yWFzTEHWx2Aw=
X-Google-Smtp-Source: ABdhPJyiv4tKOT0Q7iWTJRY3kT7Jhr0Mk21hdtaLMTH/M7qtgYtfElYU9Hc4r3jz/dO6EKDkddNJs9EkeqCM9iN55yc=
X-Received: by 2002:a2e:880e:: with SMTP id x14mr745594ljh.218.1593520628813; 
 Tue, 30 Jun 2020 05:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <1593439115-19282-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1593439115-19282-1-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 30 Jun 2020 09:36:57 -0300
Message-ID: <CAOMZO5DRv4jkHsCkAmwV4BC1tO3O1nNdZgctMcorgK0WCA86tw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: Add an option to select internal ratio
 mode
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

On Mon, Jun 29, 2020 at 11:10 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:

> +/**

"/**" notation may confuse 'make htmldocs". Since this is a single
line comment you could do:

/* Select proper clock source for internal ratio mode */


> + * Select proper clock source for internal ratio mode
> + */
> +static int fsl_asrc_select_clk(struct fsl_asrc_priv *asrc_priv,
> +                              struct fsl_asrc_pair *pair,
> +                              int in_rate,
> +                              int out_rate)
> +{
> +       struct fsl_asrc_pair_priv *pair_priv = pair->private;
> +       struct asrc_config *config = pair_priv->config;
> +       int rate[2], select_clk[2]; /* Array size 2 means IN and OUT */
> +       int clk_rate, clk_index;
> +       int i = 0, j = 0;
> +       bool clk_sel[2];
> +
> +       rate[0] = in_rate;
> +       rate[1] = out_rate;
> +
> +       /* Select proper clock source for internal ratio mode */
> +       for (j = 0; j < 2; j++) {
> +               for (i = 0; i < ASRC_CLK_MAP_LEN; i++) {
> +                       clk_index = asrc_priv->clk_map[j][i];
> +                       clk_rate = clk_get_rate(asrc_priv->asrck_clk[clk_index]);
> +                       if (clk_rate != 0 && (clk_rate / rate[j]) <= 1024 &&
> +                           (clk_rate % rate[j]) == 0)
> +                               break;
> +               }
> +
> +               if (i == ASRC_CLK_MAP_LEN) {
> +                       select_clk[j] = OUTCLK_ASRCK1_CLK;
> +                       clk_sel[j] = false;
> +               } else {
> +                       select_clk[j] = i;
> +                       clk_sel[j] = true;
> +               }
> +       }
> +
> +       /* Switch to ideal ratio mode if there is no proper clock source */
> +       if (!clk_sel[IN] || !clk_sel[OUT])
> +               select_clk[IN] = INCLK_NONE;
> +
> +       config->inclk = select_clk[IN];
> +       config->outclk = select_clk[OUT];
> +
> +       return 0;

This new function always returns 0. Should it be converted to 'void'
type instead?

> +       ret = fsl_asrc_select_clk(asrc_priv, pair,
> +                                 config.input_sample_rate,
> +                                 config.output_sample_rate);
> +       if (ret) {
> +               dev_err(dai->dev, "fail to select clock\n");

fsl_asrc_select_clk() does not return error, so you could skip the
error checking.
