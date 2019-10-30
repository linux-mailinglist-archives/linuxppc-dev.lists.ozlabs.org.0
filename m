Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A014DEA5CF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 22:56:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473Mj91G7MzDqJM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 08:56:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="uLOcqf/T"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473Mg50VgjzF4nm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 08:54:24 +1100 (AEDT)
Received: from localhost (unknown [40.117.208.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C76520873;
 Wed, 30 Oct 2019 21:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572472462;
 bh=blVoqJXk/HvCPrn5vtmxzPbTNmjTHB3KuCuWkqR96uQ=;
 h=Date:From:To:To:To:To:Cc:Cc:Cc:Cc:Cc:Cc:Subject:In-Reply-To:
 References:From;
 b=uLOcqf/Ty2H6b3jfVyEFK1rEd0bXnUSPJUP+G8USyBv1XpxzRnKmEktbqhhqB72Zc
 KvsvQRtynw7BDYwaMkhc6uqUUJ0adu8LPEWaShrBw3tvaEwLo/yGx9U1ioS5P81LLo
 PkhZfk8loXzOS+/6qUlVhLXwPEt+zc4dVBc6KJf4=
Date: Wed, 30 Oct 2019 21:54:20 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
Subject: Re: [PATCH v3 3/8] powerpc: Fix vDSO clock_getres()
In-Reply-To: <ef64223696f0e6ce18693649e88a219585f0144f.1572342582.git.christophe.leroy@c-s.fr>
References: <ef64223696f0e6ce18693649e88a219585f0144f.1572342582.git.christophe.leroy@c-s.fr>
Message-Id: <20191030215422.1C76520873@mail.kernel.org>
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag,
fixing commit: a7f290dad32ee [PATCH] powerpc: Merge vdso's and add vdso support to 32 bits kernel.

The bot has tested the following trees: v5.3.8, v4.19.81, v4.14.151, v4.9.198, v4.4.198.

v5.3.8: Build OK!
v4.19.81: Build OK!
v4.14.151: Failed to apply! Possible dependencies:
    5c929885f1bb4 ("powerpc/vdso64: Add support for CLOCK_{REALTIME/MONOTONIC}_COARSE")
    b5b4453e7912f ("powerpc/vdso64: Fix CLOCK_MONOTONIC inconsistencies across Y2038")

v4.9.198: Failed to apply! Possible dependencies:
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

v4.4.198: Failed to apply! Possible dependencies:
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


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks,
Sasha
