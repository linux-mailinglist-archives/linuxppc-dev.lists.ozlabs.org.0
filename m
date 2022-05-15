Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A28CF527703
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 12:33:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1JdX4RQmz3fJg
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 20:33:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1JZM1nd2z3cdx
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 May 2022 20:31:07 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L1JZL60QLz4xZ5;
 Sun, 15 May 2022 20:31:06 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, akpm@linux-foundation.org
In-Reply-To: <cover.1649523076.git.christophe.leroy@csgroup.eu>
References: <cover.1649523076.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v10 00/13] Convert powerpc to default topdown mmap layout
 (v10)
Message-Id: <165261051322.1047019.8471968649588278768.b4-ty@ellerman.id.au>
Date: Sun, 15 May 2022 20:28:33 +1000
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 9 Apr 2022 19:17:24 +0200, Christophe Leroy wrote:
> Rebased on top of v5.18-rc1
> 
> This series converts powerpc to default topdown mmap layout.
> 
> First patch is a mm fix that should go into v5.18 and stable.
> 
> Andrew, can you take it ?
> 
> [...]

Patches 2-13 applied to powerpc/next.

[02/13] mm: Allow arch specific arch_randomize_brk() with CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
        https://git.kernel.org/powerpc/c/723820f3f77dc9f7ffdceb076ebcf6a5b91d0a27
[03/13] mm, hugetlbfs: Allow an arch to always use generic versions of get_unmapped_area functions
        https://git.kernel.org/powerpc/c/4b439e25e29ec336c0e71ef1d1b212c412526518
[04/13] mm: Add len and flags parameters to arch_get_mmap_end()
        https://git.kernel.org/powerpc/c/2cb4de085f383cb9289083d1bedbaad046f640eb
[05/13] powerpc/mm: Move vma_mmu_pagesize()
        https://git.kernel.org/powerpc/c/93ea910295cae7ad69571ed1570e5b5ca54a2f9e
[06/13] powerpc/mm: Make slice specific to book3s/64
        https://git.kernel.org/powerpc/c/1408fca0c198471a5cd089742b9d3f9739073483
[07/13] powerpc/mm: Remove CONFIG_PPC_MM_SLICES
        https://git.kernel.org/powerpc/c/f693d38d9468101587175b1e62d7e4483b51d8f5
[08/13] powerpc/mm: Use generic_get_unmapped_area() and call it from arch_get_unmapped_area()
        https://git.kernel.org/powerpc/c/76a345ed16c63df9b02d3e374e8d5e39471174ad
[09/13] powerpc/mm: Use generic_hugetlb_get_unmapped_area()
        https://git.kernel.org/powerpc/c/1a0261fd3b218b6999f38dc791a66c9b7ddc7e8b
[10/13] powerpc/mm: Move get_unmapped_area functions to slice.c
        https://git.kernel.org/powerpc/c/ab57bd7570d4393beb5a91bf092ed54e9c3574a2
[11/13] powerpc/mm: Enable full randomisation of memory mappings
        https://git.kernel.org/powerpc/c/5cf7f9a0a54e93a6d3361de5f4ba4358b054c6c2
[12/13] powerpc/mm: Convert to default topdown mmap layout
        https://git.kernel.org/powerpc/c/36e5f9ee776cb6db6ab8cb9b056076c4492b9871
[13/13] powerpc: Simplify and move arch_randomize_brk()
        https://git.kernel.org/powerpc/c/3ba4289a3e7ff4a89a78c4f74d694a344e8d9cc9

cheers
