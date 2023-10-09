Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC9B7BD784
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 11:47:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=NCev0E5a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3vMz1qXfz3ckl
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 20:47:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=NCev0E5a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=edumazet@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3sbn5Trwz307V
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 19:27:48 +1100 (AEDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-534694a9f26so9673a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Oct 2023 01:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696840064; x=1697444864; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/6BMjrzXld+2G2niRt8GwZnrjwExfOE5RsZF3IWDsg=;
        b=NCev0E5aszBfDV0OUgsZFimM3+Y5knKpc2myCJJ5sh4bIP+hlpomezkAirDVOHP4ow
         cGtAB/2XC3bFQSgU45sLWY194wbqQmycNLnq4fQilXNY3o5v/gWosaRyl6BNXqhyqGEq
         gZd5gMk0Lk8zl7thaWfWm5mwpjkTPE1TJMf1sF79TT/MJko5CUxEpMd+iaj+9WcMFVDy
         iAAvLJuLvUSJe/AICbWeOXSn5kH0B8iwEFY7T0rZBXHz3SYqvL3GavD6eLqoHxkiZLPR
         enyLuCHYWJHye+XpOM23NgUO5cwDWitmlmieAU9NPKSjFJoXRF3FtLQoaZ3IVd/pt4ii
         Xrig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696840064; x=1697444864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/6BMjrzXld+2G2niRt8GwZnrjwExfOE5RsZF3IWDsg=;
        b=GCwfd+bYjinOnHOMZ3XQHAlOXZ+q4mJz2yKe9HblDYuwSpnZRjtQCfyJXjoixsBzOc
         WyuRsYScpDmmA+3Wu07b0jNnKblhdjINOdLasM8KT7OjE6TfrwDsrWzD1OYNoCxzBaeW
         Ti9L3YEGgIAgf1TU0Lr+JpJBsI76CX0F+04oqVMx4tzJaV4D89BdYr/CuqmrwLnSYl3G
         DqVOmr/UKT0TZFvmbRcrt/BWvWz1RZNfIpRC2k2ZckFAyz4hJbMyscCLBK+0/A8MgU2L
         Zaoe6KIzlR6H72Ub59yCCLJQ+NOevw98EVUt6mZ9u7GfH018nIn1Y8NJF9Qzbd4LtQhW
         eGXA==
X-Gm-Message-State: AOJu0YwAnlc/9R45Vvu4vnR38xULo+k3A9wpd29fKPRp6PR+SWAjzDes
	y8w32dF1qwxeXBth9sJBX5gaMZ6MaKZ3GbvoHfPKYg==
X-Google-Smtp-Source: AGHT+IHwFKC+Y1e+xZpwgUIz2ef+3S7gZvKInf35YDgwedW3l6WDYZ0JQtR1RAcQrjw2Yv9CI2XyHOq3oVUBlcAavLI=
X-Received: by 2002:a50:9fa4:0:b0:538:5f9e:f0fc with SMTP id
 c33-20020a509fa4000000b005385f9ef0fcmr350450edf.0.1696840063815; Mon, 09 Oct
 2023 01:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20231003145150.2498-1-ansuelsmth@gmail.com> <20231003145150.2498-4-ansuelsmth@gmail.com>
 <CANn89iLtYZJPOQE7OkAbEdmhT8qjzAJ+27poa__3c8Nf0M6u_w@mail.gmail.com>
 <652056c5.5d0a0220.2b60d.c5dc@mx.google.com> <CANn89i+Cie+oE_hTWkyJWutTG9CnPy+dbW+-A97Q+E9Rq-f9rQ@mail.gmail.com>
 <6522f495.df0a0220.326ed.de6c@mx.google.com>
In-Reply-To: <6522f495.df0a0220.326ed.de6c@mx.google.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 9 Oct 2023 10:27:32 +0200
Message-ID: <CANn89iLLsM8=fqoa_7O8iYyCzT2ebNs_jpY+e-RW+xCc7UnSDg@mail.gmail.com>
Subject: Re: [net-next PATCH v2 4/4] netdev: use napi_schedule bool instead of napi_schedule_prep/__napi_schedule
To: Christian Marangi <ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 09 Oct 2023 20:46:10 +1100
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

On Sun, Oct 8, 2023 at 8:27=E2=80=AFPM Christian Marangi <ansuelsmth@gmail.=
com> wrote:
>
> On Sun, Oct 08, 2023 at 09:08:41AM +0200, Eric Dumazet wrote:
> > On Fri, Oct 6, 2023 at 8:49=E2=80=AFPM Christian Marangi <ansuelsmth@gm=
ail.com> wrote:
> > >
> > > On Thu, Oct 05, 2023 at 06:16:26PM +0200, Eric Dumazet wrote:
> > > > On Tue, Oct 3, 2023 at 8:36=E2=80=AFPM Christian Marangi <ansuelsmt=
h@gmail.com> wrote:
> > > > >
> > > > > Replace if condition of napi_schedule_prep/__napi_schedule and us=
e bool
> > > > > from napi_schedule directly where possible.
> > > > >
> > > > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > > > ---
> > > > >  drivers/net/ethernet/atheros/atlx/atl1.c     | 4 +---
> > > > >  drivers/net/ethernet/toshiba/tc35815.c       | 4 +---
> > > > >  drivers/net/wireless/intel/iwlwifi/pcie/rx.c | 4 +---
> > > > >  3 files changed, 3 insertions(+), 9 deletions(-)
> > > > >
> > > > > diff --git a/drivers/net/ethernet/atheros/atlx/atl1.c b/drivers/n=
et/ethernet/atheros/atlx/atl1.c
> > > > > index 02aa6fd8ebc2..a9014d7932db 100644
> > > > > --- a/drivers/net/ethernet/atheros/atlx/atl1.c
> > > > > +++ b/drivers/net/ethernet/atheros/atlx/atl1.c
> > > > > @@ -2446,7 +2446,7 @@ static int atl1_rings_clean(struct napi_str=
uct *napi, int budget)
> > > > >
> > > > >  static inline int atl1_sched_rings_clean(struct atl1_adapter* ad=
apter)
> > > > >  {
> > > > > -       if (!napi_schedule_prep(&adapter->napi))
> > > > > +       if (!napi_schedule(&adapter->napi))
> > > > >                 /* It is possible in case even the RX/TX ints are=
 disabled via IMR
> > > > >                  * register the ISR bits are set anyway (but do n=
ot produce IRQ).
> > > > >                  * To handle such situation the napi functions us=
ed to check is
> > > > > @@ -2454,8 +2454,6 @@ static inline int atl1_sched_rings_clean(st=
ruct atl1_adapter* adapter)
> > > > >                  */
> > > > >                 return 0;
> > > > >
> > > > > -       __napi_schedule(&adapter->napi);
> > > > > -
> > > > >         /*
> > > > >          * Disable RX/TX ints via IMR register if it is
> > > > >          * allowed. NAPI handler must reenable them in same
> > > > > diff --git a/drivers/net/ethernet/toshiba/tc35815.c b/drivers/net=
/ethernet/toshiba/tc35815.c
> > > > > index 14cf6ecf6d0d..a8b8a0e13f9a 100644
> > > > > --- a/drivers/net/ethernet/toshiba/tc35815.c
> > > > > +++ b/drivers/net/ethernet/toshiba/tc35815.c
> > > > > @@ -1436,9 +1436,7 @@ static irqreturn_t tc35815_interrupt(int ir=
q, void *dev_id)
> > > > >         if (!(dmactl & DMA_IntMask)) {
> > > > >                 /* disable interrupts */
> > > > >                 tc_writel(dmactl | DMA_IntMask, &tr->DMA_Ctl);
> > > > > -               if (napi_schedule_prep(&lp->napi))
> > > > > -                       __napi_schedule(&lp->napi);
> > > > > -               else {
> > > > > +               if (!napi_schedule(&lp->napi)) {
> > > > >                         printk(KERN_ERR "%s: interrupt taken in p=
oll\n",
> > > > >                                dev->name);
> > > > >                         BUG();
> > > >
> > > > Hmmm... could you also remove this BUG() ? I think this code path c=
an be taken
> > > > if some applications are using busy polling.
> > > >
> > > > Or simply rewrite this with the traditional
> > > >
> > > > if (napi_schedule_prep(&lp->napi)) {
> > > >    /* disable interrupts */
> > > >    tc_writel(dmactl | DMA_IntMask, &tr->DMA_Ctl);
> > > >     __napi_schedule(&lp->napi);
> > > > }
> > > >
> > > >
> > >
> > > Mhhh is it safe to do so? I mean it seems very wrong to print a warni=
ng
> > > and BUG() instead of disabling the interrupt only if napi can be
> > > scheduled... Maybe is very old code? The more I see this the more I s=
ee
> > > problem... (randomly disabling the interrupt and then make the kernel
> > > die)
> >
> > I am pretty sure this BUG() can be hit these days with busy polling or
> > setting gro_flush_timeout.
> >
> > I wish we could remove these bugs before someone copy-paste them.
> >
> > Again, this is orthogonal, I might simply stop doing reviews if this
> > is not useful.
>
> They are very useful and thanks a lot for them! I'm asking these as to
> understand how to proceed. I have in queue 2 other series that depends
> on this and I'm just asking info on how to speedup the progress on this!
>
> Soo think I have to send v3 with the suggested change and BUG() dropped?
> Happy to do everything to fix and improve this series!

I think that your patch series is all about doing cleanups,
so I suggested adding another cleanup/fix,
and this can be done independently.

I doubt this matters, this code has probably not been used for quite a
long time...
