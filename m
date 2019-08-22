Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E99CA99B10
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 19:20:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Drrr1Qk1zDrJv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 03:20:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="NLvw4ONs"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Drnc2Y4nzDqfD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 03:17:40 +1000 (AEST)
Received: from localhost (unknown [40.117.208.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD2D1233FD;
 Thu, 22 Aug 2019 17:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566494258;
 bh=0AIk+vAFwsc7eHqkj5iiHthwp5ajAdvd9MibhV6Q2/k=;
 h=Date:From:To:To:To:To:Cc:Cc:Cc:Cc:Cc:Cc:Subject:In-Reply-To:
 References:From;
 b=NLvw4ONsu9vrmi4Dt/4DYgOdm++fIjFCx+kWWNspQaedu6Hr0zve7rHFo3x3fI/S1
 WLANyt4CKEPv8cvDsiAFMA8SMOnnIZJ1DvKmBhj8tf5QGtPI59wyMVvXBCzHoS7MvI
 g0L+YUI0rP1CQuWa3gGLNs/6tDcJZi4M0ZfhnpLs=
Date: Thu, 22 Aug 2019 17:17:37 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
Subject: Re: [PATCH v2 3/8] powerpc: Fix vDSO clock_getres()
In-Reply-To: <4a609ab9f76ebeb01742ea09b42e2ec3d7cb2418.1566491310.git.christophe.leroy@c-s.fr>
References: <4a609ab9f76ebeb01742ea09b42e2ec3d7cb2418.1566491310.git.christophe.leroy@c-s.fr>
Message-Id: <20190822171737.DD2D1233FD@mail.kernel.org>
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
fixing commit: a7f290dad32e [PATCH] powerpc: Merge vdso's and add vdso support to 32 bits kernel.

The bot has tested the following trees: v5.2.9, v4.19.67, v4.14.139, v4.9.189, v4.4.189.

v5.2.9: Build OK!
v4.19.67: Build OK!
v4.14.139: Failed to apply! Possible dependencies:
    5c929885f1bb ("powerpc/vdso64: Add support for CLOCK_{REALTIME/MONOTONIC}_COARSE")
    b5b4453e7912 ("powerpc/vdso64: Fix CLOCK_MONOTONIC inconsistencies across Y2038")

v4.9.189: Failed to apply! Possible dependencies:
    454656155110 ("powerpc/asm: Use OFFSET macro in asm-offsets.c")
    5c929885f1bb ("powerpc/vdso64: Add support for CLOCK_{REALTIME/MONOTONIC}_COARSE")
    5d451a87e5eb ("powerpc/64: Retrieve number of L1 cache sets from device-tree")
    7c5b06cadf27 ("KVM: PPC: Book3S HV: Adapt TLB invalidations to work on POWER9")
    83677f551e0a ("KVM: PPC: Book3S HV: Adjust host/guest context switch for POWER9")
    902e06eb86cd ("powerpc/32: Change the stack protector canary value per task")
    b5b4453e7912 ("powerpc/vdso64: Fix CLOCK_MONOTONIC inconsistencies across Y2038")
    bd067f83b084 ("powerpc/64: Fix naming of cache block vs. cache line")
    e2827fe5c156 ("powerpc/64: Clean up ppc64_caches using a struct per cache")
    e9cf1e085647 ("KVM: PPC: Book3S HV: Add new POWER9 guest-accessible SPRs")
    f4c51f841d2a ("KVM: PPC: Book3S HV: Modify guest entry/exit paths to handle radix guests")

v4.4.189: Failed to apply! Possible dependencies:
    153086644fd1 ("powerpc/ftrace: Add support for -mprofile-kernel ftrace ABI")
    3eb5d5888dc6 ("powerpc: Add ppc_strict_facility_enable boot option")
    454656155110 ("powerpc/asm: Use OFFSET macro in asm-offsets.c")
    579e633e764e ("powerpc: create flush_all_to_thread()")
    5c929885f1bb ("powerpc/vdso64: Add support for CLOCK_{REALTIME/MONOTONIC}_COARSE")
    70fe3d980f5f ("powerpc: Restore FPU/VEC/VSX if previously used")
    85baa095497f ("powerpc/livepatch: Add live patching support on ppc64le")
    902e06eb86cd ("powerpc/32: Change the stack protector canary value per task")
    b5b4453e7912 ("powerpc/vdso64: Fix CLOCK_MONOTONIC inconsistencies across Y2038")
    bf76f73c5f65 ("powerpc: enable UBSAN support")
    c208505900b2 ("powerpc: create giveup_all()")
    d1e1cf2e38de ("powerpc: clean up asm/switch_to.h")
    dc4fbba11e46 ("powerpc: Create disable_kernel_{fp,altivec,vsx,spe}()")
    f17c4e01e906 ("powerpc/module: Mark module stubs with a magic value")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

--
Thanks,
Sasha
