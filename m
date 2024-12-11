Return-Path: <linuxppc-dev+bounces-4003-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A729ED9CA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 23:33:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7r2z3N8jz30V7;
	Thu, 12 Dec 2024 09:32:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733956379;
	cv=none; b=gm56SOr2RLD86NC0kmqTWp4gYfE1BE95iU7gysvw4qTZUK2P5hhtv50Mp3MVPQ7lc1N9xfroRJnX8D1XzUnos2YuvmpRINRgnX+WffstzfX4nqVvfXDmCXWi/ZKhFADhiLHkn7d54HQlgVWWZkvFQ+sYsxXgX5o2EXZFcZ/IBCHXztYpshbzyxkNJhlGh2V32pDvl3f2rv7wBcqkaZZtsknOGbK087T9FUbJRyMuCC02GUocQBXmBQmpe65pmw2KCUGz1RQSeaBntXlQ688CH0vMvUu8FdPeZKZ3XMdqMNeapan5rsQVRfSSK7fHngBFZOjo+2eLskq6t8KMFUqQPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733956379; c=relaxed/relaxed;
	bh=+R7WMFr8J5p1lUpd7cHc5bxsSxLWD66PUoHsVuNxldQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=kAqS/mvwfaA5fHPmX+8E2Nd5eUwTzi4FCpG5KF1qRfEkjc1CM8uZkTDB1+GFKodsNyEnsR5/VIB3LvLFzz/Hda22QRcfcJbSiTV5ET9NEDeMNgDR6AxF0XIXSpbp8tAQE1KqZnU5l86qwidhKDUI2y/PHwQcHhaH4BT06uLdfUCLHkyhL5X9m+V7HduBthcjiNGZEo5rmjsoDZlqfDeYK0IH4f2Npj3nKUCbcf/AGTykoIN+JzCPhUEi22p4XTQp+NuLsBuu7GyO7KxrLcPOI+NwbENOnjB7/IFOfAijqwDzKV9vVCcv/mPLRsO1tCh0I2Gk32hK2ue3nUYelsU95A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hia/ijUE; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hia/ijUE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7r2y3Wdsz2yP8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 09:32:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 249745C67E5;
	Wed, 11 Dec 2024 22:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A09FC4CED3;
	Wed, 11 Dec 2024 22:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956376;
	bh=1MJ06IwhKiUOka6t13pDPzzxerzMi81atHP/6c9+22c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Hia/ijUEuZBroxj7nHTcTLUeY0lUzwbIDShfmCnvrhgwkWkpcTiJx7pJ1rDHrcbYd
	 v9xc5XYWsKCanEQ84GJFDJY00b2HgNbwArL4F0yC9b3PGcwDDt8RjKLjKLEhKLhhcd
	 fmxIfg3UO49ThB7NCaSOMylOZeYdgxA9dXMqt5Zh24qGuiC5PnXYEzmSSsUEGzlsGM
	 QIuCwUtbYZSKHZWQsPR/5JQlLYffzh4qHAuBe3D1CDOd8aIWP34Q5xS6MsQDi3t00y
	 2Sa/0R/Urbix0SVQmgQhhgfeqd/s3orjw+NRpayKDn0m9Fbd2FqUvFGpLePlE4DJR6
	 KkGTKHdygfE8A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 710A8380A965;
	Wed, 11 Dec 2024 22:33:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/28] vdso: Preparations for generic data storage
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <173395639200.1729195.15576952837564128066.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:33:12 +0000
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=3Cthomas=2Eweissschuh=40linutronix=2Ede=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, guoren@kernel.org, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, catalin.marinas@arm.com, will@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux@armlinux.org.uk, chenhuacai@kernel.org, kernel@xen0n.name,
 tytso@mit.edu, Jason@zx2c4.com, tsbogend@alpha.franken.de,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
 vincenzo.frascino@arm.com, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 namcao@linutronix.de
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@linutronix.de>:

On Thu, 10 Oct 2024 09:01:02 +0200 you wrote:
> Historically each architecture defined their own datapage to store the
> VDSO data. This stands in contrast to the generic nature of the VDSO
> code itself.
> We plan to introduce a generic framework for the management of the VDSO
> data storage that can be used by all architectures and which works
> together with the existing generic VDSO code.
> 
> [...]

Here is the summary with links:
  - [01/28] csky/vdso: Remove gettimeofday() and friends from VDSO
    (no matching commit)
  - [02/28] csky/vdso: Remove arch_vma_name()
    (no matching commit)
  - [03/28] s390/vdso: Drop LBASE_VDSO
    (no matching commit)
  - [04/28] arm64: vdso: Drop LBASE_VDSO
    (no matching commit)
  - [05/28] arm64: vdso: Use only one single vvar mapping
    (no matching commit)
  - [06/28] riscv: vdso: Use only one single vvar mapping
    https://git.kernel.org/riscv/c/d34b60752fcb
  - [07/28] arm: vdso: Remove assembly for datapage access
    (no matching commit)
  - [08/28] LoongArch: vDSO: Use vdso/datapage.h to access vDSO data
    (no matching commit)
  - [09/28] MIPS: vdso: Avoid name conflict around "vdso_data"
    (no matching commit)
  - [10/28] x86/mm/mmap: Remove arch_vma_name()
    (no matching commit)
  - [11/28] x86: vdso: Use __arch_get_vdso_data() to access vdso data
    (no matching commit)
  - [12/28] x86: vdso: Place vdso_data at beginning of vvar page
    (no matching commit)
  - [13/28] x86: vdso: Access rng data from kernel without vvar
    (no matching commit)
  - [14/28] x86: vdso: Allocate vvar page from C code
    (no matching commit)
  - [15/28] x86: vdso: Access timens vdso data without vvar.h
    (no matching commit)
  - [16/28] x86: vdso: Access rng vdso data without vvar.h
    (no matching commit)
  - [17/28] x86: vdso: Move the rng offset to vsyscall.h
    (no matching commit)
  - [18/28] x86: vdso: Access vdso data without vvar.h
    (no matching commit)
  - [19/28] x86: vdso: Delete vvar.h
    (no matching commit)
  - [20/28] x86: vdso: Split virtual clock pages into dedicated mapping
    (no matching commit)
  - [21/28] powerpc: vdso: Remove offset comment from 32bit vdso_arch_data
    (no matching commit)
  - [22/28] powerpc: procfs: Propagate error of remap_pfn_range()
    (no matching commit)
  - [23/28] powerpc/pseries/lparcfg: Fix printing of system_active_processors
    (no matching commit)
  - [24/28] powerpc/pseries/lparcfg: Use num_possible_cpus() for potential processors
    (no matching commit)
  - [25/28] powerpc: Add kconfig option for the systemcfg page
    (no matching commit)
  - [26/28] powerpc: Split systemcfg data out of vdso data page
    (no matching commit)
  - [27/28] powerpc: Split systemcfg struct definitions out from vdso
    (no matching commit)
  - [28/28] vdso: Rename struct arch_vdso_data to arch_vdso_time_data
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



