Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D54327BD0BB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 00:05:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RLiSrSV6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3bnD5YyZz3cHT
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 09:05:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RLiSrSV6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=ansuelsmth@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3VyR36Whz2yq2
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 05:27:41 +1100 (AEDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-327be5fe4beso3493655f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 Oct 2023 11:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696789654; x=1697394454; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UYhUlM0v/kiBnSA7qqkERNTe3ha0hd9wd9BeXsJuFRo=;
        b=RLiSrSV6uJxuQ8T1y43SwW9mvR44TQbUqw79IJjusYUXAfbnpXYG3Epk4Oo7Ocol4l
         VSvE1DHusx+KA3RbNSQBR0CofDlknCmNjKrmarEUlFBD4SVZTuOMjkedmruh2zWFpjgx
         +9Izpj3hvZOtN1lah7m+9LiCIz1ctHiXMkv4YHm1qb/0nOTopOgUhsS1111ooAo2w9Eh
         0/0fOm2lrIStLSbF/IhqcQnjuQ51yyWOphBpB0U3emJFGrUF6zNyalB4AKEKkkFG1KOA
         +QucTQLnQwwCobXcSgWFVMqOWDa5zsqRvaaMqzd+zr2e8FmNQGhUZIGrLUVS3mkh0K0Z
         9PEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696789654; x=1697394454;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYhUlM0v/kiBnSA7qqkERNTe3ha0hd9wd9BeXsJuFRo=;
        b=sFlKklDh9c8BORLjQWdKdBx/UG2viUh/yhp872xv+DFlyKth+rQMZnd82vf1yis9fo
         Yhn3+XRgXRk/2lTAQlm7QTITjfHhzhLrOA8RobbScp/CwNHBuH2szUygs00+NCa5Mt2W
         iyb83wKBeA87HqGWbFQSqV7RMy4Sb8YY0pjNLrjOW98GTp7c6QbaPXAeSZBXOFE//E66
         AAUWVoVYIKONWfQr3nLq/pGviI1tTX9IuZ/vi22MTXZqtpKoCaFp0DQ6ww5+dnmM51r2
         vjr9s20E6r63Tn/TeK1sCfOL7osf3JY+R17ucyeYjubPpFgZe/Lwv8uT4R49KWqzxTuk
         FBhQ==
X-Gm-Message-State: AOJu0YwUnJj4+FXy4Y/ED6jOOtNiNnjBhDZ4dPri5tksHlsAXeFy7RLV
	hY2xl+iMc9NpIMLc14ZV/yQ=
X-Google-Smtp-Source: AGHT+IG1Z2UQG/8uimtzwOsX0SSnSzQeAnFClPvayUdx2bESkKFHKQw9/TSlsvhrREuwaEcXQ8SiYA==
X-Received: by 2002:a5d:50c8:0:b0:316:f24b:597a with SMTP id f8-20020a5d50c8000000b00316f24b597amr11755917wrt.46.1696789653876;
        Sun, 08 Oct 2023 11:27:33 -0700 (PDT)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id j14-20020adff54e000000b003233a31a467sm7413627wrp.34.2023.10.08.11.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 11:27:33 -0700 (PDT)
Message-ID: <6522f495.df0a0220.326ed.de6c@mx.google.com>
X-Google-Original-Message-ID: <ZSL0kLgKGmK2HJ9x@Ansuel-xps.>
Date: Sun, 8 Oct 2023 20:27:28 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Eric Dumazet <edumazet@google.com>
Subject: Re: [net-next PATCH v2 4/4] netdev: use napi_schedule bool instead
 of napi_schedule_prep/__napi_schedule
References: <20231003145150.2498-1-ansuelsmth@gmail.com>
 <20231003145150.2498-4-ansuelsmth@gmail.com>
 <CANn89iLtYZJPOQE7OkAbEdmhT8qjzAJ+27poa__3c8Nf0M6u_w@mail.gmail.com>
 <652056c5.5d0a0220.2b60d.c5dc@mx.google.com>
 <CANn89i+Cie+oE_hTWkyJWutTG9CnPy+dbW+-A97Q+E9Rq-f9rQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANn89i+Cie+oE_hTWkyJWutTG9CnPy+dbW+-A97Q+E9Rq-f9rQ@mail.gmail.com>
X-Mailman-Approved-At: Mon, 09 Oct 2023 09:04:22 +1100
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

On Sun, Oct 08, 2023 at 09:08:41AM +0200, Eric Dumazet wrote:
> On Fri, Oct 6, 2023 at 8:49 PM Christian Marangi <ansuelsmth@gmail.com> wrote:
> >
> > On Thu, Oct 05, 2023 at 06:16:26PM +0200, Eric Dumazet wrote:
> > > On Tue, Oct 3, 2023 at 8:36 PM Christian Marangi <ansuelsmth@gmail.com> wrote:
> > > >
> > > > Replace if condition of napi_schedule_prep/__napi_schedule and use bool
> > > > from napi_schedule directly where possible.
> > > >
> > > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > > ---
> > > >  drivers/net/ethernet/atheros/atlx/atl1.c     | 4 +---
> > > >  drivers/net/ethernet/toshiba/tc35815.c       | 4 +---
> > > >  drivers/net/wireless/intel/iwlwifi/pcie/rx.c | 4 +---
> > > >  3 files changed, 3 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git a/drivers/net/ethernet/atheros/atlx/atl1.c b/drivers/net/ethernet/atheros/atlx/atl1.c
> > > > index 02aa6fd8ebc2..a9014d7932db 100644
> > > > --- a/drivers/net/ethernet/atheros/atlx/atl1.c
> > > > +++ b/drivers/net/ethernet/atheros/atlx/atl1.c
> > > > @@ -2446,7 +2446,7 @@ static int atl1_rings_clean(struct napi_struct *napi, int budget)
> > > >
> > > >  static inline int atl1_sched_rings_clean(struct atl1_adapter* adapter)
> > > >  {
> > > > -       if (!napi_schedule_prep(&adapter->napi))
> > > > +       if (!napi_schedule(&adapter->napi))
> > > >                 /* It is possible in case even the RX/TX ints are disabled via IMR
> > > >                  * register the ISR bits are set anyway (but do not produce IRQ).
> > > >                  * To handle such situation the napi functions used to check is
> > > > @@ -2454,8 +2454,6 @@ static inline int atl1_sched_rings_clean(struct atl1_adapter* adapter)
> > > >                  */
> > > >                 return 0;
> > > >
> > > > -       __napi_schedule(&adapter->napi);
> > > > -
> > > >         /*
> > > >          * Disable RX/TX ints via IMR register if it is
> > > >          * allowed. NAPI handler must reenable them in same
> > > > diff --git a/drivers/net/ethernet/toshiba/tc35815.c b/drivers/net/ethernet/toshiba/tc35815.c
> > > > index 14cf6ecf6d0d..a8b8a0e13f9a 100644
> > > > --- a/drivers/net/ethernet/toshiba/tc35815.c
> > > > +++ b/drivers/net/ethernet/toshiba/tc35815.c
> > > > @@ -1436,9 +1436,7 @@ static irqreturn_t tc35815_interrupt(int irq, void *dev_id)
> > > >         if (!(dmactl & DMA_IntMask)) {
> > > >                 /* disable interrupts */
> > > >                 tc_writel(dmactl | DMA_IntMask, &tr->DMA_Ctl);
> > > > -               if (napi_schedule_prep(&lp->napi))
> > > > -                       __napi_schedule(&lp->napi);
> > > > -               else {
> > > > +               if (!napi_schedule(&lp->napi)) {
> > > >                         printk(KERN_ERR "%s: interrupt taken in poll\n",
> > > >                                dev->name);
> > > >                         BUG();
> > >
> > > Hmmm... could you also remove this BUG() ? I think this code path can be taken
> > > if some applications are using busy polling.
> > >
> > > Or simply rewrite this with the traditional
> > >
> > > if (napi_schedule_prep(&lp->napi)) {
> > >    /* disable interrupts */
> > >    tc_writel(dmactl | DMA_IntMask, &tr->DMA_Ctl);
> > >     __napi_schedule(&lp->napi);
> > > }
> > >
> > >
> >
> > Mhhh is it safe to do so? I mean it seems very wrong to print a warning
> > and BUG() instead of disabling the interrupt only if napi can be
> > scheduled... Maybe is very old code? The more I see this the more I see
> > problem... (randomly disabling the interrupt and then make the kernel
> > die)
> 
> I am pretty sure this BUG() can be hit these days with busy polling or
> setting gro_flush_timeout.
> 
> I wish we could remove these bugs before someone copy-paste them.
> 
> Again, this is orthogonal, I might simply stop doing reviews if this
> is not useful.

They are very useful and thanks a lot for them! I'm asking these as to
understand how to proceed. I have in queue 2 other series that depends
on this and I'm just asking info on how to speedup the progress on this!

Soo think I have to send v3 with the suggested change and BUG() dropped?
Happy to do everything to fix and improve this series!

-- 
	Ansuel
