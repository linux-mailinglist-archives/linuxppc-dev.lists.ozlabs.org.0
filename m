Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDD545AFEF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 00:15:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzKjn4tsbz302G
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 10:15:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nVXZ5iZt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzKj65v9Tz2xrP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 10:14:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=nVXZ5iZt; 
 dkim-atps=neutral
Received: by gandalf.ozlabs.org (Postfix)
 id 4HzKj60YwZz4xcv; Wed, 24 Nov 2021 10:14:34 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HzKj6040Pz4xcK;
 Wed, 24 Nov 2021 10:14:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1637709274;
 bh=EpGbxhcItglhJBefq3DjKP76FHcnzorqGMxJ7hVYIrk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=nVXZ5iZt48VqshMY3It0JzO1RkrCEKiWgggz9wcyn2nyLohuao3tH6rKYldY/aCeT
 fCh6eRXiUpwjc1xqWvVtgeV89Qr4AgyKg9vtHeGd0528fJZ4T7kiaZHGvb8vgYFUak
 dUy6y88gT3hzXeI8xnmMul9jy3a9Nh7H4W5ebcb21XG+pZO8zH0eRbfT7EX/cJ2pKT
 RRzO1w5sqIYN1H15SwMpDSLgZAN3w1z/fz+6vy8qQEDxNCyc31fXdNhclvOGOoMNDu
 ovZ5iaZfRmOwiRgFFNaR+p4rGuCd0Q1NjlSrOobxuTYSuEB+NSgnld3ZQewapRQfkH
 nfxD5p4bnt3Qw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>, linuxppc-dev
 <linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH] powerpc/eeh: Delay slot presence check once driver is
 notified about the pci error.
In-Reply-To: <163767273634.1368569.7327743414665595326.stgit@jupiter>
References: <163767273634.1368569.7327743414665595326.stgit@jupiter>
Date: Wed, 24 Nov 2021 10:14:30 +1100
Message-ID: <875ysiqxbd.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mahesh Salgaonkar <mahesh@linux.ibm.com> writes:
> When certain PHB HW failure causes phyp to recover PHB, it marks the PE
> state as temporarily unavailable until recovery is complete. This also
> triggers an EEH handler in Linux which needs to notify drivers, and perform
> recovery. But before notifying the driver about the pci error it uses
> get_adapter_state()->get-sesnor-state() operation of the hotplug_slot to
> determine if the slot contains a device or not. if the slot is empty, the
> recovery is skipped entirely.
>
> However on certain PHB failures, the rtas call get-sesnor-state() returns
> extended busy error (9902) until PHB is recovered by phyp. Once PHB is
> recovered, the get-sensor-state() returns success with correct presence
> status. The rtas call interface rtas_get_sensor() loops over the rtas call
> on extended delay return code (9902) until the return value is either
> success (0) or error (-1). This causes the EEH handler to get stuck for ~6
> seconds before it could notify that the pci error has been detected and
> stop any active operations. Hence with running I/O traffic, during this 6
> seconds, the network driver continues its operation and hits a timeout
> (netdev watchdog). On timeouts, network driver go into ffdc capture mode
> and reset path assuming the PCI device is in fatal condition. This causes
> EEH recovery to fail and sometimes it leads to system hang or crash.
>
> ------------
> [52732.244731] DEBUG: ibm_read_slot_reset_state2()
> [52732.244762] DEBUG: ret = 0, rets[0]=5, rets[1]=1, rets[2]=4000, rets[3]=0x0
> [52732.244798] DEBUG: in eeh_slot_presence_check
> [52732.244804] DEBUG: error state check
> [52732.244807] DEBUG: Is slot hotpluggable
> [52732.244810] DEBUG: hotpluggable ops ?
> [52732.244953] DEBUG: Calling ops->get_adapter_status
> [52732.244958] DEBUG: calling rpaphp_get_sensor_state
> [52736.564262] ------------[ cut here ]------------
> [52736.564299] NETDEV WATCHDOG: enP64p1s0f3 (tg3): transmit queue 0 timed out
> [52736.564324] WARNING: CPU: 1442 PID: 0 at net/sched/sch_generic.c:478 dev_watchdog+0x438/0x440
> [...]
> [52736.564505] NIP [c000000000c32368] dev_watchdog+0x438/0x440
> [52736.564513] LR [c000000000c32364] dev_watchdog+0x434/0x440
> ------------
>
> To fix this issue, delay the slot presence check after notifying the driver
> about the pci error.

How does this interact with the commit that put the slot presence check
there in the first place:

  b104af5a7687 ("powerpc/eeh: Check slot presence state in eeh_handle_normal_event()")


It seems like delaying the slot presence check will effectively revert
that commit?

cheers
