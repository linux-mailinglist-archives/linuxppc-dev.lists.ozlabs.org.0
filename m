Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD9C34FD96
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 11:58:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9MGQ4dL2z3c5Z
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 20:58:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=arHGUZR1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=arHGUZR1; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9MFz5qrxz2xb9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 20:58:30 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F9MFl5f6mz9sVb;
 Wed, 31 Mar 2021 20:58:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1617184704;
 bh=62LWuEyrUicGCyza4BxPmll8qguht3fvwrGpruDriEg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=arHGUZR1viBTEjAXyUIXP/+nurc8liOgRj9c7NVvad7Troem8hU1kwlNCpaPBAsvP
 1h82bqXhyB0I38ZWIKd5XW11wZbDamjeJrkS5CklXHx2aXl5h7xCWoIgoqNN2NX2xj
 JatIx753TUP6rLjQavrVe45YO6cLoJa8gbI5xBD8pxTHRVpg3/FerLrPmJ1IEZvc4U
 EpNsaSsCol6UEeUCC/mpwSAtrIdglSlvti1NNnYfURnRwbWrtdAaJPS3ggS/AoRxvg
 /LU6rDVZzYU4KI3q+NJ76VlazhqDSEURUWAmKq9SDpRWQGPaIc/f7b6atnYaEsYJaw
 2Jux27y1mafQw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Xiongwei Song <sxwjean@me.com>, benh@kernel.crashing.org,
 paulus@samba.org, oleg@redhat.com, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, msuchanek@suse.de,
 aneesh.kumar@linux.ibm.com, ravi.bangoria@linux.ibm.com,
 mikey@neuling.org, haren@linux.ibm.com, alistair@popple.id.au,
 jniethe5@gmail.com, peterz@infradead.org, leobras.c@gmail.com,
 akpm@linux-foundation.org, rppt@kernel.org, peterx@redhat.com,
 atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com,
 kan.liang@linux.intel.com, aik@ozlabs.ru, pmladek@suse.com,
 john.ogness@linutronix.de
Subject: Re: [PATCH v2] powerpc/traps: Enhance readability for trap types
In-Reply-To: <20210330150425.10145-1-sxwjean@me.com>
References: <20210330150425.10145-1-sxwjean@me.com>
Date: Wed, 31 Mar 2021 20:58:17 +1100
Message-ID: <875z17y79i.fsf@mpe.ellerman.id.au>
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
Cc: Xiongwei Song <sxwjean@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Xiongwei Song <sxwjean@me.com> writes:
> From: Xiongwei Song <sxwjean@gmail.com>
>
> Create a new header named traps.h, define macros to list ppc exception
> types in traps.h, replace the reference of the real trap values with
> these macros.

Personally I find the hex values easier to recognise, but I realise
that's probably not true of other people :)

...
> diff --git a/arch/powerpc/include/asm/traps.h b/arch/powerpc/include/asm/traps.h
> new file mode 100644
> index 000000000000..a31b6122de23
> --- /dev/null
> +++ b/arch/powerpc/include/asm/traps.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_PPC_TRAPS_H
> +#define _ASM_PPC_TRAPS_H
> +
> +#define TRAP_RESET   0x100 /* System reset */
> +#define TRAP_MCE     0x200 /* Machine check */
> +#define TRAP_DSI     0x300 /* Data storage */
> +#define TRAP_DSEGI   0x380 /* Data segment */
> +#define TRAP_ISI     0x400 /* Instruction storage */
> +#define TRAP_ISEGI   0x480 /* Instruction segment */
> +#define TRAP_ALIGN   0x600 /* Alignment */
> +#define TRAP_PROG    0x700 /* Program */
> +#define TRAP_DEC     0x900 /* Decrementer */
> +#define TRAP_SYSCALL 0xc00 /* System call */
> +#define TRAP_TRACEI  0xd00 /* Trace */
> +#define TRAP_FPA     0xe00 /* Floating-point Assist */
> +#define TRAP_PMI     0xf00 /* Performance monitor */

I know the macro is called TRAP and the field in pt_regs is called trap,
but the terminology in the architecture is "exception", and we already
have many uses of that. In particular we have a lot of uses of "exc" as
an abbreviation for "exception". So I think I'd rather we use that than
"TRAP".

I think we should probably use the names from the ISA, unless they are
really over long.

Which are:

  0x100   System Reset
  0x200   Machine Check
  0x300   Data Storage
  0x380   Data Segment
  0x400   Instruction Storage
  0x480   Instruction Segment
  0x500   External
  0x600   Alignment
  0x700   Program
  0x800   Floating-Point Unavailable
  0x900   Decrementer
  0x980   Hypervisor Decrementer
  0xA00   Directed Privileged Doorbell
  0xC00   System Call
  0xD00   Trace
  0xE00   Hypervisor Data Storage
  0xE20   Hypervisor Instruction Storage
  0xE40   Hypervisor Emulation Assistance
  0xE60   Hypervisor Maintenance
  0xE80   Directed Hypervisor Doorbell
  0xEA0   Hypervisor Virtualization
  0xF00   Performance Monitor
  0xF20   Vector Unavailable
  0xF40   VSX Unavailable
  0xF60   Facility Unavailable
  0xF80   Hypervisor Facility Unavailable
  0xFA0   Directed Ultravisor Doorbell


So perhaps:

  EXC_SYSTEM_RESET
  EXC_MACHINE_CHECK
  EXC_DATA_STORAGE
  EXC_DATA_SEGMENT
  EXC_INST_STORAGE
  EXC_INST_SEGMENT
  EXC_EXTERNAL_INTERRUPT
  EXC_ALIGNMENT
  EXC_PROGRAM_CHECK
  EXC_FP_UNAVAILABLE
  EXC_DECREMENTER
  EXC_HV_DECREMENTER
  EXC_SYSTEM_CALL
  EXC_HV_DATA_STORAGE
  EXC_PERF_MONITOR


cheers
