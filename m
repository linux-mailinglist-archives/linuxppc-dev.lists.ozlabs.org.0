Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 019C042BBA8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 11:32:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTnPC4xg1z308G
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 20:32:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=C4fVA9nt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=202.248.20.74;
 helo=condef-09.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=C4fVA9nt; 
 dkim-atps=neutral
X-Greylist: delayed 223 seconds by postgrey-1.36 at boromir;
 Wed, 13 Oct 2021 17:49:16 AEDT
Received: from condef-09.nifty.com (condef-09.nifty.com [202.248.20.74])
 by lists.ozlabs.org (Postfix) with ESMTP id 4HTjn842yNz2y0G
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 17:49:16 +1100 (AEDT)
Received: from conuserg-08.nifty.com ([10.126.8.71])by condef-09.nifty.com
 with ESMTP id 19D6f0L8005669
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 15:41:47 +0900
Received: from grover.RMN.KIBA.LAB.jp (133-32-232-101.west.xps.vectant.ne.jp
 [133.32.232.101]) (authenticated)
 by conuserg-08.nifty.com with ESMTP id 19D6aPuh030197;
 Wed, 13 Oct 2021 15:36:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 19D6aPuh030197
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1634106991;
 bh=w+C8PeialXZoMais0w2ZzIgnOibTO/x7dqFrtlyYKH8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C4fVA9ntIpKK2HCft6rDKsRyDi8GEsy4kFCoKXwqdwRnoxIQIQNOsl+OrzZdrX0H4
 dVWL8PlcvbPbCPE/DkOcyIzluHDRLYTqupzlhB1Cw8Zs8Hx0sGj3wrTXo8L7aYMSzW
 8uwBt8T6Iwb5ysxMEVZWgJAKro6hvs0IZdjayrfD5hehK0ZZpfbbTr5cL3RfphDPM4
 +rVTGz35smHcpayzE/7Gw51bGWCLUvd56UudcXnaGraCH/fakuQN9oxefFh6DryxCk
 JIlVlQ2PQTKuKeSp1XJPh/oAiHtvXUbUf9kvtxgTjYL09se5Opx2hMluRXiQ+jmWKi
 t4DN5JmtWIivA==
X-Nifty-SrcIP: [133.32.232.101]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH 2/2] kbuild: use more subdir- for visiting subdirectories
 while cleaning
Date: Wed, 13 Oct 2021 15:36:22 +0900
Message-Id: <20211013063622.548590-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211013063622.548590-1-masahiroy@kernel.org>
References: <20211013063622.548590-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 13 Oct 2021 20:30:31 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Randy Dunlap <rdunlap@infradead.org>,
 linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Rich Felker <dalias@libc.org>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Paul Mackerras <paulus@samba.org>, Jonas Bonn <jonas@southpole.se>,
 Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-alpha@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-parisc@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp,
 linux-xtensa@linux-xtensa.org, Albert Ou <aou@eecs.berkeley.edu>,
 Robert Richter <rric@kernel.org>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Nathan Chancellor <nathan@kernel.org>, linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>,
 William Cohen <wcohen@redhat.com>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>, Michal Marek <michal.lkml@markovi.net>,
 Julien Thierry <jthierry@redhat.com>, Nick Hu <nickhu@andestech.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, openrisc@lists.librecores.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Borislav Petkov <bp@alien8.de>,
 Vineet Gupta <vgupta@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Helge Deller <deller@gmx.de>, x86@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Documentation/kbuild/makefiles.rst suggests to use "archclean" for
cleaning arch/$(SRCARCH)/boot/.

