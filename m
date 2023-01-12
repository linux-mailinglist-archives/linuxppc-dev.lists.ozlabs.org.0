Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF4966694E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 04:06:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsqFd1W3Xz3cFB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 14:06:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C8KcFlFE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C8KcFlFE;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsqDg4LQVz3c4x
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 14:05:39 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9FB1DB81DAA;
	Thu, 12 Jan 2023 03:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C58AFC433EF;
	Thu, 12 Jan 2023 03:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673492734;
	bh=tjeAZoKw1mOoMptQAuKcbF8k/AUUGPcfSREGH+E1K8E=;
	h=From:Subject:Date:To:Cc:From;
	b=C8KcFlFEKpxaPVj1ID08JYJGd/HSESQUWvTx3iRpDJXnBO5exAD9oBlPszma7sBP0
	 ikeCyk6YvZ+3VSYKqN3XvLzh8EF4KZUfsD/5crcjKNlnZ4RbBJD4hL6eE412yaIe7w
	 QMyZgJoPUVjFOvdo5/b/azZqLoUvLcrUAK79zzhnrU2pFApUcDcwDYvUZd7PT0wNED
	 fpVqt09RpULoE/JXu1PT14VOF9yfpwBR6rtpQ2nJyKSsR0FeoBaOkCXb9RqAPNmBwa
	 E+yCX+MfRyxjSc6+NWCaVUlt+7cKM98NuNP4canjHd46NdWrEuxfDYA19QSyhEOWmg
	 HcC1Opc9WyS3w==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 00/14] Remove clang's -Qunused-arguments from
 KBUILD_CPPFLAGS
Date: Wed, 11 Jan 2023 20:04:58 -0700
Message-Id: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANp4v2MC/4WOTQ6CMBCFr0K6dgw0VtGV9zAs+jNAo7Q4U4iGc
 HcLF3D5vZcv7y2CkTyyuBWLIJw9+xgyyEMhbK9Dh+BdZiFLKSspa3AUR3hPYWJ0oKmbBgyJobT
 KXpxGdWqNyLLRjGBIB9tv+qA5IW3FSNj6z774aDL3nlOk735grrb079ZcQQlnVVtj69aqq7w/k
 QK+jpE60azr+gM6vV+z1gAAAA==
To: masahiroy@kernel.org
X-Mailer: b4 0.12-dev-78c63
X-Developer-Signature: v=1; a=openpgp-sha256; l=5385; i=nathan@kernel.org;
 h=from:subject:message-id; bh=tjeAZoKw1mOoMptQAuKcbF8k/AUUGPcfSREGH+E1K8E=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMn7K36VdwkoxTMnRB4/f6DP+oZzTbX1HEXTN1O2Mjuq7jPX
 zt3cUcrCIMbBICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACbCbM7wV2qGw/H7k8OviNw/GpPfG7
 Ep7O6fbzsPz/hmy2rwpfCGkw3D/4Ip/676bq/LfcSTs8L4+JngqQ83evUcuf/fVyznbp5/IC8A
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
Cc: trix@redhat.com, dave.hansen@linux.intel.com, dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, linux-s390@vger.kernel.org, kernel test robot <lkp@intel.com>, x86@kernel.org, mingo@redhat.com, llvm@lists.linux.dev, nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, npiggin@gmail.com, Nathan Chancellor <nathan@kernel.org>, bp@alien8.de, tglx@linutronix.de, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, ndesaulniers@google.com, linux-mips@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, Alex Deucher <alexander.deucher@amd.com>, linuxppc-dev@lists.ozlabs.org
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
kbuild tree (and many thanks to the people who have already provided such
tags).

---
Changes in v2:
- Pick up tags where provided (thank you everyone!)
- Patch 6 and 9: Clarify that '-s' is a compiler flag that is only relevant to
  the linking phase and remove all mention of the assembler's '-s' flag, as the
  assembler is never directly invoked (Nick, Segher)
- Patch 7: Move '-z noexecstack' into new ldflags-y variable (Nick)
- Patch 8: Reword commit message to explain the problem in a clearer manner
  (Nick)
- Link to v1: https://lore.kernel.org/r/20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org

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

