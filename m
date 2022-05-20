Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B05552E43A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 07:16:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4FLp62M3z3bjM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 15:16:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=L/as+gDC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=L/as+gDC; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4FL611Ddz3bVR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 15:15:41 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id 10so3055568plj.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 22:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EwH/SFZaRMJzk1GvTtFeTgzAMHl5cmVPnVOuGAvxUkM=;
 b=L/as+gDCWU1lR7GqqS+Lmi4/kV+vv4mTwoYH9JKeTcJkd0dg+tagfH31GNLqr4cCZH
 c/Sbo9yXtPp9O0VJERsilJZ+dPJLKvx3Gu9g0Kguodv4h27lAOK8c16oB/cZTjYAyd/p
 g+luqiYj+yIveEsQiS7m4DjdYFbez/KQMXNwiAkBUZgzp6NGp8/rH01j/1nu50P/mSbL
 5u+A7+T+b42VmUPkaNdm1ncaEhtREAxFh/gwXQRR05ZScv9ioGiTaph2e8LbsR8VjfgB
 bN8BcYYqavdSzoGafOkQ9sRg+wTjnkgSaRjp2IrDGXOPKHGuY8t6Xp0XALzs1CrLwAEV
 5i6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EwH/SFZaRMJzk1GvTtFeTgzAMHl5cmVPnVOuGAvxUkM=;
 b=DsiBR253dviGItT1lxn5741z2pNswU7RE2dBG+JBNPlPXtuivgqWGgc4J710Nyuyzj
 q8R+vHGgMH5nsk4JZFY6TpAbEkBnN1KMd3b4e8nO+HBk6izPDe3VtkrhxAJHH9+fulfQ
 DVuVhOFFg3/MOnDWbrsqz+PIQlrkvfmrh4UaZCGNJ6NUyZ+LLb1uFQtfho5WCxhDdN4o
 +fHXwWiLzJAV6qC8gJnvgS0Ul15XNvhTWNps17Np62LF8IiHymj9p6o122tSYGrkDI41
 bFoLR9FYZMIq5nvqQHawR2L4I0H3Cs+7iCnmBTREhsXaRambDNsr2ymVc82lEA+XvEGz
 YPdA==
X-Gm-Message-State: AOAM531G97Ps4XA1srMLxgeWa1tD+9nh6suEMGyyLGs3bfN0RvfF+098
 eSay7gItPbV5ymD8QVqq/ZiqWFL4V3nuIQ==
X-Google-Smtp-Source: ABdhPJykOric1D2miPgxPGH25GiUojyXhCgA8wY1eckhPFCwD+QE/+RTYeSG0HMXIUKjg4tpQyWDfw==
X-Received: by 2002:a17:90a:2809:b0:1df:35ca:2e6a with SMTP id
 e9-20020a17090a280900b001df35ca2e6amr8976633pjd.8.1653023738013; 
 Thu, 19 May 2022 22:15:38 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.87.15.124])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a1709027ec900b0015e8d4eb1b8sm4863455plb.2.2022.05.19.22.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 22:15:37 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC Linux patch] powerpc: add documentation for HWCAPs
Date: Fri, 20 May 2022 15:15:28 +1000
Message-Id: <20220520051528.98097-1-npiggin@gmail.com>
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
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This takes the arm64 file and adjusts it for powerpc. Feature
descriptions are vaguely handwaved by me.
---

Anybody care to expand on or correct the meaning of these entries or
bikeshed the wording of the intro? Many of them are no longer used
anywhere by upstream kernels and even where they are it's not always
quite clear what the exact intent was, a lot of them are old history
and I don't know what or where they are used.

I may try to get these descriptions pushed into the ABI doc after a
time, but for now they can live in the kernel tree.

Thanks,
Nick

 Documentation/powerpc/elf_hwcaps.rst | 192 +++++++++++++++++++++++++++
 1 file changed, 192 insertions(+)
 create mode 100644 Documentation/powerpc/elf_hwcaps.rst

diff --git a/Documentation/powerpc/elf_hwcaps.rst b/Documentation/powerpc/elf_hwcaps.rst
new file mode 100644
index 000000000000..d712aae8b867
--- /dev/null
+++ b/Documentation/powerpc/elf_hwcaps.rst
@@ -0,0 +1,192 @@
+.. _elf_hwcaps_index:
+
+==================
+POWERPC ELF hwcaps
+==================
+
+This document describes the usage and semantics of the powerpc ELF hwcaps.
+
+
+1. Introduction
+---------------
+
+Some hardware or software features are only available on some CPU
+implementations, and/or with certain kernel configurations, but have no
+architected discovery mechanism available to userspace code. The kernel
+exposes the presence of these features to userspace through a set
+of flags called hwcaps, exposed in the auxilliary vector.
+
+Userspace software can test for features by acquiring the AT_HWCAP or
+AT_HWCAP2 entry of the auxiliary vector, and testing whether the relevant
+flags are set, e.g.::
+
+	bool floating_point_is_present(void)
+	{
+		unsigned long hwcaps = getauxval(AT_HWCAP);
+		if (hwcaps & PPC_FEATURE_HAS_FPU)
+			return true;
+
+		return false;
+	}
+
+Where software relies on a feature described by a hwcap, it should check
+the relevant hwcap flag to verify that the feature is present before
+attempting to make use of the feature.
+
+Features cannot be probed reliably through other means. When a feature
+is not available, attempting to use it may result in unpredictable
+behaviour, and is not guaranteed to result in any reliable indication
+that the feature is unavailable, such as a SIGILL.
+
+2. hwcap allocation
+-------------------
+
+HWCAPs are allocated as described in Power Architecture 64-Bit ELF V2 ABI
+Specification (which will be reflected in the kernel's uapi headers).
+
+3. The hwcaps exposed in AT_HWCAP
+---------------------------------
+
+PPC_FEATURE_32
+    32-bit CPU
+
+PPC_FEATURE_64
+    64-bit CPU (userspace may be running in 32-bit mode).
+
+PPC_FEATURE_601_INSTR
+    The processor is PowerPC 601
+
+PPC_FEATURE_HAS_ALTIVEC
+    Vector (aka Altivec, VSX) facility is available.
+
+PPC_FEATURE_HAS_FPU
+    Floating point facility is available.
+
+PPC_FEATURE_HAS_MMU
+    Memory management unit is present.
+
+PPC_FEATURE_HAS_4xxMAC
+    ?
+
+PPC_FEATURE_UNIFIED_CACHE
+    ?
+
+PPC_FEATURE_HAS_SPE
+    ?
+
+PPC_FEATURE_HAS_EFP_SINGLE
+    ?
+
+PPC_FEATURE_HAS_EFP_DOUBLE
+    ?
+
+PPC_FEATURE_NO_TB
+    The timebase facility (mftb instruction) is not available.
+
+PPC_FEATURE_POWER4
+    The processor is POWER4.
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
+    instructions with the instruction sequence:
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
+
+PPC_FEATURE_TRUE_LE
+    Reserved, do not use
+
+PPC_FEATURE_PPC_LE
+    Reserved, do not use
+
+3. The hwcaps exposed in AT_HWCAP2
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
+    VSX facility is available.
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
+    IEEE 128 is available? What instructions/data?
+
+PPC_FEATURE2_DARN
+    darn instruction is available.
+
+PPC_FEATURE2_SCV
+    scv instruction is available.
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

