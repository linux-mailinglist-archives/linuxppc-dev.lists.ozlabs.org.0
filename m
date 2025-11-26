Return-Path: <linuxppc-dev+bounces-14500-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 395D0C89820
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Nov 2025 12:27:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dGcjS0jQSz2yvR;
	Wed, 26 Nov 2025 22:27:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764156443;
	cv=none; b=N4d5HRzdqxTsc+r9gzt9w2tIjvMFkY5IuVz1brYiMdGwW/+cBS+s51CUEOMBsOhFRzpBWVzFLOPVLqG8ggAFKHuRn4kEbRD6LTsM3y9TdW/cUcgffiFKpupIjK8GEdetFcOUlJC7hvwpbZatcs+nYACTOxoB7JkBq3RiS2QfR6HSAmOogXgV4HpseinvSTh0XP9k/pRrEAkzB8pMkIsS9VpCCmKpeztJay3dwmwDycXy+/Mi3FevSFX6SoDkyOlBd96c3xTdEsYbmphr92H9T2zEfNYZRHE8qkrfTsAqxgIJzj9TB1+JsVFOa6PqQK3SNzCvUAtbd8+ij+0PVK5NwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764156443; c=relaxed/relaxed;
	bh=mqvI5cfbyMkQwsTN/oiUSJc4hMBw0ZMkOnzF4oPeo0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YYwOs3SntpRUPrPBcgW9DhpXtjwzS7ORgCGocM76A9M0/VUz4NtfZ7oZpPcJI9s8vnyeMg2M5XCgNOTXGY22/QgOe/6PhgPWsMnk1Wm+u73A+NISbj8S4fjCQmlDwlt22DIc1NUZu6FGwAeO6UO8AmgVHp4h2JTbrCpj3Bvdcx+91dFXU5SDBicWsrncWaLoPkgUUwlgBfbU7OPqlEF+uVwGQETcDBpiMbcCorm2/7/sPATrmd/qQURovz2hZeDVjBanvjCcjbXUov78dqBmq+isfCSsx48QHpEC68ZJUA0b2fuqbjrp8F4qsgwciQdp9apQ1GdO7paNizaEe9qj+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MWUVxPXP; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MWUVxPXP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dGcjQ6JHqz2yvH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Nov 2025 22:27:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 13BCF40487
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Nov 2025 11:27:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF8ECC113D0;
	Wed, 26 Nov 2025 11:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764156439;
	bh=ztVpjoOdnxMsE9uHrmWSqqzjItmShKMkiNx+2AXPkD0=;
	h=From:To:Cc:Subject:Date:From;
	b=MWUVxPXPdw4BDm8Sj/NromzR9pc6YnJiC+zi3JDU0ujyTz8V5cWQMos/3KnkgVnz6
	 0smjUktq8Yjyj3zSude6xFjbVNbPMNxiNnsMWSm9qZ+v1+AhNeCQT3snzpRnL+o90r
	 ReSgD62A6pix9bQaiN5QjwR4/hs5E/c8hTTvWIV3UhQHcZgqZeRm20/sNhPeTUiebG
	 7Wd5u2MqdETc9eV+MIIL7DSwFvtvzyOzCvMXOY8D4auBX4kiscYX0+ELrKSM1q7TAl
	 YzcEZ8KhHyWE0YJWo0V8JVPrZWbXK05S+PCsU9zp3H4S5w8cGvL12qj30JRWMnraou
	 Symu8sDXQ8aSg==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: [PATCH v2] MAINTAINERS: Update email address for Christophe Leroy
Date: Wed, 26 Nov 2025 12:26:57 +0100
Message-ID: <d9b6758297d7dcddf79feb4459ceaedd7d6f1f2e.1764155757.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.49.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3307; i=chleroy@kernel.org; h=from:subject:message-id; bh=ztVpjoOdnxMsE9uHrmWSqqzjItmShKMkiNx+2AXPkD0=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWSqPWFPPe/rG7NlzaLev+fY/Mv6ag4a2BaX/xHOylzA/ vaT7rWXHaUsDGJcDLJiiizH/3PvmtH1JTV/6i59mDmsTCBDGLg4BWAi0vMYGf48vnTpxGrL85cX MO/imfnxoeEKM7Xl/L910qsKpB+HqB9iZHg3xebaJ3vf+08zM7TzzivVhdvtZm7JcPPvfbf3c7a zFB8A
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

