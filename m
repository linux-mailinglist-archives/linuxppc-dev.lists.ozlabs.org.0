Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBFD1E06B3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 08:13:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Vmx76TsfzDqTL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 16:13:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gmZ8Vunc; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49VmvV23tgzDqRh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 May 2020 16:11:49 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id 190so16728499qki.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 May 2020 23:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zE6QF3wBuG+bbFky4XNH1ls+bDYS3myqBI0CKs9XLgY=;
 b=gmZ8VuncLIfL+xQ1uVR/HNEXvNFmcIL7W5Uce9o/Ajf7J1PDFBxeCDlCWbnUpHE6ew
 puJM4g0cpV7xMRSGDzwlLFFr5698CMId+R2S2OAHxbid2eP9t36+yRSdrVhVV8snbrxd
 6rsVpBMPe71+h9AvFol2x+TtVwUSlkSzXspe5p+Z/Hu45Wbl0bLDcp/UnIKo3WJC6lkj
 9ku4sr5N4poBK1P76/+PeROWEIRrwOAZCh59hVy/dGSJKfucj/zaU28pOZIwYfDI9w4P
 oxQB6iRYVc+ONa7iQkF5QlPsVXJ4N14h1uyhvh4HkDuA5La1uzSRNtP7DQZM9lno5YQs
 YYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zE6QF3wBuG+bbFky4XNH1ls+bDYS3myqBI0CKs9XLgY=;
 b=XTI9cH6NQnsFPxEVM/x0GeLYxYndybPdYxQfyX0b3lF10cnOlmQxpI1zGeF6d2RIb4
 VLJZxFKSNMmtQ3P39v7ZT1GSonVAqnt/5sx+4n30bSA4GmQvFDd0+2GQR6GH/1SaBlqt
 PEdPHYDq7V/8+V0ce/W04YJqiGefZ6dSU/Edu5tV4zxwxWies8kPifMbPZsrkKFwucym
 83yKp216qjEhKjZoIrpKuIWMinyr85jt2E5jg6mb4nqJGVmXUfeLAp51+2Np5NEpvO69
 2GWFAg6zUrZiora44Z1Mw3BsOkP7H6yQkGKbja8VHVYnTPJ0Djr4arVTu5xiZMW9V/yg
 jgXg==
X-Gm-Message-State: AOAM530pi6Ic730+WEgZ2h4zrETGGADiEIl3EXwKTPH7AkZoyrTRkXMU
 QBCp3YWQsOUw1xKgp2Me0SkTLlJDZ34fL2Kods4=
X-Google-Smtp-Source: ABdhPJydMBgq/Pjn4/khBBaHIGx05CEfpOqguypnLj9qdpyApo26fr/GyQlog+GyRmcHhBgT4Rg6CgKdiB76ee7lE7c=
X-Received: by 2002:a37:b50:: with SMTP id 77mr22555339qkl.152.1590387105305; 
 Sun, 24 May 2020 23:11:45 -0700 (PDT)
MIME-Version: 1.0
References: <1590141444-28668-1-git-send-email-shengjiu.wang@nxp.com>
 <20200525050950.GA1244@Asurada>
In-Reply-To: <20200525050950.GA1244@Asurada>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 25 May 2020 14:11:18 +0800
Message-ID: <CAA+D8AML7P3j+14w5PywPy4QEcxw09z1izZSZbrOB_nte+XDmA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: Merge suspend/resume function to
 runtime_suspend/resume
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

On Mon, May 25, 2020 at 1:12 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Fri, May 22, 2020 at 05:57:24PM +0800, Shengjiu Wang wrote:
> > With dedicated power domain for asrc, power can be disabled after
> > probe and pm runtime suspend, then the value of all registers need to
> > be restored in pm runtime resume. So we can merge suspend/resume function
> > to runtime_suspend/resume function and enable regcache only in end of
> > probe.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_asrc.c | 70 ++++++++++++++++------------------------
> >  1 file changed, 27 insertions(+), 43 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> > index 432936039de4..3ebbe15ac378 100644
> > --- a/sound/soc/fsl/fsl_asrc.c
> > +++ b/sound/soc/fsl/fsl_asrc.c
> > @@ -1100,6 +1100,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
> >       platform_set_drvdata(pdev, asrc);
> >       pm_runtime_enable(&pdev->dev);
> >       spin_lock_init(&asrc->lock);
> > +     regcache_cache_only(asrc->regmap, true);
> >
> >       ret = devm_snd_soc_register_component(&pdev->dev, &fsl_asrc_component,
> >                                             &fsl_asrc_dai, 1);
> > @@ -1117,6 +1118,7 @@ static int fsl_asrc_runtime_resume(struct device *dev)
> >       struct fsl_asrc *asrc = dev_get_drvdata(dev);
> >       struct fsl_asrc_priv *asrc_priv = asrc->private;
> >       int i, ret;
> > +     u32 asrctr;
> >
> >       ret = clk_prepare_enable(asrc->mem_clk);
> >       if (ret)
> > @@ -1135,6 +1137,24 @@ static int fsl_asrc_runtime_resume(struct device *dev)
> >                       goto disable_asrck_clk;
> >       }
> >
> > +     /* Stop all pairs provisionally */
> > +     regmap_read(asrc->regmap, REG_ASRCTR, &asrctr);
> > +     regmap_update_bits(asrc->regmap, REG_ASRCTR,
> > +                        ASRCTR_ASRCEi_ALL_MASK, 0);
> > +
> > +     /* Restore all registers */
> > +     regcache_cache_only(asrc->regmap, false);
> > +     regcache_mark_dirty(asrc->regmap);
>
>
> I see you doing regcache_mark_dirty() in the resume() now,
> being different from previously doing in suspend()?
>
> Thanks
> Nic

