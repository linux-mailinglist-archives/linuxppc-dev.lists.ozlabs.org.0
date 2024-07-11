Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2B692E9F9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 15:54:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kBffDW30;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKbnN0T1Bz3cWP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 23:54:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kBffDW30;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mchehab+huawei@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKbmh38fxz3cRd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 23:53:56 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1475861D43;
	Thu, 11 Jul 2024 13:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23420C116B1;
	Thu, 11 Jul 2024 13:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720706032;
	bh=d7eUnvpmqA007vMePeAhiRZGhhclqfU3sA2rSd2dSGE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kBffDW30SyBlZCqOGULzop3FoMuyN+QQ5auURLJHQ5kfGcoTU9L9BiiUyfwL0TSaQ
	 9FyJbO7q3Taqqe/b01urzCCS7eNXube/zETixa6xqPWAxNw0y2W8zPBksMpugkp3Xh
	 LqCNUaKK+sijkltj6+6l3z/RDT8/JrIY4cY7mpsMXX8m9k3JFDhWxB7BPzXudK9MYL
	 QXuBppwEKWmEaJnzivH29zNXl9lYQi4m0+phrN2TkuSEQAdR6LufjZtHVNOyNZhskw
	 5T/LmEct54eHM00gSnnslvBpv1DEFb/gsyCCQQ8a23/HuBXF3K3hL+AVQeIDVE8YMR
	 J6BbIo9b7etPA==
Date: Thu, 11 Jul 2024 15:53:43 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH v12 1/6] uaccess: add generic fallback version of
 copy_mc_to_user()
Message-ID: <20240711155343.3729bc30@foz.lan>
In-Reply-To: <20240528085915.1955987-2-tongtiangen@huawei.com>
References: <20240528085915.1955987-1-tongtiangen@huawei.com>
	<20240528085915.1955987-2-tongtiangen@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, wangkefeng.wang@huawei.com, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, "H. Peter Anvin" <hpa@zytor.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, x86@kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, linuxppc-dev@lists.ozlabs.org, Guohanjun <guohanjun@huawei.com>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Tue, 28 May 2024 16:59:10 +0800
Tong Tiangen <tongtiangen@huawei.com> escreveu:

> x86/powerpc has it's implementation of copy_mc_to_user(), we add generic
> fallback in include/linux/uaccess.h prepare for other architechures to
> enable CONFIG_ARCH_HAS_COPY_MC.
> 
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/include/asm/uaccess.h | 1 +
>  arch/x86/include/asm/uaccess.h     | 1 +
>  include/linux/uaccess.h            | 8 ++++++++
>  3 files changed, 10 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index de10437fd206..df42e6ad647f 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -381,6 +381,7 @@ copy_mc_to_user(void __user *to, const void *from, unsigned long n)
>  
>  	return n;
>  }
> +#define copy_mc_to_user copy_mc_to_user

Such define looks weird on my eyes. What to do you want to do here?

>  #endif
>  
>  extern long __copy_from_user_flushcache(void *dst, const void __user *src,
> diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
> index 0f9bab92a43d..309f2439327e 100644
> --- a/arch/x86/include/asm/uaccess.h
> +++ b/arch/x86/include/asm/uaccess.h
> @@ -497,6 +497,7 @@ copy_mc_to_kernel(void *to, const void *from, unsigned len);
>  
>  unsigned long __must_check
>  copy_mc_to_user(void __user *to, const void *from, unsigned len);
> +#define copy_mc_to_user copy_mc_to_user

Same here.

>  #endif
>  
>  /*
> diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
> index 3064314f4832..0dfa9241b6ee 100644
> --- a/include/linux/uaccess.h
> +++ b/include/linux/uaccess.h
> @@ -205,6 +205,14 @@ copy_mc_to_kernel(void *dst, const void *src, size_t cnt)
>  }
>  #endif
>  
> +#ifndef copy_mc_to_user
> +static inline unsigned long __must_check
> +copy_mc_to_user(void *dst, const void *src, size_t cnt)
> +{
> +	return copy_to_user(dst, src, cnt);
> +}
> +#endif
> +
>  static __always_inline void pagefault_disabled_inc(void)
>  {
>  	current->pagefault_disabled++;



Thanks,
Mauro
