Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8CC3B82C0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 15:15:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFMKn4XJ1z3blt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 23:15:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFMK53wLjz2ykR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 23:15:21 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GFMK50281z9sPf; Wed, 30 Jun 2021 23:15:20 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210630074621.2109197-1-npiggin@gmail.com>
References: <20210630074621.2109197-1-npiggin@gmail.com>
Subject: Re: [PATCH v3 0/9] powerpc: fast interrupt exit bug and misc fixes
Message-Id: <162505887202.174506.101918970064382683.b4-ty@ellerman.id.au>
Date: Wed, 30 Jun 2021 23:14:32 +1000
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 30 Jun 2021 17:46:12 +1000, Nicholas Piggin wrote:
> This is a bunch of fixes for powerpc next, mostly a nasty hole in fast
> interrupt exit code found by Sachin and some other bits along the way
> while looking at it.
> 
> Since v2:
> - Fixed 64e patch 3 to really set exit_must_hard_disable.
> - Reworded some changelogs.
> 
> [...]

Applied to powerpc/next.

[1/9] powerpc/64s: fix hash page fault interrupt handler
      https://git.kernel.org/powerpc/c/5567b1ee29b7a83e8c01d99d34b5bbd306ce0bcf
[2/9] powerpc/64e: fix CONFIG_RELOCATABLE build warnings
      https://git.kernel.org/powerpc/c/fce01acf830a697110ed72ecace4b0afdbcd53cb
[3/9] powerpc/64e: remove implicit soft-masking and interrupt exit restart logic
      https://git.kernel.org/powerpc/c/9b69d48c7516a29cdaacd18d8bf5f575014a42a1
[4/9] powerpc/64s: add a table of implicit soft-masked addresses
      https://git.kernel.org/powerpc/c/325678fd052259e7c05ef29060a73c705ea90432
[5/9] powerpc/64s/interrupt: preserve regs->softe for NMI interrupts
      https://git.kernel.org/powerpc/c/1b0482229c302a3c6afd00d6b3bf0169cf279b44
[6/9] powerpc/64: enable MSR[EE] in irq replay pt_regs
      https://git.kernel.org/powerpc/c/2b43dd7653cca47d297756980846ebbfe8887fa1
[7/9] powerpc/64/interrupt: add missing kprobe annotations on interrupt exit symbols
      https://git.kernel.org/powerpc/c/98798f33c6be5a511ab61958b40835b3ef08def2
[8/9] powerpc/64s/interrupt: clean up interrupt return labels
      https://git.kernel.org/powerpc/c/c59458b00aec4ba580d9628d36d6c984af94d192
[9/9] powerpc/64s: move ret_from_fork etc above __end_soft_masked
      https://git.kernel.org/powerpc/c/91fc46eced0f70526d74468ac6c932c90a8585b3

cheers
