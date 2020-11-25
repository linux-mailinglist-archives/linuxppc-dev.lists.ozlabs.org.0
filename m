Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E86B2C466F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 18:07:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch6kv3nFCzDr3S
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 04:07:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.194;
 helo=mail-oi1-f194.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch6hs3yygzDqxM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 04:05:33 +1100 (AEDT)
Received: by mail-oi1-f194.google.com with SMTP id k26so3610788oiw.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 09:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=66hK+x8MOztYdNh6ON8lDh+n74E/tNY57VcvkTE3Zw4=;
 b=BA60fczdpeo9kU9/f61Cq53/XJASgwxbyfbwdbPEkLMjng8OE56wSBGKm2aJKIMrwB
 VyG/KQiBp9sZYLu16euvUwSMX6982VRvUdtw1Ru8ZqFcbVFap3mbWcjps2X/DNjnY8tm
 q72vR9La0gScky/wd6ruVcIuFR2dY9WD79sM8Qo/9VAOtyQu9JPvlfzr1Sh7LjleuaJw
 aOlS5yqBo1iLC+rn2ocg9jDTKa9xejRxTNCx38J4SI0sAnc12h1t0+Gm06+miTDE/0aR
 GGTv+WpMAKs9GdGQXL6uSReCuS9Q8GUKqVhc2PToQmod13kTMt2FWiAe2SZPpLIh/WIH
 sq3A==
X-Gm-Message-State: AOAM5327FDWhEJb5ZYHxfOiGf8GEM+1iWtELZj/IrV/VTfJmwzceW/IT
 MiU5MAdb7DLYNKU9FM5yx0RR2uKeJcQ=
X-Google-Smtp-Source: ABdhPJx4blsheiDXEidwXG6mmYB+nq6HmZTZewI/FXeik7tBDCIIfTrpEClwgOczXqFIYtOCOwzAaw==
X-Received: by 2002:aca:bdc4:: with SMTP id n187mr2794900oif.154.1606323928657; 
 Wed, 25 Nov 2020 09:05:28 -0800 (PST)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com.
 [209.85.210.42])
 by smtp.gmail.com with ESMTPSA id m109sm1464287otc.30.2020.11.25.09.05.27
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2020 09:05:27 -0800 (PST)
Received: by mail-ot1-f42.google.com with SMTP id h39so1171733otb.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 09:05:27 -0800 (PST)
X-Received: by 2002:a05:6830:160d:: with SMTP id
 g13mr3778972otr.74.1606323927481; 
 Wed, 25 Nov 2020 09:05:27 -0800 (PST)
MIME-Version: 1.0
References: <20201124062234.678-1-liwei391@huawei.com>
 <CADRPPNQDW4w-4so=smxqLnkBpDzF82NPXmpZ-pyVz_aTwVzREw@mail.gmail.com>
 <CADRPPNTpOsp-mrzvR-=c6SqHuNfyx7y9+1p+x0ft4qu-mD_xcA@mail.gmail.com>
 <2a03fb50-7900-d6e9-bbd6-0ad45b003657@huawei.com>
In-Reply-To: <2a03fb50-7900-d6e9-bbd6-0ad45b003657@huawei.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Wed, 25 Nov 2020 11:05:15 -0600
X-Gmail-Original-Message-ID: <CADRPPNR-QaMiuBG5fZ=_reNwZNAM5sUuaKTp6CR4xWhUsK91kw@mail.gmail.com>
Message-ID: <CADRPPNR-QaMiuBG5fZ=_reNwZNAM5sUuaKTp6CR4xWhUsK91kw@mail.gmail.com>
Subject: Re: [PATCH] net/ethernet/freescale: Fix incorrect IS_ERR_VALUE macro
 usages
To: "liwei (GF)" <liwei391@huawei.com>
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
Cc: Netdev <netdev@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Timur Tabi <timur@freescale.com>,
 Paul Gortmaker <paul.gortmaker@windriver.com>, guohanjun@huawei.com,
 Jakub Kicinski <kuba@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>, Zhao Qiang <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 24, 2020 at 8:00 PM liwei (GF) <liwei391@huawei.com> wrote:
