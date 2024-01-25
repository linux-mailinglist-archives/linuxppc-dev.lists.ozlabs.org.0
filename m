Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E8183CFB6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 23:56:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u/k5uY+I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLbmh5Clyz3cT8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 09:56:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u/k5uY+I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLbll4Kz8z3bn6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 09:56:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C7A55622B3;
	Thu, 25 Jan 2024 22:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7DA3C433F1;
	Thu, 25 Jan 2024 22:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706223360;
	bh=Bx1oIdTdd86nzue6xvhtwCp4wPQwGjG0ILCqZqgINO8=;
	h=From:Subject:Date:To:Cc:From;
	b=u/k5uY+I+ALGKvsZhJOKy+elEEMTuGK4js+9E2aa8C+jdW7zCUmcFB09uzv+3CoZu
	 FWBWHBaHi7qqt5eN22oRGai4acZwbSD7+wTeYGd4bp/1BTWPKdzypKh5/upZuxCBTI
	 DwwCb0OmIwH8ErHvyqJ9tF2AwVh/f9Tc6jYY5uvefvVeofbszLGkSgD9Psw/Y/fOqO
	 4JubQhTEYhKN/h+N4+luvLNiDNT38sywwwjB3NkWClFOXDzTsmqYGb6NEb82khEZvP
	 LyqTCcJ5Mv1GCoc5ko76xtnLjFlNccOpbLWrEyB9x/zp7+IcLe5lDiJ5iq6cetYBpb
	 6LFQ6NVeleKSA==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 00/11] Bump the minimum supported version of LLVM to 13.0.1
Date: Thu, 25 Jan 2024 15:55:06 -0700
Message-Id: <20240125-bump-min-llvm-ver-to-13-0-1-v1-0-f5ff9bda41c5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMrmsmUC/x3MQQqDMBAF0KvIrPshkwSpvUrpojajHTBREhsK4
 t0bunybd1CRrFLo1h2UpWrRNTXwpaPX+5lmgYZmssZ6w9Zj/MQNUROWpUZUydhXsIMBww3T1Yf
 g+pEHasOWZdLvf78/zvMHzVeZdG0AAAA=
To: akpm@linux-foundation.org, masahiroy@kernel.org
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5041; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Bx1oIdTdd86nzue6xvhtwCp4wPQwGjG0ILCqZqgINO8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKmbnv0VWied95P5q0eXfkzlxrZNofbTU+K5bbiVjef9U
 LF9Lp/YUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACbyoJSRYdfLJeuavmdyeR6u
 +xn7PM6bZ9E7RT/WZzFKl4VUYs0DHjEyPAwMYX+6+56b/awFIlsKOvdcOn9vr4jAiuMznF5/qmc
 T5wMA
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
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, will@kernel.org, ardb@kernel.org, keescook@chromium.org, x86@kernel.org, linux@armlinux.org.uk, aneesh.kumar@kernel.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, llvm@lists.linux.dev, nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, npiggin@gmail.com, Nathan Chancellor <nathan@kernel.org>, bp@alien8.de, paul.walmsley@sifive.com, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, patches@lists.linux.dev, conor@kernel.org, palmer@dabbelt.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

This series bumps the minimum supported version of LLVM for building the
kernel to 13.0.1. The first patch does the bump and all subsequent
patches clean up all the various workarounds and checks for earlier
versions.

