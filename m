Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 360AD53269B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 11:39:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6q0M0S7bz3bk1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 19:39:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LZlLDbCE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=LZlLDbCE; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6pzj4Ycrz302k
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 19:38:40 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 p13-20020a17090a284d00b001e0817e77f6so677336pjf.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 02:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IejOhuR5dcF4u5Ltr2+2nEAhic32ZdtVZJ2Sq+bJ0ak=;
 b=LZlLDbCEZyQiVv11rA610xOkZLL5/TNhoTHt3ueEQHWP2Vgx9JHMmZUWORA5RqxmrS
 9xh+PiBFupT6R5KeYXO76esOhxe/BoloGYTxoNgUXbi9PFvIVa5MrZPH5e27Psgg5g4E
 6qjLzqv2CRmRC3W47zAl6as1B7x4I+60KCKsLfvxUOYS6NquAqZqXHOrEKZ2QNJ/P2Eb
 gumoDWsbZ3tatyxUCrVW06qE4N0pYB8ZGP4NSHYAv84BbKMLnLlOT24Xd6fAiC9tOxh0
 cBa7P2GcNw00ksOd7Qbnpt9QOSwH246MUw1rxN7IX4wixAVXvXFQ17D2Au+9PTH9ewwI
 mFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IejOhuR5dcF4u5Ltr2+2nEAhic32ZdtVZJ2Sq+bJ0ak=;
 b=VngeXLK4LcapDGwnou9/DkObhxXmKpDnFHRfj9A7oRUrME6zy58QaEDy+I5S9jI9q8
 dvwSCfSI6RCgtezSTvSNL4d69bAX/i6r1LZGVVhlWRTr5P7aMz5d/qyjjBXUbHb9T20D
 qsy5s+NUn8PmcV8H7StKvtD4YXzVVvRX6fwezzxTaAxznImOY+RRlTPhY91S3Ssg32Hd
 F7Vhh+MlZmRvByFhHPR1y9FqslVcuMjFG3jr9jyCWivzHWHI1O6gVMNWTNA7UZfmiqGu
 xhlX85EAVMOPtou9UWA/VmaXSXcQL3earKfXs5FS8ZNWy3hmHJbh6rsX9V4mSP9RsXTO
 ReVg==
X-Gm-Message-State: AOAM532qGYmAMzdzFtu53fE19QVRvPDkoJZYKV/3OE2R3fVz0fDy9Ay+
 hn7GFtzdJZxRRySvc2C7tw2QpU2au5GbAw==
X-Google-Smtp-Source: ABdhPJwmAF9sl+cGr2udFHIaejUlmXIxj5dVJdTtdPF8ezAhRrWrP07cGlBzjixZ3RJtMXYffZlLLA==
X-Received: by 2002:a17:903:32cc:b0:161:9539:fd49 with SMTP id
 i12-20020a17090332cc00b001619539fd49mr27381187plr.117.1653385117724; 
 Tue, 24 May 2022 02:38:37 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([118.209.250.103])
 by smtp.gmail.com with ESMTPSA id
 x24-20020a637c18000000b003f9e80538d0sm5962666pgc.17.2022.05.24.02.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 02:38:36 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH Linux] powerpc: add documentation for HWCAPs
Date: Tue, 24 May 2022 19:38:28 +1000
Message-Id: <20220524093828.505575-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: gcc@gcc.gnu.org, libc-alpha@sourceware.org,
 Nicholas Piggin <npiggin@gmail.com>, Paul E Murphy <murphyp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Take the arm64 HWCAP documentation file and adjust it for powerpc.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---

