Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B39827D8C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 04:51:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZPif0KyL;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LxDu/geT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8H5x0XR1z30hY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 14:51:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZPif0KyL;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LxDu/geT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8H536jCZz2xLW
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jan 2024 14:50:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704772211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a0GQAZNSgQ9NYel79tdKOQqcnL4ZPX5GxjXGFUqL5FQ=;
	b=ZPif0KyL4URvY+3rWVG51X4CWdGnMRdYXpHWq53W1VOlcCBjBY7edPmKEYwUjbYptY2cal
	1uohUdhcXMOqgaAhiKh+4LL1bvwXh54snP0SrGOmsnNYOfNsHMMpcW7Spg1Bhna+urPBsD
	OrzRhLWY6HEKD3FpVBei3hZxRORpqXs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704772212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a0GQAZNSgQ9NYel79tdKOQqcnL4ZPX5GxjXGFUqL5FQ=;
	b=LxDu/geTjtPo/N4rGuzRryrRyVb8hYVGhN4bcQZGe3fAA0J+p4WePoZJFrzQFEqVfBNzXu
	GsFE05sYWNJFCnPouYdBb4qZj84kaLje70GwR01iCHU+THWxaXDRiDM8CxH82vcrzAf9ip
	wk0TIzMn9Kq0A2qcwGcrVuqaiZHVwTc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-z2OS85ljPFq20Ze8WhKemQ-1; Mon, 08 Jan 2024 22:50:00 -0500
X-MC-Unique: z2OS85ljPFq20Ze8WhKemQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29B0285A588;
	Tue,  9 Jan 2024 03:49:59 +0000 (UTC)
Received: from localhost (unknown [10.72.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FFC53C4F;
	Tue,  9 Jan 2024 03:49:57 +0000 (UTC)
Date: Tue, 9 Jan 2024 11:49:54 +0800
From: Baoquan He <bhe@redhat.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 5/5] crash: clean up CRASH_DUMP
Message-ID: <ZZzCYr7t0FrMWafB@MiWiFi-R3L-srv>
References: <20240105103305.557273-6-bhe@redhat.com>
 <ZZqk+AnXbqnJuMdF@rli9-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZZqk+AnXbqnJuMdF@rli9-mobl>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
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
Cc: linux-arm-kernel@lists.infradead.org, x86@kernel.org, arnd@arndb.de, ignat@cloudflare.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, oe-kbuild-all@lists.linux.dev, eric_devolder@yahoo.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, hbathini@linux.ibm.com, ebiederm@xmission.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01/07/24 at 09:19pm, kernel test robot wrote:
> Hi Baoquan,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.7-rc8]
> [cannot apply to powerpc/next powerpc/fixes tip/x86/core arm64/for-next/core next-20240105]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/kexec_core-move-kdump-related-codes-from-crash_core-c-to-kexec_core-c/20240105-223735
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20240105103305.557273-6-bhe%40redhat.com
> patch subject: [PATCH 5/5] crash: clean up CRASH_DUMP
> :::::: branch date: 2 days ago
> :::::: commit date: 2 days ago
> config: x86_64-randconfig-122-20240106 (https://download.01.org/0day-ci/archive/20240107/202401071326.52yn9Ftd-lkp@intel.com/config)
> compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240107/202401071326.52yn9Ftd-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/r/202401071326.52yn9Ftd-lkp@intel.com/

Thanks for reporting.

I have reproduced these linking errors, will consier how to rearrange
code change and fix them. The thing splitting kdump out could be more
complicated than I thought.

> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: undefined symbol: crashk_res
>    >>> referenced by initramfs.c:638 (init/initramfs.c:638)
>    >>>               init/initramfs.o:(kexec_free_initrd) in archive vmlinux.a
>    >>> referenced by initramfs.c:638 (init/initramfs.c:638)
>    >>>               init/initramfs.o:(kexec_free_initrd) in archive vmlinux.a
>    >>> referenced by initramfs.c:0 (init/initramfs.c:0)
>    >>>               init/initramfs.o:(kexec_free_initrd) in archive vmlinux.a
>    >>> referenced 77 more times
> --
> >> ld.lld: error: undefined symbol: parse_crashkernel
>    >>> referenced by setup.c:479 (arch/x86/kernel/setup.c:479)
>    >>>               arch/x86/kernel/setup.o:(arch_reserve_crashkernel) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: crashk_low_res
>    >>> referenced by machine_kexec_64.c:539 (arch/x86/kernel/machine_kexec_64.c:539)
>    >>>               arch/x86/kernel/machine_kexec_64.o:(kexec_mark_crashkres) in archive vmlinux.a
>    >>> referenced by machine_kexec_64.c:539 (arch/x86/kernel/machine_kexec_64.c:539)
>    >>>               arch/x86/kernel/machine_kexec_64.o:(kexec_mark_crashkres) in archive vmlinux.a
>    >>> referenced by machine_kexec_64.c:539 (arch/x86/kernel/machine_kexec_64.c:539)
>    >>>               arch/x86/kernel/machine_kexec_64.o:(kexec_mark_crashkres) in archive vmlinux.a
>    >>> referenced 36 more times
> --
> >> ld.lld: error: undefined symbol: crash_update_vmcoreinfo_safecopy
>    >>> referenced by kexec_core.c:522 (kernel/kexec_core.c:522)
>    >>>               kernel/kexec_core.o:(kimage_crash_copy_vmcoreinfo) in archive vmlinux.a
>    >>> referenced by kexec_core.c:610 (kernel/kexec_core.c:610)
>    >>>               kernel/kexec_core.o:(kimage_free) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: crash_save_vmcoreinfo
>    >>> referenced by kexec_core.c:1053 (kernel/kexec_core.c:1053)
>    >>>               kernel/kexec_core.o:(__crash_kexec) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: paddr_vmcoreinfo_note
>    >>> referenced by kexec_core.c:1148 (kernel/kexec_core.c:1148)
>    >>>               kernel/kexec_core.o:(crash_prepare_elf64_headers) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: append_elf_note
>    >>> referenced by kexec_core.c:1390 (kernel/kexec_core.c:1390)
>    >>>               kernel/kexec_core.o:(crash_save_cpu) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: final_note
>    >>> referenced by kexec_core.c:1392 (kernel/kexec_core.c:1392)
>    >>>               kernel/kexec_core.o:(crash_save_cpu) in archive vmlinux.a
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

