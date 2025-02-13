Return-Path: <linuxppc-dev+bounces-6150-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3737A33DD4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2025 12:23:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ytt9R4Hsbz2ymg;
	Thu, 13 Feb 2025 22:23:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739445835;
	cv=none; b=Wp3oQoYhLWiY5qdYDUkxZUKgK0W05WiD2hIId1iXyOYkn6riwLhNUacjfuLWzGkAy5fX/o3y+JcSoj3eHELCvemAisLArjqM66A7OHGpnIdzpP0wl7re7Ta8Wj6GTu87Zd3vrpJSzt0iaaFyJC7Zq5nKEHB44zSqxYDq90G7BpExm9tQfdL0a/YcrdmKFtqD4qdIcHefE0OGMB2zfvhgnXkgTbjhQhPfDQubcrBGtlzB0lbm3Rxoy5wfthAYts3BVW9Egu02uWFyFIqRwqiUbrWIAyFsJdwSOJRlAP4cxfXEpFAKuZoSdcAMmE670/m7MgFDW/leDpg9GKyitD6H1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739445835; c=relaxed/relaxed;
	bh=JeLebbqDX0WJfyw1CE6wJZuiafL/LoNX99Os8d87jXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SagcD4R8oJoQpDv/rphJEtmnapluDlRykrZ3EnJpsHpNgYICm+wwglFv3yXHqD7rU9h5DQf4iMUqJYrQJvUluumfLe8QfqDLdUKBdT3y1oP/keFpnzTTR2u0V3+MweG2+U0o1wBp+GyGCyuTCdQbI9iONVXqHZnhk0YcmPoslw8Eql709KQjb6ujO6ruth5B+66OQo8HrrMPHqsMPzsJAbHf7Uly7F1A0ljnJ9/j1WZpxFT7Of1AgkGO/AElmQsVeIMxWaLz2ss4bzJPhe54LNy2F/vgMLDsU2EdUHt5XyQh6zQR48s7yc8UUYNBBflibgyT2W0YtVt4LnVT0eqaQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=steven.price@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=steven.price@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ytt9Q3KdMz2yVV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2025 22:23:52 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84F7226A4;
	Thu, 13 Feb 2025 03:23:40 -0800 (PST)
Received: from [10.1.32.44] (e122027.cambridge.arm.com [10.1.32.44])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CE743F6A8;
	Thu, 13 Feb 2025 03:23:14 -0800 (PST)
Message-ID: <8e75c5ff-a97b-4a6f-9c8b-ac2598eafe60@arm.com>
Date: Thu, 13 Feb 2025 11:23:10 +0000
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mm: Rename GENERIC_PTDUMP and PTDUMP_CORE
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: christophe.leroy@csgroup.eu, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
References: <20250213040934.3245750-1-anshuman.khandual@arm.com>
 <20250213040934.3245750-5-anshuman.khandual@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250213040934.3245750-5-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 13/02/2025 04:09, Anshuman Khandual wrote:
> Platforms subscribe into generic ptdump implementation via GENERIC_PTDUMP.
> But generic ptdump gets enabled via PTDUMP_CORE. These configs combination
> is confusing as they sound very similar and does not differentiate between
> platform's feature subscription and feature enablement for ptdump. Rename
> the configs as ARCH_HAS_PTDUMP and PTDUMP making it more clear and improve
> readability.

I'm not going to bikeshed over the naming, but a few points below.

> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: kvmarm@lists.linux.dev
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-mm@kvack.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  Documentation/arch/arm64/ptdump.rst       |  4 ++--
>  arch/arm64/Kconfig                        |  2 +-
>  arch/arm64/include/asm/ptdump.h           |  4 ++--
>  arch/arm64/kvm/Kconfig                    |  4 ++--
>  arch/arm64/mm/Makefile                    |  2 +-
>  arch/powerpc/Kconfig                      |  2 +-
>  arch/powerpc/configs/mpc885_ads_defconfig |  2 +-
>  arch/powerpc/mm/Makefile                  |  2 +-
>  arch/riscv/Kconfig                        |  2 +-
>  arch/riscv/mm/Makefile                    |  2 +-
>  arch/s390/Kconfig                         |  2 +-
>  arch/s390/mm/Makefile                     |  2 +-
>  arch/x86/Kconfig                          |  2 +-
>  arch/x86/Kconfig.debug                    |  2 +-
>  arch/x86/mm/Makefile                      |  2 +-
>  mm/Kconfig.debug                          | 12 ++++++------
>  mm/Makefile                               |  2 +-
>  17 files changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/arch/arm64/ptdump.rst b/Documentation/arch/arm64/ptdump.rst
> index 5dcfc5d7cddf..a2e527377da3 100644
> --- a/Documentation/arch/arm64/ptdump.rst
> +++ b/Documentation/arch/arm64/ptdump.rst
> @@ -22,8 +22,8 @@ offlining of memory being accessed by the ptdump code.
>  In order to dump the kernel page tables, enable the following
>  configurations and mount debugfs::
>  
> - CONFIG_GENERIC_PTDUMP=y
> - CONFIG_PTDUMP_CORE=y
> + CONFIG_ARCH_HAS_PTDUMP=y
> + CONFIG_PTDUMP=y
>   CONFIG_PTDUMP_DEBUGFS=y

I think we should drop CONFIG_GENERIC_PTDUMP/CONFIG_ARCH_HAS_PTDUMP from
this list. It's not a user-selectable symbol so there's no need to be
documenting it here.

>  
>   mount -t debugfs nodev /sys/kernel/debug
[...]
> diff --git a/arch/powerpc/configs/mpc885_ads_defconfig b/arch/powerpc/configs/mpc885_ads_defconfig
> index 77306be62e9e..db005618690b 100644
> --- a/arch/powerpc/configs/mpc885_ads_defconfig
> +++ b/arch/powerpc/configs/mpc885_ads_defconfig
> @@ -78,4 +78,4 @@ CONFIG_DEBUG_VM_PGTABLE=y
>  CONFIG_DETECT_HUNG_TASK=y
>  CONFIG_BDI_SWITCH=y
>  CONFIG_PPC_EARLY_DEBUG=y
> -CONFIG_GENERIC_PTDUMP=y
> +CONFIG_PTDUMP=y

I'd suggest dropp this from the defconfig too, just like patch 1 dropped
it from debug.config.

Steve


