Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E125A63A07F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 05:20:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLC1V1Q7Gz3f7g
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 15:20:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CT61j/eO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CT61j/eO;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLBwj15Cxz3cQl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 15:16:04 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id t17so8320303pjo.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 20:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vysrk3dGTGyq4JoEtNOlnGeU0Y9RTh57n/bH2voLswM=;
        b=CT61j/eO21oJFoArWdo5BXt9PjYN56dxU7TxhKm8eGie18UtMCh6x7M8nf6RhHrohE
         KCetcywpvOt+OuN5lHvMqvqnUpcU/U7NL90xfg2l6oxRgws9Pb9eLi/0D230cNpNsga1
         BFTr2l71QoZy8xXcHMP78h8OK885PwSzMjP4RBv1I+YTgCwBoidYcxga/h5Vi9K0mw7H
         1hndDv/iVkqi1YjDEcSC2nrRRyE+z7MeEelm7Gks57kBdgZEM1DG4b7noSkquVOH8DKG
         k5tyrIA4X8QrNHW4X6cnY4/Lwjex1kCKy0i6RnHo/A0VhRAid/Q9dbv2fIncq5K0R6eG
         vmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vysrk3dGTGyq4JoEtNOlnGeU0Y9RTh57n/bH2voLswM=;
        b=nxO/2L/Z4q4pg3DFcNjp09GsJlhwiBGrz6FHJPkDGf66YEsEjlMM+0CcTPlh3U5VTx
         zO7m2v7yfHLUpSEp4PgL7q8K6STqklugsC6sCWKiVQbpniWUcK3OCiiZG2LPDPQxErCv
         NCFIkAq1NOpCkmaOCufZYyXjxMndB6xif9dSI3811suaNBbBmCVz0WDMfqHsGpnm/I19
         zXunVs16JSjUb7xbjw8wCFu7HvJ8MxwqRyfoBtXGXbxqE2K7ARgfWHeI63SsFMlYpaYa
         opvlhLZX9ru1BQsiawjEhBFb8noAhaWr4oF6KQCRfg9v6u5D5PHyYTpKm9aIb1xsPl8Q
         XoUQ==
X-Gm-Message-State: ANoB5pkXGV/zyxu+mlqMsIloB7mz8Su+koMhrCUhA+FsjwC4HwCVchEq
	WYEe0AuEGQJKslyXt2Cuh2MP7Gm0R4Y=
X-Google-Smtp-Source: AA0mqf61Q9PHfLeMkWB4Z3x5rPv5/rLH2A0u1Sxu5ThZlDdD9zvRWmcj4fNMDlgzGkTjjDyzoulPvw==
X-Received: by 2002:a17:90a:440f:b0:218:9894:62c1 with SMTP id s15-20020a17090a440f00b00218989462c1mr43569056pjg.205.1669608962923;
        Sun, 27 Nov 2022 20:16:02 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id y28-20020aa79afc000000b0057489a78979sm6905670pfp.21.2022.11.27.20.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 20:16:02 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 4/4] powerpc/64: Option to build big-endian with ELFv2 ABI
Date: Mon, 28 Nov 2022 14:15:39 +1000
Message-Id: <20221128041539.1742489-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221128041539.1742489-1-npiggin@gmail.com>
References: <20221128041539.1742489-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Luis Chamberlain <mcgrof@kernel.org>, =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Provide an option to build big-endian kernels using the ELFv2 ABI. This
works on GCC only for now. Clang is rumored to support this, but core
build files need updating first, at least.

This gives big-endian kernels useful advantages of the ELFv2 ABI, e.g.,
less stack usage, -mprofile-kernel support, better compatibility with
eBPF tools.

BE+ELFv2 is not officially supported by the GNU toolchain, but it works
fine in testing and has been used by some userspace for some time (e.g.,
Void Linux).

Tested-by: Michal Suchánek <msuchanek@suse.de>
Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                   | 21 +++++++++++++++++++++
 arch/powerpc/platforms/Kconfig.cputype |  4 ++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 2ca5418457ed..2d0d80bcc24a 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1,6 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 source "arch/powerpc/platforms/Kconfig.cputype"
 
+config CC_HAS_ELFV2
+	def_bool PPC64 && $(cc-option, -mabi=elfv2)
+
 config 32BIT
 	bool
 	default y if PPC32
@@ -583,6 +586,24 @@ config KEXEC_FILE
 config ARCH_HAS_KEXEC_PURGATORY
 	def_bool KEXEC_FILE
 
+config PPC64_BIG_ENDIAN_ELF_ABI_V2
+	bool "Build big-endian kernel using ELF ABI V2 (EXPERIMENTAL)"
+	depends on PPC64 && CPU_BIG_ENDIAN
+	depends on CC_HAS_ELFV2
+	depends on LD_IS_BFD && LD_VERSION >= 22400
+	default n
+	help
+	  This builds the kernel image using the "Power Architecture 64-Bit ELF
+	  V2 ABI Specification", which has a reduced stack overhead and faster
+	  function calls. This internal kernel ABI option does not affect
+          userspace compatibility.
+
+	  The V2 ABI is standard for 64-bit little-endian, but for big-endian
+	  it is less well tested by kernel and toolchain. However some distros
+	  build userspace this way, and it can produce a functioning kernel.
+
+	  This requires GCC and binutils 2.24 or newer.
+
 config RELOCATABLE
 	bool "Build a relocatable kernel"
 	depends on PPC64 || (FLATMEM && (44x || PPC_85xx))
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 0c4eed9aea80..6e94d45f3baa 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -575,10 +575,10 @@ config CPU_LITTLE_ENDIAN
 endchoice
 
 config PPC64_ELF_ABI_V1
-	def_bool PPC64 && CPU_BIG_ENDIAN
+	def_bool PPC64 && (CPU_BIG_ENDIAN && !PPC64_BIG_ENDIAN_ELF_ABI_V2)
 
 config PPC64_ELF_ABI_V2
-	def_bool PPC64 && CPU_LITTLE_ENDIAN
+	def_bool PPC64 && !PPC64_ELF_ABI_V1
 
 config PPC64_BOOT_WRAPPER
 	def_bool n
-- 
2.37.2

