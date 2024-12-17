Return-Path: <linuxppc-dev+bounces-4255-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEB09F4574
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2024 08:48:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YC8766xTdz30V1;
	Tue, 17 Dec 2024 18:48:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734421682;
	cv=none; b=ZWE9COWR8GvzBmWZkRBI/LRwVNfRCAPeZqsOaYKROswng73qvy9TYWGvvST7LKsf5K73aiT6+VRdn/wp5HHXMtCvpCFq9bRlHPPzTVGy/MBvawWyg+o8n4NKBql12Jvz2OLoCV/ILS6p615ULXYDrPiUPAMAqK1eaS/WGNgTmKWxQUzers82pfc6H67rgHOqParMWq8t+LKarCUE4rDVCrtcXTpYchAOImoGgE+Gpnn1mLAgwFlDCjDcHACJeStX78jVtJW6NNI0VhT+jy1RB/JI/9SvDGyUvw5MGNpnek6VxU7FlbMY53MpwpOZ7xDxc2QcbzDgbkqNJL2m7E1ATQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734421682; c=relaxed/relaxed;
	bh=u+CROXNMQB4zsFWzTxbDDJajvghMgBuYZmlPGZXhJXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SjgET5X4xhUjlsU4F4J8AH69O8KaWvaE+JonAch3XWm9hqmrd1CrblV93xZ1ansPh0W5rl+ZGLPv99jX0D8ylxfbM/+BorvZJyzcdweHsxDmOHlaZchMi+LUyfOft2qVN8BzCafFPWKl0Yn+f6RiGAVmPaEUdNfVNGFKDu1wmr0f9FyPp7VAAFn+8qB9RrfoMWnmLkNCh4L8owaEEHwCJ/fpgEFUF5wI+vLyMedbWbC4svt30601VB4IscD0s2aSda+eGeV0jo5V8/UHzJ9qw1U1vWUUwcr2ASLeHAo8HukqtW+RPD/y6R9aY641MgMWmnb4FurbBINwyzWHOGVZsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YC8755l8Qz2xVq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 18:48:01 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YC86z6Lcmz9sPd;
	Tue, 17 Dec 2024 08:47:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fC7tw8E5ccA2; Tue, 17 Dec 2024 08:47:55 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YC86z5K7qz9rvV;
	Tue, 17 Dec 2024 08:47:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A3F418B768;
	Tue, 17 Dec 2024 08:47:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id iR2VLUnfgYsc; Tue, 17 Dec 2024 08:47:55 +0100 (CET)
Received: from [192.168.232.97] (unknown [192.168.232.97])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 73D238B763;
	Tue, 17 Dec 2024 08:47:54 +0100 (CET)
Message-ID: <ddd4439e-6f6f-4513-a7dc-b7f01bec03dc@csgroup.eu>
Date: Tue, 17 Dec 2024 08:47:54 +0100
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
Subject: Re: [PATCH] mm/ptdump: Drop GENERIC_PTDUMP
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: steven.price@arm.com, Catalin Marinas <catalin.marinas@arm.com>,
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
References: <20241217034807.2541349-1-anshuman.khandual@arm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241217034807.2541349-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 17/12/2024 à 04:48, Anshuman Khandual a écrit :
> GENERIC_PTDUMP does not guard any code but instead just used for platform's
> subscription into core ptdump defined under PTDUMP_CORE, which is selected.
> Instead use PTDUMP_CORE for platform subscription and drop GENERIC_PTDUMP.
> 
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
> This patch applies on v6.13-rc3 and has been tested on arm64, although it
> also clears build tests on impacted platforms.
> 
>   Documentation/arch/arm64/ptdump.rst       | 1 -
>   arch/arm64/Kconfig                        | 2 +-
>   arch/arm64/kvm/Kconfig                    | 3 +--
>   arch/powerpc/Kconfig                      | 2 +-
>   arch/powerpc/configs/mpc885_ads_defconfig | 1 -
>   arch/riscv/Kconfig                        | 2 +-
>   arch/s390/Kconfig                         | 2 +-
>   arch/x86/Kconfig                          | 2 +-
>   arch/x86/Kconfig.debug                    | 2 +-
>   kernel/configs/debug.config               | 1 -
>   mm/Kconfig.debug                          | 8 ++------
>   11 files changed, 9 insertions(+), 17 deletions(-)
> 

> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index a0ce777f9706..c716f8df10de 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -203,7 +203,7 @@ config PPC
>   	select GENERIC_IRQ_SHOW
>   	select GENERIC_IRQ_SHOW_LEVEL
>   	select GENERIC_PCI_IOMAP		if PCI
> -	select GENERIC_PTDUMP
> +	select PTDUMP_CORE

Please keep alphabetical order.

>   	select GENERIC_SMP_IDLE_THREAD
>   	select GENERIC_TIME_VSYSCALL
>   	select GENERIC_VDSO_TIME_NS

> diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
> index 41a58536531d..b206e5a11f96 100644
> --- a/mm/Kconfig.debug
> +++ b/mm/Kconfig.debug
> @@ -187,7 +187,7 @@ config DEBUG_WX
>   	bool "Warn on W+X mappings at boot"
>   	depends on ARCH_HAS_DEBUG_WX
>   	depends on MMU
> -	select PTDUMP_CORE
> +	depends on PTDUMP_CORE

This change is unclear to me. It works because all arch selecting 
ARCH_HAS_DEBUG_WX also select GENERIC_PTDUMP. For riscv it's even more 
tricking, Riscv only selects GENERIC_PTDUMP when MMU is set, so it works 
because here it also depends on MMU.

But what happens if in the future an architecture selects 
ARCH_HAS_DEBUG_WX without selecting PTDUMP_CORE ?


>   	help
>   	  Generate a warning if any W+X mappings are found at boot.
>   
> @@ -212,9 +212,6 @@ config DEBUG_WX
>   
>   	  If in doubt, say "Y".
>   
> -config GENERIC_PTDUMP
> -	bool
> -
>   config PTDUMP_CORE
>   	bool
>   
> @@ -222,8 +219,7 @@ config PTDUMP_DEBUGFS
>   	bool "Export kernel pagetable layout to userspace via debugfs"
>   	depends on DEBUG_KERNEL
>   	depends on DEBUG_FS
> -	depends on GENERIC_PTDUMP
> -	select PTDUMP_CORE
> +	depends on PTDUMP_CORE
>   	help
>   	  Say Y here if you want to show the kernel pagetable layout in a
>   	  debugfs file. This information is only useful for kernel developers


