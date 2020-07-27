Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FA422E6F8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 09:54:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFXBH5x2gzDqV3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 17:53:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFWb62fmjzDqpr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 17:26:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BFWb36Z58z9sTg; Mon, 27 Jul 2020 17:26:55 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20200726003809.20454-1-rdunlap@infradead.org>
References: <20200726003809.20454-1-rdunlap@infradead.org>
Subject: Re: [PATCH 0/9] powerpc: delete duplicated words
Message-Id: <159583479016.602200.15928174680101710128.b4-ty@ellerman.id.au>
Date: Mon, 27 Jul 2020 17:26:55 +1000 (AEST)
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 25 Jul 2020 17:38:00 -0700, Randy Dunlap wrote:
> Drop duplicated words in arch/powerpc/ header files.
> 
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> 
> [...]

Applied to powerpc/next.

[1/9] powerpc/book3s/mmu-hash.h: delete duplicated word
      https://git.kernel.org/powerpc/c/10a4a016d6a882ba7601159b0f719330b102c41b
[2/9] powerpc/book3s/radix-4k.h: delete duplicated word
      https://git.kernel.org/powerpc/c/92be1fca08eabe8ab083b1dfccd3e932b4fb6f1a
[3/9] powerpc/cputime.h: delete duplicated word
      https://git.kernel.org/powerpc/c/dc9bf323d6b8996d22c111add0ac8b0c895dcf52
[4/9] powerpc/epapr_hcalls.h: delete duplicated words
      https://git.kernel.org/powerpc/c/8965aa4b684f022c4d0bc6429097ddb38a26eaef
[5/9] powerpc/hw_breakpoint.h: delete duplicated word
      https://git.kernel.org/powerpc/c/028cc22d29959b501add32fc62660e5484c8092d
[6/9] powerpc/ppc_asm.h: delete duplicated word
      https://git.kernel.org/powerpc/c/db10f5500004268b29e3c5bfd1e44ef53a1e25c9
[7/9] powerpc/reg.h: delete duplicated word
      https://git.kernel.org/powerpc/c/850659392abc303d41c3f9217d45ab4fa79d201c
[8/9] powerpc/smu.h: delete duplicated word
      https://git.kernel.org/powerpc/c/3b56ed4b461fd92b66f6ea44d81837e12878031f
[9/9] powerpc/powernv/pci.h: delete duplicated word
      https://git.kernel.org/powerpc/c/86052e407e8e1964c81965de25832258875a0e6d

cheers
