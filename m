Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A1F410B8A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Sep 2021 14:21:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HC6Hx6MP4z30R8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Sep 2021 22:21:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HC6H36rh7z2xsv
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Sep 2021 22:21:02 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HC6H16hZfz9sXk;
 Sun, 19 Sep 2021 22:21:01 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20210903125707.1601269-1-npiggin@gmail.com>
References: <20210903125707.1601269-1-npiggin@gmail.com>
Subject: Re: [PATCH v3 1/2] powerpc/64s: system call scv tabort fix for
 corrupt irq soft-mask state
Message-Id: <163205402701.1052045.3152622550046636354.b4-ty@ellerman.id.au>
Date: Sun, 19 Sep 2021 22:20:27 +1000
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
Cc: Eirik Fuller <efuller@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 3 Sep 2021 22:57:06 +1000, Nicholas Piggin wrote:
> If a system call is made with a transaction active, the kernel
> immediately aborts it and returns. scv system calls disable irqs even
> earlier in their interrupt handler, and tabort_syscall does not fix this
> up.
> 
> This can result in irq soft-mask state being messed up on the next
> kernel entry, and crashing at BUG_ON(arch_irq_disabled_regs(regs)) in
> the kernel exit handlers, or possibly worse.
> 
> [...]

Applied to powerpc/fixes.

[1/2] powerpc/64s: system call scv tabort fix for corrupt irq soft-mask state
      https://git.kernel.org/powerpc/c/b871895b148256f1721bc565d803860242755a0b
[2/2] selftests/powerpc: Add scv versions of the basic TM syscall tests
      https://git.kernel.org/powerpc/c/5379ef2a60431232b9bb01c6d3580b875123d723

cheers
