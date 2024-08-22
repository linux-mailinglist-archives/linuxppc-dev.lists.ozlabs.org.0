Return-Path: <linuxppc-dev+bounces-386-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2A495B9CC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:15:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRYM4tcXz3041;
	Fri, 23 Aug 2024 01:13:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724339623;
	cv=none; b=jX54s2mKJNOkQoOA5PnqjtJ9rNRR4dZ1SGCC4D5hw6gQAmcdLnVTbmM9D+R0SwSKtox5sJ8y8VH+A5SnrucHlXC9sBHXnr3bkJCsFLQi1Xg9Pbhkgvtfm+3aZDUkv397ph8M2wD/nytCvsuNFRJ3j4Am1zM0sIGoTiJ81StVA7LWfQX4GtgVEGvMNnLfeaFnKeM2TrKWKXYwc/P3U1p1yHMNGAZUsE/66+dwAA3br8iA3v8e7dQRrwu96TS1zG1KztFK73dDP7/M76LBbjEhmVf6XTaADhdn+bqAqlLWqeVU68JKCWL1rXKnHjKQz1ZazfRpvoW2Hej6jOBhoN30WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724339623; c=relaxed/relaxed;
	bh=JsKeRVCeIw9Bgaagj+6EgsxIap0Jm8Cb3TcgpNGDGbw=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=O7QhwAeHzDiYOPFCX4yrAA0mWFfkrmEVwtH43RDynDLRDrx7ZUZCr5IQXe9F9YZUcbHMM7xg4FQLey0PjjYSDtYGJ46Z372X8tp+lYRe9jT9xkWuzWIYeFc+x7krNYR+ToPLz3SWa59WYwgbkBET1TxAd6yKzDHgxPKel34SoFGYotWd0vj/FbUakJMdCe/vkA2JSPmp+LNfVQYAob70G63flqiiwRpRfRk5pOr67dkb88cYgiMZSYZmLaTkTgtwWwVfm1HwqvNUw0EV8nsJAyer2r8oOCylnasaTDVBGJpfmodSBu81/uUhvfhQxULsjqNAcRkDA9/q2axtBoOFYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRYM22MZz2ygX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:13:43 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7ED1F1682;
	Thu, 22 Aug 2024 08:13:38 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60AA93F58B;
	Thu, 22 Aug 2024 08:13:08 -0700 (PDT)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: nd@arm.com,
	akpm@linux-foundation.org,
	aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com,
	anshuman.khandual@arm.com,
	bp@alien8.de,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	christophe.leroy@csgroup.eu,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	joey.gouly@arm.com,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	maz@kernel.org,
	mingo@redhat.com,
	mpe@ellerman.id.au,
	naveen.n.rao@linux.ibm.com,
	npiggin@gmail.com,
	oliver.upton@linux.dev,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com,
	tglx@linutronix.de,
	will@kernel.org,
	x86@kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v5 25/30] selftests: mm: move fpregs printing
Date: Thu, 22 Aug 2024 16:11:08 +0100
Message-Id: <20240822151113.1479789-26-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240822151113.1479789-1-joey.gouly@arm.com>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arm64's fpregs are not at a constant offset from sigcontext. Since this is
not an important part of the test, don't print the fpregs pointer on arm64.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
---
 tools/testing/selftests/mm/pkey-powerpc.h    | 1 +
 tools/testing/selftests/mm/pkey-x86.h        | 2 ++
 tools/testing/selftests/mm/protection_keys.c | 6 ++++++
 3 files changed, 9 insertions(+)

diff --git tools/testing/selftests/mm/pkey-powerpc.h tools/testing/selftests/mm/pkey-powerpc.h
index ae5df26104e5..6275d0f474b3 100644
--- tools/testing/selftests/mm/pkey-powerpc.h
+++ tools/testing/selftests/mm/pkey-powerpc.h
@@ -9,6 +9,7 @@
 #endif
 #define REG_IP_IDX		PT_NIP
 #define REG_TRAPNO		PT_TRAP
+#define MCONTEXT_FPREGS
 #define gregs			gp_regs
 #define fpregs			fp_regs
 #define si_pkey_offset		0x20
diff --git tools/testing/selftests/mm/pkey-x86.h tools/testing/selftests/mm/pkey-x86.h
index 814758e109c0..b9170a26bfcb 100644
--- tools/testing/selftests/mm/pkey-x86.h
+++ tools/testing/selftests/mm/pkey-x86.h
@@ -15,6 +15,8 @@
 
 #endif
 
+#define MCONTEXT_FPREGS
+
 #ifndef PKEY_DISABLE_ACCESS
 # define PKEY_DISABLE_ACCESS	0x1
 #endif
diff --git tools/testing/selftests/mm/protection_keys.c tools/testing/selftests/mm/protection_keys.c
index eaa6d1fc5328..4337106a985e 100644
--- tools/testing/selftests/mm/protection_keys.c
+++ tools/testing/selftests/mm/protection_keys.c
@@ -314,7 +314,9 @@ void signal_handler(int signum, siginfo_t *si, void *vucontext)
 	ucontext_t *uctxt = vucontext;
 	int trapno;
 	unsigned long ip;
+#ifdef MCONTEXT_FPREGS
 	char *fpregs;
+#endif
 #if defined(__i386__) || defined(__x86_64__) /* arch */
 	u32 *pkey_reg_ptr;
 	int pkey_reg_offset;
@@ -330,7 +332,9 @@ void signal_handler(int signum, siginfo_t *si, void *vucontext)
 
 	trapno = uctxt->uc_mcontext.gregs[REG_TRAPNO];
 	ip = uctxt->uc_mcontext.gregs[REG_IP_IDX];
+#ifdef MCONTEXT_FPREGS
 	fpregs = (char *) uctxt->uc_mcontext.fpregs;
+#endif
 
 	dprintf2("%s() trapno: %d ip: 0x%016lx info->si_code: %s/%d\n",
 			__func__, trapno, ip, si_code_str(si->si_code),
@@ -359,7 +363,9 @@ void signal_handler(int signum, siginfo_t *si, void *vucontext)
 #endif /* arch */
 
 	dprintf1("siginfo: %p\n", si);
+#ifdef MCONTEXT_FPREGS
 	dprintf1(" fpregs: %p\n", fpregs);
+#endif
 
 	if ((si->si_code == SEGV_MAPERR) ||
 	    (si->si_code == SEGV_ACCERR) ||
-- 
2.25.1


