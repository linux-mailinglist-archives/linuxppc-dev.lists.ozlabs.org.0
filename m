Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BC82223DC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 15:26:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6w5325rFzDr0r
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 23:26:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6vPf4yB5zDqS7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 22:55:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4B6vPc4zFDz9sTh; Thu, 16 Jul 2020 22:55:48 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: npiggin@gmail.com, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <173de3b659fa3a5f126a0eb170522cccd909950f.1594125164.git.christophe.leroy@csgroup.eu>
References: <173de3b659fa3a5f126a0eb170522cccd909950f.1594125164.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] powerpc/signal_32: Remove !FULL_REGS() special
 handling in PPC64 save_general_regs()
Message-Id: <159490400779.3805857.2201061957365361885.b4-ty@ellerman.id.au>
Date: Thu, 16 Jul 2020 22:55:48 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 7 Jul 2020 12:33:35 +0000 (UTC), Christophe Leroy wrote:
> Since commit ("1bd79336a426 powerpc: Fix various
> syscall/signal/swapcontext bugs"), getting save_general_regs() called
> without FULL_REGS() is very unlikely and generates a warning.
> 
> The 32-bit version of save_general_regs() doesn't take care of it
> at all and copies all registers anyway since that commit.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/signal_32: Remove !FULL_REGS() special handling in PPC64 save_general_regs()
      https://git.kernel.org/powerpc/c/667e3c413ecf20371692fd2dc37e06dc14d0b140
[2/2] powerpc/signal_32: Simplify loop in PPC64 save_general_regs()
      https://git.kernel.org/powerpc/c/020c4831e01264f8b62af6ca9e669b7c51881a56

cheers
