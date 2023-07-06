Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B54EC749D5C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 15:23:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qxcfp4vfmz3cbq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 23:23:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fatal.se (client-ip=2001:470:1f04:f16::2; helo=pi.fatal.se; envelope-from=ah@fatal.se; receiver=lists.ozlabs.org)
X-Greylist: delayed 13597 seconds by postgrey-1.37 at boromir; Thu, 06 Jul 2023 22:34:07 AEST
Received: from pi.fatal.se (andreasfatal-1-pt.tunnel.tserv3.fmt2.ipv6.he.net [IPv6:2001:470:1f04:f16::2])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxbYq3ccRz3bqh
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 22:34:05 +1000 (AEST)
Received: by pi.fatal.se (Postfix, from userid 1000)
	id E76412A8E0; Thu,  6 Jul 2023 14:34:01 +0200 (CEST)
Date: Thu, 6 Jul 2023 14:34:01 +0200
From: Andreas Henriksson <andreas@fatal.se>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode
Message-ID: <20230706123401.kctossjho26bry7e@fatal.se>
References: <1652963808-14515-1-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5DtpoH0dLDX3=Sv4UUpX_=66VEZPsJUWQNnYviApfMLKQ@mail.gmail.com>
 <20230706084706.bzwsbi3zisx5m5rl@fatal.se>
 <CAOMZO5CCdaodWQrHUQgMizoES=jfEtw-sNJZG-DJMpRD8tZW9g@mail.gmail.com>
 <CAA+D8ANAg7bs0A35c7Af3_-5sLaqvT1RoKfCbzYi=z=t_q9LUw@mail.gmail.com>
 <CAOMZO5BtrKwrMwrjVDbYn3ivt2uV9rzbSDxd8qfiYjOBMvKBgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5BtrKwrMwrjVDbYn3ivt2uV9rzbSDxd8qfiYjOBMvKBgg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Thu, 06 Jul 2023 23:17:34 +1000
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Hans =?iso-8859-1?Q?S=F6derlund?= <hans.soderlund@realbit.se>, Shengjiu Wang <shengjiu.wang@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Fabio,

Maybe I shouldn't comment as I'm already on deep water, but...

On Thu, Jul 06, 2023 at 08:32:57AM -0300, Fabio Estevam wrote:
> On Thu, Jul 6, 2023 at 8:19 AM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
> 
> > No, this is the code in probe().
> > The code with the issue is in fsl_sai_set_bclk().
> 
> Yes, I put it in the wrong place.
> 
> > The clean way for fixing is to remove the code in fsl_sai_set_bclk()
> > and add "fsl,sai-mclk-direction-output;" property in dts for some
> > node.
> 
> Yes, what about this?
> 
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -507,7 +507,7 @@ static int fsl_sai_set_bclk(struct snd_soc_dai
> *dai, bool tx, u32 freq)
>                                    savediv / 2 - 1);
>         }
> 
> -       if (sai->soc_data->max_register >= FSL_SAI_MCTL) {
> +       if (sai->soc_data->max_register >= FSL_SAI_MCTL  &&
> sai->mclk_direction_output) {
>                 /* SAI is in master mode at this point, so enable MCLK */
>                 regmap_update_bits(sai->regmap, FSL_SAI_MCTL,
>                                    FSL_SAI_MCTL_MCLK_EN, FSL_SAI_MCTL_MCLK_EN);

This is exactly the same as and thus redundant to the code already in
the probe function?!

If I understood it correctly, the problem Shengjiu was trying to adress
was that apparently on i.MX8MM (and only imx8mm?!), even when using MCLK
in *input*, you still need to enable it because otherwise BCLK will not
be generated. (I personally don't know anything about this or the imx8mm
variant though.)

The problem could probably equally well be worked around by always setting the
fsl,sai-mclk-direction-output; devicetree property on imx8mm, even when
using MCLK in input..... But I'm just guessing here to be honest. This
is just as I understood what purpose the initial patch that was merged
had.

The current state affects more devices than imx8mm though, making MCLK
in input mode not possible.

I think your initial review comment was spot on Fabio. There probably
needs to be a(n imx8mm) specific flag that says when this workaround
should be applied and gate the code in bclk function on that.
Atleast that's the only thing I can think of if my interpretation of the
problem for imx8mm is correct.

Regards,
Andreas Henriksson

