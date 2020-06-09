Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6147F1F33A5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 07:55:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gzqV4bynzDqVn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 15:55:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzDw3ZzMzDqRy
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:28:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzDw1Jhyz9sTY; Tue,  9 Jun 2020 15:28:47 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1589866984.git.christophe.leroy@csgroup.eu>
References: <cover.1589866984.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v4 00/45] Use hugepages to map kernel mem on 8xx
Message-Id: <159168032673.1381411.349383514625034075.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:28:47 +1000 (AEST)
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

On Tue, 19 May 2020 05:48:42 +0000 (UTC), Christophe Leroy wrote:
> The main purpose of this big series is to:
> - reorganise huge page handling to avoid using mm_slices.
> - use huge pages to map kernel memory on the 8xx.
> 
> The 8xx supports 4 page sizes: 4k, 16k, 512k and 8M.
> It uses 2 Level page tables, PGD having 1024 entries, each entry
> covering 4M address space. Then each page table has 1024 entries.
> 
> [...]

Patches 1-6 and 9-45 applied to powerpc/next.

[01/45] powerpc/kasan: Fix error detection on memory allocation
        https://git.kernel.org/powerpc/c/d132443a73d7a131775df46f33000f67ed92de1e
[02/45] powerpc/kasan: Fix issues by lowering KASAN_SHADOW_END
        https://git.kernel.org/powerpc/c/3a66a24f6060e6775f8c02ac52329ea0152d7e58
[03/45] powerpc/kasan: Fix shadow pages allocation failure
        https://git.kernel.org/powerpc/c/d2a91cef9bbdeb87b7449fdab1a6be6000930210
[04/45] powerpc/kasan: Remove unnecessary page table locking
        https://git.kernel.org/powerpc/c/7c31c05e00fc5ff2067332c5f80e525573e7269c
[05/45] powerpc/kasan: Refactor update of early shadow mappings
        https://git.kernel.org/powerpc/c/7dec42ab57f2f59feba82abf0353164479bfde4c
[06/45] powerpc/kasan: Declare kasan_init_region() weak
        https://git.kernel.org/powerpc/c/ec97d022f621c6c850aec46d8818b49c6aae95ad
[09/45] powerpc/ptdump: Add _PAGE_COHERENT flag
        https://git.kernel.org/powerpc/c/3af4786eb429b2df76cbd7ce3bae21467ac3e4fb
[10/45] powerpc/ptdump: Display size of BATs
        https://git.kernel.org/powerpc/c/6b30830e2003d9d77696084ebe2fc19dbe7d6f70
[11/45] powerpc/ptdump: Standardise display of BAT flags
        https://git.kernel.org/powerpc/c/8961a2a5353cca5451f648f4838cd848a3b2354c
[12/45] powerpc/ptdump: Properly handle non standard page size
        https://git.kernel.org/powerpc/c/b00ff6d8c1c3898b0f768cbb38ef722d25bd2f39
[13/45] powerpc/ptdump: Handle hugepd at PGD level
        https://git.kernel.org/powerpc/c/6b789a26d7da2e0256d199da980369ef8fb49ec6
[14/45] powerpc/32s: Don't warn when mapping RO data ROX.
        https://git.kernel.org/powerpc/c/4b19f96a81bceaf0bcf44d79c0855c61158065ec
[15/45] powerpc/mm: Allocate static page tables for fixmap
        https://git.kernel.org/powerpc/c/925ac141d106b55acbe112a9272f970631a3c082
[16/45] powerpc/mm: Fix conditions to perform MMU specific management by blocks on PPC32.
        https://git.kernel.org/powerpc/c/4e3319c23a66dabfd6c35f4d2633d64d99b68096
[17/45] powerpc/mm: PTE_ATOMIC_UPDATES is only for 40x
        https://git.kernel.org/powerpc/c/fadaac67c9007cad9fc485e36dcc54460d6d5886
[18/45] powerpc/mm: Refactor pte_update() on nohash/32
        https://git.kernel.org/powerpc/c/2db99aeb63dd6e8808dc054d181c4d0e8645bbe0
[19/45] powerpc/mm: Refactor pte_update() on book3s/32
        https://git.kernel.org/powerpc/c/1c1bf294882bd12669e39ccd7680c4ce34b7c15c
[20/45] powerpc/mm: Standardise __ptep_test_and_clear_young() params between PPC32 and PPC64
        https://git.kernel.org/powerpc/c/c7fa77016eb6093df38fdabdb7a89bb9617e7185
[21/45] powerpc/mm: Standardise pte_update() prototype between PPC32 and PPC64
        https://git.kernel.org/powerpc/c/06f52524870122fb43b214d27e8f4546da36f8ba
