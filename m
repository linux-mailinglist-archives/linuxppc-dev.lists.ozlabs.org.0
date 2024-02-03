Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C064D847DB0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Feb 2024 01:17:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gkVh8rmg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TRYBQ4wQTz3dC1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Feb 2024 11:17:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gkVh8rmg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TRY9h2R62z3c3H
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Feb 2024 11:17:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CD3C5CE0BBB;
	Sat,  3 Feb 2024 00:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 871F1C433C7;
	Sat,  3 Feb 2024 00:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706919426;
	bh=nZQsPsqNPYYXxX4K2h4eMz+56hYUx5rcVPocfkID7bk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gkVh8rmg3XviEeH3EY8bNCfbVigkIJj9WT2Y5KnRTScNgFbnoBjbSnmABJOB8o0io
	 mle8q4VPcWx5E4fVoDLFYjRvAdiCEJRkEWoAxi3c+t8YJ0GgPGX0blFma9D8oM+vMy
	 +/WTnug5E9DkyMJWlO5gdxHhfudehvYjgPAX1bsuSjY9GnE0lMDk1NXw412a+Gri4Q
	 kWZYV8TCESgMZkahnRzmA4QUPoLpe8C9oWKbwT+Z6U1f1Iyy+BRIi2lsk3xqut/Ea9
	 Py6mRhFWBOW7bvDMCYT+/HRuh3J00fp8dhNhpGr4He7WW0gEl7LuJwSiP/tLNIScJu
	 Mc1GnRfYytVPg==
Date: Fri, 2 Feb 2024 17:17:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH linux-next 1/3] x86, crash: don't nest CONFIG_CRASH_DUMP
 ifdef inside CONFIG_KEXEC_CODE ifdef scope
Message-ID: <20240203001703.GA3735093@dev-arch.thelio-3990X>
References: <20240129135033.157195-1-bhe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129135033.157195-1-bhe@redhat.com>
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
Cc: linux-s390@vger.kernel.org, mhklinux@outlook.com, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series resolves the build issues I was seeing. Please feel free to
carry

  Tested-by: Nathan Chancellor <nathan@kernel.org> # build

forward if there are any more revisions without drastic changes.

