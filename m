Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D66ED5B3609
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 13:09:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPCt55yDBz3c8Z
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 21:09:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPCsj5QQjz2yp5
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 21:08:41 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MPCsh3zp6z4xPB;
	Fri,  9 Sep 2022 21:08:40 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220907065038.1604504-1-mpe@ellerman.id.au>
References: <20220907065038.1604504-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pseries: Fix plpks crash on non-pseries
Message-Id: <166272168524.2069326.16419354715816286415.b4-ty@ellerman.id.au>
Date: Fri, 09 Sep 2022 21:08:05 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: nathan@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 7 Sep 2022 16:50:38 +1000, Michael Ellerman wrote:
> As reported[1] by Nathan, the recently added plpks driver will crash if
> it's built into the kernel and booted on a non-pseries machine, eg
> powernv:
> 
>   kernel BUG at arch/powerpc/kernel/syscall.c:39!
>   Oops: Exception in kernel mode, sig: 5 [#1]
>   LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
>   ...
>   NIP system_call_exception+0x90/0x3d0
>   LR  system_call_common+0xec/0x250
>   Call Trace:
>     0xc0000000035c3e10 (unreliable)
>     system_call_common+0xec/0x250
>   --- interrupt: c00 at plpar_hcall+0x38/0x60
>   NIP:  c0000000000e4300 LR: c00000000202945c CTR: 0000000000000000
>   REGS: c0000000035c3e80 TRAP: 0c00   Not tainted  (6.0.0-rc4)
>   MSR:  9000000002009033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 28000284  XER: 00000000
>   ...
>   NIP plpar_hcall+0x38/0x60
>   LR  pseries_plpks_init+0x64/0x23c
>   --- interrupt: c00
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/pseries: Fix plpks crash on non-pseries
      https://git.kernel.org/powerpc/c/a66de5283e16602b74658289360505ceeb308c90

cheers
