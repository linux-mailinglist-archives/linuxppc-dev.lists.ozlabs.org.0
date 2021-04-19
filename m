Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1D53639F2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:05:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNtWq2GpFz3dC1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:05:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNtVM2RW0z3br7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:04:11 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FNtVL75J0z9vGZ; Mon, 19 Apr 2021 14:04:10 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <7bf6f1600acad146e541a4e220940062f2e5b03d.1617895813.git.christophe.leroy@csgroup.eu>
References: <7bf6f1600acad146e541a4e220940062f2e5b03d.1617895813.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 1/9] powerpc/mem: Move cache flushing functions into
 mm/cacheflush.c
Message-Id: <161880480136.1398509.5120701716764549620.b4-ty@ellerman.id.au>
Date: Mon, 19 Apr 2021 14:00:01 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 8 Apr 2021 15:30:24 +0000 (UTC), Christophe Leroy wrote:
> Cache flushing functions are in the middle of completely
> unrelated stuff in mm/mem.c
> 
> Create a dedicated mm/cacheflush.c for those functions.
> 
> Also cleanup the list of included headers.

Applied to powerpc/next.

[1/9] powerpc/mem: Move cache flushing functions into mm/cacheflush.c
      https://git.kernel.org/powerpc/c/b26e8f27253a47bff90972b987112fd8396e9b8d
[2/9] powerpc/mem: Declare __flush_dcache_icache() static
      https://git.kernel.org/powerpc/c/bf26e0bbd2f82b52605cd7c880245eefe67e09f3
[3/9] powerpc/mem: Remove address argument to flush_coherent_icache()
      https://git.kernel.org/powerpc/c/131637a17dc97fde3d007ab224e30c7ff4e62f6e
[4/9] powerpc/mem: Call flush_coherent_icache() at higher level
      https://git.kernel.org/powerpc/c/e618c7aea1f2a2d615a99948f1f5cb4c11b6bf57
[5/9] powerpc/mem: Optimise flush_dcache_icache_hugepage()
      https://git.kernel.org/powerpc/c/cd97d9e8b5aa45a7f867a10e99f1d6ce0a5deb8b
[6/9] powerpc/mem: flush_dcache_icache_phys() is for HIGHMEM pages only
      https://git.kernel.org/powerpc/c/52d490437ffb1bab0a63ab7b1a64514d8c17dd4d
[7/9] powerpc/mem: Help GCC realise __flush_dcache_icache() flushes single pages
      https://git.kernel.org/powerpc/c/67b8e6af191a6ed717be548307eb15048f8181d8
[8/9] powerpc/mem: Inline flush_dcache_page()
      https://git.kernel.org/powerpc/c/6c96020882b17fb6f4fbf7f8cef8c606460fc14d
[9/9] powerpc/mem: Use kmap_local_page() in flushing functions
      https://git.kernel.org/powerpc/c/7e9ab144c128df7660a2f33c9c6d1422fe798060

cheers
