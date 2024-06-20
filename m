Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1339111A3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 20:58:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vQRI90gx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4qWF3xrVz3cTc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 04:58:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vQRI90gx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4qVV2B9Jz3bqB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 04:57:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A7381CE2646;
	Thu, 20 Jun 2024 18:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC1AC2BD10;
	Thu, 20 Jun 2024 18:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718909838;
	bh=0nrN+oIc4sLMs0HNchgdz1IvGpOv0OVXQS/bQIadZQM=;
	h=From:To:Cc:Subject:Date:From;
	b=vQRI90gxFnkz9q3F1uLt0YM/SGrgfXK7OBl6Iodsu1iPSMtejIRuZgQGcKAMotSOj
	 z06K8PmZ5t/qxDgGK9XGz05lMvDlxIpt0qABsY+jIAnv6brReu2WsEBlWgbzMDpoVm
	 ZSk7YiZeR5/g8ZUqNEriOfB2zuEckdtF3oe9TK57tH5feg2BZkjxlhMXEt7xb0aCtl
	 AgnzrXHX10ac9VFVoP/dhX74RCySCb5T/anOCm25wrT6uLN2IeKchfHv1EiBRnx04W
	 AfLeLxEbeO2WtcWmXLRe/mxsGm8NQzktVs5Y0R12btt+Ge4b7b1Q5jlCT6B0N/HnJ3
	 Nug0BXp20eV6Q==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>,
	<linux-trace-kernel@vger.kernel.org>,
	<bpf@vger.kernel.org>
Subject: [RFC PATCH v3 00/11] powerpc: Add support for ftrace direct and BPF trampolines
Date: Fri, 21 Jun 2024 00:24:03 +0530
Message-ID: <cover.1718908016.git.naveen@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Daniel Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Andrii Nakryiko <andrii@kernel.org>, Song Liu <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Nicholas Piggin <npiggin@gmail.com>, Jiri Olsa <jolsa@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is v3 of the patches posted here:
http://lkml.kernel.org/r/cover.1718008093.git.naveen@kernel.org

Since v2, I have addressed review comments from Steven and Masahiro 
along with a few fixes. Patches 7-11 are new in this series and add 
support for ftrace direct and bpf trampolines. 

This series depends on the patch series from Benjamin Gray adding 
support for patch_ulong():
http://lkml.kernel.org/r/20240515024445.236364-1-bgray@linux.ibm.com


- Naveen


Naveen N Rao (11):
  powerpc/kprobes: Use ftrace to determine if a probe is at function
    entry
  powerpc/ftrace: Unify 32-bit and 64-bit ftrace entry code
  powerpc/module_64: Convert #ifdef to IS_ENABLED()
  powerpc/ftrace: Remove pointer to struct module from dyn_arch_ftrace
  kbuild: Add generic hook for architectures to use before the final
    vmlinux link
  powerpc64/ftrace: Move ftrace sequence out of line
  powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_CALL_OPS
  powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_DIRECT_CALLS
  samples/ftrace: Add support for ftrace direct samples on powerpc
  powerpc64/bpf: Fold bpf_jit_emit_func_call_hlp() into
    bpf_jit_emit_func_call_rel()
  powerpc64/bpf: Add support for bpf trampolines

 arch/Kconfig                                |   3 +
 arch/powerpc/Kconfig                        |   9 +
 arch/powerpc/Makefile                       |   8 +
 arch/powerpc/include/asm/ftrace.h           |  29 +-
 arch/powerpc/include/asm/module.h           |   5 +
 arch/powerpc/include/asm/ppc-opcode.h       |  14 +
 arch/powerpc/kernel/asm-offsets.c           |  11 +
 arch/powerpc/kernel/kprobes.c               |  18 +-
 arch/powerpc/kernel/module_64.c             |  67 +-
 arch/powerpc/kernel/trace/ftrace.c          | 269 +++++++-
 arch/powerpc/kernel/trace/ftrace_64_pg.c    |  73 +-
 arch/powerpc/kernel/trace/ftrace_entry.S    | 210 ++++--
 arch/powerpc/kernel/vmlinux.lds.S           |   3 +-
 arch/powerpc/net/bpf_jit.h                  |  11 +
 arch/powerpc/net/bpf_jit_comp.c             | 702 +++++++++++++++++++-
 arch/powerpc/net/bpf_jit_comp32.c           |   7 +-
 arch/powerpc/net/bpf_jit_comp64.c           |  68 +-
 arch/powerpc/tools/Makefile                 |  10 +
 arch/powerpc/tools/gen-ftrace-pfe-stubs.sh  |  49 ++
 samples/ftrace/ftrace-direct-modify.c       |  85 ++-
 samples/ftrace/ftrace-direct-multi-modify.c | 101 ++-
 samples/ftrace/ftrace-direct-multi.c        |  79 ++-
 samples/ftrace/ftrace-direct-too.c          |  83 ++-
 samples/ftrace/ftrace-direct.c              |  69 +-
 scripts/Makefile.vmlinux                    |   8 +
 scripts/link-vmlinux.sh                     |  11 +-
 26 files changed, 1813 insertions(+), 189 deletions(-)
 create mode 100644 arch/powerpc/tools/Makefile
 create mode 100755 arch/powerpc/tools/gen-ftrace-pfe-stubs.sh


base-commit: e2b06d707dd067509cdc9ceba783c06fa6a551c2
prerequisite-patch-id: a1d50e589288239d5a8b1c1f354cd4737057c9d3
prerequisite-patch-id: da4142d56880861bd0ad7ad7087c9e2670a2ee54
prerequisite-patch-id: 609d292e054b2396b603890522a940fa0bdfb6d8
prerequisite-patch-id: 6f7213fb77b1260defbf43be0e47bff9c80054cc
prerequisite-patch-id: ad3b71bf071ae4ba1bee5b087e61a2055772a74f
-- 
2.45.2

