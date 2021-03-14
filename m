Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A4733A401
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Mar 2021 11:01:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dyw7k56tcz3dJw
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Mar 2021 21:01:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dyw736Tmzz2xxq
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Mar 2021 21:01:19 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Dyw734P9Lz9sWK; Sun, 14 Mar 2021 21:01:19 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <cf61345912c078c96f171afd0fcc48ef27cbdc3f.1614443418.git.christophe.leroy@csgroup.eu>
References: <cf61345912c078c96f171afd0fcc48ef27cbdc3f.1614443418.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Force inlining of mmu_has_feature to fix build
 failure
Message-Id: <161571587146.138988.4861060770867592113.b4-ty@ellerman.id.au>
Date: Sun, 14 Mar 2021 21:01:19 +1100 (AEDT)
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

On Sat, 27 Feb 2021 16:30:48 +0000 (UTC), Christophe Leroy wrote:
> The test robot has managed to generate a random config leading
> to following build failure:
> 
>   LD      .tmp_vmlinux.kallsyms1
> powerpc64-linux-ld: arch/powerpc/mm/pgtable.o: in function `ptep_set_access_flags':
> pgtable.c:(.text.ptep_set_access_flags+0xf0): undefined reference to `hash__flush_tlb_page'
> powerpc64-linux-ld: arch/powerpc/mm/book3s32/mmu.o: in function `MMU_init_hw_patch':
> mmu.c:(.init.text+0x452): undefined reference to `patch__hash_page_A0'
> powerpc64-linux-ld: mmu.c:(.init.text+0x45e): undefined reference to `patch__hash_page_A0'
> powerpc64-linux-ld: mmu.c:(.init.text+0x46a): undefined reference to `patch__hash_page_A1'
> powerpc64-linux-ld: mmu.c:(.init.text+0x476): undefined reference to `patch__hash_page_A1'
> powerpc64-linux-ld: mmu.c:(.init.text+0x482): undefined reference to `patch__hash_page_A2'
> powerpc64-linux-ld: mmu.c:(.init.text+0x48e): undefined reference to `patch__hash_page_A2'
> powerpc64-linux-ld: mmu.c:(.init.text+0x49e): undefined reference to `patch__hash_page_B'
> powerpc64-linux-ld: mmu.c:(.init.text+0x4aa): undefined reference to `patch__hash_page_B'
> powerpc64-linux-ld: mmu.c:(.init.text+0x4b6): undefined reference to `patch__hash_page_C'
> powerpc64-linux-ld: mmu.c:(.init.text+0x4c2): undefined reference to `patch__hash_page_C'
> powerpc64-linux-ld: mmu.c:(.init.text+0x4ce): undefined reference to `patch__flush_hash_A0'
> powerpc64-linux-ld: mmu.c:(.init.text+0x4da): undefined reference to `patch__flush_hash_A0'
> powerpc64-linux-ld: mmu.c:(.init.text+0x4e6): undefined reference to `patch__flush_hash_A1'
> powerpc64-linux-ld: mmu.c:(.init.text+0x4f2): undefined reference to `patch__flush_hash_A1'
> powerpc64-linux-ld: mmu.c:(.init.text+0x4fe): undefined reference to `patch__flush_hash_A2'
> powerpc64-linux-ld: mmu.c:(.init.text+0x50a): undefined reference to `patch__flush_hash_A2'
> powerpc64-linux-ld: mmu.c:(.init.text+0x522): undefined reference to `patch__flush_hash_B'
> powerpc64-linux-ld: mmu.c:(.init.text+0x532): undefined reference to `patch__flush_hash_B'
> powerpc64-linux-ld: arch/powerpc/mm/book3s32/mmu.o: in function `update_mmu_cache':
> mmu.c:(.text.update_mmu_cache+0xa0): undefined reference to `add_hash_page'
> powerpc64-linux-ld: mm/memory.o: in function `zap_pte_range':
> memory.c:(.text.zap_pte_range+0x160): undefined reference to `flush_hash_pages'
> powerpc64-linux-ld: mm/memory.o: in function `handle_pte_fault':
> memory.c:(.text.handle_pte_fault+0x180): undefined reference to `hash__flush_tlb_page'
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: Force inlining of mmu_has_feature to fix build failure
      https://git.kernel.org/powerpc/c/acdad8fb4a1574323db88f98a38b630691574e16

cheers
