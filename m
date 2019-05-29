Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB56D2DDFB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2019 15:20:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45DWYB0BJ8zDqRh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2019 23:20:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="R7gVn7iu"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45DWQs2DLfzDqHk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2019 23:15:01 +1000 (AEST)
Received: from localhost (unknown [23.100.24.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 50626217D4;
 Wed, 29 May 2019 13:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559135699;
 bh=O/8evzPRCciUudwmym3BED9Gn/r0gJgN81NDZ5pjxHA=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Cc:Cc:Cc:Subject:In-Reply-To:
 References:From;
 b=R7gVn7iuzshVNzVyC3st5StP4NTPD0tKrmw7r4IewDAgdHNomVIDBRzM716FfmMi2
 qSbgbm068B4uoVvrDtTuyV3xTD7N3hVCj9tTr7L/EP/TZM+Uzim5zrzfD6Vt+bXljX
 L9Z9BwNmQzFzBfIZVAZDD924d9EVg/uOihQ70y0s=
Date: Wed, 29 May 2019 13:14:58 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
To: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
Subject: Re: [PATCH v3 1/3] powerpc: Fix vDSO clock_getres()
In-Reply-To: <20190522110722.28094-2-vincenzo.frascino@arm.com>
References: <20190522110722.28094-2-vincenzo.frascino@arm.com>
Message-Id: <20190529131459.50626217D4@mail.kernel.org>
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
Cc: , stable@vger.kernel.org, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag,
fixing commit: a7f290dad32ee [PATCH] powerpc: Merge vdso's and add vdso support to 32 bits kernel.

The bot has tested the following trees: v5.1.4, v5.0.18, v4.19.45, v4.14.121, v4.9.178, v4.4.180, v3.18.140.

v5.1.4: Build OK!
v5.0.18: Build OK!
v4.19.45: Build OK!
v4.14.121: Failed to apply! Possible dependencies:
    5c929885f1bb4 ("powerpc/vdso64: Add support for CLOCK_{REALTIME/MONOTONIC}_COARSE")
    b5b4453e7912f ("powerpc/vdso64: Fix CLOCK_MONOTONIC inconsistencies across Y2038")

v4.9.178: Failed to apply! Possible dependencies:
    4546561551106 ("powerpc/asm: Use OFFSET macro in asm-offsets.c")
    5c929885f1bb4 ("powerpc/vdso64: Add support for CLOCK_{REALTIME/MONOTONIC}_COARSE")
    5d451a87e5ebb ("powerpc/64: Retrieve number of L1 cache sets from device-tree")
    7c5b06cadf274 ("KVM: PPC: Book3S HV: Adapt TLB invalidations to work on POWER9")
    83677f551e0a6 ("KVM: PPC: Book3S HV: Adjust host/guest context switch for POWER9")
    902e06eb86cd6 ("powerpc/32: Change the stack protector canary value per task")
    b5b4453e7912f ("powerpc/vdso64: Fix CLOCK_MONOTONIC inconsistencies across Y2038")
    bd067f83b0840 ("powerpc/64: Fix naming of cache block vs. cache line")
    e2827fe5c1566 ("powerpc/64: Clean up ppc64_caches using a struct per cache")
    e9cf1e085647b ("KVM: PPC: Book3S HV: Add new POWER9 guest-accessible SPRs")
    f4c51f841d2ac ("KVM: PPC: Book3S HV: Modify guest entry/exit paths to handle radix guests")

v4.4.180: Failed to apply! Possible dependencies:
    153086644fd1f ("powerpc/ftrace: Add support for -mprofile-kernel ftrace ABI")
    3eb5d5888dc68 ("powerpc: Add ppc_strict_facility_enable boot option")
    4546561551106 ("powerpc/asm: Use OFFSET macro in asm-offsets.c")
    579e633e764e6 ("powerpc: create flush_all_to_thread()")
    5c929885f1bb4 ("powerpc/vdso64: Add support for CLOCK_{REALTIME/MONOTONIC}_COARSE")
    70fe3d980f5f1 ("powerpc: Restore FPU/VEC/VSX if previously used")
    85baa095497f3 ("powerpc/livepatch: Add live patching support on ppc64le")
    902e06eb86cd6 ("powerpc/32: Change the stack protector canary value per task")
    b5b4453e7912f ("powerpc/vdso64: Fix CLOCK_MONOTONIC inconsistencies across Y2038")
    bf76f73c5f655 ("powerpc: enable UBSAN support")
    c208505900b23 ("powerpc: create giveup_all()")
    d1e1cf2e38def ("powerpc: clean up asm/switch_to.h")
    dc4fbba11e466 ("powerpc: Create disable_kernel_{fp,altivec,vsx,spe}()")
    f17c4e01e906c ("powerpc/module: Mark module stubs with a magic value")

v3.18.140: Failed to apply! Possible dependencies:
    10239733ee861 ("powerpc: Remove bootmem allocator")
    2449acc5348b9 ("powerpc/kernel: Enable seccomp filter")
    4546561551106 ("powerpc/asm: Use OFFSET macro in asm-offsets.c")
    49e4e15619cd7 ("tile: support CONTEXT_TRACKING and thus NOHZ_FULL")
    5c929885f1bb4 ("powerpc/vdso64: Add support for CLOCK_{REALTIME/MONOTONIC}_COARSE")
    73569d87e2cc5 ("MIPS: OCTEON: Enable little endian kernel.")
    817820b0226a1 ("powerpc/iommu: Support "hybrid" iommu/direct DMA ops for coherent_mask < dma_mask")
    83fe27ea53116 ("rcu: Make SRCU optional by using CONFIG_SRCU")
    85baa095497f3 ("powerpc/livepatch: Add live patching support on ppc64le")
    b01aec9b2c7d3 ("EDAC: Cleanup atomic_scrub mess")
    b30e759072c18 ("powerpc/mm: Switch to generic RCU get_user_pages_fast")
    b5b4453e7912f ("powerpc/vdso64: Fix CLOCK_MONOTONIC inconsistencies across Y2038")
    bf76f73c5f655 ("powerpc: enable UBSAN support")
    c54b2bf1b5e99 ("powerpc: Add ppc64 hard lockup detector support")
    f30c59e921f12 ("mm: Update generic gup implementation to handle hugepage directory")
    f47436734dc89 ("tile: Use the more common pr_warn instead of pr_warning")


How should we proceed with this patch?

--
Thanks,
Sasha
