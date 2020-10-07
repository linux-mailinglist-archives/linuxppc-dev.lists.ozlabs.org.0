Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 641F828571A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 05:34:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5g1D2TK8zDqLn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 14:34:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5fkQ4zrrzDqFm
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 14:21:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4C5fkQ2QV5z9sTt; Wed,  7 Oct 2020 14:21:16 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200915114650.3980244-1-npiggin@gmail.com>
References: <20200915114650.3980244-1-npiggin@gmail.com>
Subject: Re: [PATCH 1/6] powerpc/64: fix irq replay missing preempt
Message-Id: <160204083017.257875.11545487257777367022.b4-ty@ellerman.id.au>
Date: Wed,  7 Oct 2020 14:21:16 +1100 (AEDT)
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

On Tue, 15 Sep 2020 21:46:45 +1000, Nicholas Piggin wrote:
> Prior to commit 3282a3da25bd ("powerpc/64: Implement soft interrupt
> replay in C"), replayed interrupts returned by the regular interrupt
> exit code, which performs preemption in case an interrupt had set
> need_resched.
> 
> This logic was missed by the conversion. Adding preempt_disable/enable
> around the interrupt replay and final irq enable will reschedule if
> needed.

Patches 1-5 applied to powerpc/next.

[1/6] powerpc/64: fix irq replay missing preempt
      https://git.kernel.org/powerpc/c/903fd31d3212ab72d564c68f6cfb5d04db68773e
[2/6] powerpc/64: fix irq replay pt_regs->softe value
      https://git.kernel.org/powerpc/c/2b48e96be2f9f7151197fd25dc41487054bc6f5b
[3/6] powerpc/64e: remove PACA_IRQ_EE_EDGE
      https://git.kernel.org/powerpc/c/012a9a97a8fd6c96d5ec64eb0583220490d95e73
[4/6] powerpc/64e: remove 64s specific interrupt soft-mask code
      https://git.kernel.org/powerpc/c/903dd1ff453e458fc7608ee4df42a6df16d3d1a0
[5/6] powerpc/64: make restore_interrupts 64e only
      https://git.kernel.org/powerpc/c/455575533c7aa294d3c0284d59a77ae9a60c0537

cheers
