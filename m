Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7CF7BCE32
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Oct 2023 13:33:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JQlcXDiF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3KmX3DFrz3cVj
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Oct 2023 22:33:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JQlcXDiF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=edumazet@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3Cjt3YbSz2ytj
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Oct 2023 18:00:49 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-534694a9f26so5420a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 Oct 2023 00:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696748442; x=1697353242; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mH8rgsD0Hcv//mdO9CGjCjg749l4skH04u5NpNfXSJo=;
        b=JQlcXDiF6DmfZHjGCFjn6MSixLYXVSWFLXdv3N0HppbywJ7SrCdFD1SCg3XV/y1ioT
         QJSMCldrneeydRosBAPvjBOr81fyIan7uttgECBVTUSTJqKFbpyQnkvzp1Xq+WuopBOy
         FUCfw8HkXgBUsLYLM5Y28fsZ465e51OumyJa0JtA5OUMQc1pC5iB/14UM+ZxuGePOpKe
         moBrJJbYE0vIHS88NY2YNC6XVRGksZ3zKmmrShs5ApZ4eoYohqzpjo592FQ6IoSAWUcj
         id7eMsNF2e8ZgwWjwYgqqVkjAPGl0RQ9Qaf4i/o3SBNcCgRLmQWir0JFWdu1H1z9NZdh
         PWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696748442; x=1697353242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mH8rgsD0Hcv//mdO9CGjCjg749l4skH04u5NpNfXSJo=;
        b=EvtQp5OI6KVws528sp496Ra3Ifmi2XwuuoHh1WHwb6bEoM3yfsUQZz9WLdfAZnR4qd
         1gxaCJq5HKrNKY4ivbQtL4SUQi8FUvOqAyakgpadseLtWn/Ig7+muuZIS/2A3hbdFLGF
         lg9e/Y5bGdILPP8pa0DOnJNBbN8Gun2qrPntUK/0F02w6dV0KW+eU6kimIrtb1Hr/G4+
         EZOfaou1aKOVQUfBq844hQxpWH+Y4StlhAIjFR3mUl55ayHGL/5ReSgwrMPi5moIEGF5
         yaA5nFiUp0kX1AWcpDd3UtJjRuUtWpJlJGqAkvpOR5giz7vHHoXpkROpWZaUgIwBQ4cn
         bBhA==
X-Gm-Message-State: AOJu0YyM7jxOpxUd9dPzdBcyzAMhgXNziomMpPyIeVZeXvtiiXRExELP
	v4p1kGLzVSPT1BR+cOQpKEE8jt1y9416vT6bcvXnuA==
X-Google-Smtp-Source: AGHT+IEsm3Yaeezo31ko5A6vpc3J66AXEC7Qr6Rm72BDJiSgp93BqqzS34935wa+NNU03Xl/ZB6KCTMLkH8SD9/RjuM=
X-Received: by 2002:a50:9fa4:0:b0:538:5f9e:f0fc with SMTP id
 c33-20020a509fa4000000b005385f9ef0fcmr307070edf.0.1696748442128; Sun, 08 Oct
 2023 00:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231003145150.2498-1-ansuelsmth@gmail.com> <20231003145150.2498-3-ansuelsmth@gmail.com>
 <CANn89iK226C-pHUJm7HKMyEtMycGC=KCA2M6kw2KJaUj0cCT6w@mail.gmail.com>
 <20231005093253.2e25533a@kernel.org> <CANn89iJQ50AdXP2C1YB2pGjE02WCJ-QCsZqE1yGXtcGsfLA0Jw@mail.gmail.com>
 <65205789.5d0a0220.7e49b.ccb0@mx.google.com>
In-Reply-To: <65205789.5d0a0220.7e49b.ccb0@mx.google.com>
From: Eric Dumazet <edumazet@google.com>
Date: Sun, 8 Oct 2023 09:00:29 +0200
Message-ID: <CANn89i+ntByi2709y10PN6cgri-b0EWxPSNXdu_Nf2nOvJ45FQ@mail.gmail.com>
Subject: Re: [net-next PATCH v2 3/4] netdev: replace napi_reschedule with napi_schedule
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

On Fri, Oct 6, 2023 at 8:52=E2=80=AFPM Christian Marangi <ansuelsmth@gmail.=
com> wrote:
>
> On Thu, Oct 05, 2023 at 06:41:03PM +0200, Eric Dumazet wrote:
> > On Thu, Oct 5, 2023 at 6:32=E2=80=AFPM Jakub Kicinski <kuba@kernel.org>=
 wrote:
> > >
> > > On Thu, 5 Oct 2023 18:11:56 +0200 Eric Dumazet wrote:
> > > > OK, but I suspect some users of napi_reschedule() might not be race=
-free...
> > >
> > > What's the race you're thinking of?
> >
> > This sort of thing... the race is in fl_starving() though...
> >
> > diff --git a/drivers/net/ethernet/chelsio/cxgb4/sge.c
> > b/drivers/net/ethernet/chelsio/cxgb4/sge.c
> > index 98dd78551d89..b5ff2e1a9975 100644
> > --- a/drivers/net/ethernet/chelsio/cxgb4/sge.c
> > +++ b/drivers/net/ethernet/chelsio/cxgb4/sge.c
> > @@ -4261,7 +4261,7 @@ static void sge_rx_timer_cb(struct timer_list *t)
> >
> >                         if (fl_starving(adap, fl)) {
> >                                 rxq =3D container_of(fl, struct sge_eth=
_rxq, fl);
> > -                               if (napi_reschedule(&rxq->rspq.napi))
> > +                               if (napi_schedule(&rxq->rspq.napi))
> >                                         fl->starving++;
> >                                 else
> >                                         set_bit(id, s->starving_fl);
>
> Ehhh problem is that this is a simple rename so if any race is present,
> it's already there and not caused by this rename :(
>
> Don't know maybe this is out of scope and should be investigated with a
> bug report?
>
> Maybe this should be changed to prep/__schedule to prevent any kind of
> race? But doing so doesn't prevent any kind of ""starving""?
>

I gave a "Reviewed-by: Eric Dumazet <edumazet@google.com>", meaning
your patch was ok for me.

My remark was orthogonal, I am not asking you to act on it ;)
