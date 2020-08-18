Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 700FE2484FA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 14:43:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BW9ZZ06V4zDqc5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 22:43:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BW9X51hykzDqTM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 22:41:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=m8vA/J8P; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BW9X45kLCz9sTH;
 Tue, 18 Aug 2020 22:41:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1597754500;
 bh=92T+JTRUiBj8LogWLq7x8AB1yPnegUccBvHHOB6a+Gg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=m8vA/J8PF5b7d408Wrip0PPk3RfDiYyHPG9Pa2XDrokyFOXkXb2KQGNdcxPQFZOGI
 jwAXR4Zi80UYXDgSOOipyqeJll5J5d1IeNnAImrSB7vv1uSzMQY+YpkN9vFQsJuMkq
 D6PMobFVTok+BYfyfMwRb6y56Bzo3FQzO8zw7if8elWEFOKa0yYMR7CjOQGsyM3rTn
 av4xCmScDPRW9o+gDTQ8kQEYsh1ttLGx6lO9682xnUmrT1Ia4XnFiI0sufMe9bBSxC
 nYNHzKSIPYGm34xNKKQklPCA4D5CJaXJNlpN3e2u7qgC9iXFnqHcigIrYVKL+Wg4TS
 E8fL1yIeDE6DQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [powerpc] 5.9.0-rc1 boot failure on POWER9 PowerVM LPAR
In-Reply-To: <2CD14C97-9145-4D98-8C7C-783B278663A2@linux.vnet.ibm.com>
References: <2CD14C97-9145-4D98-8C7C-783B278663A2@linux.vnet.ibm.com>
Date: Tue, 18 Aug 2020 22:41:39 +1000
Message-ID: <87a6ysi0sc.fsf@mpe.ellerman.id.au>
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sachin Sant <sachinp@linux.vnet.ibm.com> writes:
> 5.9.0-rc1 fails to boot on POWER9 PowerVM LPAR with following message

Looks like:

https://lore.kernel.org/linuxppc-dev/20200814150509.225615-1-vaibhav@linux.ibm.com/

cheers

>             Starting udev Kernel Device Manager...
> [  OK  ] Started udev Kernel Device Manager.
> BUG: Kernel NULL pointer dereference on read at 0x00000188
> Faulting instruction address: 0xc0000000005417e0
> Oops: Kernel access of bad area, sig: 11 [#1]
> LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> Modules linked in: papr_scm(+) uio_pdrv_genirq uio sch_fq_codel ip_tables sd_mod t10_pi ibmvscsi scsi_transport_srp ibmveth
> CPU: 14 PID: 7 Comm: kworker/u32:0 Not tainted 5.9.0-rc1-00085-g06a4ec1d9dc6 #1
> Workqueue: events_unbound async_run_entry_fn
> NIP:  c0000000005417e0 LR: c000000000541784 CTR: c000000000871e30
> REGS: c00000067871b710 TRAP: 0300   Not tainted  (5.9.0-rc1-00085-g06a4ec1d9dc6)
> MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24822484  XER: 00000000
> CFAR: c00000000054178c DAR: 0000000000000188 DSISR: 40000000 IRQMASK: 0 
> GPR00: c000000000541784 c00000067871b9a0 c00000000173cb00 0000000000000000 
> GPR04: c000000000f9eb50 0000000000000002 0000000000000001 c000000678689000 
> GPR08: c000000000d45e20 0000000000000180 0000000000000001 0000000000000220 
> GPR12: c000000000871e30 c00000001ec5ba00 c00000000017ba18 c000000678220e00 
> GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> GPR20: 0000000000000000 0000000000000000 fffffffffffffef7 ffffffffffffee4b 
> GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000003 
> GPR28: c0000000037eb018 c00000000166f9e8 c00000066992dd80 c000000000d45f00 
> NIP [c0000000005417e0] internal_create_group+0x180/0x4e0
> LR [c000000000541784] internal_create_group+0x124/0x4e0
> Call Trace:
> [c00000067871b9a0] [c000000000541784] internal_create_group+0x124/0x4e0 (unreliable)
> [c00000067871ba60] [c000000000541d70] internal_create_groups.part.4+0x70/0x120
> [c00000067871bab0] [c0000000008293d0] device_add+0x470/0x970
> [c00000067871bb70] [c00000000086f028] nd_async_device_register+0x28/0xa0
> [c00000067871bbe0] [c000000000180fec] async_run_entry_fn+0x7c/0x220
> [c00000067871bc70] [c000000000170f20] process_one_work+0x260/0x510
> [c00000067871bd10] [c000000000171258] worker_thread+0x88/0x5e0
> [c00000067871bdb0] [c00000000017bbb4] kthread+0x1a4/0x1b0
> [c00000067871be20] [c00000000000d3d0] ret_from_kernel_thread+0x5c/0x6c
> Instruction dump:
> 7f07c378 38a00000 7fc3f378 4bffe47d 60000000 7c7a1b79 40820218 e93d0009 
> 3b7b0001 7f7b07b4 2fa90000 419e0024 <a3490008> 4192ff7c e8890000 38a00000 
> ---[ end trace c238dab2fca3582d ]---
>
> Kernel panic - not syncing: Fatal exception
>
> Have attached config
>
> thanks
> -Sachin
