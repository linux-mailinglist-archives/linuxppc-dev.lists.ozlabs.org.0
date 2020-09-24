Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D92FE2771B5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 14:59:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxwB12Gy9zDq9V
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 22:59:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxvTR73QMzDqZj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 22:28:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BxvTR2YxTz9sV1; Thu, 24 Sep 2020 22:28:10 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>,
 "linux-mm @ kvack . org" <linux-mm@kvack.org>
In-Reply-To: <20200914045219.3736466-1-npiggin@gmail.com>
References: <20200914045219.3736466-1-npiggin@gmail.com>
Subject: Re: [PATCH v2 0/4] more mm switching vs TLB shootdown and lazy tlb
 fixes
Message-Id: <160094999385.26280.16775247303184322384.b4-ty@ellerman.id.au>
Date: Thu, 24 Sep 2020 22:28:10 +1000 (AEST)
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-arch@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 14 Sep 2020 14:52:15 +1000, Nicholas Piggin wrote:
> This is an attempt to fix a few different related issues around
> switching mm, TLB flushing, and lazy tlb mm handling.
> 
> This will require all architectures to eventually move to disabling
> irqs over activate_mm, but it's possible we could add another arch
> call after irqs are re-enabled for those few which can't do their
> entire activation with irqs disabled.
> 
> [...]

Applied to powerpc/next.

[1/4] mm: fix exec activate_mm vs TLB shootdown and lazy tlb switching race
      https://git.kernel.org/powerpc/c/d53c3dfb23c45f7d4f910c3a3ca84bf0a99c6143
[2/4] powerpc: select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
      https://git.kernel.org/powerpc/c/66acd46080bd9e5ad2be4b0eb1d498d5145d058e
[3/4] sparc64: remove mm_cpumask clearing to fix kthread_use_mm race
      https://git.kernel.org/powerpc/c/bafb056ce27940c9994ea905336aa8f27b4f7275
[4/4] powerpc/64s/radix: Fix mm_cpumask trimming race vs kthread_use_mm
      https://git.kernel.org/powerpc/c/a665eec0a22e11cdde708c1c256a465ebe768047

cheers
