Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A971D864F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 20:24:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QnVF6Y5ZzDqLq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 04:24:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=msalter@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=R02e7DTE; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=R02e7DTE; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QnQG5GnWzDqkT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 04:21:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589826056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bgUgYOhXHVrOhAbBYxlnYyhMzdekwGrXn9fI5GzJacU=;
 b=R02e7DTE6AfSGT/kUhzmH81a2fEJ34ufqbGIFaAWXoKyh0SMZ9MIko9KOY7BKG0o7gTdaq
 vE5ALxgIHTPL919QCmHQ4btR5vr4lHE0Q12t/fIsbCUQiJNBAp7f6UqXLiGPz0g0n+P0eu
 5oyquCeX6qaAQaeLejCDo3J7i0bVCA8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589826056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bgUgYOhXHVrOhAbBYxlnYyhMzdekwGrXn9fI5GzJacU=;
 b=R02e7DTE6AfSGT/kUhzmH81a2fEJ34ufqbGIFaAWXoKyh0SMZ9MIko9KOY7BKG0o7gTdaq
 vE5ALxgIHTPL919QCmHQ4btR5vr4lHE0Q12t/fIsbCUQiJNBAp7f6UqXLiGPz0g0n+P0eu
 5oyquCeX6qaAQaeLejCDo3J7i0bVCA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-kVRrudnWNEOZ64966nyy_Q-1; Mon, 18 May 2020 14:20:52 -0400
X-MC-Unique: kVRrudnWNEOZ64966nyy_Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 428731005510;
 Mon, 18 May 2020 18:20:48 +0000 (UTC)
Received: from ovpn-115-234.rdu2.redhat.com (ovpn-115-234.rdu2.redhat.com
 [10.10.115.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AF23398;
 Mon, 18 May 2020 18:20:43 +0000 (UTC)
Message-ID: <5260142047d0339e00d4a74865c2f0b7511c89f6.camel@redhat.com>
Subject: Re: [PATCH 10/29] c6x: use asm-generic/cacheflush.h
From: Mark Salter <msalter@redhat.com>
To: Christoph Hellwig <hch@lst.de>, Andrew Morton
 <akpm@linux-foundation.org>,  Arnd Bergmann <arnd@arndb.de>, Roman Zippel
 <zippel@linux-m68k.org>
Date: Mon, 18 May 2020 14:20:42 -0400
In-Reply-To: <20200515143646.3857579-11-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
 <20200515143646.3857579-11-hch@lst.de>
Organization: Red Hat, Inc
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Michal Simek <monstr@monstr.eu>, linux-alpha@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Jessica Yu <jeyu@kernel.org>, sparclinux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-05-15 at 16:36 +0200, Christoph Hellwig wrote:
> C6x needs almost no cache flushing routines of its own.  Rely on
> asm-generic/cacheflush.h for the defaults.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/c6x/include/asm/cacheflush.h | 19 +------------------
>  1 file changed, 1 insertion(+), 18 deletions(-)
> 
> diff --git a/arch/c6x/include/asm/cacheflush.h b/arch/c6x/include/asm/cacheflush.h
> index 4540b40475e6c..10922d528de6d 100644
> --- a/arch/c6x/include/asm/cacheflush.h
> +++ b/arch/c6x/include/asm/cacheflush.h
> @@ -16,21 +16,6 @@
>  #include <asm/page.h>
>  #include <asm/string.h>
>  
> -/*
> - * virtually-indexed cache management (our cache is physically indexed)
> - */
> -#define flush_cache_all()			do {} while (0)
> -#define flush_cache_mm(mm)			do {} while (0)
> -#define flush_cache_dup_mm(mm)			do {} while (0)
> -#define flush_cache_range(mm, start, end)	do {} while (0)
> -#define flush_cache_page(vma, vmaddr, pfn)	do {} while (0)
> -#define flush_cache_vmap(start, end)		do {} while (0)
> -#define flush_cache_vunmap(start, end)		do {} while (0)
> -#define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 0
> -#define flush_dcache_page(page)			do {} while (0)
> -#define flush_dcache_mmap_lock(mapping)		do {} while (0)
> -#define flush_dcache_mmap_unlock(mapping)	do {} while (0)
> -
>  /*
>   * physically-indexed cache management
>   */
> @@ -49,14 +34,12 @@ do {								  \
>  			(unsigned long) page_address(page) + PAGE_SIZE)); \
>  } while (0)
>  
> -
>  #define copy_to_user_page(vma, page, vaddr, dst, src, len) \
>  do {						     \
>  	memcpy(dst, src, len);			     \
>  	flush_icache_range((unsigned) (dst), (unsigned) (dst) + (len)); \
>  } while (0)
>  
> -#define copy_from_user_page(vma, page, vaddr, dst, src, len) \
> -	memcpy(dst, src, len)
> +#include <asm-generic/cacheflush.h>
>  
>  #endif /* _ASM_C6X_CACHEFLUSH_H */

Acked-by: Mark Salter <msalter@redhat.com>


