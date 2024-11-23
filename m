Return-Path: <linuxppc-dev+bounces-3522-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 324959D67BC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Nov 2024 06:46:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XwLYd1nJ8z2yM6;
	Sat, 23 Nov 2024 16:46:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732340773;
	cv=none; b=PUZ5eD/D7BMK+V1KGGsQnTKXQx6OqGVt1hBJu5sQpstPzoam+cvNS3VjRKRroXVuHG1O4pmmcAPTY6bnWtr4e0ZCCy/CbHLCy23FiESAd9UCU8xo6bKaH1QYKVko4eavN6f/tcEGY5cIgv7/Xlinu3hmg0CfeYTRLFTznFWkf+EdRHznMu6Y2W3TxMIwHuUY9sUSDzc7guQu1GdJz4+dJpDE0xjZ9Dw4m80pgKqpWf64SVcdV2hJszb87H9p4Mum6/9yjgPXFLXKhMEMS7cERCiB06u2+mis/qn6YwRg0tmzd1X0jBwdAtIzeoO6jSlmrMSP9O88fsnjjF1NTxpB9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732340773; c=relaxed/relaxed;
	bh=VzUU9vjzWqi0f14j1jIpExtUToDwsvnsTYD1ACXrgnY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JF4biIQDzbYTs1+6V2XYq7ZR6Sj7GZVyi44JYxjStrSJfpX7h/nxcXmDVZ6nLVFVi0OeMrFsodvKGeX3Bb0HzjEP+uYwzo3+882mojRI+XMmDUgfwVWZeEPLCAPqxnbxhBzXOjHcAO45rFh6dSpFh9UUMPYJcwrlGhszOfNMs3BGU5Cp3G/e4xuis10kZrtBW+RogV9TkUyCoU4OE/HhW0mSe4a0+hGSlKMWHGUfZrzye3L+u3FybHwhuyYU+upqTPZlwYYx1+3v2Kl0uuqgciHcduqsQ6rXQ3Ke1ioSpLPmfrj6WKEdy6AlKofIsQA0I3gQpQ945WBgnRcZr4uLqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ejEllTzO; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ejEllTzO;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XwLYZ5yrPz2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Nov 2024 16:46:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1732340767;
	bh=VzUU9vjzWqi0f14j1jIpExtUToDwsvnsTYD1ACXrgnY=;
	h=From:To:Cc:Subject:Date:From;
	b=ejEllTzOEXixUoyDPNN00oRZI+BrOSdcKqMk7y3dTvJcSL7gMUQKfGD6q7jJ98Sf9
	 qXyxnvLkko7ohoJ+Xiea1HKvaCldfW8acpnOoVOVnwoylg/HSv59I7T8E/IrsKUemV
	 QvRa/P6HHRniaXeDWiWzA3WjS79qsICaZRcC83jGj4qYrvW62mr/hlzxs2s900Fjg2
	 XCpSf8mcjLy1/nE+7Gua9ZJRDI2na4ufnCqWnUBD2R2Y2R3BAtlTDr4Ck6CSEz4IfW
	 yrWt8t9IOQFgS0gOms6z76FXg94i/6EMjL/WH+j3PthNtcLUjw5IV1+mOWOHorFKAU
	 LfkmQIXUE31DA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XwLYN6tRSz4w2R;
	Sat, 23 Nov 2024 16:46:00 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: 00107082@163.com, Julia.Lawall@inria.fr, amachhiw@linux.ibm.com,
 arnd@arndb.de, bp@alien8.de, christophe.leroy@csgroup.eu,
 costa.shul@redhat.com, david.hunter.linux@gmail.com,
 elfring@users.sourceforge.net, gautam@linux.ibm.com,
 geert+renesas@glider.be, geoff@infradead.org, hbathini@linux.ibm.com,
 horms@kernel.org, kjain@linux.ibm.com, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, lukas.bulwahn@redhat.com,
 maddy@linux.ibm.com, masahiroy@kernel.org, mchauras@linux.ibm.com,
 mhiramat@kernel.org, msuchanek@suse.de, nathan@kernel.org,
 naveen@kernel.org, paulmck@kernel.org,
 paulo.miguel.almeida.rodenas@gmail.com, ritesh.list@gmail.com,
 robh@kernel.org, shenlichuan@vivo.com, sourabhjain@linux.ibm.com,
 thomas.weissschuh@linutronix.de, thorsten.blum@linux.dev, vbabka@suse.cz,
 viresh.kumar@linaro.org, zhangjiao2@cmss.chinamobile.com,
 zhangzekun11@huawei.com, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.13-1 tag
