Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE6A3CC471
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jul 2021 18:24:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GRtjZ30yHz3bYg
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Jul 2021 02:24:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=GNFAndlT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f32;
 helo=mail-qv1-xf32.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GNFAndlT; dkim-atps=neutral
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GRtj35lt8z2yfj
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Jul 2021 02:24:05 +1000 (AEST)
Received: by mail-qv1-xf32.google.com with SMTP id p10so6166990qvk.7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jul 2021 09:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ML87H0Iz4d4pQWmvmX09cNMK8uIYa0Jho6p21tN5Pp8=;
 b=GNFAndlTd2+irUT64gWqwWnO3IBI2Xmbk1jCUOIvinJeJ8H3pddR4FjZsxpqxy84us
 ZDrZkmXFP4XBqfRsEBqW3HxWBuv/U8xZ6QAowQUoAXGvP4785AsbsGtKxroGALy2vBHn
 DLiMmjnA29vfW1/1cAcnOFNuZtU2n2vYeq+yES+yTCpO30bkEVsF0ab+r/SOFbtfjOs3
 uKWyrRoisXSBbVOf2fmlO+mKXqpgqCsHAHKtkJK8DDRQ36wfBXNwN2HYMfU4ZZcD4gqY
 g+f2Zn6qNPZoo+3eKxA2KOBdZGw1TgfkddXXbw+aHC3Whv408pqeEWFO0xZymYGXtuYT
 OULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=ML87H0Iz4d4pQWmvmX09cNMK8uIYa0Jho6p21tN5Pp8=;
 b=DkH8nnuRlJf0LkdiInVVc70mnu/JmrZZICObqxCvVWci7yZ1Lz+73O4HsO5dTdj6ra
 YzER9rF4XA/pLyDofi54VO+UcUBhDrVVMpjcNcTlr4KPtZmx6a+8rhi0rNUGNSA0itmb
 8ARSsiG6LxbZBCfTJXD7993VJ46qkoRDa7/0WvMcBUJN/di508tLGNivarPgMceit0sK
 uhWsjeVNoQlaW0N8w94GVtRfX3fXjBt8Z7tVgQMBU04u1VyV3ywocDarTAVMwrg9/G4O
 2llcqm1OOwUyfh8EvX2Ua3rkcsuPVd4b1go4x5LRI+D3USyzzye9jAeFcO1Tk7PX6fqd
 4YYg==
X-Gm-Message-State: AOAM5303QdPXhkQl0SQ71aLivNS51jNtXDN1FoHP9x9O1pOYNE6lIoDT
 8TUyMyC1bjo1yVf7VaNyLi4=
X-Google-Smtp-Source: ABdhPJyFZITo7smaoLrMo32KzWI9g/VqHtO/DWKThmKNMGcwJ6pq7m9WsiM+EF4MDZ+UGx6HIPHFdA==
X-Received: by 2002:a0c:f909:: with SMTP id v9mr13234239qvn.59.1626539041958; 
 Sat, 17 Jul 2021 09:24:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 a190sm5659426qkf.9.2021.07.17.09.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 09:24:01 -0700 (PDT)
Date: Sat, 17 Jul 2021 09:23:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/chrp: Revert "Move PHB discovery" and "Make
 hydra_init() static"
Message-ID: <20210717162359.GA3130272@roeck-us.net>
References: <20210716221159.3587039-1-linux@roeck-us.net>
 <20210717175750.Horde.TLZWyADKWFGAyFWIYtmglA2@messagerie.c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210717175750.Horde.TLZWyADKWFGAyFWIYtmglA2@messagerie.c-s.fr>
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
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Mackerras <paulus@samba.org>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 17, 2021 at 05:57:50PM +0200, Christophe Leroy wrote:
> Guenter Roeck <linux@roeck-us.net> a écrit :
> 
> > This patch reverts commit 407d418f2fd4 ("powerpc/chrp: Move PHB
> > discovery") and commit 9634afa67bfd ("powerpc/chrp: Make hydra_init()
> > static").
> > 
> > Running the upstream kernel on Qemu's brand new "pegasos2" emulation
> > results in a variety of backtraces such as
> > 
> > Kernel attempted to write user page (a1) - exploit attempt? (uid: 0)
> > ------------[ cut here ]------------
> > Bug: Write fault blocked by KUAP!
> > WARNING: CPU: 0 PID: 0 at arch/powerpc/mm/fault.c:230
> > do_page_fault+0x4f4/0x920
> > CPU: 0 PID: 0 Comm: swapper Not tainted 5.13.2 #40
> > NIP:  c0021824 LR: c0021824 CTR: 00000000
> > REGS: c1085d50 TRAP: 0700   Not tainted  (5.13.2)
> > MSR:  00021032 <ME,IR,DR,RI>  CR: 24042254  XER: 00000000
> > 
> > GPR00: c0021824 c1085e10 c0f8c520 00000021 3fffefff c1085c60 c1085c58
> > 00000000
> > GPR08: 00001032 00000000 00000000 c0ffb3ec 44042254 00000000 00000000
> > 00000004
> > GPR16: 00000000 ffffffff 000000c4 000000d0 0188c6e0 01006000 00000001
> > 40b14000
> > GPR24: c0ec000c 00000300 02000000 00000000 42000000 000000a1 00000000
> > c1085e60
> > NIP [c0021824] do_page_fault+0x4f4/0x920
> > LR [c0021824] do_page_fault+0x4f4/0x920
> > Call Trace:
> > [c1085e10] [c0021824] do_page_fault+0x4f4/0x920 (unreliable)
> > [c1085e50] [c0004254] DataAccess_virt+0xd4/0xe4
> > 
> > and the system fails to boot. Bisect points to commit 407d418f2fd4
> > ("powerpc/chrp: Move PHB discovery"). Reverting this patch together with
> > commit 9634afa67bfd ("powerpc/chrp: Make hydra_init() static") fixes
> > the problem.
> 
> Isn't there more than that in the backtrace ? If there is a fault blocked by
> Kuap, it means there is a fault. It should be visible in the traces.
> 
> Should we fix the problem instead of reverting the commit that made the
> problem visible ?
> 

I do not think the patch reverted here made the problem visible. I am
quite sure that it introduced it. AFAIS the problem is that the new code
initializes and remaps PCI much later, after it is being used. Also, the
patch introducing the problem was never tested on real hardware (it even
says so in the patch comments). That by itself seems to be quite
problematic for such an invasive patch, and makes me wonder if some of
the other PHB discovery related patches introduced similar problems.

Anyway, I do not use or have that hardware. I was just playing with the
latest version of qemu and ended up tracking down why its brand new
pegasos2 emulation no longer boots with the latest Linux kernel.
I personally don't care too much if ppc/chrp support is broken in the
upstream kernel or not. Please take this patch as problem report,
and feel free to do with it whatever you like, including ignoring it.

For completeness, please see a complete log below. 

Thanks,
Guenter

---
Total memory = 512MB; using 1024kB for hash table
Activating Kernel Userspace Execution Prevention
Activating Kernel Userspace Access Protection
Linux version 5.14.0-rc1-00353-gd980cc0620ae (groeck@server.roeck-us.net) (powerpc64-linux-gcc (GCC) 9.3.0, GNU ld (GNU Binutils) 2.34) #3 Sat Jul 17 09:20:08 PDT 2021
Using CHRP machine description
-----------------------------------------------------
phys_mem_size     = 0x20000000
dcache_bsize      = 0x20
icache_bsize      = 0x20
cpu_features      = 0x000000000401a00a
  possible        = 0x00000000277de14a
  always          = 0x0000000000000000
cpu_user_features = 0x9c000001 0x00000000
mmu_features      = 0x00000001
Hash_size         = 0x100000
Hash_mask         = 0x3fff
-----------------------------------------------------
chrp type = 6 [Genesi Pegasos]
Pegasos l2cr : L2 cache was not active, activating
Zone ranges:
  DMA      [mem 0x0000000000000000-0x000000001fffffff]
  Normal   empty
  HighMem  empty
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000000000000-0x000000001fffffff]
Initmem setup node 0 [mem 0x0000000000000000-0x000000001fffffff]
Built 1 zonelists, mobility grouping on.  Total pages: 130048
Kernel command line: console=ttyS0 root=/dev/sda noreboot
Unknown command line parameters: noreboot
Dentry cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
Inode-cache hash table entries: 32768 (order: 5, 131072 bytes, linear)
mem auto-init: stack:off, heap alloc:off, heap free:off
Kernel virtual memory layout:
  * 0xffbcf000..0xfffff000  : fixmap
  * 0xff400000..0xff800000  : highmem PTEs
  * 0xe1000000..0xff400000  : vmalloc & ioremap
  * 0xb0000000..0xc0000000  : modules
