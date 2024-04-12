Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA068A2DFC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 14:08:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IOU+aZGz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VGFhX1084z3vXX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 22:08:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IOU+aZGz;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VGFgl6lkwz3dDq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 22:07:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1712923664;
	bh=+6L46Us/2qlRhhkFSf/ej11Qri1UigkSqyiqW3R+DUI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IOU+aZGzxjVQGUXs2pw3MGEBG639NiwT0y6sGprZHf7Os4Du4lZbd15clakEZjfA+
	 7spFZncmALJZjPxb2riROX0JC7IU4Q1+CxgnGF72ggg8kTz0BP9FBCNClXs+yKVZz+
	 FFh+dls+x7OSoR+55xOG4T9SohJuAwfG1KoS6LuKG/w94nhF4o6FzkH98j4AHeGTVb
	 cW2Ks+0fefdPnSaIjKrz5voEW0QgS52f/Rbe8TUPGHD/a9cR2WDdzkYJtCt2dIOgSb
	 OVKC3O4ITvcuykiPCyOrXF9qQM1DqHG8s+/9g/Iu6DgxzMotp878IQIXxaehv86OBn
	 XWMy5lQ5sDmrA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VGFgd3XgTz4wnr;
	Fri, 12 Apr 2024 22:07:41 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Vignesh Balasubramanian <vigbalas@amd.com>,
 linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org
Subject: Re: [PATCH 1/1] Replace macro "ARCH_HAVE_EXTRA_ELF_NOTES" with kconfig
In-Reply-To: <20240412062138.1132841-2-vigbalas@amd.com>
References: <20240412062138.1132841-1-vigbalas@amd.com>
 <20240412062138.1132841-2-vigbalas@amd.com>
Date: Fri, 12 Apr 2024 22:07:39 +1000
Message-ID: <87il0mdbsk.fsf@mail.lhotse>
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
Cc: felix.willgerodt@intel.com, matz@suse.de, keescook@chromium.org, jhb@FreeBSD.org, bpetkov@amd.com, binutils@sourceware.org, x86@kernel.org, aneesh.kumar@kernel.org, linux-mm@kvack.org, Vignesh Balasubramanian <vigbalas@amd.com>, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jinisusan.george@amd.com, ebiederm@xmission.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vignesh Balasubramanian <vigbalas@amd.com> writes:
> "ARCH_HAVE_EXTRA_ELF_NOTES" enables an extra note section in the
> core dump. Kconfig variable is preferred over ARCH_HAVE_* macro.
>
> Co-developed-by: Jini Susan George <jinisusan.george@amd.com>
> Signed-off-by: Jini Susan George <jinisusan.george@amd.com>
> Signed-off-by: Vignesh Balasubramanian <vigbalas@amd.com>
> ---
>  arch/Kconfig                   | 9 +++++++++
>  arch/powerpc/Kconfig           | 1 +
>  arch/powerpc/include/asm/elf.h | 2 --
>  include/linux/elf.h            | 2 +-
>  4 files changed, 11 insertions(+), 3 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

> diff --git a/arch/Kconfig b/arch/Kconfig
> index 9f066785bb71..143f021c8a76 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -502,6 +502,15 @@ config MMU_LAZY_TLB_SHOOTDOWN
>  config ARCH_HAVE_NMI_SAFE_CMPXCHG
>  	bool
>  
> +config ARCH_HAVE_EXTRA_ELF_NOTES
> +	bool
> +	help
> +	  An architecture should select this in order to enable adding an
> +	  arch-specific ELF note section to core files. It must provide two
> +	  functions: elf_coredump_extra_notes_size() and
> +	  elf_coredump_extra_notes_write() which are invoked by the ELF core
> +	  dumper.
> +
>  config ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
>  	bool
>  
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 1c4be3373686..c45fa9d7fb76 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -156,6 +156,7 @@ config PPC
>  	select ARCH_HAS_UACCESS_FLUSHCACHE
>  	select ARCH_HAS_UBSAN
>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
> +	select ARCH_HAVE_EXTRA_ELF_NOTES        if SPU_BASE
>  	select ARCH_KEEP_MEMBLOCK
>  	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if PPC_RADIX_MMU
>  	select ARCH_MIGHT_HAVE_PC_PARPORT
> diff --git a/arch/powerpc/include/asm/elf.h b/arch/powerpc/include/asm/elf.h
> index 79f1c480b5eb..bb4b94444d3e 100644
> --- a/arch/powerpc/include/asm/elf.h
> +++ b/arch/powerpc/include/asm/elf.h
> @@ -127,8 +127,6 @@ extern int arch_setup_additional_pages(struct linux_binprm *bprm,
>  /* Notes used in ET_CORE. Note name is "SPU/<fd>/<filename>". */
>  #define NT_SPU		1
>  
> -#define ARCH_HAVE_EXTRA_ELF_NOTES
> -
>  #endif /* CONFIG_SPU_BASE */
>  
>  #ifdef CONFIG_PPC64
> diff --git a/include/linux/elf.h b/include/linux/elf.h
> index c9a46c4e183b..5c402788da19 100644
> --- a/include/linux/elf.h
> +++ b/include/linux/elf.h
> @@ -65,7 +65,7 @@ extern Elf64_Dyn _DYNAMIC [];
>  struct file;
>  struct coredump_params;
>  
> -#ifndef ARCH_HAVE_EXTRA_ELF_NOTES
> +#ifndef CONFIG_ARCH_HAVE_EXTRA_ELF_NOTES
>  static inline int elf_coredump_extra_notes_size(void) { return 0; }
>  static inline int elf_coredump_extra_notes_write(struct coredump_params *cprm) { return 0; }
>  #else
> -- 
> 2.34.1