Date: Sat, 23 Nov 2024 16:46:01 +1100
Message-ID: <87frnih59i.fsf@mpe.ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hi Linus,

Please pull powerpc updates for 6.13.

There's a fixup required after the merge in our ftrace code:

diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/f=
trace.h
index bb2c90997618..db481b336bca 100644
- --- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -138,7 +138,7 @@ unsigned long ftrace_call_adjust(unsigned long addr);
  */
 static inline void arch_ftrace_set_direct_caller(struct ftrace_regs *fregs=
, unsigned long addr)
 {
- -	struct pt_regs *regs =3D &fregs->regs;
+	struct pt_regs *regs =3D &arch_ftrace_regs(fregs)->regs;
=20
 	regs->orig_gpr3 =3D addr;
 }

As discussed previously: https://lore.kernel.org/all/20241106140414.760b502=
c@canb.auug.org.au

There is also a pending conflict with the kbuild tree, the obvious resoluti=
on
is correct, but is described here for reference https://lore.kernel.org/all=
/20241113095228.4ac96776@canb.auug.org.au

cheers

Notable out of area changes:
  arch/Kconfig              # 1198c9c689cf kbuild: Add generic hook for arc=
hitectures to use before the final vmlinux link
  scripts/Makefile.vmlinux  # 1198c9c689cf kbuild: Add generic hook for arc=
hitectures to use before the final vmlinux link
  scripts/link-vmlinux.sh   # 1198c9c689cf kbuild: Add generic hook for arc=
