Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3005A200297
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 09:17:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49p99n3TZ0zDqsC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 17:17:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MThCG9Jw; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49p98C1PZ7zDqbq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 17:16:10 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id k22so6485056qtm.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 00:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xcLqzNszUsRDe3jzmL6Kvi+SK8buR0iM6L0pJ0UQJfo=;
 b=MThCG9Jwd1aI1wlSrnihvC6cp3eKrh1rOv53tY8fvT3TtKvhO4+k+EFdPX6DnBxykT
 HIAUcdBak30KNoee1xQlVGjQw+hElyt19YBKvIplGecD/KWhj8ClCPXrtKXwLneEzPkG
 FX2YRtIycp9pDMfyTHJgBM5aXLXlxwmFiJy+p+G9rjP4s16pUfA8Ed7dtd9yN2DsSr65
 ajQr2uZOX1cSLXZrD31ZkfHZImQMfY35RGJ5SEJylICknu5fwuDtAcUp6VtIPDTgMuIT
 SdzZcm84vhjqCYCVAgG9traNzYrCUBJBeoTdbYa44zPvck6LQiRZDIa5uulw8dHVCqPb
 HDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xcLqzNszUsRDe3jzmL6Kvi+SK8buR0iM6L0pJ0UQJfo=;
 b=WaX9pdjP8Ff3Fiw/cECVlJHqPH9/KJ201fE5WCB/wrZfGHOqK3fTiLBbNvJF3+1KHP
 O1ReXBc6rfA5YP3IV5u+YlzUGUZS5rBqazcyTTv5tFtq99FkLiDvC3TRqL6pRFwgA3FI
 jmJdYeaXzA/QySgF9ng8np3Hxii+myCo5ilHJll+/7YmB3wvoSEPp4Tb4DmDx1EzG2O+
 Ryd3csPyX0lQRb9ZQJID7Kex3xhW00ijbS+ACdRmSR2gGdERjiHcdMcUI0U94ZmRG4xY
 MkAcsksNLT1QaNPnmWuwz9NBSWglHdxpexHKpn486jaGuzaM1eWlYWKS63+HlgwiTcGo
 M83g==
X-Gm-Message-State: AOAM532HyW/rTyj7SyMASetLA5q8mgQ6xZUSOl7MZqQ7+goAlhuo4MvR
 fGJFd/4u3TrdXVuPt8dsdC9/iZu+Rk1/G4FVKR0=
X-Google-Smtp-Source: ABdhPJwbTdL1Xjyp+rNzK2cppzw1kNNdm5CIImL/5YBuAp+LbbOkOHM6SMPUmT6BhKjPwcHCp3aPi+cLdaaqcQP4Te0=
X-Received: by 2002:ac8:7417:: with SMTP id p23mr2043092qtq.204.1592550967172; 
 Fri, 19 Jun 2020 00:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <1592481334-3680-1-git-send-email-shengjiu.wang@nxp.com>
 <20200619054942.GA25856@Asurada-Nvidia>
In-Reply-To: <20200619054942.GA25856@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 19 Jun 2020 15:15:56 +0800
Message-ID: <CAA+D8APdNAzLyJyf+-FGSyAJtG5_8BVZCJ1+8ALZe_ePySY+rQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Add pm runtime function
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
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 19, 2020 at 1:51 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Thu, Jun 18, 2020 at 07:55:34PM +0800, Shengjiu Wang wrote:
> > Add pm runtime support and move clock handling there.
> > Close the clocks at suspend to reduce the power consumption.
> >
> > fsl_spdif_suspend is replaced by pm_runtime_force_suspend.
> > fsl_spdif_resume is replaced by pm_runtime_force_resume.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>
> LGTM, yet some nits, please add my ack after fixing:
>
> Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
>
> > @@ -495,25 +496,10 @@ static int fsl_spdif_startup(struct snd_pcm_substream *substream,
>
> >
> > -disable_txclk:
> > -     for (i--; i >= 0; i--)
> > -             clk_disable_unprepare(spdif_priv->txclk[i]);
> >  err:
> > -     if (!IS_ERR(spdif_priv->spbaclk))
> > -             clk_disable_unprepare(spdif_priv->spbaclk);
> > -err_spbaclk:
> > -     clk_disable_unprepare(spdif_priv->coreclk);
> > -
> >       return ret;
>
> Only "return ret;" remains now. We could clean the goto away.
>
> > -static int fsl_spdif_resume(struct device *dev)
> > +static int fsl_spdif_runtime_resume(struct device *dev)
>
> > +disable_rx_clk:
> > +     clk_disable_unprepare(spdif_priv->rxclk);
> > +disable_tx_clk:
> > +disable_spba_clk:
>
> Why have two duplicated ones? Could probably drop the 2nd one.

seems can drop one, will send an update.

best regards
wang shengjiu
