Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D39A51E037
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 22:37:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kw2S00GSdz3c7v
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 06:37:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BZ77tpSE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BZ77tpSE; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kw2RJ4RR1z3bcV
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 06:36:44 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C1BBCB8399C;
 Fri,  6 May 2022 20:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF87C385A8;
 Fri,  6 May 2022 20:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651869397;
 bh=FaJKk4lpjmUfqPc1hBjX7ULYsTAHts26Sy5B/hA3fJU=;
 h=From:To:Cc:Subject:Date:From;
 b=BZ77tpSEMPlorPtTlNv9P5WqZNKxtLZgS0S6Ts8F6IiHcS6dlHeZyB21a+MHDJ2dJ
 0pGkIB57JhUYWdzg9eKLacQmaouWApXO0uQrWA1y+dURFpOBJXEI0YOxuz9+J2B7V+
 F8DAURyLo5VWu5mmv19/PsPucV7H0iDsgv9yI/rv3dUtTYgjpm9WuLVIdg4Lqt0nEO
 t4nNlilEQoUm5ohp12zan7pGYAf+DU3vAXTki29SrdNn2DauYom3mlwPbYpjhNp8uB
 iEw/WbrWTgnx6Oct8z2Mz9Q4bjBogNpd4I5Vp9e3x5xbPxO0SBLNog/F5xsv1qSSfh
 rNfGUvtpb316w==
Received: by pali.im (Postfix)
 id 3F1CE1141; Fri,  6 May 2022 22:36:34 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH] powerpc/85xx: P2020: Add fsl,mpc8548-pmc node
Date: Fri,  6 May 2022 22:36:21 +0200
Message-Id: <20220506203621.26314-1-pali@kernel.org>
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

P2020 also contains Power Management Controller and their registers at
offset 0xe0070 compatible with mpc8548. So add PMC node into DTS include
file fsl/p2020si-post.dtsi

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/boot/dts/fsl/p2020si-post.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/boot/dts/fsl/p2020si-post.dtsi b/arch/powerpc/boot/dts/fsl/p2020si-post.dtsi
index 6345629524fe..81b9ab2119be 100644
--- a/arch/powerpc/boot/dts/fsl/p2020si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p2020si-post.dtsi
@@ -201,4 +201,9 @@
 		reg = <0xe0000 0x1000>;
 		fsl,has-rstcr;
 	};
+
+	pmc: power@e0070 {
+		compatible = "fsl,mpc8548-pmc";
+		reg = <0xe0070 0x20>;
+	};
 };
-- 
2.20.1

