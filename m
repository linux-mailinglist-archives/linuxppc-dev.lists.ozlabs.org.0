Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACC922E69D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 09:32:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFWjq20RJzF1Nj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 17:32:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFWZt088fzDqjc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 17:26:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BFWZs6fFyz9sTQ; Mon, 27 Jul 2020 17:26:45 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <cover.1593428200.git.christophe.leroy@csgroup.eu>
References: <cover.1593428200.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 0/6] powerpc/32s: Allocate modules outside of vmalloc
 space for STRICT_KERNEL_RWX
Message-Id: <159583478807.602200.856546124460688008.b4-ty@ellerman.id.au>
Date: Mon, 27 Jul 2020 17:26:45 +1000 (AEST)
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

On Mon, 29 Jun 2020 11:15:19 +0000 (UTC), Christophe Leroy wrote:
> On book3s32 (hash), exec protection is set per 256Mb segments with NX bit.
> Instead of clearing NX bit on vmalloc space when CONFIG_MODULES is selected,
> allocate modules in a dedicated segment (0xb0000000-0xbfffffff by default).
> This allows to keep exec protection on vmalloc space while allowing exec
> on modules.
> 
> v2:
> - Removed the two patches that fix ptdump. Will submitted independently
> - Only changing the user/kernel boundary for PPC32 now.
> - Reordered the patches inside the series.
> 
> [...]

Applied to powerpc/next.

[1/6] powerpc/lib: Prepare code-patching for modules allocated outside vmalloc space
      https://git.kernel.org/powerpc/c/ccc8fcf72a6953fbfd6998999d622295f522b952
[2/6] powerpc: Use MODULES_VADDR if defined
      https://git.kernel.org/powerpc/c/7fbc22ce29931630da200cfc90fe5a454f54a794
[3/6] powerpc/32s: Only leave NX unset on segments used for modules
      https://git.kernel.org/powerpc/c/c496433197154144c310a17939736bc5c155914d
[4/6] powerpc/32: Set user/kernel boundary at TASK_SIZE instead of PAGE_OFFSET
      https://git.kernel.org/powerpc/c/b6be1bb7f7216b9e9f33f57abe6e3290c0e66bd4
[5/6] powerpc/32s: Kernel space starts at TASK_SIZE
      https://git.kernel.org/powerpc/c/f1a1f7a15eb0e13b84791ff2738b84e414501718
[6/6] powerpc/32s: Use dedicated segment for modules with STRICT_KERNEL_RWX
      https://git.kernel.org/powerpc/c/6ca055322da8fe25ff9ac50db6f3b7b59b6f961c

cheers
