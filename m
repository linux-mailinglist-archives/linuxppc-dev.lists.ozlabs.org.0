Return-Path: <linuxppc-dev+bounces-14420-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1119EC7C9D4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Nov 2025 08:45:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dD3yq5MXjz2yvC;
	Sat, 22 Nov 2025 18:45:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763797507;
	cv=none; b=IyMtur94xnEzsDIFNmsQQj5SCFyzNu1Y2CwJtLuQ8PzSunn4dVWlTannjpIUm7uQo2FXdJSvRygeGZr8iiDYazAJYkUTixEo4tR8SYEXQaSSBUmlZyx0CI2mZWdjoA2p0QW1EnwfEu8yddiFtnC9nsNMJeA9ACaJ9T6sVz5HAMqyNIDg3Ov+De3kJXeSpwpqGd6Du7Ti/IBNV/XAMi/CaAFMRyx1LWY5oCiuiiPJRr5kyHp0ds4IVoyNncwvx4swCCx8chugKJL0fFphJkSgojg9JmBuznhO2M4vwtkgtePuFlfEAQneQIItLK79xsrKRXPdcH+uoiYt2GoFIxxTCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763797507; c=relaxed/relaxed;
	bh=67/mVs/18TuOLJmUK0fpA//SdBdv94gpo8Jso5FtStM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gBFzGDdBlfq5rHvYLdwdKsuK212j/dF9ZkouXR3zmPuW6V/VbV8jxX4HuYavdDFfN5v8Bmsp8+l63BxFU7ipi9RzuLoAh0aUB9bFZ5qiPTGsBLeAOTeZCs+ZT0t95ygSAT2RVQ6hWxiO7S6rJ/8zVqgr3C1KiqBlk5XUP9AvuVkPODl8DIhuSsuOamhBEcUd7RlwHOQwT4K/47Nk8BTBoQhQzBe3z1whqsVVrbeTLMb2TVt10FpXC/CCOqqwJ0ac26grLXyhS9NYuPl1kGyvhQv4T4ZHs2d1WeVNPZ7EWg1hn90BlFohpu/fSyDnrlyb5/RHivFJGY6GBbBgteiGQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Kv1mBtR+; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Kv1mBtR+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dD3yp0zp8z2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Nov 2025 18:45:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 283CE40A6E
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Nov 2025 07:45:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D118AC4CEF5;
	Sat, 22 Nov 2025 07:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763797503;
	bh=m0wSdBHIvKUgHhSRWVtBsnLiDh59OYlVvAXzfZbZGyc=;
	h=From:To:Cc:Subject:Date:From;
	b=Kv1mBtR+fFEfYMl88SYZX+7emR/57oGNB/eKJV4GjFECNf7lFKsdpgndGZ5T7tNxt
	 FtoBzx/ebbNMXNXa6p8nT8b8IFlomfr4ji2Rh76X33+35RvjiORJy6bXu2+tnWjP7E
	 TmdVLFJ3m8MX5RUqvQv0KtlZgyM4aF9xMg+OvjyRGgYSx+caASDXXpl1RL3HDvfR+O
	 uk8AAoPMeZiHcbR+CzD1mOkNKYRK96JsbB1Nq2rd5yEsY3RzGZmrsUI6WCOrfzvR9F
	 8j+Iz2ifAyzhLV5g4y09lDf1PR6J7JF86r8h8LmHp0MY8Eaf1rJ2ljxkYA4RKxf8s2
	 maKVGRUz6paaA==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: [PATCH] MAINTAINERS: Update email address for Christophe Leroy
Date: Sat, 22 Nov 2025 08:44:53 +0100
Message-ID: <32bfd6bf5205afd0546939cc2206c27f2101cb3f.1763796599.git.chleroy@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3207; i=chleroy@kernel.org; h=from:subject:message-id; bh=m0wSdBHIvKUgHhSRWVtBsnLiDh59OYlVvAXzfZbZGyc=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWQqZn67cvXzMamGyLksOfc1PI7slZc1i716ynhj7KJrC xcoWFyY21HKwiDGxSArpshy/D/3rhldX1Lzp+7Sh5nDygQyhIGLUwAmkm/JyLA59cKS9Y+v3T+t sITZ6532kqk3PG7NjXYOsIjyfHlpS4A2I8OkzZ3VZycoyExJW7Bqd7U939k116r4OQKfLN719sD DhUJMAA==
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
index 46126ce2f968..86f61276f0d7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4532,7 +4532,7 @@ F:	drivers/net/ethernet/netronome/nfp/bpf/
 
 BPF JIT for POWERPC (32-BIT AND 64-BIT)
 M:	Hari Bathini <hbathini@linux.ibm.com>
-M:	Christophe Leroy <christophe.leroy@csgroup.eu>
+M:	Christophe Leroy <chleroy@kernel.org>
 R:	Naveen N Rao <naveen@kernel.org>
 L:	bpf@vger.kernel.org
 S:	Supported
@@ -10003,7 +10003,7 @@ F:	drivers/spi/spi-fsl-qspi.c
 
 FREESCALE QUICC ENGINE LIBRARY
 M:	Qiang Zhao <qiang.zhao@nxp.com>
-M:	Christophe Leroy <christophe.leroy@csgroup.eu>
+M:	Christophe Leroy <chleroy@kernel.org>
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Maintained
 F:	drivers/soc/fsl/qe/
@@ -10056,7 +10056,7 @@ S:	Maintained
 F:	drivers/tty/serial/ucc_uart.c
 
 FREESCALE SOC DRIVERS
-M:	Christophe Leroy <christophe.leroy@csgroup.eu>
+M:	Christophe Leroy <chleroy@kernel.org>
 L:	linuxppc-dev@lists.ozlabs.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
@@ -14296,7 +14296,7 @@ LINUX FOR POWERPC (32-BIT AND 64-BIT)
 M:	Madhavan Srinivasan <maddy@linux.ibm.com>
 M:	Michael Ellerman <mpe@ellerman.id.au>
 R:	Nicholas Piggin <npiggin@gmail.com>
-R:	Christophe Leroy <christophe.leroy@csgroup.eu>
+R:	Christophe Leroy <chleroy@kernel.org>
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Supported
 W:	https://github.com/linuxppc/wiki/wiki
@@ -14352,7 +14352,7 @@ F:	Documentation/devicetree/bindings/powerpc/fsl/
 F:	arch/powerpc/platforms/85xx/
 
 LINUX FOR POWERPC EMBEDDED PPC8XX AND PPC83XX
-M:	Christophe Leroy <christophe.leroy@csgroup.eu>
+M:	Christophe Leroy <chleroy@kernel.org>
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Maintained
 F:	arch/powerpc/platforms/8xx/
-- 
2.49.0


