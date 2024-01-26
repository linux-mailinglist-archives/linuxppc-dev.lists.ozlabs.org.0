Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0BE83D3D5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 05:56:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R7DqRs3l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLllw2dF1z3cVx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 15:56:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R7DqRs3l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLll52cP6z3bp7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 15:56:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 62F77CE3602;
	Fri, 26 Jan 2024 04:55:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7424AC433C7;
	Fri, 26 Jan 2024 04:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706244954;
	bh=FmNHhs5Ei5rNQtR/0pq39ZRt4hEXbrRkj0sDq9SFGz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R7DqRs3lJV6vva5/GrZ5vyvk/fyiid7mrqFU5b5j+aAL1A3l/pmyg1MUmlJxLrErx
	 ed7+2pZaiRCgfAquHhC2dqIoNZcqNiRVimZoDqwqThaxKZeuIveWl9ouRG3rYnm94+
	 dDr7tsUuKxr6bUgNOdgbix9L2K4MP70b/uUjGxfTr8D76LWXn0BIvbFNPHNwSUKSXo
	 ObJ1nLkwV9XdI6H5GHnv42jfmuDx5l33eMDvquwSc/6m7bRzyHcwW4dpvmHw8WnI98
	 vcJokpq8atILg/Qv6JdytOBNcXP2aG9sGMRlD5LgZFfZUGtu8dvQQLVA0bEv8hXqPp
	 lc79SuicTzCXQ==
Date: Thu, 25 Jan 2024 21:55:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH linux-next v3 00/14] Split crash out from kexec and clean
 up related config items
Message-ID: <20240126045551.GA126645@dev-arch.thelio-3990X>
References: <20240124051254.67105-1-bhe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240124051254.67105-1-bhe@redhat.com>
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
Cc: linux-s390@vger.kernel.org, piliu@redhat.com, linux-sh@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, ebiederm@xmission.com, loongarch@lists.linux.dev, hbathini@linux.ibm.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org, viro@zeniv.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Baoquan,

On Wed, Jan 24, 2024 at 01:12:40PM +0800, Baoquan He wrote:
> Motivation:
> =============
> Previously, LKP reported a building error. When investigating, it can't
> be resolved reasonablly with the present messy kdump config items.
> 
>  https://lore.kernel.org/oe-kbuild-all/202312182200.Ka7MzifQ-lkp@intel.com/
> 
> The kdump (crash dumping) related config items could causes confusions:
> 
> Firstly,
> ---
> CRASH_CORE enables codes including
>  - crashkernel reservation;
>  - elfcorehdr updating;
>  - vmcoreinfo exporting;
>  - crash hotplug handling;
> 
> Now fadump of powerpc, kcore dynamic debugging and kdump all selects
> CRASH_CORE, while fadump
>  - fadump needs crashkernel parsing, vmcoreinfo exporting, and accessing
>    global variable 'elfcorehdr_addr';
>  - kcore only needs vmcoreinfo exporting;
>  - kdump needs all of the current kernel/crash_core.c.
> 
> So only enabling PROC_CORE or FA_DUMP will enable CRASH_CORE, this
> mislead people that we enable crash dumping, actual it's not.
> 
> Secondly,
> ---
> It's not reasonable to allow KEXEC_CORE select CRASH_CORE.
> 
> Because KEXEC_CORE enables codes which allocate control pages, copy
> kexec/kdump segments, and prepare for switching. These codes are
> shared by both kexec reboot and kdump. We could want kexec reboot,
> but disable kdump. In that case, CRASH_CORE should not be selected.
> 
>  --------------------
>  CONFIG_CRASH_CORE=y
>  CONFIG_KEXEC_CORE=y
>  CONFIG_KEXEC=y
>  CONFIG_KEXEC_FILE=y
>  ---------------------
> 
> Thirdly,
> ---
> It's not reasonable to allow CRASH_DUMP select KEXEC_CORE.
> 
> That could make KEXEC_CORE, CRASH_DUMP are enabled independently from
> KEXEC or KEXEC_FILE. However, w/o KEXEC or KEXEC_FILE, the KEXEC_CORE
> code built in doesn't make any sense because no kernel loading or
> switching will happen to utilize the KEXEC_CORE code.
>  ---------------------
>  CONFIG_CRASH_CORE=y
>  CONFIG_KEXEC_CORE=y
>  CONFIG_CRASH_DUMP=y
>  ---------------------
> 
> In this case, what is worse, on arch sh and arm, KEXEC relies on MMU,
> while CRASH_DUMP can still be enabled when !MMU, then compiling error is
> seen as the lkp test robot reported in above link.
> 
>  ------arch/sh/Kconfig------
>  config ARCH_SUPPORTS_KEXEC
>          def_bool MMU
> 
>  config ARCH_SUPPORTS_CRASH_DUMP
>          def_bool BROKEN_ON_SMP
>  ---------------------------
> 
> Changes:
> ===========
> 1, split out crash_reserve.c from crash_core.c;
> 2, split out vmcore_infoc. from crash_core.c;
> 3, move crash related codes in kexec_core.c into crash_core.c;
> 4, remove dependency of FA_DUMP on CRASH_DUMP;
> 5, clean up kdump related config items;
> 6, wrap up crash codes in crash related ifdefs on all 8 arch-es
>    which support crash dumping, except of ppc;
> 
> Achievement:
> ===========
> With above changes, I can rearrange the config item logic as below (the right
> item depends on or is selected by the left item):
> 
>     PROC_KCORE -----------> VMCORE_INFO
> 
>                |----------> VMCORE_INFO
>     FA_DUMP----|
>                |----------> CRASH_RESERVE
> 
>                                                     ---->VMCORE_INFO
>                                                    /
>                                                    |---->CRASH_RESERVE
>     KEXEC      --|                                /|
>                  |--> KEXEC_CORE--> CRASH_DUMP-->/-|---->PROC_VMCORE
>     KEXEC_FILE --|                               \ |
>                                                    \---->CRASH_HOTPLUG
> 
> 
>     KEXEC      --|
>                  |--> KEXEC_CORE (for kexec reboot only)
>     KEXEC_FILE --|
> 
> Test
> ========
> On all 8 architectures, including x86_64, arm64, s390x, sh, arm, mips,
> riscv, loongarch, I did below three cases of config item setting and
> building all passed. Take configs on x86_64 as exampmle here:
> 
> (1) Both CONFIG_KEXEC and KEXEC_FILE is unset, then all kexec/kdump
> items are unset automatically:
> # Kexec and crash features
> # CONFIG_KEXEC is not set
> # CONFIG_KEXEC_FILE is not set
> # end of Kexec and crash features
> 
> (2) set CONFIG_KEXEC_FILE and 'make olddefconfig':
> ---------------
> # Kexec and crash features
> CONFIG_CRASH_RESERVE=y
> CONFIG_VMCORE_INFO=y
> CONFIG_KEXEC_CORE=y
> CONFIG_KEXEC_FILE=y
> CONFIG_CRASH_DUMP=y
> CONFIG_CRASH_HOTPLUG=y
> CONFIG_CRASH_MAX_MEMORY_RANGES=8192
> # end of Kexec and crash features
> ---------------
> 
> (3) unset CONFIG_CRASH_DUMP in case 2 and execute 'make olddefconfig':
> ------------------------
> # Kexec and crash features
> CONFIG_KEXEC_CORE=y
> CONFIG_KEXEC_FILE=y
> # end of Kexec and crash features
> ------------------------
> 
> Note:
> For ppc, it needs investigation to make clear how to split out crash
> code in arch folder. Hope Hari and Pingfan can help have a look, see if
> it's doable. Now, I make it either have both kexec and crash enabled, or
> disable both of them altogether.

