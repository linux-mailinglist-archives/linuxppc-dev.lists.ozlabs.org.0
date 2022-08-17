Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E554597441
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 18:38:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7DGm1mdnz3c1S
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 02:38:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VBUye23L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VBUye23L;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7DG85TzJz2ynh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 02:37:52 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B6DDDB81E2D;
	Wed, 17 Aug 2022 16:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1CC8C433C1;
	Wed, 17 Aug 2022 16:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660754268;
	bh=ChY/NZMOAOlqoGoJVP4+NAx1PcZylsw2XHwXej60YBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VBUye23LFXjoO9GsgScgaowL/DDIgdFrHVl4y9tUiFrMQAbB/knLyvTLzRouVH5kU
	 MPIKGWi46RLZlvn0v665i6LqPZz9QoGI+PDrIlU+97Wn43DFaAo6WAEST7p2LetBHW
	 rAuplGor/gIreBASxg3NRvowFW/ISSP9YZX5loOWebgZ/QPNgu4HxgLgXIv6/u1H+j
	 bxvzc2VRwCWRiwX1YicGKXWYT09a4Sf88GEZQAsAgKzPUjhOR5qwlq7HqYuH4SFfzf
	 g5V5uRH55M46lxmy7+auZ8yxsmSC6RWNd9YulvW2GXbzeBp04f3T16VTn1Rp+X/nhV
	 U2TEIKsYoerkA==
Received: by pali.im (Postfix)
	id B92E1739; Wed, 17 Aug 2022 18:37:44 +0200 (CEST)
Date: Wed, 17 Aug 2022 18:37:44 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pci: Fix get_phb_number() locking
Message-ID: <20220817163744.6p7v66xlkylikeuh@pali>
References: <20220815065550.1303620-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220815065550.1303620-1-mpe@ellerman.id.au>
User-Agent: NeoMutt/20180716
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
Cc: linuxppc-dev@lists.ozlabs.org, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday 15 August 2022 16:55:50 Michael Ellerman wrote:
> The recent change to get_phb_number() causes a DEBUG_ATOMIC_SLEEP
> warning on some systems:
> 
>   BUG: sleeping function called from invalid context at kernel/locking/mutex.c:580
>   in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1, name: swapper
>   preempt_count: 1, expected: 0
>   RCU nest depth: 0, expected: 0
>   1 lock held by swapper/1:
>    #0: c157efb0 (hose_spinlock){+.+.}-{2:2}, at: pcibios_alloc_controller+0x64/0x220
>   Preemption disabled at:
>   [<00000000>] 0x0
>   CPU: 0 PID: 1 Comm: swapper Not tainted 5.19.0-yocto-standard+ #1
>   Call Trace:
>   [d101dc90] [c073b264] dump_stack_lvl+0x50/0x8c (unreliable)
>   [d101dcb0] [c0093b70] __might_resched+0x258/0x2a8
>   [d101dcd0] [c0d3e634] __mutex_lock+0x6c/0x6ec
>   [d101dd50] [c0a84174] of_alias_get_id+0x50/0xf4
>   [d101dd80] [c002ec78] pcibios_alloc_controller+0x1b8/0x220
>   [d101ddd0] [c140c9dc] pmac_pci_init+0x198/0x784
>   [d101de50] [c140852c] discover_phbs+0x30/0x4c
>   [d101de60] [c0007fd4] do_one_initcall+0x94/0x344
>   [d101ded0] [c1403b40] kernel_init_freeable+0x1a8/0x22c
>   [d101df10] [c00086e0] kernel_init+0x34/0x160
>   [d101df30] [c001b334] ret_from_kernel_thread+0x5c/0x64
> 
> This is because pcibios_alloc_controller() holds hose_spinlock but
> of_alias_get_id() takes of_mutex which can sleep.
> 
> The hose_spinlock protects the phb_bitmap, and also the hose_list, but
> it doesn't need to be held while get_phb_number() calls the OF routines,
> because those are only looking up information in the device tree.
> 
> So fix it by having get_phb_number() take the hose_spinlock itself, only
> where required, and then dropping the lock before returning.
> pcibios_alloc_controller() then needs to take the lock again before the
> list_add() but that's safe, the order of the list is not important.
> 
> Fixes: 0fe1e96fef0a ("powerpc/pci: Prefer PCI domain assignment via DT 'linux,pci-domain' and alias")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Thanks for fixing it!

Acked-by: Pali Rohár <pali@kernel.org>

> ---
>  arch/powerpc/kernel/pci-common.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
> index bdd3332200c5..31de91c8359c 100644
> --- a/arch/powerpc/kernel/pci-common.c
> +++ b/arch/powerpc/kernel/pci-common.c
> @@ -68,10 +68,6 @@ void __init set_pci_dma_ops(const struct dma_map_ops *dma_ops)
>  	pci_dma_ops = dma_ops;
>  }
>  
> -/*
> - * This function should run under locking protection, specifically
> - * hose_spinlock.
> - */
>  static int get_phb_number(struct device_node *dn)
>  {
>  	int ret, phb_id = -1;
> @@ -108,15 +104,20 @@ static int get_phb_number(struct device_node *dn)
>  	if (!ret)
>  		phb_id = (int)(prop & (MAX_PHBS - 1));
>  
> +	spin_lock(&hose_spinlock);
> +
>  	/* We need to be sure to not use the same PHB number twice. */
>  	if ((phb_id >= 0) && !test_and_set_bit(phb_id, phb_bitmap))
> -		return phb_id;
> +		goto out_unlock;
>  
>  	/* If everything fails then fallback to dynamic PHB numbering. */
>  	phb_id = find_first_zero_bit(phb_bitmap, MAX_PHBS);
>  	BUG_ON(phb_id >= MAX_PHBS);
>  	set_bit(phb_id, phb_bitmap);
>  
> +out_unlock:
> +	spin_unlock(&hose_spinlock);
> +
>  	return phb_id;
>  }
>  
> @@ -127,10 +128,13 @@ struct pci_controller *pcibios_alloc_controller(struct device_node *dev)
>  	phb = zalloc_maybe_bootmem(sizeof(struct pci_controller), GFP_KERNEL);
>  	if (phb == NULL)
>  		return NULL;
> -	spin_lock(&hose_spinlock);
> +
>  	phb->global_number = get_phb_number(dev);
> +
> +	spin_lock(&hose_spinlock);
>  	list_add_tail(&phb->list_node, &hose_list);
>  	spin_unlock(&hose_spinlock);
> +
>  	phb->dn = dev;
>  	phb->is_dynamic = slab_is_available();
>  #ifdef CONFIG_PPC64
> -- 
> 2.37.1
> 
