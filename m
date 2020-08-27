Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0067825404E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 10:08:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bcb2Q62bwzDqfv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 18:08:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcZYs5FnHzDqd9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 17:46:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BcZYr2ZqWz9sTK; Thu, 27 Aug 2020 17:46:55 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, LKML <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <e06de4d3-a36f-2745-9775-467e125436cc@infradead.org>
References: <e06de4d3-a36f-2745-9775-467e125436cc@infradead.org>
Subject: Re: [PATCH] Documentation/powerpc: fix malformed table in
 syscall64-abi
Message-Id: <159851436088.52163.10131581013009684108.b4-ty@ellerman.id.au>
Date: Thu, 27 Aug 2020 17:46:55 +1000 (AEST)
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

On Sun, 23 Aug 2020 17:31:16 -0700, Randy Dunlap wrote:
> Fix malformed table warning in powerpc/syscall64-abi.rst by making
> two tables and moving the headings.
> 
> Documentation/powerpc/syscall64-abi.rst:53: WARNING: Malformed table.
> Text in column margin in table line 2.
> 
> =========== ============= ========================================
> --- For the sc instruction, differences with the ELF ABI ---
> r0          Volatile      (System call number.)
> r3          Volatile      (Parameter 1, and return value.)
> r4-r8       Volatile      (Parameters 2-6.)
> cr0         Volatile      (cr0.SO is the return error condition.)
> cr1, cr5-7  Nonvolatile
> lr          Nonvolatile
> 
> [...]

Applied to powerpc/fixes.

[1/1] Documentation/powerpc: fix malformed table in syscall64-abi
      https://git.kernel.org/powerpc/c/aa661d7fab436d8a782618b3138da1a84ca28a31

cheers