>
> Hi Yang,
>
> On 2020/11/25 6:13, Li Yang wrote:
> > On Tue, Nov 24, 2020 at 3:44 PM Li Yang <leoyang.li@nxp.com> wrote:
> >>
> >> On Tue, Nov 24, 2020 at 12:24 AM Wei Li <liwei391@huawei.com> wrote:
> >>>
> >>> IS_ERR_VALUE macro should be used only with unsigned long type.
> >>> Especially it works incorrectly with unsigned shorter types on
> >>> 64bit machines.
> >>
> >> This is truly a problem for the driver to run on 64-bit architectures.
> >> But from an earlier discussion
> >> https://patchwork.kernel.org/project/linux-kbuild/patch/1464384685-347275-1-git-send-email-arnd@arndb.de/,
> >> the preferred solution would be removing the IS_ERR_VALUE() usage or
> >> make the values to be unsigned long.
> >>
> >> It looks like we are having a bigger problem with the 64-bit support
> >> for the driver that the offset variables can also be real pointers
> >> which cannot be held with 32-bit data types(when uf_info->bd_mem_part
> >> == MEM_PART_SYSTEM).  So actually we have to change these offsets to
> >> unsigned long, otherwise we are having more serious issues on 64-bit
> >> systems.  Are you willing to make such changes or you want us to deal
> >> with it?
> >
> > Well, it looks like this hardware block was never integrated on a
> > 64-bit SoC and will very likely to keep so.  So probably we can keep
> > the driver 32-bit only.  It is currently limited to PPC32 in Kconfig,
> > how did you build it for 64-bit?
> >
> >>
>
> Thank you for providing the earlier discussion archive. In fact, this
> issue is detected by our static analysis tool.

Thanks for the effort, but this probably is a false positive for the
static analysis tool as the 64-bit case is not buildable.

>
> From my view, there is no harm to fix these potential misuses. But if you
> really have decided to keep the driver 32-bit only, please just ingore this patch.

It is not an easy task to add proper 64-bit support, so probably we
just keep it 32-bit only for now.  Thanks for the patch anyway.

Regards,
Leo

