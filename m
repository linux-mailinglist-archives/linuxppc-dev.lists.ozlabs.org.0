Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A277D94E1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 12:13:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=i7iCK8CG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGz4x74KYz3vhD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 21:13:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=i7iCK8CG;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGyzP6ZKNz3c56
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 21:08:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1698401297;
	bh=bh2SGbEm/VYu88RT5NkddGpfoFKdCZJ1kSqfou4YYXc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=i7iCK8CG9D+ypzboftRNKsIQJlOdlPbHYwIuvKVLZusjLD5SIqrOVgllGjK03Ychj
	 3GukHAPTS8Rdw7X7MU2dD2DXOlqHua0ekBgj/dZDwmIK3o4eVMTg/S36vqQZVoYGVY
	 Ozzod3B3e0WLW9beHM9IW/41vC4e9g685vWXqaEIRd5cc06t5wFI5fvz0X2QTagfWk
	 rzV6oy1j7xxZxe5G3dJ48Kwe4xLF+QcbP3GHWz+YJsVC7ZCP+oi8gUTkdwnZwZ6N1v
	 vd1QoSF3tNOUyZ5jDXCJm++Nunf6ELYbTVy4hRjtj7ZYhPHvJmKnlsnF8MmxXgbHe+
	 34orJRgPrHv7g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SGyzP5FTPz4xWZ;
	Fri, 27 Oct 2023 21:08:17 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1695659959.git.christophe.leroy@csgroup.eu>
References: <cover.1695659959.git.christophe.leroy@csgroup.eu>
Subject: Re: (subset) [PATCH v2 00/37] Implement execute-only protection on powerpc
Message-Id: <169840079669.2701453.14060989221583470394.b4-ty@ellerman.id.au>
Date: Fri, 27 Oct 2023 20:59:56 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 25 Sep 2023 20:31:14 +0200, Christophe Leroy wrote:
> This series reworks _PAGE_FLAGS on all platforms in order
> to implement execute-only protection on all powerpc.
> 
> For all targets except 40x and 604 it will be a real execute-only
> protection as the hardware and/or software allows a distinct protection.
> 
> For 40x and 604 that's a poor's man execute-only protection in the
> way that once the page is in the TLB it can be executed. But it's
> better than nothing and allows to have a similar implementation for
> all sorts of powerpc.
> 
> [...]

Applied to powerpc/next.

[03/37] powerpc/40x: Remove stale PTE_ATOMIC_UPDATES macro
        https://git.kernel.org/powerpc/c/cc8ee288f484a2a59c01ccd4d8a417d6ed3466e3
[04/37] powerpc: Remove pte_ERROR()
        https://git.kernel.org/powerpc/c/3b8547ec4d35778c9f4cc261d85c0cae6c1a8ecb
[05/37] powerpc: Deduplicate prototypes of ptep_set_access_flags() and phys_mem_access_prot()
        https://git.kernel.org/powerpc/c/93f81f6eea10f497e892c52998a2194b4e16c91d
[06/37] powerpc: Refactor update_mmu_cache_range()
        https://git.kernel.org/powerpc/c/da9554e0fe3c7b46912a361a803b50f2655ff30f
[07/37] powerpc: Untangle fixmap.h and pgtable.h and mmu.h
        https://git.kernel.org/powerpc/c/d3e01796728add53ab778298573772d44d52d19c
[08/37] powerpc/nohash: Remove {pte/pmd}_protnone()
        https://git.kernel.org/powerpc/c/81fbb9997057b6e6e5795a08d9a8e10e9f48236f
[09/37] powerpc/nohash: Refactor declaration of {map/unmap}_kernel_page()
        https://git.kernel.org/powerpc/c/7835006979e5415aa4c9bc0e3e7063b5c5943ed4
[10/37] powerpc/nohash: Move 8xx version of pte_update() into pte-8xx.h
        https://git.kernel.org/powerpc/c/4c1a89d983be951a3e39d7f9c1d6987f3054e32d
[11/37] powerpc/nohash: Replace #ifdef CONFIG_44x by IS_ENABLED(CONFIG_44x) in pgtable.h
        https://git.kernel.org/powerpc/c/0f4027eab59261f2fb72586f18efb44be3594dd4
[12/37] powerpc/nohash: Refactor pte_update()
        https://git.kernel.org/powerpc/c/42a2722319f0d3d5612ca8efd3ce7d7eae512291
[13/37] powerpc/nohash: Refactor checking of no-change in pte_update()
        https://git.kernel.org/powerpc/c/7c929ad0b3167e980a3963e03403a761138a4350
