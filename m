Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A062C3377
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 22:46:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cgcz36dCzzDqSw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 08:46:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.196;
 helo=mail-oi1-f196.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cgcwz0f1fzDqSh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 08:44:17 +1100 (AEDT)
Received: by mail-oi1-f196.google.com with SMTP id w15so310278oie.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 13:44:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ynn4WsuenF5rxzvm4PJlKi7riFcaJvh4r7eszSzg7Ac=;
 b=qRzYMglsPtPneqLEEOy+aOfu/V9zx+Y1rgXMkYqAei0GKyaWLBUuah+O6C84awyZau
 BFuYG0zK+M+9zUOjQWAz7ROH8BE5fg9jTfCMb65+CT3J0zW/VonmVD8uDXAsKHP9eSmy
 y3Kwbgkqe50x3uqqjFpy43tHZhoVuzv8svd7oW9m76VaUci9HuxBeyoE9ihqPUef/hHX
 6hTBhUxfl2f8wH+9WLZ7HKAYHRyjBox9/uO8xt9vZQ+im2r7BFRew1nEJ4RF77swyD02
 DDXbfEmTlelRiAkTCpv/USjVPzV+JR06wJzOC1YykZyvOhtYx4p5O/vtaalYAi4Ixgv5
 osJQ==
X-Gm-Message-State: AOAM5334+bpimeZLCDIRJcSpLXzPg/xv+QYrt28ZpPWfEzlyZjN3eXA6
 onuvVJoDaWfJ1ZQinc6iOshApHimkjJhDA==
X-Google-Smtp-Source: ABdhPJxk9UrefNRNa0qOyDoALoCfWUNdetYHfiDQZYTrYcrR20Qku44LHi8d6sCoMBRSo/k+auM9cg==
X-Received: by 2002:aca:c492:: with SMTP id u140mr175738oif.51.1606254254407; 
 Tue, 24 Nov 2020 13:44:14 -0800 (PST)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com.
 [209.85.167.171])
 by smtp.gmail.com with ESMTPSA id c18sm122675oob.45.2020.11.24.13.44.13
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 13:44:13 -0800 (PST)
Received: by mail-oi1-f171.google.com with SMTP id d9so370166oib.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 13:44:13 -0800 (PST)
X-Received: by 2002:aca:db0b:: with SMTP id s11mr180582oig.51.1606254252864;
 Tue, 24 Nov 2020 13:44:12 -0800 (PST)
MIME-Version: 1.0
References: <20201124062234.678-1-liwei391@huawei.com>
In-Reply-To: <20201124062234.678-1-liwei391@huawei.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Tue, 24 Nov 2020 15:44:01 -0600
X-Gmail-Original-Message-ID: <CADRPPNQDW4w-4so=smxqLnkBpDzF82NPXmpZ-pyVz_aTwVzREw@mail.gmail.com>
Message-ID: <CADRPPNQDW4w-4so=smxqLnkBpDzF82NPXmpZ-pyVz_aTwVzREw@mail.gmail.com>
Subject: Re: [PATCH] net/ethernet/freescale: Fix incorrect IS_ERR_VALUE macro
 usages
To: Wei Li <liwei391@huawei.com>, Zhao Qiang <qiang.zhao@nxp.com>
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
Cc: Netdev <netdev@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Paul Gortmaker <paul.gortmaker@windriver.com>, guohanjun@huawei.com,
 Jakub Kicinski <kuba@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Timur Tabi <timur@freescale.com>, lkml <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 24, 2020 at 12:24 AM Wei Li <liwei391@huawei.com> wrote:
>
> IS_ERR_VALUE macro should be used only with unsigned long type.
> Especially it works incorrectly with unsigned shorter types on
> 64bit machines.

This is truly a problem for the driver to run on 64-bit architectures.
But from an earlier discussion
https://patchwork.kernel.org/project/linux-kbuild/patch/1464384685-347275-1-git-send-email-arnd@arndb.de/,
the preferred solution would be removing the IS_ERR_VALUE() usage or
make the values to be unsigned long.

It looks like we are having a bigger problem with the 64-bit support
for the driver that the offset variables can also be real pointers
which cannot be held with 32-bit data types(when uf_info->bd_mem_part
== MEM_PART_SYSTEM).  So actually we have to change these offsets to
unsigned long, otherwise we are having more serious issues on 64-bit
systems.  Are you willing to make such changes or you want us to deal
with it?

