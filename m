Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 968FA93090D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 10:29:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l9eji2i0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMJR139Mqz3cXy
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 18:29:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l9eji2i0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WMJQK6kTHz30T6
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2024 18:28:57 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EEA32CE028A;
	Sun, 14 Jul 2024 08:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83F1DC116B1;
	Sun, 14 Jul 2024 08:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720945734;
	bh=qxzGnovbe3DGz52bIjhuany+pekl+uhzWVtTS59g6hQ=;
	h=From:To:Cc:Subject:Date:From;
	b=l9eji2i0bCnZkeyHSVlHXp/SbNc7N+HA/px/f7JgMf5fE0sCTryHD84Ehqi2pGLko
	 eHSNHop5xe3GWNMkzlu692pXt1mVILqhUz9k4YZSRTZlS1rvzajx6q4YtRcJW0NoIk
	 cJ2Wykhki3hM45tIPMRo5l3sE9auposDMHxNhPg7YP3mN2ZQPKZ1cPYzkDIAbAPEfR
	 lNgdYjLrszRJLUcz9Zzoi/ro/AC1O6M7gNwJURHSd7VMcsJJLZbxH8ilxHgYih11y6
	 3nGmFca/rd+Y5c8HflEv4ciSDag9/Jo43Hx1XeZVyBpfx2iWLz2rtNS65aWC7vZQvO
	 GxYNUil7UuzSw==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>,
	<linux-trace-kernel@vger.kernel.org>,
	<bpf@vger.kernel.org>,
	linux-kbuild@vger.kernel.org,
	<linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v4 00/17] powerpc: Core ftrace rework, support for ftrace direct and bpf trampolines
Date: Sun, 14 Jul 2024 13:57:36 +0530
Message-ID: <cover.1720942106.git.naveen@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Daniel Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Andrii Nakryiko <andrii@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Vishal Chourasia <vishalc@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is v4 of the series posted here:
http://lkml.kernel.org/r/cover.1718908016.git.naveen@kernel.org

This series reworks core ftrace support on powerpc to have the function 
profiling sequence moved out of line. This enables us to have a single 
nop at kernel function entry virtually eliminating effect of the 
function tracer when it is not enabled. The function profile sequence is 
moved out of line and is allocated at two separate places depending on a 
new config option.

For 64-bit powerpc, the function profiling sequence is also updated to 
include an additional instruction 'mtlr r0' after the usual 
two-instruction sequence to fix link stack imbalance (return address 
predictor) when ftrace is enabled. This showed an improvement of ~22% in 
null_syscall benchmark on a Power 10 system with ftrace enabled.

Finally, support for ftrace direct calls is added based on support for
DYNAMIC_FTRACE_WITH_CALL_OPS. BPF Trampoline support is added atop this.

Support for ftrace direct calls is added for 32-bit powerpc. There is 
some code to enable bpf trampolines for 32-bit powerpc, but it is not 
complete and will need to be pursued separately.

This is marked RFC so that this can get more testing. Patches 1 to 10 
are independent of this series and can go in separately though. Rest of 
the patches depend on the series from Benjamin Gray adding support for 
patch_uint() and patch_ulong():
http://lkml.kernel.org/r/20240515024445.236364-1-bgray@linux.ibm.com


Changelog v4:
- Patches 1, 10 and 13 are new.
- Address review comments from Nick. Numerous changes throughout the 
  patch series.
- Extend support for ftrace ool to vmlinux text up to 64MB (patch 13).
- Address remaining TODOs in support for BPF Trampolines.
- Update synchronization when patching instructions during trampoline 
  attach/detach.


- Naveen


