Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC6123328E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 15:03:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHVvl6LVYzDr44
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 23:03:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHVcq25RSzDqwh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 22:50:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BHVcq0hjPz9sSy; Thu, 30 Jul 2020 22:50:18 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Balamuruhan S <bala24@linux.ibm.com>
In-Reply-To: <20200330075954.538773-1-bala24@linux.ibm.com>
References: <20200330075954.538773-1-bala24@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc xmon: use `dcbf` inplace of `dcbi` instruction
 for 64bit Book3S
Message-Id: <159611327907.1601380.5881020568805076546.b4-ty@ellerman.id.au>
Date: Thu, 30 Jul 2020 22:50:18 +1000 (AEST)
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com, paulus@samba.org,
 sandipan@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 30 Mar 2020 13:29:54 +0530, Balamuruhan S wrote:
> Data Cache Block Invalidate (dcbi) instruction implemented back in
> PowerPC architecture version 2.03. But as per Power Processor Users Manual
> it is obsolete and not supported by POWER8/POWER9 core. Attempt to use of
> this illegal instruction results in a hypervisor emulation assistance
> interrupt. So, ifdef it out the option `i` in xmon for 64bit Book3S.
> 
> 0:mon> fi
> cpu 0x0: Vector: 700 (Program Check) at [c000000003be74a0]
>     pc: c000000000102030: cacheflush+0x180/0x1a0
>     lr: c000000000101f3c: cacheflush+0x8c/0x1a0
>     sp: c000000003be7730
>    msr: 8000000000081033
>   current = 0xc0000000035e5c00
>   paca    = 0xc000000001910000   irqmask: 0x03   irq_happened: 0x01
>     pid   = 1025, comm = bash
> Linux version 5.6.0-rc5-g5aa19adac (root@ltc-wspoon6) (gcc version 7.4.0
> (Ubuntu 7.4.0-1ubuntu1~18.04.1)) #1 SMP Tue Mar 10 04:38:41 CDT 2020
> cpu 0x0: Exception 700 (Program Check) in xmon, returning to main loop
> [c000000003be7c50] c00000000084abb0 __handle_sysrq+0xf0/0x2a0
> [c000000003be7d00] c00000000084b3c0 write_sysrq_trigger+0xb0/0xe0
> [c000000003be7d30] c0000000004d1edc proc_reg_write+0x8c/0x130
> [c000000003be7d60] c00000000040dc7c __vfs_write+0x3c/0x70
> [c000000003be7d80] c000000000410e70 vfs_write+0xd0/0x210
> [c000000003be7dd0] c00000000041126c ksys_write+0xdc/0x130
> [c000000003be7e20] c00000000000b9d0 system_call+0x5c/0x68
> --- Exception: c01 (System Call) at 00007fffa345e420
> SP (7ffff0b08ab0) is in userspace

Applied to powerpc/next.

[1/1] powerpc/xmon: Use `dcbf` inplace of `dcbi` instruction for 64bit Book3S
      https://git.kernel.org/powerpc/c/81a413259a224f0d1783c41a74f18864d4f3d67e

cheers