Quoting the first patch's commit message for those that were only on CC
for the clean ups:

  When __builtin_mul_overflow() has arguments that differ in terms of
  signedness and width, LLVM may generate a libcall to __muloti4 because
  it performs the checks in terms of 65-bit multiplication. This issue
  becomes harder to hit (but still possible) after LLVM 12.0.0, which
  includes a special case for matching widths but different signs.

  To gain access to this special case, which the kernel can take advantage
  of when calls to __muloti4 appear, bump the minimum supported version of
  LLVM for building the kernel to 13.0.1. 13.0.1 was chosen because there
  is minimal impact to distribution support while allowing a few more
  workarounds to be dropped in the kernel source than if 12.0.0 were
  chosen. Looking at container images of up to date distribution versions:

    archlinux:latest              clang version 16.0.6
    debian:oldoldstable-slim      clang version 7.0.1-8+deb10u2 (tags/RELEASE_701/final)
    debian:oldstable-slim         Debian clang version 11.0.1-2
    debian:stable-slim            Debian clang version 14.0.6
    debian:testing-slim           Debian clang version 16.0.6 (19)
    debian:unstable-slim          Debian clang version 16.0.6 (19)
    fedora:38                     clang version 16.0.6 (Fedora 16.0.6-3.fc38)
    fedora:latest                 clang version 17.0.6 (Fedora 17.0.6-1.fc39)
    fedora:rawhide                clang version 17.0.6 (Fedora 17.0.6-1.fc40)
    opensuse/leap:latest          clang version 15.0.7
    opensuse/tumbleweed:latest    clang version 17.0.6
    ubuntu:focal                  clang version 10.0.0-4ubuntu1
    ubuntu:latest                 Ubuntu clang version 14.0.0-1ubuntu1.1
    ubuntu:rolling                Ubuntu clang version 16.0.6 (15)
    ubuntu:devel                  Ubuntu clang version 17.0.6 (3)

  The only distribution that gets left behind is Debian Bullseye, as the
  default version is 11.0.1; other distributions either have a newer
  version than 13.0.1 or one older than the current minimum of 11.0.0.
  Debian has easy access to more recent LLVM versions through
  apt.llvm.org, so this is not as much of a concern. There are also the
  kernel.org LLVM toolchains, which should work with distributions with
  glibc 2.28 and newer.

  Another benefit of slimming up the number of supported versions of LLVM
  for building the kernel is reducing the build capacity needed to support
  a matrix that builds with each supported version, which allows a matrix
  to reallocate the freed up build capacity towards something else, such
  as more configuration combinations.

This passes my build matrix with all supported versions.

This is based on Andrew's mm-nonmm-unstable to avoid trivial conflicts
with my series to update the LLVM links across the repository [1] but I
can easily rebase it to linux-kbuild if Masahiro would rather these
patches go through there (and defer the conflict resolution to the merge
window).

[1]: https://lore.kernel.org/20240109-update-llvm-links-v1-0-eb09b59db071@kernel.org/

---
Nathan Chancellor (11):
      kbuild: Raise the minimum supported version of LLVM to 13.0.1
      Makefile: Drop warn-stack-size plugin opt
      x86: Drop stack-alignment plugin opt
      ARM: Remove Thumb2 __builtin_thread_pointer workaround for Clang
      arm64: Kconfig: Clean up tautological LLVM version checks
      powerpc: Kconfig: Remove tautology in CONFIG_COMPAT
      riscv: Remove MCOUNT_NAME workaround
      riscv: Kconfig: Remove version dependency from CONFIG_CLANG_SUPPORTS_DYNAMIC_FTRACE
      fortify: Drop Clang version check for 12.0.1 or newer
      lib/Kconfig.debug: Update Clang version check in CONFIG_KCOV
      compiler-clang.h: Update __diag_clang() macros for minimum version bump

 Documentation/process/changes.rst |  2 +-
 Makefile                          |  8 --------
 arch/arm/include/asm/current.h    |  8 +-------
 arch/arm64/Kconfig                |  5 +----
 arch/powerpc/Kconfig              |  1 -
 arch/riscv/Kconfig                |  2 --
 arch/riscv/include/asm/ftrace.h   | 14 ++------------
 arch/riscv/kernel/mcount.S        | 10 +++++-----
 arch/x86/Makefile                 |  6 ------
 include/linux/compiler-clang.h    |  8 ++------
 lib/Kconfig.debug                 |  2 +-
 scripts/min-tool-version.sh       |  2 +-
 scripts/recordmcount.pl           |  2 +-
 security/Kconfig                  |  2 --
 14 files changed, 15 insertions(+), 57 deletions(-)
---
base-commit: 979741ebd48f75ed6d101c7290e3325340d361ff
change-id: 20240124-bump-min-llvm-ver-to-13-0-1-39f84dd36b19

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

