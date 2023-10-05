Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF347BAB9E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 22:48:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=LtuaGUTZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1kDR1hWyz3dmy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 07:48:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=LtuaGUTZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=edumazet@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1cBg0rxRz3vYv
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Oct 2023 03:16:42 +1100 (AEDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-51e24210395so15994a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Oct 2023 09:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696522598; x=1697127398; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LaaqTDoZqbafDQ3l5zFKWxmU6cOLxM0ZIJSzVNTzttI=;
        b=LtuaGUTZqiK/NeoYUERJcGBimPE8pE9R5cdN8EfetUhWuePaogklt6M8k7EzXsS8vo
         Cnk4lpXUQeB5n9e64dvMaLWdaKfzzcYHw7+TxFEcnpf6DScYWNhZXnOGFUCTllgR5Z2x
         MIhv/BO6rt7fapk/7mJIxMkXZJg4Cb4OfTtqURhsWIDg8iBS0EIfUYICmB4a3uhGWezC
         8c8RQ4nqoii1X7NRdNtv0EWMoqS2jxPZ0sM8XUXxje0siBe7NEUydWgz0+YDtd3h9Rf6
         XkR6Qs/XknQSsEnlS36grvTvC1srtlnPit/NnDVqjdQamnbMp+HWfsJ3CgqD1/rxqMGx
         cIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696522598; x=1697127398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LaaqTDoZqbafDQ3l5zFKWxmU6cOLxM0ZIJSzVNTzttI=;
        b=gFkyG2s0FQ2bcPn2WalmaTV2YwPTJx8z3xvmMOG8fYwCE3R7e+EiR7TGBToHE3rttd
         bNdsJHbf+Dwu744ndlAccT6tfoJK4jDWU+2BtpzUkTBFFfdolTQvksmxGbW9DM1kvztq
         RjSCjBUg8Hk5AVhr83YG8HHxOaXDrr8kEOj52UCrZwFAXNPU7H8K9azosNd/phOtLT0H
         PMGKEsEC+Ytn9va3ftWVwetfHoUh4oiNPsfnKEilTaa+IZL9LdwB2jQSYs0NJ/EO3l17
         RCGPEbqtvf3o1SKMnlIZT/rXWgmTIQ/3HX2dqJLsa2oF18jf8DmcJLVbzX1VdtRfK633
         AUzA==
X-Gm-Message-State: AOJu0Yyk34XAhHSfcbq67aCffOXYbIJcYeZItam0FBH+VC7Dzh6JhHEX
	JdQEtXEYlPxxds5ATXT5mM5TCn4Q6esAFKd6j2Vfbg==
X-Google-Smtp-Source: AGHT+IF0jOJDhaZhmEhxxLATvP2gGYnCETDcm8l2Y4huhZvHpOvz7u8otUILcV3a8DA5O+J6BhBCfMIuLNxeTSP/Dy0=
X-Received: by 2002:a50:8d5a:0:b0:538:2941:ad10 with SMTP id
 t26-20020a508d5a000000b005382941ad10mr73466edt.5.1696522598066; Thu, 05 Oct
 2023 09:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231003145150.2498-1-ansuelsmth@gmail.com> <20231003145150.2498-4-ansuelsmth@gmail.com>
In-Reply-To: <20231003145150.2498-4-ansuelsmth@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 5 Oct 2023 18:16:26 +0200
Message-ID: <CANn89iLtYZJPOQE7OkAbEdmhT8qjzAJ+27poa__3c8Nf0M6u_w@mail.gmail.com>
Subject: Re: [net-next PATCH v2 4/4] netdev: use napi_schedule bool instead of napi_schedule_prep/__napi_schedule
To: Christian Marangi <ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 06 Oct 2023 07:46:16 +1100
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

On Tue, Oct 3, 2023 at 8:36=E2=80=AFPM Christian Marangi <ansuelsmth@gmail.=
com> wrote:
>
> Replace if condition of napi_schedule_prep/__napi_schedule and use bool
> from napi_schedule directly where possible.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/net/ethernet/atheros/atlx/atl1.c     | 4 +---
>  drivers/net/ethernet/toshiba/tc35815.c       | 4 +---
>  drivers/net/wireless/intel/iwlwifi/pcie/rx.c | 4 +---
>  3 files changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/net/ethernet/atheros/atlx/atl1.c b/drivers/net/ether=
net/atheros/atlx/atl1.c
> index 02aa6fd8ebc2..a9014d7932db 100644
> --- a/drivers/net/ethernet/atheros/atlx/atl1.c
> +++ b/drivers/net/ethernet/atheros/atlx/atl1.c
> @@ -2446,7 +2446,7 @@ static int atl1_rings_clean(struct napi_struct *nap=
i, int budget)
>
>  static inline int atl1_sched_rings_clean(struct atl1_adapter* adapter)
>  {
> -       if (!napi_schedule_prep(&adapter->napi))
> +       if (!napi_schedule(&adapter->napi))
>                 /* It is possible in case even the RX/TX ints are disable=
d via IMR
>                  * register the ISR bits are set anyway (but do not produ=
ce IRQ).
>                  * To handle such situation the napi functions used to ch=
eck is
> @@ -2454,8 +2454,6 @@ static inline int atl1_sched_rings_clean(struct atl=
1_adapter* adapter)
>                  */
>                 return 0;
>
> -       __napi_schedule(&adapter->napi);
> -
>         /*
>          * Disable RX/TX ints via IMR register if it is
>          * allowed. NAPI handler must reenable them in same
> diff --git a/drivers/net/ethernet/toshiba/tc35815.c b/drivers/net/etherne=
t/toshiba/tc35815.c
> index 14cf6ecf6d0d..a8b8a0e13f9a 100644
> --- a/drivers/net/ethernet/toshiba/tc35815.c
> +++ b/drivers/net/ethernet/toshiba/tc35815.c
> @@ -1436,9 +1436,7 @@ static irqreturn_t tc35815_interrupt(int irq, void =
*dev_id)
>         if (!(dmactl & DMA_IntMask)) {
>                 /* disable interrupts */
>                 tc_writel(dmactl | DMA_IntMask, &tr->DMA_Ctl);
> -               if (napi_schedule_prep(&lp->napi))
> -                       __napi_schedule(&lp->napi);
> -               else {
> +               if (!napi_schedule(&lp->napi)) {
>                         printk(KERN_ERR "%s: interrupt taken in poll\n",
>                                dev->name);
>                         BUG();

Hmmm... could you also remove this BUG() ? I think this code path can be ta=
ken
if some applications are using busy polling.

Or simply rewrite this with the traditional

if (napi_schedule_prep(&lp->napi)) {
   /* disable interrupts */
   tc_writel(dmactl | DMA_IntMask, &tr->DMA_Ctl);
    __napi_schedule(&lp->napi);
}



> diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/rx.c b/drivers/net/w=
ireless/intel/iwlwifi/pcie/rx.c
> index 23b5a0adcbd6..146bc7bd14fb 100644
> --- a/drivers/net/wireless/intel/iwlwifi/pcie/rx.c
> +++ b/drivers/net/wireless/intel/iwlwifi/pcie/rx.c
> @@ -1660,9 +1660,7 @@ irqreturn_t iwl_pcie_irq_rx_msix_handler(int irq, v=
oid *dev_id)
>         IWL_DEBUG_ISR(trans, "[%d] Got interrupt\n", entry->entry);
>
>         local_bh_disable();
> -       if (napi_schedule_prep(&rxq->napi))
> -               __napi_schedule(&rxq->napi);
> -       else
> +       if (!napi_schedule(&rxq->napi))
>                 iwl_pcie_clear_irq(trans, entry->entry);

Same remark here about twisted logic.

>         local_bh_enable();
>
> --
> 2.40.1
>
