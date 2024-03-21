Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A231A88594E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 13:43:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lBaQYgeM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0lW52hm3z3dWF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 23:43:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lBaQYgeM;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0lVN1cpmz3cQm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 23:42:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1711024971;
	bh=/zO2JRQSx2yIFlQ7GeaMJ96UTln9Ndn56Jfacwy/vnQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lBaQYgeMMrcVUleS2KE4HTsdvyldimLhhCWWn2WAZs2wy3Zka8ZPQsaUnnvlvC0Ss
	 UTz3xCPF4Dvkp9/fccVpDduN8LM89uK2STyGhnCIihvBEIULmhqN6IieMTtku6V57i
	 pP+2qv97wswBvqiLdss5oo1M5hLlLxbWkuVzaSZZx19UFSAlNmCTDf/2KichNubu7E
	 VHfnBxtamfBzC9Vxa3lGs3dn5aQgIfi7uw9sfsgG9Dx358AgzKri6sVGfritGheAr5
	 PhffbH8Mqa85tDjjE2M+yvephpZ2lkBysWRs7RTaTOsZensk+oQ5hzqyQg+fMsb7ri
	 i4uc2XtRftH5w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4V0lVK2PzKz4wc1;
	Thu, 21 Mar 2024 23:42:49 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnd Bergmann <arnd@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>
Subject: Re: [PATCH] vdso: use CONFIG_PAGE_SHIFT in vdso/datapage.h
In-Reply-To: <20240320180228.136371-1-arnd@kernel.org>
References: <20240320180228.136371-1-arnd@kernel.org>
Date: Thu, 21 Mar 2024 23:42:46 +1100
Message-ID: <87h6gzzrg9.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Anna-Maria Behnsen <anna-maria@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arnd Bergmann <arnd@kernel.org> writes:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Both the vdso rework and the CONFIG_PAGE_SHIFT changes were merged during
> the v6.9 merge window, so it is now possible to use CONFIG_PAGE_SHIFT
> instead of including asm/page.h in the vdso.
>
> This avoids the workaround for arm64 and addresses a build warning
> for powerpc64:
>
> In file included from <built-in>:4:
> In file included from /home/arnd/arm-soc/arm-soc/lib/vdso/gettimeofday.c:5:
> In file included from ../include/vdso/datapage.h:25:
> arch/powerpc/include/asm/page.h:230:9: error: result of comparison of constant 13835058055282163712 with expression of type 'unsigned long' is always true [-Werror,-Wtautological-constant-out-of-range-compare]
>   230 |         return __pa(kaddr) >> PAGE_SHIFT;
>       |                ^~~~~~~~~~~
> arch/powerpc/include/asm/page.h:217:37: note: expanded from macro '__pa'
>   217 |         VIRTUAL_WARN_ON((unsigned long)(x) < PAGE_OFFSET);              \
>       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
> arch/powerpc/include/asm/page.h:202:73: note: expanded from macro 'VIRTUAL_WARN_ON'
>   202 | #define VIRTUAL_WARN_ON(x)      WARN_ON(IS_ENABLED(CONFIG_DEBUG_VIRTUAL) && (x))
>       |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
> arch/powerpc/include/asm/bug.h:88:25: note: expanded from macro 'WARN_ON'
>    88 |         int __ret_warn_on = !!(x);                              \
>       |                                ^
>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>
> Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
> See-also: 8b3843ae3634 ("vdso/datapage: Quick fix - use asm/page-def.h for ARM64")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/powerpc/include/asm/vdso/gettimeofday.h | 3 +--
>  include/vdso/datapage.h                      | 8 +-------
>  2 files changed, 2 insertions(+), 9 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

> diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
> index f0a4cf01e85c..78302f6c2580 100644
> --- a/arch/powerpc/include/asm/vdso/gettimeofday.h
> +++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
> @@ -4,7 +4,6 @@
>  
>  #ifndef __ASSEMBLY__
>  
> -#include <asm/page.h>
>  #include <asm/vdso/timebase.h>
>  #include <asm/barrier.h>
>  #include <asm/unistd.h>
> @@ -95,7 +94,7 @@ const struct vdso_data *__arch_get_vdso_data(void);
>  static __always_inline
>  const struct vdso_data *__arch_get_timens_vdso_data(const struct vdso_data *vd)
>  {
> -	return (void *)vd + PAGE_SIZE;
> +	return (void *)vd + (1U << CONFIG_PAGE_SHIFT);
>  }
>  #endif
>  
> diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
> index 5d5c0b8efff2..c71ddb6d4691 100644
> --- a/include/vdso/datapage.h
> +++ b/include/vdso/datapage.h
> @@ -19,12 +19,6 @@
>  #include <vdso/time32.h>
>  #include <vdso/time64.h>
>  
> -#ifdef CONFIG_ARM64
> -#include <asm/page-def.h>
> -#else
> -#include <asm/page.h>
> -#endif
> -
>  #ifdef CONFIG_ARCH_HAS_VDSO_DATA
>  #include <asm/vdso/data.h>
>  #else
> @@ -132,7 +126,7 @@ extern struct vdso_data _timens_data[CS_BASES] __attribute__((visibility("hidden
>   */
>  union vdso_data_store {
>  	struct vdso_data	data[CS_BASES];
> -	u8			page[PAGE_SIZE];
> +	u8			page[1U << CONFIG_PAGE_SHIFT];
>  };
>  
>  /*
> -- 
> 2.39.2
