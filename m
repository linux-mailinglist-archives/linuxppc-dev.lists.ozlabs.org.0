Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D184B888C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 14:09:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzJFP6cZ3z3djB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 00:09:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzJDb4GR0z30gk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 00:08:31 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JzJDb6SGKz4xcP;
 Thu, 17 Feb 2022 00:08:31 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20220212111349.2806972-1-mpe@ellerman.id.au>
References: <20220212111349.2806972-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Fix STACKTRACE=n build
Message-Id: <164501689976.533336.4240605239265889033.b4-ty@ellerman.id.au>
Date: Thu, 17 Feb 2022 00:08:19 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 12 Feb 2022 22:13:49 +1100, Michael Ellerman wrote:
> Our skiroot_defconfig doesn't enable FTRACE, and so doesn't get
> STACKTRACE enabled either. That leads to a build failure since commit
> 1614b2b11fab ("arch: Make ARCH_STACKWALK independent of STACKTRACE")
> made stacktrace.c build even when STACKTRACE=n.
> 
>   arch/powerpc/kernel/stacktrace.c: In function ‘handle_backtrace_ipi’:
>   arch/powerpc/kernel/stacktrace.c:171:2: error: implicit declaration of function ‘nmi_cpu_backtrace’
>     171 |  nmi_cpu_backtrace(regs);
>         |  ^~~~~~~~~~~~~~~~~
>   arch/powerpc/kernel/stacktrace.c: In function ‘arch_trigger_cpumask_backtrace’:
>   arch/powerpc/kernel/stacktrace.c:226:2: error: implicit declaration of function ‘nmi_trigger_cpumask_backtrace’
>     226 |  nmi_trigger_cpumask_backtrace(mask, exclude_self, raise_backtrace_ipi);
>         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Fix STACKTRACE=n build
      https://git.kernel.org/powerpc/c/5a72345e6a78120368fcc841b570331b6c5a50da

cheers