Thanks for all the comments and corrections. It should be nearing the
point where it is useful now. Yes I do think it would be useful to align
this more with OpenPOWER docs (and possibly eventually move it into the
ABI, given that's the allocator of these numbers) but that's not
done yet.

Thanks,
Nick

 Documentation/powerpc/elf_hwcaps.rst | 225 +++++++++++++++++++++++++++
 1 file changed, 225 insertions(+)
 create mode 100644 Documentation/powerpc/elf_hwcaps.rst

diff --git a/Documentation/powerpc/elf_hwcaps.rst b/Documentation/powerpc/elf_hwcaps.rst
new file mode 100644
index 000000000000..0a39077cd5d5
--- /dev/null
+++ b/Documentation/powerpc/elf_hwcaps.rst
@@ -0,0 +1,225 @@
+.. _elf_hwcaps_index:
+
+==================
+POWERPC ELF HWCAPs
+==================
+
+This document describes the usage and semantics of the powerpc ELF HWCAPs.
+
+
+1. Introduction
+---------------
+
+Some hardware or software features are only available on some CPU
+implementations, and/or with certain kernel configurations, but have no other
+discovery mechanism available to userspace code. The kernel exposes the
+presence of these features to userspace through a set of flags called HWCAPs,
+exposed in the auxiliary vector.
+
+Userspace software can test for features by acquiring the AT_HWCAP or
+AT_HWCAP2 entry of the auxiliary vector, and testing whether the relevant
+flags are set, e.g.::
+
+	bool floating_point_is_present(void)
+	{
+		unsigned long HWCAPs = getauxval(AT_HWCAP);
+		if (HWCAPs & PPC_FEATURE_HAS_FPU)
+			return true;
+
+		return false;
+	}
+
+Where software relies on a feature described by a HWCAP, it should check the
+relevant HWCAP flag to verify that the feature is present before attempting to
+make use of the feature.
+
+Features should not be probed through other means. When a feature is not
+available, attempting to use it may result in unpredictable behaviour, and
+may not be guaranteed to result in any reliable indication that the feature
+is unavailable.
+
+Software that targets a particular platform does not necessarily have to
+test for required or implied features. For example if the program requires
+FPU, VMX, VSX, it is not necessary to test those HWCAPs, and it may be
+impossible to do so if the compiler generates code requiring those features.
+
+2. Facilities
+-------------
+The Power ISA uses the term "facility" to describe a class of instructions,
+registers, interrupts, etc. The presence or absence of a facility indicates
+whether this class is available to be used, but the specifics depend on the
+ISA version. For example, if the VSX facility is available, the VSX
+instructions that can be used differ between the v3.0B and v3.1B ISA
+verstions.
+
+3. HWCAP allocation
+-------------------
+
+HWCAPs are allocated as described in Power Architecture 64-Bit ELF V2 ABI
+Specification (which will be reflected in the kernel's uapi headers).
+
+4. The HWCAPs exposed in AT_HWCAP
+---------------------------------
+
+PPC_FEATURE_32
+    32-bit CPU
+
+PPC_FEATURE_64
+    64-bit CPU (userspace may be running in 32-bit mode).
+
+PPC_FEATURE_601_INSTR
+    The processor is PowerPC 601.
+    Unused in the kernel since:
+      f0ed73f3fa2c ("powerpc: Remove PowerPC 601")
+
+PPC_FEATURE_HAS_ALTIVEC
+    Vector (aka Altivec, VMX) facility is available.
+
+PPC_FEATURE_HAS_FPU
+    Floating point facility is available.
+
+PPC_FEATURE_HAS_MMU
+    Memory management unit is present and enabled.
+
+PPC_FEATURE_HAS_4xxMAC
+    The processor is 40x or 44x family.
+
+PPC_FEATURE_UNIFIED_CACHE
+    The processor has a unified L1 cache for instructions and data, as
+    found in NXP e200.
+    Unused in the kernel since:
+      39c8bf2b3cc1 ("powerpc: Retire e200 core (mpc555x processor)")
+
+PPC_FEATURE_HAS_SPE
+    Signal Processing Engine facility is available.
+
+PPC_FEATURE_HAS_EFP_SINGLE
+    Embedded Floating Point single precision operations are available.
+
+PPC_FEATURE_HAS_EFP_DOUBLE
+    Embedded Floating Point double precision operations are available.
+
+PPC_FEATURE_NO_TB
+    The timebase facility (mftb instruction) is not available.
+    This is a 601 specific HWCAP, so if it is known that the processor
+    running is not a 601, via other HWCAPs or other means, it is not
+    required to test this bit before using the timebase.
+    Unused in the kernel since:
+      f0ed73f3fa2c ("powerpc: Remove PowerPC 601")
+
+PPC_FEATURE_POWER4
+    The processor is POWER4 or PPC970/FX/MP.
+    POWER4 support dropped from the kernel since:
+      471d7ff8b51b ("powerpc/64s: Remove POWER4 support")
+
+PPC_FEATURE_POWER5
+    The processor is POWER5.
+
+PPC_FEATURE_POWER5_PLUS
+    The processor is POWER5+.
+
+PPC_FEATURE_CELL
+    The processor is Cell.
+
+PPC_FEATURE_BOOKE
+    The processor implements the BookE architecture.
+
+PPC_FEATURE_SMT
+    The processor implements SMT.
+
+PPC_FEATURE_ICACHE_SNOOP
+    The processor icache is coherent with the dcache, and instruction storage
+    can be made consistent with data storage for the purpose of executing
+    instructions with the sequence (as described in, e.g., POWER9 Processor
+    User's Manual, 4.6.2.2 Instruction Cache Block Invalidate (icbi)):
+        sync
+        icbi (to any address)
+        isync
+
+PPC_FEATURE_ARCH_2_05
+    The processor supports the v2.05 userlevel architecture. Processors
+    supporting later architectures also set this feature.
+
+PPC_FEATURE_PA6T
+    The processor is PA6T.
+
+PPC_FEATURE_HAS_DFP
+    DFP facility is available.
+
+PPC_FEATURE_POWER6_EXT
+    The processor is POWER6.
+
+PPC_FEATURE_ARCH_2_06
+    The processor supports the v2.06 userlevel architecture. Processors
+    supporting later architectures also set this feature.
+
+PPC_FEATURE_HAS_VSX
+    VSX facility is available.
+
+PPC_FEATURE_PSERIES_PERFMON_COMPAT
+    The processor supports architected PMU events in the range 0xE0-0xFF.
+
+PPC_FEATURE_TRUE_LE
+    The processor supports true little-endian mode.
+
+PPC_FEATURE_PPC_LE
+    The processor supports "PowerPC Little-Endian", that uses address
+    munging to make storage access appear to be little-endian, but the
+    data is stored in a different format that is unsuitable to be
+    accessed by other agents not running in this mode.
+
+5. The HWCAPs exposed in AT_HWCAP2
+----------------------------------
+
+PPC_FEATURE2_ARCH_2_07
+    The processor supports the v2.07 userlevel architecture. Processors
+    supporting later architectures also set this feature.
+
+PPC_FEATURE2_HTM
+    Transactional Memory feature is available.
+
+PPC_FEATURE2_DSCR
+    DSCR facility is available.
+
+PPC_FEATURE2_EBB
+    EBB facility is available.
+
+PPC_FEATURE2_ISEL
+    isel instruction is available. This is superseded by ARCH_2_07 and
+    later.
+
+PPC_FEATURE2_TAR
+    TAR facility is available.
+
+PPC_FEATURE2_VEC_CRYPTO
+    v2.07 crypto instructions are available.
+
+PPC_FEATURE2_HTM_NOSC
+    System calls fail if called in a transactional state, see
+    Documentation/powerpc/syscall64-abi.rst
+
+PPC_FEATURE2_ARCH_3_00
+    The processor supports the v3.0B / v3.0C userlevel architecture. Processors
+    supporting later architectures also set this feature.
+
+PPC_FEATURE2_HAS_IEEE128
+    IEEE 128-bit binary floating point is supported with VSX
+    quad-precision instructions and data types.
+
+PPC_FEATURE2_DARN
+    darn instruction is available.
+
+PPC_FEATURE2_SCV
+    scv instruction may be used for system calls, see
+    Documentation/powerpc/syscall64-abi.rst.
+
+PPC_FEATURE2_HTM_NO_SUSPEND
+    A limited Transactional Memory facility that does not support suspend is
+    available, see Documentation/powerpc/transactional_memory.rst.
+
+PPC_FEATURE2_ARCH_3_1
+    The processor supports the v3.1 userlevel architecture. Processors
+    supporting later architectures also set this feature.
+
+PPC_FEATURE2_MMA
+    MMA facility is available.
-- 
2.35.1

