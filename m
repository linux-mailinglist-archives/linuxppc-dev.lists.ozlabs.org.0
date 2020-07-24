Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7634B22C8D5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 17:15:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCt6m4qHVzDsG1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 01:15:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqgn6Y8VzDr9w
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:25:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCqgn2rX1z9sV6; Fri, 24 Jul 2020 23:25:08 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20200611081203.995112-2-npiggin@gmail.com>
References: <20200611081203.995112-1-npiggin@gmail.com>
 <20200611081203.995112-2-npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/64s/exception: treat NIA below
 __end_interrupts as soft-masked
Message-Id: <159559697416.1657499.13017258329138347266.b4-ty@ellerman.id.au>
Date: Fri, 24 Jul 2020 23:25:08 +1000 (AEST)
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
Cc: linux-api@vger.kernel.org, musl@lists.openwall.com, libc-dev@lists.llvm.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 11 Jun 2020 18:12:02 +1000, Nicholas Piggin wrote:
> The scv instruction causes an interrupt which can enter the kernel with
> MSR[EE]=1, thus allowing interrupts to hit at any time. These must not
> be taken as normal interrupts, because they come from MSR[PR]=0 context,
> and yet the kernel stack is not yet set up and r13 is not set to the
> PACA).
> 
> Treat this as a soft-masked interrupt regardless of the soft masked
> state. This does not affect behaviour yet, because currently all
> interrupts are taken with MSR[EE]=0.

Applied to powerpc/next.

[1/2] powerpc/64s/exception: treat NIA below __end_interrupts as soft-masked
      https://git.kernel.org/powerpc/c/b2dc2977cba48990df45e0a96150663d4f342700
[2/2] powerpc/64s: system call support for scv/rfscv instructions
      https://git.kernel.org/powerpc/c/7fa95f9adaee7e5cbb195d3359741120829e488b

cheers