Which is for probe -> runtime_resume case.
After probe, the power may be disabled, so move mark_dirtry
to runtime_resume, then regcache can re-write all the registers.

best regards
wang shengjiu

>
>
> > +     regcache_sync(asrc->regmap);
> > +
> > +     regmap_update_bits(asrc->regmap, REG_ASRCFG,
> > +                        ASRCFG_NDPRi_ALL_MASK | ASRCFG_POSTMODi_ALL_MASK |
> > +                        ASRCFG_PREMODi_ALL_MASK, asrc_priv->regcache_cfg);
> > +
> > +     /* Restart enabled pairs */
> > +     regmap_update_bits(asrc->regmap, REG_ASRCTR,
> > +                        ASRCTR_ASRCEi_ALL_MASK, asrctr);
> > +
> >       return 0;
> >
> >  disable_asrck_clk:
> > @@ -1155,6 +1175,11 @@ static int fsl_asrc_runtime_suspend(struct device *dev)
> >       struct fsl_asrc_priv *asrc_priv = asrc->private;
> >       int i;
> >
> > +     regmap_read(asrc->regmap, REG_ASRCFG,
> > +                 &asrc_priv->regcache_cfg);
> > +
> > +     regcache_cache_only(asrc->regmap, true);
> > +
> >       for (i = 0; i < ASRC_CLK_MAX_NUM; i++)
> >               clk_disable_unprepare(asrc_priv->asrck_clk[i]);
> >       if (!IS_ERR(asrc->spba_clk))
> > @@ -1166,51 +1191,10 @@ static int fsl_asrc_runtime_suspend(struct device *dev)
> >  }
> >  #endif /* CONFIG_PM */
> >
> > -#ifdef CONFIG_PM_SLEEP
> > -static int fsl_asrc_suspend(struct device *dev)
> > -{
> > -     struct fsl_asrc *asrc = dev_get_drvdata(dev);
> > -     struct fsl_asrc_priv *asrc_priv = asrc->private;
> > -
> > -     regmap_read(asrc->regmap, REG_ASRCFG,
> > -                 &asrc_priv->regcache_cfg);
> > -
> > -     regcache_cache_only(asrc->regmap, true);
> > -     regcache_mark_dirty(asrc->regmap);
> > -
> > -     return 0;
> > -}
> > -
> > -static int fsl_asrc_resume(struct device *dev)
> > -{
> > -     struct fsl_asrc *asrc = dev_get_drvdata(dev);
> > -     struct fsl_asrc_priv *asrc_priv = asrc->private;
> > -     u32 asrctr;
> > -
> > -     /* Stop all pairs provisionally */
> > -     regmap_read(asrc->regmap, REG_ASRCTR, &asrctr);
> > -     regmap_update_bits(asrc->regmap, REG_ASRCTR,
> > -                        ASRCTR_ASRCEi_ALL_MASK, 0);
> > -
> > -     /* Restore all registers */
> > -     regcache_cache_only(asrc->regmap, false);
> > -     regcache_sync(asrc->regmap);
> > -
> > -     regmap_update_bits(asrc->regmap, REG_ASRCFG,
> > -                        ASRCFG_NDPRi_ALL_MASK | ASRCFG_POSTMODi_ALL_MASK |
> > -                        ASRCFG_PREMODi_ALL_MASK, asrc_priv->regcache_cfg);
> > -
> > -     /* Restart enabled pairs */
> > -     regmap_update_bits(asrc->regmap, REG_ASRCTR,
> > -                        ASRCTR_ASRCEi_ALL_MASK, asrctr);
> > -
> > -     return 0;
> > -}
> > -#endif /* CONFIG_PM_SLEEP */
> > -
> >  static const struct dev_pm_ops fsl_asrc_pm = {
> >       SET_RUNTIME_PM_OPS(fsl_asrc_runtime_suspend, fsl_asrc_runtime_resume, NULL)
> > -     SET_SYSTEM_SLEEP_PM_OPS(fsl_asrc_suspend, fsl_asrc_resume)
> > +     SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> > +                             pm_runtime_force_resume)
> >  };
> >
> >  static const struct fsl_asrc_soc_data fsl_asrc_imx35_data = {
> > --
> > 2.21.0
> >
