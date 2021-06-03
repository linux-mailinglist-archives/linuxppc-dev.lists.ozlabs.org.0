Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ED639A6D6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 19:09:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fwsnx6vN2z3c3Y
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 03:09:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z2dbQBZJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Z2dbQBZJ; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwsnW2KqBz309F
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jun 2021 03:09:19 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC3AC61406;
 Thu,  3 Jun 2021 17:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622740156;
 bh=9WxW4QTmRWs0rCdYI7UOG3Yi5cPw0dSS6Du7NcDGoz0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z2dbQBZJ30QChEbkwPkWTBEkU/hlARZ8+xJFeSh0iz0z76jmC1ZoZB6cn1u5XJvua
 yclVdbqyar5jdCRO0jVNEVFzGLCpQ/0Q/OngMR+IakJdWrnfe+agZ3eKlUaeZM/T3Y
 RON+o2hm7Z6SYuutZs3S0962yfcs4lKbK7sCjNSKlzfBRYf5vCKLX22jT2J305klXi
 trSKUtSK5BAWJqxnMsQ2NWExZdSs2wyPcjJ2xR0HaXEa2oNdKcdvcS/k+84Ez/AVSj
 seslVwXxauBtCwTsrNf5+yTu0vLeqm2GOpAWjndfdRFbmybytwnuOHwVkBGi4axRCZ
 6+DYOAjbnKlkQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 38/39] powerpc/fsl: set fsl,
 i2c-erratum-a004447 flag for P2041 i2c controllers
Date: Thu,  3 Jun 2021 13:08:28 -0400
Message-Id: <20210603170829.3168708-38-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210603170829.3168708-1-sashal@kernel.org>
References: <20210603170829.3168708-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Chris Packham <chris.packham@alliedtelesis.co.nz>

[ Upstream commit 7adc7b225cddcfd0f346d10144fd7a3d3d9f9ea7 ]

The i2c controllers on the P2040/P2041 have an erratum where the
documented scheme for i2c bus recovery will not work (A-004447). A
different mechanism is needed which is documented in the P2040 Chip
Errata Rev Q (latest available at the time of writing).

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/boot/dts/fsl/p2041si-post.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi b/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi
index 872e4485dc3f..ddc018d42252 100644
--- a/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi
@@ -371,7 +371,23 @@ sdhc@114000 {
 	};
 
 /include/ "qoriq-i2c-0.dtsi"
+	i2c@118000 {
+		fsl,i2c-erratum-a004447;
+	};
+
+	i2c@118100 {
+		fsl,i2c-erratum-a004447;
+	};
+
 /include/ "qoriq-i2c-1.dtsi"
+	i2c@119000 {
+		fsl,i2c-erratum-a004447;
+	};
+
+	i2c@119100 {
+		fsl,i2c-erratum-a004447;
+	};
+
 /include/ "qoriq-duart-0.dtsi"
 /include/ "qoriq-duart-1.dtsi"
 /include/ "qoriq-gpio-0.dtsi"
-- 
2.30.2

