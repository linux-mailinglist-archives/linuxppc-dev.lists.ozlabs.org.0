Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DB562926
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 21:16:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jFY246nyzDqWH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 05:16:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TH7r06nF"; 
 dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jFW42Yd3zDqQD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 05:14:23 +1000 (AEST)
Received: by mail-wm1-x344.google.com with SMTP id l2so684078wmg.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jul 2019 12:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=CWxCbAc5jk0z0Lfr7z6NeMWAMn6q/Zi0PGMWVjjKWy8=;
 b=TH7r06nFYoY4UTqLh/29qFxtY5WC3lA0JYkjkrNeY07VYaM57DZ4d2tmZ4ZMpojM/C
 JLbrclvu+c8tG/5o7TcfBlUXk0MUmMwqCwhCIz6W14yAWcdjwJgtuWMRJHawAH3PrTzC
 uu3p0QtwGPLz5mJmu5JKgS4eh/iWGXiGSJiCRpWIejmWN1m4Hfz0/s0+YA26lkfnnQ+9
 gVTHBYCn1FNMjY4YRKFBsfVJzKEdcafNwbrT4VsZ/WTO+7YphS/qZxUj+ATlx2jrKPXe
 D/q+RtESCbglN8eyuWmR3PPrRQ9mnHmsMNEppxBhJTlHKi+wKhVNjaMEDSMW+ixPvklC
 W6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=CWxCbAc5jk0z0Lfr7z6NeMWAMn6q/Zi0PGMWVjjKWy8=;
 b=etCUa3IHjXhmbm6XAiT9lR/gdQX53gkfp12/dY6m9HoRRoTDL9V2AV6cDadIzW6zBK
 VWKhTBNwmOjz04f23uK8Y8XqE4FAy+mlVDIb73FncpC7PXErG69BneWNFiD5s5xx/Rxs
 I22JUcUCC21Qs3wI3082Mhk+Gf8MyIbeB4k3RD8xrspMBMsMA/qyX8DDvrSyeXsBaTsK
 I7KiEP4E3F/zRLogJCeWJHmmW+SLo9ZPpm1oiCgHdwf7ZYLo7enmHmGwARKVmaTQDiQI
 sUkHWJN9GIbvLT1JMFaPzjZkAZzSjikwiok5BfxFrgKuRu7pvN19tHQgz4IxHGbJFYvf
 WLQw==
X-Gm-Message-State: APjAAAXnvUzWyyb/KF/OA7ur+aUYOlBbsWPN13gVLNIRSggtHf1cJwpz
 qv0R5KZKwFvmZSjbAa8WDhM=
X-Google-Smtp-Source: APXvYqxTQwA8r3caj8MEY13GjW8wrs3TozS/Km7Mq5yo3551PcD7qdIdd1kg+sQhRiwFV5peN9bsIA==
X-Received: by 2002:a7b:c748:: with SMTP id w8mr17101112wmk.36.1562613259063; 
 Mon, 08 Jul 2019 12:14:19 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id f192sm673996wmg.30.2019.07.08.12.14.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 12:14:18 -0700 (PDT)
Date: Mon, 8 Jul 2019 12:14:16 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc: slightly improve cache helpers
Message-ID: <20190708191416.GA21442@archlinux-threadripper>
References: <c6ff2faba7fbb56a7f5b5f08cd3453f89fc0aaf4.1557480165.git.christophe.leroy@c-s.fr>
 <45hnfp6SlLz9sP0@ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45hnfp6SlLz9sP0@ozlabs.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 08, 2019 at 11:19:30AM +1000, Michael Ellerman wrote:
> On Fri, 2019-05-10 at 09:24:48 UTC, Christophe Leroy wrote:
> > Cache instructions (dcbz, dcbi, dcbf and dcbst) take two registers
> > that are summed to obtain the target address. Using 'Z' constraint
> > and '%y0' argument gives GCC the opportunity to use both registers
> > instead of only one with the second being forced to 0.
> > 
> > Suggested-by: Segher Boessenkool <segher@kernel.crashing.org>
> > Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> 
> Applied to powerpc next, thanks.
> 
> https://git.kernel.org/powerpc/c/6c5875843b87c3adea2beade9d1b8b3d4523900a
> 
> cheers

This patch causes a regression with clang:

https://travis-ci.com/ClangBuiltLinux/continuous-integration/jobs/213944668

I've attached my local bisect/build log.

Cheers,
Nathan

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="bisect.log"

git bisect start
# good: [46713c3d2f8da5e3d8ddd2249bcb1d9974fb5d28] Merge tag 'for-linus-20190706' of git://git.kernel.dk/linux-block
git bisect good 46713c3d2f8da5e3d8ddd2249bcb1d9974fb5d28
# bad: [d58b5ab90ee7528126fd5833df7fc5bda8331ce8] Add linux-next specific files for 20190708
git bisect bad d58b5ab90ee7528126fd5833df7fc5bda8331ce8
# bad: [ba30fb6d5d6464bd7d3759408ea7f178d8c9fe87] Merge remote-tracking branch 'crypto/master'
git bisect bad ba30fb6d5d6464bd7d3759408ea7f178d8c9fe87
# bad: [eaa0d0d3b269695df5d682d3dfcfb5c6e8f19fa8] Merge remote-tracking branch 'i3c/i3c/next'
git bisect bad eaa0d0d3b269695df5d682d3dfcfb5c6e8f19fa8
# good: [e41aad4a290783ec7d3730542cbed0e99b2dcb4a] Merge remote-tracking branch 'tegra/for-next'
git bisect good e41aad4a290783ec7d3730542cbed0e99b2dcb4a
# bad: [c5a28b5f954e769decf4b69c06ecfd27ebeaeb5b] Merge remote-tracking branch 'cifs/for-next'
git bisect bad c5a28b5f954e769decf4b69c06ecfd27ebeaeb5b
# bad: [8e8fefda572360f00854547f3458a9c2cf932ff5] Merge remote-tracking branch 'powerpc/next'
git bisect bad 8e8fefda572360f00854547f3458a9c2cf932ff5
# good: [01fd0e565283d69adf0ff1da95cab5bb4cb58acb] Merge remote-tracking branch 'm68k/for-next'
git bisect good 01fd0e565283d69adf0ff1da95cab5bb4cb58acb
# good: [7505a13f85bdcb8713551a067dfc92ac3c7ba902] powerpc/configs: Disable latencytop
git bisect good 7505a13f85bdcb8713551a067dfc92ac3c7ba902
# good: [958ace9b9edae56953190fdbdddc55d6506ec6f7] Merge remote-tracking branch 'nios2/for-next'
git bisect good 958ace9b9edae56953190fdbdddc55d6506ec6f7
# bad: [1cfb725fb1899dc6fdc88f8b5354a65e8ad260c6] powerpc/64: flush_inval_dcache_range() becomes flush_dcache_range()
git bisect bad 1cfb725fb1899dc6fdc88f8b5354a65e8ad260c6
# good: [89a3496e0664577043666791ec07fb731d57c950] powerpc/mm/radix: Use the right page size for vmemmap mapping
git bisect good 89a3496e0664577043666791ec07fb731d57c950
# good: [259a948c4ba1829ae4a3c31bb6e40ad458a21254] powerpc/pseries/scm: Use a specific endian format for storing uuid from the device tree
git bisect good 259a948c4ba1829ae4a3c31bb6e40ad458a21254
# good: [2230ebf6e6dd0b7751e2921b40f6cfe34f09bb16] powerpc/mm: Handle page table allocation failures
git bisect good 2230ebf6e6dd0b7751e2921b40f6cfe34f09bb16
# good: [ac25ba68fa4001c85395f0488b1c7a2421c5aada] powerpc/mm/hugetlb: Don't enable HugeTLB if we don't have a page table cache
git bisect good ac25ba68fa4001c85395f0488b1c7a2421c5aada
# bad: [6c5875843b87c3adea2beade9d1b8b3d4523900a] powerpc: slightly improve cache helpers
git bisect bad 6c5875843b87c3adea2beade9d1b8b3d4523900a
# first bad commit: [6c5875843b87c3adea2beade9d1b8b3d4523900a] powerpc: slightly improve cache helpers

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename="build.log"
Content-Transfer-Encoding: 8bit

make[1]: Entering directory '/mnt/build/kernel'
  CLEAN   .
  CLEAN   arch/powerpc/kernel/vdso32
  CLEAN   arch/powerpc/kernel
  CLEAN   lib
  CLEAN   drivers/scsi
  CLEAN   usr
  CLEAN   scripts/basic
  CLEAN   scripts/dtc
rm -f .tmp_symbols.txt
  CLEAN   scripts/mod
  CLEAN   scripts/kconfig
  CLEAN   scripts
  CLEAN   arch/powerpc/boot
  CLEAN   .tmp_versions
  CLEAN   modules.builtin.modinfo
  CLEAN   include/config include/generated arch/powerpc/include/generated
  CLEAN   .config .config.old .version Module.symvers
  HOSTCC  scripts/basic/fixdep
  GEN     Makefile
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.h
  YACC    scripts/kconfig/parser.tab.c
  HOSTCC  scripts/kconfig/expr.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTLD  scripts/kconfig/conf
#
# configuration written to .config
#
  SYSTBL  arch/powerpc/include/generated/asm/syscall_table_64.h
  SYSTBL  arch/powerpc/include/generated/asm/syscall_table_c32.h
  SYSTBL  arch/powerpc/include/generated/asm/syscall_table_32.h
  SYSTBL  arch/powerpc/include/generated/asm/syscall_table_spu.h
  SYSHDR  arch/powerpc/include/generated/uapi/asm/unistd_64.h
  SYSHDR  arch/powerpc/include/generated/uapi/asm/unistd_32.h
  GEN     Makefile
  WRAP    arch/powerpc/include/generated/uapi/asm/poll.h
  WRAP    arch/powerpc/include/generated/uapi/asm/resource.h
  WRAP    arch/powerpc/include/generated/uapi/asm/sockios.h
  WRAP    arch/powerpc/include/generated/uapi/asm/siginfo.h
  WRAP    arch/powerpc/include/generated/uapi/asm/param.h
  WRAP    arch/powerpc/include/generated/uapi/asm/statfs.h
  UPD     include/generated/uapi/linux/version.h
  WRAP    arch/powerpc/include/generated/asm/irq_regs.h
  WRAP    arch/powerpc/include/generated/asm/div64.h
  WRAP    arch/powerpc/include/generated/asm/export.h
  WRAP    arch/powerpc/include/generated/asm/local64.h
  WRAP    arch/powerpc/include/generated/asm/vtime.h
  WRAP    arch/powerpc/include/generated/asm/preempt.h
  WRAP    arch/powerpc/include/generated/asm/msi.h
  WRAP    arch/powerpc/include/generated/asm/mcs_spinlock.h
  WRAP    arch/powerpc/include/generated/asm/simd.h
  HOSTCC  scripts/dtc/dtc.o
  HOSTCC  scripts/dtc/flattree.o
  HOSTCC  scripts/dtc/treesource.o
  HOSTCC  scripts/dtc/fstree.o
  HOSTCC  scripts/dtc/livetree.o
  HOSTCC  scripts/dtc/data.o
  HOSTCC  scripts/dtc/srcpos.o
  HOSTCC  scripts/dtc/util.o
  HOSTCC  scripts/dtc/checks.o
  LEX     scripts/dtc/dtc-lexer.lex.c
  YACC    scripts/dtc/dtc-parser.tab.c
  HOSTCC  scripts/dtc/yamltree.o
  YACC    scripts/dtc/dtc-parser.tab.h
  HOSTCC  scripts/dtc/dtc-parser.tab.o
  HOSTCC  scripts/dtc/dtc-lexer.lex.o
  UPD     include/config/kernel.release
  Using /home/nathan/cbl/linux-next as source for kernel
  UPD     include/generated/utsrelease.h
  HOSTLD  scripts/dtc/dtc
  HOSTCC  scripts/kallsyms
  HOSTCC  scripts/sortextable
  HOSTCC  scripts/mod/mk_elfconfig
  CC      scripts/mod/devicetable-offsets.s
  CC      scripts/mod/empty.o
  UPD     scripts/mod/devicetable-offsets.h
  MKELF   scripts/mod/elfconfig.h
  HOSTCC  scripts/mod/modpost.o
  HOSTCC  scripts/mod/file2alias.o
  HOSTCC  scripts/mod/sumversion.o
  HOSTLD  scripts/mod/modpost
  CC      kernel/bounds.s
  CALL    /home/nathan/cbl/linux-next/scripts/atomic/check-atomics.sh
  UPD     include/generated/timeconst.h
  UPD     include/generated/bounds.h
  CC      arch/powerpc/kernel/asm-offsets.s
  UPD     include/generated/asm-offsets.h
  CALL    /home/nathan/cbl/linux-next/scripts/checksyscalls.sh
make[1]: Leaving directory '/mnt/build/kernel'

real	6.758
user	12.037
sys	4.859
make[1]: Entering directory '/mnt/build/kernel'
  GEN     Makefile
scripts/kconfig/conf  --syncconfig Kconfig
  GEN     Makefile
  Using /home/nathan/cbl/linux-next as source for kernel
  DTC     arch/powerpc/boot/dts/virtex440-ml507.dtb
  DTC     arch/powerpc/boot/dts/virtex440-ml510.dtb
/home/nathan/cbl/linux-next/arch/powerpc/boot/dts/virtex440-ml510.dts:335.37-439.6: Warning (pci_bridge): /plb@0/plbv46-pci@85e00000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/virtex440-ml510.dtb: Warning (pci_device_bus_num): Failed prerequisite 'pci_bridge'
  CC      scripts/mod/devicetable-offsets.s
  CC      scripts/mod/empty.o
  MKELF   scripts/mod/elfconfig.h
  HOSTCC  scripts/mod/modpost.o
  HOSTCC  scripts/mod/sumversion.o
  HOSTCC  scripts/mod/file2alias.o
  HOSTLD  scripts/mod/modpost
  CC      kernel/bounds.s
  CALL    /home/nathan/cbl/linux-next/scripts/atomic/check-atomics.sh
  UPD     include/generated/bounds.h
  CC      arch/powerpc/kernel/asm-offsets.s
  UPD     include/generated/asm-offsets.h
  CALL    /home/nathan/cbl/linux-next/scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  CC      init/main.o
  CC      init/do_mounts.o
  CC      init/do_mounts_rd.o
  CC      init/do_mounts_initrd.o
  HOSTCC  usr/gen_init_cpio
  CC      init/initramfs.o
  CC      init/init_task.o
  UPD     include/generated/compile.h
  AR      arch/powerpc/crypto/built-in.a
  AR      arch/powerpc/net/built-in.a
  AS      arch/powerpc/sysdev/dcr-low.o
  LDS     arch/powerpc/kernel/vdso32/vdso32.lds
  CC      init/version.o
  AS      arch/powerpc/platforms/44x/misc_44x.o
  CC      arch/powerpc/kernel/ptrace.o
  CC      arch/powerpc/kernel/syscalls.o
  CC      arch/powerpc/mm/fault.o
  CC      arch/powerpc/kernel/cputable.o
  CC      arch/powerpc/mm/mem.o
  CC      arch/powerpc/mm/pgtable.o
  CC      arch/powerpc/kernel/irq.o
  CC      arch/powerpc/kernel/trace/trace_clock.o
  CC      arch/powerpc/platforms/4xx/uic.o
  AR      certs/built-in.a
  CC      arch/powerpc/mm/mmap.o
  CC      arch/powerpc/lib/alloc.o
  VDSO32A arch/powerpc/kernel/vdso32/sigtramp.o
  VDSO32A arch/powerpc/kernel/vdso32/gettimeofday.o
  CC      kernel/bpf/core.o
  CC      arch/powerpc/platforms/44x/machine_check.o
  CC      arch/powerpc/mm/init_32.o
  VDSO32A arch/powerpc/kernel/vdso32/datapage.o
  GEN     usr/initramfs_data.cpio
  VDSO32A arch/powerpc/kernel/vdso32/cacheflush.o
  AS      usr/initramfs_data.o
  AR      arch/powerpc/kernel/trace/built-in.a
  VDSO32A arch/powerpc/kernel/vdso32/note.o
  AR      usr/built-in.a
  CC      arch/powerpc/mm/nohash/mmu_context.o
  CC      arch/powerpc/mm/nohash/tlb.o
  CC      arch/powerpc/kernel/align.o
  CC      arch/powerpc/sysdev/msi_bitmap.o
  CC      arch/powerpc/sysdev/indirect_pci.o
  CC      arch/powerpc/sysdev/xilinx_intc.o
  CC      arch/powerpc/sysdev/of_rtc.o
  AS      arch/powerpc/mm/nohash/tlb_low.o
  VDSO32L arch/powerpc/kernel/vdso32/vdso32.so.dbg
