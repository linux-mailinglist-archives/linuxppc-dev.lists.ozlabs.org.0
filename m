Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ADA65DD3F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 20:55:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NnL1v5Y2pz3c69
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 06:55:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bltnvl8e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bltnvl8e;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NnL0y33G9z2yfg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jan 2023 06:54:58 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 70657617F3;
	Wed,  4 Jan 2023 19:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 310B3C433D2;
	Wed,  4 Jan 2023 19:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672862093;
	bh=L+MNyD4+J2gyZIniEp1jnrEedIiPMHOYlb+OJsuTqoA=;
	h=From:Subject:Date:To:Cc:From;
	b=Bltnvl8eBa4iWRprtH8bhHBNd74MinRaprS5FPLE+O5X6NBm8prVFG4+kC5eqetEg
	 VNS7V9184Yyke96GgYZlNYf3pkuCgFEGExspz1qbRiA33+TFMSTZ9OIcrUBDYP/RJU
	 lCJ08b+WRoNrRYMGRmzI76Xv4lbPY+TMDAvIns8E7OiO2gppVFzRlnJ2i/6B/VZ0lc
	 JeVhbZwEdi7VcDsLeeyfvwITTem2fW09O5wf3FU+jPNQmhV+adDUqnYxZ8HuEf5Onv
	 zScIVPQjZpVQ+X7an9Vh4Pd6wqSAbA08PJOq8xe5gaCZaU8j8GfaTM1rwJHCovACyQ
	 EIyet6WRohvsg==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 00/14] Remove clang's -Qunused-arguments from KBUILD_CPPFLAGS
Date: Wed, 04 Jan 2023 12:54:18 -0700
Message-Id: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGvZtWMC/x2NQQqDQAwAvyI5N6BLpaVfKT1kd6PmYLSJWwri3
 7v2OAzD7OBswg6PZgfjj7gsWqG7NJAm0pFRcmUIbQhdCHfMtqz4LlqcM5KNZWbdHNvUp1sm7q9D
 hBpHcsZopGk685l8YzvFajzI9398vo7jB9ivTEOBAAAA
To: masahiroy@kernel.org, ndesaulniers@google.com
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4767; i=nathan@kernel.org;
 h=from:subject:message-id; bh=L+MNyD4+J2gyZIniEp1jnrEedIiPMHOYlb+OJsuTqoA=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMlbb3ZW1WS5GXp9rDnt/6hu/3G7mYecz4f8sPovxa91XotL
 2e5CRykLgxgHg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZhI9wdGhsttn4qEr1577ln566Myr/
 BNt4db9/dNrVRYwLP66qbc7LkM/z28WKNDG/Vum/jOz8p4fvzjYZvp+1xdA27LmtopzX7qzwgA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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
Cc: trix@redhat.com, dave.hansen@linux.intel.com, dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, agordeev@linux.ibm.com, linux-s390@vger.kernel.org, kernel test robot <lkp@intel.com>, x86@kernel.org, Rodrigo.Siqueira@amd.com, mingo@redhat.com, borntraeger@linux.ibm.com, harry.wentland@amd.com, llvm@lists.linux.dev, nicolas@fjasle.eu, gor@linux.ibm.com, linux-kbuild@vger.kernel.org, sunpeng.li@amd.com, hca@linux.ibm.com, npiggin@gmail.com, Nathan Chancellor <nathan@kernel.org>, bp@alien8.de, tglx@linutronix.de, tsbogend@alpha.franken.de, Xinhui.Pan@amd.com, linux-mips@vger.kernel.org, svens@linux.ibm.com, alexander.deucher@amd.com, linuxppc-dev@lists.ozlabs.org, christian.koenig@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