>
> Thanks,
> Wei
>
> >>>
> >>> Fixes: 4c35630ccda5 ("[POWERPC] Change rheap functions to use ulongs instead of pointers")
> >>> Signed-off-by: Wei Li <liwei391@huawei.com>
> >>> ---
> >>>  drivers/net/ethernet/freescale/ucc_geth.c | 30 +++++++++++------------
> >>>  1 file changed, 15 insertions(+), 15 deletions(-)
> >>>
> >>> diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
> >>> index 714b501be7d0..8656d9be256a 100644
> >>> --- a/drivers/net/ethernet/freescale/ucc_geth.c
> >>> +++ b/drivers/net/ethernet/freescale/ucc_geth.c
> >>> @@ -286,7 +286,7 @@ static int fill_init_enet_entries(struct ucc_geth_private *ugeth,
> >>>                 else {
> >>>                         init_enet_offset =
> >>>                             qe_muram_alloc(thread_size, thread_alignment);
> >>> -                       if (IS_ERR_VALUE(init_enet_offset)) {
> >>> +                       if (IS_ERR_VALUE((unsigned long)(int)init_enet_offset)) {
> >>>                                 if (netif_msg_ifup(ugeth))
> >>>                                         pr_err("Can not allocate DPRAM memory\n");
> >>>                                 qe_put_snum((u8) snum);
> >>> @@ -2223,7 +2223,7 @@ static int ucc_geth_alloc_tx(struct ucc_geth_private *ugeth)
> >>>                         ugeth->tx_bd_ring_offset[j] =
> >>>                             qe_muram_alloc(length,
> >>>                                            UCC_GETH_TX_BD_RING_ALIGNMENT);
> >>> -                       if (!IS_ERR_VALUE(ugeth->tx_bd_ring_offset[j]))
> >>> +                       if (!IS_ERR_VALUE((unsigned long)(int)ugeth->tx_bd_ring_offset[j]))
> >>>                                 ugeth->p_tx_bd_ring[j] =
> >>>                                     (u8 __iomem *) qe_muram_addr(ugeth->
> >>>                                                          tx_bd_ring_offset[j]);
> >>> @@ -2300,7 +2300,7 @@ static int ucc_geth_alloc_rx(struct ucc_geth_private *ugeth)
> >>>                         ugeth->rx_bd_ring_offset[j] =
> >>>                             qe_muram_alloc(length,
> >>>                                            UCC_GETH_RX_BD_RING_ALIGNMENT);
> >>> -                       if (!IS_ERR_VALUE(ugeth->rx_bd_ring_offset[j]))
> >>> +                       if (!IS_ERR_VALUE((unsigned long)(int)ugeth->rx_bd_ring_offset[j]))
> >>>                                 ugeth->p_rx_bd_ring[j] =
> >>>                                     (u8 __iomem *) qe_muram_addr(ugeth->
> >>>                                                          rx_bd_ring_offset[j]);
> >>> @@ -2510,7 +2510,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
> >>>         ugeth->tx_glbl_pram_offset =
> >>>             qe_muram_alloc(sizeof(struct ucc_geth_tx_global_pram),
> >>>                            UCC_GETH_TX_GLOBAL_PRAM_ALIGNMENT);
> >>> -       if (IS_ERR_VALUE(ugeth->tx_glbl_pram_offset)) {
> >>> +       if (IS_ERR_VALUE((unsigned long)(int)ugeth->tx_glbl_pram_offset)) {
> >>>                 if (netif_msg_ifup(ugeth))
> >>>                         pr_err("Can not allocate DPRAM memory for p_tx_glbl_pram\n");
> >>>                 return -ENOMEM;
> >>> @@ -2530,7 +2530,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
> >>>                            sizeof(struct ucc_geth_thread_data_tx) +
> >>>                            32 * (numThreadsTxNumerical == 1),
> >>>                            UCC_GETH_THREAD_DATA_ALIGNMENT);
> >>> -       if (IS_ERR_VALUE(ugeth->thread_dat_tx_offset)) {
> >>> +       if (IS_ERR_VALUE((unsigned long)(int)ugeth->thread_dat_tx_offset)) {
> >>>                 if (netif_msg_ifup(ugeth))
> >>>                         pr_err("Can not allocate DPRAM memory for p_thread_data_tx\n");
> >>>                 return -ENOMEM;
> >>> @@ -2557,7 +2557,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
> >>>             qe_muram_alloc(ug_info->numQueuesTx *
> >>>                            sizeof(struct ucc_geth_send_queue_qd),
> >>>                            UCC_GETH_SEND_QUEUE_QUEUE_DESCRIPTOR_ALIGNMENT);
> >>> -       if (IS_ERR_VALUE(ugeth->send_q_mem_reg_offset)) {
> >>> +       if (IS_ERR_VALUE((unsigned long)(int)ugeth->send_q_mem_reg_offset)) {
> >>>                 if (netif_msg_ifup(ugeth))
> >>>                         pr_err("Can not allocate DPRAM memory for p_send_q_mem_reg\n");
> >>>                 return -ENOMEM;
> >>> @@ -2597,7 +2597,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
> >>>                 ugeth->scheduler_offset =
> >>>                     qe_muram_alloc(sizeof(struct ucc_geth_scheduler),
> >>>                                    UCC_GETH_SCHEDULER_ALIGNMENT);
> >>> -               if (IS_ERR_VALUE(ugeth->scheduler_offset)) {
> >>> +               if (IS_ERR_VALUE((unsigned long)(int)ugeth->scheduler_offset)) {
> >>>                         if (netif_msg_ifup(ugeth))
> >>>                                 pr_err("Can not allocate DPRAM memory for p_scheduler\n");
> >>>                         return -ENOMEM;
> >>> @@ -2644,7 +2644,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
> >>>                     qe_muram_alloc(sizeof
> >>>                                    (struct ucc_geth_tx_firmware_statistics_pram),
> >>>                                    UCC_GETH_TX_STATISTICS_ALIGNMENT);
> >>> -               if (IS_ERR_VALUE(ugeth->tx_fw_statistics_pram_offset)) {
> >>> +               if (IS_ERR_VALUE((unsigned long)(int)ugeth->tx_fw_statistics_pram_offset)) {
> >>>                         if (netif_msg_ifup(ugeth))
> >>>                                 pr_err("Can not allocate DPRAM memory for p_tx_fw_statistics_pram\n");
> >>>                         return -ENOMEM;
> >>> @@ -2681,7 +2681,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
> >>>         ugeth->rx_glbl_pram_offset =
> >>>             qe_muram_alloc(sizeof(struct ucc_geth_rx_global_pram),
> >>>                            UCC_GETH_RX_GLOBAL_PRAM_ALIGNMENT);
> >>> -       if (IS_ERR_VALUE(ugeth->rx_glbl_pram_offset)) {
> >>> +       if (IS_ERR_VALUE((unsigned long)(int)ugeth->rx_glbl_pram_offset)) {
> >>>                 if (netif_msg_ifup(ugeth))
> >>>                         pr_err("Can not allocate DPRAM memory for p_rx_glbl_pram\n");
> >>>                 return -ENOMEM;
> >>> @@ -2700,7 +2700,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
> >>>             qe_muram_alloc(numThreadsRxNumerical *
> >>>                            sizeof(struct ucc_geth_thread_data_rx),
> >>>                            UCC_GETH_THREAD_DATA_ALIGNMENT);
> >>> -       if (IS_ERR_VALUE(ugeth->thread_dat_rx_offset)) {
> >>> +       if (IS_ERR_VALUE((unsigned long)(int)ugeth->thread_dat_rx_offset)) {
> >>>                 if (netif_msg_ifup(ugeth))
> >>>                         pr_err("Can not allocate DPRAM memory for p_thread_data_rx\n");
> >>>                 return -ENOMEM;
> >>> @@ -2721,7 +2721,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
> >>>                     qe_muram_alloc(sizeof
> >>>                                    (struct ucc_geth_rx_firmware_statistics_pram),
> >>>                                    UCC_GETH_RX_STATISTICS_ALIGNMENT);
> >>> -               if (IS_ERR_VALUE(ugeth->rx_fw_statistics_pram_offset)) {
> >>> +               if (IS_ERR_VALUE((unsigned long)(int)ugeth->rx_fw_statistics_pram_offset)) {
> >>>                         if (netif_msg_ifup(ugeth))
> >>>                                 pr_err("Can not allocate DPRAM memory for p_rx_fw_statistics_pram\n");
> >>>                         return -ENOMEM;
> >>> @@ -2741,7 +2741,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
> >>>             qe_muram_alloc(ug_info->numQueuesRx *
> >>>                            sizeof(struct ucc_geth_rx_interrupt_coalescing_entry)
> >>>                            + 4, UCC_GETH_RX_INTERRUPT_COALESCING_ALIGNMENT);
> >>> -       if (IS_ERR_VALUE(ugeth->rx_irq_coalescing_tbl_offset)) {
> >>> +       if (IS_ERR_VALUE((unsigned long)(int)ugeth->rx_irq_coalescing_tbl_offset)) {
> >>>                 if (netif_msg_ifup(ugeth))
> >>>                         pr_err("Can not allocate DPRAM memory for p_rx_irq_coalescing_tbl\n");
> >>>                 return -ENOMEM;
> >>> @@ -2807,7 +2807,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
> >>>                            (sizeof(struct ucc_geth_rx_bd_queues_entry) +
> >>>                             sizeof(struct ucc_geth_rx_prefetched_bds)),
> >>>                            UCC_GETH_RX_BD_QUEUES_ALIGNMENT);
> >>> -       if (IS_ERR_VALUE(ugeth->rx_bd_qs_tbl_offset)) {
> >>> +       if (IS_ERR_VALUE((unsigned long)(int)ugeth->rx_bd_qs_tbl_offset)) {
> >>>                 if (netif_msg_ifup(ugeth))
> >>>                         pr_err("Can not allocate DPRAM memory for p_rx_bd_qs_tbl\n");
> >>>                 return -ENOMEM;
> >>> @@ -2892,7 +2892,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
> >>>                 ugeth->exf_glbl_param_offset =
> >>>                     qe_muram_alloc(sizeof(struct ucc_geth_exf_global_pram),
> >>>                 UCC_GETH_RX_EXTENDED_FILTERING_GLOBAL_PARAMETERS_ALIGNMENT);
> >>> -               if (IS_ERR_VALUE(ugeth->exf_glbl_param_offset)) {
> >>> +               if (IS_ERR_VALUE((unsigned long)(int)ugeth->exf_glbl_param_offset)) {
> >>>                         if (netif_msg_ifup(ugeth))
> >>>                                 pr_err("Can not allocate DPRAM memory for p_exf_glbl_param\n");
> >>>                         return -ENOMEM;
> >>> @@ -3026,7 +3026,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
> >>>
> >>>         /* Allocate InitEnet command parameter structure */
> >>>         init_enet_pram_offset = qe_muram_alloc(sizeof(struct ucc_geth_init_pram), 4);
> >>> -       if (IS_ERR_VALUE(init_enet_pram_offset)) {
> >>> +       if (IS_ERR_VALUE((unsigned long)(int)init_enet_pram_offset)) {
> >>>                 if (netif_msg_ifup(ugeth))
> >>>                         pr_err("Can not allocate DPRAM memory for p_init_enet_pram\n");
> >>>                 return -ENOMEM;
> >>> --
> >>> 2.17.1
> >>>
