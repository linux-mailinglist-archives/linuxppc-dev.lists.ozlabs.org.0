Return-Path: <linuxppc-dev+bounces-15396-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C467BD0067A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 00:38:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmkxL0d57z2yD4;
	Thu, 08 Jan 2026 10:38:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.228
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767826204;
	cv=none; b=PbJbdID2htWZJhg4CYcszNbFSh0gLKIm+xM4QpmZXk+WUjCxNm+iAgeduQqPF3Ph8htakNV838BlRZI5tKd/wGAThtjR7HD1QJKHEdSLrQvQiC3VXDExIYH0B1fDO5hV1WkBbK+XZIyO+1Cl10rHffHoih/54jSmM3NMw8vYdCOyh1jU/2PLAyZ/tOfDt8hO6loKVaWpMvvtumUo1cUKrmS1L2XYQVWlgVun3D8b0J0w73bbMpuUx3BbQYTga4yEsJzt30jJof/lB76nU53eYRJOLkwKnQwoEoKh3gk+10P4PX1Ck8tlAlimdPUET3MklqhI/DneWfrjSGqzo9y3xw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767826204; c=relaxed/relaxed;
	bh=Juxc6ADlnOHcZ+omKTaruPmPtvn8DO25aXGDHp0qX/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U1J7I9XwmZxOWS1efMcey7PEqTBW7FNLQnGwKDRkxE/Avg6XJ2SfST+hxxYYtuJ8ZzJK4oOnU047AWw4cf5VQGnzqZvFy7jdxSxktyyfAC1CoT70OPg8mTnzhxKfsbR/8Sce4/ikinth4K7jxdT9uH+rNHMCdBNHzNHfrdx18FW4C6B4YOTs8XvNFJxKieE0ckY4vYViK2LduedbRFJCOsKNgjeDVrEeDx1WZclw81CW1TikiGsC2vuXrzK7SUioJP1sarMaLmhp5LrPGCvpcdb889ANO/xx+N4CoE6cvWfmxFDkSbY2LxvvGP5DkXeHRLMghBeQ97lde118MYkl7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NnyNM2oN; dkim-atps=neutral; spf=pass (client-ip=209.85.128.228; helo=mail-yw1-f228.google.com; envelope-from=alexey.makhalov@broadcom.com; receiver=lists.ozlabs.org) smtp.mailfrom=broadcom.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NnyNM2oN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=broadcom.com (client-ip=209.85.128.228; helo=mail-yw1-f228.google.com; envelope-from=alexey.makhalov@broadcom.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f228.google.com (mail-yw1-f228.google.com [209.85.128.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmjsk4xD0z2xGg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 09:50:01 +1100 (AEDT)
Received: by mail-yw1-f228.google.com with SMTP id 00721157ae682-7900ab67562so26483187b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 14:50:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767826139; x=1768430939;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Juxc6ADlnOHcZ+omKTaruPmPtvn8DO25aXGDHp0qX/Y=;
        b=HqeCgps84FtieInT+HbiEKtrMWkJx9pLZhQX89GLo8GmjhWZ3o99ohuV6Qh6KRjgm3
         6QD1Nk4V8/vMwzsgNUsPyORLS4DrYmBlNMiwC9jw/871TxisiFWMxuzKjyCJPC6ypYxP
         OvAXKObFIMo1iS65Neb4y6ytHRMD1OWcqsLXc6mL+a+yQ2NclHHh0TtcSoeO2s8x9i6O
         Dt0p6yfnjO+77zoXyeDoqQTF20IsGePxkhHl9ZcegwwXjbMDQSu1KliuTsiP72pAXegs
         WPR6cBbMKOzA8MP0QZ4XOPIcZqLiSRhJM/8CraTEkzjBcciHjJi4CDEf00VjnM9LOwnx
         Lx1g==
X-Forwarded-Encrypted: i=1; AJvYcCX3M7Di8XGEAtkQeZfbUlBLQM/Ixg6+anOsk3uR/vtBN2LvCJ+6DvjpteMkCDKsYRgNhO8Y4Gwr9CIcef4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzu9UdebTxUHpaK4C+3qX/aazqTw7x40VkpPl8QFLII/H7SEorf
	iw9OnaA5Gg/8OU+Rgwk0xrQJ8jpJYVBG9EgZmxk2z7HbDQH3cymTOr2QZXFIz8wqYt9whCgVWRM
	I2azYlUkD3g0S/xhFXU9/hI2E7jNBh479XGs+oSOXXK0de7k1Q71pR81G8HOY1Me8tEU4P5LeEV
	rTfxDPxQQ9rz6JNA4mAbOramB/2SoAj+4hmcMvO0FGuKNU8Cc0xEKCzbriTOP9NJhMjR7a7Ka57
	NopiPfe9IsOsy8V0ZN1Io62
X-Gm-Gg: AY/fxX4j3PkkGrKBx22aWCXMNC2cCsAcW+AeR1dui77G0pwDIULAO7YddyP+bfXe57a
	0gxr24qLK3NJSIS2h6EOupCWfdHXFlqf78TPPMIo15cUQt+quY1mOVEY1+VnFg2fqQ54U7DUH8Z
	YA1eaFd+UJZeD2wvPlfTeJQ7V3NKEROrmjBie7sRaMUYXm8tcOhiLMMLEVv5r0Mr/wSZGEKDBQi
	XG+FudLrQUde8RM4cx+XT4la/2qYsuYGUIhfsiiwK25GT+R/zOMY870VW7o8t/drF5AEdqLtVkb
	GLqo1UAU+kJvutfj8DeDST3+5s58cJZAZOhCBFE+7bZ6Qry2JRnMSgQfYRZ7Yqn8FGKbH+ptewj
	cDPmHoQ7nPHGWmW4OAJSCNp7KWkm4TvCfQnu+HNCILP4mVA65LK9BHzUxVJd35CWcPxw3svS6WX
	ZyD9ISWDJGNWzVuMfrVEn4kco6EnP5nZlTTvursP+IFRdRlQ==
X-Google-Smtp-Source: AGHT+IFETWe45pwYkfZ07hRXxbHHjc/sdbJgflpVbWG3AR2VKhixd1n1NiZsHG/eNsf0f6MSAQZgliQv67Gf
X-Received: by 2002:a05:690e:1611:b0:644:7712:ed72 with SMTP id 956f58d0204a3-64716bd7b38mr3159469d50.43.1767826138629;
        Wed, 07 Jan 2026 14:48:58 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-1.dlp.protect.broadcom.com. [144.49.247.1])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-6470d8b5242sm477634d50.12.2026.01.07.14.48.58
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Jan 2026 14:48:58 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-11f3d181ef2so10018373c88.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 14:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1767826137; x=1768430937; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Juxc6ADlnOHcZ+omKTaruPmPtvn8DO25aXGDHp0qX/Y=;
        b=NnyNM2oNa6ImkTLB6R/CJ3Y8E9ZYU5LnanMtCZRSX6T2UX1pDp+ZV1CTpbPjExn8yc
         Tx0CPjN9pjS6tPDkLCxU1jt8Cq+qeSM5kvovXqWq7RtuIm4xbPvrAI2LzgXOIXSW+4Pu
         18/MbTptpdZOypjEt2fpIX2xkGl//73ugOpBk=
X-Forwarded-Encrypted: i=1; AJvYcCWBaH0ZPPtGeyePEuLcVdZ6xq0yiX+Xb/zV/c/ozBrGZCLpE6NEN6o1LoumbYMUViphR7VM2+NP+HgcTmY=@lists.ozlabs.org
X-Received: by 2002:a05:7022:a8d:b0:11b:d4a8:d24d with SMTP id a92af1059eb24-121f8ad8096mr3559546c88.12.1767826136604;
        Wed, 07 Jan 2026 14:48:56 -0800 (PST)
X-Received: by 2002:a05:7022:a8d:b0:11b:d4a8:d24d with SMTP id a92af1059eb24-121f8ad8096mr3559506c88.12.1767826135928;
        Wed, 07 Jan 2026 14:48:55 -0800 (PST)
Received: from [10.66.193.70] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f248c246sm11503734c88.11.2026.01.07.14.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 14:48:55 -0800 (PST)
Message-ID: <ce5d54a2-fed5-4039-846d-b0ae11d15810@broadcom.com>
Date: Wed, 7 Jan 2026 14:48:51 -0800
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/21] sched: Move clock related paravirt code to
 kernel/sched
To: Juergen Gross <jgross@suse.com>
Cc: Ajay Kaher <ajay.kaher@broadcom.com>, loongarch@lists.linux.dev,
 x86@kernel.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org
References: <20251006074606.1266-1-jgross@suse.com>
 <20251006074606.1266-7-jgross@suse.com>
Content-Language: en-US
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
Autocrypt: addr=alexey.makhalov@broadcom.com; keydata=
 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 EuY0
In-Reply-To: <20251006074606.1266-7-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/6/25 12:45 AM, Juergen Gross wrote:
> Paravirt clock related functions are available in multiple archs.
> 
> In order to share the common parts, move the common static keys
> to kernel/sched/ and remove them from the arch specific files.
> 
> Make a common paravirt_steal_clock() implementation available in
> kernel/sched/cputime.c, guarding it with a new config option
> CONFIG_HAVE_PV_STEAL_CLOCK_GEN, which can be selected by an arch
> in case it wants to use that common variant.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>   arch/Kconfig                           |  3 +++
>   arch/arm/include/asm/paravirt.h        |  4 ----
>   arch/arm/kernel/paravirt.c             |  3 ---
>   arch/arm64/include/asm/paravirt.h      |  4 ----
>   arch/arm64/kernel/paravirt.c           |  4 +---
>   arch/loongarch/include/asm/paravirt.h  |  3 ---
>   arch/loongarch/kernel/paravirt.c       |  3 +--
>   arch/powerpc/include/asm/paravirt.h    |  3 ---
>   arch/powerpc/platforms/pseries/setup.c |  4 +---
>   arch/riscv/include/asm/paravirt.h      |  4 ----
>   arch/riscv/kernel/paravirt.c           |  4 +---
>   arch/x86/include/asm/paravirt.h        |  4 ----
>   arch/x86/kernel/cpu/vmware.c           |  1 +
>   arch/x86/kernel/kvm.c                  |  1 +
>   arch/x86/kernel/paravirt.c             |  3 ---
>   drivers/xen/time.c                     |  1 +
>   include/linux/sched/cputime.h          | 18 ++++++++++++++++++
>   kernel/sched/core.c                    |  5 +++++
>   kernel/sched/cputime.c                 | 13 +++++++++++++
>   kernel/sched/sched.h                   |  2 +-
>   20 files changed, 47 insertions(+), 40 deletions(-)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index ebe08b9186ad..f310ac346fa4 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1051,6 +1051,9 @@ config HAVE_IRQ_TIME_ACCOUNTING
>   	  Archs need to ensure they use a high enough resolution clock to
>   	  support irq time accounting and then call enable_sched_clock_irqtime().
>   
> +config HAVE_PV_STEAL_CLOCK_GEN
> +	bool
> +
>   config HAVE_MOVE_PUD
>   	bool
>   	help
> diff --git a/arch/arm/include/asm/paravirt.h b/arch/arm/include/asm/paravirt.h
> index 95d5b0d625cd..69da4bdcf856 100644
> --- a/arch/arm/include/asm/paravirt.h
> +++ b/arch/arm/include/asm/paravirt.h
> @@ -5,10 +5,6 @@
>   #ifdef CONFIG_PARAVIRT
>   #include <linux/static_call_types.h>
>   
> -struct static_key;
> -extern struct static_key paravirt_steal_enabled;
> -extern struct static_key paravirt_steal_rq_enabled;
> -
>   u64 dummy_steal_clock(int cpu);
>   
>   DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
> diff --git a/arch/arm/kernel/paravirt.c b/arch/arm/kernel/paravirt.c
> index 7dd9806369fb..3895a5578852 100644
> --- a/arch/arm/kernel/paravirt.c
> +++ b/arch/arm/kernel/paravirt.c
> @@ -12,9 +12,6 @@
>   #include <linux/static_call.h>
>   #include <asm/paravirt.h>
>   
> -struct static_key paravirt_steal_enabled;
> -struct static_key paravirt_steal_rq_enabled;
> -
>   static u64 native_steal_clock(int cpu)
>   {
>   	return 0;
> diff --git a/arch/arm64/include/asm/paravirt.h b/arch/arm64/include/asm/paravirt.h
> index 9aa193e0e8f2..c9f7590baacb 100644
> --- a/arch/arm64/include/asm/paravirt.h
> +++ b/arch/arm64/include/asm/paravirt.h
> @@ -5,10 +5,6 @@
>   #ifdef CONFIG_PARAVIRT
>   #include <linux/static_call_types.h>
>   
> -struct static_key;
> -extern struct static_key paravirt_steal_enabled;
> -extern struct static_key paravirt_steal_rq_enabled;
> -
>   u64 dummy_steal_clock(int cpu);
>   
>   DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
> diff --git a/arch/arm64/kernel/paravirt.c b/arch/arm64/kernel/paravirt.c
> index aa718d6a9274..943b60ce12f4 100644
> --- a/arch/arm64/kernel/paravirt.c
> +++ b/arch/arm64/kernel/paravirt.c
> @@ -19,14 +19,12 @@
>   #include <linux/slab.h>
>   #include <linux/types.h>
>   #include <linux/static_call.h>
> +#include <linux/sched/cputime.h>
>   
>   #include <asm/paravirt.h>
>   #include <asm/pvclock-abi.h>
>   #include <asm/smp_plat.h>
>   
> -struct static_key paravirt_steal_enabled;
> -struct static_key paravirt_steal_rq_enabled;
> -
>   static u64 native_steal_clock(int cpu)
>   {
>   	return 0;
> diff --git a/arch/loongarch/include/asm/paravirt.h b/arch/loongarch/include/asm/paravirt.h
> index 3f4323603e6a..d219ea0d98ac 100644
> --- a/arch/loongarch/include/asm/paravirt.h
> +++ b/arch/loongarch/include/asm/paravirt.h
> @@ -5,9 +5,6 @@
>   #ifdef CONFIG_PARAVIRT
>   
>   #include <linux/static_call_types.h>
> -struct static_key;
> -extern struct static_key paravirt_steal_enabled;
> -extern struct static_key paravirt_steal_rq_enabled;
>   
>   u64 dummy_steal_clock(int cpu);
>   DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
> diff --git a/arch/loongarch/kernel/paravirt.c b/arch/loongarch/kernel/paravirt.c
> index b1b51f920b23..8caaa94fed1a 100644
> --- a/arch/loongarch/kernel/paravirt.c
> +++ b/arch/loongarch/kernel/paravirt.c
> @@ -6,11 +6,10 @@
>   #include <linux/kvm_para.h>
>   #include <linux/reboot.h>
>   #include <linux/static_call.h>
> +#include <linux/sched/cputime.h>
>   #include <asm/paravirt.h>
>   
>   static int has_steal_clock;
> -struct static_key paravirt_steal_enabled;
> -struct static_key paravirt_steal_rq_enabled;
>   static DEFINE_PER_CPU(struct kvm_steal_time, steal_time) __aligned(64);
>   DEFINE_STATIC_KEY_FALSE(virt_spin_lock_key);
>   
> diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
> index b78b82d66057..92343a23ad15 100644
> --- a/arch/powerpc/include/asm/paravirt.h
> +++ b/arch/powerpc/include/asm/paravirt.h
> @@ -23,9 +23,6 @@ static inline bool is_shared_processor(void)
>   }
>   
>   #ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
> -extern struct static_key paravirt_steal_enabled;
> -extern struct static_key paravirt_steal_rq_enabled;
> -
>   u64 pseries_paravirt_steal_clock(int cpu);
>   
>   static inline u64 paravirt_steal_clock(int cpu)
> diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
> index b10a25325238..50b26ed8432d 100644
> --- a/arch/powerpc/platforms/pseries/setup.c
> +++ b/arch/powerpc/platforms/pseries/setup.c
> @@ -42,6 +42,7 @@
>   #include <linux/memblock.h>
>   #include <linux/swiotlb.h>
>   #include <linux/seq_buf.h>
> +#include <linux/sched/cputime.h>
>   
>   #include <asm/mmu.h>
>   #include <asm/processor.h>
> @@ -83,9 +84,6 @@ DEFINE_STATIC_KEY_FALSE(shared_processor);
>   EXPORT_SYMBOL(shared_processor);
>   
>   #ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
> -struct static_key paravirt_steal_enabled;
> -struct static_key paravirt_steal_rq_enabled;
> -
>   static bool steal_acc = true;
>   static int __init parse_no_stealacc(char *arg)
>   {
> diff --git a/arch/riscv/include/asm/paravirt.h b/arch/riscv/include/asm/paravirt.h
> index c0abde70fc2c..17e5e39c72c0 100644
> --- a/arch/riscv/include/asm/paravirt.h
> +++ b/arch/riscv/include/asm/paravirt.h
> @@ -5,10 +5,6 @@
>   #ifdef CONFIG_PARAVIRT
>   #include <linux/static_call_types.h>
>   
> -struct static_key;
> -extern struct static_key paravirt_steal_enabled;
> -extern struct static_key paravirt_steal_rq_enabled;
> -
>   u64 dummy_steal_clock(int cpu);
>   
>   DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
> diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
> index fa6b0339a65d..d3c334f16172 100644
> --- a/arch/riscv/kernel/paravirt.c
> +++ b/arch/riscv/kernel/paravirt.c
> @@ -16,15 +16,13 @@
>   #include <linux/printk.h>
>   #include <linux/static_call.h>
>   #include <linux/types.h>
> +#include <linux/sched/cputime.h>
>   
>   #include <asm/barrier.h>
>   #include <asm/page.h>
>   #include <asm/paravirt.h>
>   #include <asm/sbi.h>
>   
> -struct static_key paravirt_steal_enabled;
> -struct static_key paravirt_steal_rq_enabled;
> -
>   static u64 native_steal_clock(int cpu)
>   {
>   	return 0;
> diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
> index 1344d2fb2b86..0ef797ea8440 100644
> --- a/arch/x86/include/asm/paravirt.h
> +++ b/arch/x86/include/asm/paravirt.h
> @@ -30,10 +30,6 @@ static __always_inline u64 paravirt_sched_clock(void)
>   	return static_call(pv_sched_clock)();
>   }
>   
> -struct static_key;
> -extern struct static_key paravirt_steal_enabled;
> -extern struct static_key paravirt_steal_rq_enabled;
> -
>   __visible void __native_queued_spin_unlock(struct qspinlock *lock);
>   bool pv_is_native_spin_unlock(void);
>   __visible bool __native_vcpu_is_preempted(long cpu);
> diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
> index cb3f900c46fc..a3e6936839b1 100644
> --- a/arch/x86/kernel/cpu/vmware.c
> +++ b/arch/x86/kernel/cpu/vmware.c
> @@ -29,6 +29,7 @@
>   #include <linux/efi.h>
>   #include <linux/reboot.h>
>   #include <linux/static_call.h>
> +#include <linux/sched/cputime.h>
>   #include <asm/div64.h>
>   #include <asm/x86_init.h>
>   #include <asm/hypervisor.h>
> diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
> index b67d7c59dca0..d54fd2bc0402 100644
> --- a/arch/x86/kernel/kvm.c
> +++ b/arch/x86/kernel/kvm.c
> @@ -29,6 +29,7 @@
>   #include <linux/syscore_ops.h>
>   #include <linux/cc_platform.h>
>   #include <linux/efi.h>
> +#include <linux/sched/cputime.h>
>   #include <asm/timer.h>
>   #include <asm/cpu.h>
>   #include <asm/traps.h>
> diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
> index ab3e172dcc69..a3ba4747be1c 100644
> --- a/arch/x86/kernel/paravirt.c
> +++ b/arch/x86/kernel/paravirt.c
> @@ -60,9 +60,6 @@ void __init native_pv_lock_init(void)
>   		static_branch_enable(&virt_spin_lock_key);
>   }
>   
> -struct static_key paravirt_steal_enabled;
> -struct static_key paravirt_steal_rq_enabled;
> -
>   static u64 native_steal_clock(int cpu)
>   {
>   	return 0;
> diff --git a/drivers/xen/time.c b/drivers/xen/time.c
> index 5683383d2305..d360ded2ef39 100644
> --- a/drivers/xen/time.c
> +++ b/drivers/xen/time.c
> @@ -8,6 +8,7 @@
>   #include <linux/gfp.h>
>   #include <linux/slab.h>
>   #include <linux/static_call.h>
> +#include <linux/sched/cputime.h>
>   
>   #include <asm/paravirt.h>
>   #include <asm/xen/hypervisor.h>
> diff --git a/include/linux/sched/cputime.h b/include/linux/sched/cputime.h
> index 5f8fd5b24a2e..e90efaf6d26e 100644
> --- a/include/linux/sched/cputime.h
> +++ b/include/linux/sched/cputime.h
> @@ -2,6 +2,7 @@
>   #ifndef _LINUX_SCHED_CPUTIME_H
>   #define _LINUX_SCHED_CPUTIME_H
>   
> +#include <linux/static_call_types.h>
>   #include <linux/sched/signal.h>
>   
>   /*
> @@ -180,4 +181,21 @@ static inline void prev_cputime_init(struct prev_cputime *prev)
>   extern unsigned long long
>   task_sched_runtime(struct task_struct *task);
>   
> +#ifdef CONFIG_PARAVIRT
> +struct static_key;
> +extern struct static_key paravirt_steal_enabled;
> +extern struct static_key paravirt_steal_rq_enabled;
> +
> +#ifdef CONFIG_HAVE_PV_STEAL_CLOCK_GEN
> +u64 dummy_steal_clock(int cpu);
> +
> +DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
> +
> +static inline u64 paravirt_steal_clock(int cpu)
> +{
> +	return static_call(pv_steal_clock)(cpu);
> +}
> +#endif
> +#endif
> +
>   #endif /* _LINUX_SCHED_CPUTIME_H */
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 198d2dd45f59..06a9a20820d4 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -769,6 +769,11 @@ struct rq *task_rq_lock(struct task_struct *p, struct rq_flags *rf)
>    * RQ-clock updating methods:
>    */
>   
> +/* Use CONFIG_PARAVIRT as this will avoid more #ifdef in arch code. */
> +#ifdef CONFIG_PARAVIRT
> +struct static_key paravirt_steal_rq_enabled;
> +#endif
> +
>   static void update_rq_clock_task(struct rq *rq, s64 delta)
>   {
>   /*
> diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
> index 7097de2c8cda..ed8f71e08047 100644
> --- a/kernel/sched/cputime.c
> +++ b/kernel/sched/cputime.c
> @@ -251,6 +251,19 @@ void __account_forceidle_time(struct task_struct *p, u64 delta)
>    * ticks are not redelivered later. Due to that, this function may on
>    * occasion account more time than the calling functions think elapsed.
>    */
> +#ifdef CONFIG_PARAVIRT
> +struct static_key paravirt_steal_enabled;
> +
> +#ifdef CONFIG_HAVE_PV_STEAL_CLOCK_GEN
> +static u64 native_steal_clock(int cpu)
> +{
> +	return 0;
> +}
> +
> +DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
> +#endif
> +#endif
> +
>   static __always_inline u64 steal_account_process_time(u64 maxtime)
>   {
>   #ifdef CONFIG_PARAVIRT
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 0d0fa13cab5c..72fd9268008e 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -82,7 +82,7 @@ struct rt_rq;
>   struct sched_group;
>   struct cpuidle_state;
>   
> -#ifdef CONFIG_PARAVIRT
> +#if defined(CONFIG_PARAVIRT) && !defined(CONFIG_HAVE_PV_STEAL_CLOCK_GEN)
>   # include <asm/paravirt.h>
>   #endif
>   

Acked-by: Alexey Makhalov <alexey.makhalov@broadcom.com>