Since commit d92cc4d51643 ("kbuild: require all architectures to have
arch/$(SRCARCH)/Kbuild"), we can use the "subdir- += boot" trick for
all architectures. This can take advantage of the parallel option (-j)
for "make clean".

I also cleaned up the comments. The "archdep" target does not exist.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/makefiles.rst | 17 ++---------------
 arch/alpha/Kbuild                  |  3 +++
 arch/alpha/Makefile                |  3 ---
 arch/arc/Kbuild                    |  3 +++
 arch/arc/Makefile                  |  3 ---
 arch/arm/Kbuild                    |  3 +++
 arch/arm/Makefile                  |  4 ----
 arch/arm64/Kbuild                  |  3 +++
 arch/arm64/Makefile                |  7 -------
 arch/arm64/kernel/Makefile         |  3 +++
 arch/csky/Kbuild                   |  3 +++
 arch/csky/Makefile                 |  3 ---
 arch/h8300/Kbuild                  |  3 +++
 arch/h8300/Makefile                |  3 ---
 arch/ia64/Makefile                 |  2 --
 arch/m68k/Makefile                 |  4 +---
 arch/microblaze/Kbuild             |  3 +++
 arch/microblaze/Makefile           |  3 ---
 arch/mips/Kbuild                   |  3 +++
 arch/mips/Makefile                 |  8 +-------
 arch/mips/boot/Makefile            |  3 +++
 arch/nds32/Kbuild                  |  3 +++
 arch/nds32/Makefile                |  3 ---
 arch/nios2/Kbuild                  |  3 +++
 arch/nios2/Makefile                |  6 +-----
 arch/openrisc/Kbuild               |  3 +++
 arch/openrisc/Makefile             |  7 +------
 arch/parisc/Kbuild                 |  3 +++
 arch/parisc/Makefile               |  7 +------
 arch/powerpc/Kbuild                |  3 +++
 arch/powerpc/Makefile              |  7 +------
 arch/riscv/Kbuild                  |  3 +++
 arch/riscv/Makefile                |  7 +------
 arch/s390/Kbuild                   |  3 +++
 arch/s390/Makefile                 |  8 +-------
 arch/sh/Kbuild                     |  3 +++
 arch/sh/Makefile                   |  3 ---
 arch/sparc/Kbuild                  |  3 +++
 arch/sparc/Makefile                |  3 ---
 arch/x86/Kbuild                    |  3 +++
 arch/x86/Makefile                  |  2 --
 arch/xtensa/Makefile               |  4 +---
 42 files changed, 71 insertions(+), 103 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index db3af0b45baf..b008b90b92c9 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -1050,22 +1050,9 @@ is not sufficient this sometimes needs to be explicit.
 The above assignment instructs kbuild to descend down in the
 directory compressed/ when "make clean" is executed.
 
-To support the clean infrastructure in the Makefiles that build the
-final bootimage there is an optional target named archclean:
-
-	Example::
-
-		#arch/x86/Makefile
-		archclean:
-			$(Q)$(MAKE) $(clean)=arch/x86/boot
-
-When "make clean" is executed, make will descend down in arch/x86/boot,
-and clean as usual. The Makefile located in arch/x86/boot/ may use
-the subdir- trick to descend further down.
-
 Note 1: arch/$(SRCARCH)/Makefile cannot use "subdir-", because that file is
-included in the top level makefile, and the kbuild infrastructure
-is not operational at that point.
+included in the top level makefile. Instead, arch/$(SRCARCH)/Kbuild can use
+"subdir-".
 
 Note 2: All directories listed in core-y, libs-y, drivers-y and net-y will
 be visited during "make clean".
diff --git a/arch/alpha/Kbuild b/arch/alpha/Kbuild
index c2302017403a..345d79df24bb 100644
--- a/arch/alpha/Kbuild
+++ b/arch/alpha/Kbuild
@@ -1,3 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y			+= kernel/ mm/
 obj-$(CONFIG_MATHEMU)	+= math-emu/
+
+# for cleaning
+subdir- += boot
diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
index 52529ee42dac..881cb913e23a 100644
--- a/arch/alpha/Makefile
+++ b/arch/alpha/Makefile
@@ -55,9 +55,6 @@ $(boot)/vmlinux.gz: vmlinux
 bootimage bootpfile bootpzfile: vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
 
-archclean:
-	$(Q)$(MAKE) $(clean)=$(boot)
-
 archheaders:
 	$(Q)$(MAKE) $(build)=arch/alpha/kernel/syscalls all
 
diff --git a/arch/arc/Kbuild b/arch/arc/Kbuild
index 699d8cae9b1f..b94102fff68b 100644
--- a/arch/arc/Kbuild
+++ b/arch/arc/Kbuild
@@ -1,3 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-y += kernel/
 obj-y += mm/
+
+# for cleaning
+subdir- += boot
diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 08995f6c6441..efc54f3e35e0 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -112,6 +112,3 @@ uImage: $(uimage-default-y)
 	@$(kecho) '  Image $(boot)/uImage is ready'
 
 CLEAN_FILES += $(boot)/uImage
-
-archclean:
-	$(Q)$(MAKE) $(clean)=$(boot)
diff --git a/arch/arm/Kbuild b/arch/arm/Kbuild
index 5208f7061524..b506622e7e23 100644
--- a/arch/arm/Kbuild
+++ b/arch/arm/Kbuild
@@ -9,3 +9,6 @@ obj-y				+= kernel/ mm/ common/
 obj-y				+= probes/
 obj-y				+= net/
 obj-y				+= crypto/
+
+# for cleaning
+subdir- += boot
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 847c31e7c368..07ea71f8665c 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -317,10 +317,6 @@ ifeq ($(CONFIG_VDSO),y)
 	$(Q)$(MAKE) $(build)=arch/arm/vdso $@
 endif
 
-# We use MRPROPER_FILES and CLEAN_FILES now
-archclean:
-	$(Q)$(MAKE) $(clean)=$(boot)
-
 # My testing targets (bypasses dependencies)
 bp:;	$(Q)$(MAKE) $(build)=$(boot) MACHINE=$(MACHINE) $(boot)/bootpImage
 
diff --git a/arch/arm64/Kbuild b/arch/arm64/Kbuild
index ea7ab4ca81f9..5bfbf7d79c99 100644
--- a/arch/arm64/Kbuild
+++ b/arch/arm64/Kbuild
@@ -4,3 +4,6 @@ obj-$(CONFIG_KVM)	+= kvm/
 obj-$(CONFIG_XEN)	+= xen/
 obj-$(subst m,y,$(CONFIG_HYPERV))	+= hyperv/
 obj-$(CONFIG_CRYPTO)	+= crypto/
+
+# for cleaning
+subdir- += boot
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index c744b1e7b356..e8cfc5868aa8 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -182,13 +182,6 @@ ifeq ($(CONFIG_ARM64_USE_LSE_ATOMICS),y)
   endif
 endif
 
-
-# We use MRPROPER_FILES and CLEAN_FILES now
-archclean:
-	$(Q)$(MAKE) $(clean)=$(boot)
-	$(Q)$(MAKE) $(clean)=arch/arm64/kernel/vdso
-	$(Q)$(MAKE) $(clean)=arch/arm64/kernel/vdso32
-
 ifeq ($(KBUILD_EXTMOD),)
 # We need to generate vdso-offsets.h before compiling certain files in kernel/.
 # In order to do that, we should use the archprepare target, but we can't since
diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index 3f1490bfb938..88b3e2a21408 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -81,3 +81,6 @@ extra-y					+= $(head-y) vmlinux.lds
 ifeq ($(CONFIG_DEBUG_EFI),y)
 AFLAGS_head.o += -DVMLINUX_PATH="\"$(realpath $(objtree)/vmlinux)\""
 endif
+
+# for cleaning
+subdir- += vdso vdso32
diff --git a/arch/csky/Kbuild b/arch/csky/Kbuild
index a4e40e534e6a..4e39f7abdeb6 100644
--- a/arch/csky/Kbuild
+++ b/arch/csky/Kbuild
@@ -1 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+# for cleaning
+subdir- += boot
diff --git a/arch/csky/Makefile b/arch/csky/Makefile
index 37f593a4bf53..866805077636 100644
--- a/arch/csky/Makefile
+++ b/arch/csky/Makefile
@@ -76,9 +76,6 @@ all: zImage
 zImage Image uImage: vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
 
-archclean:
-	$(Q)$(MAKE) $(clean)=$(boot)
-
 define archhelp
   echo  '* zImage       - Compressed kernel image (arch/$(ARCH)/boot/zImage)'
   echo  '  Image        - Uncompressed kernel image (arch/$(ARCH)/boot/Image)'
diff --git a/arch/h8300/Kbuild b/arch/h8300/Kbuild
index b2583e7efbd1..e4703f3534cc 100644
--- a/arch/h8300/Kbuild
+++ b/arch/h8300/Kbuild
@@ -1,2 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y	+= kernel/ mm/ boot/dts/
+
+# for cleaning
+subdir- += boot
diff --git a/arch/h8300/Makefile b/arch/h8300/Makefile
index eb4cb8f6830c..807f41e60ee4 100644
--- a/arch/h8300/Makefile
+++ b/arch/h8300/Makefile
@@ -34,9 +34,6 @@ libs-y	+= arch/$(ARCH)/lib/
 
 boot := arch/h8300/boot
 
-archclean:
-	$(Q)$(MAKE) $(clean)=$(boot)
-
 vmlinux.srec vmlinux.bin zImage uImage.bin: vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
 
diff --git a/arch/ia64/Makefile b/arch/ia64/Makefile
index 7e548c654a29..3b3ac3e1f272 100644
--- a/arch/ia64/Makefile
+++ b/arch/ia64/Makefile
@@ -67,8 +67,6 @@ vmlinux.bin: vmlinux FORCE
 unwcheck: vmlinux
 	-$(Q)READELF=$(READELF) $(PYTHON3) $(srctree)/arch/ia64/scripts/unwcheck.py $<
 
-archclean:
-
 archheaders:
 	$(Q)$(MAKE) $(build)=arch/ia64/kernel/syscalls all
 
diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
index dd0c0ec67f67..740fc97b9c0f 100644
--- a/arch/m68k/Makefile
+++ b/arch/m68k/Makefile
@@ -2,9 +2,7 @@
 # m68k/Makefile
 #
 # This file is included by the global makefile so that you can add your own
-# architecture-specific flags and dependencies. Remember to do have actions
-# for "archclean" and "archdep" for cleaning up and making dependencies for
-# this architecture
+# architecture-specific flags and dependencies.
 #
 # This file is subject to the terms and conditions of the GNU General Public
 # License.  See the file "COPYING" in the main directory of this archive
diff --git a/arch/microblaze/Kbuild b/arch/microblaze/Kbuild
index a1c597889319..077a0b8e9615 100644
--- a/arch/microblaze/Kbuild
+++ b/arch/microblaze/Kbuild
@@ -3,3 +3,6 @@ obj-y			+= kernel/
 obj-y			+= mm/
 obj-$(CONFIG_PCI)	+= pci/
 obj-y			+= boot/dts/
+
+# for cleaning
+subdir- += boot
diff --git a/arch/microblaze/Makefile b/arch/microblaze/Makefile
index 982cd8b876bf..a25e76d89e86 100644
--- a/arch/microblaze/Makefile
+++ b/arch/microblaze/Makefile
@@ -60,9 +60,6 @@ export DTB
 
 all: linux.bin
 
-archclean:
-	$(Q)$(MAKE) $(clean)=$(boot)
-
 archheaders:
 	$(Q)$(MAKE) $(build)=arch/microblaze/kernel/syscalls all
 
diff --git a/arch/mips/Kbuild b/arch/mips/Kbuild
index d5d6ef9bb986..9e8071f0e58f 100644
--- a/arch/mips/Kbuild
+++ b/arch/mips/Kbuild
@@ -25,3 +25,6 @@ obj-y += vdso/
 ifdef CONFIG_KVM
 obj-y += kvm/
 endif
+
+# for cleaning
+subdir- += boot
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index ea3cd080a1c7..e036fc025ccc 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -8,8 +8,7 @@
 # Copyright (C) 2002, 2003, 2004  Maciej W. Rozycki
 #
 # This file is included by the global makefile so that you can add your own
-# architecture-specific flags and dependencies. Remember to do have actions
-# for "archclean" cleaning up for this architecture.
+# architecture-specific flags and dependencies.
 #
 
 archscripts: scripts_basic
@@ -426,11 +425,6 @@ endif
 	$(Q)install -D -m 644 .config $(INSTALL_PATH)/config-$(KERNELRELEASE)
 	$(Q)install -D -m 644 System.map $(INSTALL_PATH)/System.map-$(KERNELRELEASE)
 
-archclean:
-	$(Q)$(MAKE) $(clean)=arch/mips/boot
-	$(Q)$(MAKE) $(clean)=arch/mips/boot/compressed
-	$(Q)$(MAKE) $(clean)=arch/mips/boot/tools
-
 archheaders:
 	$(Q)$(MAKE) $(build)=arch/mips/kernel/syscalls all
 
diff --git a/arch/mips/boot/Makefile b/arch/mips/boot/Makefile
index a3da2c5d63c2..196c44fa72d9 100644
--- a/arch/mips/boot/Makefile
+++ b/arch/mips/boot/Makefile
@@ -171,3 +171,6 @@ $(obj)/vmlinux.itb: $(obj)/vmlinux.its $(obj)/vmlinux.bin FORCE
 
 $(obj)/vmlinux.%.itb: $(obj)/vmlinux.%.its $(obj)/vmlinux.bin.% FORCE
 	$(call if_changed,itb-image,$<)
+
+# for cleaning
+subdir- += compressed tools
diff --git a/arch/nds32/Kbuild b/arch/nds32/Kbuild
index a4e40e534e6a..4e39f7abdeb6 100644
--- a/arch/nds32/Kbuild
+++ b/arch/nds32/Kbuild
@@ -1 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+# for cleaning
+subdir- += boot
diff --git a/arch/nds32/Makefile b/arch/nds32/Makefile
index ee26e4df2fd0..b33d5d81b6ae 100644
--- a/arch/nds32/Makefile
+++ b/arch/nds32/Makefile
@@ -58,9 +58,6 @@ prepare: vdso_prepare
 vdso_prepare: prepare0
 	$(Q)$(MAKE) $(build)=arch/nds32/kernel/vdso include/generated/vdso-offsets.h
 
-archclean:
-	$(Q)$(MAKE) $(clean)=$(boot)
-
 define archhelp
   echo  '  Image         - kernel image (arch/$(ARCH)/boot/Image)'
 endef
diff --git a/arch/nios2/Kbuild b/arch/nios2/Kbuild
index a4e40e534e6a..4e39f7abdeb6 100644
--- a/arch/nios2/Kbuild
+++ b/arch/nios2/Kbuild
@@ -1 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+# for cleaning
+subdir- += boot
diff --git a/arch/nios2/Makefile b/arch/nios2/Makefile
index 72e8ff065cf7..02d678559066 100644
--- a/arch/nios2/Makefile
+++ b/arch/nios2/Makefile
@@ -8,8 +8,7 @@
 # Written by Fredrik Markstrom
 #
 # This file is included by the global makefile so that you can add your own
-# architecture-specific flags and dependencies. Remember to do have actions
-# for "archclean" cleaning up for this architecture.
+# architecture-specific flags and dependencies.
 #
 # Nios2 port by Wind River Systems Inc trough:
 #   fredrik.markstrom@gmail.com and ivarholmqvist@gmail.com
@@ -53,9 +52,6 @@ core-y	+= $(nios2-boot)/dts/
 
 all: vmImage
 
-archclean:
-	$(Q)$(MAKE) $(clean)=$(nios2-boot)
-
 $(BOOT_TARGETS): vmlinux
 	$(Q)$(MAKE) $(build)=$(nios2-boot) $(nios2-boot)/$@
 
diff --git a/arch/openrisc/Kbuild b/arch/openrisc/Kbuild
index 4234b4c03e72..b0b0f2b03f87 100644
--- a/arch/openrisc/Kbuild
+++ b/arch/openrisc/Kbuild
@@ -1,3 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-y += lib/ kernel/ mm/
 obj-y += boot/dts/
+
+# for cleaning
+subdir- += boot
diff --git a/arch/openrisc/Makefile b/arch/openrisc/Makefile
index c52de526e518..760b734fb822 100644
--- a/arch/openrisc/Makefile
+++ b/arch/openrisc/Makefile
@@ -1,9 +1,7 @@
 # BK Id: %F% %I% %G% %U% %#%
 #
 # This file is included by the global makefile so that you can add your own
-# architecture-specific flags and dependencies. Remember to do have actions
-# for "archclean" and "archdep" for cleaning up and making dependencies for
-# this architecture
+# architecture-specific flags and dependencies.
 #
 # This file is subject to the terms and conditions of the GNU General Public
 # License.  See the file "COPYING" in the main directory of this archive
@@ -48,6 +46,3 @@ PHONY += vmlinux.bin
 
 vmlinux.bin: vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
-
-archclean:
-	$(Q)$(MAKE) $(clean)=$(boot)
diff --git a/arch/parisc/Kbuild b/arch/parisc/Kbuild
index 3c068b700a81..a6d3b280ba0c 100644
--- a/arch/parisc/Kbuild
+++ b/arch/parisc/Kbuild
@@ -1,2 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y	+= mm/ kernel/ math-emu/
+
+# for cleaning
+subdir- += boot
diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index fcde3ffa0221..8db4af4879d0 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -2,9 +2,7 @@
 # parisc/Makefile
 #
 # This file is included by the global makefile so that you can add your own
-# architecture-specific flags and dependencies. Remember to do have actions
-# for "archclean" and "archdep" for cleaning up and making dependencies for
-# this architecture
+# architecture-specific flags and dependencies.
 #
 # This file is subject to the terms and conditions of the GNU General Public
 # License.  See the file "COPYING" in the main directory of this archive
@@ -181,8 +179,5 @@ define archhelp
 	@echo  '  zinstall	- Install compressed vmlinuz kernel'
 endef
 
-archclean:
-	$(Q)$(MAKE) $(clean)=$(boot)
-
 archheaders:
 	$(Q)$(MAKE) $(build)=arch/parisc/kernel/syscalls all
diff --git a/arch/powerpc/Kbuild b/arch/powerpc/Kbuild
index 5e2f9eaa3ee7..22cd0d55a892 100644
--- a/arch/powerpc/Kbuild
+++ b/arch/powerpc/Kbuild
@@ -16,3 +16,6 @@ obj-$(CONFIG_KVM)  += kvm/
 obj-$(CONFIG_PERF_EVENTS) += perf/
 obj-$(CONFIG_KEXEC_CORE)  += kexec/
 obj-$(CONFIG_KEXEC_FILE)  += purgatory/
+
+# for cleaning
+subdir- += boot
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index aa6808e70647..b61d8be3c226 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -1,7 +1,5 @@
 # This file is included by the global makefile so that you can add your own
-# architecture-specific flags and dependencies. Remember to do have actions
-# for "archclean" and "archdep" for cleaning up and making dependencies for
-# this architecture.
+# architecture-specific flags and dependencies.
 #
 # This file is subject to the terms and conditions of the GNU General Public
 # License.  See the file "COPYING" in the main directory of this archive
@@ -411,9 +409,6 @@ install:
 	sh -x $(srctree)/$(boot)/install.sh "$(KERNELRELEASE)" vmlinux \
 	System.map "$(INSTALL_PATH)"
 
-archclean:
-	$(Q)$(MAKE) $(clean)=$(boot)
-
 ifeq ($(KBUILD_EXTMOD),)
 # We need to generate vdso-offsets.h before compiling certain files in kernel/.
 # In order to do that, we should use the archprepare target, but we can't since
diff --git a/arch/riscv/Kbuild b/arch/riscv/Kbuild
index 4614c01ba5b3..fb3397223d52 100644
--- a/arch/riscv/Kbuild
+++ b/arch/riscv/Kbuild
@@ -2,3 +2,6 @@
 
 obj-y += kernel/ mm/ net/
 obj-$(CONFIG_BUILTIN_DTB) += boot/dts/
+
+# for cleaning
+subdir- += boot
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 0eb4568fbd29..753e13f3a9d2 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -1,7 +1,5 @@
 # This file is included by the global makefile so that you can add your own
-# architecture-specific flags and dependencies. Remember to do have actions
-# for "archclean" and "archdep" for cleaning up and making dependencies for
-# this architecture
+# architecture-specific flags and dependencies.
 #
 # This file is subject to the terms and conditions of the GNU General Public
 # License.  See the file "COPYING" in the main directory of this archive
@@ -137,6 +135,3 @@ zinstall: install-image = Image.gz
 install zinstall:
 	$(CONFIG_SHELL) $(srctree)/$(boot)/install.sh $(KERNELRELEASE) \
 	$(boot)/$(install-image) System.map "$(INSTALL_PATH)"
-
-archclean:
-	$(Q)$(MAKE) $(clean)=$(boot)
diff --git a/arch/s390/Kbuild b/arch/s390/Kbuild
index 8b98c501142d..76e362277179 100644
--- a/arch/s390/Kbuild
+++ b/arch/s390/Kbuild
@@ -8,3 +8,6 @@ obj-$(CONFIG_APPLDATA_BASE)	+= appldata/
 obj-y				+= net/
 obj-$(CONFIG_PCI)		+= pci/
 obj-$(CONFIG_ARCH_HAS_KEXEC_PURGATORY) += purgatory/
+
+# for cleaning
+subdir- += boot tools
diff --git a/arch/s390/Makefile b/arch/s390/Makefile
index 450b351dfa8e..69c45f600273 100644
--- a/arch/s390/Makefile
+++ b/arch/s390/Makefile
@@ -3,9 +3,7 @@
 # s390/Makefile
 #
 # This file is included by the global makefile so that you can add your own
-# architecture-specific flags and dependencies. Remember to do have actions
-# for "archclean" and "archdep" for cleaning up and making dependencies for
-# this architecture
+# architecture-specific flags and dependencies.
 #
 # Copyright (C) 1994 by Linus Torvalds
 #
@@ -147,10 +145,6 @@ zfcpdump:
 vdso_install:
 	$(Q)$(MAKE) $(build)=arch/$(ARCH)/kernel/vdso64 $@
 
-archclean:
-	$(Q)$(MAKE) $(clean)=$(boot)
-	$(Q)$(MAKE) $(clean)=$(tools)
-
 archheaders:
 	$(Q)$(MAKE) $(build)=$(syscalls) uapi
 
diff --git a/arch/sh/Kbuild b/arch/sh/Kbuild
index 48c2a091a072..be171880977e 100644
--- a/arch/sh/Kbuild
+++ b/arch/sh/Kbuild
@@ -2,3 +2,6 @@
 obj-y				+= kernel/ mm/ boards/
 obj-$(CONFIG_SH_FPU_EMU)	+= math-emu/
 obj-$(CONFIG_USE_BUILTIN_DTB)	+= boot/dts/
+
+# for cleaning
+subdir- += boot
diff --git a/arch/sh/Makefile b/arch/sh/Makefile
index 781463900621..b39412bf91fb 100644
--- a/arch/sh/Makefile
+++ b/arch/sh/Makefile
@@ -198,9 +198,6 @@ compressed: zImage
 archprepare:
 	$(Q)$(MAKE) $(build)=arch/sh/tools include/generated/machtypes.h
 
-archclean:
-	$(Q)$(MAKE) $(clean)=$(boot)
-
 archheaders:
 	$(Q)$(MAKE) $(build)=arch/sh/kernel/syscalls all
 
diff --git a/arch/sparc/Kbuild b/arch/sparc/Kbuild
index c9e574906a9b..71cb3d934bf6 100644
--- a/arch/sparc/Kbuild
+++ b/arch/sparc/Kbuild
@@ -9,3 +9,6 @@ obj-y += math-emu/
 obj-y += net/
 obj-y += crypto/
 obj-$(CONFIG_SPARC64) += vdso/
+
+# for cleaning
+subdir- += boot
diff --git a/arch/sparc/Makefile b/arch/sparc/Makefile
index 24fb5a99f439..c7008bbebc4c 100644
--- a/arch/sparc/Makefile
+++ b/arch/sparc/Makefile
@@ -75,9 +75,6 @@ install:
 	sh $(srctree)/$(boot)/install.sh $(KERNELRELEASE) $(KBUILD_IMAGE) \
 		System.map "$(INSTALL_PATH)"
 
-archclean:
-	$(Q)$(MAKE) $(clean)=$(boot)
-
 archheaders:
 	$(Q)$(MAKE) $(build)=arch/sparc/kernel/syscalls all
 
diff --git a/arch/x86/Kbuild b/arch/x86/Kbuild
index 30dec019756b..f384cb1a4f7a 100644
--- a/arch/x86/Kbuild
+++ b/arch/x86/Kbuild
@@ -25,3 +25,6 @@ obj-y += platform/
 obj-y += net/
 
 obj-$(CONFIG_KEXEC_FILE) += purgatory/
+
+# for cleaning
+subdir- += boot tools
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 7488cfbbd2f6..67d7c265e0ce 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -283,8 +283,6 @@ endif
 archclean:
 	$(Q)rm -rf $(objtree)/arch/i386
 	$(Q)rm -rf $(objtree)/arch/x86_64
-	$(Q)$(MAKE) $(clean)=$(boot)
-	$(Q)$(MAKE) $(clean)=arch/x86/tools
 
 define archhelp
   echo  '* bzImage		- Compressed kernel image (arch/x86/boot/bzImage)'
diff --git a/arch/xtensa/Makefile b/arch/xtensa/Makefile
index 284fd1f592a8..ee2769519eaf 100644
--- a/arch/xtensa/Makefile
+++ b/arch/xtensa/Makefile
@@ -7,9 +7,7 @@
 # Copyright (C) 2014 Cadence Design Systems Inc.
 #
 # This file is included by the global makefile so that you can add your own
-# architecture-specific flags and dependencies. Remember to do have actions
-# for "archclean" and "archdep" for cleaning up and making dependencies for
-# this architecture
+# architecture-specific flags and dependencies.
 
 # Core configuration.
 # (Use VAR=<xtensa_config> to use another default compiler.)
-- 
2.30.2

