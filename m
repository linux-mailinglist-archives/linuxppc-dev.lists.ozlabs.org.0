Return-Path: <linuxppc-dev+bounces-4577-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E7E9FFE62
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 19:33:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPFgN2yfjz30Pl;
	Fri,  3 Jan 2025 05:32:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735842752;
	cv=none; b=FEZGnelI8ZEba0I6Pj2i0YWHuSTq/Besvrv+EMYp92scBxz11DqX5gmPIpzFm+LdwaXGapg/EVXbQeD2kadzndPMFknDnHA814A4ycT8YhUodh0Xhef7qsbpoSVlg8Hc0aYH/zf7KA99aCYjEhn145ujTNewj6UHoyaIpkWbtwcJw3bk51FBLLWH4ICn48AdHr7lepJPsLhD6xUkdni5iG7EptocHDsausWeDbfaoW6BPBhQAGT4ZnRIdlCqEOeO6iCgEPR0duut4X2E6SIv1BAlNPLoluSv0/kDynSLRjwR6sFARc2oBhTNNU/6icMpHLgf32S4pw4gMxkECLQKPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735842752; c=relaxed/relaxed;
	bh=4ryvXmqYbAEeH5H+0bcsEuAMQB3Uw990EpSrQEKTlQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=guiizokjtPyacwmHKt1zZPv6J9JjLKeoYBk4PSVuNGaFQm9Zwwudy5iWjc0OCfc9h1XDKmzZ3YBVQwdKazxb2sNI63AYFQbqEssOkW36ynzSqXIeyH/rebtdosZ7y7mq8Dri4a+4PXsRyPvLQ1zBkFiQSpGyBsWHcKC2eFBsW41d4t1C2FFkvRBIZmxtz/V8iFhPn16XKLtykGS51XinVhJp8rMu74uCFlX60MNRNFggomwtEeyArMgmt18nkWGdyNloIdGc4ezue1f1HCpEgLdw73SCpxo92QwcfO5ya2/AjOaxwKJ6n+3JvHFXbcjJzTYc8T/kJRNOW4jE4AFw/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZHFVUiOZ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZHFVUiOZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPFgG3t9lz2yyR
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 05:32:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CDB54A41418;
	Thu,  2 Jan 2025 18:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CA86C4CEF3;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842742;
	bh=yfwmhYwiUSm9JlLr+hh+O0Bt/U2vgFRgg3zxSAIQS9o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZHFVUiOZiYkzaQGtgHJr+NXmNv1sffFV7GHI16jLrGBqZ5qcRfVZwGTDEPXATAQRH
	 1H6be+UlJgs9mhvKJZeiAebyFVbZPMu5ZGuI1HLiGyObGaz59vlovSAoPiM4vaFqqp
	 z9XmSGKxj+9FtbqITxq3vx/SRSHrLU7ejKmiUQe93VY/x9xM/CoTZQxuKIcptf9KwZ
	 zlimeCR9a1cD4iCFWltYUX+ZB6SsmqPopuJ5wR47FnL/kNhx/QxkVWalLWizfzWM3g
	 3MMPM+CFMpDq8w2jdMqaD3dvWijBGChUZE24W3AjLnyRNhFaBKSePuOJYCweCJDC7T
	 tvAOxuX1uagOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25334E7718B;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:50 +0100
Subject: [PATCH 09/19] powerpc: boot: Build devicetrees when
 CONFIG_MPC831x=y
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250102-mpc83xx-v1-9-86f78ba2a7af@posteo.net>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
In-Reply-To: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=893;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=XjJyRLNOBRP8dGxJA13fx4b2smChJ2cfKB3451J6wqs=;
 b=gmnc4iytyw/+dvM1kg+2tdYLt8bjZsFxnmFDZtWUSklxe3fMmDu7KXGlPW8DD6cw1T4smCFzT
 mLXZOMO1dRiCkO80JYXYkXfSTVloW/oUetQpX+gD5lCg5yh6cqAzjFz
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

In order to produce useful FIT images, the kernel needs to know which
devicetrees to build. To that end, follow the same approach as other
architectures, and enable devicetrees per platform.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

I've only enabled MPC831x devicetrees, because that's the hardware I have.
---
 arch/powerpc/boot/dts/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/boot/dts/Makefile b/arch/powerpc/boot/dts/Makefile
index 0cd0d8558b475cfe342f36f4b78240ef88dd2e37..6aee895d5baaa2c978d4b1c82a6d198d9e166ea2 100644
--- a/arch/powerpc/boot/dts/Makefile
+++ b/arch/powerpc/boot/dts/Makefile
@@ -3,3 +3,8 @@
 subdir-y += fsl
 
 dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(src)/%.dts,%.dtb, $(wildcard $(src)/*.dts))
+
+dtb-$(CONFIG_MPC831x) += \
+	kmeter1.dtb \
+	mpc8313erdb.dtb \
+	mpc8315erdb.dtb

-- 
2.45.2



