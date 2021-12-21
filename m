Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3591347BF90
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 13:17:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJFnn1n9dz3dfx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 23:17:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJFlb2MZJz2xXV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 23:15:23 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JJFlX5s6zz4xmy;
 Tue, 21 Dec 2021 23:15:20 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20210922145452.352571-1-npiggin@gmail.com>
References: <20210922145452.352571-1-npiggin@gmail.com>
Subject: Re: [PATCH v3 0/6] powerpc/64s: interrupt speedups
Message-Id: <164008885546.2078648.14999431252016019800.b4-ty@ellerman.id.au>
Date: Tue, 21 Dec 2021 23:14:15 +1100
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

On Thu, 23 Sep 2021 00:54:46 +1000, Nicholas Piggin wrote:
> Here's a few stragglers. The first patch was submitted already but had
> some bugs with unrecoverable exceptions on HPT (current->blah being
> accessed before MSR[RI] was enabled). Those should be fixed now.
> 
> The others are generally for helping asynch interrupts, which are a bit
> harder to measure well but important for IO and IPIs.
> 
> [...]

Applied to powerpc/next.

[1/6] powerpc/64/interrupt: make normal synchronous interrupts enable MSR[EE] if possible
      https://git.kernel.org/powerpc/c/4423eb5ae32ec613af3fceee2fe84234e417ee55
[2/6] powerpc/64s/interrupt: handle MSR EE and RI in interrupt entry wrapper
      https://git.kernel.org/powerpc/c/ff0b0d6e1a7bc202241a9b1e28d1da4b744e0312
[3/6] powerpc/64s/perf: add power_pmu_wants_prompt_pmi to say whether perf wants PMIs to be soft-NMI
      https://git.kernel.org/powerpc/c/5a7745b96f43c69f9b4875bcf516a0341acbc3fb
[4/6] powerpc/64s/interrupt: Don't enable MSR[EE] in irq handlers unless perf is in use
      https://git.kernel.org/powerpc/c/0faf20a1ad1647c0fc0f5a367c71e5e84deaf899
[5/6] powerpc/64/interrupt: reduce expensive debug tests
      https://git.kernel.org/powerpc/c/ecb1057c0f9a0f3f052294de6cc2eb43ecf7547b
[6/6] powerpc/64s/interrupt: avoid saving CFAR in some asynchronous interrupts
      https://git.kernel.org/powerpc/c/af47d79b041deccc31e0dddc6310a654c13d04b6

cheers