[22/45] powerpc/mm: Create a dedicated pte_update() for 8xx
        https://git.kernel.org/powerpc/c/6ad41bfbc907be0cd414f09fa5382d2133376595
[23/45] powerpc/mm: Reduce hugepd size for 8M hugepages on 8xx
        https://git.kernel.org/powerpc/c/b12c07a4bb064c0a8db7554557b89d40f57c936f
[24/45] powerpc/8xx: Drop CONFIG_8xx_COPYBACK option
        https://git.kernel.org/powerpc/c/d3efcd38c0b99162d889e36a30425345a18edb33
[25/45] powerpc/8xx: Prepare handlers for _PAGE_HUGE for 512k pages.
        https://git.kernel.org/powerpc/c/a891c43b97d315ee5f9fe8e797d3d48fc351e053
[26/45] powerpc/8xx: Manage 512k huge pages as standard pages.
        https://git.kernel.org/powerpc/c/b250c8c08c79d1eb5354c7eaa84b7505f5f2d921
[27/45] powerpc/8xx: Only 8M pages are hugepte pages now
        https://git.kernel.org/powerpc/c/d4870b89acd7c362ded08f9295e8d143cf7e0024
[28/45] powerpc/8xx: MM_SLICE is not needed anymore
        https://git.kernel.org/powerpc/c/555904d07eef3a2e5fc458419edf6174362c4ddd
[29/45] powerpc/8xx: Move PPC_PIN_TLB options into 8xx Kconfig
        https://git.kernel.org/powerpc/c/5d4656696c30cef56b2ab506b203533c818af04d
[30/45] powerpc/8xx: Add function to set pinned TLBs
        https://git.kernel.org/powerpc/c/f76c8f6d257cefda60221c83af7f97d9f74cb3ce
[31/45] powerpc/8xx: Don't set IMMR map anymore at boot
        https://git.kernel.org/powerpc/c/136a9a0f74d2e0d9de5515190fe80344b86b45cf
[32/45] powerpc/8xx: Always pin TLBs at startup.
        https://git.kernel.org/powerpc/c/684c1664e0de63398aceb748343541b48d398710
[33/45] powerpc/8xx: Drop special handling of Linear and IMMR mappings in I/D TLB handlers
        https://git.kernel.org/powerpc/c/400dc0f86102d2ad11d3601f1948fbb02e926431
[34/45] powerpc/8xx: Remove now unused TLB miss functions
        https://git.kernel.org/powerpc/c/1251288e64ba44969e1c4d59e5ee88a6e873447b
[35/45] powerpc/8xx: Move DTLB perf handling closer.
        https://git.kernel.org/powerpc/c/0c8c2c9c201b44eed6c10d7c5c8d25fe5aab87ce
[36/45] powerpc/mm: Don't be too strict with _etext alignment on PPC32
        https://git.kernel.org/powerpc/c/a0591b60eef965f7f5255ad4696bbba9af4b43d0
[37/45] powerpc/8xx: Refactor kernel address boundary comparison
        https://git.kernel.org/powerpc/c/c8bef10a9f17b2b9549e37878b2bcd48039c136b
[38/45] powerpc/8xx: Add a function to early map kernel via huge pages
        https://git.kernel.org/powerpc/c/34536d78068318def0a370462cbc3319e1ca9014
[39/45] powerpc/8xx: Map IMMR with a huge page
        https://git.kernel.org/powerpc/c/a623bb5861dc442dc8de9edc9b3116f8b7c235c4
[40/45] powerpc/8xx: Map linear memory with huge pages
        https://git.kernel.org/powerpc/c/cf209951fa7f2e7a8ec92f45f27ea11bc024bbfc
[41/45] powerpc/8xx: Allow STRICT_KERNEL_RwX with pinned TLB
        https://git.kernel.org/powerpc/c/da1adea07576722da4597b0df7d00931f0203229
[42/45] powerpc/8xx: Allow large TLBs with DEBUG_PAGEALLOC
        https://git.kernel.org/powerpc/c/fcdafd10a363cf3278ce29c6c9a92930380c6cd8
[43/45] powerpc/8xx: Implement dedicated kasan_init_region()
        https://git.kernel.org/powerpc/c/a2feeb2c2ecbd9c9206d66f238ca710b760c9ef5
[44/45] powerpc/32s: Allow mapping with BATs with DEBUG_PAGEALLOC
        https://git.kernel.org/powerpc/c/2b279c0348af62f42be346c1ea6d70bac98df0f9
[45/45] powerpc/32s: Implement dedicated kasan_init_region()
        https://git.kernel.org/powerpc/c/7974c4732642f710b5111165ae1f7f7fed822282

cheers
