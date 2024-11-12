Return-Path: <linuxppc-dev+bounces-3125-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D0A9C6157
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2024 20:23:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnxD74Nxcz2xMQ;
	Wed, 13 Nov 2024 06:23:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731439431;
	cv=none; b=O+EF5RZqr3Ph98JFzagXZl1FEMNtMBZiYUJffBdFipDLDPD3jgLxkdmIiYsc4V2AlRUI3TIWW3iEy1iFX9leNyRzM+jz7R5QVNiCoZFWJCJ+zX+3FSSRyp5YqFfo5fF4z/MRygQi6Xab6rAkYhLVG0YoNEV454tpNmGxD5AA+sHSgh4BhrxZc5yMXqn8t8AFHu6Eou62l+nL/zffn655/vKUYMjPI9bbw0dYW/8rcPlx6QLoMSdYeafZEO5Dtu02JbESalBpcz/FSdR36ZJtBzwUb23FQ99rrsEy+WI93j22VytCpT5fWWRzdz9aYbKxqIM8p0PcfleW4FcCr9cJeA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731439431; c=relaxed/relaxed;
	bh=514Cwwg37cjDwGlks2Htu/DlMLs4Z4YtnMfe6cEDDuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HFvx0uZ9b7wKBO9gDWwPqhSVpRfJXQSFAAhs4fn/AAGheZKDK9MMFbK8Sw1MQDGUwDf7bNoerN0JO23ZLK1y8+VSAGDBeuDI6dof+XxiZ1Z2w6Pmo/ZixfdfYNFEZfS3su8vNl7VIupszbmsPhxBAKyUf6g7EmL1Fee+kNd5wTKMIML7veE05guNAEtRfK23z44iCPBnyEHpxd2vMfZa9P6qxNOGEvhO0NOahcGBSid2ovIg6btji1jlpcmLkBIuWXcI6kap8vNKGOYbd0c09EK5tsvTM8dOXbqhyPQ5/YwWArLDrs8EVLHyk6nIMy9YiC1Po3TG3+GU4lkqpzJZ3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca; spf=pass (client-ip=209.85.160.174; helo=mail-qt1-f174.google.com; envelope-from=djvasi@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.174; helo=mail-qt1-f174.google.com; envelope-from=djvasi@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XnxD56Fpwz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 06:23:49 +1100 (AEDT)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4609c9b39d0so39254321cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 11:23:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731439426; x=1732044226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=514Cwwg37cjDwGlks2Htu/DlMLs4Z4YtnMfe6cEDDuc=;
        b=Lfrg8rPGbsJGfSbD9q2eLnCehBaNgGdQT5Klsv3Ic3hjtBoJo9BBoB92sxllOBdV1i
         EGyAv6BCoSY3xgaauSHpCAtnJEj9O/E6axpq2ECuN7vX3qshVRzZhao36STZ3mf/ITcS
         1Z3ZzcZ32WYraeSmh1eM+9eZNOjL81K3WDf0f5nE6lY5/1X82emLzWUq4ihCTbCtWVSx
         RVWP4xS7agLhzy9Pxnu5RfqwXjpL/dEBVVNB1KFD1Q2/XkSqt3Gu7jg9zLDGga33mZfh
         vKJFNINBVRMT/WApX1BWnB+PA8fr0OWRcUg61hI/YeXoJEE7988zV+WbKAavkfFelQle
         PU4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUaAFeHtPRQ/RL5pD37+S0hdPulfaUW5A+Lnk2QoTaSS5hpuEpWERXwFv8SOjMCy2VizQMdQSSesD9d8cU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw2dW/hH32JLT+zSIP6OPDKFxfUJTH/BAwLlGoxrvM0rnepUQ0e
	zjeEB8H5Aoc50R2wDZw6hAlrX6b7GQk5equ20FNyzXyJbn0sw+Yi
X-Google-Smtp-Source: AGHT+IFAV25RZuV+YLWpg6EdKcKzgySKuq8aCBmFO8uEZ8zwSx4/O/r1QU70TbuTgKB1JLBzWjC4HQ==
X-Received: by 2002:a05:622a:2c2:b0:462:bb96:6d5d with SMTP id d75a77b69052e-4634b498491mr4540641cf.10.1731439426030;
        Tue, 12 Nov 2024 11:23:46 -0800 (PST)
Received: from [192.168.2.12] ([70.24.125.223])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ff3df26csm78311031cf.12.2024.11.12.11.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 11:23:45 -0800 (PST)
Message-ID: <71165bc1-8886-4846-bf11-d1dafae040f2@vasilevsky.ca>
Date: Tue, 12 Nov 2024 14:23:32 -0500
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
Subject: Re: [PATCH v2] crash, powerpc: Default to CRASH_DUMP=n on
 PPC_BOOK3S_32
To: glaubitz@physik.fu-berlin.de, bhe@redhat.com,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, mpe@ellerman.id.au,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 ebiederm@xmission.com, horms@verge.net.au
Cc: =?UTF-8?Q?Reimar_D=C3=B6ffinger?= <Reimar.Doeffinger@gmx.de>
References: <20240917163720.1644584-1-dave@vasilevsky.ca>
Content-Language: en-US
From: Dave Vasilevsky <dave@vasilevsky.ca>
In-Reply-To: <20240917163720.1644584-1-dave@vasilevsky.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024-09-17 12:37, Dave Vasilevsky wrote:
> Fixes boot failures on 6.9 on PPC_BOOK3S_32 machines using
> Open Firmware. On these machines, the kernel refuses to boot
> from non-zero PHYSICAL_START, which occurs when CRASH_DUMP is on.

Hi Eric, and other kexec people,

Is there anywhere else I should be sending this patch to request a merge? I don't see a kexec tree anywhere.

Thanks,
Dave
 
> Since most PPC_BOOK3S_32 machines boot via Open Firmware, it should
> default to off for them. Users booting via some other mechanism
> can still turn it on explicitly.
> 
> Does not change the default on any other architectures for the
> time being.
> 
> Signed-off-by: Dave Vasilevsky <dave@vasilevsky.ca>
> Reported-by: Reimar Döffinger <Reimar.Doeffinger@gmx.de>
> Closes: https://lists.debian.org/debian-powerpc/2024/07/msg00001.html
> Fixes: 75bc255a7444 ("crash: clean up kdump related config items")
> ---
>  arch/arm/Kconfig       | 3 +++
>  arch/arm64/Kconfig     | 3 +++
>  arch/loongarch/Kconfig | 3 +++
>  arch/mips/Kconfig      | 3 +++
>  arch/powerpc/Kconfig   | 4 ++++
>  arch/riscv/Kconfig     | 3 +++
>  arch/s390/Kconfig      | 3 +++
>  arch/sh/Kconfig        | 3 +++
>  arch/x86/Kconfig       | 3 +++
>  kernel/Kconfig.kexec   | 2 +-
>  10 files changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 0ec034933cae..4cc31467298b 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1598,6 +1598,9 @@ config ATAGS_PROC
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool y
>  
> +config ARCH_DEFAULT_CRASH_DUMP
> +	def_bool y
> +
>  config AUTO_ZRELADDR
>  	bool "Auto calculation of the decompressed kernel image address" if !ARCH_MULTIPLATFORM
>  	default !(ARCH_FOOTBRIDGE || ARCH_RPC || ARCH_SA1100)
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index ed15b876fa74..8c67b76347d3 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1559,6 +1559,9 @@ config ARCH_DEFAULT_KEXEC_IMAGE_VERIFY_SIG
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool y
>  
> +config ARCH_DEFAULT_CRASH_DUMP
> +	def_bool y
> +
>  config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
>  	def_bool CRASH_RESERVE
>  
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 0e3abf7b0bd3..7ba3baee859e 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -600,6 +600,9 @@ config ARCH_SUPPORTS_KEXEC
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool y
>  
> +config ARCH_DEFAULT_CRASH_DUMP
> +	def_bool y
> +
>  config ARCH_SELECTS_CRASH_DUMP
>  	def_bool y
>  	depends on CRASH_DUMP
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 60077e576935..b547f4304d0c 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -2881,6 +2881,9 @@ config ARCH_SUPPORTS_KEXEC
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool y
>  
> +config ARCH_DEFAULT_CRASH_DUMP
> +	def_bool y
> +
>  config PHYSICAL_START
>  	hex "Physical address where the kernel is loaded"
>  	default "0xffffffff84000000"
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 8a4ee57cd4ef..c04f7bb543cc 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -682,6 +682,10 @@ config RELOCATABLE_TEST
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
>  
> +config ARCH_DEFAULT_CRASH_DUMP
> +	bool
> +	default y if !PPC_BOOK3S_32
> +
>  config ARCH_SELECTS_CRASH_DUMP
>  	def_bool y
>  	depends on CRASH_DUMP
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 86d1f1cea571..341ef759870a 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -882,6 +882,9 @@ config ARCH_SUPPORTS_KEXEC_PURGATORY
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool y
>  
> +config ARCH_DEFAULT_CRASH_DUMP
> +	def_bool y
> +
>  config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
>  	def_bool CRASH_RESERVE
>  
> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index c60e699e99f5..fff371b89e41 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -275,6 +275,9 @@ config ARCH_SUPPORTS_CRASH_DUMP
>  	  This option also enables s390 zfcpdump.
>  	  See also <file:Documentation/arch/s390/zfcpdump.rst>
>  
> +config ARCH_DEFAULT_CRASH_DUMP
> +	def_bool y
> +
>  menu "Processor type and features"
>  
>  config HAVE_MARCH_Z10_FEATURES
> diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
> index e9103998cca9..04ff5fb9242e 100644
> --- a/arch/sh/Kconfig
> +++ b/arch/sh/Kconfig
> @@ -550,6 +550,9 @@ config ARCH_SUPPORTS_KEXEC
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool BROKEN_ON_SMP
>  
> +config ARCH_DEFAULT_CRASH_DUMP
> +	def_bool y
> +
>  config ARCH_SUPPORTS_KEXEC_JUMP
>  	def_bool y
>  
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index d1fe732979d4..7f39db779574 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -2092,6 +2092,9 @@ config ARCH_SUPPORTS_KEXEC_JUMP
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool X86_64 || (X86_32 && HIGHMEM)
>  
> +config ARCH_DEFAULT_CRASH_DUMP
> +	def_bool y
> +
>  config ARCH_SUPPORTS_CRASH_HOTPLUG
>  	def_bool y
>  
> diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> index 6c34e63c88ff..4d111f871951 100644
> --- a/kernel/Kconfig.kexec
> +++ b/kernel/Kconfig.kexec
> @@ -97,7 +97,7 @@ config KEXEC_JUMP
>  
>  config CRASH_DUMP
>  	bool "kernel crash dumps"
> -	default y
> +	default ARCH_DEFAULT_CRASH_DUMP
>  	depends on ARCH_SUPPORTS_CRASH_DUMP
>  	depends on KEXEC_CORE
>  	select VMCORE_INFO


