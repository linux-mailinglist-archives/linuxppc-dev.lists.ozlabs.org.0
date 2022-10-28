Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFB361100E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 13:52:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzLWY0783z3f61
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 22:52:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzLTt69l6z3cC0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 22:50:58 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MzLTt4cPpz4xGd;
	Fri, 28 Oct 2022 22:50:58 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20221022052207.471328-1-npiggin@gmail.com>
References: <20221022052207.471328-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s/interrupt: Fix clear of PACA_IRQS_HARD_DIS when returning to soft-masked context
Message-Id: <166695778878.1609528.9347766969980076117.b4-ty@ellerman.id.au>
Date: Fri, 28 Oct 2022 22:49:48 +1100
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
Cc: Sachin Sant <sachinp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 22 Oct 2022 15:22:07 +1000, Nicholas Piggin wrote:
> Commit a4cb3651a1743 ("powerpc/64s/interrupt: Fix lost interrupts when
> returning to soft-masked context") fixed the problem of pending irqs
> pending cleared when clearing the HARD_DIS bit, but then it didn't clear
> the bit at all. This change clears HARD_DIS without affecting other bits
> in the mask.
> 
> When an interrupt hits in a soft-masked section that has MSR[EE]=1, it
> can hard disable and set PACA_IRQS_HARD_DIS,which  must be cleared
> when returning to the EE=1 caller (unless it was set due to a
> MUST_HARD_MASK interrupt becoming pending). Failure to clear this leaves
> the returned-to context running with MSR[EE]=1 and PACA_IRQS_HARD_DIS,
> which confuses irq assertions and could be dangerous for code that might
> test the flag.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64s/interrupt: Fix clear of PACA_IRQS_HARD_DIS when returning to soft-masked context
      https://git.kernel.org/powerpc/c/65722736c3baf29e02e964a09e85c9ef71c48e8d

cheers
