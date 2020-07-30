Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C807E232C83
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 09:26:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHMQf6PvVzDqr5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 17:26:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HXYQQMgf; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHMNR08DZzDqws
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 17:24:06 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id x12so11136678qtp.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 00:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UONcGtH87E3a5kjHLIWiuODkuzooKxlCqVfEhVFntOs=;
 b=HXYQQMgfzlVEj3WUkqkBrSxkEmTJohgn7cWeafHTC4o/k0JKSoPBxzLQZWVlUdWtSb
 /nP2n5lgXaR5sD9xSWYxzj4aw05lcL0G8vj1vYgxB5qViOBgNbPKMdj7Jfg+/recddQE
 xCgbYFo3KRM/t5/hPKE5YXNb3NYWa4OVLfs+HJ2WWSOyU8m1y4rXbZLUUruYm0QY6pd3
 shQtNvR2f9mvm8rok3XR5Aoj2nzJaqEIYlSXhjZX4d2Tnz1pDr2AKkBwHAANzATN5iDs
 TQFsqc3+O/EmhKFxilWouZ5mFNL2M9Vcib5o7lGLIeDAP4uCBujIJXoJwzXkIGVd7ehd
 xl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UONcGtH87E3a5kjHLIWiuODkuzooKxlCqVfEhVFntOs=;
 b=Dkxl61cMtAjpLhvp+VizQdWkzTzoSDn4/Say3TZrCPRfjUPAu2RnHXHmA0At9gHRSy
 E1jF2L3WeX6xQLj0Ui2Rl4m6IsdwkEb1k1KrsQjncHhx1L0lr8huHyrV50ke5TuWQ8+9
 5kQalmpW22RP+9mM7cgScmf/VylbeZUuiV3p89BqYZIoTi9emFhzYjtY3tY2FhTmTyax
 L3V0mGBbMlPKGYFxSX3uONr2BwG4xaRsoL9a2u1qWj/IR/oem1WT7Zvl9HFw5sn7cLh5
 x9Y2eK0UEgcYjAdkkkwI6Of8PQ/fo5VZJaGnyZ7a3jE14GIzJfKcsKGEyBzw6t8az1J/
 +7ag==
X-Gm-Message-State: AOAM531wT3Jhme8P7/FdeTr/yTMHwgVZBQnJYYI3+9MUQZETeUvBSWqP
 E49iY+2VOdYnoic7fv/o4rBglvYT4HBILv/A1y0=
X-Google-Smtp-Source: ABdhPJwyTxUPfHh/W6tv9g29pHFtPJF1Ko5E5uzGhYAwkdfNZ3VBu0oUQIo+AE2x1GxX7qRobBU900hB2OKzukb53L4=
X-Received: by 2002:ac8:6d0f:: with SMTP id o15mr1543191qtt.121.1596093838176; 
 Thu, 30 Jul 2020 00:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <1595762417-2190-1-git-send-email-shengjiu.wang@nxp.com>
 <20200727005558.GA30124@Asurada-Nvidia>
In-Reply-To: <20200727005558.GA30124@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 30 Jul 2020 15:23:47 +0800
Message-ID: <CAA+D8AMiarV+FovE8ZTTe8zagSz8-XDcck7Z4W2TfbOvzgrLpw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: Remove fsl_asoc_card_set_bias_level
 function
To: Nicolin Chen <nicoleotsuka@gmail.com>
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
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 27, 2020 at 8:58 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Sun, Jul 26, 2020 at 07:20:17PM +0800, Shengjiu Wang wrote:
> > With this case:
> > aplay -Dhw:x 16khz.wav 24khz.wav
> > There is sound distortion for 24khz.wav. The reason is that setting
> > PLL of WM8962 with set_bias_level function, the bias level is not
> > changed when 24khz.wav is played, then the PLL won't be reset, the
> > clock is not correct, so distortion happens.
> >
> > The resolution of this issue is to remove fsl_asoc_card_set_bias_level.
> > Move PLL configuration to hw_params and hw_free.
>
> Hmm...using set_bias_level() instead of hw_params/hw_free() was
> strongly suggested by Mark when I got imx-wm8962 machine driver
> upstream. So we will need his input here, although I personally
> don't have a problem with it...
>
> > After removing fsl_asoc_card_set_bias_level, also test WM8960 case,
> > it can work.
> >
> > Fixes: 708b4351f08c ("ASoC: fsl: Add Freescale Generic ASoC Sound Card with ASRC support")
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl-asoc-card.c | 149 +++++++++++++++-------------------
> >  1 file changed, 66 insertions(+), 83 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> > index 4848ba61d083..0517dbb3e908 100644
> > --- a/sound/soc/fsl/fsl-asoc-card.c
> > +++ b/sound/soc/fsl/fsl-asoc-card.c
> > @@ -73,6 +73,7 @@ struct cpu_priv {
> >   * @codec_priv: CODEC private data
> >   * @cpu_priv: CPU private data
> >   * @card: ASoC card structure
> > + * @is_stream_in_use: flags for release resource in hw_free
>
> Would love to see something shorter... Could we reuse similar
> one below, borrowing from fsl_ssi driver?
>
>  * @streams: Mask of current active streams: BIT(TX) and BIT(RX)
>

will send v2 for this change.

> >  static int fsl_asoc_card_audmux_init(struct device_node *np,
> >                                    struct fsl_asoc_card_priv *priv)
> >  {
> > @@ -611,7 +600,6 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
> >       /* Diversify the card configurations */
> >       if (of_device_is_compatible(np, "fsl,imx-audio-cs42888")) {
> >               codec_dai_name = "cs42888";
> > -             priv->card.set_bias_level = NULL;
>
> Can check if set_bias_level is still being used with this change.
