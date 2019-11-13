Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39638FACE9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 10:25:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CfNZ1cWczF4mQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 20:25:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CfL43tn4zF32n
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 20:23:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="FKSsvq52"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47CfL40Tytz9s7T;
 Wed, 13 Nov 2019 20:23:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1573637004;
 bh=618kMMEqfdzXeTyrenc7f6K8wo7KTVq6bE2vNMU/OCk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=FKSsvq52lRBNNe1D7ydzsHP3hkNyyN+IjUTY4dKJaTOHMjvjjvWEeGU4MxNra7PxJ
 b4xnHkMY/24F2BUXDqaG9k3Q8xXC4F183baSbhvDPIVkoD9UF4+9Ju4yFazs6GmqxN
 WGatrN2uPh424E9Anz+Fzglk7LUwGOHVaSHQ1C5TrZM9zRda+0mfPAeAIb7jjLiiDJ
 yFUp8wJ4m7rS758lJPKHkpWd4bzjXPK900BjHTff5YXac+/7up+8tkrK8ibuNDuJsc
 b7WTB2iGZoODahI0HrKrP71jvvZPr1zkSh4oD0QwsfIte7Boip87+VvcJ/BiRl7zvq
 0Pmg9HA9ESHDw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jason Yan <yanaijie@huawei.com>
Subject: Re: Pull request: scottwood/linux.git next
In-Reply-To: <20191022232155.GA26174@home.buserror.net>
References: <20191022232155.GA26174@home.buserror.net>
Date: Wed, 13 Nov 2019 20:23:21 +1100
Message-ID: <87pnhw165y.fsf@mpe.ellerman.id.au>
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
Cc: Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Scott Wood <oss@buserror.net> writes:
> This contains KASLR support for book3e 32-bit.
>
> The following changes since commit 612ee81b9461475b5a5612c2e8d71559dd3c7920:
>
>   powerpc/papr_scm: Fix an off-by-one check in papr_scm_meta_{get, set} (2019-10-10 20:15:53 +1100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/scottwood/linux.git next
>
> for you to fetch changes up to 9df1ef3f1376ec5d3a1b51a4546c94279bcd88ca:
>
>   powerpc/fsl_booke/32: Document KASLR implementation (2019-10-21 16:09:16 -0500)
>
> ----------------------------------------------------------------
> Jason Yan (12):
>       powerpc: unify definition of M_IF_NEEDED
>       powerpc: move memstart_addr and kernstart_addr to init-common.c
>       powerpc: introduce kernstart_virt_addr to store the kernel base
>       powerpc/fsl_booke/32: introduce create_kaslr_tlb_entry() helper
>       powerpc/fsl_booke/32: introduce reloc_kernel_entry() helper
>       powerpc/fsl_booke/32: implement KASLR infrastructure

This commit breaks booting on the qemu mac99 machine, using pmac32_defconfig.

  $ qemu-system-ppc -nographic -vga none -M mac99 -m 1G -kernel vmlinux 
  >> =============================================================
  >> OpenBIOS 1.1 [Oct 5 2018 08:21]
  >> Configuration device id QEMU version 1 machine id 1
  >> CPUs: 1
  >> Memory: 1024M
  >> UUID: 00000000-0000-0000-0000-000000000000
  >> CPU type PowerPC,G4
  milliseconds isn't unique.
  Welcome to OpenBIOS v1.1 built on Oct 5 2018 08:21
  >> [ppc] Kernel already loaded (0x01000000 + 0x009d2920) (initrd 0x00000000 + 0x00000000)
  >> [ppc] Kernel command line: 
  >> switching to new context:
  OF stdout device is: /pci@f2000000/mac-io@c/escc@13000/ch-a@13020
  Preparing to boot Linux version 5.4.0-rc2-gcc49-05398-g4e1bb50 (michael@alpine1-p1) (gcc version 7.4.0 (Ubuntu 7.4.0-1ubuntu1~18.04.1)) #30 Wed Nov 13 15:07:39 AEDT 2019
  Detected machine type: 00000400
  command line: 
  memory layout at init:
    memory_limit : 00000000 (16 MB aligned)
    alloc_bottom : 019d7000
    alloc_top    : 30000000
    alloc_top_hi : 40000000
    rmo_top      : 30000000
    ram_top      : 40000000
  copying OF device tree...
  Building dt strings...
  Building dt structure...
  Device tree strings 0x019d8000 -> 0x019d70a4
  Device tree struct  0x019d9000 -> 0x3fde7eb0
  Quiescing Open Firmware ...
  Booting Linux via __start() @ 0x01000000 ...

And no output after that.

The problematic hunk is the change to early_32.c:

diff --git a/arch/powerpc/kernel/early_32.c b/arch/powerpc/kernel/early_32.c
index 3482118ffe76..6f8689d7ca7b 100644
--- a/arch/powerpc/kernel/early_32.c
+++ b/arch/powerpc/kernel/early_32.c
@@ -22,7 +22,8 @@ notrace unsigned long __init early_init(unsigned long dt_ptr)
        unsigned long offset = reloc_offset();
 
        /* First zero the BSS */
-       memset(PTRRELOC(&__bss_start), 0, __bss_stop - __bss_start);
+       if (kernstart_virt_addr == KERNELBASE)
+               memset(PTRRELOC(&__bss_start), 0, __bss_stop - __bss_start);
 
        /*
         * Identify the CPU type and fix up code sections
@@ -32,5 +33,5 @@ notrace unsigned long __init early_init(unsigned long dt_ptr)
 
        apply_feature_fixups();
 
-       return KERNELBASE + offset;
+       return kernstart_virt_addr + offset;
 }


It needs to use PTRRELOC() for the kernstart_virt_addr accesses.

I've made that change and squashed it into the series. I've pushed that
as a branch to here:
  https://github.com/linuxppc/linux/commits/topic/kaslr-book3e32


That boots for me on qemu mac99.

Jason can you please test it on your setup with KASLR enabled to make
sure it still works.

cheers
