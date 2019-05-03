Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DB112965
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 10:00:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wPgk152qzDqxQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 18:00:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wNKf0jNPzDqQ0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 16:59:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 44wNKc5PzHz9sPf; Fri,  3 May 2019 16:59:32 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: b2d3b5ee66f2a04a918cc043cec0c9ed3de58f40
X-Patchwork-Hint: ignore
In-Reply-To: <153849454718.31242.7801365038229982137.stgit@ltcalpine2-lp14.aus.stglabs.ibm.com>
To: Nathan Fontenot <nfont@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/pseries: Track LMB nid instead of using device
 tree
Message-Id: <44wNKc5PzHz9sPf@ozlabs.org>
Date: Fri,  3 May 2019 16:59:32 +1000 (AEST)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2018-10-02 at 15:35:59 UTC, Nathan Fontenot wrote:
> When removing memory we need to remove the memory from the node
> it was added to instead of looking up the node it should be in
> in the device tree.
> 
> During testing we have seen scenarios where the affinity for a
> LMB changes due to a partition migration or PRRN event. In these
> cases the node the LMB exists in may not match the node the device
> tree indicates it belongs in. This can lead to a system crash
> when trying to DLPAR remove the LMB after a migration or PRRN
> event. The current code looks up the node in the device tree to
> remove the LMB from, the crash occurs when we try to offline this
> node and it does not have any data, i.e. node_data[nid] == NULL.
> 
> 36:mon> e
> cpu 0x36: Vector: 300 (Data Access) at [c0000001828b7810]
>     pc: c00000000036d08c: try_offline_node+0x2c/0x1b0
>     lr: c0000000003a14ec: remove_memory+0xbc/0x110
>     sp: c0000001828b7a90
>    msr: 800000000280b033
>    dar: 9a28
>  dsisr: 40000000
>   current = 0xc0000006329c4c80
>   paca    = 0xc000000007a55200   softe: 0        irq_happened: 0x01
>     pid   = 76926, comm = kworker/u320:3
> 
> 36:mon> t
> [link register   ] c0000000003a14ec remove_memory+0xbc/0x110
> [c0000001828b7a90] c00000000006a1cc arch_remove_memory+0x9c/0xd0 (unreliable)
> [c0000001828b7ad0] c0000000003a14e0 remove_memory+0xb0/0x110
> [c0000001828b7b20] c0000000000c7db4 dlpar_remove_lmb+0x94/0x160
> [c0000001828b7b60] c0000000000c8ef8 dlpar_memory+0x7e8/0xd10
> [c0000001828b7bf0] c0000000000bf828 handle_dlpar_errorlog+0xf8/0x160
> [c0000001828b7c60] c0000000000bf8cc pseries_hp_work_fn+0x3c/0xa0
> [c0000001828b7c90] c000000000128cd8 process_one_work+0x298/0x5a0
> [c0000001828b7d20] c000000000129068 worker_thread+0x88/0x620
> [c0000001828b7dc0] c00000000013223c kthread+0x1ac/0x1c0
> [c0000001828b7e30] c00000000000b45c ret_from_kernel_thread+0x5c/0x80
> 
> To resolve this we need to track the node a LMB belongs to when
> it is added to the system so we can remove it from that node instead
> of the node that the device tree indicates it should belong to.
> 
> Signed-off-by: Nathan Fontenot <nfont@linux.vnet.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/b2d3b5ee66f2a04a918cc043cec0c9ed

cheers
