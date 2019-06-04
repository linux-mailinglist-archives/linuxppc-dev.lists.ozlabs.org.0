Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4A834A43
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 16:23:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JDgJ67s8zDqcD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 00:23:40 +1000 (AEST)
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
 header.b="QGB5fTPS"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JDYQ06pPzDqW0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 00:18:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fnKal4vlAfnEhHiZ62MpoW51VyknnUeB4tHqDSZ7yb0=; b=QGB5fTPS0Y1QbkDcmoH+UkgrxA
 1pMk8z+7aPIz0M+LOllnD+yAWo2PKijhU9Of83jsAWaNOGHbvnhM2IQck3GnEi+acdgX4PFfjXX1W
 8dYMp+e54crQ0CzwiC48jwbmrELFhJ/gciYLAQXJe7mP/wV/+2HI55UusjHY/V6bFASKi5HgkPP8Q
 /bkB7ouKvrGMio/R1G2oLILaMq7yd6Ah+rImQZ6uCGXSZrYPpd7QLN9erf94Abeheb/CCJfEZt9RB
 qRJj+GdOJUVq+4w4bfEshAGOm9wTPo4f9yMhKZrNIpSOMQmMnojudwXZzDT8MIJIASC6ZhOHf4clg
 y0SDma1Q==;
Received: from [179.182.172.34] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYAGH-0001Rz-VM; Tue, 04 Jun 2019 14:18:01 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hYAGE-0002lw-V3; Tue, 04 Jun 2019 11:17:58 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v2 18/22] docs: move protection-keys.rst to the core-api book
Date: Tue,  4 Jun 2019 11:17:52 -0300
Message-Id: <07193510c4ce4be2332ec03e5232779c36e7bb4c.1559656538.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1559656538.git.mchehab+samsung@kernel.org>
References: <cover.1559656538.git.mchehab+samsung@kernel.org>
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
Cc: Michal Hocko <mhocko@suse.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 x86@kernel.org, Matthew Wilcox <willy@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Kent Overstreet <kent.overstreet@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Changbin Du <changbin.du@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
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
index 1120ff8ac715..e437aa3e78b4 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -898,7 +898,7 @@ config PPC_MEM_KEYS
 	  page-based protections, but without requiring modification of the
 	  page tables when an application changes protection domains.
 
-	  For details, see Documentation/vm/protection-keys.rst
+	  For details, see Documentation/core-api/protection-keys.rst
 
 	  If unsure, say y.
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 23de3b9da480..61244bdb886f 100644
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