Naveen N Rao (17):
  powerpc/trace: Account for -fpatchable-function-entry support by
    toolchain
  powerpc/kprobes: Use ftrace to determine if a probe is at function
    entry
  powerpc64/ftrace: Nop out additional 'std' instruction emitted by gcc
    v5.x
  powerpc32/ftrace: Unify 32-bit and 64-bit ftrace entry code
  powerpc/module_64: Convert #ifdef to IS_ENABLED()
  powerpc/ftrace: Remove pointer to struct module from dyn_arch_ftrace
  powerpc/ftrace: Skip instruction patching if the instructions are the
    same
  powerpc/ftrace: Move ftrace stub used for init text before _einittext
  powerpc64/bpf: Fold bpf_jit_emit_func_call_hlp() into
    bpf_jit_emit_func_call_rel()
  powerpc/ftrace: Add a postlink script to validate function tracer
  kbuild: Add generic hook for architectures to use before the final
    vmlinux link
  powerpc64/ftrace: Move ftrace sequence out of line
  powerpc64/ftrace: Support .text larger than 32MB with out-of-line
    stubs
  powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_CALL_OPS
  powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_DIRECT_CALLS
  samples/ftrace: Add support for ftrace direct samples on powerpc
  powerpc64/bpf: Add support for bpf trampolines

 arch/Kconfig                                |   6 +
 arch/powerpc/Kconfig                        |  23 +-
 arch/powerpc/Makefile                       |   8 +
 arch/powerpc/Makefile.postlink              |   8 +
 arch/powerpc/include/asm/ftrace.h           |  32 +-
 arch/powerpc/include/asm/module.h           |   5 +
 arch/powerpc/include/asm/ppc-opcode.h       |  14 +
 arch/powerpc/kernel/asm-offsets.c           |  11 +
 arch/powerpc/kernel/kprobes.c               |  18 +-
 arch/powerpc/kernel/module_64.c             |  66 +-
 arch/powerpc/kernel/trace/Makefile          |  11 +-
 arch/powerpc/kernel/trace/ftrace.c          | 295 ++++++-
 arch/powerpc/kernel/trace/ftrace_64_pg.c    |  69 +-
 arch/powerpc/kernel/trace/ftrace_entry.S    | 246 ++++--
 arch/powerpc/kernel/vmlinux.lds.S           |   3 +-
 arch/powerpc/net/bpf_jit.h                  |  12 +
 arch/powerpc/net/bpf_jit_comp.c             | 842 +++++++++++++++++++-
 arch/powerpc/net/bpf_jit_comp32.c           |   7 +-
 arch/powerpc/net/bpf_jit_comp64.c           |  68 +-
 arch/powerpc/tools/Makefile                 |  10 +
 arch/powerpc/tools/ftrace-gen-ool-stubs.sh  |  52 ++
 arch/powerpc/tools/ftrace_check.sh          |  45 ++
 samples/ftrace/ftrace-direct-modify.c       |  85 +-
 samples/ftrace/ftrace-direct-multi-modify.c | 101 ++-
 samples/ftrace/ftrace-direct-multi.c        |  79 +-
 samples/ftrace/ftrace-direct-too.c          |  83 +-
 samples/ftrace/ftrace-direct.c              |  69 +-
 scripts/Makefile.vmlinux                    |   8 +
 scripts/link-vmlinux.sh                     |  11 +-
 29 files changed, 2083 insertions(+), 204 deletions(-)
 create mode 100644 arch/powerpc/tools/Makefile
 create mode 100755 arch/powerpc/tools/ftrace-gen-ool-stubs.sh
 create mode 100755 arch/powerpc/tools/ftrace_check.sh


base-commit: 582b0e554593e530b1386eacafee6c412c5673cc
prerequisite-patch-id: a1d50e589288239d5a8b1c1f354cd4737057c9d3
prerequisite-patch-id: da4142d56880861bd0ad7ad7087c9e2670a2ee54
prerequisite-patch-id: 609d292e054b2396b603890522a940fa0bdfb6d8
prerequisite-patch-id: 6f7213fb77b1260defbf43be0e47bff9c80054cc
prerequisite-patch-id: ad3b71bf071ae4ba1bee5b087e61a2055772a74f
-- 
2.45.2