I am seeing a few build failures in my test matrix on next-20240125 that
appear to be caused by this series although I have not bisected. Some
reproduction steps:

$ curl -LSso .config https://git.alpinelinux.org/aports/plain/community/linux-edge/config-edge.armv7
$ make -skj"$(nproc)" ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- olddefconfig all
...
arm-linux-gnueabi-ld: arch/arm/kernel/machine_kexec.o: in function `arch_crash_save_vmcoreinfo':
machine_kexec.c:(.text+0x488): undefined reference to `vmcoreinfo_append_str'
...

$ curl -LSso .config https://github.com/archlinuxarm/PKGBUILDs/raw/master/core/linux-aarch64/config
$ make -skj"$(nproc)" ARCH=arm64 CROSS_COMPILE=aarch64-linux- olddefconfig all
...
aarch64-linux-ld: kernel/kexec_file.o: in function `kexec_walk_memblock.constprop.0':
kexec_file.c:(.text+0x314): undefined reference to `crashk_res'
aarch64-linux-ld: kernel/kexec_file.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `crashk_res' which may bind externally can not be used when making a shared object; recompile with -fPIC
kexec_file.c:(.text+0x314): dangerous relocation: unsupported relocation
aarch64-linux-ld: kexec_file.c:(.text+0x318): undefined reference to `crashk_res'
aarch64-linux-ld: drivers/of/kexec.o: in function `of_kexec_alloc_and_setup_fdt':
kexec.c:(.text+0x580): undefined reference to `crashk_res'
aarch64-linux-ld: drivers/of/kexec.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `crashk_res' which may bind externally can not be used when making a shared object; recompile with -fPIC
kexec.c:(.text+0x580): dangerous relocation: unsupported relocation
aarch64-linux-ld: kexec.c:(.text+0x584): undefined reference to `crashk_res'
aarch64-linux-ld: kexec.c:(.text+0x590): undefined reference to `crashk_res'
aarch64-linux-ld: kexec.c:(.text+0x5b0): undefined reference to `crashk_low_res'
aarch64-linux-ld: drivers/of/kexec.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `crashk_low_res' which may bind externally can not be used when making a shared object; recompile with -fPIC
kexec.c:(.text+0x5b0): dangerous relocation: unsupported relocation
aarch64-linux-ld: kexec.c:(.text+0x5b4): undefined reference to `crashk_low_res'
aarch64-linux-ld: kexec.c:(.text+0x5c0): undefined reference to `crashk_low_res'
...

$ curl -LSso .config https://git.alpinelinux.org/aports/plain/community/linux-edge/config-edge.x86_64
$ make -skj"$(nproc)" ARCH=x86_64 CROSS_COMPILE=x86_64-linux- olddefconfig all
...
x86_64-linux-ld: arch/x86/xen/mmu_pv.o: in function `paddr_vmcoreinfo_note':
mmu_pv.c:(.text+0x3af3): undefined reference to `vmcoreinfo_note'
...

Cheers,
Nathan
