Return-Path: <linuxppc-dev+bounces-952-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D55296B36E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 09:51:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzF6s0Xc2z2yGl;
	Wed,  4 Sep 2024 17:51:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725436277;
	cv=none; b=OBufnbKxHMKi4y8+D80NoZ4Ld/ckuVYGXoqMMGcTBzm/hUfTGL1lzDCdarJfkWeS3tLaI2zCAGlihrP2Tolu58RumD86QwKbCIwl78PC0MormAaW4YpZ61RfUOlaem1m41Ce+tDf+XmI5N5anRd03aiboETO7uKcpRQ05GVGeCS2/bXOeYIOfc2OU8l0vL03EhcaWgZbZGdMFAkiFE6dKUS8XWN+N5TSClX3BAxJPnBny5xub7PiaDruLic8/O3VYktx3VHnflJNHZsXXD31xb/hGSIYMYMU94yJlC43brFuFeWeqcFMMzjzF5wLGobKd3LHrY84JjEuEN/N8DQXUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725436277; c=relaxed/relaxed;
	bh=MSdKw0CwXEOIyQ3OuIZNHk5WE9oADOKJq4A3JA/dCHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AuBq+lY68j9k2AtMzXmFvmWlOUG7obO6mES2KZ2jpYF05MDyEkqMATnMPUOun3YbBQflygEf+vSKXA8qS5Mop5/dMFKCYwdotq176FNtOrUTsLc11NATx4H54Yi+/XwKyfUngmv0f9k/60NRAo6NV0v94Ez6+cGkX0LfJXGLpaiOCRzulnREskHZ7EZXC3ueiyLzBAoJ+6rM5iTcoFHY2hGZqXrMDiDFdaKIlJ6kWDsHcHJWxfYgkRCugw/GWiWPbh+yU7+2wnWj79gf3uncHbgYJD0OJpeZgxoutCF52Dvo7f/ky2Ib8G2CglcM9dCjNcMJlqw/UmY5cSajKFlslw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzF6r5Xv6z2xYr
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 17:51:16 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WzF6p01Lkz9sSK;
	Wed,  4 Sep 2024 09:51:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qYpIcXmvmtsx; Wed,  4 Sep 2024 09:51:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WzF6n6Qj6z9sSH;
	Wed,  4 Sep 2024 09:51:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CD9C48B77A;
	Wed,  4 Sep 2024 09:51:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id kKaLfropVvtH; Wed,  4 Sep 2024 09:51:13 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.234.246])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6886D8B778;
	Wed,  4 Sep 2024 09:51:13 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH] soc: fsl: cpm1: qmc: Fix dependency on fsl_soc.h
Date: Wed,  4 Sep 2024 09:51:09 +0200
Message-ID: <fcca0369d0bcd527aa77bccdfc0894faa029cead.1725431771.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725436270; l=1853; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=rryD/qsb8DpQ62iy4z1sC76lv2cKkZWtVUpI7BBhplw=; b=MoREKiPaV3SOEi6ZoLBSiakHPY29fDl3VZo5OxZ7yS4wsedLZM56lTJcG7q0NEx3Y/32lEuWl rxHnulqNuMsAr43O7Yx4A8IYxOOiajrhd8br9uf6JzrT0P7k2RsPM/X
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

QMC driver requires fsl_soc.h to use function get_immrbase().
This header is provided by powerpc architecture and the functions
it declares are defined only when FSL_SOC is selected.

Today the dependency is the following:

	depends on CPM1 || QUICC_ENGINE || \
		   (FSL_SOC && (CPM || QUICC_ENGINE) && COMPILE_TEST)

This dependency tentatively ensure that FSL_SOC is there when doing a
COMPILE_TEST.

CPM1 is only selected by PPC_8xx and cannot be selected manually.
CPM1 selects FSL_SOC

QUICC_ENGINE on the other hand can be selected by ARM or ARM64 which
doesn't select FSL_SOC. QUICC_ENGINE can also be selected with just
COMPILE_TEST.

It is therefore possible to end up with CPM_QMC selected
without FSL_SOC.

So fix it by making it depend on FSL_SOC at all time.

The rest of the above dependency is the same as the one for CPM_TSA on
which CPM_QMC also depends, so it can go away, leaving only a simple
dependency on FSL_SOC.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/lkml/20240904104859.020fe3a9@canb.auug.org.au/
Fixes: 8655b76b7004 ("soc: fsl: cpm1: qmc: Handle QUICC Engine (QE) soft-qmc firmware")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/qe/Kconfig b/drivers/soc/fsl/qe/Kconfig
index 5e3c996eb19e..eb03f42ab978 100644
--- a/drivers/soc/fsl/qe/Kconfig
+++ b/drivers/soc/fsl/qe/Kconfig
@@ -48,8 +48,7 @@ config CPM_TSA
 config CPM_QMC
 	tristate "CPM/QE QMC support"
 	depends on OF && HAS_IOMEM
-	depends on CPM1 || QUICC_ENGINE || \
-		   (FSL_SOC && (CPM || QUICC_ENGINE) && COMPILE_TEST)
+	depends on FSL_SOC
 	depends on CPM_TSA
 	help
 	  Freescale CPM/QE QUICC Multichannel Controller
-- 
2.44.0


