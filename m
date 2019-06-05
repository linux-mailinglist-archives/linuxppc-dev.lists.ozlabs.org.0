Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2AD35ADD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 13:07:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JmG527b4zDqNP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 21:07:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JmDs1JgTzDqNP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 21:06:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45JmDr6W8Gz9sBb;
 Wed,  5 Jun 2019 21:06:04 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stewart Smith <stewart@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, haren@linux.vnet.ibm.com
Subject: Re: crash after NX error
In-Reply-To: <87pnnuav9d.fsf@linux.vnet.ibm.com>
References: <87pnnuav9d.fsf@linux.vnet.ibm.com>
Date: Wed, 05 Jun 2019 21:06:04 +1000
Message-ID: <87zhmwmgv7.fsf@concordia.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stewart Smith <stewart@linux.ibm.com> writes:
> On my two socket POWER9 system (powernv) with 842 zwap set up, I
> recently got a crash with the Ubuntu kernel (I haven't tried with
> upstream, and this is the first time the system has died like this, so
> I'm not sure how repeatable it is).
>
> [    2.891463] zswap: loaded using pool 842-nx/zbud
> ...
> [15626.124646] nx_compress_powernv: ERROR: CSB still not valid after 5000000 us, giving up : 00 00 00 00 00000000
> [16868.932913] Unable to handle kernel paging request for data at address 0x6655f67da816cdb8
> [16868.933726] Faulting instruction address: 0xc000000000391600
>
>
> cpu 0x68: Vector: 380 (Data Access Out of Range) at [c000001c9d98b9a0]
>     pc: c000000000391600: kmem_cache_alloc+0x2e0/0x340
>     lr: c0000000003915ec: kmem_cache_alloc+0x2cc/0x340
>     sp: c000001c9d98bc20
>    msr: 900000000280b033
>    dar: 6655f67da816cdb8
>   current = 0xc000001ad43cb400
>   paca    = 0xc00000000fac7800   softe: 0        irq_happened: 0x01
>     pid   = 8319, comm = make
> Linux version 4.15.0-50-generic (buildd@bos02-ppc64el-006) (gcc version 7.3.0 (Ubuntu 7.3.0-16ubuntu3)) #54-Ubuntu SMP Mon May 6 18:55:18 UTC 2019 (Ubuntu 4.15.0-50.54-generic 4.15.18)
>
> 68:mon> t
> [c000001c9d98bc20] c0000000003914d4 kmem_cache_alloc+0x1b4/0x340 (unreliable)
> [c000001c9d98bc80] c0000000003b1e14 __khugepaged_enter+0x54/0x220
> [c000001c9d98bcc0] c00000000010f0ec copy_process.isra.5.part.6+0xebc/0x1a10
> [c000001c9d98bda0] c00000000010fe4c _do_fork+0xec/0x510
> [c000001c9d98be30] c00000000000b584 ppc_clone+0x8/0xc
> --- Exception: c00 (System Call) at 00007afe9daf87f4
> SP (7fffca606880) is in userspace
>
> So, it looks like there could be a problem in the error path, plausibly
> fixed by this patch:
>
> commit 656ecc16e8fc2ab44b3d70e3fcc197a7020d0ca5
> Author: Haren Myneni <haren@linux.vnet.ibm.com>
> Date:   Wed Jun 13 00:32:40 2018 -0700
>
>     crypto/nx: Initialize 842 high and normal RxFIFO control registers
>     
>     NX increments readOffset by FIFO size in receive FIFO control register
>     when CRB is read. But the index in RxFIFO has to match with the
>     corresponding entry in FIFO maintained by VAS in kernel. Otherwise NX
>     may be processing incorrect CRBs and can cause CRB timeout.
>     
>     VAS FIFO offset is 0 when the receive window is opened during
>     initialization. When the module is reloaded or in kexec boot, readOffset
>     in FIFO control register may not match with VAS entry. This patch adds
>     nx_coproc_init OPAL call to reset readOffset and queued entries in FIFO
>     control register for both high and normal FIFOs.
>     
>     Signed-off-by: Haren Myneni <haren@us.ibm.com>
>     [mpe: Fixup uninitialized variable warning]
>     Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>
> $ git describe --contains 656ecc16e8fc2ab44b3d70e3fcc197a7020d0ca5
> v4.19-rc1~24^2~50
>
>
> Which was never backported to any stable release, so probably needs to
> be for v4.14 through v4.18.

Yeah the P9 NX support went in in:
  b0d6c9bab5e4 ("crypto/nx: Add P9 NX support for 842 compression engine")

Which was: v4.14-rc1~119^2~21, so first released in v4.14.


I'm actually less interested in that and more interested in the
subsequent crash. The time stamps are miles apart though, did we just
leave some corrupted memory after the NX failed and then hit it later?
Or did we not correctly signal to the upper level APIs that the request
failed.

I think we need to do some testing with errors injected into the
wait_for_csb() path, to ensure that failures there are not causing
corrupting in zswap. Haren have you done any testing of error injection?

cheers