My address at csgroup.eu is redirected to the new one at
cs-soprasteria.com which is a Professionnal Microsoft account without
SMTP gateway. We still have the SMTP gateway for csgroup.eu but it is
not maintained anymore and might stop working at anytime. In addition
the DKIM signature is not performed allthough the domain has DMARC
set up.

Switch to kernel.org email address and add entries in mailmap.

Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
I will take this patch through the SOC FSL tree.

v2: Added affiliation to the display name
---
 .mailmap    |  3 +++
 MAINTAINERS | 10 +++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/.mailmap b/.mailmap
index d2edd256b19d..55408cd5e082 100644
--- a/.mailmap
+++ b/.mailmap
@@ -184,6 +184,9 @@ Christian Brauner <brauner@kernel.org> <christian@brauner.io>
 Christian Brauner <brauner@kernel.org> <christian.brauner@canonical.com>
 Christian Brauner <brauner@kernel.org> <christian.brauner@ubuntu.com>
 Christian Marangi <ansuelsmth@gmail.com>
+Christophe Leroy <chleroy@kernel.org> <christophe.leroy@c-s.fr>
+Christophe Leroy <chleroy@kernel.org> <christophe.leroy@csgroup.eu>
+Christophe Leroy <chleroy@kernel.org> <christophe.leroy2@cs-soprasteria.com>
 Christophe Ricard <christophe.ricard@gmail.com>
 Christopher Obbard <christopher.obbard@linaro.org> <chris.obbard@collabora.com>
 Christoph Hellwig <hch@lst.de>
diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968..c338baa3af99 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4532,7 +4532,7 @@ F:	drivers/net/ethernet/netronome/nfp/bpf/
 
 BPF JIT for POWERPC (32-BIT AND 64-BIT)
 M:	Hari Bathini <hbathini@linux.ibm.com>
-M:	Christophe Leroy <christophe.leroy@csgroup.eu>
+M:	Christophe Leroy (CS GROUP) <chleroy@kernel.org>
 R:	Naveen N Rao <naveen@kernel.org>
 L:	bpf@vger.kernel.org
 S:	Supported
@@ -10003,7 +10003,7 @@ F:	drivers/spi/spi-fsl-qspi.c
 
 FREESCALE QUICC ENGINE LIBRARY
 M:	Qiang Zhao <qiang.zhao@nxp.com>
-M:	Christophe Leroy <christophe.leroy@csgroup.eu>
+M:	Christophe Leroy (CS GROUP) <chleroy@kernel.org>
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Maintained
 F:	drivers/soc/fsl/qe/
@@ -10056,7 +10056,7 @@ S:	Maintained
 F:	drivers/tty/serial/ucc_uart.c
 
 FREESCALE SOC DRIVERS
-M:	Christophe Leroy <christophe.leroy@csgroup.eu>
+M:	Christophe Leroy (CS GROUP) <chleroy@kernel.org>
 L:	linuxppc-dev@lists.ozlabs.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
@@ -14296,7 +14296,7 @@ LINUX FOR POWERPC (32-BIT AND 64-BIT)
 M:	Madhavan Srinivasan <maddy@linux.ibm.com>
 M:	Michael Ellerman <mpe@ellerman.id.au>
 R:	Nicholas Piggin <npiggin@gmail.com>
-R:	Christophe Leroy <christophe.leroy@csgroup.eu>
+R:	Christophe Leroy (CS GROUP) <chleroy@kernel.org>
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Supported
 W:	https://github.com/linuxppc/wiki/wiki
@@ -14352,7 +14352,7 @@ F:	Documentation/devicetree/bindings/powerpc/fsl/
 F:	arch/powerpc/platforms/85xx/
 
 LINUX FOR POWERPC EMBEDDED PPC8XX AND PPC83XX
-M:	Christophe Leroy <christophe.leroy@csgroup.eu>
+M:	Christophe Leroy (CS GROUP) <chleroy@kernel.org>
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Maintained
 F:	arch/powerpc/platforms/8xx/
-- 
2.49.0


