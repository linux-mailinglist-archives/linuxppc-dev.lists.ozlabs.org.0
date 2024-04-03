Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7C58967B8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 10:08:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cvSPhldb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8cnd6Vfxz3dX3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 19:08:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cvSPhldb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8cmy0Bw8z30hQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 19:07:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 829CF61378;
	Wed,  3 Apr 2024 08:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 951BCC43394;
	Wed,  3 Apr 2024 08:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712131663;
	bh=DfgrdIQHoOxH+2TugFyR/+ff9D+Pn9X95ms+e4KOlOo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cvSPhldbzQ28ytw8g7KXAHbWMo76SFb4yERsC/I1lFWdR1BNpTRt8Tq6F39wtGTGF
	 sGx5JswGoJMQmUaFaiUv3ObDX1+KLIKtUDSD3YQ72PQEuNXEDWpAXRnAPek4RE3gFk
	 c1GbLt9ef7ZK8kkt7hLYPklbVqmnZbyc27QgskspyHof17Z/W9JpBs464et44/aaKI
	 jDA6i2Zg6aIEW7xL0vdTPbiBFIlMHlYCnzjKoEaS1MmycqX7BDD8ZAC9/Ntfn9vXMR
	 8xAVyO7U9KINKcEGrzL/jMwW5DrMaV/MoW8gTP3iP1MNACqRSR51F83VTRy3Qk6Hwn
	 rcI3LyP40at0Q==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Alexander Graf <agraf@suse.de>,
	Stuart Yoder <stuart.yoder@freescale.com>,
	Scott Wood <scottwood@freescale.com>
Subject: [PATCH 01/34] powerpc/fsl-soc: hide unused const variable
Date: Wed,  3 Apr 2024 10:06:19 +0200
Message-Id: <20240403080702.3509288-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403080702.3509288-1-arnd@kernel.org>
References: <20240403080702.3509288-1-arnd@kernel.org>
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
Cc: Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

vmpic_msi_feature is only used conditionally, which triggers a rare
-Werror=unused-const-variable= warning with gcc:

arch/powerpc/sysdev/fsl_msi.c:567:37: error: 'vmpic_msi_feature' defined but not used [-Werror=unused-const-variable=]
  567 | static const struct fsl_msi_feature vmpic_msi_feature =

Hide this one in the same #ifdef as the reference so we can turn on
the warning by default.

Fixes: 305bcf26128e ("powerpc/fsl-soc: use CONFIG_EPAPR_PARAVIRT for hcalls")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/sysdev/fsl_msi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/sysdev/fsl_msi.c b/arch/powerpc/sysdev/fsl_msi.c
index 8e6c84df4ca1..e205135ae1fe 100644
--- a/arch/powerpc/sysdev/fsl_msi.c
+++ b/arch/powerpc/sysdev/fsl_msi.c
@@ -564,10 +564,12 @@ static const struct fsl_msi_feature ipic_msi_feature = {
 	.msiir_offset = 0x38,
 };
 
+#ifdef CONFIG_EPAPR_PARAVIRT
 static const struct fsl_msi_feature vmpic_msi_feature = {
 	.fsl_pic_ip = FSL_PIC_IP_VMPIC,
 	.msiir_offset = 0,
 };
+#endif
 
 static const struct of_device_id fsl_of_msi_ids[] = {
 	{
-- 
2.39.2

