Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46994749D3E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 15:18:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxcYN0xF1z3c3l
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 23:18:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fatal.se (client-ip=94.255.170.6; helo=pi.fatal.se; envelope-from=ah@fatal.se; receiver=lists.ozlabs.org)
X-Greylist: delayed 571 seconds by postgrey-1.37 at boromir; Thu, 06 Jul 2023 18:56:53 AEST
Received: from pi.fatal.se (94-255-170-6.cust.bredband2.com [94.255.170.6])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxVl922Y8z30hF
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 18:56:52 +1000 (AEST)
Received: by pi.fatal.se (Postfix, from userid 1000)
	id 49B302A8D9; Thu,  6 Jul 2023 10:47:06 +0200 (CEST)
Date: Thu, 6 Jul 2023 10:47:06 +0200
From: Andreas Henriksson <andreas@fatal.se>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode
Message-ID: <20230706084706.bzwsbi3zisx5m5rl@fatal.se>
References: <1652963808-14515-1-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5DtpoH0dLDX3=Sv4UUpX_=66VEZPsJUWQNnYviApfMLKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5DtpoH0dLDX3=Sv4UUpX_=66VEZPsJUWQNnYviApfMLKQ@mail.gmail.com>
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

Hello Shengjiu, Fabio,

On Thu, May 19, 2022 at 10:23:06AM -0300, Fabio Estevam wrote:
> Hi Shengjiu,
> 
> On Thu, May 19, 2022 at 9:49 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> 
> > diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> > index fa950dde5310..dae16a14f177 100644
> > --- a/sound/soc/fsl/fsl_sai.c
> > +++ b/sound/soc/fsl/fsl_sai.c
> > @@ -437,6 +437,12 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
> >                                    FSL_SAI_CR2_DIV_MASK | FSL_SAI_CR2_BYP,
> >                                    savediv / 2 - 1);
> >
> > +       if (sai->soc_data->max_register >= FSL_SAI_MCTL) {
> 
> Isn't it a bit fragile to take this decision based on the number of
> SAI registers in the SoC?
> 
> What about adding a specific field in soc_data for such a purpose?

We've been working on an i.MX8MP where MCLK needs to be input and found
that this enables the MCLK as output despite not having set the
`fsl,sai-mclk-direction-output;` devicetree property in our DT.
Reverting the patch fixes the issues for us.

I have to say that the code comment made me a bit confused, but once
I found the commit message I understood why this code existed.
If this is really i.MX8MM specific maybe mention that in the code
comment and please make the code actually only trigger on i.MX8MM.
It seems to me like these all fulfill the current criteria:
imx7ulp, imx8mq, imx8mm, imx8mp, imx8ulp, imx93

Should I report this in bugzilla.kernel.org ?

Regards,
Andreas Henriksson
