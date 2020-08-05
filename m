Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B2A23C4E8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 07:06:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BM02q00RNzDqgM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 15:06:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=p0+e+ASi; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLzzq1JT8zDqf1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 15:03:50 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id c12so23790600qtn.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Aug 2020 22:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pJ+vSUIfqUpR/OfEnitTx0/E2WJkwWGAd7jXaGWXUSE=;
 b=p0+e+ASizlzhr9HvCBd0RSANYOffAstBixdT/gc+PGRA3WXffZI0bH00pFNrrd3D/9
 w6BGn++Pxi73MkkbA9k/LteCWLjqk/zey4aZljPqYMdn11ZZmlCGZZxnfdcHwADa7v0h
 KuvTA7QSAFYYk7YqF8XGS5oBE0hXKUf6e86LOqdF10lzDBSynzGsib+HoGKFawjs6SVV
 9xs+kulL5aH4Hzo9HNbTvEon7mKwi7R8rfQ0R0UiPIhr9yv49x7blWgxYcRcrduhCv4b
 gU6IGg4iT0SPgCnXiPoovfgcMbeSAaPwiMVjPDfKRjAqihonMBlgUt6AnWiCxqBjalDQ
 o1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pJ+vSUIfqUpR/OfEnitTx0/E2WJkwWGAd7jXaGWXUSE=;
 b=YVmXsRD6ecO1gSQOYWEq2Wh+P4boqptllQ0H5/PDvPyTjhXGflc2nsJpsi0k0TjLob
 EuI1fWVlJn/Pie60DLUk/jJeS+YhSjkR9vXS8DfK6ct3ZH1VjO0sAOlbCvOEvlKWMxkj
 1wconxua/IrTb3YqcW/hn91FMmu7g5KjHUnM9ffPpuAeHe1/vX1gr4FDv4yfHu/l1FK3
 JeBu9AJNrLv6I2ULYUH1mA0ScEo1Zs0d4q+OZzXESPp1kJJN1KG6YeA1+QXIe1lwcllW
 mZES4jqbWk+gK/SaDWuo8kNMKPxEMUr9GM2pzPmML7i0DaFm3XdwGhkks7YPM1klj/h1
 lEhw==
X-Gm-Message-State: AOAM53302gQRaHPIvNCMkACmyXOs6gENB+s6TPpi9MAQ54T8YZdjzRZF
 A+Zp+aE1COI8es4kD9pXRoFyIaXA2FXDUYL+Mmg=
X-Google-Smtp-Source: ABdhPJxP151f0b2pd7JM99jfAomT13Boin3/gUNf7Zg7iIwdHSVUQNJ4Qya2mEifL2X6+m0qcvOVqpVaIqcCAWtPj9k=
X-Received: by 2002:ac8:6d0f:: with SMTP id o15mr1533677qtt.121.1596603828149; 
 Tue, 04 Aug 2020 22:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <1596594233-13489-1-git-send-email-shengjiu.wang@nxp.com>
 <1596594233-13489-3-git-send-email-shengjiu.wang@nxp.com>
 <20200805041111.GB10174@Asurada-Nvidia>
In-Reply-To: <20200805041111.GB10174@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 5 Aug 2020 13:03:37 +0800
Message-ID: <CAA+D8ANv-qURC_wu3TzWiiiCAXC88Gc+WGssdjmuWoLPTRm3pA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: fsl_sai: Refine enable and disable sequence
 for synchronous mode
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

On Wed, Aug 5, 2020 at 12:13 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Wed, Aug 05, 2020 at 10:23:53AM +0800, Shengjiu Wang wrote:
> > Tx synchronous with Rx:
> > The TCSR.TE is no need to enabled when only Rx is going to be enabled.
> > Check if need to disable RSCR.RE before disabling TCSR.TE.
> >
> > Rx synchronous with Tx:
> > The RCSR.RE is no need to enabled when only Tx is going to be enabled.
> > Check if need to disable TSCR.RE before disabling RCSR.TE.
>
> Please add to the commit log more context such as what we have
> discussed: what's the problem of the current driver, and why we
> _have_to_ apply this change though it's sightly against what RM
> recommends.
>
> (If thing is straightforward, it's okay to make the text short.
>  Yet I believe that this change deserves more than these lines.)
>
> One info that you should mention -- also the main reason why I'm
> convinced to add this change: trigger() is still in the shape of
> the early version where we only supported one operation mode --
> Tx synchronous with Rx. So we need an update for other modes.
>
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>
> The git-diff part looks good, please add this in next ver.:
>
> Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>
>
> Btw, the new fsl_sai_dir_is_synced() can be probably applied to
> other places with a followup patch.
Do you mean move it to the beginning of this file?

best regards
wang shengjiu
