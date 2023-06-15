Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 019F9730E76
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 07:00:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eEFN1zC7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhVTv2YMVz3brl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 15:00:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eEFN1zC7;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhSZq5rD5z3039
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 13:34:27 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QhSZn5RL6z4wjB;
	Thu, 15 Jun 2023 13:34:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1686800067;
	bh=YpcS1BrLjvGbDxUqeoV3otHCJ3+/0YDjxYK8icm+ysA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eEFN1zC7xAn1Wr3Kit71RQEzhLSL4SIBGcM6Ixe1KFqmhMEDomwzMDGJd3HwTL8zN
	 Z5SzsEAPWzmB9tToxQgSaEVOZXcEQR7leaAQGQjisqMEYiBBeqWsC5xWKqS8nyBQLS
	 pZzn7lqvIK5M7QTIjRhq5k3woxwBsVmXj1ytVeSX3L8BgOr6n2Y9Xmg03KpI+lVpeE
	 ZQAqJIHwBFhFhWRd2V6IMzeNMrigU4PNW1gqmzYWbgPI4yfBONTfaDdJaTx2Ggqek4
	 HbDECZQGZ/n1t7b6XWR17o8sR8f4D6jNZpL9A5ut0u3lqw1gvXjyrzPclYoftupZAa
	 PNxDjHn73WIPw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Eric DeVolder <eric.devolder@oracle.com>, linux@armlinux.org.uk,
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 geert@linux-m68k.org, tsbogend@alpha.franken.de,
 James.Bottomley@HansenPartnership.com, deller@gmx.de,
 ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, 86@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org
Subject: Re: [PATCH v1 10/21] powerpc/kexec: refactor for kernel/Kconfig.kexec
In-Reply-To: <20230612172805.681179-11-eric.devolder@oracle.com>
References: <20230612172805.681179-1-eric.devolder@oracle.com>
 <20230612172805.681179-11-eric.devolder@oracle.com>
Date: Thu, 15 Jun 2023 13:34:25 +1000
Message-ID: <87fs6tflfi.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Thu, 15 Jun 2023 14:58:14 +1000
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
Cc: peterz@infradead.org, linus.walleij@linaro.org, thunder.leizhen@huawei.com, hpa@zytor.com, kernel@xen0n.name, eric.devolder@oracle.com, ardb@kernel.org, tsi@tuyoix.net, agordeev@linux.ibm.com, paulmck@kernel.org, bhe@redhat.com, masahiroy@kernel.org, konrad.wilk@oracle.com, sebastian.reichel@collabora.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, paul.walmsley@sifive.com, boris.ostrovsky@oracle.com, ziy@nvidia.com, hbathini@linux.ibm.com, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Eric DeVolder <eric.devolder@oracle.com> writes:

> The kexec and crash kernel options are provided in the common
> kernel/Kconfig.kexec. Utilize the common options and provide
> the ARCH_HAS_ and ARCH_SUPPORTS_ entries to recreate the
> equivalent set of KEXEC and CRASH options.
>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  arch/powerpc/Kconfig | 55 ++++++++++++++------------------------------
>  1 file changed, 17 insertions(+), 38 deletions(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index bff5820b7cda..36f2fe0cc8a5 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -588,41 +588,21 @@ config PPC64_SUPPORTS_MEMORY_FAILURE
>  	default "y" if PPC_POWERNV
>  	select ARCH_SUPPORTS_MEMORY_FAILURE
>  
> -config KEXEC
> -	bool "kexec system call"
> -	depends on PPC_BOOK3S || PPC_E500 || (44x && !SMP)
> -	select KEXEC_CORE
> -	help
> -	  kexec is a system call that implements the ability to shutdown your
> -	  current kernel, and to start another kernel.  It is like a reboot
> -	  but it is independent of the system firmware.   And like a reboot
> -	  you can start any kernel with it, not just Linux.
> -
> -	  The name comes from the similarity to the exec system call.
> -
> -	  It is an ongoing process to be certain the hardware in a machine
> -	  is properly shutdown, so do not be surprised if this code does not
> -	  initially work for you.  As of this writing the exact hardware
> -	  interface is strongly in flux, so no good recommendation can be
> -	  made.
> -
> -config KEXEC_FILE
> -	bool "kexec file based system call"
> -	select KEXEC_CORE
> -	select HAVE_IMA_KEXEC if IMA
> -	select KEXEC_ELF
> -	depends on PPC64
> -	depends on CRYPTO=y
> -	depends on CRYPTO_SHA256=y
...
> +
> +config ARCH_HAS_KEXEC_FILE
> +	def_bool PPC64 && CRYPTO && CRYPTO_SHA256

The =y's got lost here.

I think they were both meaningful, because both options are tristate. So
this previously required them to be built-in (=y), whereas after your
patch it will allow them to be modules.

I don't know for sure that those options need to be built-in, but that's
what the code does now, so this patch shouldn't change it, at least
without an explanation.

cheers
