Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D682E944
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 01:26:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Dn0M0PF5zDqNL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 09:26:27 +1000 (AEST)
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
 header.b="TUTbNEI2"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Dmxt13ZPzDqFD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 09:24:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pLa6QBXDUlkvKl0F9KmB92FN1yBU20l3+fc3LLX9/Ow=; b=TUTbNEI2sFRqzFdX8mAEDw+ZKk
 XtHS4RpAgwYG5mZM22U1r6M0vo9yBLzdpBWxLG+Wua96AfW4fGlJvlNU4cwOADtGPiZmrkKWvTbCA
 +YlWRB5YJuvFtbYIZXOusbPxpxpK7XsazwynFvbwvZf9cNf3WTWLfqLh+qA00YXjPTsZuDlOCdtga
 duJk804hRhhdM7AAVrd8q+J05abzsvq5dJZOHHiK+GjqJam/lkUK4JruIWmnniYsXhPKSyxV8wube
 cTsvAcSBdajn4t+NWdFdqsXfNt6brPC/m0bcxjACGqdLnz+bast5CItihyQj2txojtCoXFRwIv9JW
 P1hLrtIA==;
Received: from 177.132.232.81.dynamic.adsl.gvt.net.br ([177.132.232.81]
 helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hW7vL-0005Rw-HW; Wed, 29 May 2019 23:23:59 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hW7vI-0007xI-NZ; Wed, 29 May 2019 20:23:56 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 09/22] docs: mark orphan documents as such
Date: Wed, 29 May 2019 20:23:40 -0300
Message-Id: <e0bf4e767dd5de9189e5993fbec2f4b1bafd2064.1559171394.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1559171394.git.mchehab+samsung@kernel.org>
References: <cover.1559171394.git.mchehab+samsung@kernel.org>
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
Cc: kvm@vger.kernel.org,
 =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Andrew Donnellan <ajd@linux.ibm.com>,
 linux-pm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matan Ziv-Av <matan@svgalib.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, Georgi Djakov <georgi.djakov@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sphinx doesn't like orphan documents:

    Documentation/accelerators/ocxl.rst: WARNING: document isn't included in any toctree
    Documentation/arm/stm32/overview.rst: WARNING: document isn't included in any toctree
    Documentation/arm/stm32/stm32f429-overview.rst: WARNING: document isn't included in any toctree
    Documentation/arm/stm32/stm32f746-overview.rst: WARNING: document isn't included in any toctree
    Documentation/arm/stm32/stm32f769-overview.rst: WARNING: document isn't included in any toctree
    Documentation/arm/stm32/stm32h743-overview.rst: WARNING: document isn't included in any toctree
    Documentation/arm/stm32/stm32mp157-overview.rst: WARNING: document isn't included in any toctree
    Documentation/gpu/msm-crash-dump.rst: WARNING: document isn't included in any toctree
    Documentation/interconnect/interconnect.rst: WARNING: document isn't included in any toctree
    Documentation/laptops/lg-laptop.rst: WARNING: document isn't included in any toctree
    Documentation/powerpc/isa-versions.rst: WARNING: document isn't included in any toctree
    Documentation/virtual/kvm/amd-memory-encryption.rst: WARNING: document isn't included in any toctree
    Documentation/virtual/kvm/vcpu-requests.rst: WARNING: document isn't included in any toctree

So, while they aren't on any toctree, add :orphan: to them, in order
to silent this warning.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/accelerators/ocxl.rst                 | 2 ++
 Documentation/arm/stm32/overview.rst                | 2 ++
 Documentation/arm/stm32/stm32f429-overview.rst      | 2 ++
 Documentation/arm/stm32/stm32f746-overview.rst      | 2 ++
 Documentation/arm/stm32/stm32f769-overview.rst      | 2 ++
 Documentation/arm/stm32/stm32h743-overview.rst      | 2 ++
 Documentation/arm/stm32/stm32mp157-overview.rst     | 2 ++
 Documentation/gpu/msm-crash-dump.rst                | 2 ++
 Documentation/interconnect/interconnect.rst         | 2 ++
 Documentation/laptops/lg-laptop.rst                 | 2 ++
 Documentation/powerpc/isa-versions.rst              | 2 ++
 Documentation/virtual/kvm/amd-memory-encryption.rst | 2 ++
 Documentation/virtual/kvm/vcpu-requests.rst         | 2 ++
 13 files changed, 26 insertions(+)

diff --git a/Documentation/accelerators/ocxl.rst b/Documentation/accelerators/ocxl.rst
index 14cefc020e2d..b1cea19a90f5 100644
--- a/Documentation/accelerators/ocxl.rst
+++ b/Documentation/accelerators/ocxl.rst
@@ -1,3 +1,5 @@
+:orphan:
+
 ========================================================
 OpenCAPI (Open Coherent Accelerator Processor Interface)
 ========================================================
