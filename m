Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8889901D2C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2024 10:42:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c90CNq2f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VyQKY3m5Bz3cW1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2024 18:42:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c90CNq2f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VyQGf1CkHz3cSn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2024 18:39:54 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 834A9CE10D1;
	Mon, 10 Jun 2024 08:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8C3C2BBFC;
	Mon, 10 Jun 2024 08:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718008792;
	bh=gy0DEacF9IVbj2ycNtWzyTb9pvGYzN2ome3vP/Gphqw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c90CNq2f619MxAUrMko68DMQiKqUcpDRhvoY1uzcccsAKh5uUKjym/OQFZF6lQWpi
	 a9PMVU+Cj1IaRB1+c/VqK1x0NyLmqNfI8rjF5lAm0tdDcLR6wzNDzVw6Bj7jw4F/Yk
	 +Z47SgtIPf/+6bfXRRy2OMAEQtmShYEzKqiwHTnc4yonOkhhla3euuvxPeJdV+NAJJ
	 aTCN5TVJlmm3PDILBYhvrpFJ593M4DU7bL1KiXVNDRV+Pm3rqG86d8cJAF8MvHNbj4
	 XWZGVRsv2fpIv593Y+BqB+8bIdedqHz6wQy5vwG3PEgrX1vIGjsvVVEUUuua5JIzla
	 ACjRiAZSjJPzg==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH v2 4/5] kbuild: Add generic hook for architectures to use before the final vmlinux link
Date: Mon, 10 Jun 2024 14:08:17 +0530
Message-ID: <a4f44ffeb6f0327639175f8aac61cd21bc23150b.1718008093.git.naveen@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1718008093.git.naveen@kernel.org>
References: <cover.1718008093.git.naveen@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <masahiroy@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Nicholas Piggin <npiggin@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On powerpc, we would like to be able to make a pass on vmlinux.o and
generate a new object file to be linked into vmlinux. Add a generic pass
in link-vmlinux.sh that architectures can use for this purpose.
Architectures need to select CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX and must
provide arch/<arch>/tools/vmlinux_o.sh, which will be invoked prior to
the final vmlinux link step.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/Kconfig            |  3 +++
 scripts/link-vmlinux.sh | 18 +++++++++++++++---
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 975dd22a2dbd..649f0903e7ef 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1643,4 +1643,7 @@ config CC_HAS_SANE_FUNCTION_ALIGNMENT
 config ARCH_NEED_CMPXCHG_1_EMU
 	bool
 
+config ARCH_WANTS_PRE_LINK_VMLINUX
+	def_bool n
+
 endmenu
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 46ce5d04dbeb..07f70e105d82 100755
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
 
@@ -203,6 +203,7 @@ sorttable()
 
 cleanup()
 {
+	rm -f .arch.vmlinux.*
 	rm -f .btf.*
 	rm -f System.map
 	rm -f vmlinux
@@ -223,6 +224,17 @@ fi
 
 ${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init init/version-timestamp.o
 
+arch_vmlinux_o=""
+if is_enabled CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX; then
+	arch_vmlinux_o=.arch.vmlinux.o
+	info "ARCH" ${arch_vmlinux_o}
+	if ! ${srctree}/arch/${SRCARCH}/tools/vmlinux_o.sh ${arch_vmlinux_o} ; then
+		echo >&2 "Failed to generate ${arch_vmlinux_o}"
+		echo >&2 "Try to disable CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX"
+		exit 1
+	fi
+fi
+
 btf_vmlinux_bin_o=""
 if is_enabled CONFIG_DEBUG_INFO_BTF; then
 	btf_vmlinux_bin_o=.btf.vmlinux.bin.o
@@ -273,7 +285,7 @@ if is_enabled CONFIG_KALLSYMS; then
 	fi
 fi
 
-vmlinux_link vmlinux "${kallsymso}" ${btf_vmlinux_bin_o}
+vmlinux_link vmlinux "${kallsymso}" ${btf_vmlinux_bin_o} ${arch_vmlinux_o}
 
 # fill in BTF IDs
 if is_enabled CONFIG_DEBUG_INFO_BTF && is_enabled CONFIG_BPF; then
-- 
2.45.2