On Mon, Jan 29, 2024 at 09:50:31PM +0800, Baoquan He wrote:
> Michael pointed out that the #ifdef CONFIG_CRASH_DUMP is nested inside
> arch/x86/xen/enlighten_hvm.c.
> 
> Although the nesting works well too since CONFIG_CRASH_DUMP has
> dependency on CONFIG_KEXEC_CORE, it may cause confuse because there
> are places where it's not nested, and people may think it need be nested
> even though it doesn't have to.
> 
> Fix that by moving  CONFIG_CRASH_DUMP ifdeffery of codes out of
> CONFIG_KEXEC_CODE ifdeffery scope.
> 
> And also fix a building error Nathan reported as below by replacing
> CONFIG_KEXEC_CORE ifdef with CONFIG_VMCORE_INFO ifdef.
> 
> ====
> $ curl -LSso .config https://git.alpinelinux.org/aports/plain/community/linux-edge/config-edge.x86_64
> $ make -skj"$(nproc)" ARCH=x86_64 CROSS_COMPILE=x86_64-linux- olddefconfig all
> ...
> x86_64-linux-ld: arch/x86/xen/mmu_pv.o: in function `paddr_vmcoreinfo_note':
> mmu_pv.c:(.text+0x3af3): undefined reference to `vmcoreinfo_note'
> ====
> 
> Link: https://lore.kernel.org/all/SN6PR02MB4157931105FA68D72E3D3DB8D47B2@SN6PR02MB4157.namprd02.prod.outlook.com/T/#u
> Link: https://lore.kernel.org/all/20240126045551.GA126645@dev-arch.thelio-3990X/T/#u
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  arch/x86/kernel/cpu/mshyperv.c | 10 ++++++----
>  arch/x86/kernel/reboot.c       |  2 +-
>  arch/x86/xen/enlighten_hvm.c   |  4 ++--
>  arch/x86/xen/mmu_pv.c          |  2 +-
>  4 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
> index f8163a59026b..2e8cd5a4ae85 100644
> --- a/arch/x86/kernel/cpu/mshyperv.c
> +++ b/arch/x86/kernel/cpu/mshyperv.c
> @@ -209,6 +209,7 @@ static void hv_machine_shutdown(void)
>  	if (kexec_in_progress)
>  		hyperv_cleanup();
>  }
> +#endif /* CONFIG_KEXEC_CORE */
>  
>  #ifdef CONFIG_CRASH_DUMP
>  static void hv_machine_crash_shutdown(struct pt_regs *regs)
> @@ -222,8 +223,7 @@ static void hv_machine_crash_shutdown(struct pt_regs *regs)
>  	/* Disable the hypercall page when there is only 1 active CPU. */
>  	hyperv_cleanup();
>  }
> -#endif
> -#endif /* CONFIG_KEXEC_CORE */
> +#endif /* CONFIG_CRASH_DUMP */
>  #endif /* CONFIG_HYPERV */
>  
>  static uint32_t  __init ms_hyperv_platform(void)
> @@ -497,9 +497,11 @@ static void __init ms_hyperv_init_platform(void)
>  	no_timer_check = 1;
>  #endif
>  
> -#if IS_ENABLED(CONFIG_HYPERV) && defined(CONFIG_KEXEC_CORE)
> +#if IS_ENABLED(CONFIG_HYPERV)
> +#if defined(CONFIG_KEXEC_CORE)
>  	machine_ops.shutdown = hv_machine_shutdown;
> -#ifdef CONFIG_CRASH_DUMP
> +#endif
> +#if defined(CONFIG_CRASH_DUMP)
>  	machine_ops.crash_shutdown = hv_machine_crash_shutdown;
>  #endif
>  #endif
> diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
> index 1287b0d5962f..f3130f762784 100644
> --- a/arch/x86/kernel/reboot.c
> +++ b/arch/x86/kernel/reboot.c
> @@ -826,7 +826,7 @@ void machine_halt(void)
>  	machine_ops.halt();
>  }
>  
> -#ifdef CONFIG_KEXEC_CORE
> +#ifdef CONFIG_CRASH_DUMP
>  void machine_crash_shutdown(struct pt_regs *regs)
>  {
>  	machine_ops.crash_shutdown(regs);
> diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
> index 09e3db7ff990..0b367c1e086d 100644
> --- a/arch/x86/xen/enlighten_hvm.c
> +++ b/arch/x86/xen/enlighten_hvm.c
> @@ -148,6 +148,7 @@ static void xen_hvm_shutdown(void)
>  	if (kexec_in_progress)
>  		xen_reboot(SHUTDOWN_soft_reset);
>  }
> +#endif
>  
>  #ifdef CONFIG_CRASH_DUMP
>  static void xen_hvm_crash_shutdown(struct pt_regs *regs)
> @@ -156,7 +157,6 @@ static void xen_hvm_crash_shutdown(struct pt_regs *regs)
>  	xen_reboot(SHUTDOWN_soft_reset);
>  }
>  #endif
> -#endif
>  
>  static int xen_cpu_up_prepare_hvm(unsigned int cpu)
>  {
> @@ -238,10 +238,10 @@ static void __init xen_hvm_guest_init(void)
>  
>  #ifdef CONFIG_KEXEC_CORE
>  	machine_ops.shutdown = xen_hvm_shutdown;
> +#endif
>  #ifdef CONFIG_CRASH_DUMP
>  	machine_ops.crash_shutdown = xen_hvm_crash_shutdown;
>  #endif
> -#endif
>  }
>  
>  static __init int xen_parse_nopv(char *arg)
> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
> index 218773cfb009..e21974f2cf2d 100644
> --- a/arch/x86/xen/mmu_pv.c
> +++ b/arch/x86/xen/mmu_pv.c
> @@ -2520,7 +2520,7 @@ int xen_remap_pfn(struct vm_area_struct *vma, unsigned long addr,
>  }
>  EXPORT_SYMBOL_GPL(xen_remap_pfn);
>  
> -#ifdef CONFIG_KEXEC_CORE
> +#ifdef CONFIG_VMCORE_INFO
>  phys_addr_t paddr_vmcoreinfo_note(void)
>  {
>  	if (xen_pv_domain())
> -- 
> 2.41.0
> 
