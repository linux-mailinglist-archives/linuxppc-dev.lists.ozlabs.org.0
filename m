Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6086933346C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 05:39:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwK9s2nt7z3cjq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 15:39:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=WVHQdA5g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=palmer@dabbelt.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dabbelt-com.20150623.gappssmtp.com
 header.i=@dabbelt-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=WVHQdA5g; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwK9R21pTz3cJN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 15:39:19 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id j6so7850752plx.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Mar 2021 20:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=+6Mi46dcdcY6Da+JW/3IUfZjddU3SLthUc42KkPmXok=;
 b=WVHQdA5geSkOSY2k3mUbcYkex6ma0Gw2o1oSwFbTeaPkVjS435wLMr/aAH7xYFAbsG
 pmmCh0WUXeWGsgxblzt66ObJFDYkyhIjDHeeAIo4W58V1vXCb3ziF6cZZD/uw0NRoIkR
 5AK+k4r9bIgIANyMysONTHMg7VjS5mz7yp1Hobg1oD/qtt16hP45xp/g+BaD53GWgrK1
 9CjkvXdId4bNpmqDBp61v4QboRJcdnj41Vv05Gc7PZZaOSnuO0dL7IGEtsfdyXVUVOgH
 S58fs4sHOok4tIDrwVqrpeJf29up+chRyAK3KbF2erG+UOv9kVoCdA83JkdXwqHVqbdt
 b2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=+6Mi46dcdcY6Da+JW/3IUfZjddU3SLthUc42KkPmXok=;
 b=ZtNBy4Y1AMdHV+vbZ4Wy2JlW8siyelbE90YlMVWteb2zVMSlGsEk0oumOAsy4LiZDu
 MHtAf/i5unOwKVrpnqcfj4Jk0Ke8zutP1gMWqNRNhq672KtUrUbS9z3ekh4JSr7aUKMx
 Qd6DMA95C2mE3f4UHIJhz+kRhcKAe0ioTRLUkD/KHY8MwWIhV6uVjM+SgNaH3+UdjGtE
 MJ0uBispVf033MH7I+t072LnBiu7CWRHK93hY58kbcaEjMyDWIklYqe3E1FjHK7sqLe0
 Aga7p5l8jaVb7HChWJRGSEYF0QOge2t9MeSvE4/Pbc9h7ok6K55Eh6a2YEwJQ7YI7oNI
 bHwQ==
X-Gm-Message-State: AOAM533WsQLbkGyPq51uuHZcXt3yXSIcN66Ujrau/mIUBokCI3dFJX48
 tRAqoabYprOIT+vP3RiAGXKFng==
X-Google-Smtp-Source: ABdhPJwUDSugnDD29UAQUcT0onkjP0AQ6O9yVuCP8VU294FXmjWhze4GQofHqYVvDs93mdTUffp8tQ==
X-Received: by 2002:a17:902:d201:b029:e6:bba:52b3 with SMTP id
 t1-20020a170902d201b02900e60bba52b3mr1165798ply.51.1615351154584; 
 Tue, 09 Mar 2021 20:39:14 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id v26sm14137171pff.195.2021.03.09.20.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 20:39:14 -0800 (PST)
Date: Tue, 09 Mar 2021 20:39:14 -0800 (PST)
X-Google-Original-Date: Tue, 09 Mar 2021 19:56:34 PST (-0800)
Subject: Re: [PATCH 2/6] mm: Generalize SYS_SUPPORTS_HUGETLBFS (rename as
 ARCH_SUPPORTS_HUGETLBFS)
In-Reply-To: <1615278790-18053-3-git-send-email-anshuman.khandual@arm.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: anshuman.khandual@arm.com
Message-ID: <mhng-7d560865-85dd-4876-9f4a-69b4de968c9e@penguin>
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
Cc: dalias@libc.org, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
 James.Bottomley@HansenPartnership.com, linux-mm@kvack.org, paulus@samba.org,
 linux-riscv@lists.infradead.org, will@kernel.org, ysato@users.sourceforge.jp,
 deller@gmx.de, linux@armlinux.org.uk, catalin.marinas@arm.com,
 aou@eecs.berkeley.edu, anshuman.khandual@arm.com, viro@zeniv.linux.org.uk,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 09 Mar 2021 00:33:06 PST (-0800), anshuman.khandual@arm.com wrote:
> SYS_SUPPORTS_HUGETLBFS config has duplicate definitions on platforms that
> subscribe it. Instead, just make it a generic option which can be selected
> on applicable platforms. Also rename it as ARCH_SUPPORTS_HUGETLBFS instead.
> This reduces code duplication and makes it cleaner.
>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-sh@vger.kernel.org
> Cc: linux-fsdevel@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm/Kconfig                       | 5 +----
>  arch/arm64/Kconfig                     | 4 +---
>  arch/mips/Kconfig                      | 6 +-----
>  arch/parisc/Kconfig                    | 5 +----
>  arch/powerpc/Kconfig                   | 3 ---
>  arch/powerpc/platforms/Kconfig.cputype | 6 +++---
>  arch/riscv/Kconfig                     | 5 +----
>  arch/sh/Kconfig                        | 5 +----
>  fs/Kconfig                             | 5 ++++-
>  9 files changed, 13 insertions(+), 31 deletions(-)

[...]

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 85d626b8ce5e..69954db3aca9 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -30,6 +30,7 @@ config RISCV
>  	select ARCH_HAS_STRICT_KERNEL_RWX if MMU
>  	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
>  	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
> +	select ARCH_SUPPORTS_HUGETLBFS if MMU
>  	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>  	select ARCH_WANT_FRAME_POINTERS
>  	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
> @@ -165,10 +166,6 @@ config ARCH_WANT_GENERAL_HUGETLB
>  config ARCH_SUPPORTS_UPROBES
>  	def_bool y
>
> -config SYS_SUPPORTS_HUGETLBFS
> -	depends on MMU
> -	def_bool y
> -
>  config STACKTRACE_SUPPORT
>  	def_bool y

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
