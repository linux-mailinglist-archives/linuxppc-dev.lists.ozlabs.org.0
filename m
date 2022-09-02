Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D96E05AB9FB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 23:21:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MK9pQ62Cyz3bnj
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 07:21:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XOoJ7WBI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XOoJ7WBI;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MK9nm3ZDTz2xmm
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 07:21:16 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1F5C06143A;
	Fri,  2 Sep 2022 21:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C311C433C1;
	Fri,  2 Sep 2022 21:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662153671;
	bh=gtA3mZspcIkAO5q5+QzGaBO8XNZ0ayfsNt1Fu8t0hhs=;
	h=From:To:Cc:Subject:Date:From;
	b=XOoJ7WBIO14VZr25jns0ogH6zTUXGBSfsN1xVdU2DL8Wbo0WO+aVkhclGRTcCjlnA
	 9zwPOU9qCBfWMNMYjyUpu6EPqH2OdxhnYHWjdWbiKOfsiN6zCgQU/dgB38w5hIUAks
	 HqLwuS9QGKUtwbPRTPDZROk23T95r/xykDDq9hjNmSmbSBu31TJ1RVcXF7E0jRbiLX
	 a4EpH1xSY8JUMNGcrcovR2iusqVUE8dbuq5ZAHSoxEVWixR7zz8YgNrJKIuKfc17pp
	 S3JqRWyp8ZZf/mZ5NonD11Onr77jdtwIN4nzPQgYWOngeoNfwgRw9Ng8+nfh1v6Z/z
	 z/eScuD3ISzdA==
Received: by pali.im (Postfix)
	id 5BE717EA; Fri,  2 Sep 2022 23:21:08 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>
Subject: [PATCH 1/2] powerpc: Fix SPE Power ISA properties for e500v1 platforms
Date: Fri,  2 Sep 2022 23:21:02 +0200
Message-Id: <20220902212103.22534-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 2eb28006431c ("powerpc/e500v2: Add Power ISA properties to comply
with ePAPR 1.1") introduced new include file e500v2_power_isa.dtsi and
should have used it for all e500v2 platforms. But apparently it was used
also for e500v1 platforms mpc8540, mpc8541, mpc8555 and mpc8560.

e500v1 cores compared to e500v2 do not support double precision floating
point SPE instructions. Hence power-isa-sp.fd should not be set on e500v1
platforms, which is in e500v2_power_isa.dtsi include file.

Fix this issue by introducing a new e500v1_power_isa.dtsi include file and
use it in all e500v1 device tree files.

Fixes: 2eb28006431c ("powerpc/e500v2: Add Power ISA properties to comply with ePAPR 1.1")
Signed-off-by: Pali Rohár <pali@kernel.org>
---
 .../dts/fsl/{e500v2_power_isa.dtsi => e500v1_power_isa.dtsi}   | 3 +--
 arch/powerpc/boot/dts/fsl/mpc8540ads.dts                       | 2 +-
 arch/powerpc/boot/dts/fsl/mpc8541cds.dts                       | 2 +-
 arch/powerpc/boot/dts/fsl/mpc8555cds.dts                       | 2 +-
 arch/powerpc/boot/dts/fsl/mpc8560ads.dts                       | 2 +-
 5 files changed, 5 insertions(+), 6 deletions(-)
 copy arch/powerpc/boot/dts/fsl/{e500v2_power_isa.dtsi => e500v1_power_isa.dtsi} (95%)

diff --git a/arch/powerpc/boot/dts/fsl/e500v2_power_isa.dtsi b/arch/powerpc/boot/dts/fsl/e500v1_power_isa.dtsi
similarity index 95%
copy from arch/powerpc/boot/dts/fsl/e500v2_power_isa.dtsi
copy to arch/powerpc/boot/dts/fsl/e500v1_power_isa.dtsi
index f4928144d2c8..7e2a90cde72e 100644
--- a/arch/powerpc/boot/dts/fsl/e500v2_power_isa.dtsi
+++ b/arch/powerpc/boot/dts/fsl/e500v1_power_isa.dtsi
@@ -1,5 +1,5 @@
 /*
- * e500v2 Power ISA Device Tree Source (include)
+ * e500v1 Power ISA Device Tree Source (include)
  *
  * Copyright 2012 Freescale Semiconductor Inc.
  *
@@ -44,7 +44,6 @@
 		power-isa-ecl;		// Embedded Cache Locking
 		power-isa-mmc;		// Memory Coherence
 		power-isa-sp;		// Signal Processing Engine
-		power-isa-sp.fd;	// SPE.Embedded Float Scalar Double
 		power-isa-sp.fs;	// SPE.Embedded Float Scalar Single
 		power-isa-sp.fv;	// SPE.Embedded Float Vector
 		mmu-type = "power-embedded";
diff --git a/arch/powerpc/boot/dts/fsl/mpc8540ads.dts b/arch/powerpc/boot/dts/fsl/mpc8540ads.dts
index 18a885130538..e03ae130162b 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8540ads.dts
+++ b/arch/powerpc/boot/dts/fsl/mpc8540ads.dts
@@ -7,7 +7,7 @@
 
 /dts-v1/;
 
-/include/ "e500v2_power_isa.dtsi"
+/include/ "e500v1_power_isa.dtsi"
 
 / {
 	model = "MPC8540ADS";
diff --git a/arch/powerpc/boot/dts/fsl/mpc8541cds.dts b/arch/powerpc/boot/dts/fsl/mpc8541cds.dts
index ac381e7b1c60..a2a6c5cf852e 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8541cds.dts
+++ b/arch/powerpc/boot/dts/fsl/mpc8541cds.dts
@@ -7,7 +7,7 @@
 
 /dts-v1/;
 
-/include/ "e500v2_power_isa.dtsi"
+/include/ "e500v1_power_isa.dtsi"
 
 / {
 	model = "MPC8541CDS";
diff --git a/arch/powerpc/boot/dts/fsl/mpc8555cds.dts b/arch/powerpc/boot/dts/fsl/mpc8555cds.dts
index 9f58db2a7e66..901b6ff06dfb 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8555cds.dts
+++ b/arch/powerpc/boot/dts/fsl/mpc8555cds.dts
@@ -7,7 +7,7 @@
 
 /dts-v1/;
 
-/include/ "e500v2_power_isa.dtsi"
+/include/ "e500v1_power_isa.dtsi"
 
 / {
 	model = "MPC8555CDS";
diff --git a/arch/powerpc/boot/dts/fsl/mpc8560ads.dts b/arch/powerpc/boot/dts/fsl/mpc8560ads.dts
index a24722ccaebf..c2f9aea78b29 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8560ads.dts
+++ b/arch/powerpc/boot/dts/fsl/mpc8560ads.dts
@@ -7,7 +7,7 @@
 
 /dts-v1/;
 
-/include/ "e500v2_power_isa.dtsi"
+/include/ "e500v1_power_isa.dtsi"
 
 / {
 	model = "MPC8560ADS";
-- 
2.20.1

