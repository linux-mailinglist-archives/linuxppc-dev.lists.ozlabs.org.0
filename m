Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1715FF6C4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 01:22:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mq2Tt0SXpz3dqt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 10:22:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mq2TH11h6z2xy6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Oct 2022 10:21:39 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mq2TG2tYMz4x1F;
	Sat, 15 Oct 2022 10:21:38 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20221012035335.866440-1-npiggin@gmail.com>
References: <20221012035335.866440-1-npiggin@gmail.com>
Subject: Re: (subset) [PATCH 1/2] powerpc/32: fix syscall wrappers with 64-bit arguments of unaligned register-pairs
Message-Id: <166578967707.3420000.7771851820279270494.b4-ty@ellerman.id.au>
Date: Sat, 15 Oct 2022 10:21:17 +1100
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 12 Oct 2022 13:53:34 +1000, Nicholas Piggin wrote:
> powerpc 32-bit system call (and function) calling convention for 64-bit
> arguments requires the next available odd-pair (two sequential registers
> with the first being odd-numbered) from the standard register argument
> allocation.
> 
> The first argument register is r3, so a 64-bit argument that appears at
> an even position in the argument list must skip a register (unless there
> were preceeding 64-bit arguments, which might throw things off). This
> requires non-standard compat definitions to deal with the holes in the
> argument register allocation.
> 
> [...]

Applied to powerpc/fixes.

[1/2] powerpc/32: fix syscall wrappers with 64-bit arguments of unaligned register-pairs
      https://git.kernel.org/powerpc/c/e237506238352f3bfa9cf3983cdab873e35651eb

cheers