diff --git a/Documentation/arm/stm32/overview.rst b/Documentation/arm/stm32/overview.rst
index 85cfc8410798..f7e734153860 100644
--- a/Documentation/arm/stm32/overview.rst
+++ b/Documentation/arm/stm32/overview.rst
@@ -1,3 +1,5 @@
+:orphan:
+
 ========================
 STM32 ARM Linux Overview
 ========================
diff --git a/Documentation/arm/stm32/stm32f429-overview.rst b/Documentation/arm/stm32/stm32f429-overview.rst
index 18feda97f483..65bbb1c3b423 100644
--- a/Documentation/arm/stm32/stm32f429-overview.rst
+++ b/Documentation/arm/stm32/stm32f429-overview.rst
@@ -1,3 +1,5 @@
+:orphan:
+
 STM32F429 Overview
 ==================
 
diff --git a/Documentation/arm/stm32/stm32f746-overview.rst b/Documentation/arm/stm32/stm32f746-overview.rst
index b5f4b6ce7656..42d593085015 100644
--- a/Documentation/arm/stm32/stm32f746-overview.rst
+++ b/Documentation/arm/stm32/stm32f746-overview.rst
@@ -1,3 +1,5 @@
+:orphan:
+
 STM32F746 Overview
 ==================
 
diff --git a/Documentation/arm/stm32/stm32f769-overview.rst b/Documentation/arm/stm32/stm32f769-overview.rst
index 228656ced2fe..f6adac862b17 100644
--- a/Documentation/arm/stm32/stm32f769-overview.rst
+++ b/Documentation/arm/stm32/stm32f769-overview.rst
@@ -1,3 +1,5 @@
+:orphan:
+
 STM32F769 Overview
 ==================
 
diff --git a/Documentation/arm/stm32/stm32h743-overview.rst b/Documentation/arm/stm32/stm32h743-overview.rst
index 3458dc00095d..c525835e7473 100644
--- a/Documentation/arm/stm32/stm32h743-overview.rst
+++ b/Documentation/arm/stm32/stm32h743-overview.rst
@@ -1,3 +1,5 @@
+:orphan:
+
 STM32H743 Overview
 ==================
 
diff --git a/Documentation/arm/stm32/stm32mp157-overview.rst b/Documentation/arm/stm32/stm32mp157-overview.rst
index 62e176d47ca7..2c52cd020601 100644
--- a/Documentation/arm/stm32/stm32mp157-overview.rst
+++ b/Documentation/arm/stm32/stm32mp157-overview.rst
@@ -1,3 +1,5 @@
+:orphan:
+
 STM32MP157 Overview
 ===================
 
diff --git a/Documentation/gpu/msm-crash-dump.rst b/Documentation/gpu/msm-crash-dump.rst
index 757cd257e0d8..240ef200f76c 100644
--- a/Documentation/gpu/msm-crash-dump.rst
+++ b/Documentation/gpu/msm-crash-dump.rst
@@ -1,3 +1,5 @@
+:orphan:
+
 =====================
 MSM Crash Dump Format
 =====================
diff --git a/Documentation/interconnect/interconnect.rst b/Documentation/interconnect/interconnect.rst
index c3e004893796..56e331dab70e 100644
--- a/Documentation/interconnect/interconnect.rst
+++ b/Documentation/interconnect/interconnect.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+:orphan:
+
 =====================================
 GENERIC SYSTEM INTERCONNECT SUBSYSTEM
 =====================================
diff --git a/Documentation/laptops/lg-laptop.rst b/Documentation/laptops/lg-laptop.rst
index aa503ee9b3bc..f2c2ffe31101 100644
--- a/Documentation/laptops/lg-laptop.rst
+++ b/Documentation/laptops/lg-laptop.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
+:orphan:
+
 LG Gram laptop extra features
 =============================
 
diff --git a/Documentation/powerpc/isa-versions.rst b/Documentation/powerpc/isa-versions.rst
index 812e20cc898c..66c24140ebf1 100644
--- a/Documentation/powerpc/isa-versions.rst
+++ b/Documentation/powerpc/isa-versions.rst
@@ -1,3 +1,5 @@
+:orphan:
+
 CPU to ISA Version Mapping
 ==========================
 
diff --git a/Documentation/virtual/kvm/amd-memory-encryption.rst b/Documentation/virtual/kvm/amd-memory-encryption.rst
index 659bbc093b52..33d697ab8a58 100644
--- a/Documentation/virtual/kvm/amd-memory-encryption.rst
+++ b/Documentation/virtual/kvm/amd-memory-encryption.rst
@@ -1,3 +1,5 @@
+:orphan:
+
 ======================================
 Secure Encrypted Virtualization (SEV)
 ======================================
diff --git a/Documentation/virtual/kvm/vcpu-requests.rst b/Documentation/virtual/kvm/vcpu-requests.rst
index 5feb3706a7ae..c1807a1b92e6 100644
--- a/Documentation/virtual/kvm/vcpu-requests.rst
+++ b/Documentation/virtual/kvm/vcpu-requests.rst
@@ -1,3 +1,5 @@
+:orphan:
+
 =================
 KVM VCPU Requests
 =================
-- 
2.21.0

