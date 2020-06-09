Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AC41F342C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 08:41:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h0rR4xFxzDqVs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 16:41:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzFx5tJfzDqRt
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:29:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzFm2XS3z9sV2; Tue,  9 Jun 2020 15:29:31 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20200504122907.49304-1-npiggin@gmail.com>
References: <20200504122907.49304-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s/radix: Don't prefetch DAR in update_mmu_cache
Message-Id: <159168032814.1381411.1771312093421462132.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:29:31 +1000 (AEST)
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

On Mon, 4 May 2020 22:29:07 +1000, Nicholas Piggin wrote:
> The idea behind this prefetch was to kick off a page table walk before
> returning from the fault, getting some pipelining advantage.
> 
> But this never showed up any noticable performance advantage, and in
> fact with KUAP the prefetches are actually blocked and cause some
> kind of micro-architectural fault. Removing this improves page fault
> microbenchmark performance by about 9%.

Applied to powerpc/next.

[1/1] powerpc/64s/radix: Don't prefetch DAR in update_mmu_cache
      https://git.kernel.org/powerpc/c/18594f9b8c45484bd527ebc6b08383b95f58ba73

cheers
