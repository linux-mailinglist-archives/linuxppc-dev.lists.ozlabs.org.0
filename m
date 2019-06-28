Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 615A459BD0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 14:41:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZxFs3bN3zDqFD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 22:41:05 +1000 (AEST)
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
 header.b="e+2o4PfT"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zx2B0MWPzDql9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 22:30:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/ACtFTJ8t0rgRWDNSeADECk30Wwk28wX2Poo52xAGI8=; b=e+2o4PfTUqmLAP9+yVgRTSMqCY
 Tnf5U0x2uPJDPkns5j2lSPUa//SkDRojN/zK7V3DPohSOh24J2v2XKdQVQPgWUQRkknLsIsR2a8sw
 vIAtdmC4K3NnPyXm2z2HalcpZEHRSrjqde3msUjYzWYE60G4cwtqKGBoAYWj4cxEpZ9n8vkk4NQTY
 1+enRTu9Mq7VFZJn9umR7TD5TBCMyx72vxi0UDfoSYRsI6HfJ0L9lPadMMeWB5FaFlAffVzHajfi7
 eN3oY5WswA3cPdrB9qfCaBwvbmkCjuN4BFIdR7nw0X6L23eBpFfBVPgLZAKHqt7pbT7NyOgMG4Gb8
 qPMmGZ4w==;
Received: from [186.213.242.156] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hgq1U-00055C-Fo; Fri, 28 Jun 2019 12:30:36 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hgq1S-0005Rx-94; Fri, 28 Jun 2019 09:30:34 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 13/39] docs: add arch doc directories to the index
Date: Fri, 28 Jun 2019 09:30:06 -0300
Message-Id: <df4b7dbf72f2ca0695adc6e5997ad852be2332a7.1561724493.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1561724493.git.mchehab+samsung@kernel.org>
References: <cover.1561724493.git.mchehab+samsung@kernel.org>
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
Cc: linux-s390@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Vasily Gorbik <gor@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Paul Mackerras <paulus@samba.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that several arch documents were converted to ReST,
add their indexes to Documentation/index.rst and remove the
:orphan:  from them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/arm/index.rst     |  2 --
 Documentation/arm64/index.rst   |  2 --
 Documentation/ia64/index.rst    |  2 --
 Documentation/index.rst         | 10 ++++++++++
 Documentation/m68k/index.rst    |  2 +-
 Documentation/powerpc/index.rst |  2 +-
 Documentation/riscv/index.rst   |  2 --
 Documentation/s390/index.rst    |  2 --
 Documentation/sparc/index.rst   |  2 --
 Documentation/xtensa/index.rst  |  2 +-
 10 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/Documentation/arm/index.rst b/Documentation/arm/index.rst
index bd316d1a1802..9c2f781f4685 100644
--- a/Documentation/arm/index.rst
+++ b/Documentation/arm/index.rst
@@ -1,5 +1,3 @@
-﻿:orphan:
-
 ================
 ARM Architecture
 ================
diff --git a/Documentation/arm64/index.rst b/Documentation/arm64/index.rst
index 018b7836ecb7..96b696ba4e6c 100644
--- a/Documentation/arm64/index.rst
+++ b/Documentation/arm64/index.rst
@@ -1,5 +1,3 @@
-:orphan:
-
 ==================
 ARM64 Architecture
 ==================
diff --git a/Documentation/ia64/index.rst b/Documentation/ia64/index.rst
index a3e3052ad6e2..ef99475f672b 100644
--- a/Documentation/ia64/index.rst
+++ b/Documentation/ia64/index.rst
@@ -1,5 +1,3 @@
-:orphan:
-
 ==================
 IA-64 Architecture
 ==================
diff --git a/Documentation/index.rst b/Documentation/index.rst
index 95db26bf2899..f898def833f4 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -118,7 +118,17 @@ implementation.
    :maxdepth: 2
 
    sh/index
+   arm/index
+   arm64/index
+   ia64/index
+   m68k/index
+   powerpc/index
+   riscv/index
+   s390/index
+   sh/index
+   sparc/index
    x86/index
+   xtensa/index
 
 Filesystem Documentation
 ------------------------
diff --git a/Documentation/m68k/index.rst b/Documentation/m68k/index.rst
index f3273ec075c3..3a5ba7fe1703 100644
--- a/Documentation/m68k/index.rst
+++ b/Documentation/m68k/index.rst
@@ -1,4 +1,4 @@
-:orphan:
+.. SPDX-License-Identifier: GPL-2.0
 
 =================
 m68k Architecture
diff --git a/Documentation/powerpc/index.rst b/Documentation/powerpc/index.rst
index 1ff17268db46..549b1cdd77ae 100644
--- a/Documentation/powerpc/index.rst
+++ b/Documentation/powerpc/index.rst
@@ -1,4 +1,4 @@
-:orphan:
+.. SPDX-License-Identifier: GPL-2.0
 
 =======
 powerpc
diff --git a/Documentation/riscv/index.rst b/Documentation/riscv/index.rst
index c4b906d9b5a7..e3ca0922a8c2 100644
--- a/Documentation/riscv/index.rst
+++ b/Documentation/riscv/index.rst
@@ -1,5 +1,3 @@
-:orphan:
-
 ===================
 RISC-V architecture
 ===================
diff --git a/Documentation/s390/index.rst b/Documentation/s390/index.rst
index 1a914da2a07b..4602312909d3 100644
--- a/Documentation/s390/index.rst
+++ b/Documentation/s390/index.rst
@@ -1,5 +1,3 @@
-:orphan:
-
 =================
 s390 Architecture
 =================
diff --git a/Documentation/sparc/index.rst b/Documentation/sparc/index.rst
index 91f7d6643dd5..71cff621f243 100644
--- a/Documentation/sparc/index.rst
+++ b/Documentation/sparc/index.rst
@@ -1,5 +1,3 @@
-:orphan:
-
 ==================
 Sparc Architecture
 ==================
diff --git a/Documentation/xtensa/index.rst b/Documentation/xtensa/index.rst
index 5a24e365e35f..52fa04eb39a3 100644
--- a/Documentation/xtensa/index.rst
+++ b/Documentation/xtensa/index.rst
@@ -1,4 +1,4 @@
-:orphan:
+.. SPDX-License-Identifier: GPL-2.0
 
 ===================
 Xtensa Architecture
-- 
2.21.0

