Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EF82D8867
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Dec 2020 17:57:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CtYjd5G6pzDqcm
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Dec 2020 03:57:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.77;
 helo=conuserg-10.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=GUqDhJnQ; 
 dkim-atps=neutral
Received: from conuserg-10.nifty.com (conuserg-10.nifty.com [210.131.2.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CtYh070DXzDqLY
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Dec 2020 03:55:59 +1100 (AEDT)
Received: from grover.flets-west.jp (softbank126090211135.bbtec.net
 [126.90.211.135]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id 0BCGsX0P010674;
 Sun, 13 Dec 2020 01:54:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 0BCGsX0P010674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1607792075;
 bh=eJ5Cl9vaV3peCTWnjThcO43m5nD+IuQbQHBUpPBgwss=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GUqDhJnQJfqRknnuI7KuDtElIpvSZmXvCBC31yR0YA3SETJINlVt6pwFgto1Fn0Wy
 1GHMjU0SsZs22UmGiy5TlmyAnVZJ44W415oeBoVwLE5fmA9tH7TLdUwAVAhT3b8dN2
 LeeP8YRpQ1bJaJa5HNMXUV9/b2FXbeLO8QkzOniOPI4N8Z6cwmTpLaLvNa/aQ3inAy
 RSeZ2JbBDzkCIgSSo+8T77Lkpa7Jx/x4YF5CZWfwfR9ZVGYAAVXNzjqhQ66KoAmHUT
 4FWkHvsFDZy5LO76e/oD3/pKgjiXhubVmkJk29aOPYu7PBn3cPF01xSEAyMJ447aIj
 3AAyuYpJIOLqQ==
X-Nifty-SrcIP: [126.90.211.135]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH 2/3] kbuild: LD_VERSION redenomination
Date: Sun, 13 Dec 2020 01:54:30 +0900
Message-Id: <20201212165431.150750-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201212165431.150750-1-masahiroy@kernel.org>
References: <20201212165431.150750-1-masahiroy@kernel.org>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dominique Martinet <asmadeus@codewreck.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-mips@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhc@lemote.com>,
 Will Deacon <will@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit ccbef1674a15 ("Kbuild, lto: add ld-version and ld-ifversion
macros") introduced scripts/ld-version.sh for GCC LTO.

At that time, this script handled 5 version fields because GCC LTO
needed the downstream binutils. (https://lkml.org/lkml/2014/4/8/272)

The code snippet from the submitted patch was as follows:

    # We need HJ Lu's Linux binutils because mainline binutils does not
    # support mixing assembler and LTO code in the same ld -r object.
    # XXX check if the gcc plugin ld is the expected one too
    # XXX some Fedora binutils should also support it. How to check for that?
    ifeq ($(call ld-ifversion,-ge,22710001,y),y)
        ...

However, GCC LTO was not merged into the mainline after all.
(https://lkml.org/lkml/2014/4/8/272)

So, the 4th and 5th fields were never used, and finally removed by
commit 0d61ed17dd30 ("ld-version: Drop the 4th and 5th version
components").

Since then, the last 4-digits returned by this script is always zeros.

Remove the meaningless last 4-digits. This makes the version format
consistent with GCC_VERSION, CLANG_VERSION, LLD_VERSION.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/arm64/Kconfig            | 2 +-
 arch/mips/loongson64/Platform | 2 +-
 arch/mips/vdso/Kconfig        | 2 +-
 arch/powerpc/Makefile         | 2 +-
 arch/powerpc/lib/Makefile     | 2 +-
 scripts/ld-version.sh         | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a6b5b7ef40ae..69d56b21a6ec 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1499,7 +1499,7 @@ config ARM64_PTR_AUTH
 	depends on (CC_HAS_SIGN_RETURN_ADDRESS || CC_HAS_BRANCH_PROT_PAC_RET) && AS_HAS_PAC
 	# Modern compilers insert a .note.gnu.property section note for PAC
 	# which is only understood by binutils starting with version 2.33.1.
-	depends on LD_IS_LLD || LD_VERSION >= 233010000 || (CC_IS_GCC && GCC_VERSION < 90100)
+	depends on LD_IS_LLD || LD_VERSION >= 23301 || (CC_IS_GCC && GCC_VERSION < 90100)
 	depends on !CC_IS_CLANG || AS_HAS_CFI_NEGATE_RA_STATE
 	depends on (!FUNCTION_GRAPH_TRACER || DYNAMIC_FTRACE_WITH_REGS)
 	help
diff --git a/arch/mips/loongson64/Platform b/arch/mips/loongson64/Platform
index ec42c5085905..cc0b9c87f9ad 100644
--- a/arch/mips/loongson64/Platform
+++ b/arch/mips/loongson64/Platform
@@ -35,7 +35,7 @@ cflags-$(CONFIG_CPU_LOONGSON64)	+= $(call as-option,-Wa$(comma)-mno-fix-loongson
 # can't easily be used safely within the kbuild framework.
 #
 ifeq ($(call cc-ifversion, -ge, 0409, y), y)
-  ifeq ($(call ld-ifversion, -ge, 225000000, y), y)
+  ifeq ($(call ld-ifversion, -ge, 22500, y), y)
     cflags-$(CONFIG_CPU_LOONGSON64)  += \
       $(call cc-option,-march=loongson3a -U_MIPS_ISA -D_MIPS_ISA=_MIPS_ISA_MIPS64)
   else
diff --git a/arch/mips/vdso/Kconfig b/arch/mips/vdso/Kconfig
index 7aec721398d5..a665f6108cb5 100644
--- a/arch/mips/vdso/Kconfig
+++ b/arch/mips/vdso/Kconfig
@@ -12,7 +12,7 @@
 # the lack of relocations. As such, we disable the VDSO for microMIPS builds.
 
 config MIPS_LD_CAN_LINK_VDSO
-	def_bool LD_VERSION >= 225000000 || LD_IS_LLD
+	def_bool LD_VERSION >= 22500 || LD_IS_LLD
 
 config MIPS_DISABLE_VDSO
 	def_bool CPU_MICROMIPS || (!CPU_MIPSR6 && !MIPS_LD_CAN_LINK_VDSO)
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 5c8c06215dd4..6a9a852c3d56 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -65,7 +65,7 @@ UTS_MACHINE := $(subst $(space),,$(machine-y))
 ifdef CONFIG_PPC32
 KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
 else
-ifeq ($(call ld-ifversion, -ge, 225000000, y),y)
+ifeq ($(call ld-ifversion, -ge, 22500, y),y)
 # Have the linker provide sfpr if possible.
 # There is a corresponding test in arch/powerpc/lib/Makefile
 KBUILD_LDFLAGS_MODULE += --save-restore-funcs
diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index 69a91b571845..d4efc182662a 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -31,7 +31,7 @@ obj-$(CONFIG_FUNCTION_ERROR_INJECTION)	+= error-inject.o
 # 64-bit linker creates .sfpr on demand for final link (vmlinux),
 # so it is only needed for modules, and only for older linkers which
 # do not support --save-restore-funcs
-ifeq ($(call ld-ifversion, -lt, 225000000, y),y)
+ifeq ($(call ld-ifversion, -lt, 22500, y),y)
 extra-$(CONFIG_PPC64)	+= crtsavres.o
 endif
 
diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
index f2be0ff9a738..0f8a2c0f9502 100755
--- a/scripts/ld-version.sh
+++ b/scripts/ld-version.sh
@@ -6,6 +6,6 @@
 	gsub(".*version ", "");
 	gsub("-.*", "");
 	split($1,a, ".");
-	print a[1]*100000000 + a[2]*1000000 + a[3]*10000;
+	print a[1]*10000 + a[2]*100 + a[3];
 	exit
 	}
-- 
2.27.0

