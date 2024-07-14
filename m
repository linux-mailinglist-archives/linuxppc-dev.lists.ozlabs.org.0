Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B532C930915
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 10:30:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GUE1SjR6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMJRn3sMHz3dBm
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 18:30:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GUE1SjR6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WMJQQ38Y5z3d4L
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2024 18:29:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B401A60B33;
	Sun, 14 Jul 2024 08:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CADE4C116B1;
	Sun, 14 Jul 2024 08:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720945738;
	bh=OqYXQllYDdxc5CmUvaNfhz68rWXiRNRgAQYB5EiR7Zw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GUE1SjR6gGuw/Pmgslop0RoSjIpXNSvrLprVB3VTyh/3fBt1R8dK29bwvalj40aZS
	 HDXWO2ADhm+RrWBPOJfqVLMsAXZVqqGzaiw3x/R3J/lLOL3VgP4tkhvy6kbdFjuoTq
	 wzl+RGl/4ozFzzLB3FBmKAVemWyAm9xRiLUMhyv+ITRuQBqC/Gi0UQ4czuDZtUqcC9
	 zuL1gGZkMYofie0tY1QsgP5+SCzcVWWC3U+Wf36kQdh1WtsQRi8BtrifOj848mNFFT
	 GFVnuUpREpAGnnpCWhMcE06z7TV1wqGJiir5XxDgzViCXQEO5ywBrM+9s4Pb2/+WYR
	 Sxo0zhhqbK6eQ==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>,
	<linux-trace-kernel@vger.kernel.org>,
	<bpf@vger.kernel.org>,
	linux-kbuild@vger.kernel.org,
	<linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v4 11/17] kbuild: Add generic hook for architectures to use before the final vmlinux link
Date: Sun, 14 Jul 2024 13:57:47 +0530
Message-ID: <87b71debd931011f8b9204c700b3084a6c3cdab8.1720942106.git.naveen@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720942106.git.naveen@kernel.org>
References: <cover.1720942106.git.naveen@kernel.org>
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

On powerpc, we would like to be able to make a pass on vmlinux.o and
generate a new object file to be linked into vmlinux. Add a generic pass
in Makefile.vmlinux that architectures can use for this purpose.

Architectures need to select CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX and must
provide arch/<arch>/tools/Makefile with .arch.vmlinux.o target, which
will be invoked prior to the final vmlinux link step.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/Kconfig             |  6 ++++++
 scripts/Makefile.vmlinux |  8 ++++++++
 scripts/link-vmlinux.sh  | 11 ++++++++---
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 975dd22a2dbd..ef868ff8156a 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1643,4 +1643,10 @@ config CC_HAS_SANE_FUNCTION_ALIGNMENT
 config ARCH_NEED_CMPXCHG_1_EMU
 	bool
 
+config ARCH_WANTS_PRE_LINK_VMLINUX
+	def_bool n
+	help
+	  An architecture can select this if it provides arch/<arch>/tools/Makefile
+	  with .arch.vmlinux.o target to be linked into vmlinux.
+
 endmenu
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 49946cb96844..6410e0be7f52 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -22,6 +22,14 @@ targets += .vmlinux.export.o
 vmlinux: .vmlinux.export.o
 endif
 
+ifdef CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX
+targets += .arch.vmlinux.o
+.arch.vmlinux.o: vmlinux.o FORCE
+	$(Q)$(MAKE) $(build)=arch/$(SRCARCH)/tools .arch.vmlinux.o
+
+vmlinux: .arch.vmlinux.o
+endif
+
 ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
 
 # Final link of vmlinux with optional arch pass after final link
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 518c70b8db50..aafaed1412ea 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -122,7 +122,7 @@ gen_btf()
 		return 1
 	fi
 
-	vmlinux_link ${1}
+	vmlinux_link ${1} ${arch_vmlinux_o}
 
 	info "BTF" ${2}
 	LLVM_OBJCOPY="${OBJCOPY}" ${PAHOLE} -J ${PAHOLE_FLAGS} ${1}
@@ -178,7 +178,7 @@ kallsyms_step()
 	kallsymso=${kallsyms_vmlinux}.o
 	kallsyms_S=${kallsyms_vmlinux}.S
 
-	vmlinux_link ${kallsyms_vmlinux} "${kallsymso_prev}" ${btf_vmlinux_bin_o}
+	vmlinux_link ${kallsyms_vmlinux} "${kallsymso_prev}" ${btf_vmlinux_bin_o} ${arch_vmlinux_o}
 	mksysmap ${kallsyms_vmlinux} ${kallsyms_vmlinux}.syms
 	kallsyms ${kallsyms_vmlinux}.syms ${kallsyms_S}
 
@@ -223,6 +223,11 @@ fi
 
 ${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init init/version-timestamp.o
 
+arch_vmlinux_o=""
+if is_enabled CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX; then
+	arch_vmlinux_o=.arch.vmlinux.o
+fi
+
 btf_vmlinux_bin_o=""
 if is_enabled CONFIG_DEBUG_INFO_BTF; then
 	btf_vmlinux_bin_o=.btf.vmlinux.bin.o
@@ -273,7 +278,7 @@ if is_enabled CONFIG_KALLSYMS; then
 	fi
 fi
 
-vmlinux_link vmlinux "${kallsymso}" ${btf_vmlinux_bin_o}
+vmlinux_link vmlinux "${kallsymso}" ${btf_vmlinux_bin_o} ${arch_vmlinux_o}
 
 # fill in BTF IDs
 if is_enabled CONFIG_DEBUG_INFO_BTF && is_enabled CONFIG_BPF; then
-- 
2.45.2

