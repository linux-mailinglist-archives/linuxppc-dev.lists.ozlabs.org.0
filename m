Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF67A7BCE35
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Oct 2023 13:34:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=FrYzB8Yk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3KnT6Cz4z3cGC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Oct 2023 22:34:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=FrYzB8Yk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=edumazet@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3CvJ2Gkgz3cTd
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Oct 2023 18:08:59 +1100 (AEDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-534694a9f26so5456a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 Oct 2023 00:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696748935; x=1697353735; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6boweBsbEPYLh1haUGvUFhb+7tfvWfkGzP1aLPKTUnI=;
        b=FrYzB8YkxLELZVxioUGy4I0Yusgp4iTvuD9czfZtVWdCm4fO0s6vfOTe+2Q9e3ZnFP
         9Rvk+k8GZ9XKi5GdY4RSyjYsTOboH18rDR7+i7c1sw4ncD0Dk7XTMMZGkVaUEZ9SYFFC
         75rvF1gJLv9lT3WgpHOp+66HtWTxNoxbh2CFABANfuL9XjcPgAvD4w5sah9POiewcdEx
         sUYJHmJTBBajSroqNLfJ4DOedvHTRb87V0oLGpbGK4P27m5rRr+Jn6mifdtclVISdRxb
         9YdlY7CPuVZRU3cmy1zjo/xlbKuPvWjZHhCcp3Xy2hrtytv3Ksgbc1uJ4xAHoyTxWfUr
         6zJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696748935; x=1697353735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6boweBsbEPYLh1haUGvUFhb+7tfvWfkGzP1aLPKTUnI=;
        b=D9m/xPC0tqv5wY0DYzO4HUnZ1v49YUZCv2w3p9OzwfH3SumlIFHQtw+3Q1kbERzGne
         v+W1v012s9JYnHScvcYXOgV4ZNVAIM2q+aqcxpmrRJczIMNVs7Iu4kPOq6dCi0UCr+LA
         dJxLprdJ33vLwj9PZPIUs9wy4G8EEUfdO08GkFLM5uvgXG6lFfEF4npPhk0NEGnOp7Xk
         L5HVcJeU2PT2FV0Cd15HNeVI/07LMCHi3KIX4e6u9BCapWlavkgQICOGZ4Kj73mlDFmI
         Vyt8zjkqyjV1ZGFysnVO/6dth/BYpr0pq007gzFQeMQ6TzP2eO9U2cScmAqcqR1uHd7L
         AmNg==
X-Gm-Message-State: AOJu0YwazUWlF4sX79c/lnmBCDV6ww2e9RLCDAdEQIlX7qBPrKw033bM
	xRBBQfz6VVJkxuVbz9TR1LhBmlXrOTqbsoDvTjmKWQ==
X-Google-Smtp-Source: AGHT+IEVhxr/hi+K678k9mZTv6OusdxrCYSsJHysJnZbWTvXJuhiZ+72RbS/nL58DWxeXDrsThbghNBmT+06iJCcOf8=
X-Received: by 2002:a50:9f6c:0:b0:52e:f99a:b5f8 with SMTP id
 b99-20020a509f6c000000b0052ef99ab5f8mr308559edf.7.1696748935193; Sun, 08 Oct
 2023 00:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231003145150.2498-1-ansuelsmth@gmail.com> <20231003145150.2498-4-ansuelsmth@gmail.com>
 <CANn89iLtYZJPOQE7OkAbEdmhT8qjzAJ+27poa__3c8Nf0M6u_w@mail.gmail.com> <652056c5.5d0a0220.2b60d.c5dc@mx.google.com>
In-Reply-To: <652056c5.5d0a0220.2b60d.c5dc@mx.google.com>
From: Eric Dumazet <edumazet@google.com>
Date: Sun, 8 Oct 2023 09:08:41 +0200
Message-ID: <CANn89i+Cie+oE_hTWkyJWutTG9CnPy+dbW+-A97Q+E9Rq-f9rQ@mail.gmail.com>
Subject: Re: [net-next PATCH v2 4/4] netdev: use napi_schedule bool instead of napi_schedule_prep/__napi_schedule
To: Christian Marangi <ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 08 Oct 2023 22:32:48 +1100
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
  =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-wireless@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>, Wolfgang Grandegger <wg@grandegger.com>, Nick Child <nnac123@linux.ibm.com>, Simon Horman <horms@kernel.org>, Liu Haijun <haijun.liu@mediatek.com>, Kalle Valo <kvalo@kernel.org>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, Yuanjun Gong <ruc_gongyuanjun@163.com>, Shailend Chand <shailend@google.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Benjamin Berg <benjamin.berg@intel.com>, M Chetan Kumar <m.chetan.kumar@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Coco Li <lixiaoyan@google.com>, linux-arm-kernel@lists.infradead.org, Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>, Ricardo Martinez <ricardo.martinez@linux.intel.com>, Loic Poulain <loic.poulain@linaro.org>, Zheng Zengkai <zhengzengkai@huawei.com>, Maximilian Lu
 z <luzmaximilian@gmail.com>, Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Douglas Miller <dougmill@linux.ibm.com>, linux-kernel@vger.kernel.org, Tariq Toukan <tariqt@nvidia.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Junfeng Guo <junfeng.guo@intel.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Raju Rangoju <rajur@chelsio.com>, Praveen Kaligineedi <pkaligineedi@google.com>, Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson <quic_jjohnson@quicinc.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 6, 2023 at 8:49=E2=80=AFPM Christian Marangi <ansuelsmth@gmail.=
com> wrote:
>
> On Thu, Oct 05, 2023 at 06:16:26PM +0200, Eric Dumazet wrote:
> > On Tue, Oct 3, 2023 at 8:36=E2=80=AFPM Christian Marangi <ansuelsmth@gm=
ail.com> wrote:
> > >
> > > Replace if condition of napi_schedule_prep/__napi_schedule and use bo=
ol
> > > from napi_schedule directly where possible.
> > >
> > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > ---
> > >  drivers/net/ethernet/atheros/atlx/atl1.c     | 4 +---
> > >  drivers/net/ethernet/toshiba/tc35815.c       | 4 +---
> > >  drivers/net/wireless/intel/iwlwifi/pcie/rx.c | 4 +---
> > >  3 files changed, 3 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/net/ethernet/atheros/atlx/atl1.c b/drivers/net/e=
thernet/atheros/atlx/atl1.c
> > > index 02aa6fd8ebc2..a9014d7932db 100644
> > > --- a/drivers/net/ethernet/atheros/atlx/atl1.c
> > > +++ b/drivers/net/ethernet/atheros/atlx/atl1.c
> > > @@ -2446,7 +2446,7 @@ static int atl1_rings_clean(struct napi_struct =
*napi, int budget)
> > >
> > >  static inline int atl1_sched_rings_clean(struct atl1_adapter* adapte=
r)
> > >  {
> > > -       if (!napi_schedule_prep(&adapter->napi))
> > > +       if (!napi_schedule(&adapter->napi))
> > >                 /* It is possible in case even the RX/TX ints are dis=
abled via IMR
> > >                  * register the ISR bits are set anyway (but do not p=
roduce IRQ).
> > >                  * To handle such situation the napi functions used t=
o check is
> > > @@ -2454,8 +2454,6 @@ static inline int atl1_sched_rings_clean(struct=
 atl1_adapter* adapter)
> > >                  */
> > >                 return 0;
> > >
> > > -       __napi_schedule(&adapter->napi);
> > > -
> > >         /*
> > >          * Disable RX/TX ints via IMR register if it is
> > >          * allowed. NAPI handler must reenable them in same
> > > diff --git a/drivers/net/ethernet/toshiba/tc35815.c b/drivers/net/eth=
ernet/toshiba/tc35815.c
> > > index 14cf6ecf6d0d..a8b8a0e13f9a 100644
> > > --- a/drivers/net/ethernet/toshiba/tc35815.c
> > > +++ b/drivers/net/ethernet/toshiba/tc35815.c
> > > @@ -1436,9 +1436,7 @@ static irqreturn_t tc35815_interrupt(int irq, v=
oid *dev_id)
> > >         if (!(dmactl & DMA_IntMask)) {
> > >                 /* disable interrupts */
> > >                 tc_writel(dmactl | DMA_IntMask, &tr->DMA_Ctl);
> > > -               if (napi_schedule_prep(&lp->napi))
> > > -                       __napi_schedule(&lp->napi);
> > > -               else {
> > > +               if (!napi_schedule(&lp->napi)) {
> > >                         printk(KERN_ERR "%s: interrupt taken in poll\=
n",
> > >                                dev->name);
> > >                         BUG();
> >
> > Hmmm... could you also remove this BUG() ? I think this code path can b=
e taken
> > if some applications are using busy polling.
> >
> > Or simply rewrite this with the traditional
> >
> > if (napi_schedule_prep(&lp->napi)) {
> >    /* disable interrupts */
> >    tc_writel(dmactl | DMA_IntMask, &tr->DMA_Ctl);
> >     __napi_schedule(&lp->napi);
> > }
> >
> >
>
> Mhhh is it safe to do so? I mean it seems very wrong to print a warning
> and BUG() instead of disabling the interrupt only if napi can be
> scheduled... Maybe is very old code? The more I see this the more I see
> problem... (randomly disabling the interrupt and then make the kernel
> die)

I am pretty sure this BUG() can be hit these days with busy polling or
setting gro_flush_timeout.

I wish we could remove these bugs before someone copy-paste them.

Again, this is orthogonal, I might simply stop doing reviews if this
is not useful.