ld.lld: warning: cannot find entry symbol _start; defaulting to 0x3E0
  OBJCOPY arch/powerpc/kernel/vdso32/vdso32.so
  AS      arch/powerpc/kernel/vdso32/vdso32_wrapper.o
  CC      arch/powerpc/math-emu/math.o
  CC      arch/powerpc/math-emu/fre.o
  CC      arch/powerpc/math-emu/fsqrt.o
  CC      arch/powerpc/math-emu/fsqrts.o
  CC      arch/powerpc/math-emu/frsqrtes.o
  CC      arch/powerpc/math-emu/mtfsf.o
  AR      arch/powerpc/kernel/vdso32/built-in.a
  CC      arch/powerpc/sysdev/dcr.o
  CC      arch/powerpc/platforms/44x/ppc44x_simple.o
  CC      arch/powerpc/platforms/4xx/machine_check.o
  CC      mm/filemap.o
  CC      arch/powerpc/mm/nohash/44x.o
  CC      arch/powerpc/mm/pgtable_32.o
  CC      fs/cramfs/inode.o
  CC      fs/cramfs/uncompress.o
  CC      arch/powerpc/mm/pgtable-frag.o
  CC      mm/mempool.o
  CC      arch/powerpc/kernel/signal_32.o
  CC      arch/powerpc/lib/code-patching.o
  CC      arch/powerpc/kernel/pmc.o
  CC      arch/powerpc/platforms/44x/ebony.o
  CC      arch/powerpc/platforms/4xx/soc.o
  CC      arch/powerpc/platforms/44x/sam440ep.o
  CC      arch/powerpc/mm/init-common.o
  CC      arch/powerpc/kernel/vdso.o
  CC      arch/powerpc/mm/mmu_context.o
  CC      arch/powerpc/platforms/4xx/pci.o
  CC      arch/powerpc/platforms/44x/warp.o
  CC      arch/powerpc/kernel/process.o
  CC      ipc/util.o
  CC      fs/debugfs/inode.o
  CC      fs/debugfs/file.o
  CC      ipc/msgutil.o
  AS      arch/powerpc/kernel/systbl.o
  CC      arch/powerpc/math-emu/mtfsfi.o
  CC      arch/powerpc/kernel/idle.o
  CC      arch/powerpc/math-emu/fabs.o
  CC      arch/powerpc/platforms/4xx/msi.o
  CC      arch/powerpc/platforms/4xx/cpm.o
  CC      arch/powerpc/lib/feature-fixups.o
  CC      arch/powerpc/mm/drmem.o
  AR      arch/powerpc/sysdev/built-in.a
  CC      security/commoncap.o
  CC      arch/powerpc/kernel/signal.o
  AR      arch/powerpc/mm/nohash/built-in.a
  AS      arch/powerpc/lib/string.o
  AR      init/built-in.a
  CC      fs/devpts/inode.o
  AS      arch/powerpc/lib/memcmp_32.o
  CC      arch/powerpc/platforms/4xx/gpio.o
  CC      mm/oom_kill.o
  CC      arch/powerpc/mm/dma-noncoherent.o
  CC      fs/exportfs/expfs.o
  AS      arch/powerpc/lib/strlen_32.o
  CC      mm/fadvise.o
  CC      arch/powerpc/math-emu/fadd.o
  CC      mm/maccess.o
  CC      kernel/dma/mapping.o
  CC      ipc/msg.o
  CC      arch/powerpc/math-emu/fadds.o
  AS      arch/powerpc/lib/div64.o
  CC      kernel/dma/direct.o
  CC      crypto/api.o
  AS      arch/powerpc/lib/copy_32.o
  CC      arch/powerpc/math-emu/fcmpo.o
  CC      crypto/cipher.o
  CC      kernel/irq/irqdesc.o
  CC      arch/powerpc/platforms/44x/virtex.o
  CC      arch/powerpc/platforms/44x/canyonlands.o
  AS      arch/powerpc/lib/crtsavres.o
  CC      fs/ext2/balloc.o
  AR      fs/cramfs/built-in.a
  CC      crypto/compress.o
  AR      fs/debugfs/built-in.a
  CC      fs/ext2/dir.o
  CC      kernel/dma/dummy.o
  CC      kernel/dma/coherent.o
  AR      kernel/livepatch/built-in.a
  CC      fs/ext2/file.o
  CC      security/min_addr.o
  CC      block/partitions/check.o
  CC      kernel/irq/handle.o
  AS      arch/powerpc/lib/checksum_32.o
  AR      fs/exportfs/built-in.a
  CC      arch/powerpc/math-emu/fcmpu.o
  CC      block/bio.o
  AR      arch/powerpc/platforms/4xx/built-in.a
  CC      arch/powerpc/lib/checksum_wrappers.o
  CC      arch/powerpc/kernel/sysfs.o
  AR      fs/devpts/built-in.a
  CC      kernel/irq/manage.o
  AR      drivers/amba/built-in.a
  CC      arch/powerpc/kernel/cacheinfo.o
  AR      arch/powerpc/mm/built-in.a
  AR      drivers/auxdisplay/built-in.a
  CC      block/elevator.o
  AS      arch/powerpc/lib/string_32.o
  AR      kernel/bpf/built-in.a
  CC      arch/powerpc/kernel/time.o
  CC      crypto/memneq.o
  CC      drivers/base/power/sysfs.o
  AR      drivers/base/firmware_loader/builtin/built-in.a
  AR      drivers/base/test/built-in.a
  CC      arch/powerpc/lib/sstep.o
  CC      drivers/base/firmware_loader/main.o
  CC      drivers/block/brd.o
  AR      sound/built-in.a
  CC      block/blk-core.o
  CC      block/blk-sysfs.o
  AR      security/built-in.a
  AR      arch/powerpc/platforms/44x/built-in.a
  AR      arch/powerpc/platforms/built-in.a
  CC      drivers/base/component.o
  CC      arch/powerpc/math-emu/fctiw.o
  CC      arch/powerpc/kernel/prom.o
  AR      kernel/dma/built-in.a
  CC      crypto/crypto_wq.o
  CC      crypto/algapi.o
  CC      crypto/scatterwalk.o
  CC      mm/page-writeback.o
  CC      ipc/sem.o
  AR      net/802/built-in.a
  CC      arch/powerpc/math-emu/fctiwz.o
  CC [M]  net/802/p8022.o
  CC      kernel/irq/spurious.o
  CC      arch/powerpc/math-emu/fdiv.o
  CC      crypto/proc.o
  CC      fs/ext2/ialloc.o
  CC      kernel/irq/resend.o
  CC [M]  net/802/psnap.o
  CC      drivers/base/power/generic_ops.o
  CC      block/partitions/msdos.o
  CC      block/partitions/efi.o
  CC      arch/powerpc/math-emu/fdivs.o
  CC      crypto/aead.o
  CC      kernel/irq/chip.o
  CC      lib/lz4/lz4_decompress.o
  CC      block/blk-flush.o
  CC      block/blk-settings.o
  CC      block/blk-ioc.o
  CC      lib/lzo/lzo1x_decompress_safe.o
  AR      drivers/base/firmware_loader/built-in.a
  AS      arch/powerpc/lib/ldstfp.o
  CC [M]  lib/lzo/lzo1x_compress.o
  CC      drivers/base/power/common.o
  CC      drivers/block/virtio_blk.o
  CC      block/blk-map.o
  CC      arch/powerpc/kernel/traps.o
  CC      kernel/locking/mutex.o
  AR      arch/powerpc/lib/built-in.a
  CC      crypto/ablkcipher.o
  CC      crypto/blkcipher.o
  CC      drivers/base/power/qos.o
  CC      block/blk-exec.o
  CC      arch/powerpc/math-emu/fmadd.o
  CC      kernel/irq/dummychip.o
  AR      virt/lib/built-in.a
  AR      virt/built-in.a
  CC      arch/powerpc/math-emu/fmadds.o
  CC      block/blk-merge.o
  AR      drivers/bus/built-in.a
  CC [M]  net/802/stp.o
  CC      mm/readahead.o
  CC      arch/powerpc/kernel/setup-common.o
  CC      fs/ext2/inode.o
  CC      crypto/skcipher.o
  CC      ipc/shm.o
  CC      arch/powerpc/kernel/udbg.o
  CC      ipc/syscall.o
  AR      lib/lz4/built-in.a
  AR      drivers/cdrom/built-in.a
  CC      crypto/ahash.o
  CC      lib/math/div64.o
  CC      lib/math/gcd.o
  AR      block/partitions/built-in.a
  AR      drivers/char/agp/built-in.a
  CC      kernel/irq/devres.o
  CC      lib/xz/xz_dec_syms.o
  CC [M]  drivers/char/xilinx_hwicap/xilinx_hwicap.o
  CC      lib/math/lcm.o
  CC      lib/xz/xz_dec_stream.o
  AR      lib/lzo/built-in.a
  CC      kernel/locking/semaphore.o
  CC      kernel/locking/rwsem.o
  LD [M]  lib/lzo/lzo_compress.o
  CC      block/blk-softirq.o
  CC      arch/powerpc/math-emu/fmsub.o
  CC      drivers/base/power/runtime.o
  CC      arch/powerpc/math-emu/fmsubs.o
  CC      kernel/locking/percpu-rwsem.o
  CC      drivers/base/power/wakeirq.o
  CC      drivers/char/mem.o
  CC [M]  drivers/char/xilinx_hwicap/fifo_icap.o
  CC      lib/math/int_pow.o
  CC      drivers/base/power/main.o
  CC      crypto/shash.o
  CC      kernel/irq/irqdomain.o
  CC      crypto/akcipher.o
  CC      lib/zlib_deflate/deflate.o
  AR      net/bpf/built-in.a
  CC [M]  drivers/block/xsysace.o
  CC      lib/math/int_sqrt.o
  CC [M]  net/bridge/br.o
  CC      drivers/char/random.o
  CC      kernel/locking/rwsem-xadd.o
  CC      lib/xz/xz_dec_lzma2.o
  CC [M]  drivers/char/xilinx_hwicap/buffer_icap.o
  AS      arch/powerpc/kernel/misc.o
  CC      mm/swap.o
  CC      lib/math/reciprocal_div.o
  CC      kernel/locking/mutex-debug.o
  CC      mm/truncate.o
  CC [M]  net/bridge/br_device.o
  CC      arch/powerpc/kernel/io.o
  CC      arch/powerpc/math-emu/fmul.o
  CC      block/blk-timeout.o
  CC      lib/zlib_inflate/inffast.o
  CC      lib/zlib_inflate/inflate.o
  CC      ipc/ipc_sysctl.o
  CC      drivers/base/power/wakeup.o
  CC      mm/vmscan.o
  CC      fs/ext2/ioctl.o
  CC      lib/bcd.o
  CC      lib/lockref.o
  AR      lib/math/built-in.a
  CC [M]  net/bridge/br_fdb.o
  CC [M]  net/bridge/br_forward.o
  CC      block/blk-lib.o
  AS      arch/powerpc/kernel/misc_32.o
  CC      lib/zlib_deflate/deftree.o
  CC      lib/zlib_inflate/infutil.o
  CC      lib/zlib_inflate/inftrees.o
  CC      lib/xz/xz_dec_bcj.o
  CC      crypto/kpp.o
  CC      crypto/acompress.o
  CC      ipc/mqueue.o
  CC      crypto/scompress.o
  CC      ipc/mq_sysctl.o
  LD [M]  drivers/char/xilinx_hwicap/xilinx_hwicap_m.o
  CC      crypto/algboss.o
  CC      drivers/char/misc.o
  CC      kernel/irq/proc.o
  CC      kernel/irq/pm.o
  CC      kernel/locking/lockdep.o
  CC      kernel/irq/msi.o
  CC      block/blk-mq.o
  CC      block/blk-mq-tag.o
  CC      arch/powerpc/math-emu/fmuls.o
  CC      arch/powerpc/math-emu/fnabs.o
  CC      fs/ext2/namei.o
  CC      lib/zlib_inflate/inflate_syms.o
  AR      drivers/block/built-in.a
  AR      drivers/char/ipmi/built-in.a
  CC      net/core/sock.o
  CC      block/blk-stat.o
  AR      lib/xz/built-in.a
  CC      kernel/power/qos.o
  CC      block/blk-mq-sysfs.o
  CC      kernel/locking/lockdep_proc.o
  CC      kernel/power/main.o
  CC      arch/powerpc/kernel/of_platform.o
  CC      block/blk-mq-cpumap.o
  AR      drivers/clk/actions/built-in.a
  CC      arch/powerpc/math-emu/fneg.o
  AR      drivers/clk/analogbits/built-in.a
  AR      drivers/clk/bcm/built-in.a
  CC      lib/zlib_deflate/deflate_syms.o
  AR      drivers/clk/imgtec/built-in.a
  CC      drivers/char/nvram.o
  CC      kernel/power/process.o
  AR      drivers/base/power/built-in.a
  CC      drivers/base/core.o
  AR      drivers/clk/imx/built-in.a
  AR      lib/zlib_inflate/built-in.a
  CC [M]  net/bridge/br_if.o
  CC      arch/powerpc/kernel/prom_parse.o
  AR      drivers/clk/ingenic/built-in.a
  CC      mm/shmem.o
  AR      drivers/clk/mediatek/built-in.a
  CC      crypto/testmgr.o
  CC      net/ethernet/eth.o
  AR      kernel/irq/built-in.a
  CC      crypto/crypto_null.o
  CC      kernel/locking/spinlock.o
  CC [M]  net/bridge/br_input.o
  CC      fs/ext2/super.o
  AR      drivers/clk/mvebu/built-in.a
  CC      kernel/printk/printk.o
  CC      net/ipv4/route.o
  AR      drivers/clk/renesas/built-in.a
  CC      arch/powerpc/math-emu/fnmadd.o
  AR      drivers/clk/ti/built-in.a
  AR      drivers/clk/built-in.a
  CC      mm/util.o
  CC      mm/mmzone.o
  AR      lib/zlib_deflate/built-in.a
  CC      kernel/printk/printk_safe.o
  CC      lib/sort.o
  CC      kernel/locking/rtmutex.o
  CC      fs/ext2/symlink.o
  AR      drivers/clocksource/built-in.a
  CC      arch/powerpc/math-emu/fnmadds.o
  CC      lib/parser.o
  AR      ipc/built-in.a
  CC      lib/debug_locks.o
  CC      kernel/power/suspend.o
  CC [M]  net/bridge/br_ioctl.o
  AR      drivers/char/built-in.a
  CC      crypto/ecb.o
  CC      crypto/pcbc.o
  CC      kernel/locking/rtmutex-debug.o
  CC [M]  net/bridge/br_stp.o
  AR      drivers/crypto/hisilicon/built-in.a
  AR      drivers/crypto/built-in.a
  CC      lib/random32.o
  AR      drivers/firewire/built-in.a
  CC      arch/powerpc/kernel/proc_powerpc.o
  CC      kernel/power/poweroff.o
  CC      mm/vmstat.o
  CC      arch/powerpc/kernel/module.o
  CC      arch/powerpc/kernel/module_32.o
  CC      net/ipv6/af_inet6.o
  CC      kernel/rcu/update.o
  AS      arch/powerpc/kernel/cpu_setup_44x.o
  CC      drivers/connector/cn_queue.o
  CC      drivers/connector/connector.o
  CC      drivers/connector/cn_proc.o
  CC      kernel/sched/core.o
  CC      kernel/time/time.o
  CC      net/core/request_sock.o
  CC [M]  net/llc/llc_core.o
  CC      lib/bust_spinlocks.o
  CC      kernel/time/timer.o
  AR      net/ethernet/built-in.a
  CC [M]  net/bridge/br_stp_bpdu.o
  AS      arch/powerpc/kernel/entry_32.o
  CC      arch/powerpc/kernel/setup_32.o
  AR      fs/ext2/built-in.a
  CC      kernel/trace/trace_clock.o
  CC [M]  fs/ext4/balloc.o
  CC      arch/powerpc/math-emu/fnmsub.o
  CC [M]  net/bridge/br_stp_if.o
  CC      net/ipv4/inetpeer.o
  CC      crypto/aes_generic.o
  CC      kernel/rcu/sync.o
  CC      block/blk-mq-sched.o
  CC      arch/powerpc/kernel/early_32.o
  CC      arch/powerpc/kernel/legacy_serial.o
  CC      lib/kasprintf.o
  AR      kernel/power/built-in.a
  AR      kernel/printk/built-in.a
  CC      lib/bitmap.o
  CC      arch/powerpc/kernel/udbg_16550.o
  CC      kernel/locking/spinlock_debug.o
  CC [M]  net/bridge/br_stp_timer.o
  CC [M]  net/llc/llc_input.o
  CC      mm/backing-dev.o
  CC      kernel/trace/ring_buffer.o
  CC      arch/powerpc/math-emu/fnmsubs.o
  CC      kernel/trace/trace.o
  CC      net/ipv4/protocol.o
  CC [M]  fs/ext4/bitmap.o
  CC      kernel/locking/test-ww_mutex.o
  CC      net/core/skbuff.o
  CC      net/netlink/af_netlink.o
  CC      net/netlink/genetlink.o
  CC      net/ipv6/anycast.o
  CC      kernel/time/hrtimer.o
  CC      arch/powerpc/kernel/stacktrace.o
  CC      arch/powerpc/math-emu/fres.o
  AR      drivers/connector/built-in.a
  CC      kernel/rcu/srcutiny.o
  CC      arch/powerpc/math-emu/frsp.o
  CC [M]  net/llc/llc_output.o
  CC      arch/powerpc/math-emu/fsel.o
  CC      kernel/time/timekeeping.o
  CC      drivers/base/bus.o
  CC      arch/powerpc/math-emu/lfs.o
  CC      drivers/base/dd.o
  CC      crypto/rng.o
  CC      net/packet/af_packet.o
  CC      lib/scatterlist.o
  CC      block/ioctl.o
  CC [M]  net/bridge/br_netlink.o
  CC      net/sched/sch_generic.o
  CC [M]  fs/ext4/block_validity.o
  CC      net/sunrpc/clnt.o
  CC [M]  fs/ext4/dir.o
  AR      kernel/locking/built-in.a
  CC [M]  fs/ext4/ext4_jbd2.o
  CC      kernel/fork.o
  CC      kernel/rcu/tiny.o
  CC      crypto/hash_info.o
  CC      mm/mm_init.o
  CC [M]  crypto/echainiv.o
  CC      arch/powerpc/kernel/pci_32.o
  CC      kernel/sched/loadavg.o
  CC      net/ipv4/ip_input.o
  CC      drivers/base/syscore.o
  CC      arch/powerpc/kernel/pci-common.o
  CC      drivers/base/driver.o
  LD [M]  net/llc/llc.o
  CC      net/ipv6/ip6_output.o
  CC      net/unix/af_unix.o
  CC      lib/list_sort.o
  AR      kernel/rcu/built-in.a
  CC      arch/powerpc/kernel/pci_of_scan.o
  CC      kernel/exec_domain.o
  CC      kernel/sched/clock.o
  CC      lib/uuid.o
  CC [M]  crypto/hmac.o
  CC      lib/iov_iter.o
  CC      kernel/trace/trace_output.o
  AR      net/wireless/built-in.a
  CC      lib/clz_ctz.o
  CC [M]  net/bridge/br_netlink_tunnel.o
  CC      drivers/base/class.o
  CC      arch/powerpc/kernel/msi.o
  CC      mm/mmu_context.o
  CC      drivers/base/platform.o
  CC      block/genhd.o
  CC [M]  fs/ext4/extents.o
  CC      arch/powerpc/kernel/iomap.o
  CC      arch/powerpc/math-emu/frsqrte.o
  CC      kernel/panic.o
  CC      mm/percpu.o
  CC      drivers/base/cpu.o
  CC      kernel/cpu.o
  CC      drivers/base/firmware.o
  CC [M]  fs/fat/cache.o
  AS      arch/powerpc/kernel/ppc_save_regs.o
  AR      drivers/firmware/broadcom/built-in.a
  CC [M]  fs/ext4/extents_status.o
  CC      kernel/time/ntp.o
  CC      arch/powerpc/math-emu/fsub.o
  CC [M]  net/bridge/br_arp_nd_proxy.o
  CC      mm/slab_common.o
  CC [M]  net/bridge/br_sysfs_if.o
  CC [M]  crypto/sha256_generic.o
  CC      net/unix/garbage.o
  AR      net/netlink/built-in.a
  CC      net/sunrpc/xprt.o
  CC      net/ipv4/ip_fragment.o
  CC      arch/powerpc/math-emu/fsubs.o
  CC      net/sched/sch_mq.o
  AS      arch/powerpc/kernel/head_44x.o
  CC      arch/powerpc/math-emu/mcrfs.o
  CC      kernel/trace/trace_seq.o
  CC      kernel/sched/cputime.o
  AR      net/packet/built-in.a
  CC      drivers/gpio/gpiolib.o
  CC      net/socket.o
  LDS     arch/powerpc/kernel/vmlinux.lds
  CC      net/core/datagram.o
  AS      arch/powerpc/kernel/fpu.o
  CC      drivers/gpio/gpiolib-devres.o
  CC      net/sysctl_net.o
  CC [M]  fs/fat/dir.o
  CC      kernel/trace/trace_stat.o
  AR      arch/powerpc/kernel/built-in.a
  CC      net/ipv4/ip_forward.o
  CC      mm/compaction.o
  CC      drivers/base/init.o
  CC      arch/powerpc/math-emu/mffs.o
  CC [M]  net/bridge/br_sysfs_br.o
  AR      drivers/firmware/imx/built-in.a
  AR      drivers/gpu/drm/arm/built-in.a
  AR      drivers/firmware/meson/built-in.a
  AR      drivers/gpu/drm/bridge/synopsys/built-in.a
  AR      drivers/firmware/psci/built-in.a
  AR      drivers/gpu/drm/bridge/built-in.a
  CC      kernel/trace/trace_printk.o
  AR      drivers/firmware/tegra/built-in.a
  AR      drivers/gpu/drm/hisilicon/built-in.a
  CC      kernel/time/clocksource.o
  CC      net/ipv6/ip6_input.o
  AR      drivers/gpu/drm/i2c/built-in.a
  AR      drivers/gpu/drm/omapdrm/displays/built-in.a
  CC      block/partition-generic.o
  AR      drivers/gpu/drm/omapdrm/dss/built-in.a
  AR      drivers/gpu/drm/omapdrm/built-in.a
  AR      drivers/gpu/drm/panel/built-in.a
  CC      net/ipv6/addrconf.o
  AR      drivers/gpu/drm/rcar-du/built-in.a
  CC      net/ipv6/addrlabel.o
  AR      drivers/gpu/drm/tilcdc/built-in.a
  CC      drivers/base/map.o
  AR      drivers/gpu/drm/built-in.a
  AR      drivers/firmware/xilinx/built-in.a
  CC      mm/vmacache.o
  CC      drivers/gpu/vga/vgaarb.o
  AR      drivers/firmware/built-in.a
  CC      mm/interval_tree.o
  CC      lib/bsearch.o
  CC [M]  net/bridge/br_multicast.o
  AR      net/sched/built-in.a
  CC      arch/powerpc/math-emu/mtfsb0.o
  CC [M]  fs/fat/fatent.o
  CC      drivers/base/devres.o
  CC      net/unix/sysctl_net_unix.o
  CC      kernel/time/jiffies.o
  CC      net/ipv6/route.o
  CC      drivers/base/attribute_container.o
  CC      net/ipv4/ip_options.o
  CC      net/ipv4/ip_output.o
  CC      kernel/sched/idle.o
  CC      arch/powerpc/math-emu/mtfsb1.o
  CC      drivers/gpio/gpiolib-legacy.o
  CC      kernel/trace/trace_sched_switch.o
  CC      kernel/trace/trace_preemptirq.o
  CC [M]  crypto/deflate.o
  CC      mm/list_lru.o
  CC      lib/find_bit.o
  CC      mm/workingset.o
  CC [M]  fs/jbd2/transaction.o
  CC      net/sunrpc/socklib.o
  CC [M]  crypto/crc32c_generic.o
  CC      lib/llist.o
  CC      kernel/time/timer_list.o
  CC      arch/powerpc/math-emu/stfiwx.o
  AR      drivers/gpu/vga/built-in.a
  AR      drivers/gpu/built-in.a
  CC      drivers/base/transport_class.o
  CC      mm/debug.o
  CC      mm/gup.o
  CC      net/core/stream.o
  CC      net/unix/scm.o
  CC      fs/jffs2/compr.o
  CC      lib/memweight.o
  CC      block/ioprio.o
  CC      block/badblocks.o
  CC      drivers/gpio/gpiolib-devprop.o
  CC      drivers/gpio/gpiolib-of.o
  CC [M]  net/bridge/br_mdb.o
  CC      kernel/time/timeconv.o
  CC      fs/jffs2/dir.o
  CC [M]  fs/fat/file.o
  CC      lib/kfifo.o
  CC      net/ipv6/ip6_fib.o
  CC      net/ipv4/ip_sockglue.o
  CC      drivers/base/topology.o
  CC      kernel/time/timecounter.o
  CC      kernel/exit.o
  AR      drivers/hwtracing/intel_th/built-in.a
  CC [M]  crypto/crct10dif_common.o
  CC      block/blk-rq-qos.o
  CC      kernel/trace/trace_nop.o
  CC [M]  fs/ext4/file.o
  CC      block/scsi_ioctl.o
  CC      net/ipv4/inet_hashtables.o
  CC [M]  fs/jbd2/commit.o
  CC      fs/kernfs/mount.o
  CC      kernel/sched/fair.o
  CC      kernel/sched/rt.o
  CC      fs/jffs2/file.o
  CC [M]  crypto/crct10dif_generic.o
  CC      lib/percpu-refcount.o
  CC      drivers/gpio/gpio-xilinx.o
  CC      lib/rhashtable.o
  CC      mm/highmem.o
  CC      arch/powerpc/math-emu/stfs.o
  CC      net/core/scm.o
  CC      net/core/gen_stats.o
  CC [M]  fs/fat/inode.o
  CC      kernel/trace/blktrace.o
  CC      fs/kernfs/inode.o
  AR      net/unix/built-in.a
  CC      arch/powerpc/math-emu/fmr.o
  CC      net/core/gen_estimator.o
  CC      net/sunrpc/xprtsock.o
  LD [M]  net/bridge/bridge.o
  CC      fs/jffs2/ioctl.o
  CC      drivers/base/container.o
  CC [M]  crypto/lzo.o
  CC [M]  fs/ext4/fsmap.o
  CC      fs/jffs2/nodelist.o
  CC      fs/jffs2/malloc.o
  CC      block/bsg.o
  CC      fs/jffs2/read.o
  CC [M]  crypto/lzo-rle.o
  CC      arch/powerpc/math-emu/lfd.o
  CC      mm/memory.o
  AR      drivers/i2c/algos/built-in.a
  CC [M]  drivers/i2c/algos/i2c-algo-bit.o
  CC      kernel/sched/deadline.o
  CC      net/sunrpc/sched.o
  CC      arch/powerpc/math-emu/stfd.o
  AR      drivers/i2c/busses/built-in.a
  CC      fs/kernfs/dir.o
  CC [M]  drivers/i2c/busses/i2c-gpio.o
  CC [M]  fs/jbd2/recovery.o
  CC      net/sunrpc/auth.o
  CC      net/ipv6/ipv6_sockglue.o
  CC      kernel/time/alarmtimer.o
  CC      fs/jffs2/nodemgmt.o
  CC      kernel/sched/wait.o
  CC [M]  crypto/drbg.o
  CC      lib/once.o
  CC      kernel/trace/trace_events.o
  CC      net/sunrpc/auth_null.o
  AR      arch/powerpc/math-emu/built-in.a
  AR      arch/powerpc/built-in.a
  CC [M]  fs/fat/misc.o
  CC [M]  fs/fat/nfs.o
  CC      net/ipv4/inet_timewait_sock.o
  CC      fs/jffs2/readinode.o
  CC      net/core/net_namespace.o
  CC      net/core/secure_seq.o
  CC [M]  fs/fat/namei_vfat.o
  CC      kernel/sched/wait_bit.o
  CC      lib/refcount.o
  AR      drivers/gpio/built-in.a
  CC      fs/kernfs/file.o
  CC      fs/jffs2/write.o
  CC [M]  drivers/i2c/busses/i2c-ibm_iic.o
  CC      net/ipv4/inet_connection_sock.o
  CC [M]  fs/jbd2/checkpoint.o
  CC [M]  fs/ext4/fsync.o
  CC      mm/mincore.o
  CC      kernel/sched/swait.o
  AR      drivers/i2c/muxes/built-in.a
  CC      kernel/time/posix-timers.o
  CC      mm/mlock.o
  CC      mm/mmap.o
  CC      drivers/i2c/i2c-boardinfo.o
  CC      net/core/flow_dissector.o
  CC      net/sunrpc/auth_unix.o
  CC      block/bsg-lib.o
  CC      block/mq-deadline.o
  CC      kernel/time/posix-cpu-timers.o
  CC      block/kyber-iosched.o
  CC      fs/kernfs/symlink.o
  LD [M]  fs/fat/vfat.o
  CC [M]  drivers/i2c/i2c-core-base.o
  CC      kernel/trace/trace_export.o
  LD [M]  fs/fat/fat.o
  CC [M]  crypto/jitterentropy-kcapi.o
  CC [M]  crypto/jitterentropy.o
  CC      net/sunrpc/svc.o
  CC      mm/mmu_gather.o
  CC      drivers/base/property.o
  CC      drivers/base/cacheinfo.o
  CC      drivers/base/devcon.o
  CC [M]  fs/jbd2/revoke.o
  CC [M]  drivers/i2c/i2c-core-smbus.o
  CC      lib/usercopy.o
  AR      fs/kernfs/built-in.a
  CC [M]  drivers/i2c/i2c-core-of.o
  CC      net/ipv6/ndisc.o
  CC      fs/jffs2/scan.o
  CC      net/ipv6/udp.o
  CC      net/sunrpc/svcsock.o
  CC [M]  drivers/i2c/i2c-dev.o
  CC [M]  fs/ext4/hash.o
  CC      drivers/base/swnode.o
  CC      drivers/base/devtmpfs.o
  CC      net/ipv4/tcp.o
  AR      crypto/built-in.a
  AR      drivers/i3c/built-in.a
  CC      net/core/sysctl_net_core.o
  LD [M]  crypto/jitterentropy_rng.o
  CC [M]  fs/jbd2/journal.o
  CC      kernel/trace/trace_events_filter.o
  CC      mm/mprotect.o
  CC      lib/errseq.o
  CC      net/sunrpc/svcauth.o
  CC      kernel/time/posix-clock.o
  CC      net/sunrpc/svcauth_unix.o
  CC      net/ipv4/tcp_input.o
  CC      kernel/sched/completion.o
  CC      mm/mremap.o
  CC      kernel/trace/trace_events_trigger.o
  CC      kernel/time/itimer.o
  CC      kernel/time/clockevents.o
  CC      lib/bucket_locks.o
  CC      kernel/time/tick-common.o
  CC      block/blk-mq-pci.o
  CC [M]  fs/ext4/ialloc.o
  CC      kernel/time/timekeeping_debug.o
  CC      block/blk-mq-virtio.o
  AR      drivers/i2c/built-in.a
  AR      drivers/idle/built-in.a
  CC [M]  drivers/input/serio/serio.o
  AR      drivers/iommu/built-in.a
  CC      kernel/trace/power-traces.o
  CC [M]  fs/ext4/indirect.o
  CC      drivers/base/module.o
  CC      fs/jffs2/gc.o
  LD [M]  drivers/i2c/i2c-core.o
  CC      lib/generic-radix-tree.o
  CC      lib/test_string.o
  CC [M]  fs/ext4/inline.o
  CC      drivers/irqchip/irqchip.o
  CC      drivers/irqchip/irq-xilinx-intc.o
  CC      fs/lockd/clntlock.o
  CC      net/core/dev.o
  CC      net/core/ethtool.o
  CC      lib/string_helpers.o
  CC      net/core/dev_addr_lists.o
  CC      kernel/trace/rpm-traces.o
  CC      mm/msync.o
  CC      mm/page_vma_mapped.o
  CC      net/sunrpc/addr.o
  AR      drivers/base/built-in.a
  AR      kernel/time/built-in.a
  CC      mm/pagewalk.o
  AR      drivers/macintosh/built-in.a
  CC      kernel/softirq.o
  CC      mm/pgtable-generic.o
  CC      kernel/sched/debug.o
  CC      net/core/dst.o
  CC      block/blk-mq-debugfs.o
  CC      lib/hexdump.o
  CC      mm/rmap.o
  AR      drivers/media/common/b2c2/built-in.a
  CC      lib/kstrtox.o
  AR      drivers/media/common/saa7146/built-in.a
  CC      drivers/message/fusion/mptbase.o
  AR      drivers/media/common/siano/built-in.a
  CC      lib/test_firmware.o
  AR      drivers/media/common/v4l2-tpg/built-in.a
  CC [M]  drivers/input/serio/xilinx_ps2.o
  AR      drivers/media/common/videobuf2/built-in.a
  AR      drivers/media/common/built-in.a
  AR      drivers/irqchip/built-in.a
  CC      kernel/sched/membarrier.o
  AR      drivers/mfd/built-in.a
  AR      drivers/media/firewire/built-in.a
  CC      drivers/message/fusion/mptscsih.o
  AR      drivers/media/i2c/built-in.a
  LD [M]  fs/jbd2/jbd2.o
  AR      drivers/media/mmc/siano/built-in.a
  CC [M]  fs/ext4/inode.o
  AR      drivers/media/mmc/built-in.a
  CC      drivers/message/fusion/mptsas.o
  AR      drivers/media/pci/b2c2/built-in.a
  AR      drivers/misc/cardreader/built-in.a
  AR      drivers/media/pci/ddbridge/built-in.a
  CC      net/ipv6/udplite.o
  AR      drivers/misc/cb710/built-in.a
  AR      drivers/media/pci/dm1105/built-in.a
  AR      drivers/misc/eeprom/built-in.a
  AR      drivers/media/pci/intel/ipu3/built-in.a
  AR      drivers/misc/lis3lv02d/built-in.a
  CC      fs/jffs2/symlink.o
  AR      kernel/trace/built-in.a
  CC      fs/nfs/client.o
  AR      drivers/misc/mic/bus/built-in.a
  AR      drivers/media/pci/intel/built-in.a
  CC      mm/vmalloc.o
  AR      drivers/media/platform/cros-ec-cec/built-in.a
  AR      drivers/misc/mic/built-in.a
  CC      net/sunrpc/rpcb_clnt.o
  AR      drivers/media/pci/mantis/built-in.a
  AR      drivers/misc/ti-st/built-in.a
  AR      drivers/media/pci/netup_unidvb/built-in.a
  CC      drivers/mmc/core/core.o
  CC      net/sunrpc/timer.o
  AR      drivers/media/pci/ngene/built-in.a
  AR      drivers/media/pci/pluto2/built-in.a
  CC      drivers/misc/pci_endpoint_test.o
  AR      drivers/media/rc/keymaps/built-in.a
  AR      drivers/media/pci/pt1/built-in.a
  AR      drivers/media/rc/built-in.a
  AR      drivers/media/pci/pt3/built-in.a
  AR      drivers/media/platform/davinci/built-in.a
  AR      drivers/media/pci/saa7146/built-in.a
  CC      fs/nfs_common/grace.o
  AR      drivers/media/platform/meson/built-in.a
  AR      drivers/media/pci/smipcie/built-in.a
  AR      drivers/media/pci/ttpci/built-in.a
  CC      net/ipv6/raw.o
  AR      drivers/media/platform/omap/built-in.a
  CC      fs/nls/nls_base.o
  CC      kernel/resource.o
  CC      drivers/mmc/host/sdhci.o
  CC      lib/test_sysctl.o
  AR      drivers/media/spi/built-in.a
  CC      drivers/mmc/host/sdhci-pci-core.o
  AR      drivers/media/platform/stm32/built-in.a
  CC      drivers/mmc/host/sdhci-pci-o2micro.o
  AR      drivers/media/platform/built-in.a
  CC      fs/nfs/dir.o
  CC      block/blk-pm.o
  CC      fs/jffs2/build.o
  CC      net/core/netevent.o
  AR      drivers/media/pci/built-in.a
  CC      drivers/mmc/host/sdhci-pci-arasan.o
  AR      drivers/media/tuners/built-in.a
  AR      drivers/media/usb/b2c2/built-in.a
  CC [M]  fs/nls/nls_cp437.o
  AR      kernel/sched/built-in.a
  CC      fs/lockd/clntproc.o
  CC      drivers/mtd/chips/chipreg.o
  AR      drivers/misc/built-in.a
  AR      fs/nfs_common/built-in.a
  CC      lib/test_sort.o
  CC      net/core/neighbour.o
  AR      drivers/media/usb/dvb-usb/built-in.a
  CC      kernel/sysctl.o
  CC      kernel/sysctl_binary.o
  AR      drivers/media/usb/dvb-usb-v2/built-in.a
  AR      drivers/media/usb/s2255/built-in.a
  AR      drivers/mtd/devices/built-in.a
  CC      net/core/utils.o
  CC      net/core/rtnetlink.o
  AR      drivers/media/usb/siano/built-in.a
  AR      drivers/media/usb/stkwebcam/built-in.a
  CC      drivers/mtd/chips/cfi_probe.o
  AR      drivers/media/usb/ttusb-budget/built-in.a
  AR      drivers/media/usb/ttusb-dec/built-in.a
  AR      drivers/media/usb/zr364xx/built-in.a
  AR      drivers/media/usb/built-in.a
  CC      net/ipv6/icmp.o
  AR      drivers/media/built-in.a
  CC      fs/jffs2/erase.o
  AR      block/built-in.a
  CC      fs/jffs2/background.o
  CC      lib/test_bitmap.o
  CC      fs/jffs2/fs.o
  CC      drivers/mmc/host/sdhci-pci-dwc-mshc.o
  CC      kernel/capability.o
  CC      net/sunrpc/xdr.o
  CC [M]  fs/ext4/ioctl.o
  CC [M]  fs/nls/nls_iso8859-1.o
  CC [M]  fs/ext4/mballoc.o
  CC      fs/notify/dnotify/dnotify.o
  AR      drivers/net/dsa/b53/built-in.a
  AR      drivers/net/dsa/microchip/built-in.a
  CC      drivers/mmc/core/bus.o
  AR      drivers/net/ethernet/3com/built-in.a
  AR      drivers/net/ethernet/8390/built-in.a
  CC      net/ipv4/tcp_output.o
  AR      drivers/net/ethernet/adaptec/built-in.a
  CC      net/ipv4/tcp_timer.o
  CC      mm/process_vm_access.o
  AR      drivers/net/dsa/mv88e6xxx/built-in.a
  CC      drivers/net/phy/mdio-boardinfo.o
  AR      drivers/net/dsa/sja1105/built-in.a
  AR      drivers/net/dsa/built-in.a
  AR      drivers/nfc/built-in.a
  CC      drivers/mtd/chips/cfi_util.o
  AR      fs/notify/fanotify/built-in.a
  CC      net/sunrpc/sunrpc_syms.o
  AR      drivers/mtd/lpddr/built-in.a
  CC      mm/page_alloc.o
  CC      drivers/net/phy/phy.o
  AR      drivers/message/fusion/built-in.a
  AR      drivers/message/built-in.a
  AR      fs/nls/built-in.a
  CC      lib/test_uuid.o
  CC      fs/jffs2/writev.o
  AR      drivers/net/ethernet/agere/built-in.a
  AR      drivers/net/wireless/admtek/built-in.a
  AR      drivers/net/ethernet/alacritech/built-in.a
  CC      drivers/mmc/host/sdhci-pci-data.o
  AR      drivers/net/wireless/ath/built-in.a
  CC      drivers/mmc/core/host.o
  AR      drivers/net/ethernet/alteon/built-in.a
  CC      fs/proc/task_mmu.o
  AR      fs/notify/dnotify/built-in.a
  CC      net/sunrpc/cache.o
  AR      drivers/net/wireless/atmel/built-in.a
  AR      drivers/net/ethernet/amazon/built-in.a
  AR      drivers/net/wireless/broadcom/built-in.a
  AR      drivers/net/ethernet/amd/built-in.a
  AR      drivers/net/wireless/cisco/built-in.a
  AR      drivers/net/ethernet/aquantia/built-in.a
  CC      fs/lockd/clntxdr.o
  AR      drivers/net/wireless/intel/built-in.a
  AR      drivers/net/ethernet/arc/built-in.a
  CC      lib/pci_iomap.o
  AR      drivers/net/wireless/intersil/built-in.a
  CC      drivers/mmc/core/mmc.o
  AR      drivers/net/ethernet/atheros/built-in.a
  AR      drivers/net/wireless/marvell/built-in.a
  CC      drivers/nvme/host/core.o
  CC      drivers/mmc/host/cqhci.o
  AR      drivers/net/ethernet/aurora/built-in.a
  AR      drivers/net/wireless/mediatek/built-in.a
  CC      fs/proc/inode.o
  AR      drivers/net/ethernet/broadcom/built-in.a
  CC      kernel/ptrace.o
  AR      drivers/net/ethernet/brocade/built-in.a
  CC      drivers/mtd/chips/cfi_cmdset_0002.o
  CC      fs/jffs2/super.o
  CC      fs/notify/inotify/inotify_fsnotify.o
  CC      drivers/nvmem/core.o
  CC      drivers/mtd/chips/gen_probe.o
  CC      drivers/mtd/chips/jedec_probe.o
  AR      drivers/net/ethernet/cadence/built-in.a
  CC [M]  fs/ext4/migrate.o
  CC      fs/notify/inotify/inotify_user.o
  CC      net/ipv6/mcast.o
  AR      drivers/net/ethernet/cavium/common/built-in.a
  AR      drivers/net/ethernet/cavium/liquidio/built-in.a
  AR      drivers/net/ethernet/cavium/octeon/built-in.a
  CC      fs/nfs/file.o
  AR      drivers/net/ethernet/cavium/thunder/built-in.a
  AR      drivers/net/ethernet/cavium/built-in.a
  AR      drivers/net/ethernet/chelsio/built-in.a
  CC      kernel/user.o
  AR      drivers/net/ethernet/cisco/built-in.a
  AR      drivers/net/ethernet/cortina/built-in.a
  AR      drivers/net/ethernet/dec/built-in.a
  AR      drivers/net/ethernet/dlink/built-in.a
  AR      drivers/net/ethernet/emulex/built-in.a
  AR      drivers/net/ethernet/ezchip/built-in.a
  AR      drivers/net/ethernet/hp/built-in.a
  CC      drivers/nvmem/nvmem-sysfs.o
  CC      drivers/net/phy/phy-c45.o
  AR      drivers/net/ethernet/huawei/built-in.a
  CC      kernel/signal.o
  AR      drivers/net/ethernet/i825xx/built-in.a
  CC      lib/iomap_copy.o
  CC      kernel/sys.o
  CC      net/core/link_watch.o
  CC      drivers/mmc/core/mmc_ops.o
  AR      drivers/net/wireless/quantenna/built-in.a
  CC      net/core/filter.o
  CC      fs/proc/root.o
  CC      net/ipv6/reassembly.o
  CC      fs/jffs2/debug.o
  CC      drivers/mmc/core/sd.o
  AR      drivers/net/wireless/ralink/built-in.a
  AR      drivers/net/ethernet/intel/built-in.a
  CC      drivers/net/ethernet/ibm/emac/mal.o
  AR      drivers/net/wireless/realtek/built-in.a
  AR      drivers/mmc/host/built-in.a
  CC      net/sunrpc/rpc_pipe.o
  CC      drivers/net/ethernet/ibm/emac/core.o
  CC      fs/lockd/host.o
  CC      fs/lockd/svc.o
  CC      drivers/net/ethernet/ibm/emac/phy.o
  AR      drivers/net/wireless/rsi/built-in.a
  CC      drivers/of/base.o
  AR      drivers/nvmem/built-in.a
  AR      drivers/net/wireless/st/built-in.a
  CC      drivers/of/device.o
  AR      fs/notify/inotify/built-in.a
  AR      drivers/net/ethernet/marvell/octeontx2/built-in.a
  AR      drivers/net/wireless/ti/built-in.a
  CC      fs/notify/fsnotify.o
  AR      drivers/net/ethernet/marvell/built-in.a
  AR      drivers/net/wireless/zydas/built-in.a
  CC      kernel/umh.o
  AR      drivers/net/wireless/built-in.a
  CC      drivers/of/platform.o
  CC      net/core/sock_diag.o
  CC      lib/devres.o
  CC      drivers/net/ethernet/ibm/emac/zmii.o
  CC      fs/proc/base.o
  AR      drivers/mtd/chips/built-in.a
  AR      drivers/mtd/maps/built-in.a
  CC      fs/jffs2/wbuf.o
  AR      drivers/mtd/nand/onenand/built-in.a
  AR      drivers/mtd/nand/raw/ingenic/built-in.a
  CC [M]  drivers/mtd/nand/raw/nand_base.o
  CC [M]  fs/ext4/mmp.o
  AR      drivers/nvme/target/built-in.a
  AR      drivers/mtd/nand/spi/built-in.a
  CC      net/ipv6/tcp_ipv6.o
  CC      drivers/net/Space.o
  CC      fs/notify/notification.o
  CC      drivers/net/loopback.o
  CC      fs/nfs/getroot.o
  CC      drivers/of/property.o
  CC      fs/lockd/svclock.o
  CC      fs/lockd/svcshare.o
  CC      drivers/net/ethernet/ibm/emac/rgmii.o
  CC      lib/locking-selftest.o
  CC      lib/logic_pio.o
  CC [M]  fs/ext4/move_extent.o
  CC      drivers/mmc/core/sd_ops.o
  CC [M]  drivers/net/tun.o
  CC      net/ipv4/tcp_ipv4.o
  CC      drivers/net/ethernet/ibm/emac/tah.o
  CC      fs/lockd/svcproc.o
  CC      fs/proc/generic.o
  CC      lib/hweight.o
  CC      fs/nfs/inode.o
  CC      lib/bitrev.o
  CC      mm/init-mm.o
  CC      net/sunrpc/svc_xprt.o
  CC      drivers/net/phy/phy-core.o
  CC      drivers/nvme/host/trace.o
  CC      drivers/nvme/host/pci.o
  CC      fs/notify/group.o
  CC      drivers/of/kobj.o
  CC      kernel/workqueue.o
  HOSTCC  lib/gen_crc32table
  CC      drivers/mmc/core/sdio.o
  CC      drivers/of/fdt.o
  CC      fs/nfs/super.o
  CC      net/sunrpc/xprtmultipath.o
  CC      fs/jffs2/compr_rtime.o
  CC      mm/memblock.o
  CC      mm/madvise.o
  CC      net/sunrpc/stats.o
  CC      net/sunrpc/sysctl.o
  CC      lib/crc32test.o
  AR      drivers/net/ethernet/ibm/emac/built-in.a
  AR      drivers/net/ethernet/ibm/built-in.a
  AR      drivers/net/ethernet/mellanox/built-in.a
  CC [M]  fs/ext4/namei.o
  AR      drivers/net/ethernet/micrel/built-in.a
  CC [M]  fs/ext4/page-io.o
  CC      fs/proc/array.o
  CC      fs/nfs/io.o
  CC      net/ipv4/tcp_minisocks.o
  CC      fs/notify/mark.o
  CC      drivers/of/fdt_address.o
  CC      drivers/net/phy/phy_device.o
  CC      fs/nfs/direct.o
  CC      drivers/mmc/core/sdio_ops.o
  CC      fs/jffs2/compr_zlib.o
  AR      drivers/net/ethernet/microchip/built-in.a
  CC      kernel/pid.o
  AR      drivers/net/ethernet/mscc/built-in.a
  CC      net/ipv6/ping.o
  AR      drivers/net/ethernet/myricom/built-in.a
  AR      drivers/net/ethernet/natsemi/built-in.a
  CC      fs/proc/fd.o
  CC      lib/syscall.o
  CC      drivers/of/address.o
  AR      drivers/net/ethernet/neterion/built-in.a
  CC      lib/nlattr.o
  AR      drivers/net/ethernet/netronome/built-in.a
  AR      drivers/net/ethernet/ni/built-in.a
  AR      drivers/net/ethernet/nvidia/built-in.a
  CC      fs/notify/fdinfo.o
  AR      fs/jffs2/built-in.a
  AR      fs/quota/built-in.a
  AR      drivers/net/ethernet/oki-semi/built-in.a
  CC [M]  drivers/mtd/nand/raw/nand_legacy.o
  CC      drivers/mmc/core/sdio_bus.o
  CC      fs/lockd/svcsubs.o
  CC      net/ipv6/exthdrs.o
  CC      fs/proc/proc_tty.o
  CC      kernel/task_work.o
  CC      net/ipv6/datagram.o
  CC [M]  drivers/mtd/nand/raw/nand_bbt.o
  AR      net/sunrpc/built-in.a
  AR      drivers/net/ethernet/packetengines/built-in.a
  CC      net/ipv6/ip6_flowlabel.o
  AR      drivers/net/ethernet/qlogic/built-in.a
  AR      drivers/net/ethernet/qualcomm/emac/built-in.a
  CC      net/ipv4/tcp_cong.o
  AR      drivers/net/ethernet/qualcomm/built-in.a
  AR      drivers/net/ethernet/rdc/built-in.a
  CC [M]  fs/ext4/readpage.o
  CC      lib/atomic64.o
  CC      lib/dynamic_queue_limits.o
  AR      drivers/net/ethernet/realtek/built-in.a
  CC      drivers/of/irq.o
  CC      net/ipv6/inet6_connection_sock.o
  CC      net/ipv4/tcp_metrics.o
  CC      mm/page_io.o
  CC      mm/swap_state.o
  CC      drivers/of/of_net.o
  AR      drivers/nvme/host/built-in.a
  AR      drivers/nvme/built-in.a
  CC      drivers/mmc/core/sdio_cis.o
  CC      net/ipv6/udp_offload.o
  AR      drivers/net/ethernet/renesas/built-in.a
  CC      lib/glob.o
  CC      drivers/mmc/core/sdio_io.o
  CC      net/core/dev_ioctl.o
  CC      drivers/of/of_mdio.o
  CC      lib/globtest.o
  CC      kernel/extable.o
  AR      fs/notify/built-in.a
  CC      drivers/mmc/core/sdio_irq.o
  CC      drivers/net/phy/mdio_bus.o
  AR      drivers/net/ethernet/rocker/built-in.a
  CC [M]  drivers/mtd/nand/raw/nand_timings.o
  CC [M]  drivers/mtd/nand/raw/nand_ids.o
  CC [M]  fs/ext4/resize.o
  CC [M]  fs/ext4/super.o
  CC [M]  drivers/mtd/nand/core.o
  CC      fs/lockd/mon.o
  CC      drivers/mmc/core/slot-gpio.o
  CC      fs/nfs/pagelist.o
  CC      fs/lockd/xdr.o
  CC      fs/proc/cmdline.o
  AR      drivers/net/ethernet/samsung/built-in.a
  CC      fs/ramfs/inode.o
  CC [M]  fs/ext4/symlink.o
  CC [M]  drivers/mtd/nand/bbt.o
  AR      drivers/net/ethernet/seeq/built-in.a
  CC      drivers/of/of_reserved_mem.o
  CC      drivers/net/phy/mdio_device.o
  AR      drivers/net/ethernet/sfc/built-in.a
  CC      fs/proc/consoles.o
  CC      fs/ramfs/file-mmu.o
  CC      net/ipv6/seg6.o
  CC      drivers/net/phy/swphy.o
  CC [M]  drivers/mtd/nand/raw/nand_onfi.o
  AR      drivers/net/ethernet/silan/built-in.a
  CC [M]  drivers/mtd/nand/raw/nand_jedec.o
  AR      drivers/net/ethernet/sis/built-in.a
  CC      mm/swapfile.o
  AR      drivers/net/ethernet/smsc/built-in.a
  AR      drivers/net/ethernet/socionext/built-in.a
  AR      drivers/net/ethernet/stmicro/built-in.a
  AR      drivers/net/ethernet/sun/built-in.a
  AR      drivers/net/ethernet/synopsys/built-in.a
  CC      net/core/tso.o
  CC      net/ipv6/fib6_notifier.o
  CC      net/core/sock_reuseport.o
  AR      drivers/net/ethernet/tehuti/built-in.a
  CC      lib/strncpy_from_user.o
  CC      kernel/params.o
  CC [M]  drivers/mtd/nand/raw/nand_amd.o
  CC      net/ipv4/tcp_fastopen.o
  CC      lib/strnlen_user.o
  CC      kernel/kthread.o
  CC      lib/net_utils.o
  CC [M]  fs/ext4/sysfs.o
  CC      fs/proc/cpuinfo.o
  CC      drivers/net/phy/fixed_phy.o
  CC [M]  fs/squashfs/block.o
  CC      fs/lockd/clnt4xdr.o
  AR      drivers/of/built-in.a
  CC [M]  drivers/mtd/nand/raw/nand_esmt.o
  CC      net/core/fib_notifier.o
  AR      drivers/net/ethernet/ti/built-in.a
  CC      kernel/nsproxy.o
  CC      kernel/sys_ni.o
  AR      drivers/net/ethernet/via/built-in.a
  AR      fs/ramfs/built-in.a
  AR      drivers/net/ethernet/wiznet/built-in.a
  CC      kernel/notifier.o
  CC      lib/sg_pool.o
  CC [M]  fs/ext4/xattr.o
  CC      net/ipv4/tcp_rate.o
  AR      drivers/net/ethernet/xilinx/built-in.a
  CC [M]  fs/ext4/xattr_trusted.o
  CC [M]  drivers/mtd/nand/raw/nand_hynix.o
  AR      drivers/net/ethernet/built-in.a
  CC      net/core/xdp.o
  AR      drivers/pci/controller/dwc/built-in.a
  AR      drivers/pci/controller/built-in.a
  AR      drivers/pci/switch/built-in.a
  CC      drivers/mmc/core/regulator.o
  CC      drivers/pci/access.o
  CC      drivers/pci/bus.o
  AR      drivers/platform/built-in.a
  CC      lib/rbtree_test.o
  CC      net/core/flow_offload.o
  CC      lib/sbitmap.o
  CC      fs/proc/devices.o
  CC      fs/proc/interrupts.o
  CC      drivers/mmc/core/pwrseq.o
  CC      lib/argv_split.o
  CC      net/ipv4/tcp_recovery.o
  CC [M]  fs/squashfs/cache.o
  CC      net/ipv6/sysctl_net_ipv6.o
  CC      net/ipv6/proc.o
  CC      lib/bug.o
  CC      kernel/ksysfs.o
  CC      net/ipv6/sit.o
  CC [M]  fs/ext4/xattr_user.o
  CC      kernel/cred.o
  CC      lib/chacha.o
  CC      fs/lockd/xdr4.o
  AR      drivers/net/phy/built-in.a
  AR      drivers/net/built-in.a
  AR      drivers/mtd/parsers/built-in.a
  CC      fs/lockd/svc4proc.o
  CC      drivers/mmc/core/debugfs.o
  AR      drivers/mtd/tests/built-in.a
  CC      fs/nfs/read.o
  LD [M]  drivers/mtd/nand/nandcore.o
  CC      lib/cmdline.o
  CC      net/core/net-sysfs.o
  CC      fs/proc/loadavg.o
  CC      net/ipv6/addrconf_core.o
  CC [M]  drivers/mtd/ubi/vtbl.o
  CC      drivers/pci/probe.o
  AR      drivers/power/built-in.a
  CC      lib/ctype.o
  CC      fs/nfs/symlink.o
  CC      mm/swap_slots.o
  CC      mm/dmapool.o
  CC      lib/dec_and_lock.o
  CC      kernel/reboot.o
  CC [M]  drivers/mtd/nand/raw/nand_macronix.o
  CC      net/core/net-procfs.o
  CC      fs/lockd/procfs.o
  CC      lib/decompress.o
  CC      net/ipv4/tcp_ulp.o
  CC      kernel/async.o
  CC      net/ipv4/tcp_offload.o
  CC [M]  drivers/mtd/nand/raw/nand_micron.o
  CC [M]  drivers/mtd/nand/raw/nand_samsung.o
  CC      lib/decompress_bunzip2.o
  CC [M]  fs/squashfs/dir.o
  CC      fs/nfs/unlink.o
  CC      kernel/range.o
  CC      drivers/pci/host-bridge.o
  CC      drivers/mtd/mtdcore.o
  CC      drivers/pci/remove.o
  CC [M]  drivers/mtd/ubi/vmt.o
  CC      net/ipv4/datagram.o
  CC      mm/slub.o
  CC      net/ipv6/exthdrs_core.o
  CC      fs/proc/meminfo.o
  CC      drivers/mmc/core/pwrseq_simple.o
  CC      drivers/mmc/core/pwrseq_emmc.o
  CC      drivers/mtd/mtdsuper.o
  CC      drivers/mtd/mtdconcat.o
  CC [M]  drivers/mtd/nand/raw/nand_toshiba.o
  CC [M]  fs/squashfs/export.o
  CC      fs/proc/stat.o
  CC      net/core/net-traces.o
  AR      fs/lockd/built-in.a
  CC [M]  drivers/mtd/ubi/upd.o
  CC      kernel/smpboot.o
  CC      drivers/pci/pci.o
  CC [M]  drivers/mtd/ubi/build.o
  CC      fs/proc/uptime.o
  CC      drivers/pci/pci-driver.o
  CC      lib/decompress_inflate.o
  CC      drivers/mtd/mtdpart.o
  CC      drivers/mmc/core/block.o
  CC [M]  drivers/mtd/nand/raw/nand_ecc.o
  CC      drivers/mmc/core/queue.o
  CC      net/ipv4/raw.o
  CC      net/ipv6/ip6_checksum.o
  CC      lib/decompress_unlz4.o
  CC      fs/sysfs/file.o
  CC      fs/proc/util.o
  CC      fs/proc/version.o
  CC [M]  fs/squashfs/file.o
  CC [M]  fs/squashfs/fragment.o
  CC      kernel/ucount.o
  CC [M]  drivers/mtd/ubi/cdev.o
  CC      drivers/mtd/mtdchar.o
  CC      lib/decompress_unlzma.o
  CC      net/ipv4/udp.o
  CC      net/ipv4/udplite.o
  CC      fs/sysfs/dir.o
  CC      fs/sysfs/symlink.o
  CC      fs/sysfs/mount.o
  CC      net/core/dst_cache.o
  CC      net/core/gro_cells.o
  CC      lib/decompress_unlzo.o
  CC      fs/proc/softirqs.o
  CC      fs/nfs/write.o
  CC [M]  drivers/mtd/nand/raw/ndfc.o
  CC      drivers/mtd/ofpart.o
  CC      drivers/mtd/mtd_blkdevs.o
  LD [M]  fs/ext4/ext4.o
  CC      kernel/kmod.o
  CC      net/ipv4/udp_offload.o
  CC      fs/proc/namespaces.o
  CC      fs/sysfs/group.o
  CC      fs/proc/self.o
  CC      drivers/mtd/mtdblock.o
  CC      kernel/groups.o
  CC      lib/decompress_unxz.o
  CC      mm/migrate.o
  CC      mm/balloon_compaction.o
  CC [M]  fs/squashfs/id.o
  CC      fs/proc/thread_self.o
  CC [M]  fs/squashfs/inode.o
  CC [M]  fs/squashfs/namei.o
  CC      net/ipv6/ip6_icmp.o
  CC      drivers/pci/search.o
  CC      drivers/pci/pci-sysfs.o
  CC [M]  fs/squashfs/super.o
  AR      drivers/mtd/nand/raw/built-in.a
  LD [M]  drivers/mtd/nand/raw/nand.o
  AR      drivers/mtd/nand/built-in.a
  AR      fs/sysfs/built-in.a
  CC [M]  drivers/mtd/ubi/kapi.o
  CC [M]  drivers/mtd/ubi/eba.o
  AR      drivers/mmc/core/built-in.a
  CC [M]  drivers/mtd/ubi/io.o
  AR      drivers/mmc/built-in.a
  CC      mm/memfd.o
  CC      fs/tracefs/inode.o
  CC      lib/dump_stack.o
  CC      lib/earlycpio.o
  CC      drivers/pci/rom.o
  CC      fs/proc/proc_sysctl.o
  CC [M]  fs/squashfs/symlink.o
  CC [M]  fs/squashfs/decompressor.o
  CC      kernel/freezer.o
  CC      drivers/pci/setup-res.o
  CC [M]  fs/ubifs/shrinker.o
  CC      drivers/pci/irq.o
  CC [M]  fs/ubifs/journal.o
  CC      fs/nfs/namespace.o
  CC      lib/extable.o
  AR      net/core/built-in.a
  CC      net/ipv6/output_core.o
  CC      lib/fdt.o
  CC [M]  drivers/mtd/ubi/wl.o
  CC      fs/open.o
  CC      fs/nfs/mount_clnt.o
  CC      net/ipv4/arp.o
  CC      kernel/stacktrace.o
  CC      drivers/pci/vpd.o
  CC [M]  fs/squashfs/file_cache.o
  CC      lib/fdt_empty_tree.o
  CC      lib/fdt_ro.o
  CC [M]  fs/squashfs/decompressor_single.o
  CC      fs/read_write.o
  AR      fs/tracefs/built-in.a
  CC [M]  drivers/mtd/ubi/attach.o
  CC      net/ipv6/protocol.o
  CC      net/ipv6/ip6_offload.o
  CC      net/ipv4/icmp.o
  CC      net/ipv6/tcpv6_offload.o
  CC      fs/nfs/nfstrace.o
  CC [M]  drivers/mtd/ubi/misc.o
  CC [M]  drivers/mtd/ubi/debug.o
  CC      fs/nfs/export.o
  AR      mm/built-in.a
  CC      fs/nfs/nfsroot.o
  CC      kernel/futex.o
  CC      lib/fdt_rw.o
  CC      fs/file_table.o
  CC      drivers/pci/setup-bus.o
  CC      lib/fdt_strerror.o
  CC      fs/super.o
  CC [M]  fs/ubifs/file.o
  CC      fs/nfs/sysctl.o
  CC      fs/char_dev.o
  CC      fs/stat.o
  CC      fs/exec.o
  CC      fs/proc/proc_net.o
  CC      net/ipv4/devinet.o
  CC      lib/fdt_sw.o
  CC [M]  fs/squashfs/xattr.o
  CC [M]  fs/squashfs/xattr_id.o
  CC      fs/nfs/nfs2super.o
  CC [M]  drivers/mtd/ubi/gluebi.o
  CC      net/ipv6/exthdrs_offload.o
  CC      lib/fdt_wip.o
  CC [M]  fs/ubifs/dir.o
  CC      fs/pipe.o
  CC [M]  fs/ubifs/super.o
  CC      fs/namei.o
  CC      fs/nfs/proc.o
  CC      net/ipv6/inet6_hashtables.o
  CC      net/ipv6/mcast_snoop.o
  CC      fs/fcntl.o
  CC [M]  fs/squashfs/lzo_wrapper.o
  CC [M]  fs/squashfs/zlib_wrapper.o
  CC      kernel/dma.o
  CC      kernel/up.o
  CC      net/ipv4/af_inet.o
  CC      fs/proc/kcore.o
  CC      fs/ioctl.o
  LD [M]  drivers/mtd/ubi/ubi.o
  CC      lib/flex_proportions.o
  CC      fs/proc/kmsg.o
  CC      net/ipv4/igmp.o
  CC      fs/nfs/nfs2xdr.o
  CC      kernel/module.o
  CC      fs/readdir.o
  CC [M]  fs/ubifs/sb.o
  CC      net/ipv4/fib_frontend.o
  CC      lib/idr.o
  CC      drivers/pci/vc.o
  CC      fs/proc/page.o
  CC      fs/nfs/nfs3super.o
  CC      fs/nfs/nfs3client.o
  CC      drivers/pci/mmap.o
  AR      drivers/mtd/built-in.a
  CC      fs/nfs/nfs3proc.o
  LD [M]  fs/squashfs/squashfs.o
  CC      lib/ioremap.o
  CC      kernel/kallsyms.o
  CC      lib/irq_regs.o
  CC      net/ipv4/fib_semantics.o
  CC      fs/select.o
  CC      lib/is_single_threaded.o
  CC      kernel/crash_core.o
  AR      drivers/ptp/built-in.a
  CC      fs/nfs/nfs3xdr.o
  CC      fs/dcache.o
  CC      fs/inode.o
  CC      fs/attr.o
  CC [M]  fs/ubifs/io.o
  CC [M]  fs/ubifs/tnc.o
  CC      fs/bad_inode.o
  CC      lib/klist.o
  AR      drivers/pwm/built-in.a
  CC      kernel/hung_task.o
  CC      fs/file.o
  CC      drivers/rtc/lib.o
  AR      net/ipv6/built-in.a
  CC      drivers/scsi/megaraid/megaraid_sas_base.o
  CC      drivers/scsi/megaraid/megaraid_sas_fusion.o
  CC      drivers/pci/setup-irq.o
  CC      drivers/scsi/sym53c8xx_2/sym_fw.o
  AR      drivers/soc/amlogic/built-in.a
  AR      fs/proc/built-in.a
  AR      drivers/soc/bcm/built-in.a
  CC      drivers/scsi/megaraid/megaraid_sas_fp.o
  AR      drivers/tty/ipwireless/built-in.a
  CC      lib/kobject.o
  CC      drivers/tty/serial/8250/8250_core.o
  CC      drivers/scsi/sym53c8xx_2/sym_glue.o
  AR      drivers/tty/vt/built-in.a
  CC      drivers/tty/serial/serial_core.o
  CC      drivers/tty/serial/earlycon.o
  CC      kernel/seccomp.o
  CC      net/ipv4/fib_trie.o
  CC      kernel/utsname_sysctl.o
  CC      drivers/scsi/sym53c8xx_2/sym_hipd.o
  CC [M]  fs/ubifs/master.o
  AR      drivers/rtc/built-in.a
  CC      drivers/scsi/sym53c8xx_2/sym_malloc.o
  CC      drivers/scsi/scsi.o
  CC      net/ipv4/fib_notifier.o
  CC      drivers/usb/common/common.o
  CC      drivers/pci/proc.o
  CC      net/ipv4/inet_fragment.o
  CC      kernel/tracepoint.o
  CC      drivers/usb/core/usb.o
  CC      drivers/usb/core/hub.o
  CC      net/ipv4/ping.o
  AR      drivers/soc/fsl/built-in.a
  CC      drivers/tty/serial/8250/8250_port.o
  CC      net/ipv4/ip_tunnel_core.o
  AR      drivers/soc/mediatek/built-in.a