Clang can emit a few different warnings when it encounters a flag that it
recognizes but does not support internally. These warnings are elevated to
errors within {as,cc}-option via -Werror to catch unsupported flags that should
not be added to KBUILD_{A,C}FLAGS; see commit c3f0d0bc5b01 ("kbuild, LLVMLinux:
Add -Werror to cc-option to support clang").

If an unsupported flag is unconditionally to KBUILD_{A,C}FLAGS, all subsequent
{as,cc}-option will always fail, preventing supported and even potentially
necessary flags from getting adding to the tool flags.

One would expect these warnings to be visible in the kernel build logs since
they are added to KBUILD_{A,C}FLAGS but unfortunately, these warnings are
hidden with clang's -Qunused-arguments flag, which is added to KBUILD_CPPFLAGS
and used for both compiling and assembling files.

Patches 1-4 address the internal inconsistencies of invoking the assembler
within kbuild by using KBUILD_AFLAGS consistently and using '-x
assembler-with-cpp' over '-x assembler'. This matches how assembly files are
built across the kernel and helps avoid problems in situations where macro
definitions or warning flags are present in KBUILD_AFLAGS, which cause
instances of -Wunused-command-line-argument when the preprocessor is not called
to consume them. There were a couple of places in architecture code where this
change would break things so those are fixed first.

Patches 5-12 clean up warnings that will show up when -Qunused-argument is
dropped. I hope none of these are controversial.

Patch 13 turns two warnings into errors so that the presence of unused flags
cannot be easily ignored.

Patch 14 drops -Qunused-argument. This is done last so that it can be easily
reverted if need be.

This series has seen my personal test framework, which tests several different
configurations and architectures, with LLVM tip of tree (16.0.0). I have done
defconfig, allmodconfig, and allnoconfig builds for arm, arm64, i386, mips,
powerpc, riscv, s390, and x86_64 with GCC 12.2.0 as well but I am hoping the
rest of the test infrastructure will catch any lurking problems.

I would like this series to stay together so that there is no opportunity for
breakage so please consider giving acks so that this can be carried via the
kbuild tree.

---
Nathan Chancellor (12):
      MIPS: Always use -Wa,-msoft-float and eliminate GAS_HAS_SET_HARDFLOAT
      MIPS: Prefer cc-option for additions to cflags
      powerpc: Remove linker flag from KBUILD_AFLAGS
      powerpc/vdso: Remove unused '-s' flag from ASFLAGS
      powerpc/vdso: Improve linker flags
      powerpc/vdso: Remove an unsupported flag from vgettimeofday-32.o with clang
      s390/vdso: Drop unused '-s' flag from KBUILD_AFLAGS_64
      s390/vdso: Drop '-shared' from KBUILD_CFLAGS_64
      s390/purgatory: Remove unused '-MD' and unnecessary '-c' flags
      drm/amd/display: Do not add '-mhard-float' to dml_ccflags for clang
      kbuild: Turn a couple more of clang's unused option warnings into errors
      kbuild: Stop using '-Qunused-arguments' with clang

Nick Desaulniers (2):
      x86/boot/compressed: prefer cc-option for CFLAGS additions
      kbuild: Update assembler calls to use proper flags and language target

 Makefile                                    |  1 -
 arch/mips/Makefile                          | 13 ++-------
 arch/mips/include/asm/asmmacro-32.h         |  4 +--
 arch/mips/include/asm/asmmacro.h            | 42 ++++++++++++++---------------
 arch/mips/include/asm/fpregdef.h            | 14 ----------
 arch/mips/include/asm/mipsregs.h            | 20 +++-----------
 arch/mips/kernel/genex.S                    |  2 +-
 arch/mips/kernel/r2300_fpu.S                |  4 +--
 arch/mips/kernel/r4k_fpu.S                  | 12 ++++-----
 arch/mips/kvm/fpu.S                         |  6 ++---
 arch/mips/loongson2ef/Platform              |  2 +-
 arch/powerpc/Makefile                       |  2 +-
 arch/powerpc/kernel/vdso/Makefile           | 25 +++++++++++------
 arch/s390/kernel/vdso64/Makefile            |  4 +--
 arch/s390/purgatory/Makefile                |  2 +-
 arch/x86/boot/compressed/Makefile           |  2 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile |  3 ++-
 scripts/Kconfig.include                     |  2 +-
 scripts/Makefile.clang                      |  2 ++
 scripts/Makefile.compiler                   |  8 +++---
 scripts/as-version.sh                       |  2 +-
 21 files changed, 74 insertions(+), 98 deletions(-)
---
base-commit: 88603b6dc419445847923fcb7fe5080067a30f98
change-id: 20221228-drop-qunused-arguments-0c5c7dae54fb

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>
