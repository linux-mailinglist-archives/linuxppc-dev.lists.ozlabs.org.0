Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A97B259B8D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 14:34:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zx6309KhzDqld
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 22:34:19 +1000 (AEST)
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
 header.b="QMdyrqAc"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zx1y4jHVzDqgG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 22:30:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zII5lYqfAV6Dv/1vdlGrUpmQd0t8s5Xk0MQllo77src=; b=QMdyrqAceSryUV22cBi3MRrTgt
 3cFDKnoqsJ5dHJh9LoMDSwmwT3M6ZflEnYx+Hcerg4s1juteOOYv8V4X/nmVlQzRWxkSxtuWtySO7
 T4Fc9UJjN2gm7TRcJBz1RrjQF7iWirHg8uS3tEifEoPeg/EJ4RM8vzS3FA+/9CZKNuIIPSj9mUsMT
 3zkMBVtI2JsY3zbv2Dil0fejPzMpK00lIZrp18xYuOIGLFSn4Gx71h+FGtzFTXeICc/nSFaGSSwGt
 8bLpBSi33Q4C0ZuEdeiOXtGJbVD7yj8SPlR4M1CUcyH9MndxlG39MUsT13gZk6Ij1ItJn01gEY9So
 lEnWQTbQ==;
Received: from [186.213.242.156] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hgq1U-00055V-Jj; Fri, 28 Jun 2019 12:30:36 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hgq1S-0005Sg-Gl; Fri, 28 Jun 2019 09:30:34 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 22/39] docs: ocxl.rst: add it to the uAPI book
Date: Fri, 28 Jun 2019 09:30:15 -0300
Message-Id: <ee63ec4412f2f8c87da877f67f693f2cd85c1a37.1561724493.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1561724493.git.mchehab+samsung@kernel.org>
References: <cover.1561724493.git.mchehab+samsung@kernel.org>
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The content of this file is user-faced.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/{ => userspace-api}/accelerators/ocxl.rst | 2 --
 Documentation/userspace-api/index.rst                   | 1 +
 MAINTAINERS                                             | 2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)
 rename Documentation/{ => userspace-api}/accelerators/ocxl.rst (99%)

diff --git a/Documentation/accelerators/ocxl.rst b/Documentation/userspace-api/accelerators/ocxl.rst
similarity index 99%
rename from Documentation/accelerators/ocxl.rst
rename to Documentation/userspace-api/accelerators/ocxl.rst
index b1cea19a90f5..14cefc020e2d 100644
--- a/Documentation/accelerators/ocxl.rst
+++ b/Documentation/userspace-api/accelerators/ocxl.rst
@@ -1,5 +1,3 @@
-:orphan:
-
 ========================================================
 OpenCAPI (Open Coherent Accelerator Processor Interface)
 ========================================================
diff --git a/Documentation/userspace-api/index.rst b/Documentation/userspace-api/index.rst
index a3233da7fa88..ad494da40009 100644
--- a/Documentation/userspace-api/index.rst
+++ b/Documentation/userspace-api/index.rst
@@ -20,6 +20,7 @@ place where this information is gathered.
    seccomp_filter
    unshare
    spec_ctrl
+   accelerators/ocxl
 
 .. only::  subproject and html
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 29d1498ad39d..f723371dccd0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11483,7 +11483,7 @@ F:	arch/powerpc/include/asm/pnv-ocxl.h
 F:	drivers/misc/ocxl/
 F:	include/misc/ocxl*
 F:	include/uapi/misc/ocxl.h
-F:	Documentation/accelerators/ocxl.rst
+F:	Documentation/userspace-api/accelerators/ocxl.rst
 
 OMAP AUDIO SUPPORT
 M:	Peter Ujfalusi <peter.ujfalusi@ti.com>
-- 
2.21.0

