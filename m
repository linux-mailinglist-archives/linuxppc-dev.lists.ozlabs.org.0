Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3446A2B8B3E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 07:06:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cc8MV74pMzDqd9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 17:06:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GeHvjHAa; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cc8Kk4YhwzDqcH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 17:05:14 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id a13so4399549qkl.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 22:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=afgDn2umda6QgnA0T4nNfO0qOaQP4kyxzthFa3SdSFE=;
 b=GeHvjHAaXVWHe47UtcIRS4vrSBEdINyrcJ8wDFKIB70hQKrcBT4vdCSHWLHGPdHnDK
 /OLAYZm7nD/ldSC0YfZGtTGbgrMUxOHGNh5nCPHxT7A205g/KwJuag6SPrs5thp5Dbga
 zYoZMz2LzUBnDq2HeyPzro/Q6J2HyeKjhej5QlHs9OJITgS1BEDefIpjE9ST9P9k8/oJ
 idI1krkePOsHfIKHMsSxkTnp/I9NDY53hW1RTe5/Ejd7wsKyM/kppCa86DIs1kgYL9j3
 GHohFLV4MITqLk56Iw8ogdu+emoHOO01cce4PfJw9UObyGt7q+WHlj9A65gXYxm7lSSx
 SRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=afgDn2umda6QgnA0T4nNfO0qOaQP4kyxzthFa3SdSFE=;
 b=lHBvZHhZI9QUia52la6LONVUo4Wfb1BwFlhy10K9NLQqyObC/Gek/v3Cb4mRPXYK57
 BtNJO1TOosRukcPg4tJjmDoLdj0/iokpGm87iJsCRdqvCbLbuMSzUqW8aN2jwxRkawIl
 37SXuXtB1fj8YcmGcIuhsGRr6c8WYbu0U6QfD+UsIIULj17PyQG8oj4+zFlFeRUgw63a
 MR6PxGmc8R4LQXlEuiBvwjS/GMTbelrS9N23vf2sD8PhDNfjCqT1e2GZerk8zHCsxiLP
 QwNU/bZCBidN8WXK0nUHGJC2nqYb4WtEd2PNnx3fx4+DcNVTMRsejTcMxD/gSg9pDWFG
 5hnQ==
X-Gm-Message-State: AOAM5327/qu/500U5ktQ4s3IKswW8anGeoCjWSQXDjnv66eXxh3+GiDR
 xaKVk/r3ox7QChHNMt5IOihUVRg15J82rHiz7RU=
X-Google-Smtp-Source: ABdhPJw4ldiy0UOoaJKLIc/wQOv2QQLlKmJpH68m7Y/6USvRX1laUXgpAW85JgEWR6O1s71WFQ37KQdGxadYdcOaBdI=
X-Received: by 2002:ae9:e317:: with SMTP id v23mr9438913qkf.152.1605765908487; 
 Wed, 18 Nov 2020 22:05:08 -0800 (PST)
MIME-Version: 1.0
References: <1605752956-17397-1-git-send-email-shengjiu.wang@nxp.com>
 <20201119050120.GA7124@Asurada-Nvidia>
 <CAA+D8AOuaeZCnvY0h2stzkiMnNCe7zvK_D4M2irT7y7NC+iZFg@mail.gmail.com>
 <20201119055340.GA1666@Asurada-Nvidia>
In-Reply-To: <20201119055340.GA1666@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 19 Nov 2020 14:04:57 +0800
Message-ID: <CAA+D8AOkios28X0n0cC4RbVnkkQ5U3fWaBNrp1AvN0rr_wbb-g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Correct the clock source for mclk0
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
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 19, 2020 at 1:54 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Thu, Nov 19, 2020 at 01:28:32PM +0800, Shengjiu Wang wrote:
> > On Thu, Nov 19, 2020 at 1:02 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > >
> > > On Thu, Nov 19, 2020 at 10:29:16AM +0800, Shengjiu Wang wrote:
> > > > On VF610, mclk0 = bus_clk;
> > > > On i.MX6SX/6UL/6ULL/7D, mclk0 = mclk1;
> > > > On i.MX7ULP, mclk0 = bus_clk;
> > > > On i.MX8QM/8QXP, mclk0 = bus_clk;
> > > > On i.MX8MQ/8MN/8MM/8MP, mclk0 = bus_clk;
> > > >
> > > > So add variable mclk0_mclk1_match in fsl_sai_soc_data To
> > >
> > > Not in favor of "mclk0_mclk1_match" as it doesn't sound explicit
> > > to me. Instead, "mclk0_is_bus_clk" or "mclk0_is_mclk1" might be
> > > better. Or in case that you foresee some other implementation:
> > >
> > > enum {
> > >         MCLK0_IS_BUS_CLK,
> > >         MCLK0_IS_MCLK1,
> > > };
> > >
> > > static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
> > > +       .mclk0_alias = MCLK0_IS_BUS_CLK,
> > > };
> >
> > No problem.
> >
> > But I just find this patch doesn't consider the mqs case.
> > MCLK0 can't be used for mqs, it needs MCLK1, even
> > the MCLK0 is same as MCLK1,  MCLK1 need to be
> > selected for mqs case.
> >
> > Is there a decent way for this case?
>
> Is there any use case that we have to use MCLK0 instead of MCLK1
> on SoCs where MCLK0=MCLK1? If no, how about skip MCLK0 at all in
> the for-loop at fsl_sai_set_bclk?
>
>         /*
>          * There is no point in polling MCLK0 if it is identical to MCLK1.
>          * And given that MQS use case has to use MCLK1 though two clocks
>          * are the same, we simply skip MCLK0 and start to find from MCLK1.
>          */
>         id = mclk0_is_mclk1 ? 1 : 0;
>
>         for (; id < FSL_SAI_MCLK_MAX; id++) {

Ok, thanks, will update the patch.

best regards
wang shengjiu
