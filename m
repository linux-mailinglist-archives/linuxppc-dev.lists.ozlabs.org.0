Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 423492DAC70
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 12:58:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwGwv3wftzDq63
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 22:58:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwFVN3G2dzDqRh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 21:53:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CwFVN2CBTz9sS8; Tue, 15 Dec 2020 21:53:32 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <648e2448e938d52d0b5887445e018ca584edc06d.1603348103.git.christophe.leroy@csgroup.eu>
References: <648e2448e938d52d0b5887445e018ca584edc06d.1603348103.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 01/20] powerpc/feature: Fix CPU_FTRS_ALWAYS by removing
 CPU_FTRS_GENERIC_32
Message-Id: <160802955561.509074.16674731922690701129.b4-ty@ellerman.id.au>
Date: Tue, 15 Dec 2020 21:53:32 +1100 (AEDT)
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

On Thu, 22 Oct 2020 06:29:26 +0000 (UTC), Christophe Leroy wrote:
> On 8xx, we get the following features:
> 
> [    0.000000] cpu_features      = 0x0000000000000100
> [    0.000000]   possible        = 0x0000000000000120
> [    0.000000]   always          = 0x0000000000000000
> 
> This is not correct. As CONFIG_PPC_8xx is mutually exclusive with all
> other configurations, the three lines should be equal.
> 
> [...]

Patches 1-19 applied to powerpc/next.

[01/20] powerpc/feature: Fix CPU_FTRS_ALWAYS by removing CPU_FTRS_GENERIC_32
        https://git.kernel.org/powerpc/c/78665179e569c7e1fe102fb6c21d0f5b6951f084
[02/20] powerpc/mm: Add mask of always present MMU features
        https://git.kernel.org/powerpc/c/f9158d58a4e1d91f21741e4e8ebe67f770b84e12
[03/20] powerpc/mm: Remove flush_tlb_page_nohash() prototype.
        https://git.kernel.org/powerpc/c/a54d310856b9c1fe15ad67a2f8ee9edc02965a3a
[04/20] powerpc/32s: Make bat_addrs[] static
        https://git.kernel.org/powerpc/c/03d5b19c7243d6e605d360972dd7b701e2b1ba72
[05/20] powerpc/32s: Use mmu_has_feature(MMU_FTR_HPTE_TABLE) instead of checking Hash var
        https://git.kernel.org/powerpc/c/4cc445b4ff456f3a3997c321d7a353360feea04f
[06/20] powerpc/32s: Make Hash var static
        https://git.kernel.org/powerpc/c/4b74a35fc7e9b8efd9067b8a365bab0fefe889ff
[07/20] powerpc/32s: Declare Hash related vars as __initdata
        https://git.kernel.org/powerpc/c/6e980b5c56a266de479fcd022a03e094574e9a03
[08/20] powerpc/32s: Move _tlbie() and _tlbia() prototypes to tlbflush.h
        https://git.kernel.org/powerpc/c/cfe32ad0b3dc74df34ab6fea38ccb1e53f904a10
[09/20] powerpc/32s: Inline _tlbie() on non SMP
        https://git.kernel.org/powerpc/c/b91280f3f36d64cc6f8022893af00935c99de197
[10/20] powerpc/32s: Move _tlbie() and _tlbia() in a new file
        https://git.kernel.org/powerpc/c/f265512582a047e09390b1b41384f365d7dc806f
[11/20] powerpc/32s: Split and inline flush_tlb_mm() and flush_tlb_page()
        https://git.kernel.org/powerpc/c/fd1b4b7f51d0d75b73eeda41ef459ea7791aaab2
[12/20] powerpc/32s: Inline flush_tlb_range() and flush_tlb_kernel_range()
        https://git.kernel.org/powerpc/c/1e83396f29d75aae8a1d365f597996fec87ca4d0
[13/20] powerpc/32s: Split and inline flush_range()
        https://git.kernel.org/powerpc/c/91ec450f8d8c1e599a943c526ab1d2a4acf73c22
[14/20] powerpc/32s: Inline tlb_flush()
        https://git.kernel.org/powerpc/c/ef08d95546ccea540f6a592b89822bb085bf09c6
[15/20] powerpc/32s: Inline flush_hash_entry()
        https://git.kernel.org/powerpc/c/80007a17fc59bc2766f7d5cb2f79b4c65651504b
[16/20] powerpc/32s: Move early_mmu_init() into mmu.c
        https://git.kernel.org/powerpc/c/068fdba10ea54b6ebc12c2b2d85020b2137316d1
[17/20] powerpc/32s: Remove CONFIG_PPC_BOOK3S_6xx
        https://git.kernel.org/powerpc/c/a6a50d8495d098b6459166c3707ab251d3dc9e06
[18/20] powerpc/32s: Regroup 603 based CPUs in cputable
        https://git.kernel.org/powerpc/c/ad510e37e4b48f7da462650946aeaa078b977277
[19/20] powerpc/32s: Make support for 603 and 604+ selectable
        https://git.kernel.org/powerpc/c/44e9754d63c7b419874e4c18c0b5e7a770e058c6

cheers
