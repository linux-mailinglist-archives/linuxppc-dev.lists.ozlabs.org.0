Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5CF2C8868
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 16:41:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cl8bk0d60zDqc4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 02:41:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=mchehab@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=TRWg1GIg; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cl8V75y2zzDqC7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 02:36:47 +1100 (AEDT)
Received: from mail.kernel.org (ip5f5ad5b3.dynamic.kabel-deutschland.de
 [95.90.213.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E293208FE;
 Mon, 30 Nov 2020 15:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606750605;
 bh=0DZIgPt81ePJ9MlFFkPWiF0x1oIC/jHfOBLqtU2LcVQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TRWg1GIgqep5FzBHzkhpbCADpinxgS3ZjWHDVNibMKTRwXUJQmJyz7Cx5qxuqtlb0
 C1IRZBGOAVGVeXjpV5tj7szk81cPRFjh/SC/zJkd+dJOYYH5AisFE3uHGXVbuxprSq
 xv247OkjYg7f0ThknaQ0sapQBHmSRChC6tg3L3Jw=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kjlEI-00CjvU-Hk; Mon, 30 Nov 2020 16:36:42 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 6/6] docs: archis: add a per-architecture features list
Date: Mon, 30 Nov 2020 16:36:35 +0100
Message-Id: <9c39d4dd93e05c0008205527d2c3450912f029ed.1606748711.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606748711.git.mchehab+huawei@kernel.org>
References: <cover.1606748711.git.mchehab+huawei@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jonas Bonn <jonas@southpole.se>,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a feature list matrix for each architecture to their
respective Kernel books.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/arm/features.rst      |  3 +++
 Documentation/arm/index.rst         |  2 ++
 Documentation/arm64/features.rst    |  3 +++
 Documentation/arm64/index.rst       |  2 ++
 Documentation/ia64/features.rst     |  3 +++
 Documentation/ia64/index.rst        |  2 ++
 Documentation/index.rst             |  2 +-
 Documentation/m68k/features.rst     |  3 +++
 Documentation/m68k/index.rst        |  2 ++
 Documentation/mips/features.rst     |  3 +++
 Documentation/mips/index.rst        |  2 ++
 Documentation/nios2/index.rst       | 12 ++++++++++++
 Documentation/openrisc/features.rst |  3 +++
 Documentation/openrisc/index.rst    |  2 ++
 Documentation/parisc/features.rst   |  3 +++
 Documentation/parisc/index.rst      |  2 ++
 Documentation/powerpc/features.rst  |  3 +++
 Documentation/powerpc/index.rst     |  2 ++
 Documentation/riscv/features.rst    |  3 +++
 Documentation/riscv/index.rst       |  2 ++
 Documentation/s390/features.rst     |  3 +++
 Documentation/s390/index.rst        |  2 ++
 Documentation/sh/features.rst       |  3 +++
 Documentation/sh/index.rst          |  2 ++
 Documentation/sparc/features.rst    |  3 +++
 Documentation/sparc/index.rst       |  2 ++
 Documentation/x86/features.rst      |  3 +++
 Documentation/x86/index.rst         |  1 +
 Documentation/xtensa/features.rst   |  3 +++
 Documentation/xtensa/index.rst      |  2 ++
 30 files changed, 82 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/arm/features.rst
 create mode 100644 Documentation/arm64/features.rst
 create mode 100644 Documentation/ia64/features.rst
 create mode 100644 Documentation/m68k/features.rst
 create mode 100644 Documentation/mips/features.rst
 create mode 100644 Documentation/nios2/index.rst
 create mode 100644 Documentation/openrisc/features.rst
 create mode 100644 Documentation/parisc/features.rst
 create mode 100644 Documentation/powerpc/features.rst
 create mode 100644 Documentation/riscv/features.rst
 create mode 100644 Documentation/s390/features.rst
 create mode 100644 Documentation/sh/features.rst
 create mode 100644 Documentation/sparc/features.rst
 create mode 100644 Documentation/x86/features.rst
 create mode 100644 Documentation/xtensa/features.rst

diff --git a/Documentation/arm/features.rst b/Documentation/arm/features.rst
new file mode 100644
index 000000000000..7414ec03dd15
--- /dev/null
+++ b/Documentation/arm/features.rst
@@ -0,0 +1,3 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. kernel-feat:: $srctree/Documentation/features arm
diff --git a/Documentation/arm/index.rst b/Documentation/arm/index.rst
index 5fc072dd0c5e..a2e9e1bba7b9 100644
--- a/Documentation/arm/index.rst
+++ b/Documentation/arm/index.rst
@@ -23,6 +23,8 @@ ARM Architecture
    vlocks
    porting
 
+   features
+
 SoC-specific documents
 ======================
 
diff --git a/Documentation/arm64/features.rst b/Documentation/arm64/features.rst
new file mode 100644
index 000000000000..dfa4cb3cd3ef
--- /dev/null
+++ b/Documentation/arm64/features.rst
@@ -0,0 +1,3 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. kernel-feat:: $srctree/Documentation/features arm64
diff --git a/Documentation/arm64/index.rst b/Documentation/arm64/index.rst
index 937634c49979..97d65ba12a35 100644
--- a/Documentation/arm64/index.rst
+++ b/Documentation/arm64/index.rst
@@ -24,6 +24,8 @@ ARM64 Architecture
     tagged-address-abi
     tagged-pointers
 
+    features
+
 .. only::  subproject and html
 
    Indices
diff --git a/Documentation/ia64/features.rst b/Documentation/ia64/features.rst
new file mode 100644
index 000000000000..d7226fdcf5f8
--- /dev/null
+++ b/Documentation/ia64/features.rst
@@ -0,0 +1,3 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. kernel-feat:: $srctree/Documentation/features ia64
diff --git a/Documentation/ia64/index.rst b/Documentation/ia64/index.rst
index 4bdfe28067ee..761f2154dfa2 100644
--- a/Documentation/ia64/index.rst
+++ b/Documentation/ia64/index.rst
@@ -15,3 +15,5 @@ IA-64 Architecture
    irq-redir
    mca
    serial
+
+   features
diff --git a/Documentation/index.rst b/Documentation/index.rst
index 57719744774c..5888e8a7272f 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -160,7 +160,7 @@ implementation.
    ia64/index
    m68k/index
    mips/index
-   nios2/nios2
+   nios2/index
    openrisc/index
    parisc/index
    powerpc/index
diff --git a/Documentation/m68k/features.rst b/Documentation/m68k/features.rst
new file mode 100644
index 000000000000..5107a2119472
--- /dev/null
+++ b/Documentation/m68k/features.rst
@@ -0,0 +1,3 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. kernel-feat:: $srctree/Documentation/features m68k
diff --git a/Documentation/m68k/index.rst b/Documentation/m68k/index.rst
index b89cb6a86d9b..0f890dbb5fe2 100644
--- a/Documentation/m68k/index.rst
+++ b/Documentation/m68k/index.rst
@@ -10,6 +10,8 @@ m68k Architecture
    kernel-options
    buddha-driver
 
+   features
+
 .. only::  subproject and html
 
    Indices
diff --git a/Documentation/mips/features.rst b/Documentation/mips/features.rst
new file mode 100644
index 000000000000..1973d729b29a
--- /dev/null
+++ b/Documentation/mips/features.rst
@@ -0,0 +1,3 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. kernel-feat:: $srctree/Documentation/features mips
diff --git a/Documentation/mips/index.rst b/Documentation/mips/index.rst
index 35cceea4e8bc..037f85a08fe3 100644
--- a/Documentation/mips/index.rst
+++ b/Documentation/mips/index.rst
@@ -11,6 +11,8 @@ MIPS-specific Documentation
    booting
    ingenic-tcu
 
+   features
+
 .. only::  subproject and html
 
    Indices
diff --git a/Documentation/nios2/index.rst b/Documentation/nios2/index.rst
new file mode 100644
index 000000000000..4468fe1a1037
--- /dev/null
+++ b/Documentation/nios2/index.rst
@@ -0,0 +1,12 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============================
+Nios II Specific Documentation
+==============================
+
+.. toctree::
+   :maxdepth: 2
+   :numbered:
+
+   nios2
+   features
diff --git a/Documentation/openrisc/features.rst b/Documentation/openrisc/features.rst
new file mode 100644
index 000000000000..3f7c40d219f2
--- /dev/null
+++ b/Documentation/openrisc/features.rst
@@ -0,0 +1,3 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. kernel-feat:: $srctree/Documentation/features openrisc
diff --git a/Documentation/openrisc/index.rst b/Documentation/openrisc/index.rst
index 748b3eea1707..6879f998b87a 100644
--- a/Documentation/openrisc/index.rst
+++ b/Documentation/openrisc/index.rst
@@ -10,6 +10,8 @@ OpenRISC Architecture
    openrisc_port
    todo
 
+   features
+
 .. only::  subproject and html
 
    Indices
diff --git a/Documentation/parisc/features.rst b/Documentation/parisc/features.rst
new file mode 100644
index 000000000000..501d7c450037
--- /dev/null
+++ b/Documentation/parisc/features.rst
@@ -0,0 +1,3 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. kernel-feat:: $srctree/Documentation/features parisc
diff --git a/Documentation/parisc/index.rst b/Documentation/parisc/index.rst
index aa3ee0470425..240685751825 100644
--- a/Documentation/parisc/index.rst
+++ b/Documentation/parisc/index.rst
@@ -10,6 +10,8 @@ PA-RISC Architecture
    debugging
    registers
 
+   features
+
 .. only::  subproject and html
 
    Indices
diff --git a/Documentation/powerpc/features.rst b/Documentation/powerpc/features.rst
new file mode 100644
index 000000000000..aeae73df86b0
--- /dev/null
+++ b/Documentation/powerpc/features.rst
@@ -0,0 +1,3 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. kernel-feat:: $srctree/Documentation/features powerpc
diff --git a/Documentation/powerpc/index.rst b/Documentation/powerpc/index.rst
index 6ec64b0d5257..bf5f1a2bdbdf 100644
--- a/Documentation/powerpc/index.rst
+++ b/Documentation/powerpc/index.rst
@@ -34,6 +34,8 @@ powerpc
     vas-api
     vcpudispatch_stats
 
+    features
+
 .. only::  subproject and html
 
    Indices
diff --git a/Documentation/riscv/features.rst b/Documentation/riscv/features.rst
new file mode 100644
index 000000000000..c70ef6ac2368
--- /dev/null
+++ b/Documentation/riscv/features.rst
@@ -0,0 +1,3 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. kernel-feat:: $srctree/Documentation/features riscv
diff --git a/Documentation/riscv/index.rst b/Documentation/riscv/index.rst
index fa33bffd8992..6e6e39482502 100644
--- a/Documentation/riscv/index.rst
+++ b/Documentation/riscv/index.rst
@@ -9,6 +9,8 @@ RISC-V architecture
     pmu
     patch-acceptance
 
+    features
+
 .. only::  subproject and html
 
    Indices
diff --git a/Documentation/s390/features.rst b/Documentation/s390/features.rst
new file mode 100644
index 000000000000..57c296a9d8f3
--- /dev/null
+++ b/Documentation/s390/features.rst
@@ -0,0 +1,3 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. kernel-feat:: $srctree/Documentation/features s390
diff --git a/Documentation/s390/index.rst b/Documentation/s390/index.rst
index cf71df5776b4..b10ca9192557 100644
--- a/Documentation/s390/index.rst
+++ b/Documentation/s390/index.rst
@@ -19,6 +19,8 @@ s390 Architecture
 
     text_files
 
+    features
+
 .. only::  subproject and html
 
    Indices
diff --git a/Documentation/sh/features.rst b/Documentation/sh/features.rst
new file mode 100644
index 000000000000..f722af3b6c99
--- /dev/null
+++ b/Documentation/sh/features.rst
@@ -0,0 +1,3 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. kernel-feat:: $srctree/Documentation/features sh
diff --git a/Documentation/sh/index.rst b/Documentation/sh/index.rst
index 7b9a79a28167..c64776738cf6 100644
--- a/Documentation/sh/index.rst
+++ b/Documentation/sh/index.rst
@@ -11,6 +11,8 @@ SuperH Interfaces Guide
     new-machine
     register-banks
 
+    features
+
 Memory Management
 =================
 
diff --git a/Documentation/sparc/features.rst b/Documentation/sparc/features.rst
new file mode 100644
index 000000000000..c0c92468b0fe
--- /dev/null
+++ b/Documentation/sparc/features.rst
@@ -0,0 +1,3 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. kernel-feat:: $srctree/Documentation/features sparc
diff --git a/Documentation/sparc/index.rst b/Documentation/sparc/index.rst
index 71cff621f243..ae884224eec2 100644
--- a/Documentation/sparc/index.rst
+++ b/Documentation/sparc/index.rst
@@ -9,3 +9,5 @@ Sparc Architecture
    adi
 
    oradax/oracle-dax
+
+   features
diff --git a/Documentation/x86/features.rst b/Documentation/x86/features.rst
new file mode 100644
index 000000000000..b663f15053ce
--- /dev/null
+++ b/Documentation/x86/features.rst
@@ -0,0 +1,3 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. kernel-feat:: $srctree/Documentation/features x86
diff --git a/Documentation/x86/index.rst b/Documentation/x86/index.rst
index b224d12c880b..b4fcb6f258b2 100644
--- a/Documentation/x86/index.rst
+++ b/Documentation/x86/index.rst
@@ -33,3 +33,4 @@ x86-specific Documentation
    i386/index
    x86_64/index
    sva
+   features
diff --git a/Documentation/xtensa/features.rst b/Documentation/xtensa/features.rst
new file mode 100644
index 000000000000..6b92c7bfa19d
--- /dev/null
+++ b/Documentation/xtensa/features.rst
@@ -0,0 +1,3 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. kernel-feat:: $srctree/Documentation/features xtensa
diff --git a/Documentation/xtensa/index.rst b/Documentation/xtensa/index.rst
index 52fa04eb39a3..69952446a9be 100644
--- a/Documentation/xtensa/index.rst
+++ b/Documentation/xtensa/index.rst
@@ -10,3 +10,5 @@ Xtensa Architecture
    atomctl
    booting
    mmu
+
+   features
-- 
2.28.0

