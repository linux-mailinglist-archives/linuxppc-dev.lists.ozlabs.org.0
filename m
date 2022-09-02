Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4654E5AB9FC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 23:22:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MK9q550g0z3cB3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 07:22:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EQq/l/qX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EQq/l/qX;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MK9nr2G7zz2xmm
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 07:21:20 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 870CFB8210C;
	Fri,  2 Sep 2022 21:21:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271D3C433D6;
	Fri,  2 Sep 2022 21:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662153674;
	bh=eWZ1WFI29bIY9CowHVOiNXNbqdEm93gAvfQTCCfIKSo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EQq/l/qX18npncevPv1AE/N4PVXxCGMKZRtjq0/OALsfIxKmQI6tY21eyM0W8Iwim
	 dVj+t98kzTXez2i+2cJZxRkzFpQcX8uncZpVNczUvjQoEs9+QONMaLKdOy8lo9+tGH
	 s1Mmk2dmlab3lwdUmUdPcpa02u1/UX+O+Xcw9n3VmvLpshS9eHvklvZJ83g3TCKNH1
	 j/oMtLaE91Ur+wyi8EBuoCudLCju6UMaqsGSNgMCWJi9ksLgGGP7H4O2gItmqv5+RU
	 Mm3JrbTIPW712buA+UlMoqzBdwBU2SUINIGkUdhBnf3HiKM3Rjgx71KjpWG8zZhlbr
	 y3kUwQdl1ppjg==
Received: by pali.im (Postfix)
	id 58B9A2808; Fri,  2 Sep 2022 23:21:11 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>
Subject: [PATCH 2/2] powerpc: Include e500v1_power_isa.dtsi for remaining e500v1 platforms
Date: Fri,  2 Sep 2022 23:21:03 +0200
Message-Id: <20220902212103.22534-2-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220902212103.22534-1-pali@kernel.org>
References: <20220902212103.22534-1-pali@kernel.org>
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

There are still some board device tree files without Power ISA properties
which have Freescale e500v1 cores, namely those which are based on
Freescale mpc8540, mpc8541, mpc8555 and mpc8560 processors.

So include newly introduced e500v1_power_isa.dtsi file in devices tree
files with those processors.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/boot/dts/ksi8560.dts      | 2 ++
 arch/powerpc/boot/dts/stx_gp3_8560.dts | 2 ++
 arch/powerpc/boot/dts/stxssa8555.dts   | 2 ++
 arch/powerpc/boot/dts/tqm8540.dts      | 2 ++
 arch/powerpc/boot/dts/tqm8541.dts      | 2 ++
 arch/powerpc/boot/dts/tqm8555.dts      | 2 ++
 arch/powerpc/boot/dts/tqm8560.dts      | 2 ++
 7 files changed, 14 insertions(+)

diff --git a/arch/powerpc/boot/dts/ksi8560.dts b/arch/powerpc/boot/dts/ksi8560.dts
index fe6c17c8812a..37a7eb576d02 100644
--- a/arch/powerpc/boot/dts/ksi8560.dts
+++ b/arch/powerpc/boot/dts/ksi8560.dts
@@ -14,6 +14,8 @@
 
 /dts-v1/;
 
+/include/ "fsl/e500v1_power_isa.dtsi"
+
 / {
 	model = "KSI8560";
 	compatible = "emerson,KSI8560";
diff --git a/arch/powerpc/boot/dts/stx_gp3_8560.dts b/arch/powerpc/boot/dts/stx_gp3_8560.dts
index d1ab698eef36..e73f7e75b0b4 100644
--- a/arch/powerpc/boot/dts/stx_gp3_8560.dts
+++ b/arch/powerpc/boot/dts/stx_gp3_8560.dts
@@ -7,6 +7,8 @@
 
 /dts-v1/;
 
+/include/ "fsl/e500v1_power_isa.dtsi"
+
 / {
 	model = "stx,gp3";
 	compatible = "stx,gp3-8560", "stx,gp3";
diff --git a/arch/powerpc/boot/dts/stxssa8555.dts b/arch/powerpc/boot/dts/stxssa8555.dts
index 5dca2a91c41f..96add25c904b 100644
--- a/arch/powerpc/boot/dts/stxssa8555.dts
+++ b/arch/powerpc/boot/dts/stxssa8555.dts
@@ -9,6 +9,8 @@
 
 /dts-v1/;
 
+/include/ "fsl/e500v1_power_isa.dtsi"
+
 / {
 	model = "stx,gp3";
         compatible = "stx,gp3-8560", "stx,gp3";
diff --git a/arch/powerpc/boot/dts/tqm8540.dts b/arch/powerpc/boot/dts/tqm8540.dts
index 9c1eb9779108..eb4d8fd3f7aa 100644
--- a/arch/powerpc/boot/dts/tqm8540.dts
+++ b/arch/powerpc/boot/dts/tqm8540.dts
@@ -7,6 +7,8 @@
 
 /dts-v1/;
 
+/include/ "fsl/e500v1_power_isa.dtsi"
+
 / {
 	model = "tqc,tqm8540";
 	compatible = "tqc,tqm8540";
diff --git a/arch/powerpc/boot/dts/tqm8541.dts b/arch/powerpc/boot/dts/tqm8541.dts
index 44595cf675d0..fe5d3d873ec9 100644
--- a/arch/powerpc/boot/dts/tqm8541.dts
+++ b/arch/powerpc/boot/dts/tqm8541.dts
@@ -7,6 +7,8 @@
 
 /dts-v1/;
 
+/include/ "fsl/e500v1_power_isa.dtsi"
+
 / {
 	model = "tqc,tqm8541";
 	compatible = "tqc,tqm8541";
diff --git a/arch/powerpc/boot/dts/tqm8555.dts b/arch/powerpc/boot/dts/tqm8555.dts
index 54f3e82907d6..4be05b7d225d 100644
--- a/arch/powerpc/boot/dts/tqm8555.dts
+++ b/arch/powerpc/boot/dts/tqm8555.dts
@@ -7,6 +7,8 @@
 
 /dts-v1/;
 
+/include/ "fsl/e500v1_power_isa.dtsi"
+
 / {
 	model = "tqc,tqm8555";
 	compatible = "tqc,tqm8555";
diff --git a/arch/powerpc/boot/dts/tqm8560.dts b/arch/powerpc/boot/dts/tqm8560.dts
index 7415cb69f60d..8ea48502420b 100644
--- a/arch/powerpc/boot/dts/tqm8560.dts
+++ b/arch/powerpc/boot/dts/tqm8560.dts
@@ -8,6 +8,8 @@
 
 /dts-v1/;
 
+/include/ "fsl/e500v1_power_isa.dtsi"
+
 / {
 	model = "tqc,tqm8560";
 	compatible = "tqc,tqm8560";
-- 
2.20.1

