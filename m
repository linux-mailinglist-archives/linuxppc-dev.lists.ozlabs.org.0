Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BAF7BCA71
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Oct 2023 01:39:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RpiLnLq3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S31wP0X96z3vdY
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Oct 2023 10:39:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RpiLnLq3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=ansuelsmth@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2HjL2MMDz3bvB
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Oct 2023 05:57:08 +1100 (AEDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3231d6504e1so2256701f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Oct 2023 11:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696618624; x=1697223424; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J8TnZukIluCCYT6M1BV1r+HvisyoMBi+KKDF01G+Mhg=;
        b=RpiLnLq3nvonFmOs0E0h4IAkTwnvVMOS3BYtXq2Tl2D9qQAnYt8ZoSk9GRkK9fFb1E
         32BvwBgoCwlMEPQyjnHeER8a+m/BypMe3/n3e97lkLgY4rIVcfUZ/sVOeadV1lE7kK5P
         sncDlPFyikh3AcS1YhF+t37oTd+QEnKR4EcZeSywONn12Zvka5ZaiXafwPvvSsSZBTOU
         7hZQaritctBFfmjqbtwR5+W9Y4EImuYXtMoqSVZQZUK1vjNU85alajiut0eJva/SpWju
         KYPxEGaXnt+DFLEC6upehOexYlnyojNDA/2E9KDR5865UJcdv1/kwfb6EiFBpNp8TC+s
         8zmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696618624; x=1697223424;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J8TnZukIluCCYT6M1BV1r+HvisyoMBi+KKDF01G+Mhg=;
        b=vvgcTEF1cSfjEDCmqZlETSOGAiA+MjVGpFOpa8z+qnhrlgJNTS8K5L3q7uLqHO1c3a
         Rgnpih9aYrXmS1YjcgStuswANV1C4j68z9T54ySFtTcIf2EE+cIea4yztdffR+USMvUe
         SbIU0tDCCDewQNo8qdXWtZCxI8C8fo0KtIw60pE+1jzPdzKp+CZEzAJL9PlxpTvgkrEs
         vLD0guD+nY/bfgKYzzvf09+U3hKsRnoMsfX+3nd+ANaX0sAvSiwzuPwTp+pubRqD330h
         hcodknwW//vPDLG3QAPBBmttIMhYGVakpeP/k1Bx8MSPRR53CaZ6raba6s2EoSz6Km+T
         krnw==
X-Gm-Message-State: AOJu0YxZIwmBwebbuAmM6m/rxh+fveZKUcsLrsA0qsXBXhgbh7gGuyj1
	1K3jFmgbavt+4boczIfJOhhU7JDoEtPBlA==
X-Google-Smtp-Source: AGHT+IGnyXDNMYk8HFRpUEcTSZlI2oSIFcmKPz3Tef9zJ6V0zvxO56KtfzCWQ2oyr2OO4KuUJibc4g==
X-Received: by 2002:a05:6000:48:b0:31f:f8a5:15db with SMTP id k8-20020a056000004800b0031ff8a515dbmr8155280wrx.48.1696618182580;
        Fri, 06 Oct 2023 11:49:42 -0700 (PDT)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id p4-20020a5d68c4000000b003232f167df5sm2217218wrw.108.2023.10.06.11.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 11:49:41 -0700 (PDT)
Message-ID: <652056c5.5d0a0220.2b60d.c5dc@mx.google.com>
X-Google-Original-Message-ID: <ZSBWxW8ba8P0szfD@Ansuel-xps.>
Date: Fri, 6 Oct 2023 20:49:41 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Eric Dumazet <edumazet@google.com>
Subject: Re: [net-next PATCH v2 4/4] netdev: use napi_schedule bool instead
 of napi_schedule_prep/__napi_schedule
References: <20231003145150.2498-1-ansuelsmth@gmail.com>
 <20231003145150.2498-4-ansuelsmth@gmail.com>
 <CANn89iLtYZJPOQE7OkAbEdmhT8qjzAJ+27poa__3c8Nf0M6u_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANn89iLtYZJPOQE7OkAbEdmhT8qjzAJ+27poa__3c8Nf0M6u_w@mail.gmail.com>
X-Mailman-Approved-At: Sun, 08 Oct 2023 10:36:54 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Sergey Ryazanov <ryazanov.s.a@gmail.com>, Ziwei Xiao <ziweixiao@google.com>, Chris Snook <chris.snook@gmail.com>, Rick Lindsley <ricklind@linux.ibm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Krzysztof Halasa <khalasa@piap.pl>, Yuri Karpov <YKarpov@ispras.ru>, netdev@vger.kernel.org, ath10k@lists.infradead.org, Dany Madden <danymadden@us.ibm.com>, Gregory Greenman <gregory.greenman@intel.com>, Zhengchao Shao <shaozhengchao@huawei.com>, Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>, Dawei Li <set_pte_at@outlook.com>, Intel Corporation <linuxwwan@intel.com>, Rob Herring <robh@kernel.org>, Jeroen de Borst <jeroendb@google.com>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, Lee Jones <lee@kernel.org>, Haren Myneni <haren@linux.ibm.com>, linux-stm32@st-md-mailman.stormreply.com, Rushil Gupta <rushilg@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Thomas Falcon <tlfalcon@linux.ibm.com>, Jose Abreu <joabreu@synopsys.com>,
  Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, linux-wireless@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>, Wolfgang Grandegger <wg@grandegger.com>, Nick Child <nnac123@linux.ibm.com>, Simon Horman <horms@kernel.org>, Liu Haijun <haijun.liu@mediatek.com>, Kalle Valo <kvalo@kernel.org>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, Yuanjun Gong <ruc_gongyuanjun@163.com>, Shailend Chand <shailend@google.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Benjamin Berg <benjamin.berg@intel.com>, M Chetan Kumar <m.chetan.kumar@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Coco Li <lixiaoyan@google.com>, linux-arm-kernel@lists.infradead.org, Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>, Ricardo Martinez <ricardo.martinez@linux.intel.com>, Loic Poulain <loic.poulain@linaro.org>, Zheng Zengkai <zhengzengkai@huawei.com>, Maximilian Lu
 z <luzmaximilian@gmail.com>, Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Douglas Miller <dougmill@linux.ibm.com>, linux-kernel@vger.kernel.org, Tariq Toukan <tariqt@nvidia.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Junfeng Guo <junfeng.guo@intel.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Raju Rangoju <rajur@chelsio.com>, Praveen Kaligineedi <pkaligineedi@google.com>, Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson <quic_jjohnson@quicinc.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 05, 2023 at 06:16:26PM +0200, Eric Dumazet wrote:
> On Tue, Oct 3, 2023 at 8:36 PM Christian Marangi <ansuelsmth@gmail.com> wrote:
> >
> > Replace if condition of napi_schedule_prep/__napi_schedule and use bool
> > from napi_schedule directly where possible.
> >
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/net/ethernet/atheros/atlx/atl1.c     | 4 +---
> >  drivers/net/ethernet/toshiba/tc35815.c       | 4 +---
> >  drivers/net/wireless/intel/iwlwifi/pcie/rx.c | 4 +---
> >  3 files changed, 3 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/atheros/atlx/atl1.c b/drivers/net/ethernet/atheros/atlx/atl1.c
> > index 02aa6fd8ebc2..a9014d7932db 100644
> > --- a/drivers/net/ethernet/atheros/atlx/atl1.c
> > +++ b/drivers/net/ethernet/atheros/atlx/atl1.c
> > @@ -2446,7 +2446,7 @@ static int atl1_rings_clean(struct napi_struct *napi, int budget)
> >
> >  static inline int atl1_sched_rings_clean(struct atl1_adapter* adapter)
> >  {
> > -       if (!napi_schedule_prep(&adapter->napi))
> > +       if (!napi_schedule(&adapter->napi))
> >                 /* It is possible in case even the RX/TX ints are disabled via IMR
> >                  * register the ISR bits are set anyway (but do not produce IRQ).
> >                  * To handle such situation the napi functions used to check is
> > @@ -2454,8 +2454,6 @@ static inline int atl1_sched_rings_clean(struct atl1_adapter* adapter)
> >                  */
> >                 return 0;
> >
> > -       __napi_schedule(&adapter->napi);
> > -
> >         /*
> >          * Disable RX/TX ints via IMR register if it is
> >          * allowed. NAPI handler must reenable them in same
> > diff --git a/drivers/net/ethernet/toshiba/tc35815.c b/drivers/net/ethernet/toshiba/tc35815.c
> > index 14cf6ecf6d0d..a8b8a0e13f9a 100644
> > --- a/drivers/net/ethernet/toshiba/tc35815.c
> > +++ b/drivers/net/ethernet/toshiba/tc35815.c
> > @@ -1436,9 +1436,7 @@ static irqreturn_t tc35815_interrupt(int irq, void *dev_id)
> >         if (!(dmactl & DMA_IntMask)) {
> >                 /* disable interrupts */
> >                 tc_writel(dmactl | DMA_IntMask, &tr->DMA_Ctl);
> > -               if (napi_schedule_prep(&lp->napi))
> > -                       __napi_schedule(&lp->napi);
> > -               else {
> > +               if (!napi_schedule(&lp->napi)) {
> >                         printk(KERN_ERR "%s: interrupt taken in poll\n",
> >                                dev->name);
> >                         BUG();
> 
> Hmmm... could you also remove this BUG() ? I think this code path can be taken
> if some applications are using busy polling.
> 
> Or simply rewrite this with the traditional
> 
> if (napi_schedule_prep(&lp->napi)) {
>    /* disable interrupts */
>    tc_writel(dmactl | DMA_IntMask, &tr->DMA_Ctl);
>     __napi_schedule(&lp->napi);
> }
> 
>

Mhhh is it safe to do so? I mean it seems very wrong to print a warning
and BUG() instead of disabling the interrupt only if napi can be
scheduled... Maybe is very old code? The more I see this the more I see
problem... (randomly disabling the interrupt and then make the kernel
die)

> 
> > diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/rx.c b/drivers/net/wireless/intel/iwlwifi/pcie/rx.c
> > index 23b5a0adcbd6..146bc7bd14fb 100644
> > --- a/drivers/net/wireless/intel/iwlwifi/pcie/rx.c
> > +++ b/drivers/net/wireless/intel/iwlwifi/pcie/rx.c
> > @@ -1660,9 +1660,7 @@ irqreturn_t iwl_pcie_irq_rx_msix_handler(int irq, void *dev_id)
> >         IWL_DEBUG_ISR(trans, "[%d] Got interrupt\n", entry->entry);
> >
> >         local_bh_disable();
> > -       if (napi_schedule_prep(&rxq->napi))
> > -               __napi_schedule(&rxq->napi);
> > -       else
> > +       if (!napi_schedule(&rxq->napi))
> >                 iwl_pcie_clear_irq(trans, entry->entry);
> 
> Same remark here about twisted logic.
> 

Ehhh here we need to be careful... We can do the usual prep/__schedule
with the DMA disable in between...

From the comments of iwl_pcie_clear_irq.

	/*
	 * Before sending the interrupt the HW disables it to prevent
	 * a nested interrupt. This is done by writing 1 to the corresponding
	 * bit in the mask register. After handling the interrupt, it should be
	 * re-enabled by clearing this bit. This register is defined as
	 * write 1 clear (W1C) register, meaning that it's being clear
	 * by writing 1 to the bit.
	 */

So the device disable the interrupt after being fired and the bit needs
to set again for the interrupt to be reenabled. So the function
correctly reenable the irq if a napi can't be scheduled... Think there
isn't another way to handle this.

> >         local_bh_enable();
> >
> > --
> > 2.40.1
> >

-- 
	Ansuel
