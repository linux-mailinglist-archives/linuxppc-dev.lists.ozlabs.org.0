Return-Path: <linuxppc-dev+bounces-5678-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 383E7A21D54
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 13:50:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yjhpl3SB1z30NY;
	Wed, 29 Jan 2025 23:50:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738155055;
	cv=none; b=gSxNoEr2yp4OWDzaEHmjLS4j3GVpjlfDyWrF+kymNVwiJRqG4Z1vduqHeGVZYcDTq9B6pNdzFGJZ6bj6ajltTzDxWYoIa9NkGmHWtzn9VCAhYL//20LBwGeSPeR8r6OU0asgV9nzl2qAB0nRx2GmkMOYQI4XC2xOUCcLm7g22QeB13HB/lmyWk33411DQPKF0xU3KiXZcGJC7+6xKmAkd45XWYFuNmvQYojURCYqD7wAIT/8jZovJgJKhUREilhRlU0Nh+klOWOC4UUG7HWv9OPChk2o5VaPwxIVwFIMP/VkAsnfyLQZlH8AFpb2xWiKCP1npPFuXo8F+9Ln0u2qvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738155055; c=relaxed/relaxed;
	bh=fQhhg8qTRRuVODKWAlsy9L7PghS+7R+0Ak4brSaNY54=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O5Zs6EkwGl8jBfRpZm9eoGNhUwwEzhIrzYc15u+2qDo3YgM99W4DmlIdSW1wlBOf7y5COGho2HITkL1TgbwnxdEc0PiDX5WyvBnEr84xBfxTvSi/cmqLM8g4NgW7nbCNlbsCzx1M0ulnn3HxeKtnIXGOs5GrM0I4fY8j/9GJ5SUStAtO6mZScnlH6IR4WwYgir2wP1ysYm90geMH/+8CaGMhYuEz6m22lb5GL8RcpUOZoKWdYbSR84zECscV0xKxmhbpu3phOzwQy+kt/fpdx0lseQUzJ34yddShAizIT8JWX+5rPIgcHrxLNbgDn7WmaHuJ7jI4dDxSZb5qnc1l8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XG6j7ZTS; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XG6j7ZTS;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yjhpj4cqCz30D3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 23:50:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1738155042;
	bh=fQhhg8qTRRuVODKWAlsy9L7PghS+7R+0Ak4brSaNY54=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XG6j7ZTSK/NdhJS/k8J5VRjQFPbfn7F1KDSZ8+boxTToXaOfMs0cPXiKazujhY5iP
	 q1SKi0x36+xR34bYSEgwdBLO1msjmpD5IsOg1V3JDzogebvCCeeOEUZArrFxhVU1tF
	 pIsvJGDxxnTfIC/qdqH1tnk178bP5bX9l3m1XFfUYjD5ZvnevYrsapxsidG6GdW1cG
	 +VpfMyyPBSB2OS61RReEKAVgv65M9izsNvj6aP94oDWQb2fzRV0SjK8Exa7DB9yxy0
	 djU3Rsr6a/PbowxJdqnGnFsOE95eT8S26yVGJcR+9F+ybN7IptMHdZ0B8Z5mYdDLNT
	 0GswnJF+BjgdA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YjhpV1x0Xz4wnx;
	Wed, 29 Jan 2025 23:50:42 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Paul Mackerras <paulus@ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 5/5] powerpc/microwatt: Add SMP support
In-Reply-To: <Z5nRYn11vxVuGU7J@thinks.paulus.ozlabs.org>
References: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org>
 <Z5lgTN0aA_yiETne@thinks.paulus.ozlabs.org>
 <D7EC9DL1YW6K.5NFBT1W937FK@gmail.com>
 <Z5nRYn11vxVuGU7J@thinks.paulus.ozlabs.org>
Date: Wed, 29 Jan 2025 23:50:44 +1100
Message-ID: <874j1hss0r.fsf@mpe.ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Paul Mackerras <paulus@ozlabs.org> writes:
> On Wed, Jan 29, 2025 at 04:21:26PM +1000, Nicholas Piggin wrote:
>> On Wed Jan 29, 2025 at 8:55 AM AEST, Paul Mackerras wrote:
>> > This adds support for Microwatt systems with more than one core, and
>> > updates the device tree for a 2-core version.  (This does not prevent
>> > the kernel from running on a single-core system.)
>> >
>> > Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
>> 
>> Well, I'm impressed you added SMP :)
>> 
>> What happens with a 1 CPU system? Do we time out waiting for secondaries
>> and continue, or is there something more graceful?
>
> There's a field in the SYSCON register which tells you how many cores
> there are.  microwatt_init_smp() looks at that field and only starts
> the CPUs that are there.
>
> Oops, sorry, I see that I forgot to do 'git add' on
> arch/powerpc/platforms/microwatt/smp.c.  Here it is (I'll include it
> properly in v2, of course):
>
> // SPDX-License-Identifier: GPL-2.0-or-later
>
> /*
>  * SMP support functions for Microwatt
>  * Copyright 2025 Paul Mackerras <paulus@ozlabs.org>
>  */
>
> #include <linux/kernel.h>
> #include <linux/smp.h>
> #include <linux/io.h>
> #include <asm/early_ioremap.h>
> #include <asm/xics.h>
>
> #include "microwatt.h"
>
> static void __init microwatt_smp_probe(void)
> {
> 	xics_smp_probe();
> }
>
> static void microwatt_smp_setup_cpu(int cpu)
> {
> 	if (cpu != 0)
> 		xics_setup_cpu();
> }
>
> static struct smp_ops_t microwatt_smp_ops = {
> 	.probe		= microwatt_smp_probe,
> 	.message_pass	= NULL,		/* Use smp_muxed_ipi_message_pass */
> 	.kick_cpu	= smp_generic_kick_cpu,
> 	.setup_cpu	= microwatt_smp_setup_cpu,
> };
>
> /* XXX get from device tree */
> #define SYSCON_BASE	0xc0000000
>
> #define SYSCON_CPU_CTRL	0x58
>
> void __init microwatt_init_smp(void)
> {
> 	volatile unsigned char __iomem *syscon;
> 	int ncpus;
> 	int timeout;
>
> 	syscon = early_ioremap(SYSCON_BASE, 0x100);
> 	if (syscon == NULL) {
> 		pr_err("Failed to map SYSCON\n");
> 		return;
> 	}
> 	ncpus = (readl(syscon + SYSCON_CPU_CTRL) >> 8) & 0xff;
> 	if (ncpus < 2)
> 		goto out;
>
> 	smp_ops = &microwatt_smp_ops;
>
> 	/*
> 	 * Write two instructions at location 0:
> 	 * mfspr r3, PIR
> 	 * b __secondary_hold
> 	 */
> 	*(unsigned int *)KERNELBASE = 0x7c7ffaa6;
> 	*(unsigned int *)(KERNELBASE+4) = 0x4800005c;
 
There's macros that would make these a little nicer, ie. PPC_RAW_MFSPR()
and PPC_RAW_BRANCH().

> 	/* enable the other CPUs, they start at location 0 */
> 	writel((1ul << ncpus) - 1, syscon + SYSCON_CPU_CTRL);
>
> 	timeout = 10000;
> 	while (!__secondary_hold_acknowledge) {
> 		if (--timeout == 0)
> 			break;
> 		barrier();
> 	}

I assume CPU 0 always boots first?

Is the loop actually necessary? It only waits for a single non-zero CPU
to come up after all, not all of them.

cheers

