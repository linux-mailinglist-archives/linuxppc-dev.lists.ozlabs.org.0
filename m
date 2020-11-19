Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6512B8B29
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 06:56:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cc8724PGPzDqXm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 16:55:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jcTSHx7i; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cc8511rWJzDqXG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 16:54:11 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id q10so3416574pfn.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 21:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=W+/WJCvab/Hgugh+VunRbyQx3J7VABdiIFZZOJfo1TY=;
 b=jcTSHx7ixnOfDz+kuB8ZRPKp/lqdE5UHKP+d8CVEEqI93FNGKZLVph7FLYgD1JN+pv
 /DdJEYApwcXEIZLUeqkVkaHdbZbUOH0B1Gs3ytKpcYvoa/uCILTYC9BtvWPUyEX3sb9G
 07LvFQyVqUQXlZJwa/HQlnkMjFKIYsmwn6vxvq1p4DOlfS8bGa9fWYitBwjGBwIwEAx3
 +uHf0UhsMiop63FjT2nQ0dQX0SB9YvtOfZdIiGy1vc8lTLzHBQ9BL/1trJJNVtnqOuf0
 7eX9aDm4eZYAhwR9NyC5dgDiOaEAqnSa/L/+aT7UnlWsbc6m+pzzStA2bcoYYRUe9ee0
 yhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=W+/WJCvab/Hgugh+VunRbyQx3J7VABdiIFZZOJfo1TY=;
 b=fFKNYmwOeWCp5jIkWFl7xHVRDnt5CgaMeKhTusMrQR7dQwTWEGnY2NaIZ7yI4ozE17
 Pm7YT0GyeoIvuhiINSvgFRMlY/VpE/An3yqYwns89w7HWfLXlbO7I+djyX36A/cCNP0P
 WHjb2CeI8zHpNE+jzOP9gro6tA5Yv+4h5XnVbsSdNTu247AGgQf2oHo/Y1NwSQhkvrXG
 K7GdE0qXdsz9zKyIreKfGHiJTjKdq7gKcdzenn5uiLLsT2ltJD/2OI+x+TDtj2xMZrWH
 MUQnexiQg6GDZ4157iSLE52Av+OWuF+Xq2XL9mo+72KwnMkXYnzwmBrysQt4HPtzZkL0
 8WLg==
X-Gm-Message-State: AOAM530xld+vzMBjo4QGXZhVze1zk6l0xEXO5U6D90FYpA1gdkhDaO6I
 SLtLGoyKZxOZ0Nhz/ndarog=
X-Google-Smtp-Source: ABdhPJynlE37JqiWB11KpgkMSim1NZ0+qLh6TpiXRD+r+aYGCY8JpQYcvhso0TeNNN7BWmAZ7yAP8g==
X-Received: by 2002:aa7:8c16:0:b029:196:33d2:721f with SMTP id
 c22-20020aa78c160000b029019633d2721fmr7465723pfd.70.1605765248175; 
 Wed, 18 Nov 2020 21:54:08 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id t9sm4682874pjq.46.2020.11.18.21.54.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 18 Nov 2020 21:54:07 -0800 (PST)
Date: Wed, 18 Nov 2020 21:53:41 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Correct the clock source for mclk0
Message-ID: <20201119055340.GA1666@Asurada-Nvidia>
References: <1605752956-17397-1-git-send-email-shengjiu.wang@nxp.com>
 <20201119050120.GA7124@Asurada-Nvidia>
 <CAA+D8AOuaeZCnvY0h2stzkiMnNCe7zvK_D4M2irT7y7NC+iZFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8AOuaeZCnvY0h2stzkiMnNCe7zvK_D4M2irT7y7NC+iZFg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 19, 2020 at 01:28:32PM +0800, Shengjiu Wang wrote:
> On Thu, Nov 19, 2020 at 1:02 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> >
> > On Thu, Nov 19, 2020 at 10:29:16AM +0800, Shengjiu Wang wrote:
> > > On VF610, mclk0 = bus_clk;
> > > On i.MX6SX/6UL/6ULL/7D, mclk0 = mclk1;
> > > On i.MX7ULP, mclk0 = bus_clk;
> > > On i.MX8QM/8QXP, mclk0 = bus_clk;
> > > On i.MX8MQ/8MN/8MM/8MP, mclk0 = bus_clk;
> > >
> > > So add variable mclk0_mclk1_match in fsl_sai_soc_data To
> >
> > Not in favor of "mclk0_mclk1_match" as it doesn't sound explicit
> > to me. Instead, "mclk0_is_bus_clk" or "mclk0_is_mclk1" might be
> > better. Or in case that you foresee some other implementation:
> >
> > enum {
> >         MCLK0_IS_BUS_CLK,
> >         MCLK0_IS_MCLK1,
> > };
> >
> > static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
> > +       .mclk0_alias = MCLK0_IS_BUS_CLK,
> > };
> 
> No problem.
> 
> But I just find this patch doesn't consider the mqs case.
> MCLK0 can't be used for mqs, it needs MCLK1, even
> the MCLK0 is same as MCLK1,  MCLK1 need to be
> selected for mqs case.
> 
> Is there a decent way for this case?

Is there any use case that we have to use MCLK0 instead of MCLK1
on SoCs where MCLK0=MCLK1? If no, how about skip MCLK0 at all in
the for-loop at fsl_sai_set_bclk?

	/*
	 * There is no point in polling MCLK0 if it is identical to MCLK1.
	 * And given that MQS use case has to use MCLK1 though two clocks
	 * are the same, we simply skip MCLK0 and start to find from MCLK1.
	 */
	id = mclk0_is_mclk1 ? 1 : 0;

	for (; id < FSL_SAI_MCLK_MAX; id++) {
