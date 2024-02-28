Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D7386B9A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 22:07:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IxaCg5UT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlRkS24WWz3bTt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 08:07:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IxaCg5UT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=shorne@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlRjf1XTyz30YS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 08:06:28 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-412a9ea61adso1435975e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 13:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709154383; x=1709759183; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0a8qBD6vozPIAISnQHJRWdPKOWiVN4p5/6pJZQ2dXnQ=;
        b=IxaCg5UThptr2IGsuD62PDJNKHHws3pWS0aB4D998moErH3NG2n8nsuqN8zls08rxm
         gr6dpFFmYnffHTN8k26VkdAs5H1io92FLlTnKa4xTtz0t4rzE2+nEukkmDyOMdfMGGoF
         PMGp1LpOeF68RvxFeNx2qUfsplpGNWocy83U/ckKW8+wHAe/ACUjpGjs1uJ1Cfzry8V4
         czlietCES4PTLjjukG/4YXiFITPk2rkT0XZojDCqEWl16cuBYWx1B543Bnxw92WF6PSm
         0Dv/Ju6AH9TsG2zFSOKFRB4P8ZQnDIghvau6pH892FDNt4tVUyWB2u+8/mTZSTv1AK2z
         6NJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709154383; x=1709759183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0a8qBD6vozPIAISnQHJRWdPKOWiVN4p5/6pJZQ2dXnQ=;
        b=nVjkOzZzm4sZDO2AUnjj1MAMnMSZrjl6Vt2k/oC60c3AWnwXFjfs4tvmjYtJM+JrS/
         3lorZ2QvjBfLn3kTtqga9n1KAsSXugf+u+sHFUugGGme8oK11bhhvRpyHvLv1ww9aP4t
         CM9xCyU7M9komaKYFUPsNVIm3qeFloqqVvaO2oOQRs58T3ayXHfWJ2GJVmouUzmCatdM
         a2sovQuwyVK4fJ1uWLy2V4m9itzmnz/o1KVfN4biX76sbhmO3xdPQ1m0cjvnAZfPghj9
         SgemGm6xNTAA6mjzdnp2fr/v1KgZpRZlwvtYxPFa9CLCkjEDKXLh8QMrdRBKOjoy+dZj
         qlvw==
X-Forwarded-Encrypted: i=1; AJvYcCVQ4nTX4d9Bx8M0XvJKIqhtIzZ6CPaBV+U3MyJSTNZLjC62gw+XxOxcroL8v/9GovAHE+ZCaCtKFuchyeUmqE0bp+frhLU2OBmbqjzW7A==
X-Gm-Message-State: AOJu0YznYPYx51IvRJgts11uP4lzZCzQfeFaRTczeJ8CzBNkoWew2Qkm
	xvdZaHgI8javNhjQ+aTsO3X590SaFeENNLgWsVcNzbJitkXfZLt8
X-Google-Smtp-Source: AGHT+IHczATb7A8ZRTaH383CIQ4ejybI9MzL/yjlqycOyBbx2+IYQRI3gE2POfqlKMAC8LKmr3GeXg==
X-Received: by 2002:a5d:618d:0:b0:33d:f51f:2da5 with SMTP id j13-20020a5d618d000000b0033df51f2da5mr46406wru.7.1709154383088;
        Wed, 28 Feb 2024 13:06:23 -0800 (PST)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net. [86.9.131.95])
        by smtp.gmail.com with ESMTPSA id m1-20020adfa3c1000000b0033d67791dc0sm15568132wrb.43.2024.02.28.13.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 13:06:21 -0800 (PST)
Date: Wed, 28 Feb 2024 21:06:21 +0000
From: Stafford Horne <shorne@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 3/4] arch: define CONFIG_PAGE_SIZE_*KB on all
 architectures
Message-ID: <Zd-gTf6mvVdPEovO@antec>
References: <20240226161414.2316610-1-arnd@kernel.org>
 <20240226161414.2316610-4-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226161414.2316610-4-arnd@kernel.org>
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, Vincenzo Frascino <vincenzo.frascino@arm.com>, Jan Kiszka <jan.kiszka@siemens.com>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-alpha@vger.kernel.org, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Kieran Bingham <kbingham@kernel.org>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, Andy Lutomirski <luto@kernel.org>,
  John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Behnsen <anna-maria@linutronix.de>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 26, 2024 at 05:14:13PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Most architectures only support a single hardcoded page size. In order
> to ensure that each one of these sets the corresponding Kconfig symbols,
> change over the PAGE_SHIFT definition to the common one and allow
> only the hardware page size to be selected.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/alpha/Kconfig                 | 1 +
>  arch/alpha/include/asm/page.h      | 2 +-
>  arch/arm/Kconfig                   | 1 +
>  arch/arm/include/asm/page.h        | 2 +-
>  arch/csky/Kconfig                  | 1 +
>  arch/csky/include/asm/page.h       | 2 +-
>  arch/m68k/Kconfig                  | 3 +++
>  arch/m68k/Kconfig.cpu              | 2 ++
>  arch/m68k/include/asm/page.h       | 6 +-----
>  arch/microblaze/Kconfig            | 1 +
>  arch/microblaze/include/asm/page.h | 2 +-
>  arch/nios2/Kconfig                 | 1 +
>  arch/nios2/include/asm/page.h      | 2 +-
>  arch/openrisc/Kconfig              | 1 +
>  arch/openrisc/include/asm/page.h   | 2 +-
>  arch/riscv/Kconfig                 | 1 +
>  arch/riscv/include/asm/page.h      | 2 +-
>  arch/s390/Kconfig                  | 1 +
>  arch/s390/include/asm/page.h       | 2 +-
>  arch/sparc/Kconfig                 | 2 ++
>  arch/sparc/include/asm/page_32.h   | 2 +-
>  arch/sparc/include/asm/page_64.h   | 3 +--
>  arch/um/Kconfig                    | 1 +
>  arch/um/include/asm/page.h         | 2 +-
>  arch/x86/Kconfig                   | 1 +
>  arch/x86/include/asm/page_types.h  | 2 +-
>  arch/xtensa/Kconfig                | 1 +
>  arch/xtensa/include/asm/page.h     | 2 +-
>  28 files changed, 32 insertions(+), 19 deletions(-)
....
> diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
> index fd9bb76a610b..3586cda55bde 100644
> --- a/arch/openrisc/Kconfig
> +++ b/arch/openrisc/Kconfig
> @@ -25,6 +25,7 @@ config OPENRISC
>  	select GENERIC_CPU_DEVICES
>  	select HAVE_PCI
>  	select HAVE_UID16
> +	select HAVE_PAGE_SIZE_8KB
>  	select GENERIC_ATOMIC64
>  	select GENERIC_CLOCKEVENTS_BROADCAST
>  	select GENERIC_SMP_IDLE_THREAD
> diff --git a/arch/openrisc/include/asm/page.h b/arch/openrisc/include/asm/page.h
> index 44fc1fd56717..7925ce09ab5a 100644
> --- a/arch/openrisc/include/asm/page.h
> +++ b/arch/openrisc/include/asm/page.h
> @@ -18,7 +18,7 @@
>  
>  /* PAGE_SHIFT determines the page size */
>  
> -#define PAGE_SHIFT      13
> +#define PAGE_SHIFT      CONFIG_PAGE_SHIFT
>  #ifdef __ASSEMBLY__
>  #define PAGE_SIZE       (1 << PAGE_SHIFT)
>  #else

For the openrisc bits,

Acked-by: Stafford Horne <shorne@gmail.com>
