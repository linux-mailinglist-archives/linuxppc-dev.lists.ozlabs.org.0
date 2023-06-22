Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0A073A426
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 17:03:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20221208.gappssmtp.com header.i=@dabbelt-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=mt+u4MU2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qn3X903xTz3brj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 01:03:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20221208.gappssmtp.com header.i=@dabbelt-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=mt+u4MU2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=palmer@dabbelt.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qn3WF43QWz30PJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 01:02:15 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1b51780bed0so56459425ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 08:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687446130; x=1690038130;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=faWv91VP2z/YbKZA+qDwvC+H5Ebg0LphINaB6C6XGBI=;
        b=mt+u4MU2N69BdCB48EipZPFZvxxegmfx/OHOcyc/fM4PZHcrYAkSQWkcdFUsmp5rNU
         a6j2G9cgP05nAPrTpXTrKstR8E5BoO42DmiP6/AZUuIG/6/BBMLFuw5aAo/SAHPeZdEg
         DNvDehDx9+J7nZG9sBU7G6/wpPi2vu+msKWiZ8QFox3/ruMzFIOZCnfnj843xufxdgu9
         MeGUmiA7Z/dRVBK3NdT9B4ymhpM9c0qpwKNXpegEvvYhn5T1kxweIZjlNE+fattEVIvn
         jG1RiXKH3SvzlebwvUPYmft34NdlnUAiikYo4SRSggxh+pPF10pxJtEKozp+lS8TepIG
         aHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687446130; x=1690038130;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faWv91VP2z/YbKZA+qDwvC+H5Ebg0LphINaB6C6XGBI=;
        b=HidLXQEw+zRKdM1gaZqVtVepV933IUEjRQIe+6KJSNzPqBlSUh5RqgNfr3LvJfrHAD
         4SvVbbbdyPPeActYlAb4sxq5iMJTxvPFRW0+Q1zl6fYCL4lDSraxbJs84UwZEf9nyjyo
         6yd9Alh5pV5OmzGpWEaubPayyg3joxgPWuPd7UTogxIGwzHwGzMxK7/axrMeRpBGGX6n
         2BTdMfzv0crTR6bLbv3IEiTVvhp1HU/UzP1oz3pyVK/gSpg/94brBI1GK/IQ82Kdfz9W
         64izvtNU9v0MiF4rqjiwSNJ51zypQr1juGdcJi1kstBDsyU9iq7c/uRmdytKE+BUAB1e
         G1cQ==
X-Gm-Message-State: AC+VfDwf6HFkSGA9PqGIaoWGc8tLgAP8b/3qiVPNKkclFPU19Wx+3TVb
	y1fF5FPaDOoPUWwWulo8+H0VXw==
X-Google-Smtp-Source: ACHHUZ7sxI2/l9NYWY43UXjLd7//zIrvDML1M6VqO+WFrtnEGO/KRuc42ZZ7KlADjiu835vi4h/IOA==
X-Received: by 2002:a17:902:f7c6:b0:1ae:14d:8d0a with SMTP id h6-20020a170902f7c600b001ae014d8d0amr15965819plw.29.1687446130063;
        Thu, 22 Jun 2023 08:02:10 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id z7-20020a170902708700b001b3dada0e78sm5466709plk.258.2023.06.22.08.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 08:02:09 -0700 (PDT)
