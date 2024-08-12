Return-Path: <linuxppc-dev+bounces-14-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C20C394ECCB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 14:22:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjDD60Pqlz2xcX;
	Mon, 12 Aug 2024 22:22:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjCl327Hgz2xXV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 22:00:31 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WjCl30rGXz4wcF;
	Mon, 12 Aug 2024 22:00:31 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <62b69c4baad067093f39e7e60df0fe27a86b8d2a.1723100702.git.christophe.leroy@csgroup.eu>
References: <62b69c4baad067093f39e7e60df0fe27a86b8d2a.1723100702.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/mm: Fix boot warning with hugepages and CONFIG_DEBUG_VIRTUAL
Message-Id: <172346398146.772106.14579247166492257362.b4-ty@ellerman.id.au>
Date: Mon, 12 Aug 2024 21:59:41 +1000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Thu, 08 Aug 2024 09:05:08 +0200, Christophe Leroy wrote:
> Booting with CONFIG_DEBUG_VIRTUAL leads to following warning when
> passing hugepage reservation on command line:
> 
>   Kernel command line: hugepagesz=1g hugepages=1 hugepagesz=64m hugepages=1 hugepagesz=256m hugepages=1 noreboot
>   HugeTLB: allocating 1 of page size 1.00 GiB failed.  Only allocated 0 hugepages.
>   ------------[ cut here ]------------
>   WARNING: CPU: 0 PID: 0 at arch/powerpc/include/asm/io.h:948 __alloc_bootmem_huge_page+0xd4/0x284
>   Modules linked in:
>   CPU: 0 PID: 0 Comm: swapper Not tainted 6.10.0-rc6-00396-g6b0e82791bd0-dirty #936
>   Hardware name: MPC8544DS e500v2 0x80210030 MPC8544 DS
>   NIP:  c1020240 LR: c10201d0 CTR: 00000000
>   REGS: c13fdd30 TRAP: 0700   Not tainted  (6.10.0-rc6-00396-g6b0e82791bd0-dirty)
>   MSR:  00021000 <CE,ME>  CR: 44084288  XER: 20000000
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/mm: Fix boot warning with hugepages and CONFIG_DEBUG_VIRTUAL
      https://git.kernel.org/powerpc/c/e7e846dc6c73fbc94ae8b4ec20d05627646416f2

cheers