/home/nathan/cbl/linux-next/fs/select.c:619:5: warning: stack frame size of 1040 bytes in function 'core_sys_select' [-Wframe-larger-than=]
int core_sys_select(int n, fd_set __user *inp, fd_set __user *outp,
    ^
1 warning generated.
  AR      drivers/soc/qcom/built-in.a
  CC      kernel/elfcore.o
  AR      drivers/soc/sunxi/built-in.a
  AR      drivers/soc/renesas/built-in.a
  AR      drivers/soc/xilinx/built-in.a
  CC      drivers/tty/serial/uartlite.o
  AR      drivers/soc/built-in.a
  CC      lib/kobject_uevent.o
  CC      net/ipv4/gre_offload.o
  CC      kernel/irq_work.o
  CC      drivers/tty/serial/8250/8250_early.o
  CC      drivers/scsi/sym53c8xx_2/sym_nvram.o
  CC      net/ipv4/metrics.o
  CC      drivers/tty/serial/8250/8250_fsl.o
  CC [M]  fs/ubifs/scan.o
  AR      fs/nfs/built-in.a
  AR      drivers/usb/common/built-in.a
  CC      drivers/tty/serial/8250/8250_of.o
  CC      kernel/iomem.o
  CC      kernel/rseq.o
  CC      drivers/pci/slot.o
  CC      drivers/pci/of.o
  CC [M]  fs/ubifs/replay.o
  AR      drivers/video/backlight/built-in.a
  CC      drivers/virtio/virtio.o
  CC [M]  drivers/video/backlight/lcd.o
  CC      drivers/video/fbdev/core/fb_cmdline.o
  CC [M]  drivers/video/backlight/backlight.o
  CC      drivers/scsi/hosts.o
  CC      drivers/virtio/virtio_ring.o
  CC      drivers/scsi/scsi_ioctl.o
  CC      drivers/scsi/scsicam.o
  CC      drivers/tty/tty_io.o
  CC      fs/filesystems.o
  CC      lib/memcat_p.o
  CC      drivers/usb/core/hcd.o
  CC [M]  fs/ubifs/log.o
  CC [M]  fs/ubifs/commit.o
  CC      drivers/usb/core/urb.o
  CC      net/ipv4/netlink.o
  CC      fs/namespace.o
  AR      drivers/tty/serial/8250/built-in.a
  AR      drivers/tty/serial/built-in.a
  CC      drivers/video/fbdev/core/fb_notify.o
  CC [M]  drivers/video/backlight/generic_bl.o
  AR      kernel/built-in.a
  CC      drivers/scsi/scsi_error.o
  CC      drivers/pci/quirks.o
  CC      drivers/pci/msi.o
  CC      drivers/pci/syscall.o
  CC      drivers/scsi/scsi_lib.o
  CC [M]  fs/ubifs/gc.o
  CC      drivers/scsi/scsi_lib_dma.o
  CC      drivers/scsi/scsi_scan.o
  CC      lib/nmi_backtrace.o
  CC      lib/nodemask.o
  CC      net/ipv4/ip_tunnel.o
  GEN     drivers/scsi/scsi_devinfo_tbl.c
  CC      fs/seq_file.o
  CC      drivers/scsi/scsi_devinfo.o
  CC      fs/xattr.o
  CC [M]  drivers/video/fbdev/core/fbmem.o
  CC [M]  drivers/video/fbdev/core/fbmon.o
  AR      drivers/scsi/sym53c8xx_2/built-in.a
  AR      drivers/scsi/megaraid/built-in.a
  CC      fs/libfs.o
  CC      fs/fs-writeback.o
  CC      drivers/tty/n_tty.o
  CC      fs/pnode.o
  CC [M]  fs/ubifs/orphan.o
  CC [M]  fs/ubifs/budget.o
  CC      drivers/usb/core/message.o
  CC      net/ipv4/sysctl_net_ipv4.o
  CC      fs/splice.o
  CC      drivers/usb/core/driver.o
  CC      lib/plist.o
  CC      drivers/usb/core/config.o
  CC      drivers/tty/tty_ioctl.o
  CC      lib/radix-tree.o
  CC      drivers/tty/tty_ldisc.o
  CC [M]  fs/ubifs/find.o
  CC [M]  fs/ubifs/tnc_commit.o
  CC      net/ipv4/proc.o
  CC      lib/ratelimit.o
  CC      drivers/virtio/virtio_mmio.o
  CC      drivers/virtio/virtio_pci_modern.o
  CC      drivers/virtio/virtio_pci_common.o
  CC      drivers/virtio/virtio_pci_legacy.o
  AR      drivers/pci/built-in.a
  CC      net/ipv4/tunnel4.o
  CC [M]  drivers/video/fbdev/core/fbcmap.o
  CC      fs/sync.o
  CC      fs/utimes.o
  CC      lib/rbtree.o
  CC      drivers/scsi/scsi_sysctl.o
  CC      drivers/usb/core/file.o
  CC      drivers/usb/core/buffer.o
  CC [M]  drivers/video/fbdev/core/fbsysfs.o
  CC      fs/d_path.o
  CC      drivers/tty/tty_buffer.o
  CC      drivers/virtio/virtio_balloon.o
  CC      fs/stack.o
  CC      lib/seq_buf.o
  CC [M]  fs/ubifs/compress.o
  CC [M]  fs/ubifs/lpt.o
  CC      drivers/tty/tty_port.o
  CC      drivers/tty/tty_mutex.o
  CC      drivers/tty/tty_ldsem.o
  CC      drivers/tty/tty_baudrate.o
  CC      net/ipv4/inet_diag.o
  CC      net/ipv4/ipconfig.o
  CC      lib/sha1.o
  CC      lib/show_mem.o
  CC      drivers/scsi/scsi_proc.o
  CC      drivers/scsi/scsi_debugfs.o
  CC      lib/siphash.o
  CC      lib/string.o
  CC [M]  drivers/video/fbdev/core/modedb.o
  CC      drivers/scsi/scsi_trace.o
  AR      drivers/video/fbdev/omap2/omapfb/displays/built-in.a
  CC      drivers/usb/core/sysfs.o
  CC      drivers/usb/core/endpoint.o
  AR      drivers/video/fbdev/omap2/omapfb/dss/built-in.a
  AR      drivers/video/fbdev/omap2/omapfb/built-in.a
  CC [M]  fs/ubifs/lprops.o
  CC      drivers/tty/tty_jobctrl.o
  CC      drivers/usb/core/devio.o
  AR      drivers/video/fbdev/omap2/built-in.a
  CC      fs/fs_struct.o
  CC      fs/statfs.o
  CC      net/ipv4/tcp_diag.o
  CC      fs/fs_pin.o
  CC      lib/timerqueue.o
  CC      lib/vsprintf.o
  CC      net/ipv4/tcp_cubic.o
  CC [M]  drivers/video/fbdev/core/fbcvt.o
  CC      drivers/usb/host/pci-quirks.o
  CC      drivers/tty/n_null.o
  CC      fs/nsfs.o
  CC      fs/fs_types.o
  CC      drivers/usb/core/notify.o
  CC      drivers/usb/misc/usbtest.o
  CC      drivers/usb/misc/ehset.o
  CC      lib/win_minmax.o
  CC      drivers/scsi/scsi_logging.o
  CC      lib/xarray.o
  CC      drivers/usb/core/generic.o
  CC [M]  lib/crc16.o
  AR      drivers/virtio/built-in.a
  CC [M]  lib/crc-t10dif.o
  CC      drivers/scsi/scsi_pm.o
  CC      drivers/scsi/scsi_common.o
  CC [M]  drivers/video/fbdev/core/cfbfillrect.o
  CC      drivers/usb/phy/of.o
  CC      drivers/usb/storage/uas.o
  CC      drivers/usb/misc/lvstest.o
  CC [M]  fs/ubifs/recovery.o
  CC [M]  drivers/video/fbdev/core/cfbcopyarea.o
  CC      drivers/tty/pty.o
  CC      drivers/usb/storage/scsiglue.o
  CC      drivers/tty/sysrq.o
  CC      drivers/scsi/scsi_transport_spi.o
  CC [M]  drivers/video/fbdev/core/cfbimgblt.o
  CC      drivers/scsi/scsi_transport_sas.o
  GEN     lib/crc32table.h
  AR      drivers/video/fbdev/core/built-in.a
  CC      drivers/scsi/dc395x.o
  LD [M]  drivers/video/fbdev/core/fb.o
  CC [M]  drivers/video/fbdev/xilinxfb.o
  CC      drivers/usb/core/quirks.o
  CC      lib/crc32.o
  CC      fs/fs_context.o
  CC      drivers/usb/core/devices.o
  CC      drivers/usb/host/ehci-hcd.o
  CC      drivers/usb/core/phy.o
  CC      drivers/usb/core/port.o
  CC      drivers/usb/host/ehci-pci.o
  CC [M]  fs/ubifs/ioctl.o
  CC      drivers/scsi/esp_scsi.o
  CC      drivers/usb/storage/protocol.o
  CC      drivers/scsi/am53c974.o
  CC      drivers/scsi/virtio_scsi.o
  AR      drivers/usb/phy/built-in.a
  CC      drivers/scsi/sd.o
  CC [M]  fs/ubifs/lpt_commit.o
  CC      drivers/scsi/scsi_sysfs.o
  CC      drivers/usb/storage/transport.o
  CC      drivers/usb/core/of.o
  AR      net/ipv4/built-in.a
  AR      net/built-in.a
  CC      drivers/usb/core/hcd-pci.o
  CC      drivers/usb/storage/usb.o
  CC      drivers/usb/host/ohci-hcd.o
  CC      drivers/usb/host/xhci.o
  CC [M]  fs/ubifs/tnc_misc.o
  AR      drivers/video/fbdev/built-in.a
  AR      drivers/tty/built-in.a
  AR      drivers/usb/misc/built-in.a
  AR      drivers/video/built-in.a
  CC      drivers/usb/storage/initializers.o
  CC      drivers/usb/storage/sierra_ms.o
  CC      drivers/usb/host/xhci-mem.o
  CC      fs/fs_parser.o
  CC      drivers/usb/storage/option_ms.o
  CC      fs/fsopen.o
  CC [M]  fs/ubifs/debug.o
  CC      fs/buffer.o
  CC      drivers/usb/storage/usual-tables.o
  CC [M]  fs/ubifs/misc.o
  CC [M]  fs/ubifs/xattr.o
  CC      drivers/usb/host/xhci-ext-caps.o
  CC      fs/block_dev.o
  CC      drivers/usb/host/xhci-ring.o
  CC      drivers/usb/host/xhci-hub.o
  CC      drivers/usb/host/xhci-dbg.o
  CC      fs/direct-io.o
  CC      fs/mpage.o
  CC      fs/proc_namespace.o
  AR      drivers/usb/core/built-in.a
  CC      fs/eventpoll.o
  CC      drivers/usb/host/xhci-trace.o
  CC      fs/anon_inodes.o
  CC      drivers/usb/host/xhci-debugfs.o
  CC      fs/signalfd.o
  AR      lib/lib.a
  EXPORTS lib/lib-ksyms.o
  CC      fs/timerfd.o
  CC      fs/eventfd.o
  AR      lib/built-in.a
  CC      fs/aio.o
  AR      drivers/usb/storage/built-in.a
  CC      drivers/usb/host/xhci-pci.o
  CC      fs/io_uring.o
  CC      fs/locks.o
  CC      fs/binfmt_script.o
  CC      fs/binfmt_elf.o
  CC      fs/coredump.o
  CC      fs/drop_caches.o
  CC      fs/fhandle.o
  CC      fs/iomap.o
  CC [M]  fs/mbcache.o
  AR      drivers/scsi/built-in.a
  LD [M]  fs/ubifs/ubifs.o
  AR      drivers/usb/host/built-in.a
  AR      drivers/usb/built-in.a
  AR      drivers/built-in.a
  AR      fs/built-in.a
  GEN     .version
  CHK     include/generated/compile.h
  LD      vmlinux.o
  MODPOST vmlinux.o
  MODINFO modules.builtin.modinfo
  KSYM    .tmp_kallsyms1.o
  KSYM    .tmp_kallsyms2.o
  LD      vmlinux
  SORTEX  vmlinux
  SYSMAP  System.map
  Building modules, stage 2.
  BOOTCC  arch/powerpc/boot/4xx.o
  BOOTAS  arch/powerpc/boot/crtsavres.o
  COPY    arch/powerpc/boot/zlib.h
  BOOTCC  arch/powerpc/boot/bamboo.o
  BOOTAS  arch/powerpc/boot/crt0.o
  BOOTCC  arch/powerpc/boot/cuboot.o
  COPY    arch/powerpc/boot/zconf.h
  COPY    arch/powerpc/boot/zutil.h
  COPY    arch/powerpc/boot/inflate.h
  COPY    arch/powerpc/boot/inffixed.h
  COPY    arch/powerpc/boot/inftrees.h
  COPY    arch/powerpc/boot/inffast.h
  BOOTCC  arch/powerpc/boot/ebony.o
  BOOTCC  arch/powerpc/boot/devtree.o
  COPY    arch/powerpc/boot/infutil.h
  BOOTAS  arch/powerpc/boot/div64.o
  COPY    arch/powerpc/boot/libfdt_internal.h
  COPY    arch/powerpc/boot/fdt.h
  BOOTCC  arch/powerpc/boot/elf_util.o
  COPY    arch/powerpc/boot/libfdt.h
  BOOTCC  arch/powerpc/boot/main.o
  BOOTCC  arch/powerpc/boot/ofconsole.o
  BOOTCC  arch/powerpc/boot/oflib.o
  BOOTCC  arch/powerpc/boot/ns16550.o
  MODPOST 52 modules
  BOOTCC  arch/powerpc/boot/simple_alloc.o
  BOOTCC  arch/powerpc/boot/stdlib.o
  BOOTCC  arch/powerpc/boot/stdio.o
  BOOTAS  arch/powerpc/boot/string.o
  BOOTAS  arch/powerpc/boot/util.o
  BOOTCC  arch/powerpc/boot/uartlite.o
  BOOTCC  arch/powerpc/boot/cuboot-bamboo.o
  BOOTCC  arch/powerpc/boot/cuboot-ebony.o
  BOOTCC  arch/powerpc/boot/cuboot-katmai.o
  BOOTCC  arch/powerpc/boot/cuboot-rainier.o
  BOOTCC  arch/powerpc/boot/cuboot-sam440ep.o
  BOOTCC  arch/powerpc/boot/cuboot-sequoia.o
  BOOTCC  arch/powerpc/boot/cuboot-taishan.o
  BOOTCC  arch/powerpc/boot/cuboot-warp.o
  BOOTCC  arch/powerpc/boot/cuboot-yosemite.o
  BOOTCC  arch/powerpc/boot/epapr.o
  BOOTAS  arch/powerpc/boot/fixed-head.o
  BOOTCC  arch/powerpc/boot/of.o
  BOOTCC  arch/powerpc/boot/simpleboot.o
  BOOTCC  arch/powerpc/boot/treeboot-akebono.o
  BOOTCC  arch/powerpc/boot/treeboot-bamboo.o
  BOOTCC  arch/powerpc/boot/treeboot-ebony.o
  BOOTCC  arch/powerpc/boot/treeboot-currituck.o
  BOOTCC  arch/powerpc/boot/treeboot-iss4xx.o
  BOOTCC  arch/powerpc/boot/virtex.o
  LDS     arch/powerpc/boot/zImage.lds
  HOSTCC  arch/powerpc/boot/addnote
  HOSTCC  arch/powerpc/boot/hack-coff
  HOSTCC  arch/powerpc/boot/mktree
  DTC     arch/powerpc/boot/dts/ebony.dtb
  COPY    arch/powerpc/boot/inflate.c
  COPY    arch/powerpc/boot/inffast.c
  COPY    arch/powerpc/boot/inftrees.c
  COPY    arch/powerpc/boot/fdt.c
  COPY    arch/powerpc/boot/fdt_ro.c
  COPY    arch/powerpc/boot/fdt_strerror.c
  COPY    arch/powerpc/boot/fdt_rw.c
  COPY    arch/powerpc/boot/fdt_sw.c
  COPY    arch/powerpc/boot/fdt_wip.c
/home/nathan/cbl/linux-next/arch/powerpc/boot/main.c:111:18: warning: array comparison always evaluates to a constant [-Wtautological-compare]
        if (_initrd_end > _initrd_start) {
                        ^
1 warning generated.
  BOOTCC  arch/powerpc/boot/inflate.o
  BOOTCC  arch/powerpc/boot/inffast.o
  COPY    arch/powerpc/boot/decompress_inflate.c
  BOOTCC  arch/powerpc/boot/empty.o
  BOOTCC  arch/powerpc/boot/libfdt-wrapper.o
  BOOTCC  arch/powerpc/boot/inftrees.o
  BOOTCC  arch/powerpc/boot/fdt.o
  BOOTCC  arch/powerpc/boot/fdt_rw.o
  CC      crypto/crc32c_generic.mod.o
  BOOTCC  arch/powerpc/boot/fdt_ro.o
  CC      crypto/crct10dif_common.mod.o
  BOOTCC  arch/powerpc/boot/fdt_strerror.o
  CC      crypto/crct10dif_generic.mod.o
  CC      crypto/deflate.mod.o
  BOOTCC  arch/powerpc/boot/fdt_wip.o
  CC      crypto/drbg.mod.o
  BOOTCC  arch/powerpc/boot/fdt_sw.o
  CC      crypto/echainiv.mod.o
  CC      crypto/hmac.mod.o
  BOOTCC  arch/powerpc/boot/serial.o
  CC      crypto/jitterentropy_rng.mod.o
  DTC     arch/powerpc/boot/dts/bamboo.dtb
  CC      crypto/lzo-rle.mod.o
  CC      crypto/lzo.mod.o
  CC      crypto/sha256_generic.mod.o
  CC      drivers/char/xilinx_hwicap/xilinx_hwicap_m.mod.o
  BOOTCC  arch/powerpc/boot/decompress.o
  CC      drivers/block/xsysace.mod.o
  CC      drivers/i2c/algos/i2c-algo-bit.mod.o
  DTC     arch/powerpc/boot/dts/sam440ep.dtb
  DTC     arch/powerpc/boot/dts/sequoia.dtb
  DTC     arch/powerpc/boot/dts/taishan.dtb
  DTC     arch/powerpc/boot/dts/rainier.dtb
  DTC     arch/powerpc/boot/dts/katmai.dtb
  CC      drivers/i2c/busses/i2c-ibm_iic.mod.o
  DTC     arch/powerpc/boot/dts/warp.dtb
  DTC     arch/powerpc/boot/dts/yosemite.dtb
  CC      drivers/i2c/i2c-core.mod.o
  CC      drivers/i2c/busses/i2c-gpio.mod.o
  CC      drivers/i2c/i2c-dev.mod.o
  CC      drivers/input/serio/xilinx_ps2.mod.o
  CC      drivers/mtd/nand/nandcore.mod.o
  CC      drivers/input/serio/serio.mod.o
  CC      drivers/mtd/nand/raw/nand.mod.o
  CC      drivers/mtd/nand/raw/nand_ecc.mod.o
  CC      drivers/mtd/nand/raw/ndfc.mod.o
  CC      drivers/mtd/ubi/gluebi.mod.o
  CC      drivers/mtd/ubi/ubi.mod.o
  CC      drivers/net/tun.mod.o
  CC      drivers/video/backlight/backlight.mod.o
/home/nathan/cbl/linux-next/arch/powerpc/boot/dts/katmai.dts:322.26-361.5: Warning (pci_bridge): /plb/pciex@d00000000: node name is not "pci" or "pcie"
/home/nathan/cbl/linux-next/arch/powerpc/boot/dts/katmai.dts:363.26-402.5: Warning (pci_bridge): /plb/pciex@d20000000: node name is not "pci" or "pcie"
/home/nathan/cbl/linux-next/arch/powerpc/boot/dts/katmai.dts:404.26-443.5: Warning (pci_bridge): /plb/pciex@d40000000: node name is not "pci" or "pcie"
arch/powerpc/boot/dts/katmai.dtb: Warning (pci_device_bus_num): Failed prerequisite 'pci_bridge'
  CC      drivers/video/backlight/generic_bl.mod.o
  CC      drivers/video/backlight/lcd.mod.o
  CC      drivers/video/fbdev/core/cfbcopyarea.mod.o
  CC      drivers/video/fbdev/core/cfbfillrect.mod.o
  CC      drivers/video/fbdev/core/cfbimgblt.mod.o
  CC      drivers/video/fbdev/xilinxfb.mod.o
  CC      drivers/video/fbdev/core/fb.mod.o
  CC      fs/fat/fat.mod.o
  CC      fs/ext4/ext4.mod.o
  CC      fs/fat/vfat.mod.o
  CC      fs/jbd2/jbd2.mod.o
  CC      fs/mbcache.mod.o
  CC      fs/nls/nls_cp437.mod.o
  CC      fs/nls/nls_iso8859-1.mod.o
  CC      fs/squashfs/squashfs.mod.o
  CC      fs/ubifs/ubifs.mod.o
  CC      lib/crc-t10dif.mod.o
  CC      lib/crc16.mod.o
  CC      lib/lzo/lzo_compress.mod.o
  CC      net/802/p8022.mod.o
  CC      net/802/psnap.mod.o
  CC      net/802/stp.mod.o
  CC      net/llc/llc.mod.o
  CC      net/bridge/bridge.mod.o
  LD [M]  crypto/crc32c_generic.ko
  LD [M]  crypto/crct10dif_common.ko
  LD [M]  crypto/crct10dif_generic.ko
  LD [M]  crypto/deflate.ko
  LD [M]  crypto/drbg.ko
  LD [M]  crypto/echainiv.ko
  LD [M]  crypto/hmac.ko
  LD [M]  crypto/jitterentropy_rng.ko
  LD [M]  crypto/lzo-rle.ko
  LD [M]  crypto/sha256_generic.ko
  LD [M]  drivers/block/xsysace.ko
  LD [M]  crypto/lzo.ko
  LD [M]  drivers/i2c/algos/i2c-algo-bit.ko
  LD [M]  drivers/char/xilinx_hwicap/xilinx_hwicap_m.ko
  LD [M]  drivers/i2c/busses/i2c-gpio.ko
  LD [M]  drivers/i2c/busses/i2c-ibm_iic.ko
  LD [M]  drivers/i2c/i2c-dev.ko
  LD [M]  drivers/i2c/i2c-core.ko
  LD [M]  drivers/input/serio/serio.ko
  LD [M]  drivers/input/serio/xilinx_ps2.ko
  LD [M]  drivers/mtd/nand/nandcore.ko
  LD [M]  drivers/mtd/nand/raw/nand.ko
  LD [M]  drivers/mtd/nand/raw/nand_ecc.ko
  LD [M]  drivers/mtd/nand/raw/ndfc.ko
  LD [M]  drivers/net/tun.ko
  LD [M]  drivers/mtd/ubi/ubi.ko
  LD [M]  drivers/mtd/ubi/gluebi.ko
  LD [M]  drivers/video/backlight/backlight.ko
  LD [M]  drivers/video/backlight/lcd.ko
  LD [M]  drivers/video/backlight/generic_bl.ko
  LD [M]  drivers/video/fbdev/core/cfbfillrect.ko
  LD [M]  drivers/video/fbdev/core/cfbcopyarea.ko
  LD [M]  drivers/video/fbdev/core/cfbimgblt.ko
  LD [M]  drivers/video/fbdev/core/fb.ko
  LD [M]  fs/ext4/ext4.ko
  LD [M]  fs/fat/vfat.ko
  LD [M]  fs/fat/fat.ko
  LD [M]  fs/mbcache.ko
  LD [M]  drivers/video/fbdev/xilinxfb.ko
  LD [M]  fs/jbd2/jbd2.ko
  LD [M]  fs/nls/nls_cp437.ko
  LD [M]  fs/squashfs/squashfs.ko
  BOOTAR  arch/powerpc/boot/wrapper.a
  LD [M]  fs/nls/nls_iso8859-1.ko
  WRAP    arch/powerpc/boot/uImage
  WRAP    arch/powerpc/boot/cuImage.ebony
  WRAP    arch/powerpc/boot/treeImage.ebony
  WRAP    arch/powerpc/boot/cuImage.bamboo
  WRAP    arch/powerpc/boot/treeImage.bamboo
  WRAP    arch/powerpc/boot/cuImage.sequoia
  WRAP    arch/powerpc/boot/cuImage.sam440ep
  WRAP    arch/powerpc/boot/cuImage.rainier
  WRAP    arch/powerpc/boot/cuImage.katmai
  WRAP    arch/powerpc/boot/cuImage.warp
  WRAP    arch/powerpc/boot/cuImage.yosemite
  WRAP    arch/powerpc/boot/cuImage.taishan
INFO: Uncompressed kernel (size 0x91062c) overlaps the address of the wrapper(0x400000)
INFO: Fixing the link_address of wrapper to (0xa00000)
INFO: Uncompressed kernel (size 0x91062c) overlaps the address of the wrapper(0x400000)
INFO: Fixing the link_address of wrapper to (0xa00000)
INFO: Uncompressed kernel (size 0x91062c) overlaps the address of the wrapper(0x400000)
INFO: Fixing the link_address of wrapper to (0xa00000)
INFO: Uncompressed kernel (size 0x91062c) overlaps the address of the wrapper(0x400000)
INFO: Fixing the link_address of wrapper to (0xa00000)
INFO: Uncompressed kernel (size 0x91062c) overlaps the address of the wrapper(0x400000)
INFO: Fixing the link_address of wrapper to (0xa00000)
INFO: Uncompressed kernel (size 0x91062c) overlaps the address of the wrapper(0x400000)
INFO: Fixing the link_address of wrapper to (0xa00000)
INFO: Uncompressed kernel (size 0x91062c) overlaps the address of the wrapper(0x400000)
INFO: Fixing the link_address of wrapper to (0xa00000)
INFO: Uncompressed kernel (size 0x91062c) overlaps the address of the wrapper(0x400000)
INFO: Fixing the link_address of wrapper to (0xa00000)
INFO: Uncompressed kernel (size 0x91062c) overlaps the address of the wrapper(0x400000)
INFO: Fixing the link_address of wrapper to (0xa00000)
  LD [M]  net/802/psnap.ko
  LD [M]  lib/crc16.ko
  LD [M]  net/802/stp.ko
  LD [M]  lib/lzo/lzo_compress.ko
  LD [M]  lib/crc-t10dif.ko
  LD [M]  net/802/p8022.ko
  LD [M]  net/bridge/bridge.ko
  LD [M]  fs/ubifs/ubifs.ko
  LD [M]  net/llc/llc.ko
INFO: Uncompressed kernel (size 0x8ffec8) overlaps the address of the wrapper(0x400000)
INFO: Fixing the link_address of wrapper to (0x900000)
INFO: Uncompressed kernel (size 0x91062c) overlaps the address of the wrapper(0x400000)
INFO: Fixing the link_address of wrapper to (0xa00000)
INFO: Uncompressed kernel (size 0x91062c) overlaps the address of the wrapper(0x400000)
INFO: Fixing the link_address of wrapper to (0xa00000)
Image Name:   Linux-5.2.0-rc2-00154-g6c5875843
Created:      Mon Jul  8 11:46:56 2019
Image Type:   PowerPC Linux Kernel Image (gzip compressed)
Data Size:    4113049 Bytes = 4016.65 KiB = 3.92 MiB
Load Address: 00000000
Entry Point:  00000000
Image Name:   Linux-5.2.0-rc2-00154-g6c5875843
Created:      Mon Jul  8 11:46:56 2019
Image Type:   PowerPC Linux Kernel Image (gzip compressed)
Data Size:    4146457 Bytes = 4049.27 KiB = 3.95 MiB
Load Address: 00a00000
Entry Point:  00a017b8
Image Name:   Linux-5.2.0-rc2-00154-g6c5875843
Created:      Mon Jul  8 11:46:56 2019
Image Type:   PowerPC Linux Kernel Image (gzip compressed)
Data Size:    4146866 Bytes = 4049.67 KiB = 3.95 MiB
Load Address: 00a00000
Entry Point:  00a017ac
Image Name:   Linux-5.2.0-rc2-00154-g6c5875843
Created:      Mon Jul  8 11:46:56 2019
Image Type:   PowerPC Linux Kernel Image (gzip compressed)
Data Size:    4145900 Bytes = 4048.73 KiB = 3.95 MiB
Load Address: 00a00000
Entry Point:  00a001bc
Image Name:   Linux-5.2.0-rc2-00154-g6c5875843
Created:      Mon Jul  8 11:46:56 2019
Image Type:   PowerPC Linux Kernel Image (gzip compressed)
Data Size:    4147203 Bytes = 4050.00 KiB = 3.96 MiB
Load Address: 00a00000
Entry Point:  00a017a0
Image Name:   Linux-5.2.0-rc2-00154-g6c5875843
Created:      Mon Jul  8 11:46:56 2019
Image Type:   PowerPC Linux Kernel Image (gzip compressed)
Data Size:    4147289 Bytes = 4050.09 KiB = 3.96 MiB
Load Address: 00a00000
Entry Point:  00a000c8
Image Name:   Linux-5.2.0-rc2-00154-g6c5875843
Created:      Mon Jul  8 11:46:56 2019
Image Type:   PowerPC Linux Kernel Image (gzip compressed)
Data Size:    4146011 Bytes = 4048.84 KiB = 3.95 MiB
Load Address: 00a00000
Entry Point:  00a017c4
Image Name:   Linux-5.2.0-rc2-00154-g6c5875843
Created:      Mon Jul  8 11:46:56 2019
Image Type:   PowerPC Linux Kernel Image (gzip compressed)
Data Size:    4147165 Bytes = 4049.97 KiB = 3.96 MiB
Load Address: 00a00000
Entry Point:  00a017c0
Image Name:   Linux-5.2.0-rc2-00154-g6c5875843
Created:      Mon Jul  8 11:46:56 2019
Image Type:   PowerPC Linux Kernel Image (gzip compressed)
Data Size:    4145956 Bytes = 4048.79 KiB = 3.95 MiB
Load Address: 00a00000
Entry Point:  00a017c0
Image Name:   Linux-5.2.0-rc2-00154-g6c5875843
Created:      Mon Jul  8 11:46:56 2019
Image Type:   PowerPC Linux Kernel Image (gzip compressed)
Data Size:    4146974 Bytes = 4049.78 KiB = 3.95 MiB
Load Address: 00a00000
Entry Point:  00a017cc
make[1]: Leaving directory '/mnt/build/kernel'

real	44.888
user	15:49.83
sys	1:57.98
Linux version 5.2.0-rc2-00154-g6c5875843b87 (nathan@archlinux-threadripper) (ClangBuiltLinux clang version 9.0.0 (git://github.com/llvm/llvm-project b736969eddce563a7fd3fe10b8fe7adfd85c8692) (based on LLVM 9.0.0svn)) #1 Mon Jul 8 11:46:16 MST 2019
Found initrd at 0xc1900000:0xc1dff400
Using PowerPC 44x Platform machine description
printk: bootconsole [udbg0] enabled
-----------------------------------------------------
phys_mem_size     = 0x8000000
dcache_bsize      = 0x20
icache_bsize      = 0x20
cpu_features      = 0x0000000000000120
  possible        = 0x0000000040000120
  always          = 0x0000000000000020
cpu_user_features = 0x8c008000 0x00000000
mmu_features      = 0x00000008
-----------------------------------------------------
Zone ranges:
  Normal   [mem 0x0000000000000000-0x0000000007ffffff]
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000000000000-0x0000000007ffffff]
Initmem setup node 0 [mem 0x0000000000000000-0x0000000007ffffff]
MMU: Allocated 1088 bytes of context maps for 255 contexts
Built 1 zonelists, mobility grouping on.  Total pages: 32448
Kernel command line: console=ttyS0 
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Memory: 108588K/131072K available (6648K kernel code, 604K rwdata, 1576K rodata, 376K init, 6647K bss, 22484K reserved, 0K cma-reserved)
Kernel virtual memory layout:
  * 0xfffdf000..0xfffff000  : fixmap
  * 0xffddf000..0xfffdf000  : consistent mem
  * 0xffddd000..0xffddf000  : early ioremap
  * 0xd1000000..0xffddd000  : vmalloc & ioremap
SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
Running RCU self tests
NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
UIC0 (32 IRQ sources) at DCR 0xc0
clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x5c4093a7d1, max_idle_ns: 440795210635 ns
clocksource: timebase mult[2800000] shift[24] registered
Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar
... MAX_LOCKDEP_SUBCLASSES:  8
... MAX_LOCK_DEPTH:          48
... MAX_LOCKDEP_KEYS:        8191
... CLASSHASH_SIZE:          4096
... MAX_LOCKDEP_ENTRIES:     32768
... MAX_LOCKDEP_CHAINS:      65536
... CHAINHASH_SIZE:          32768
 memory used by lock dependency info: 4411 kB
 per task-struct memory footprint: 1536 bytes
------------------------
| Locking API testsuite:
----------------------------------------------------------------------------
                                 | spin |wlock |rlock |mutex | wsem | rsem |
  --------------------------------------------------------------------------
                     A-A deadlock:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
                 A-B-B-A deadlock:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
             A-B-B-C-C-A deadlock:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
             A-B-C-A-B-C deadlock:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
         A-B-B-C-C-D-D-A deadlock:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
         A-B-C-D-B-D-D-A deadlock:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
         A-B-C-D-B-C-D-A deadlock:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
                    double unlock:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
                  initialize held:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
  --------------------------------------------------------------------------
              recursive read-lock:             |  ok  |             |  ok  |
           recursive read-lock #2:             |  ok  |             |  ok  |
            mixed read-write-lock:             |  ok  |             |  ok  |
            mixed write-read-lock:             |  ok  |             |  ok  |
  mixed read-lock/lock-write ABBA:             |FAILED|             |  ok  |
   mixed read-lock/lock-read ABBA:             |  ok  |             |  ok  |
 mixed write-lock/lock-write ABBA:             |  ok  |             |  ok  |
  --------------------------------------------------------------------------
     hard-irqs-on + irq-safe-A/12:  ok  |  ok  |  ok  |
     soft-irqs-on + irq-safe-A/12:  ok  |  ok  |  ok  |
     hard-irqs-on + irq-safe-A/21:  ok  |  ok  |  ok  |
     soft-irqs-on + irq-safe-A/21:  ok  |  ok  |  ok  |
       sirq-safe-A => hirqs-on/12:  ok  |  ok  |  ok  |
       sirq-safe-A => hirqs-on/21:  ok  |  ok  |  ok  |
         hard-safe-A + irqs-on/12:  ok  |  ok  |  ok  |
         soft-safe-A + irqs-on/12:  ok  |  ok  |  ok  |
         hard-safe-A + irqs-on/21:  ok  |  ok  |  ok  |
         soft-safe-A + irqs-on/21:  ok  |  ok  |  ok  |
    hard-safe-A + unsafe-B #1/123:  ok  |  ok  |  ok  |
    soft-safe-A + unsafe-B #1/123:  ok  |  ok  |  ok  |
    hard-safe-A + unsafe-B #1/132:  ok  |  ok  |  ok  |
    soft-safe-A + unsafe-B #1/132:  ok  |  ok  |  ok  |
    hard-safe-A + unsafe-B #1/213:  ok  |  ok  |  ok  |
    soft-safe-A + unsafe-B #1/213:  ok  |  ok  |  ok  |
    hard-safe-A + unsafe-B #1/231:  ok  |  ok  |  ok  |
    soft-safe-A + unsafe-B #1/231:  ok  |  ok  |  ok  |
    hard-safe-A + unsafe-B #1/312:  ok  |  ok  |  ok  |
    soft-safe-A + unsafe-B #1/312:  ok  |  ok  |  ok  |
    hard-safe-A + unsafe-B #1/321:  ok  |  ok  |  ok  |
    soft-safe-A + unsafe-B #1/321:  ok  |  ok  |  ok  |
    hard-safe-A + unsafe-B #2/123:  ok  |  ok  |  ok  |
    soft-safe-A + unsafe-B #2/123:  ok  |  ok  |  ok  |
    hard-safe-A + unsafe-B #2/132:  ok  |  ok  |  ok  |
    soft-safe-A + unsafe-B #2/132:  ok  |  ok  |  ok  |
    hard-safe-A + unsafe-B #2/213:  ok  |  ok  |  ok  |
    soft-safe-A + unsafe-B #2/213:  ok  |  ok  |  ok  |
    hard-safe-A + unsafe-B #2/231:  ok  |  ok  |  ok  |
    soft-safe-A + unsafe-B #2/231:  ok  |  ok  |  ok  |
    hard-safe-A + unsafe-B #2/312:  ok  |  ok  |  ok  |
    soft-safe-A + unsafe-B #2/312:  ok  |  ok  |  ok  |
    hard-safe-A + unsafe-B #2/321:  ok  |  ok  |  ok  |
    soft-safe-A + unsafe-B #2/321:  ok  |  ok  |  ok  |
      hard-irq lock-inversion/123:  ok  |  ok  |  ok  |
      soft-irq lock-inversion/123:  ok  |  ok  |  ok  |
      hard-irq lock-inversion/132:  ok  |  ok  |  ok  |
      soft-irq lock-inversion/132:  ok  |  ok  |  ok  |
      hard-irq lock-inversion/213:  ok  |  ok  |  ok  |
      soft-irq lock-inversion/213:  ok  |  ok  |  ok  |
      hard-irq lock-inversion/231:  ok  |  ok  |  ok  |
      soft-irq lock-inversion/231:  ok  |  ok  |  ok  |
      hard-irq lock-inversion/312:  ok  |  ok  |  ok  |
      soft-irq lock-inversion/312:  ok  |  ok  |  ok  |
      hard-irq lock-inversion/321:  ok  |  ok  |  ok  |
      soft-irq lock-inversion/321:  ok  |  ok  |  ok  |
      hard-irq read-recursion/123:  ok  |
      soft-irq read-recursion/123:  ok  |
      hard-irq read-recursion/132:  ok  |
      soft-irq read-recursion/132:  ok  |
      hard-irq read-recursion/213:  ok  |
      soft-irq read-recursion/213:  ok  |
      hard-irq read-recursion/231:  ok  |
      soft-irq read-recursion/231:  ok  |
      hard-irq read-recursion/312:  ok  |
      soft-irq read-recursion/312:  ok  |
      hard-irq read-recursion/321:  ok  |
      soft-irq read-recursion/321:  ok  |
  --------------------------------------------------------------------------
  | Wound/wait tests |
  ---------------------
                  ww api failures:  ok  |  ok  |  ok  |
               ww contexts mixing:  ok  |  ok  |
             finishing ww context:  ok  |  ok  |  ok  |  ok  |
               locking mismatches:  ok  |  ok  |  ok  |
                 EDEADLK handling:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
           spinlock nest unlocked:  ok  |
  -----------------------------------------------------
                                 |block | try  |context|
  -----------------------------------------------------
                          context:  ok  |  ok  |  ok  |
                              try:  ok  |  ok  |  ok  |
                            block:  ok  |  ok  |  ok  |
                         spinlock:  ok  |  ok  |  ok  |
-------------------------------------------------------
Good, all 261 testcases passed! |
---------------------------------
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
*** VALIDATE proc ***
devtmpfs: initialized
random: get_random_u32 called from rhashtable_init+0x29c/0x330 with crng_init=0
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
futex hash table entries: 256 (order: 1, 11264 bytes)
NET: Registered protocol family 16
             
PCI host bridge /plb/pci@ec000000 (primary) ranges:
 MEM 0x00000000a0000000..0x00000000bfffffff -> 0x00000000a0000000 
  IO 0x00000000e8000000..0x00000000e800ffff -> 0x0000000000000000
4xx PCI DMA offset set to 0x00000000
4xx PCI DMA window base to 0x0000000000000000
DMA window size 0x0000000080000000
PCI: Probing PCI hardware
PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
pci_bus 0000:00: root bus resource [mem 0xa0000000-0xbfffffff]
pci_bus 0000:00: root bus resource [bus 00-ff]
pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to ff
pci 0000:00:00.0: [1014:027f] type 00 class 0x068000
ppc4xx_pci_set_irq: PCI irq -1
ppc4xx_pci_set_irq: PCI irq -1
ppc4xx_pci_set_irq: PCI irq -1
ppc4xx_pci_set_irq: PCI irq -1
ppc4xx_pci_set_irq: PCI irq -1
ppc4xx_pci_set_irq: PCI irq -1
ppc4xx_pci_set_irq: PCI irq -1
ppc4xx_pci_set_irq: PCI irq -1
PCI: Hiding 4xx host bridge resources 0000:00:00.0
pci 0000:00:01.0: [8086:100e] type 00 class 0x020000
pci 0000:00:01.0: reg 0x10: [mem 0x00000000-0x0001ffff]
pci 0000:00:01.0: reg 0x14: [io  0x0000-0x003f]
pci 0000:00:01.0: reg 0x30: [mem 0x00000000-0x0003ffff pref]
pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 00
pci 0000:00:01.0: BAR 6: assigned [mem 0xa0000000-0xa003ffff pref]
pci 0000:00:01.0: BAR 0: assigned [mem 0xa0040000-0xa005ffff]
pci 0000:00:01.0: BAR 1: assigned [io  0x1000-0x103f]
pci_bus 0000:00: resource 4 [io  0x0000-0xffff]
pci_bus 0000:00: resource 5 [mem 0xa0000000-0xbfffffff]
vgaarb: loaded
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
clocksource: Switched to clocksource timebase
NET: Registered protocol family 2
tcp_listen_portaddr_hash hash table entries: 128 (order: 0, 5120 bytes)
TCP established hash table entries: 1024 (order: 0, 4096 bytes)
TCP bind hash table entries: 1024 (order: 3, 36864 bytes)
TCP: Hash tables configured (established 1024 bind 1024)
UDP hash table entries: 256 (order: 2, 20480 bytes)
UDP-Lite hash table entries: 256 (order: 2, 20480 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
PCI: CLS 0 bytes, default 32
Trying to unpack rootfs image as initramfs...
Freeing initrd memory: 5116K
workingset: timestamp_bits=30 max_order=15 bucket_order=0
jffs2: version 2.2. (NAND) © 2001-2006 Red Hat, Inc.
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
io scheduler mq-deadline registered
io scheduler kyber registered
String selftests succeeded
test_firmware: interface ready
test passed
test_bitmap: loaded.
test_bitmap: parselist: 14: input is '0-2047:128/256' OK, Time: 16340
test_bitmap: parselist_user: 14: input is '0-2047:128/256' OK, Time: 4600
test_bitmap: all 1652 tests passed
test_uuid: all 18 tests passed
crc32: CRC_LE_BITS = 64, CRC_BE BITS = 64
crc32: self tests passed, processed 225944 bytes in 468120 nsec
crc32c: CRC_LE_BITS = 64
crc32c: self tests passed, processed 225944 bytes in 241893 nsec
crc32_combine: 8373 self tests passed
crc32c_combine: 8373 self tests passed
glob: 64 self-tests passed, 0 failed
rbtree testing
 -> test 1 (latency of nnodes insert+delete): 7020 cycles
 -> test 2 (latency of nnodes cached insert+delete): 6975 cycles
 -> test 3 (latency of inorder traversal): 1119 cycles
 -> test 4 (latency to fetch first node)
        non-cached: 25 cycles
        cached: 0 cycles
augmented rbtree testing
 -> test 1 (latency of nnodes insert+delete): 10961 cycles
 -> test 2 (latency of nnodes cached insert+delete): 9407 cycles
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
printk: console [ttyS0] disabled
serial8250.0: ttyS0 at MMIO 0xef600300 (irq = 16, base_baud = 691200) is a 16550A
printk: console [ttyS0] enabled
printk: console [ttyS0] enabled
printk: bootconsole [udbg0] disabled
printk: bootconsole [udbg0] disabled
printk: console [ttyS0] disabled
printk: console [ttyS0] enabled
ef600400.serial: ttyS1 at MMIO 0xef600400 (irq = 17, base_baud = 691200) is a 16550
brd: module loaded
megasas: 07.707.51.00-rc1
libphy: Fixed MDIO Bus: probed
PPC 4xx OCP EMAC driver, version 3.54
ZMII /plb/opb/emac-zmii@ef600d00 initialized
Fusion MPT base driver 3.04.20
Copyright (c) 1999-2008 LSI Corporation
Fusion MPT SAS Host driver 3.04.20
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
ehci-pci: EHCI PCI platform driver
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
usbcore: registered new interface driver uas
usbcore: registered new interface driver usb-storage
usbcore: registered new interface driver usbtest
usbcore: registered new interface driver usb_ehset_test
usbcore: registered new interface driver lvs
sdhci: Secure Digital Host Controller Interface driver
sdhci: Copyright(c) Pierre Ossman
NET: Registered protocol family 10
Segment Routing with IPv6
sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
NET: Registered protocol family 17
drmem: No dynamic reconfiguration memory found
Freeing unused kernel memory: 376K
This architecture does not have kernel memory protection.
Run /init as init process
init[1]: segfault (11) at b7bcc6f4 nip b7b59d0c lr b7b59cc0 code 2 in libuClibc-1.0.30.so[b7b14000+89000]
init[1]: code: 83bf002c 3b3c0010 813d0004 5529003a 7f994840 419d03f8 7d5de214 63880001 
init[1]: code: 7f9c4850 915f002c 639c0001 911d0004 <938a0004> 4800007c 7f99e040 419c0034 
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
CPU: 0 PID: 1 Comm: init Not tainted 5.2.0-rc2-00154-g6c5875843b87 #1
Call Trace:
[c7839d48] [c0657944] dump_stack+0x24/0x34 (unreliable)
[c7839d58] [c003a024] panic+0x160/0x390
[c7839db8] [c003d0f8] exit_mm+0x0/0x1f0
[c7839e08] [c003d3c0] do_group_exit+0x9c/0xb0
[c7839e28] [c004c370] get_signal+0x85c/0xa34
[c7839ec8] [c0009120] do_notify_resume+0xd8/0x300
[c7839f38] [c000f97c] do_user_signal+0x2c/0x34
--- interrupt: 300 at 0xb7b59d0c
    LR = 0xb7b59cc0
Rebooting in 180 seconds..

--rwEMma7ioTxnRzrJ--
