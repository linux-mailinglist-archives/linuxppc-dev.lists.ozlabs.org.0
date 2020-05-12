Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2221D02C2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 01:02:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MCxl0gNtzDqn2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 09:02:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=palmer@dabbelt.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dabbelt-com.20150623.gappssmtp.com
 header.i=@dabbelt-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=YV0IEXO5; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MCvR6SbZzDqdr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 09:00:32 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id q24so10126122pjd.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 May 2020 16:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=TxR+iMR41NNC8Tp0Yh5G0J9anaHo/y+mAo5OJ6FnE3w=;
 b=YV0IEXO5IABYUMUtMWw6Y0a2xNZhYt4iDNMNdBJAdhkLz+DhDJrEb2/tely+kMRfBe
 elzT7mfwntttCi0+nBJzpxqW1RzbdA4k2z5m0sbPhXbgm86NhUGJ6ezv1UWvqUAF6AFb
 GwYEyZnEpPlXtS0AdB1oOMIXhoSzH1oQ3QYdKyFvf7rV9a0F5474HoxquQdEEcVsoVZk
 mkFDvy/LaDlTuj+uY+/sZnyRH+3w/Rut2ArIzwHPIrhPI856FrWtiOC99MOqCPnAlAt1
 y5de0EiQgDBn8VhocdW7T7X+feJnXd114pzMo7qEMcn1qfbF3zf4gbB8O6Pkx7p0q4QB
 ZmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=TxR+iMR41NNC8Tp0Yh5G0J9anaHo/y+mAo5OJ6FnE3w=;
 b=C4Ab0ba09PaFTZsBEwFtj1uQzWRcfSWj4DXus9KJ6vteCH32YPOfR7ZJd88+RfUAP0
 Or9i9UzxAazmBcS9r1fSCvGeQwd2iSvGnBeF54vvND26RUH8fXY8XaGzYnYUK7wBM4J5
 meQZ2vceLDzZUYkeDlhS8sEakuMKUWCZSJkuecCly58ajmZFtZzLiYCsWwhguwoyKxUA
 J066t0rYfwZIynEQMYdjwUa4KU9nYHLBPGzg+nhq63W2jiVtFDHYbQEEuwkRc1Xgo9Q6
 OB1XLvzIREduQ1TzMfLPnDBee2+5ObKp2p97sYZgn/LU2BH7xdaLz4dDzQ/HPlYoT9N8
 hEjw==
X-Gm-Message-State: AGi0PubPAf3gsC2LXKTjiyYNbjB2G44b0yCsqVHwO0wV/9IZ+05UZx1n
 RdPsXk9z9NhykONJgeq9+uR4Hw==
X-Google-Smtp-Source: APiQypKPbiNIuzOhnfWZK3aSuAimZ6kMvjtjoB3PUVWkLgrXCsrrvonJs2vHPqxiHQA1YoMJYuJ02Q==
X-Received: by 2002:a17:90a:2281:: with SMTP id
 s1mr31687737pjc.68.1589324428530; 
 Tue, 12 May 2020 16:00:28 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w143sm12602170pfc.165.2020.05.12.16.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 16:00:26 -0700 (PDT)
Date: Tue, 12 May 2020 16:00:26 -0700 (PDT)
X-Google-Original-Date: Tue, 12 May 2020 15:59:50 PDT (-0700)
Subject: Re: [PATCH 19/31] riscv: use asm-generic/cacheflush.h
In-Reply-To: <20200510075510.987823-20-hch@lst.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <mhng-8adbedbc-0f91-4291-9471-2df5eb7b802b@palmerdabbelt-glaptop1>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, zippel@linux-m68k.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, jeyu@kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org,
 monstr@monstr.eu, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 10 May 2020 00:54:58 PDT (-0700), Christoph Hellwig wrote:
> RISC-V needs almost no cache flushing routines of its own.  Rely on
> asm-generic/cacheflush.h for the defaults.
>
> Also remove the pointless __KERNEL__ ifdef while we're at it.
> ---
>  arch/riscv/include/asm/cacheflush.h | 62 ++---------------------------
>  1 file changed, 3 insertions(+), 59 deletions(-)
>
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index c8677c75f82cb..a167b4fbdf007 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -8,65 +8,6 @@
>
>  #include <linux/mm.h>
>
> -#define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 0
> -
> -/*
> - * The cache doesn't need to be flushed when TLB entries change when
> - * the cache is mapped to physical memory, not virtual memory
> - */
> -static inline void flush_cache_all(void)
> -{
> -}
> -
> -static inline void flush_cache_mm(struct mm_struct *mm)
> -{
> -}
> -
> -static inline void flush_cache_dup_mm(struct mm_struct *mm)
> -{
> -}
> -
> -static inline void flush_cache_range(struct vm_area_struct *vma,
> -				     unsigned long start,
> -				     unsigned long end)
> -{
> -}
> -
> -static inline void flush_cache_page(struct vm_area_struct *vma,
> -				    unsigned long vmaddr,
> -				    unsigned long pfn)
> -{
> -}
> -
> -static inline void flush_dcache_mmap_lock(struct address_space *mapping)
> -{
> -}
> -
> -static inline void flush_dcache_mmap_unlock(struct address_space *mapping)
> -{
> -}
> -
> -static inline void flush_icache_page(struct vm_area_struct *vma,
> -				     struct page *page)
> -{
> -}
> -
> -static inline void flush_cache_vmap(unsigned long start, unsigned long end)
> -{
> -}
> -
> -static inline void flush_cache_vunmap(unsigned long start, unsigned long end)
> -{
> -}
> -
> -#define copy_to_user_page(vma, page, vaddr, dst, src, len) \
> -	do { \
> -		memcpy(dst, src, len); \
> -		flush_icache_user_range(vma, page, vaddr, len); \
> -	} while (0)
> -#define copy_from_user_page(vma, page, vaddr, dst, src, len) \
> -	memcpy(dst, src, len)
> -
>  static inline void local_flush_icache_all(void)
>  {
>  	asm volatile ("fence.i" ::: "memory");
> @@ -79,6 +20,7 @@ static inline void flush_dcache_page(struct page *page)
>  	if (test_bit(PG_dcache_clean, &page->flags))
>  		clear_bit(PG_dcache_clean, &page->flags);
>  }
> +#define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 1
>
>  /*
>   * RISC-V doesn't have an instruction to flush parts of the instruction cache,
> @@ -105,4 +47,6 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
>  #define SYS_RISCV_FLUSH_ICACHE_LOCAL 1UL
>  #define SYS_RISCV_FLUSH_ICACHE_ALL   (SYS_RISCV_FLUSH_ICACHE_LOCAL)
>
> +#include <asm-generic/cacheflush.h>
> +
>  #endif /* _ASM_RISCV_CACHEFLUSH_H */

Thanks!

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Were you trying to get these all in at once, or do you want me to take it into
my tree?
