Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A72751AC6B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 20:10:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtlGw6Y5kz3bqB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 04:10:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=il4XHKFt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=il4XHKFt; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtlGK6Yrnz3bhR
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 04:09:29 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E720A6198D;
 Wed,  4 May 2022 18:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2671AC385A4;
 Wed,  4 May 2022 18:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651687767;
 bh=3kqhCh3SolC+njYvrb7YQlbkMsd43/qschNFbE7v3Ws=;
 h=From:To:Cc:Subject:Date:From;
 b=il4XHKFtZrHDm4R3lYlPB+0PXkhshnPKaJhlUEv5+5oFwY8GwlWrgOodHjYI9OSzP
 uMd5kuvN1bSfQbJM5nzIDpsr2oXt5540xxSoG+3Bym0+CjnPlFZcBhxTcWwokhKJZB
 SG7uK52bxDbXhk82tr5fbuNS4F6cVWetEWMx+uanTleLnUccgDLYhXf0sLehRvd+mL
 2izCqUROVPJMZpGotj5rYScky6sgw+QqMiHS1eGl9iI6tT2dYt0fvJPeliii7CyVEl
 IsFZQOENiTQ8Hr9dRf+BLmAv9grs6aJOcgGcutV2ynOVCXDGbYa0dIJGEw5iDgNRpN
 mM7tiaxAAs81w==
Received: by pali.im (Postfix)
 id 7AA0996D; Wed,  4 May 2022 20:09:24 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH] powerpc/85xx: P2020: Add law_trgt_if property to PCIe DT nodes
Date: Wed,  4 May 2022 20:08:22 +0200
Message-Id: <20220504180822.29782-1-pali@kernel.org>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DT law_trgt_if property defines Local Access Window Target Interface.

Local Access Window Target Interface is used for identifying individual
peripheral and mapping its memory to CPU. Interface id is defined by
hardware itself.

U-Boot uses law_trgt_if DT property in PCIe nodes for configuring memory
mapping of individual PCIe controllers.

Linux kernel fsl_pci.c driver currently does not touch Local Access Window
and expects that U-Boot configures it properly.

Add law_trgt_if property to PCIe DT nodes for P2020. This allows usage of
kernel P2020 PCIe DT nodes in U-Boot. And therefore allows to share P2020
DTS files between Linux kernel and U-Boot.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/boot/dts/fsl/p2020si-post.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/boot/dts/fsl/p2020si-post.dtsi b/arch/powerpc/boot/dts/fsl/p2020si-post.dtsi
index 884e01bcb243..6345629524fe 100644
--- a/arch/powerpc/boot/dts/fsl/p2020si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p2020si-post.dtsi
@@ -48,6 +48,7 @@
 	bus-range = <0 255>;
 	clock-frequency = <33333333>;
 	interrupts = <26 2 0 0>;
+	law_trgt_if = <2>;
 
 	pcie@0 {
 		reg = <0 0 0 0 0>;
@@ -76,6 +77,7 @@
 	bus-range = <0 255>;
 	clock-frequency = <33333333>;
 	interrupts = <25 2 0 0>;
+	law_trgt_if = <1>;
 
 	pcie@0 {
 		reg = <0 0 0 0 0>;
@@ -105,6 +107,7 @@
 	bus-range = <0 255>;
 	clock-frequency = <33333333>;
 	interrupts = <24 2 0 0>;
+	law_trgt_if = <0>;
 
 	pcie@0 {
 		reg = <0 0 0 0 0>;
-- 
2.20.1

