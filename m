Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6B47BCA70
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Oct 2023 01:38:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iWV9RYpD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S31vS1GWHz3vXp
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Oct 2023 10:38:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iWV9RYpD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=ansuelsmth@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2HcZ45Rgz3clc
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Oct 2023 05:53:02 +1100 (AEDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-32167a4adaaso2156547f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Oct 2023 11:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696618378; x=1697223178; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X70lVOFCcfRrz5BPTne6oD5pXVKA4lkjxXDB0TaolDY=;
        b=iWV9RYpDVaGNkKUrwFg8N+LQWjQlWuwk7zh8gPGCDJgVWsY8vkkJaacdY7sEfGDqDw
         JEbQvVl6E4/2yeyklHfcvt0GuhKiDiyFrg/dzOFFYdPhZjM2NWGOmDfK8TaHtgsSNf2r
         Tv2cWRCUvl4MBvBwruiclLKKWE+sRvkyV7jzZYeKdImH5FpKJK/LVTFmbh4TkFS+bZJY
         kSuOKO83WhXQUiWQ636so6MO352UZBUnCpKXpueX+GKF8um5dbT6tNSdXjLmwYCg6z5d
         UVKJNTUN4xkNQTnfGtyT7j89ARm6VaplSmA4PdFKl9Q/82nTmh29VjAiRSUVnqdJvGg4
         qH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696618378; x=1697223178;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X70lVOFCcfRrz5BPTne6oD5pXVKA4lkjxXDB0TaolDY=;
        b=m99PAqvnPGUtWzb0Yb8M6nk2fQ7aNAqZ048+P7GG6hWX2MJWvcrqy8sHr0cID7EeWm
         PzDRcCKaiQqskDL44WwGxxEuJd6VF6/sAgwI6QdraoIyNhRaTxRRWzUijIek1HVaQi+/
         h5VG/RrT2kuvVjmRiZo2gvm8Tsi/QElYN4UaJRl7S++Af4O0IJOg8NyWh8g0gfbahIUA
         XkEDXdpnti/M6WaHpLiiC9AMMNmivPsTdRDRH5gu1a05OcfHvyZtbVKf1CCVRxLMKd7t
         kSz86+AbAMUi9tEZsxjfbJbSEoZVZuFcZeB320sggwjAk5iu/ARBOyu0cuwzqIKZEFnD
         2Iow==
X-Gm-Message-State: AOJu0YwQpxhaRVyh8rRZaQFs6IVApEK7fgvGhu4rOl5TZuItjmBbrxkq
	bz6kpNRiaNhZGxByr4iQGnE=
X-Google-Smtp-Source: AGHT+IG8xdl5PYYzmkg371/9IVLxOcEUg0/AO4c3FMmCpHBI1rBYraaud13cZvVNCZmgDH81LCr6PA==
X-Received: by 2002:a5d:4d8e:0:b0:324:7bdd:678e with SMTP id b14-20020a5d4d8e000000b003247bdd678emr7728648wru.60.1696618377892;
        Fri, 06 Oct 2023 11:52:57 -0700 (PDT)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id h9-20020a5d5489000000b003179d5aee67sm2231805wrv.94.2023.10.06.11.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 11:52:57 -0700 (PDT)
Message-ID: <65205789.5d0a0220.7e49b.ccb0@mx.google.com>
X-Google-Original-Message-ID: <ZSBXiecYhFuSdjkC@Ansuel-xps.>
Date: Fri, 6 Oct 2023 20:52:57 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Eric Dumazet <edumazet@google.com>
Subject: Re: [net-next PATCH v2 3/4] netdev: replace napi_reschedule with
 napi_schedule
References: <20231003145150.2498-1-ansuelsmth@gmail.com>
 <20231003145150.2498-3-ansuelsmth@gmail.com>
 <CANn89iK226C-pHUJm7HKMyEtMycGC=KCA2M6kw2KJaUj0cCT6w@mail.gmail.com>
 <20231005093253.2e25533a@kernel.org>
 <CANn89iJQ50AdXP2C1YB2pGjE02WCJ-QCsZqE1yGXtcGsfLA0Jw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANn89iJQ50AdXP2C1YB2pGjE02WCJ-QCsZqE1yGXtcGsfLA0Jw@mail.gmail.com>
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

On Thu, Oct 05, 2023 at 06:41:03PM +0200, Eric Dumazet wrote:
> On Thu, Oct 5, 2023 at 6:32 PM Jakub Kicinski <kuba@kernel.org> wrote:
> >
> > On Thu, 5 Oct 2023 18:11:56 +0200 Eric Dumazet wrote:
> > > OK, but I suspect some users of napi_reschedule() might not be race-free...
> >
> > What's the race you're thinking of?
> 
> This sort of thing... the race is in fl_starving() though...
> 
> diff --git a/drivers/net/ethernet/chelsio/cxgb4/sge.c
> b/drivers/net/ethernet/chelsio/cxgb4/sge.c
> index 98dd78551d89..b5ff2e1a9975 100644
> --- a/drivers/net/ethernet/chelsio/cxgb4/sge.c
> +++ b/drivers/net/ethernet/chelsio/cxgb4/sge.c
> @@ -4261,7 +4261,7 @@ static void sge_rx_timer_cb(struct timer_list *t)
> 
>                         if (fl_starving(adap, fl)) {
>                                 rxq = container_of(fl, struct sge_eth_rxq, fl);
> -                               if (napi_reschedule(&rxq->rspq.napi))
> +                               if (napi_schedule(&rxq->rspq.napi))
>                                         fl->starving++;
>                                 else
>                                         set_bit(id, s->starving_fl);

Ehhh problem is that this is a simple rename so if any race is present,
it's already there and not caused by this rename :(

Don't know maybe this is out of scope and should be investigated with a
bug report?

Maybe this should be changed to prep/__schedule to prevent any kind of
race? But doing so doesn't prevent any kind of ""starving""?

-- 
	Ansuel
