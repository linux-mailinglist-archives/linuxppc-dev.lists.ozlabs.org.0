Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A863057BF6A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 23:05:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lp7WS4rPFz3dqF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 07:05:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lp7W25ccbz2xk4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 07:04:46 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 26KL2fG7012311;
	Wed, 20 Jul 2022 16:02:41 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 26KL2fv6012310;
	Wed, 20 Jul 2022 16:02:41 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 20 Jul 2022 16:02:41 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 2/2] powerpc/64s: Make POWER10 and later use pause_short in cpu_relax loops
Message-ID: <20220720210241.GG25951@gate.crashing.org>
References: <20220720132132.903462-1-npiggin@gmail.com> <20220720132132.903462-2-npiggin@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720132132.903462-2-npiggin@gmail.com>
User-Agent: Mutt/1.4.2.3i
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Wed, Jul 20, 2022 at 11:21:32PM +1000, Nicholas Piggin wrote:
> We want to move away from using SMT prioroty updates for cpu_relax, and

(typo, "priority")

> +#define spin_begin()							\
> +do {									\
> +	asm volatile(ASM_FTR_IFCLR(					\
> +		"or 1,1,1", /* HMT_LOW */				\
> +		"nop",/* POWER10 onward uses pause_short (wait 2,0) */	\
> +		%0) :: "i" (CPU_FTR_ARCH_31) : "memory");		\
> +} while (0)

Is that nop patched later?  Or should you change the comment, maybe?

> +#define spin_cpu_relax()						\
> +do {									\
> +	asm volatile(ASM_FTR_IFCLR(					\
> +		/* Pre-POWER10 uses low / medium priority nops */	\
> +		"nop",							\

"nop" aka "or 0,0,0" does not change program priority?  Medium low would
be "or 6,6,6", not sure if that is the ppr you wanted here?

> +		/* POWER10 onward uses pause_short (wait 2,0) */	\
> +		PPC_WAIT(2, 0),						\
> +		%0) :: "i" (CPU_FTR_ARCH_31) : "memory");		\
> +} while (0)
> +
> +#define spin_end()							\
> +do {									\
> +	asm volatile(ASM_FTR_IFCLR(					\
> +		"or 2,2,2", /* HMT_MEDIUM */				\
> +		"nop",/* POWER10 onward uses pause_short (wait 2,0) */	\
> +		%0) :: "i" (CPU_FTR_ARCH_31) : "memory");		\
> +} while (0)

Same comment as for spin_begin.

Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>


Segher
