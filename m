Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3382820F5BE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 15:34:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49x51P5gwvzDqnW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 23:34:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uewoGiRO; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49x4xq5R4NzDqfv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 23:31:11 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id h23so15573166qtr.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 06:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GrXmMzhrfpzqEnud4K6uwivgEJVrHc8/GZLkP2z6bGw=;
 b=uewoGiROevRWGxnXkAJqkTKhBwCX3F01qbv8NnE285I74F2oy/ioesvxP5bb2T6UyH
 tK4BUrjPZkT3l4FbvbPaBf+QFdlQHVs49OU+NBHS5cw7kQdRDjj8TN+6Gadcxk8Etx8Y
 mITwoEduSsKLQKCp7zgxCWsrBXbxgsqL/mf3ojHw1E7V9C9dC+UNfLld+VnHi6emvQUr
 zrJR18Di74bbcPB1YeeSAbCaT63eDCDQfdtc9W1jY8beAKws1KKSVXXJJU+SI/OlHNan
 3jNsvQruSMsuQm29+GuAeqJv/nsrMBVdIqQNzT9jhXOL4G4G/0y50BvIVFp5xgTTz6QO
 ORbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GrXmMzhrfpzqEnud4K6uwivgEJVrHc8/GZLkP2z6bGw=;
 b=ZQZZtgn34Sk+e39TpNdnpAzFzzTboqYUVL+H3yM7KSZ9b/w9SKSR3ipWPGlhutZN1/
 qk5oWylU4bC/nPVnlqWEYniUuN2+2oT9EM8HswUW02GKmn5gYpezw6yGRwjQlJqtWg6p
 g3JjcD9wotdADLJKdWVyl8XmZuM80qDw4zOpNDO9noxaumGU3hilhvoRXUUyeJfuYTHS
 hFCvKwNlzb8YKn6OEcnCXHlv5ak2u/aOWZb2HEJBAARU5Rg8j3YCgD/AQE3n+715rDd0
 jWDgWprZsByY0rzupTgzaH0aTYveAaLcm8wah+z3JlCBBHZz97znsTT8YDj/K1cOEqTo
 DLjA==
X-Gm-Message-State: AOAM532jpYO1LwgYasfKEZstdB/LGmkd9T+T1CrqT2u7n5X+MNRmguqM
 lKCG5SFsVl316tP+nxQIJLyMAamSkC89DLmHXGY=
X-Google-Smtp-Source: ABdhPJzbw0kxobiFSnBJYHLfEBJRiSlARc+7whjl3exLQbRiQRZccm04A+6k1vp0Q3HVYgqQUwCYSu/yQFTxlTOddSo=
X-Received: by 2002:ac8:4316:: with SMTP id z22mr20775262qtm.121.1593523867006; 
 Tue, 30 Jun 2020 06:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <1593439115-19282-1-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5DRv4jkHsCkAmwV4BC1tO3O1nNdZgctMcorgK0WCA86tw@mail.gmail.com>
In-Reply-To: <CAOMZO5DRv4jkHsCkAmwV4BC1tO3O1nNdZgctMcorgK0WCA86tw@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 30 Jun 2020 21:30:55 +0800
Message-ID: <CAA+D8AO5iGZjJ8MHhG=zfyu+N5JO0PnvcHYY+3BEY0Lz5xyxKg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: Add an option to select internal ratio
 mode
To: Fabio Estevam <festevam@gmail.com>
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
 Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 30, 2020 at 8:38 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Shengjiu,
>
> On Mon, Jun 29, 2020 at 11:10 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> > +/**
>
> "/**" notation may confuse 'make htmldocs". Since this is a single
> line comment you could do:
>
> /* Select proper clock source for internal ratio mode */
>
>
> > + * Select proper clock source for internal ratio mode
> > + */
> > +static int fsl_asrc_select_clk(struct fsl_asrc_priv *asrc_priv,
> > +                              struct fsl_asrc_pair *pair,
> > +                              int in_rate,
> > +                              int out_rate)
> > +{
> > +       struct fsl_asrc_pair_priv *pair_priv = pair->private;
> > +       struct asrc_config *config = pair_priv->config;
> > +       int rate[2], select_clk[2]; /* Array size 2 means IN and OUT */
> > +       int clk_rate, clk_index;
> > +       int i = 0, j = 0;
> > +       bool clk_sel[2];
> > +
> > +       rate[0] = in_rate;
> > +       rate[1] = out_rate;
> > +
> > +       /* Select proper clock source for internal ratio mode */
> > +       for (j = 0; j < 2; j++) {
> > +               for (i = 0; i < ASRC_CLK_MAP_LEN; i++) {
> > +                       clk_index = asrc_priv->clk_map[j][i];
> > +                       clk_rate = clk_get_rate(asrc_priv->asrck_clk[clk_index]);
> > +                       if (clk_rate != 0 && (clk_rate / rate[j]) <= 1024 &&
> > +                           (clk_rate % rate[j]) == 0)
> > +                               break;
> > +               }
> > +
> > +               if (i == ASRC_CLK_MAP_LEN) {
> > +                       select_clk[j] = OUTCLK_ASRCK1_CLK;
> > +                       clk_sel[j] = false;
> > +               } else {
> > +                       select_clk[j] = i;
> > +                       clk_sel[j] = true;
> > +               }
> > +       }
> > +
> > +       /* Switch to ideal ratio mode if there is no proper clock source */
> > +       if (!clk_sel[IN] || !clk_sel[OUT])
> > +               select_clk[IN] = INCLK_NONE;
> > +
> > +       config->inclk = select_clk[IN];
> > +       config->outclk = select_clk[OUT];
> > +
> > +       return 0;
>
> This new function always returns 0. Should it be converted to 'void'
> type instead?
>
> > +       ret = fsl_asrc_select_clk(asrc_priv, pair,
> > +                                 config.input_sample_rate,
> > +                                 config.output_sample_rate);
> > +       if (ret) {
> > +               dev_err(dai->dev, "fail to select clock\n");
>
> fsl_asrc_select_clk() does not return error, so you could skip the
> error checking.

ok, will update the patch

best regards
wang shengjiu