[14/37] powerpc/nohash: Deduplicate _PAGE_CHG_MASK
        https://git.kernel.org/powerpc/c/27672be7751f25566e69bc228c8b8440a0772f8b
[15/37] powerpc/nohash: Deduplicate pte helpers
        https://git.kernel.org/powerpc/c/3a4288164d631b88a57119777b15099eb23c6fbf
[16/37] powerpc/nohash: Refactor ptep_test_and_clear_young()
        https://git.kernel.org/powerpc/c/8c3d9eb323bbf2b37cdc5c01ebf9604175b5970f
[17/37] powerpc/nohash: Deduplicate ptep_set_wrprotect() and ptep_get_and_clear()
        https://git.kernel.org/powerpc/c/cc68d77febe055b6499dda5fa13bda976a12a85c
[18/37] powerpc/nohash: Refactor pte_clear()
        https://git.kernel.org/powerpc/c/2ef9f4bb9c47ed30ff3c7961744cae545c034154
[19/37] powerpc/nohash: Refactor __ptep_set_access_flags()
        https://git.kernel.org/powerpc/c/799d8836a7c4f4327833e4a5ca952a1700acdb14
[20/37] powerpc/e500: Simplify pte_mkexec()
        https://git.kernel.org/powerpc/c/4c8dd6c9872d4e89fd2b3a6fc92fd6cc9cdce347
[21/37] powerpc: Implement and use pgprot_nx()
        https://git.kernel.org/powerpc/c/d3c0dfcfc95796701e82719722fd997ec5256013
[22/37] powerpc: Fail ioremap() instead of silently ignoring flags when PAGE_USER is set
        https://git.kernel.org/powerpc/c/c7263f156395d1f2a2142375a75b7b040686a07a
[23/37] powerpc: Remove pte_mkuser() and pte_mkpriviledged()
        https://git.kernel.org/powerpc/c/69339071bb27f0b1371cd23d6dada3f976261c20
[24/37] powerpc: Rely on address instead of pte_user()
        https://git.kernel.org/powerpc/c/a78587473642aec302697cdaceb719a7f8791369
[25/37] powerpc: Refactor permission masks used for __P/__S table and kernel memory flags
        https://git.kernel.org/powerpc/c/a5a08dc90f4513d1a78582ec24b687fad01cc843
[26/37] powerpc/8xx: Use generic permission masks
        https://git.kernel.org/powerpc/c/f9f09b93e80148fc5824afb338c318272abde529
[27/37] powerpc/64s: Use generic permission masks
        https://git.kernel.org/powerpc/c/58f534623c4d8800c2e5d63da9783530848e570c
[28/37] powerpc/nohash: Add _PAGE_WRITE to supplement _PAGE_RW
        https://git.kernel.org/powerpc/c/d20506d4728c3b7408e84d9aececbcb78c3061ee
[29/37] powerpc/nohash: Replace pte_user() by pte_read()
        https://git.kernel.org/powerpc/c/8e9bd41e4ce1001f5b89e4c9a69f870f39d56c12
[30/37] powerpc/e500: Introduce _PAGE_READ and remove _PAGE_USER
        https://git.kernel.org/powerpc/c/48cf93bb168d506a8278a6fb25c2f88c1c93ce6e
[31/37] powerpc/44x: Introduce _PAGE_READ and remove _PAGE_USER
        https://git.kernel.org/powerpc/c/93820bfeefc4a125a6cedd1ee1a956eeb3eb2580
[32/37] powerpc/40x: Introduce _PAGE_READ and remove _PAGE_USER
        https://git.kernel.org/powerpc/c/ed815bd3fe9b14a742e2ae094f7f55f70918dbbc
[33/37] powerpc/32s: Add _PAGE_WRITE to supplement _PAGE_RW
        https://git.kernel.org/powerpc/c/46ebef51fd92f52ba7dca21d3c4332e4127de515
[34/37] powerpc/32s: Introduce _PAGE_READ and remove _PAGE_USER
        https://git.kernel.org/powerpc/c/bac4cffc7c4a009cf0d16f1785a275e0a7715e8d
[35/37] powerpc/ptdump: Display _PAGE_READ and _PAGE_WRITE
        https://git.kernel.org/powerpc/c/ceaba662c06598e52cbe4b90fef6b71b7f965cf9
[36/37] powerpc: Finally remove _PAGE_USER
        https://git.kernel.org/powerpc/c/163a72fa89161b57b05d848aedfbd5103fac9dd7
[37/37] powerpc: Support execute-only on all powerpc
        https://git.kernel.org/powerpc/c/b1fba034a6793e9601d581594a781b46c255471f

cheers
