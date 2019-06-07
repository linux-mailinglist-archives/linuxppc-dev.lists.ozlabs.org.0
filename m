Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3AC3951A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 20:59:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45LBfg3SGbzDqFB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2019 04:59:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org; envelope-from=mchehab@bombadil.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="Y15WIe1h"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45LBY35HhzzDqsb
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jun 2019 04:55:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9BFa2w9dMfs23jOauwpVzpiJfCyUvRSxJugmmRhg1+Y=; b=Y15WIe1h7RPtXfVg22IaFG2tXE
 jj21RoR5ji9hW/5iHiNsUij9LVME21L0rqVFtBCDMlpjSRfhysh/yuHiSOyw4pueOTm4CLPYm2Jqz
 7zNqjECImbRU6kQQb0vgexgHrsc//KTxsEdJgN/PnScnipxBPkVKNL0DfIBSl5IjWEUU4/pN1aHkp
 IQ6M3/cSEYcvDAviucCr3n7cKcQp+HQrHtPU4DdqvAWQ0iU+4CJAP48DAuSF8fweXu6SA0pkQTO9X
 kaZsKnt9RvfnmKZewOVk9HvV+hY407Ql4vOSl/TzV+uc1EkVTECFepaldWMDUX68NBWWtpGdvH42L
 tfdlZLnA==;
Received: from [179.181.119.115] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hZK0d-0005sn-O1; Fri, 07 Jun 2019 18:54:39 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hZK0b-0007FS-J9; Fri, 07 Jun 2019 15:54:37 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v3 15/20] docs: move protection-keys.rst to the core-api book
Date: Fri,  7 Jun 2019 15:54:31 -0300
Message-Id: <4948a096397bb86cebf489b8ac4f623797257fe7.1559933665.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <ff457774d46d96e8fe56b45409aba39d87a8672a.1559933665.git.mchehab+samsung@kernel.org>
References: <ff457774d46d96e8fe56b45409aba39d87a8672a.1559933665.git.mchehab+samsung@kernel.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, Jonathan Corbet <corbet@lwn.net>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Shuah Khan <shuah@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This document is used by multiple architectures:

	$ echo $(git grep -l  pkey_mprotect arch|cut -d'/' -f 2|sort|uniq)
	alpha arm arm64 ia64 m68k microblaze mips parisc powerpc s390 sh sparc x86 xtensa

So, let's move it to the core book and adjust the links to it
accordingly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/core-api/index.rst                    | 1 +
 Documentation/{x86 => core-api}/protection-keys.rst | 0
 Documentation/x86/index.rst                         | 1 -
 arch/powerpc/Kconfig                                | 2 +-
 arch/x86/Kconfig                                    | 2 +-
 tools/testing/selftests/x86/protection_keys.c       | 2 +-
 6 files changed, 4 insertions(+), 4 deletions(-)
 rename Documentation/{x86 => core-api}/protection-keys.rst (100%)

diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index ee1bb8983a88..2466a4c51031 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -34,6 +34,7 @@ Core utilities
    timekeeping
    boot-time-mm
    memory-hotplug
+   protection-keys
 
 
 Interfaces for kernel debugging
diff --git a/Documentation/x86/protection-keys.rst b/Documentation/core-api/protection-keys.rst
similarity index 100%
rename from Documentation/x86/protection-keys.rst
rename to Documentation/core-api/protection-keys.rst
diff --git a/Documentation/x86/index.rst b/Documentation/x86/index.rst
index ae36fc5fc649..f2de1b2d3ac7 100644
--- a/Documentation/x86/index.rst
+++ b/Documentation/x86/index.rst
@@ -19,7 +19,6 @@ x86-specific Documentation
    tlb
    mtrr
    pat
-   protection-keys
    intel_mpx
    amd-memory-encryption
    pti
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 8c1c636308c8..3b795a0cab62 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -898,7 +898,7 @@ config PPC_MEM_KEYS
 	  page-based protections, but without requiring modification of the
 	  page tables when an application changes protection domains.
 
-	  For details, see Documentation/vm/protection-keys.rst
+	  For details, see Documentation/core-api/protection-keys.rst
 
 	  If unsure, say y.
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 2bbbd4d1ba31..d87d53fcd261 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1911,7 +1911,7 @@ config X86_INTEL_MEMORY_PROTECTION_KEYS
 	  page-based protections, but without requiring modification of the
 	  page tables when an application changes protection domains.
 
-	  For details, see Documentation/x86/protection-keys.txt
+	  For details, see Documentation/core-api/protection-keys.rst
 
 	  If unsure, say y.
 
diff --git a/tools/testing/selftests/x86/protection_keys.c b/tools/testing/selftests/x86/protection_keys.c
index 5d546dcdbc80..480995bceefa 100644
--- a/tools/testing/selftests/x86/protection_keys.c
+++ b/tools/testing/selftests/x86/protection_keys.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Tests x86 Memory Protection Keys (see Documentation/x86/protection-keys.txt)
+ * Tests x86 Memory Protection Keys (see Documentation/core-api/protection-keys.rst)
  *
  * There are examples in here of:
  *  * how to set protection keys on memory
-- 
2.21.0