Memory: 497660K/524288K available (11600K kernel code, 1328K rwdata, 2288K rodata, 1252K init, 346K bss, 26628K reserved, 0K cma-reserved, 0K highmem)
SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
Kernel attempted to write user page (a1) - exploit attempt? (uid: 0)
------------[ cut here ]------------
Bug: Write fault blocked by KUAP!
WARNING: CPU: 0 PID: 0 at arch/powerpc/mm/fault.c:228 do_page_fault+0x914/0x9e0
CPU: 0 PID: 0 Comm: swapper Not tainted 5.14.0-rc1-00353-gd980cc0620ae #3
NIP:  c0022c54 LR: c0022c54 CTR: 00000000
REGS: c0ff9d40 TRAP: 0700   Not tainted  (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00021032 <ME,IR,DR,RI>  CR: 24f42244  XER: 00000000

GPR00: c0022c54 c0ff9e00 c0ec9520 00000021 3fffefff c0ff9c50 c0ff9c48 00000000 
GPR08: 00001032 00000000 00000000 c0f3846c 44f42244 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 00000300 02000000 00000000 000000a1 00000000 42000000 c0ff9e50 
NIP [c0022c54] do_page_fault+0x914/0x9e0
LR [c0022c54] do_page_fault+0x914/0x9e0
Call Trace:
[c0ff9e00] [c0022c54] do_page_fault+0x914/0x9e0 (unreliable)
[c0ff9e40] [c0004254] DataAccess_virt+0xd4/0xe4
--- interrupt: 300 at i8259_init+0x48/0x274
NIP:  c002e3f8 LR: c0da001c CTR: 00000000
REGS: c0ff9e50 TRAP: 0300   Not tainted  (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00001032 <ME,IR,DR,RI>  CR: 24000422  XER: 00000000
DAR: 000000a1 DSISR: 42000000 
GPR00: c0da001c c0ff9f10 c0ec9520 00000000 f1000cb4 00000000 00000000 c0ff9ef8 
GPR08: 00000003 000000a1 000000ff 00000100 84000422 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 dfffb0a9 dfffb0a0 00001032 00000000 f1000cb4 dfffc6e0 c1010000 
NIP [c002e3f8] i8259_init+0x48/0x274
LR [c0da001c] chrp_init_IRQ+0x2ec/0x3e0
--- interrupt: 300
[c0ff9f10] [c081de84] of_bus_n_addr_cells+0x5c/0xb8 (unreliable)
[c0ff9f40] [c0da001c] chrp_init_IRQ+0x2ec/0x3e0
[c0ff9fa0] [c0d936d8] start_kernel+0x4dc/0x688
[c0ff9ff0] [00003540] 0x3540
Instruction dump:
48b17b4d 2c030000 408200bc 807f0080 48047519 2c030000 41a2fde4 3c80c0cd 
3c60c0cd 3884bb78 3863bb80 480249a1 <0fe00000> 80010044 3860000b 7c0803a6 
random: get_random_bytes called from print_oops_end_marker+0x34/0x6c with crng_init=0
---[ end trace 0000000000000000 ]---
Kernel attempted to write user page (21) - exploit attempt? (uid: 0)
------------[ cut here ]------------
Bug: Write fault blocked by KUAP!
WARNING: CPU: 0 PID: 0 at arch/powerpc/mm/fault.c:228 do_page_fault+0x914/0x9e0
CPU: 0 PID: 0 Comm: swapper Tainted: G        W         5.14.0-rc1-00353-gd980cc0620ae #3
NIP:  c0022c54 LR: c0022c54 CTR: 00000000
REGS: c0ff9d40 TRAP: 0700   Tainted: G        W          (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00021032 <ME,IR,DR,RI>  CR: 24f42244  XER: 00000000

GPR00: c0022c54 c0ff9e00 c0ec9520 00000021 3fffefff c0ff9c50 c0ff9c48 00000000 
GPR08: 00001032 00000000 00000000 c0f3846c 44f42244 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 00000300 02000000 00000000 00000021 00000000 42000000 c0ff9e50 
NIP [c0022c54] do_page_fault+0x914/0x9e0
LR [c0022c54] do_page_fault+0x914/0x9e0
Call Trace:
[c0ff9e00] [c0022c54] do_page_fault+0x914/0x9e0 (unreliable)
[c0ff9e40] [c0004254] DataAccess_virt+0xd4/0xe4
--- interrupt: 300 at i8259_init+0x5c/0x274
NIP:  c002e40c LR: c0da001c CTR: 00000000
REGS: c0ff9e50 TRAP: 0300   Tainted: G        W          (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00001032 <ME,IR,DR,RI>  CR: 24000422  XER: 00000000
DAR: 00000021 DSISR: 42000000 
GPR00: c0da001c c0ff9f10 c0ec9520 00000000 f1000cb4 00000000 00000000 c0ff9ef8 
GPR08: 00000003 00000021 000000ff 00000100 84000422 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 dfffb0a9 dfffb0a0 00001032 00000000 f1000cb4 dfffc6e0 c1010000 
NIP [c002e40c] i8259_init+0x5c/0x274
LR [c0da001c] chrp_init_IRQ+0x2ec/0x3e0
--- interrupt: 300
[c0ff9f10] [c081de84] of_bus_n_addr_cells+0x5c/0xb8 (unreliable)
[c0ff9f40] [c0da001c] chrp_init_IRQ+0x2ec/0x3e0
[c0ff9fa0] [c0d936d8] start_kernel+0x4dc/0x688
[c0ff9ff0] [00003540] 0x3540
Instruction dump:
48b17b4d 2c030000 408200bc 807f0080 48047519 2c030000 41a2fde4 3c80c0cd 
3c60c0cd 3884bb78 3863bb80 480249a1 <0fe00000> 80010044 3860000b 7c0803a6 
---[ end trace 523b05d3a02887f6 ]---
Kernel attempted to write user page (20) - exploit attempt? (uid: 0)
------------[ cut here ]------------
Bug: Write fault blocked by KUAP!
WARNING: CPU: 0 PID: 0 at arch/powerpc/mm/fault.c:228 do_page_fault+0x914/0x9e0
CPU: 0 PID: 0 Comm: swapper Tainted: G        W         5.14.0-rc1-00353-gd980cc0620ae #3
NIP:  c0022c54 LR: c0022c54 CTR: 00000000
REGS: c0ff9d40 TRAP: 0700   Tainted: G        W          (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00021032 <ME,IR,DR,RI>  CR: 24f42244  XER: 00000000

GPR00: c0022c54 c0ff9e00 c0ec9520 00000021 3fffefff c0ff9c50 c0ff9c48 00000000 
GPR08: 00001032 00000000 00000000 c0f3846c 44f42244 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 00000300 02000000 00000000 00000020 00000000 42000000 c0ff9e50 
NIP [c0022c54] do_page_fault+0x914/0x9e0
LR [c0022c54] do_page_fault+0x914/0x9e0
Call Trace:
[c0ff9e00] [c0022c54] do_page_fault+0x914/0x9e0 (unreliable)
[c0ff9e40] [c0004254] DataAccess_virt+0xd4/0xe4
--- interrupt: 300 at i8259_init+0x74/0x274
NIP:  c002e424 LR: c0da001c CTR: 00000000
REGS: c0ff9e50 TRAP: 0300   Tainted: G        W          (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00001032 <ME,IR,DR,RI>  CR: 24000422  XER: 00000000
DAR: 00000020 DSISR: 42000000 
GPR00: c0da001c c0ff9f10 c0ec9520 00000000 f1000cb4 00000000 00000000 c0ff9ef8 
GPR08: 00000011 00000020 000000ff 00000100 84000422 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 dfffb0a9 dfffb0a0 00001032 00000000 f1000cb4 dfffc6e0 c1010000 
NIP [c002e424] i8259_init+0x74/0x274
LR [c0da001c] chrp_init_IRQ+0x2ec/0x3e0
--- interrupt: 300
[c0ff9f10] [c081de84] of_bus_n_addr_cells+0x5c/0xb8 (unreliable)
[c0ff9f40] [c0da001c] chrp_init_IRQ+0x2ec/0x3e0
[c0ff9fa0] [c0d936d8] start_kernel+0x4dc/0x688
[c0ff9ff0] [00003540] 0x3540
Instruction dump:
48b17b4d 2c030000 408200bc 807f0080 48047519 2c030000 41a2fde4 3c80c0cd 
3c60c0cd 3884bb78 3863bb80 480249a1 <0fe00000> 80010044 3860000b 7c0803a6 
---[ end trace 523b05d3a02887f7 ]---
Kernel attempted to write user page (21) - exploit attempt? (uid: 0)
------------[ cut here ]------------
Bug: Write fault blocked by KUAP!
WARNING: CPU: 0 PID: 0 at arch/powerpc/mm/fault.c:228 do_page_fault+0x914/0x9e0
CPU: 0 PID: 0 Comm: swapper Tainted: G        W         5.14.0-rc1-00353-gd980cc0620ae #3
NIP:  c0022c54 LR: c0022c54 CTR: 00000000
REGS: c0ff9d40 TRAP: 0700   Tainted: G        W          (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00021032 <ME,IR,DR,RI>  CR: 24f42244  XER: 00000000

GPR00: c0022c54 c0ff9e00 c0ec9520 00000021 3fffefff c0ff9c50 c0ff9c48 00000000 
GPR08: 00001032 00000000 00000000 c0f3846c 44f42244 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 00000300 02000000 00000000 00000021 00000000 42000000 c0ff9e50 
NIP [c0022c54] do_page_fault+0x914/0x9e0
LR [c0022c54] do_page_fault+0x914/0x9e0
Call Trace:
[c0ff9e00] [c0022c54] do_page_fault+0x914/0x9e0 (unreliable)
[c0ff9e40] [c0004254] DataAccess_virt+0xd4/0xe4
--- interrupt: 300 at i8259_init+0x8c/0x274
NIP:  c002e43c LR: c0da001c CTR: 00000000
REGS: c0ff9e50 TRAP: 0300   Tainted: G        W          (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00001032 <ME,IR,DR,RI>  CR: 24000422  XER: 00000000
DAR: 00000021 DSISR: 42000000 
GPR00: c0da001c c0ff9f10 c0ec9520 00000000 f1000cb4 00000000 00000000 c0ff9ef8 
GPR08: 00000011 00000021 00000000 00000100 84000422 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 dfffb0a9 dfffb0a0 00001032 00000000 f1000cb4 dfffc6e0 c1010000 
NIP [c002e43c] i8259_init+0x8c/0x274
LR [c0da001c] chrp_init_IRQ+0x2ec/0x3e0
--- interrupt: 300
[c0ff9f10] [c081de84] of_bus_n_addr_cells+0x5c/0xb8 (unreliable)
[c0ff9f40] [c0da001c] chrp_init_IRQ+0x2ec/0x3e0
[c0ff9fa0] [c0d936d8] start_kernel+0x4dc/0x688
[c0ff9ff0] [00003540] 0x3540
Instruction dump:
48b17b4d 2c030000 408200bc 807f0080 48047519 2c030000 41a2fde4 3c80c0cd 
3c60c0cd 3884bb78 3863bb80 480249a1 <0fe00000> 80010044 3860000b 7c0803a6 
---[ end trace 523b05d3a02887f8 ]---
Kernel attempted to write user page (21) - exploit attempt? (uid: 0)
------------[ cut here ]------------
Bug: Write fault blocked by KUAP!
WARNING: CPU: 0 PID: 0 at arch/powerpc/mm/fault.c:228 do_page_fault+0x914/0x9e0
CPU: 0 PID: 0 Comm: swapper Tainted: G        W         5.14.0-rc1-00353-gd980cc0620ae #3
NIP:  c0022c54 LR: c0022c54 CTR: 00000000
REGS: c0ff9d40 TRAP: 0700   Tainted: G        W          (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00021032 <ME,IR,DR,RI>  CR: 24f42244  XER: 00000000

GPR00: c0022c54 c0ff9e00 c0ec9520 00000021 3fffefff c0ff9c50 c0ff9c48 00000000 
GPR08: 00001032 00000000 00000000 c0f3846c 44f42244 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 00000300 02000000 00000000 00000021 00000000 42000000 c0ff9e50 
NIP [c0022c54] do_page_fault+0x914/0x9e0
LR [c0022c54] do_page_fault+0x914/0x9e0
Call Trace:
[c0ff9e00] [c0022c54] do_page_fault+0x914/0x9e0 (unreliable)
[c0ff9e40] [c0004254] DataAccess_virt+0xd4/0xe4
--- interrupt: 300 at i8259_init+0xa4/0x274
NIP:  c002e454 LR: c0da001c CTR: 00000000
REGS: c0ff9e50 TRAP: 0300   Tainted: G        W          (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00001032 <ME,IR,DR,RI>  CR: 24000422  XER: 00000000
DAR: 00000021 DSISR: 42000000 
GPR00: c0da001c c0ff9f10 c0ec9520 00000000 f1000cb4 00000000 00000000 c0ff9ef8 
GPR08: 00000011 00000021 00000004 00000100 84000422 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 dfffb0a9 dfffb0a0 00001032 00000000 f1000cb4 dfffc6e0 c1010000 
NIP [c002e454] i8259_init+0xa4/0x274
LR [c0da001c] chrp_init_IRQ+0x2ec/0x3e0
--- interrupt: 300
[c0ff9f10] [c081de84] of_bus_n_addr_cells+0x5c/0xb8 (unreliable)
[c0ff9f40] [c0da001c] chrp_init_IRQ+0x2ec/0x3e0
[c0ff9fa0] [c0d936d8] start_kernel+0x4dc/0x688
[c0ff9ff0] [00003540] 0x3540
Instruction dump:
48b17b4d 2c030000 408200bc 807f0080 48047519 2c030000 41a2fde4 3c80c0cd 
3c60c0cd 3884bb78 3863bb80 480249a1 <0fe00000> 80010044 3860000b 7c0803a6 
---[ end trace 523b05d3a02887f9 ]---
Kernel attempted to write user page (21) - exploit attempt? (uid: 0)
------------[ cut here ]------------
Bug: Write fault blocked by KUAP!
WARNING: CPU: 0 PID: 0 at arch/powerpc/mm/fault.c:228 do_page_fault+0x914/0x9e0
CPU: 0 PID: 0 Comm: swapper Tainted: G        W         5.14.0-rc1-00353-gd980cc0620ae #3
NIP:  c0022c54 LR: c0022c54 CTR: 00000000
REGS: c0ff9d40 TRAP: 0700   Tainted: G        W          (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00021032 <ME,IR,DR,RI>  CR: 24f42244  XER: 00000000

GPR00: c0022c54 c0ff9e00 c0ec9520 00000021 3fffefff c0ff9c50 c0ff9c48 00000000 
GPR08: 00001032 00000000 00000000 c0f3846c 44f42244 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 00000300 02000000 00000000 00000021 00000000 42000000 c0ff9e50 
NIP [c0022c54] do_page_fault+0x914/0x9e0
LR [c0022c54] do_page_fault+0x914/0x9e0
Call Trace:
[c0ff9e00] [c0022c54] do_page_fault+0x914/0x9e0 (unreliable)
[c0ff9e40] [c0004254] DataAccess_virt+0xd4/0xe4
--- interrupt: 300 at i8259_init+0xbc/0x274
NIP:  c002e46c LR: c0da001c CTR: 00000000
REGS: c0ff9e50 TRAP: 0300   Tainted: G        W          (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00001032 <ME,IR,DR,RI>  CR: 24000422  XER: 00000000
DAR: 00000021 DSISR: 42000000 
GPR00: c0da001c c0ff9f10 c0ec9520 00000000 f1000cb4 00000000 00000000 c0ff9ef8 
GPR08: 00000011 00000021 00000001 00000100 84000422 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 dfffb0a9 dfffb0a0 00001032 00000000 f1000cb4 dfffc6e0 c1010000 
NIP [c002e46c] i8259_init+0xbc/0x274
LR [c0da001c] chrp_init_IRQ+0x2ec/0x3e0
--- interrupt: 300
[c0ff9f10] [c081de84] of_bus_n_addr_cells+0x5c/0xb8 (unreliable)
[c0ff9f40] [c0da001c] chrp_init_IRQ+0x2ec/0x3e0
[c0ff9fa0] [c0d936d8] start_kernel+0x4dc/0x688
[c0ff9ff0] [00003540] 0x3540
Instruction dump:
48b17b4d 2c030000 408200bc 807f0080 48047519 2c030000 41a2fde4 3c80c0cd 
3c60c0cd 3884bb78 3863bb80 480249a1 <0fe00000> 80010044 3860000b 7c0803a6 
---[ end trace 523b05d3a02887fa ]---
Kernel attempted to write user page (a0) - exploit attempt? (uid: 0)
------------[ cut here ]------------
Bug: Write fault blocked by KUAP!
WARNING: CPU: 0 PID: 0 at arch/powerpc/mm/fault.c:228 do_page_fault+0x914/0x9e0
CPU: 0 PID: 0 Comm: swapper Tainted: G        W         5.14.0-rc1-00353-gd980cc0620ae #3
NIP:  c0022c54 LR: c0022c54 CTR: 00000000
REGS: c0ff9d40 TRAP: 0700   Tainted: G        W          (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00021032 <ME,IR,DR,RI>  CR: 24f42244  XER: 00000000

GPR00: c0022c54 c0ff9e00 c0ec9520 00000021 3fffefff c0ff9c50 c0ff9c48 00000000 
GPR08: 00001032 00000000 00000000 c0f3846c 44f42244 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 00000300 02000000 00000000 000000a0 00000000 42000000 c0ff9e50 
NIP [c0022c54] do_page_fault+0x914/0x9e0
LR [c0022c54] do_page_fault+0x914/0x9e0
Call Trace:
[c0ff9e00] [c0022c54] do_page_fault+0x914/0x9e0 (unreliable)
[c0ff9e40] [c0004254] DataAccess_virt+0xd4/0xe4
--- interrupt: 300 at i8259_init+0xd0/0x274
NIP:  c002e480 LR: c0da001c CTR: 00000000
REGS: c0ff9e50 TRAP: 0300   Tainted: G        W          (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00001032 <ME,IR,DR,RI>  CR: 24000422  XER: 00000000
DAR: 000000a0 DSISR: 42000000 
GPR00: c0da001c c0ff9f10 c0ec9520 00000000 f1000cb4 00000000 00000000 c0ff9ef8 
GPR08: 00000011 000000a0 00000001 00000100 84000422 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 dfffb0a9 dfffb0a0 00001032 00000000 f1000cb4 dfffc6e0 c1010000 
NIP [c002e480] i8259_init+0xd0/0x274
LR [c0da001c] chrp_init_IRQ+0x2ec/0x3e0
--- interrupt: 300
[c0ff9f10] [c081de84] of_bus_n_addr_cells+0x5c/0xb8 (unreliable)
[c0ff9f40] [c0da001c] chrp_init_IRQ+0x2ec/0x3e0
[c0ff9fa0] [c0d936d8] start_kernel+0x4dc/0x688
[c0ff9ff0] [00003540] 0x3540
Instruction dump:
48b17b4d 2c030000 408200bc 807f0080 48047519 2c030000 41a2fde4 3c80c0cd 
3c60c0cd 3884bb78 3863bb80 480249a1 <0fe00000> 80010044 3860000b 7c0803a6 
---[ end trace 523b05d3a02887fb ]---
Kernel attempted to write user page (a1) - exploit attempt? (uid: 0)
------------[ cut here ]------------
Bug: Write fault blocked by KUAP!
WARNING: CPU: 0 PID: 0 at arch/powerpc/mm/fault.c:228 do_page_fault+0x914/0x9e0
CPU: 0 PID: 0 Comm: swapper Tainted: G        W         5.14.0-rc1-00353-gd980cc0620ae #3
NIP:  c0022c54 LR: c0022c54 CTR: 00000000
REGS: c0ff9d40 TRAP: 0700   Tainted: G        W          (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00021032 <ME,IR,DR,RI>  CR: 24f42244  XER: 00000000

GPR00: c0022c54 c0ff9e00 c0ec9520 00000021 3fffefff c0ff9c50 c0ff9c48 00000000 
GPR08: 00001032 00000000 00000000 c0f3846c 44f42244 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 00000300 02000000 00000000 000000a1 00000000 42000000 c0ff9e50 
NIP [c0022c54] do_page_fault+0x914/0x9e0
LR [c0022c54] do_page_fault+0x914/0x9e0
Call Trace:
[c0ff9e00] [c0022c54] do_page_fault+0x914/0x9e0 (unreliable)
[c0ff9e40] [c0004254] DataAccess_virt+0xd4/0xe4
--- interrupt: 300 at i8259_init+0xe8/0x274
NIP:  c002e498 LR: c0da001c CTR: 00000000
REGS: c0ff9e50 TRAP: 0300   Tainted: G        W          (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00001032 <ME,IR,DR,RI>  CR: 24000422  XER: 00000000
DAR: 000000a1 DSISR: 42000000 
GPR00: c0da001c c0ff9f10 c0ec9520 00000000 f1000cb4 00000000 00000000 c0ff9ef8 
GPR08: 00000008 000000a1 00000001 00000100 84000422 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 dfffb0a9 dfffb0a0 00001032 00000000 f1000cb4 dfffc6e0 c1010000 
NIP [c002e498] i8259_init+0xe8/0x274
LR [c0da001c] chrp_init_IRQ+0x2ec/0x3e0
--- interrupt: 300
[c0ff9f10] [c081de84] of_bus_n_addr_cells+0x5c/0xb8 (unreliable)
[c0ff9f40] [c0da001c] chrp_init_IRQ+0x2ec/0x3e0
[c0ff9fa0] [c0d936d8] start_kernel+0x4dc/0x688
[c0ff9ff0] [00003540] 0x3540
Instruction dump:
48b17b4d 2c030000 408200bc 807f0080 48047519 2c030000 41a2fde4 3c80c0cd 
3c60c0cd 3884bb78 3863bb80 480249a1 <0fe00000> 80010044 3860000b 7c0803a6 
---[ end trace 523b05d3a02887fc ]---
Kernel attempted to write user page (a1) - exploit attempt? (uid: 0)
------------[ cut here ]------------
Bug: Write fault blocked by KUAP!
WARNING: CPU: 0 PID: 0 at arch/powerpc/mm/fault.c:228 do_page_fault+0x914/0x9e0
CPU: 0 PID: 0 Comm: swapper Tainted: G        W         5.14.0-rc1-00353-gd980cc0620ae #3
NIP:  c0022c54 LR: c0022c54 CTR: 00000000
REGS: c0ff9d40 TRAP: 0700   Tainted: G        W          (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00021032 <ME,IR,DR,RI>  CR: 24f42244  XER: 00000000

GPR00: c0022c54 c0ff9e00 c0ec9520 00000021 3fffefff c0ff9c50 c0ff9c48 00000000 
GPR08: 00001032 00000000 00000000 c0f3846c 44f42244 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 00000300 02000000 00000000 000000a1 00000000 42000000 c0ff9e50 
NIP [c0022c54] do_page_fault+0x914/0x9e0
LR [c0022c54] do_page_fault+0x914/0x9e0
Call Trace:
[c0ff9e00] [c0022c54] do_page_fault+0x914/0x9e0 (unreliable)
[c0ff9e40] [c0004254] DataAccess_virt+0xd4/0xe4
--- interrupt: 300 at i8259_init+0x100/0x274
NIP:  c002e4b0 LR: c0da001c CTR: 00000000
REGS: c0ff9e50 TRAP: 0300   Tainted: G        W          (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00001032 <ME,IR,DR,RI>  CR: 24000422  XER: 00000000
DAR: 000000a1 DSISR: 42000000 
GPR00: c0da001c c0ff9f10 c0ec9520 00000000 f1000cb4 00000000 00000000 c0ff9ef8 
GPR08: 00000002 000000a1 00000001 00000100 84000422 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 dfffb0a9 dfffb0a0 00001032 00000000 f1000cb4 dfffc6e0 c1010000 
NIP [c002e4b0] i8259_init+0x100/0x274
LR [c0da001c] chrp_init_IRQ+0x2ec/0x3e0
--- interrupt: 300
[c0ff9f10] [c081de84] of_bus_n_addr_cells+0x5c/0xb8 (unreliable)
[c0ff9f40] [c0da001c] chrp_init_IRQ+0x2ec/0x3e0
[c0ff9fa0] [c0d936d8] start_kernel+0x4dc/0x688
[c0ff9ff0] [00003540] 0x3540
Instruction dump:
48b17b4d 2c030000 408200bc 807f0080 48047519 2c030000 41a2fde4 3c80c0cd 
3c60c0cd 3884bb78 3863bb80 480249a1 <0fe00000> 80010044 3860000b 7c0803a6 
---[ end trace 523b05d3a02887fd ]---
Kernel attempted to write user page (a1) - exploit attempt? (uid: 0)
------------[ cut here ]------------
Bug: Write fault blocked by KUAP!
WARNING: CPU: 0 PID: 0 at arch/powerpc/mm/fault.c:228 do_page_fault+0x914/0x9e0
CPU: 0 PID: 0 Comm: swapper Tainted: G        W         5.14.0-rc1-00353-gd980cc0620ae #3
NIP:  c0022c54 LR: c0022c54 CTR: 00000000
REGS: c0ff9d40 TRAP: 0700   Tainted: G        W          (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00021032 <ME,IR,DR,RI>  CR: 24f42244  XER: 00000000

GPR00: c0022c54 c0ff9e00 c0ec9520 00000021 3fffefff c0ff9c50 c0ff9c48 00000000 
GPR08: 00001032 00000000 00000000 c0f3846c 44f42244 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 00000300 02000000 00000000 000000a1 00000000 42000000 c0ff9e50 
NIP [c0022c54] do_page_fault+0x914/0x9e0
LR [c0022c54] do_page_fault+0x914/0x9e0
Call Trace:
[c0ff9e00] [c0022c54] do_page_fault+0x914/0x9e0 (unreliable)
[c0ff9e40] [c0004254] DataAccess_virt+0xd4/0xe4
--- interrupt: 300 at i8259_init+0x114/0x274
NIP:  c002e4c4 LR: c0da001c CTR: 00000000
REGS: c0ff9e50 TRAP: 0300   Tainted: G        W          (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00001032 <ME,IR,DR,RI>  CR: 24000422  XER: 00000000
DAR: 000000a1 DSISR: 42000000 
GPR00: c0da001c c0ff9f10 c0ec9520 00000000 f1000cb4 00000000 00000000 c0ff9ef8 
GPR08: 00000002 000000a1 00000001 00000100 84000422 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 dfffb0a9 dfffb0a0 00001032 00000000 f1000cb4 dfffc6e0 c1010000 
NIP [c002e4c4] i8259_init+0x114/0x274
LR [c0da001c] chrp_init_IRQ+0x2ec/0x3e0
--- interrupt: 300
[c0ff9f10] [c081de84] of_bus_n_addr_cells+0x5c/0xb8 (unreliable)
[c0ff9f40] [c0da001c] chrp_init_IRQ+0x2ec/0x3e0
[c0ff9fa0] [c0d936d8] start_kernel+0x4dc/0x688
[c0ff9ff0] [00003540] 0x3540
Instruction dump:
48b17b4d 2c030000 408200bc 807f0080 48047519 2c030000 41a2fde4 3c80c0cd 
3c60c0cd 3884bb78 3863bb80 480249a1 <0fe00000> 80010044 3860000b 7c0803a6 
---[ end trace 523b05d3a02887fe ]---
------------[ cut here ]------------
Bug: Write fault blocked by KUAP!
WARNING: CPU: 0 PID: 0 at arch/powerpc/mm/fault.c:228 do_page_fault+0x914/0x9e0
CPU: 0 PID: 0 Comm: swapper Tainted: G        W         5.14.0-rc1-00353-gd980cc0620ae #3
NIP:  c0022c54 LR: c0022c54 CTR: 00000000
REGS: c0ff9d40 TRAP: 0700   Tainted: G        W          (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00021032 <ME,IR,DR,RI>  CR: 24f42244  XER: 00000000

GPR00: c0022c54 c0ff9e00 c0ec9520 00000021 3fffefff c0ff9c50 c0ff9c48 00000000 
GPR08: 00001032 00000000 00000000 c0f3846c 44f42244 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 00000300 02000000 00000000 00000020 00000000 42000000 c0ff9e50 
NIP [c0022c54] do_page_fault+0x914/0x9e0
LR [c0022c54] do_page_fault+0x914/0x9e0
Call Trace:
[c0ff9e00] [c0022c54] do_page_fault+0x914/0x9e0 (unreliable)
[c0ff9e40] [c0004254] DataAccess_virt+0xd4/0xe4
--- interrupt: 300 at i8259_init+0x134/0x274
NIP:  c002e4e4 LR: c002e4d4 CTR: 00000000
REGS: c0ff9e50 TRAP: 0300   Tainted: G        W          (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00001032 <ME,IR,DR,RI>  CR: 24000422  XER: 00000000
DAR: 00000020 DSISR: 42000000 
GPR00: c0da001c c0ff9f10 c0ec9520 00002710 f1000cb4 00000000 00000000 c0ff9ef8 
GPR08: 00000002 00000020 0000000b 00000100 84000422 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 dfffb0a9 dfffb0a0 00001032 00000000 f1000cb4 dfffc6e0 c1010000 
NIP [c002e4e4] i8259_init+0x134/0x274
LR [c002e4d4] i8259_init+0x124/0x274
--- interrupt: 300
[c0ff9f10] [c081de84] of_bus_n_addr_cells+0x5c/0xb8 (unreliable)
[c0ff9f40] [c0da001c] chrp_init_IRQ+0x2ec/0x3e0
[c0ff9fa0] [c0d936d8] start_kernel+0x4dc/0x688
[c0ff9ff0] [00003540] 0x3540
Instruction dump:
48b17b4d 2c030000 408200bc 807f0080 48047519 2c030000 41a2fde4 3c80c0cd 
3c60c0cd 3884bb78 3863bb80 480249a1 <0fe00000> 80010044 3860000b 7c0803a6 
---[ end trace 523b05d3a02887ff ]---
------------[ cut here ]------------
Bug: Write fault blocked by KUAP!
WARNING: CPU: 0 PID: 0 at arch/powerpc/mm/fault.c:228 do_page_fault+0x914/0x9e0
CPU: 0 PID: 0 Comm: swapper Tainted: G        W         5.14.0-rc1-00353-gd980cc0620ae #3
NIP:  c0022c54 LR: c0022c54 CTR: 00000000
REGS: c0ff9d40 TRAP: 0700   Tainted: G        W          (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00021032 <ME,IR,DR,RI>  CR: 24f42244  XER: 00000000

GPR00: c0022c54 c0ff9e00 c0ec9520 00000021 3fffefff c0ff9c50 c0ff9c48 00000000 
GPR08: 00001032 00000000 00000000 c0f3846c 44f42244 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 00000300 02000000 00000000 000000a0 00000000 42000000 c0ff9e50 
NIP [c0022c54] do_page_fault+0x914/0x9e0
LR [c0022c54] do_page_fault+0x914/0x9e0
Call Trace:
[c0ff9e00] [c0022c54] do_page_fault+0x914/0x9e0 (unreliable)
[c0ff9e40] [c0004254] DataAccess_virt+0xd4/0xe4
--- interrupt: 300 at i8259_init+0x148/0x274
NIP:  c002e4f8 LR: c002e4d4 CTR: 00000000
REGS: c0ff9e50 TRAP: 0300   Tainted: G        W          (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00001032 <ME,IR,DR,RI>  CR: 24000422  XER: 00000000
DAR: 000000a0 DSISR: 42000000 
GPR00: c0da001c c0ff9f10 c0ec9520 00002710 f1000cb4 00000000 00000000 c0ff9ef8 
GPR08: 00000002 000000a0 0000000b 00000100 84000422 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 dfffb0a9 dfffb0a0 00001032 00000000 f1000cb4 dfffc6e0 c1010000 
NIP [c002e4f8] i8259_init+0x148/0x274
LR [c002e4d4] i8259_init+0x124/0x274
--- interrupt: 300
[c0ff9f10] [c081de84] of_bus_n_addr_cells+0x5c/0xb8 (unreliable)
[c0ff9f40] [c0da001c] chrp_init_IRQ+0x2ec/0x3e0
[c0ff9fa0] [c0d936d8] start_kernel+0x4dc/0x688
[c0ff9ff0] [00003540] 0x3540
Instruction dump:
48b17b4d 2c030000 408200bc 807f0080 48047519 2c030000 41a2fde4 3c80c0cd 
3c60c0cd 3884bb78 3863bb80 480249a1 <0fe00000> 80010044 3860000b 7c0803a6 
---[ end trace 523b05d3a0288800 ]---
------------[ cut here ]------------
Bug: Write fault blocked by KUAP!
WARNING: CPU: 0 PID: 0 at arch/powerpc/mm/fault.c:228 do_page_fault+0x914/0x9e0
CPU: 0 PID: 0 Comm: swapper Tainted: G        W         5.14.0-rc1-00353-gd980cc0620ae #3
NIP:  c0022c54 LR: c0022c54 CTR: 00000000
REGS: c0ff9d40 TRAP: 0700   Tainted: G        W          (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00021032 <ME,IR,DR,RI>  CR: 24f42244  XER: 00000000

GPR00: c0022c54 c0ff9e00 c0ec9520 00000021 3fffefff c0ff9c50 c0ff9c48 00000000 
GPR08: 00001032 00000000 00000000 c0f3846c 44f42244 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 00000300 02000000 00000000 000000a1 00000000 42000000 c0ff9e50 
NIP [c0022c54] do_page_fault+0x914/0x9e0
LR [c0022c54] do_page_fault+0x914/0x9e0
Call Trace:
[c0ff9e00] [c0022c54] do_page_fault+0x914/0x9e0 (unreliable)
[c0ff9e40] [c0004254] DataAccess_virt+0xd4/0xe4
--- interrupt: 300 at i8259_init+0x174/0x274
NIP:  c002e524 LR: c002e4d4 CTR: 00000000
REGS: c0ff9e50 TRAP: 0300   Tainted: G        W          (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00001032 <ME,IR,DR,RI>  CR: 24000422  XER: 00000000
DAR: 000000a1 DSISR: 42000000 
GPR00: c0da001c c0ff9f10 c0ec9520 00002710 f1000cb4 00000000 00000000 c0ff9ef8 
GPR08: 000000ff 000000a1 000000fb 00000100 84000422 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 dfffb0a9 dfffb0a0 00001032 00000000 f1000cb4 c0ecc8b8 c1010000 
NIP [c002e524] i8259_init+0x174/0x274
LR [c002e4d4] i8259_init+0x124/0x274
--- interrupt: 300
[c0ff9f10] [c081de84] of_bus_n_addr_cells+0x5c/0xb8 (unreliable)
[c0ff9f40] [c0da001c] chrp_init_IRQ+0x2ec/0x3e0
[c0ff9fa0] [c0d936d8] start_kernel+0x4dc/0x688
[c0ff9ff0] [00003540] 0x3540
Instruction dump:
48b17b4d 2c030000 408200bc 807f0080 48047519 2c030000 41a2fde4 3c80c0cd 
3c60c0cd 3884bb78 3863bb80 480249a1 <0fe00000> 80010044 3860000b 7c0803a6 
---[ end trace 523b05d3a0288801 ]---
------------[ cut here ]------------
Bug: Write fault blocked by KUAP!
WARNING: CPU: 0 PID: 0 at arch/powerpc/mm/fault.c:228 do_page_fault+0x914/0x9e0
CPU: 0 PID: 0 Comm: swapper Tainted: G        W         5.14.0-rc1-00353-gd980cc0620ae #3
NIP:  c0022c54 LR: c0022c54 CTR: 00000000
REGS: c0ff9d40 TRAP: 0700   Tainted: G        W          (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00021032 <ME,IR,DR,RI>  CR: 24f42244  XER: 00000000

GPR00: c0022c54 c0ff9e00 c0ec9520 00000021 3fffefff c0ff9c50 c0ff9c48 00000000 
GPR08: 00001032 00000000 00000000 c0f3846c 44f42244 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 00000300 02000000 00000000 00000021 00000000 42000000 c0ff9e50 
NIP [c0022c54] do_page_fault+0x914/0x9e0
LR [c0022c54] do_page_fault+0x914/0x9e0
Call Trace:
[c0ff9e00] [c0022c54] do_page_fault+0x914/0x9e0 (unreliable)
[c0ff9e40] [c0004254] DataAccess_virt+0xd4/0xe4
--- interrupt: 300 at i8259_init+0x18c/0x274
NIP:  c002e53c LR: c002e4d4 CTR: 00000000
REGS: c0ff9e50 TRAP: 0300   Tainted: G        W          (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00001032 <ME,IR,DR,RI>  CR: 24000422  XER: 00000000
DAR: 00000021 DSISR: 42000000 
GPR00: c0da001c c0ff9f10 c0ec9520 00002710 f1000cb4 00000000 00000000 c0ff9ef8 
GPR08: 000000ff 00000021 000000fb 00000100 84000422 00000000 00000000 00000004 
GPR16: 00000000 ffffffff 000000c4 000000d0 017e2b7c 00a8bf40 c0ec9014 c0d66c20 
GPR24: 00000000 dfffb0a9 dfffb0a0 00001032 00000000 f1000cb4 c0ecc8b8 c1010000 
NIP [c002e53c] i8259_init+0x18c/0x274
LR [c002e4d4] i8259_init+0x124/0x274
--- interrupt: 300
[c0ff9f10] [c081de84] of_bus_n_addr_cells+0x5c/0xb8 (unreliable)
[c0ff9f40] [c0da001c] chrp_init_IRQ+0x2ec/0x3e0
[c0ff9fa0] [c0d936d8] start_kernel+0x4dc/0x688
[c0ff9ff0] [00003540] 0x3540
Instruction dump:
48b17b4d 2c030000 408200bc 807f0080 48047519 2c030000 41a2fde4 3c80c0cd 
3c60c0cd 3884bb78 3863bb80 480249a1 <0fe00000> 80010044 3860000b 7c0803a6 
---[ end trace 523b05d3a0288802 ]---
i8259 legacy interrupt controller initialized
Persistent clock returned invalid value
clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x7b00c4bad, max_idle_ns: 440795202744 ns
clocksource: timebase mult[1e000005] shift[24] registered
Console: colour dummy device 80x25
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
devtmpfs: initialized
PCI bus 0
 controlled by /pci@80000000
 at 80000000

PCI host bridge /pci@80000000 (primary) ranges:
  IO 0x00000000fe000000..0x00000000fe00ffff -> 0x0000000000000000
 MEM 0x0000000080000000..0x00000000bfffffff -> 0x0000000080000000 
PCI bus 0
 controlled by /pci@c0000000
 at c0000000

PCI host bridge /pci@c0000000  ranges:
  IO 0x00000000f8000000..0x00000000f800ffff -> 0x0000000000000000
 MEM 0x00000000c0000000..0x00000000dfffffff -> 0x00000000c0000000 
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at mm/memblock.c:1450 memblock_alloc_internal+0x34/0x108
CPU: 0 PID: 1 Comm: swapper Tainted: G        W         5.14.0-rc1-00353-gd980cc0620ae #3
NIP:  c0dab064 LR: c0dab05c CTR: 00000005
REGS: e100dc60 TRAP: 0700   Tainted: G        W          (5.14.0-rc1-00353-gd980cc0620ae)
MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 44042222  XER: 00000000

GPR00: c0dab3c8 e100dd20 c14c0000 00000001 00000020 00000000 00000000 ffffffff 
GPR08: 00000000 ffffffff dfffb3ec c0f3846c 84042228 00000000 c0007730 c0cce9bc 
GPR16: c0ecd7f4 c0cc7584 c0cfd728 c0ccb3e8 c0cce9e4 c0ccea28 c0cc74bc c0ce4a20 
GPR24: dfffb3ec 00000000 00000000 ffffffff 00000000 00000020 00000130 00000000 
NIP [c0dab064] memblock_alloc_internal+0x34/0x108
LR [c0dab05c] memblock_alloc_internal+0x2c/0x108
Call Trace:
[e100dd20] [c081e0a0] of_find_property+0x20/0x38 (unreliable)
[e100dd50] [c0dab3c8] memblock_alloc_try_nid+0x8c/0xc0
[e100dd80] [c0d98d68] pci_create_OF_bus_map+0x28/0xc4
[e100dda0] [c0da0ea0] chrp_find_bridges+0x5c8/0x640
[e100de50] [c0d98e28] discover_phbs+0x24/0x40
[e100de60] [c0d93900] do_one_initcall+0x7c/0x198
[e100ded0] [c0d93c78] kernel_init_freeable+0x1e0/0x290
[e100df10] [c0007758] kernel_init+0x28/0x120
[e100df30] [c001d148] ret_from_kernel_thread+0x14/0x1c
Instruction dump:
7c0802a6 bf210014 7c7e1b78 90010034 7c9d2378 7cbf2b78 7cd93378 7cfb3b78 
7d1a4378 4b3ad415 2c030000 41a2003c <0fe00000> 80010034 7fc3f378 83210014 
---[ end trace 523b05d3a0288803 ]---
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
futex hash table entries: 256 (order: -1, 3072 bytes, linear)
NET: Registered PF_NETLINK/PF_ROUTE protocol family
PCI: Probing PCI hardware
PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
pci_bus 0000:00: root bus resource [mem 0x80000000-0xbfffffff]
pci_bus 0000:00: root bus resource [bus 00-ff]
pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to ff
pci 0000:00:00.0: [11ab:6460] type 00 class 0x060000
pci 0000:00:01.0: [1234:1111] type 00 class 0x030000
pci 0000:00:01.0: reg 0x10: [mem 0x00000000-0x00ffffff pref]
pci 0000:00:01.0: reg 0x18: [mem 0x00000000-0x00000fff]
pci 0000:00:01.0: reg 0x30: [mem 0x00000000-0x0000ffff pref]
pci 0000:00:0c.0: [1106:8231] type 00 class 0x060100
pci 0000:00:0c.1: [1106:0571] type 00 class 0x01018f
pci 0000:00:0c.1: reg 0x10: [io  0x0000-0x0007]
pci 0000:00:0c.1: reg 0x14: [io  0x0000-0x0003]
pci 0000:00:0c.1: reg 0x18: [io  0x0000-0x0007]
pci 0000:00:0c.1: reg 0x1c: [io  0x0000-0x0003]
pci 0000:00:0c.1: reg 0x20: [io  0x0000-0x000f]
pci 0000:00:0c.2: [1106:3038] type 00 class 0x0c0300
pci 0000:00:0c.2: reg 0x20: [io  0x0000-0x001f]
pci 0000:00:0c.3: [1106:3038] type 00 class 0x0c0300
pci 0000:00:0c.3: reg 0x20: [io  0x0000-0x001f]
pci 0000:00:0c.4: [1106:8235] type 00 class 0x068000
pci 0000:00:0c.5: [1106:3058] type 00 class 0x040100
pci 0000:00:0c.6: [1106:3068] type 00 class 0x078000
pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 00
pci 0000:00:0c.1: of_irq_parse_pci: failed with rc=-22
pci 0000:00:0c.2: of_irq_parse_pci: failed with rc=-22
pci 0000:00:0c.3: of_irq_parse_pci: failed with rc=-22
pci 0000:00:0c.5: of_irq_parse_pci: failed with rc=-22
pci 0000:00:0c.6: of_irq_parse_pci: failed with rc=-22
PCI host bridge to bus 0001:01
pci_bus 0001:01: root bus resource [io  0x20000-0x2ffff] (bus address [0x0000-0xffff])
pci_bus 0001:01: root bus resource [mem 0xc0000000-0xdfffffff]
pci_bus 0001:01: root bus resource [bus 01-ff]
pci_bus 0001:01: busn_res: [bus 01-ff] end is updated to ff
pci 0001:01:00.0: [11ab:6460] type 00 class 0x060000
pci_bus 0001:01: busn_res: [bus 01-ff] end is updated to 01
pci 0000:00:01.0: BAR 0: assigned [mem 0x80000000-0x80ffffff pref]
pci 0000:00:01.0: BAR 6: assigned [mem 0x81000000-0x8100ffff pref]
pci 0000:00:01.0: BAR 2: assigned [mem 0x81010000-0x81010fff]
pci 0000:00:0c.2: BAR 4: assigned [io  0x1000-0x101f]
pci 0000:00:0c.3: BAR 4: assigned [io  0x1020-0x103f]
pci 0000:00:0c.1: BAR 4: assigned [io  0x1040-0x104f]
pci 0000:00:0c.1: BAR 0: assigned [io  0x1050-0x1057]
pci 0000:00:0c.1: BAR 2: assigned [io  0x1058-0x105f]
pci 0000:00:0c.1: BAR 1: assigned [io  0x1060-0x1063]
pci 0000:00:0c.1: BAR 3: assigned [io  0x1064-0x1067]
pci_bus 0000:00: resource 4 [io  0x0000-0xffff]
pci_bus 0000:00: resource 5 [mem 0x80000000-0xbfffffff]
pci_bus 0001:01: resource 4 [io  0x20000-0x2ffff]
pci_bus 0001:01: resource 5 [mem 0xc0000000-0xdfffffff]
pci 0000:00:01.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
pci 0000:00:01.0: vgaarb: bridge control possible
pci 0000:00:01.0: vgaarb: setting as boot device (VGA legacy resources not available)
vgaarb: loaded
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
Advanced Linux Sound Architecture Driver Initialized.
clocksource: Switched to clocksource timebase
NET: Registered PF_INET protocol family
IP idents hash table entries: 8192 (order: 4, 65536 bytes, linear)
tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 4096 bytes, linear)
TCP established hash table entries: 4096 (order: 2, 16384 bytes, linear)
TCP bind hash table entries: 4096 (order: 2, 16384 bytes, linear)
TCP: Hash tables configured (established 4096 bind 4096)
UDP hash table entries: 256 (order: 0, 4096 bytes, linear)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes, linear)
NET: Registered PF_UNIX/PF_LOCAL protocol family
pci 0000:00:0c.1: Fixing VIA IDE, force legacy mode on
pci 0000:00:0c.2: enabling device (0000 -> 0001)
pci 0000:00:0c.3: enabling device (0000 -> 0001)
PCI: CLS 0 bytes, default 32
Thermal assist unit using workqueue, shrink_timer: 2000 ms
workingset: timestamp_bits=30 max_order=17 bucket_order=0
efs: 1.0a - http://aeschi.ch.eu.org/efs/
QNX4 filesystem 0.2.3 registered.
befs: version: 0.9.3
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
io scheduler mq-deadline registered
io scheduler kyber registered
IPMI message handler: version 39.2
ipmi device interface
ipmi_si: IPMI System Interface driver
ipmi_si: Unable to find any System Interface(s)
IPMI Watchdog: driver initialized
IPMI poweroff: Copyright (C) 2004 MontaVista Software - IPMI Powerdown via sys_reboot
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
printk: console [ttyS0] disabled
serial8250.0: ttyS0 at I/O 0x2f8 (irq = 0, base_baud = 115200) is a 16550A
printk: console [ttyS0] enabled
pmac_zilog: 0.6 (Benjamin Herrenschmidt <benh@kernel.crashing.org>)
Applicom driver: $Id: ac.c,v 1.30 2000/03/22 16:03:57 dwmw2 Exp $
ac.o: No PCI boards found.
ac.o: For an ISA board you must supply memory and irq parameters.
Linux agpgart interface v0.103
SyncLink PC Card driver $Revision: 4.34 $, tty major#249
[drm] radeon kernel modesetting enabled.
Floppy drive(s): fd0 is 2.88M
loop: module loaded
apm_emu: PMU APM Emulation initialized.
Warning: no ADB interface detected
scsi host0: pata_via
scsi host1: pata_via
ata1: PATA max UDMA/100 cmd 0x1050 ctl 0x1060 bmdma 0x1040 irq 14
ata2: PATA max UDMA/100 cmd 0x1058 ctl 0x1064 bmdma 0x1048 irq 15
e1000: Intel(R) PRO/1000 Network Driver
e1000: Copyright (c) 1999-2006 Intel Corporation.
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
ehci-pci: EHCI PCI platform driver
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
ohci-pci: OHCI PCI platform driver
uhci_hcd: USB Universal Host Controller Interface driver
uhci_hcd 0000:00:0c.2: UHCI Host Controller
uhci_hcd 0000:00:0c.2: new USB bus registered, assigned bus number 1
uhci_hcd 0000:00:0c.2: irq 9, io base 0x00001000
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
uhci_hcd 0000:00:0c.3: UHCI Host Controller
uhci_hcd 0000:00:0c.3: new USB bus registered, assigned bus number 2
uhci_hcd 0000:00:0c.3: irq 9, io base 0x00001020
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 2 ports detected
usbcore: registered new interface driver cdc_acm
cdc_acm: USB Abstract Control Model driver for USB modems and ISDN adapters
usbcore: registered new interface driver usblp
usbcore: registered new interface driver mdc800
mdc800: v0.7.5 (30/10/2000):USB Driver for Mustek MDC800 Digital Camera
usbcore: registered new interface driver usbserial_generic
usbserial: USB Serial support registered for generic
usbcore: registered new interface driver cytherm
usbcore: registered new interface driver idmouse
usbcore: registered new interface driver usblcd
usbcore: registered new interface driver legousbtower
usbcore: registered new interface driver usbtest
usbcore: registered new interface driver sisusb
ata1.00: ATA-7: QEMU HARDDISK, 2.5+, max UDMA/100
ata1.00: 32768 sectors, multi 16: LBA48 
usb 2-1: new full-speed USB device number 2 using uhci_hcd
serio: i8042 KBD port at 0x60,0x64 irq 1
mousedev: PS/2 mouse device common for all mice
usbcore: registered new interface driver iforce
input: ICS MicroClock MK712 TouchScreen as /devices/virtual/input/input0
rtc-generic rtc-generic: registered as rtc0
rtc-generic rtc-generic: hctosys: unable to read the hardware clock
i2c /dev entries driver
vt596_smbus 0000:00:0c.4: SMBUS: Error: Host SMBus controller not enabled! - upgrade BIOS or use force=1
Driver for 1-wire Dallas network protocol.
usbcore: registered new interface driver pcwd_usb
softdog: initialized. soft_noboot=0 soft_margin=60 sec soft_panic=0 (nowayout=0)
softdog:              soft_reboot_cmd=<not set> soft_active_on_boot=0
wbsd: Winbond W83L51xD SD/MMC card interface driver
wbsd: Copyright(c) Pierre Ossman
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
snd_via82xx 0000:00:0c.5: codec_read: codec 0 is not valid [0x0]
snd_via82xx 0000:00:0c.5: codec_read: codec 0 is not valid [0x0]
atkbd serio0: keyboard reset failed on isa0060/serio0
snd_via82xx 0000:00:0c.5: codec_read: codec 0 is not valid [0x0]
snd_via82xx 0000:00:0c.5: codec_read: codec 0 is not valid [0x0]
snd_via82xx 0000:00:0c.5: AC'97 0 access is not valid [0xffffffff], removing mixer.
snd_via82xx: probe of 0000:00:0c.5 failed with error -5
floppy0: no floppy controllers found
work still pending
scsi 0:0:0:0: Direct-Access     ATA      QEMU HARDDISK    2.5+ PQ: 0 ANSI: 5
sd 0:0:0:0: [sda] 32768 512-byte logical blocks: (16.8 MB/16.0 MiB)
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
snd_via82xx_modem 0000:00:0c.6: codec_read: codec 0 is not valid [0x0]
snd_via82xx_modem 0000:00:0c.6: codec_read: codec 0 is not valid [0x0]
ata2.00: ATAPI: QEMU DVD-ROM, 2.5+, max UDMA/100
snd_via82xx_modem 0000:00:0c.6: codec_read: codec 0 is not valid [0x0]
snd_via82xx_modem 0000:00:0c.6: codec_read: codec 0 is not valid [0x0]
snd_via82xx_modem 0000:00:0c.6: AC'97 0 access is not valid [0xffffffff], removing mixer.
snd_via82xx_modem: probe of 0000:00:0c.6 failed with error -5
usbcore: registered new interface driver snd-usb-audio
usbcore: registered new interface driver snd-usb-usx2y
NET: Registered PF_INET6 protocol family
Segment Routing with IPv6
sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
NET: Registered PF_PACKET protocol family
drmem: No dynamic reconfiguration memory found
ALSA device list:
  No soundcards found.
ata2.00: qc timeout (cmd 0xa0)
ata2.00: TEST_UNIT_READY failed (err_mask=0x5)
ata2.00: qc timeout (cmd 0xa0)
ata2.00: TEST_UNIT_READY failed (err_mask=0x5)
ata2.00: limiting speed to UDMA/100:PIO3
ata2.00: qc timeout (cmd 0xa0)
ata2.00: TEST_UNIT_READY failed (err_mask=0x5)
ata2.00: disabled
ata1: lost interrupt (Status 0x50)
ata1.00: exception Emask 0x0 SAct 0x0 SErr 0x0 action 0x6 frozen
ata1.00: failed command: READ DMA
ata1.00: cmd c8/00:08:00:00:00/00:00:00:00:00/e0 tag 0 dma 4096 in
         res 40/00:00:00:00:00/00:00:00:00:00/00 Emask 0x4 (timeout)
ata1.00: status: { DRDY }
ata1: soft resetting link
ata1.00: configured for UDMA/100
ata1.00: device reported invalid CHS sector 0
ata1: EH complete
ata1: lost interrupt (Status 0x50)
ata1.00: limiting speed to UDMA/66:PIO4
ata1.00: exception Emask 0x0 SAct 0x0 SErr 0x0 action 0x6 frozen
ata1.00: failed command: READ DMA
ata1.00: cmd c8/00:08:00:00:00/00:00:00:00:00/e0 tag 0 dma 4096 in
         res 40/00:00:00:00:00/00:00:00:00:00/00 Emask 0x4 (timeout)
ata1.00: status: { DRDY }
ata1: soft resetting link
ata1.00: configured for UDMA/66
ata1.00: device reported invalid CHS sector 0
ata1: EH complete
...