hitectures to use before the final vmlinux link
  samples/ftrace/*          # 71db948b9d27 samples/ftrace: Add support for =
ftrace direct samples on powerpc
  drivers/cpufreq/*         # fae2987e6778 cpufreq: maple: Remove maple dri=
ver
  drivers/edac/*            # 3c592ce7991c EDAC/powerpc: Remove PPC_MAPLE d=
rivers


The following changes since commit 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b:

  Linux 6.12-rc2 (2024-10-06 15:32:27 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-6.13-1

for you to fetch changes up to 3c592ce7991cdf03bc7d139d790ce58c82c5903b:

  EDAC/powerpc: Remove PPC_MAPLE drivers (2024-11-19 16:41:16 +1100)

- ------------------------------------------------------------------
powerpc updates for 6.13

 - Rework kfence support for the HPT MMU to work on systems with >=3D 16TB =
of RAM.

 - Remove the powerpc "maple" platform, used by the "Yellow Dog Powerstatio=
n".

 - Add support for DYNAMIC_FTRACE_WITH_CALL_OPS,
   DYNAMIC_FTRACE_WITH_DIRECT_CALLS & BPF Trampolines.

 - Add support for running KVM nested guests on Power11.

 - Other small features, cleanups and fixes.

Thanks to: Amit Machhiwal, Arnd Bergmann, Christophe Leroy, Costa Shulyupin,
David Hunter, David Wang, Disha Goel, Gautam Menghani, Geert Uytterhoeven,
Hari Bathini, Julia Lawall, Kajol Jain, Keith Packard, Lukas Bulwahn, Madha=
van
Srinivasan, Markus Elfring, Michal Suchanek, Ming Lei, Mukesh Kumar Chauras=
iya,
Nathan Chancellor, Naveen N Rao, Nicholas Piggin, Nysal Jan K.A, Paulo Migu=
el
Almeida, Pavithra Prakash, Ritesh Harjani (IBM), Rob Herring (Arm), Sachin P
Bappalige, Shen Lichuan, Simon Horman, Sourabh Jain, Thomas Wei=C3=9Fschuh,=
 Thorsten
Blum, Thorsten Leemhuis, Venkat Rao Bagalkote, Zhang Zekun,
zhang jiao.

- ------------------------------------------------------------------
Amit Machhiwal (1):
      KVM: PPC: Book3S HV: Add Power11 capability support for Nested PAPR g=
uests

Arnd Bergmann (1):
      powerpc/Makefile: Allow overriding CPP

Christophe Leroy (4):
      powerpc/vdso: Add a page for non-time data
      powerpc/vdso: Implement __arch_get_vdso_rng_data()
      powerpc/vdso: Flag VDSO64 entry points as functions
      powerpc: Add __must_check to set_memory_...()

Costa Shulyupin (1):
      powerpc/xive: Use cpumask_intersects()

David Hunter (1):
      powerpc-km82xx.c: replace of_node_put() with __free

David Wang (1):
      powerpc/irq: use seq_put_decimal_ull_width() for decimal values

Gautam Menghani (4):
      powerpc/pseries: Fix KVM guest detection for disabling hardlockup det=
ector
      Revert "KVM: PPC: Book3S HV Nested: Stop forwarding all HFUs to L1"
      KVM: PPC: Book3S HV: Stop using vc->dpdes for nested KVM guests
      KVM: PPC: Book3S HV: Avoid returning to nested hypervisor on pending =
doorbells

Geert Uytterhoeven (1):
      powerpc/ps3: Mark ps3_setup_uhc_device() __init

Hari Bathini (1):
      powerpc/fadump: allocate memory for additional parameters early

Julia Lawall (2):
      KVM: PPC: replace call_rcu by kfree_rcu for simple kmem_cache_free ca=
llback
      powerpc/ps3: Reorganize kerneldoc parameter names

Kajol Jain (5):
      KVM: PPC: Book3S HV: Fix kmv -> kvm typo
      powerpc/perf: Add perf interface to expose vpa counters
      docs: ABI: sysfs-bus-event_source-devices-vpa-pmu: Document sysfs eve=
nt format entries for vpa_pmu
      powerpc/kvm: Add vpa latency counters to kvm_vcpu_arch
      powerpc/perf: Add per-task/process monitoring to vpa_pmu driver

Lukas Bulwahn (1):
      powerpc: remove dead config options for MPC85xx platform support

Markus Elfring (2):
      powerpc/powermac: Use of_property_match_string() in pmac_has_backligh=
t_type()
      macintosh: Use common error handling code in via_pmu_led_init()

Michael Ellerman (19):
      Merge branch 'topic/vdso' into next
      powerpc/64: Drop IPI_PRIORITY from asm-offsets
      powerpc/machdep: Drop include of seq_file.h
      powerpc/machdep: Drop include of dma-mapping.h
      powerpc/pseries: Fix dtl_access_lock to be a rw_semaphore
      powerpc/boot: Remove bogus reference to lilo
      powerpc/64: Remove maple platform
      powerpc/modules: start/end_opd are only needed for ABI v1
      selftests/powerpc: Lower run time of count_stcx_fail test
      selftests/powerpc: Give all tests 2 minutes timeout
      selftests/powerpc: Fix 32-bit BE build errors on Ubuntu 24.04
      selftests/powerpc: Return errors from all tests
      selftests/powerpc: Detect taint change in mitigation patching test
      powerpc/ftrace: Fix ftrace bug with KASAN=3Dy
      cpufreq: maple: Remove maple driver
      powerpc/cell: Remove dead extern declaration for spu_priv1_beat_ops
      MAINTAINERS: powerpc: Mark Maddy as "M"
      Merge branch 'topic/ppc-kvm' into next
      EDAC/powerpc: Remove PPC_MAPLE drivers

Michal Suchanek (1):
      powerpc/sstep: make emulate_vsx_load and emulate_vsx_store static

Mukesh Kumar Chaurasiya (1):
      powerpc/xmon: symbol lookup length fixed

Nathan Chancellor (3):
      powerpc: Fix stack protector Kconfig test for clang
      powerpc: Adjust adding stack protector flags to KBUILD_CLAGS for clang
      powerpc/vdso: Drop -mstack-protector-guard flags in 32-bit files with=
 clang

Naveen N Rao (17):
      powerpc/trace: Account for -fpatchable-function-entry support by tool=
chain
      powerpc/kprobes: Use ftrace to determine if a probe is at function en=
try
      powerpc64/ftrace: Nop out additional 'std' instruction emitted by gcc=
 v5.x
      powerpc32/ftrace: Unify 32-bit and 64-bit ftrace entry code
      powerpc/module_64: Convert #ifdef to IS_ENABLED()
      powerpc/ftrace: Remove pointer to struct module from dyn_arch_ftrace
      powerpc/ftrace: Skip instruction patching if the instructions are the=
 same
      powerpc/ftrace: Move ftrace stub used for init text before _einittext
      powerpc64/bpf: Fold bpf_jit_emit_func_call_hlp() into bpf_jit_emit_fu=
nc_call_rel()
      powerpc/ftrace: Add a postlink script to validate function tracer
      kbuild: Add generic hook for architectures to use before the final vm=
linux link
      powerpc64/ftrace: Move ftrace sequence out of line
      powerpc64/ftrace: Support .text larger than 32MB with out-of-line stu=
bs
      powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_CALL_OPS
      powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_DIRECT_CALLS
      samples/ftrace: Add support for ftrace direct samples on powerpc
      powerpc64/bpf: Add support for bpf trampolines

Paulo Miguel Almeida (1):
      powerpc/ps3: replace open-coded sysfs_emit function

Ritesh Harjani (IBM) (15):
      powerpc/fadump: Refactor and prepare fadump_cma_init for late init
      powerpc/fadump: Reserve page-aligned boot_memory_size during fadump_r=
eserve_mem
      powerpc/fadump: Move fadump_cma_init to setup_arch() after initmem_in=
it()
      powerpc/mm/fault: Fix kfence page fault reporting
      book3s64/hash: Remove kfence support temporarily
      book3s64/hash: Refactor kernel linear map related calls
      book3s64/hash: Add hash_debug_pagealloc_add_slot() function
      book3s64/hash: Add hash_debug_pagealloc_alloc_slots() function
      book3s64/hash: Refactor hash__kernel_map_pages() function
      book3s64/hash: Make kernel_map_linear_page() generic
      book3s64/hash: Disable debug_pagealloc if it requires more memory
      book3s64/hash: Add kfence functionality
      book3s64/radix: Refactoring common kfence related functions
      book3s64/hash: Disable kfence if not early init
      book3s64/hash: Early detect debug_pagealloc size requirement

Rob Herring (Arm) (2):
      powerpc/44x: Use for_each_of_range() iterator
      powerpc/cell: Use for_each_of_range() iterator

Shen Lichuan (1):
      ps3: Correct some typos in comments

Simon Horman (1):
      powerpc/ep8248e: Use %pa to format resource_size_t

Sourabh Jain (1):
      fadump: reserve param area if below boot_mem_top

Thomas Wei=C3=9Fschuh (1):
      powerpc/vdso: Remove unused clockmode asm offsets

Thorsten Blum (1):
      powerpc: Use str_enabled_disabled() helper function

Zhang Zekun (1):
      powerpc/kexec: Fix return of uninitialized variable

zhang jiao (1):
      selftests/powerpc: Remove the path after initialization.


 Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-pmu |  24 +
 Documentation/arch/powerpc/booting.rst                           |   4 +-
 MAINTAINERS                                                      |   2 +-
 arch/Kconfig                                                     |   6 +
 arch/powerpc/Kbuild                                              |   2 +-
 arch/powerpc/Kconfig                                             |  26 +-
 arch/powerpc/Kconfig.debug                                       |   6 -
 arch/powerpc/Makefile                                            |  30 +-
 arch/powerpc/Makefile.postlink                                   |   8 +
 arch/powerpc/boot/.gitignore                                     |   1 -
 arch/powerpc/boot/Makefile                                       |   3 +-
 arch/powerpc/boot/wrapper                                        |   7 +-
 arch/powerpc/configs/maple_defconfig                             | 111 ---
 arch/powerpc/configs/ppc64_defconfig                             |   1 -
 arch/powerpc/include/asm/cputable.h                              |  11 +-
 arch/powerpc/include/asm/dtl.h                                   |   4 +-
 arch/powerpc/include/asm/fadump.h                                |   9 +
 arch/powerpc/include/asm/ftrace.h                                |  33 +-
 arch/powerpc/include/asm/hvcall.h                                |   1 +
 arch/powerpc/include/asm/kfence.h                                |   8 +-
 arch/powerpc/include/asm/kvm_book3s_64.h                         |  10 +-
 arch/powerpc/include/asm/kvm_host.h                              |   5 +
 arch/powerpc/include/asm/machdep.h                               |   8 +-
 arch/powerpc/include/asm/module.h                                |   7 +
 arch/powerpc/include/asm/ppc-opcode.h                            |  14 +
 arch/powerpc/include/asm/set_memory.h                            |  14 +-
 arch/powerpc/include/asm/spu_priv1.h                             |   1 -
 arch/powerpc/include/asm/sstep.h                                 |   5 -
 arch/powerpc/include/asm/udbg.h                                  |   1 -
 arch/powerpc/include/asm/vdso.h                                  |   1 +
 arch/powerpc/include/asm/vdso/getrandom.h                        |  16 +-
 arch/powerpc/include/asm/vdso_datapage.h                         |  24 +-
 arch/powerpc/kernel/asm-offsets.c                                |  15 +-
 arch/powerpc/kernel/fadump.c                                     |  72 +-
 arch/powerpc/kernel/irq.c                                        |  44 +-
 arch/powerpc/kernel/kprobes.c                                    |  18 +-
 arch/powerpc/kernel/misc_64.S                                    |   8 +-
 arch/powerpc/kernel/module_64.c                                  |  66 +-
 arch/powerpc/kernel/prom.c                                       |   3 +
 arch/powerpc/kernel/prom_init.c                                  |  86 --
 arch/powerpc/kernel/secure_boot.c                                |   5 +-
 arch/powerpc/kernel/setup-common.c                               |   6 +-
 arch/powerpc/kernel/setup_64.c                                   |   1 +
 arch/powerpc/kernel/sysfs.c                                      |   1 +
 arch/powerpc/kernel/trace/Makefile                               |  11 +-
 arch/powerpc/kernel/trace/ftrace.c                               | 298 +++=
+++-
 arch/powerpc/kernel/trace/ftrace_64_pg.c                         |  69 +-
 arch/powerpc/kernel/trace/ftrace_entry.S                         | 244 +++=
+--
 arch/powerpc/kernel/udbg.c                                       |   3 -
 arch/powerpc/kernel/udbg_16550.c                                 |  23 -
 arch/powerpc/kernel/vdso.c                                       |  16 +-
 arch/powerpc/kernel/vdso/Makefile                                |  10 +-
 arch/powerpc/kernel/vdso/cacheflush.S                            |   2 +-
 arch/powerpc/kernel/vdso/datapage.S                              |   4 +-
 arch/powerpc/kernel/vdso/getrandom.S                             |   2 -
 arch/powerpc/kernel/vdso/gettimeofday.S                          |   5 +-
 arch/powerpc/kernel/vdso/vdso32.lds.S                            |   2 +-
 arch/powerpc/kernel/vdso/vdso64.lds.S                            |   2 +-
 arch/powerpc/kernel/vdso/vgetrandom.c                            |   4 +-
 arch/powerpc/kernel/vmlinux.lds.S                                |   3 +-
 arch/powerpc/kexec/file_load_64.c                                |   9 +-
 arch/powerpc/kvm/book3s_hv.c                                     | 119 ++-
 arch/powerpc/kvm/book3s_hv_nested.c                              |  16 +-
 arch/powerpc/kvm/book3s_hv_nestedv2.c                            |   4 +-
 arch/powerpc/kvm/book3s_mmu_hpte.c                               |   8 +-
 arch/powerpc/kvm/trace_hv.h                                      |   2 +-
 arch/powerpc/lib/sstep.c                                         |  12 +-
 arch/powerpc/mm/book3s64/hash_utils.c                            | 364 +++=
+++---
 arch/powerpc/mm/book3s64/pgtable.c                               |  13 +
 arch/powerpc/mm/book3s64/radix_pgtable.c                         |  12 -
 arch/powerpc/mm/fault.c                                          |  10 +-
 arch/powerpc/mm/init-common.c                                    |   1 +
 arch/powerpc/net/bpf_jit.h                                       |  17 +
 arch/powerpc/net/bpf_jit_comp.c                                  | 847 +++=
++++++++++++++++-
 arch/powerpc/net/bpf_jit_comp32.c                                |   7 +-
 arch/powerpc/net/bpf_jit_comp64.c                                |  72 +-
 arch/powerpc/perf/Makefile                                       |   2 +
 arch/powerpc/perf/vpa-pmu.c                                      | 203 +++=
++
 arch/powerpc/platforms/44x/pci.c                                 |  23 +-
 arch/powerpc/platforms/52xx/efika.c                              |   1 +
 arch/powerpc/platforms/82xx/ep8248e.c                            |   2 +-
 arch/powerpc/platforms/82xx/km82xx.c                             |   6 +-
 arch/powerpc/platforms/85xx/Kconfig                              |  21 -
 arch/powerpc/platforms/Kconfig                                   |   1 -
 arch/powerpc/platforms/Makefile                                  |   1 -
 arch/powerpc/platforms/cell/iommu.c                              |  49 +-
 arch/powerpc/platforms/embedded6xx/linkstation.c                 |   1 +
 arch/powerpc/platforms/embedded6xx/mvme5100.c                    |   1 +
 arch/powerpc/platforms/maple/Kconfig                             |  19 -
 arch/powerpc/platforms/maple/maple.h                             |  14 -
 arch/powerpc/platforms/maple/pci.c                               | 672 ---=
-------------
 arch/powerpc/platforms/maple/setup.c                             | 363 ---=
------
 arch/powerpc/platforms/maple/time.c                              | 170 ----
 arch/powerpc/platforms/powermac/backlight.c                      |  14 +-
 arch/powerpc/platforms/ps3/device-init.c                         |   2 +-
 arch/powerpc/platforms/ps3/interrupt.c                           |   2 +-
 arch/powerpc/platforms/ps3/repository.c                          |   2 +-
 arch/powerpc/platforms/ps3/system-bus.c                          |   5 +-
 arch/powerpc/platforms/pseries/Kconfig                           |  14 +
 arch/powerpc/platforms/pseries/dtl.c                             |   8 +-
 arch/powerpc/platforms/pseries/lpar.c                            |   9 +-
 arch/powerpc/platforms/pseries/msi.c                             |   1 +
 arch/powerpc/platforms/pseries/papr_scm.c                        |   1 +
 arch/powerpc/platforms/pseries/svm.c                             |   1 +
 arch/powerpc/sysdev/xive/common.c                                |   2 +-
 arch/powerpc/sysdev/xive/spapr.c                                 |   1 +
 arch/powerpc/{platforms/maple/Makefile =3D> tools/.gitignore}      |   2 +-
 arch/powerpc/tools/Makefile                                      |  10 +
 arch/powerpc/tools/ftrace-gen-ool-stubs.sh                       |  52 ++
 arch/powerpc/tools/ftrace_check.sh                               |  50 ++
 arch/powerpc/xmon/xmon.c                                         |   6 +-
 drivers/cpufreq/Kconfig.powerpc                                  |   7 -
 drivers/cpufreq/Makefile                                         |   1 -
 drivers/cpufreq/maple-cpufreq.c                                  | 242 ---=
---
 drivers/cpuidle/cpuidle-pseries.c                                |   1 +
 drivers/edac/Kconfig                                             |  18 -
 drivers/edac/Makefile                                            |   2 -
 drivers/edac/amd8111_edac.c                                      | 596 ---=
-----------
 drivers/edac/amd8111_edac.h                                      | 118 ---
 drivers/edac/amd8131_edac.c                                      | 358 ---=
------
 drivers/edac/amd8131_edac.h                                      | 107 ---
 drivers/macintosh/via-pmu-led.c                                  |  19 +-
 drivers/ps3/ps3-lpm.c                                            |   2 +-
 drivers/ps3/ps3-sys-manager.c                                    |   2 +-
 drivers/ps3/ps3-vuart.c                                          |   4 +-
 drivers/ps3/sys-manager-core.c                                   |   2 +-
 samples/ftrace/ftrace-direct-modify.c                            |  85 +-
 samples/ftrace/ftrace-direct-multi-modify.c                      | 101 ++-
 samples/ftrace/ftrace-direct-multi.c                             |  79 +-
 samples/ftrace/ftrace-direct-too.c                               |  83 +-
 samples/ftrace/ftrace-direct.c                                   |  69 +-
 scripts/Makefile.vmlinux                                         |   7 +
 scripts/link-vmlinux.sh                                          |   7 +-
 tools/testing/selftests/powerpc/alignment/settings               |   1 +
 tools/testing/selftests/powerpc/cache_shape/settings             |   1 +
 tools/testing/selftests/powerpc/copyloops/settings               |   1 +
 tools/testing/selftests/powerpc/dexcr/settings                   |   1 +
 tools/testing/selftests/powerpc/dscr/settings                    |   1 +
 tools/testing/selftests/powerpc/lib/settings                     |   1 +
 tools/testing/selftests/powerpc/math/settings                    |   1 +
 tools/testing/selftests/powerpc/mce/settings                     |   1 +
 tools/testing/selftests/powerpc/mm/settings                      |   1 +
 tools/testing/selftests/powerpc/mm/stack_expansion_ldst.c        |   2 +-
 tools/testing/selftests/powerpc/mm/subpage_prot.c                |   4 +-
 tools/testing/selftests/powerpc/mm/tlbie_test.c                  |  10 +-
 tools/testing/selftests/powerpc/nx-gzip/settings                 |   1 +
 tools/testing/selftests/powerpc/papr_attributes/settings         |   1 +
 tools/testing/selftests/powerpc/papr_sysparm/settings            |   1 +
 tools/testing/selftests/powerpc/papr_vpd/settings                |   1 +
 tools/testing/selftests/powerpc/pmu/count_stcx_fail.c            |   3 -
 tools/testing/selftests/powerpc/pmu/settings                     |   1 +
 tools/testing/selftests/powerpc/primitives/settings              |   1 +
 tools/testing/selftests/powerpc/ptrace/settings                  |   1 +
 tools/testing/selftests/powerpc/scripts/settings                 |   1 +
 tools/testing/selftests/powerpc/security/mitigation-patching.sh  |   8 +-
 tools/testing/selftests/powerpc/security/settings                |   1 +
 tools/testing/selftests/powerpc/signal/sigfuz.c                  |   2 +-
 tools/testing/selftests/powerpc/stringloops/settings             |   1 +
 tools/testing/selftests/powerpc/switch_endian/settings           |   1 +
 tools/testing/selftests/powerpc/syscalls/settings                |   1 +
 tools/testing/selftests/powerpc/tm/tm-signal-context-force-tm.c  |   2 +-
 tools/testing/selftests/powerpc/tm/tm-signal-sigreturn-nt.c      |   3 +-
 tools/testing/selftests/powerpc/vphn/settings                    |   1 +
 tools/testing/selftests/vDSO/parse_vdso.c                        |   3 +-
 164 files changed, 3056 insertions(+), 3583 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-event_source-device=
s-vpa-pmu
 delete mode 100644 arch/powerpc/configs/maple_defconfig
 create mode 100644 arch/powerpc/perf/vpa-pmu.c
 delete mode 100644 arch/powerpc/platforms/maple/Kconfig
 delete mode 100644 arch/powerpc/platforms/maple/maple.h
 delete mode 100644 arch/powerpc/platforms/maple/pci.c
 delete mode 100644 arch/powerpc/platforms/maple/setup.c
 delete mode 100644 arch/powerpc/platforms/maple/time.c
 rename arch/powerpc/{platforms/maple/Makefile =3D> tools/.gitignore} (57%)
 create mode 100644 arch/powerpc/tools/Makefile
 create mode 100755 arch/powerpc/tools/ftrace-gen-ool-stubs.sh
 create mode 100755 arch/powerpc/tools/ftrace_check.sh
 delete mode 100644 drivers/cpufreq/maple-cpufreq.c
 delete mode 100644 drivers/edac/amd8111_edac.c
 delete mode 100644 drivers/edac/amd8111_edac.h
 delete mode 100644 drivers/edac/amd8131_edac.c
 delete mode 100644 drivers/edac/amd8131_edac.h
 create mode 100644 tools/testing/selftests/powerpc/alignment/settings
 create mode 100644 tools/testing/selftests/powerpc/cache_shape/settings
 create mode 100644 tools/testing/selftests/powerpc/copyloops/settings
 create mode 100644 tools/testing/selftests/powerpc/dexcr/settings
 create mode 100644 tools/testing/selftests/powerpc/dscr/settings
 create mode 100644 tools/testing/selftests/powerpc/lib/settings
 create mode 100644 tools/testing/selftests/powerpc/math/settings
 create mode 100644 tools/testing/selftests/powerpc/mce/settings
 create mode 100644 tools/testing/selftests/powerpc/mm/settings
 create mode 100644 tools/testing/selftests/powerpc/nx-gzip/settings
 create mode 100644 tools/testing/selftests/powerpc/papr_attributes/settings
 create mode 100644 tools/testing/selftests/powerpc/papr_sysparm/settings
 create mode 100644 tools/testing/selftests/powerpc/papr_vpd/settings
 create mode 100644 tools/testing/selftests/powerpc/pmu/settings
 create mode 100644 tools/testing/selftests/powerpc/primitives/settings
 create mode 100644 tools/testing/selftests/powerpc/ptrace/settings
 create mode 100644 tools/testing/selftests/powerpc/scripts/settings
 create mode 100644 tools/testing/selftests/powerpc/security/settings
 create mode 100644 tools/testing/selftests/powerpc/stringloops/settings
 create mode 100644 tools/testing/selftests/powerpc/switch_endian/settings
 create mode 100644 tools/testing/selftests/powerpc/syscalls/settings
 create mode 100644 tools/testing/selftests/powerpc/vphn/settings
-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRjvi15rv0TSTaE+SIF0oADX8seIQUCZ0Fq2wAKCRAF0oADX8se
ISKLAQCQ3plGBrp582EJ6Aw7ZxHe4pP11vkgG8h5DvN7y8RB9AEAln3n/tKyeVl3
OekFVBgIMEFByrT6gRckukCbbib50QY=3D
=3DJvUC
-----END PGP SIGNATURE-----