Date: Thu, 22 Jun 2023 08:02:09 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Jun 2023 08:01:29 PDT (-0700)
Subject: Re: [PATCH 11/14] init: consolidate prototypes in linux/init.h
In-Reply-To: <20230517131102.934196-12-arnd@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: arnd@kernel.org
Message-ID: <mhng-eb6e6d97-fe40-4755-9be5-eb75a690d88c@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-kselftest@vger.kernel.org, rafael@kernel.org, peterz@infradead.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, pavel@ucw.cz, cl@linux.com, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, paul@paul-moore.com, linux-sh@vger.kernel.org, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, dennis@kernel.org, boqun.feng@gmail.com, Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, hca@linux.ibm.com, longman@redhat.com, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, monstr@monstr.eu, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, eparis@redhat.com, audit@vger.kernel.org, tj@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 17 May 2023 06:10:59 PDT (-0700), arnd@kernel.org wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The init/main.c file contains some extern declarations for functions
> defined in architecture code, and it defines some other functions that
> are called from architecture code with a custom prototype. Both of those
> result in warnings with 'make W=1':
>
> init/calibrate.c:261:37: error: no previous prototype for 'calibrate_delay_is_known' [-Werror=missing-prototypes]
> init/main.c:790:20: error: no previous prototype for 'mem_encrypt_init' [-Werror=missing-prototypes]
> init/main.c:792:20: error: no previous prototype for 'poking_init' [-Werror=missing-prototypes]
> arch/arm64/kernel/irq.c:122:13: error: no previous prototype for 'init_IRQ' [-Werror=missing-prototypes]
> arch/arm64/kernel/time.c:55:13: error: no previous prototype for 'time_init' [-Werror=missing-prototypes]
> arch/x86/kernel/process.c:935:13: error: no previous prototype for 'arch_post_acpi_subsys_init' [-Werror=missing-prototypes]
> init/calibrate.c:261:37: error: no previous prototype for 'calibrate_delay_is_known' [-Werror=missing-prototypes]
> kernel/fork.c:991:20: error: no previous prototype for 'arch_task_cache_init' [-Werror=missing-prototypes]
>
> Add prototypes for all of these in include/linux/init.h or another
> appropriate header, and remove the duplicate declarations from
> architecture specific code.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/include/asm/irq.h          |  1 -
>  arch/microblaze/include/asm/setup.h |  2 --
>  arch/mips/include/asm/irq.h         |  1 -
>  arch/parisc/kernel/smp.c            |  1 -
>  arch/powerpc/include/asm/irq.h      |  1 -
>  arch/riscv/include/asm/irq.h        |  2 --
>  arch/riscv/include/asm/timex.h      |  2 --
>  arch/s390/kernel/entry.h            |  2 --
>  arch/sh/include/asm/irq.h           |  1 -
>  arch/sh/include/asm/rtc.h           |  2 --
>  arch/sparc/include/asm/irq_32.h     |  1 -
>  arch/sparc/include/asm/irq_64.h     |  1 -
>  arch/sparc/include/asm/timer_64.h   |  1 -
>  arch/sparc/kernel/kernel.h          |  4 ----
>  arch/x86/include/asm/irq.h          |  2 --
>  arch/x86/include/asm/mem_encrypt.h  |  3 ---
>  arch/x86/include/asm/time.h         |  1 -
>  arch/x86/include/asm/tsc.h          |  1 -
>  include/linux/acpi.h                |  3 ++-
>  include/linux/delay.h               |  1 +
>  include/linux/init.h                | 20 ++++++++++++++++++++
>  init/main.c                         | 18 ------------------
>  22 files changed, 23 insertions(+), 48 deletions(-)

...

> diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
> index 43b9ebfbd943..8e10a94430a2 100644
> --- a/arch/riscv/include/asm/irq.h
> +++ b/arch/riscv/include/asm/irq.h
> @@ -16,6 +16,4 @@ void riscv_set_intc_hwnode_fn(struct fwnode_handle *(*fn)(void));
>
>  struct fwnode_handle *riscv_get_intc_hwnode(void);
>
> -extern void __init init_IRQ(void);
> -
>  #endif /* _ASM_RISCV_IRQ_H */
> diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
> index d6a7428f6248..a06697846e69 100644
> --- a/arch/riscv/include/asm/timex.h
> +++ b/arch/riscv/include/asm/timex.h
> @@ -88,6 +88,4 @@ static inline int read_current_timer(unsigned long *timer_val)
>  	return 0;
>  }
>
> -extern void time_init(void);
> -
>  #endif /* _ASM_RISCV_TIMEX_H */

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V
Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V

Thanks!


