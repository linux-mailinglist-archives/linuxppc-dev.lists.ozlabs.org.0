Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 866AC474F3F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 01:30:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDGNg2lHJz3f3L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 11:30:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDGJr38g5z3c9d
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 11:26:52 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JDGJn2hv2z4xht;
 Wed, 15 Dec 2021 11:26:49 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20211201144153.2456614-1-npiggin@gmail.com>
References: <20211201144153.2456614-1-npiggin@gmail.com>
Subject: Re: [PATCH v6 00/18] powerpc: Make hash MMU code build configurable
Message-Id: <163952785837.919625.843097926961983649.b4-ty@ellerman.id.au>
Date: Wed, 15 Dec 2021 11:24:18 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2 Dec 2021 00:41:35 +1000, Nicholas Piggin wrote:
> Now that there's a platform that can make good use of it, here's
> a series that can prevent the hash MMU code being built for 64s
> platforms that don't need it.
> 
> Since v5:
> - Make cxl select hash.
> - Add new patch (15) to prevent radix using different get_unmapped_area
>   code when hash support is disabled. This is an intermediate step for
>   now, ideally we will end up with radix always going via the generic
>   code.
> 
> [...]

Applied to powerpc/next.

[01/18] powerpc: Remove unused FW_FEATURE_NATIVE references
        https://git.kernel.org/powerpc/c/79b74a68486765a4fe685ac4069bc71366c538f5
[02/18] powerpc: Rename PPC_NATIVE to PPC_HASH_MMU_NATIVE
        https://git.kernel.org/powerpc/c/7ebc49031d0418dc9ca8475b8133a3a161221ef5
[03/18] powerpc/pseries: Stop selecting PPC_HASH_MMU_NATIVE
        https://git.kernel.org/powerpc/c/a4135cbebde8375e2a9d91261b4546ce3f3b9b0f
[04/18] powerpc/64s: Move and rename do_bad_slb_fault as it is not hash specific
        https://git.kernel.org/powerpc/c/935b534c24f014325b72a3619bbbdc18191f9c3d
[05/18] powerpc/pseries: move process table registration away from hash-specific code
        https://git.kernel.org/powerpc/c/0c7cc15e92157c8886c8df3151eac2c43c3dfa2b
[06/18] powerpc/pseries: lparcfg don't include slb_size line in radix mode
        https://git.kernel.org/powerpc/c/3d3282fd34d82caac5005d9c4d4525054eb3cac1
[07/18] powerpc/64s: move THP trace point creation out of hash specific file
        https://git.kernel.org/powerpc/c/162b0889bba6e721c33d12e15971618785ca778e
[08/18] powerpc/64s: Make flush_and_reload_slb a no-op when radix is enabled
        https://git.kernel.org/powerpc/c/310dce6201fd27fda484e34bf543fb55c33d80b1
[09/18] powerpc/64s: move page size definitions from hash specific file
        https://git.kernel.org/powerpc/c/bdad5d57dfcc6d2b2f8d0bc9d7e85ee794d1d50e
[10/18] powerpc/64s: Rename hash_hugetlbpage.c to hugetlbpage.c
        https://git.kernel.org/powerpc/c/f43d2ffb47c9e86f5ec24e1de6ce6da6808634a2
[11/18] powerpc/64: pcpu setup avoid reading mmu_linear_psize on 64e or radix
        https://git.kernel.org/powerpc/c/ffbe5d21d10f9c7890c07fca17db772f941385bf
[12/18] powerpc: make memremap_compat_align 64s-only
        https://git.kernel.org/powerpc/c/20626177c9de726c48802c15e8635cc154645588
[13/18] powerpc/64e: remove mmu_linear_psize
        https://git.kernel.org/powerpc/c/8dbfc0092b5c8c50f011509893bf0396253cd2ab
[14/18] powerpc/64s: Fix radix MMU when MMU_FTR_HPTE_TABLE is clear
        https://git.kernel.org/powerpc/c/af3a0ea41cbf38e967611e262126357d2fd23955
[15/18] powerpc/64s: Always define arch unmapped area calls
        https://git.kernel.org/powerpc/c/debeda017189e40bff23d1c3d2e4567ca8541aed
[16/18] powerpc/64s: Make hash MMU support configurable
        https://git.kernel.org/powerpc/c/c28573744b74eb6de19add503d6a986795c4c137
[17/18] powerpc/64s: Move hash MMU support code under CONFIG_PPC_64S_HASH_MMU
        https://git.kernel.org/powerpc/c/387e220a2e5e630794e1f5219ed6f11e56271c21
[18/18] powerpc/microwatt: add POWER9_CPU, clear PPC_64S_HASH_MMU
        https://git.kernel.org/powerpc/c/31284f703db2f1605b2dbc6bb0632b04d7be13e7

cheers
