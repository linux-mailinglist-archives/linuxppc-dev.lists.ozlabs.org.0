Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB19D413C57
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:23:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDZDG58b1z3clD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 07:23:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lI3L7AvT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::134;
 helo=mail-lf1-x134.google.com; envelope-from=festevam@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lI3L7AvT; dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDZCc1RrZz2yPl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:23:07 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id i4so3092994lfv.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 14:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yMGBZJhgLdjiD4sy6cvbQdtvYs//rHG8iQfh3SyGQf8=;
 b=lI3L7AvTi8Iwun3OAtga1QWsPwv819yMUHiXdIjyijYaXbZGLRJdlBdPWNnhc/W+CP
 GtHqPnf6DG/G+NmbIGEOxKIELz32liqbbzAHUW4HlqGaqQ65VHFcYKCOfIJrDTVKHaDi
 nKkB2LWkAtVz0b3mjluoh3WtLbSVOxCB4012SXFWbrlrnjl9cAj0wL8pSbswY9HUAMb0
 p2GtI7koz10lmy87cAztrXAFKzLJJNJoCdbeewQCwGL+2Or3EARVRV4Qlkdncywzom65
 Aaw8Q2IDjRq2yQgOefyOkSG0NuyrXsLaAdILz82GXpcZQhvR4/OnRZdoW5D8/ivXT4ud
 0gnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yMGBZJhgLdjiD4sy6cvbQdtvYs//rHG8iQfh3SyGQf8=;
 b=aZIYQHNVKTckxe0Nw8KiKjXeM/VlpjD47m4BtTaUNrx8ghtECn5l55aZvqvLWCAolQ
 +RpzK1V0TztLDxwuySsh/XzfFQC6WepJ3hXG3OpKlfROiZdJZglFg6UoDTX6cb459uDp
 ZNvIf9V5K2CZSTwV1YLK+wns7R6OTwmT0bvvfFrGZmdeafvzGklchoBe3PFdkRvKkGOD
 fbCZiWDpMpDCxQhVsDpc5oRhqYbSrjhQ19MAXN0mT8Z4DHmMVTmRMSAwao56YGLJT/sj
 Uo/ouX3mzjMuygjOQzd8pQaeojEIJyl+fNfAoz9JIdorOIm1j1CeoVoF5HPww4q/iurS
 ADWQ==
X-Gm-Message-State: AOAM531XTgMhhYgiB8g/aSk9Ba/8PIrKYGGmXMaFu7kKW0BctWFVhaJE
 09QjUTjUC9kqW0J4LOYTA66Jo1+b5KtUIG55SUMYS+Q9gYk=
X-Google-Smtp-Source: ABdhPJxh9a81q0IGJIP/0g9LetfBcvltXmBhzVLEXSEszysh/R+YS6sunrAf1NcvezczNUoT95Ngg/cgfPC3kf6k6sE=
X-Received: by 2002:ac2:4bc1:: with SMTP id o1mr24597919lfq.113.1632259382841; 
 Tue, 21 Sep 2021 14:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210921211040.11624-1-broonie@kernel.org>
 <20210921211040.11624-3-broonie@kernel.org>
In-Reply-To: <20210921211040.11624-3-broonie@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 21 Sep 2021 18:22:51 -0300
Message-ID: <CAOMZO5DFBPXb9LEGtGHCxgKR81iD8Kr0TTxZ5dmnwWCbMThG0g@mail.gmail.com>
Subject: Re: [PATCH 03/16] ASoC: fsl-audmix: Update to modern clocking
 terminology
To: Mark Brown <broonie@kernel.org>
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
 Shengjiu Wang <shengjiu.wang@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 21, 2021 at 6:11 PM Mark Brown <broonie@kernel.org> wrote:
>
> As part of moving to remove the old style defines for the bus clocks update
> the fsl-audmix driver to use more modern terminology for clocking.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  sound/soc/fsl/fsl_audmix.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
> index f931288e256c..db2dde597edc 100644
> --- a/sound/soc/fsl/fsl_audmix.c
> +++ b/sound/soc/fsl/fsl_audmix.c
> @@ -257,10 +257,10 @@ static int fsl_audmix_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>                 return -EINVAL;
>         }
>
> -       /* For playback the AUDMIX is slave, and for record is master */
> -       switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> -       case SND_SOC_DAIFMT_CBM_CFM:
> -       case SND_SOC_DAIFMT_CBS_CFS:
> +       /* For playback the AUDMIX is provider, and for record is consumer */
> +       switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {

I think the comment should be the other way around:

       /* For playback the AUDMIX is consumer, and for record is provider */

Other than that, the series looks good.