Regards,
Leo
>
> Fixes: 4c35630ccda5 ("[POWERPC] Change rheap functions to use ulongs instead of pointers")
> Signed-off-by: Wei Li <liwei391@huawei.com>
> ---
>  drivers/net/ethernet/freescale/ucc_geth.c | 30 +++++++++++------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
> index 714b501be7d0..8656d9be256a 100644
> --- a/drivers/net/ethernet/freescale/ucc_geth.c
> +++ b/drivers/net/ethernet/freescale/ucc_geth.c
> @@ -286,7 +286,7 @@ static int fill_init_enet_entries(struct ucc_geth_private *ugeth,
>                 else {
>                         init_enet_offset =
>                             qe_muram_alloc(thread_size, thread_alignment);
> -                       if (IS_ERR_VALUE(init_enet_offset)) {
> +                       if (IS_ERR_VALUE((unsigned long)(int)init_enet_offset)) {
>                                 if (netif_msg_ifup(ugeth))
>                                         pr_err("Can not allocate DPRAM memory\n");
>                                 qe_put_snum((u8) snum);
> @@ -2223,7 +2223,7 @@ static int ucc_geth_alloc_tx(struct ucc_geth_private *ugeth)
>                         ugeth->tx_bd_ring_offset[j] =
>                             qe_muram_alloc(length,
>                                            UCC_GETH_TX_BD_RING_ALIGNMENT);
> -                       if (!IS_ERR_VALUE(ugeth->tx_bd_ring_offset[j]))
> +                       if (!IS_ERR_VALUE((unsigned long)(int)ugeth->tx_bd_ring_offset[j]))
>                                 ugeth->p_tx_bd_ring[j] =
>                                     (u8 __iomem *) qe_muram_addr(ugeth->
>                                                          tx_bd_ring_offset[j]);
> @@ -2300,7 +2300,7 @@ static int ucc_geth_alloc_rx(struct ucc_geth_private *ugeth)
>                         ugeth->rx_bd_ring_offset[j] =
>                             qe_muram_alloc(length,
>                                            UCC_GETH_RX_BD_RING_ALIGNMENT);
> -                       if (!IS_ERR_VALUE(ugeth->rx_bd_ring_offset[j]))
> +                       if (!IS_ERR_VALUE((unsigned long)(int)ugeth->rx_bd_ring_offset[j]))
>                                 ugeth->p_rx_bd_ring[j] =
>                                     (u8 __iomem *) qe_muram_addr(ugeth->
>                                                          rx_bd_ring_offset[j]);
> @@ -2510,7 +2510,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
>         ugeth->tx_glbl_pram_offset =
>             qe_muram_alloc(sizeof(struct ucc_geth_tx_global_pram),
>                            UCC_GETH_TX_GLOBAL_PRAM_ALIGNMENT);
> -       if (IS_ERR_VALUE(ugeth->tx_glbl_pram_offset)) {
> +       if (IS_ERR_VALUE((unsigned long)(int)ugeth->tx_glbl_pram_offset)) {
>                 if (netif_msg_ifup(ugeth))
>                         pr_err("Can not allocate DPRAM memory for p_tx_glbl_pram\n");
>                 return -ENOMEM;
> @@ -2530,7 +2530,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
>                            sizeof(struct ucc_geth_thread_data_tx) +
>                            32 * (numThreadsTxNumerical == 1),
>                            UCC_GETH_THREAD_DATA_ALIGNMENT);
> -       if (IS_ERR_VALUE(ugeth->thread_dat_tx_offset)) {
> +       if (IS_ERR_VALUE((unsigned long)(int)ugeth->thread_dat_tx_offset)) {
>                 if (netif_msg_ifup(ugeth))
>                         pr_err("Can not allocate DPRAM memory for p_thread_data_tx\n");
>                 return -ENOMEM;
> @@ -2557,7 +2557,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
>             qe_muram_alloc(ug_info->numQueuesTx *
>                            sizeof(struct ucc_geth_send_queue_qd),
>                            UCC_GETH_SEND_QUEUE_QUEUE_DESCRIPTOR_ALIGNMENT);
> -       if (IS_ERR_VALUE(ugeth->send_q_mem_reg_offset)) {
> +       if (IS_ERR_VALUE((unsigned long)(int)ugeth->send_q_mem_reg_offset)) {
>                 if (netif_msg_ifup(ugeth))
>                         pr_err("Can not allocate DPRAM memory for p_send_q_mem_reg\n");
>                 return -ENOMEM;
> @@ -2597,7 +2597,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
>                 ugeth->scheduler_offset =
>                     qe_muram_alloc(sizeof(struct ucc_geth_scheduler),
>                                    UCC_GETH_SCHEDULER_ALIGNMENT);
> -               if (IS_ERR_VALUE(ugeth->scheduler_offset)) {
> +               if (IS_ERR_VALUE((unsigned long)(int)ugeth->scheduler_offset)) {
>                         if (netif_msg_ifup(ugeth))
>                                 pr_err("Can not allocate DPRAM memory for p_scheduler\n");
>                         return -ENOMEM;
> @@ -2644,7 +2644,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
>                     qe_muram_alloc(sizeof
>                                    (struct ucc_geth_tx_firmware_statistics_pram),
>                                    UCC_GETH_TX_STATISTICS_ALIGNMENT);
> -               if (IS_ERR_VALUE(ugeth->tx_fw_statistics_pram_offset)) {
> +               if (IS_ERR_VALUE((unsigned long)(int)ugeth->tx_fw_statistics_pram_offset)) {
>                         if (netif_msg_ifup(ugeth))
>                                 pr_err("Can not allocate DPRAM memory for p_tx_fw_statistics_pram\n");
>                         return -ENOMEM;
> @@ -2681,7 +2681,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
>         ugeth->rx_glbl_pram_offset =
>             qe_muram_alloc(sizeof(struct ucc_geth_rx_global_pram),
>                            UCC_GETH_RX_GLOBAL_PRAM_ALIGNMENT);
> -       if (IS_ERR_VALUE(ugeth->rx_glbl_pram_offset)) {
> +       if (IS_ERR_VALUE((unsigned long)(int)ugeth->rx_glbl_pram_offset)) {
>                 if (netif_msg_ifup(ugeth))
>                         pr_err("Can not allocate DPRAM memory for p_rx_glbl_pram\n");
>                 return -ENOMEM;
> @@ -2700,7 +2700,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
>             qe_muram_alloc(numThreadsRxNumerical *
>                            sizeof(struct ucc_geth_thread_data_rx),
>                            UCC_GETH_THREAD_DATA_ALIGNMENT);
> -       if (IS_ERR_VALUE(ugeth->thread_dat_rx_offset)) {
> +       if (IS_ERR_VALUE((unsigned long)(int)ugeth->thread_dat_rx_offset)) {
>                 if (netif_msg_ifup(ugeth))
>                         pr_err("Can not allocate DPRAM memory for p_thread_data_rx\n");
>                 return -ENOMEM;
> @@ -2721,7 +2721,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
>                     qe_muram_alloc(sizeof
>                                    (struct ucc_geth_rx_firmware_statistics_pram),
>                                    UCC_GETH_RX_STATISTICS_ALIGNMENT);
> -               if (IS_ERR_VALUE(ugeth->rx_fw_statistics_pram_offset)) {
> +               if (IS_ERR_VALUE((unsigned long)(int)ugeth->rx_fw_statistics_pram_offset)) {
>                         if (netif_msg_ifup(ugeth))
>                                 pr_err("Can not allocate DPRAM memory for p_rx_fw_statistics_pram\n");
>                         return -ENOMEM;
> @@ -2741,7 +2741,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
>             qe_muram_alloc(ug_info->numQueuesRx *
>                            sizeof(struct ucc_geth_rx_interrupt_coalescing_entry)
>                            + 4, UCC_GETH_RX_INTERRUPT_COALESCING_ALIGNMENT);
> -       if (IS_ERR_VALUE(ugeth->rx_irq_coalescing_tbl_offset)) {
> +       if (IS_ERR_VALUE((unsigned long)(int)ugeth->rx_irq_coalescing_tbl_offset)) {
>                 if (netif_msg_ifup(ugeth))
>                         pr_err("Can not allocate DPRAM memory for p_rx_irq_coalescing_tbl\n");
>                 return -ENOMEM;
> @@ -2807,7 +2807,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
>                            (sizeof(struct ucc_geth_rx_bd_queues_entry) +
>                             sizeof(struct ucc_geth_rx_prefetched_bds)),
>                            UCC_GETH_RX_BD_QUEUES_ALIGNMENT);
> -       if (IS_ERR_VALUE(ugeth->rx_bd_qs_tbl_offset)) {
> +       if (IS_ERR_VALUE((unsigned long)(int)ugeth->rx_bd_qs_tbl_offset)) {
>                 if (netif_msg_ifup(ugeth))
>                         pr_err("Can not allocate DPRAM memory for p_rx_bd_qs_tbl\n");
>                 return -ENOMEM;
> @@ -2892,7 +2892,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
>                 ugeth->exf_glbl_param_offset =
>                     qe_muram_alloc(sizeof(struct ucc_geth_exf_global_pram),
>                 UCC_GETH_RX_EXTENDED_FILTERING_GLOBAL_PARAMETERS_ALIGNMENT);
> -               if (IS_ERR_VALUE(ugeth->exf_glbl_param_offset)) {
> +               if (IS_ERR_VALUE((unsigned long)(int)ugeth->exf_glbl_param_offset)) {
>                         if (netif_msg_ifup(ugeth))
>                                 pr_err("Can not allocate DPRAM memory for p_exf_glbl_param\n");
>                         return -ENOMEM;
> @@ -3026,7 +3026,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
>
>         /* Allocate InitEnet command parameter structure */
>         init_enet_pram_offset = qe_muram_alloc(sizeof(struct ucc_geth_init_pram), 4);
> -       if (IS_ERR_VALUE(init_enet_pram_offset)) {
> +       if (IS_ERR_VALUE((unsigned long)(int)init_enet_pram_offset)) {
>                 if (netif_msg_ifup(ugeth))
>                         pr_err("Can not allocate DPRAM memory for p_init_enet_pram\n");
>                 return -ENOMEM;
> --
> 2.17.1
>
