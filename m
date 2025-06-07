Return-Path: <linuxppc-dev+bounces-9202-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F522AD1011
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jun 2025 23:29:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bFBC61g7Tz2yN1;
	Sun,  8 Jun 2025 07:29:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749331746;
	cv=none; b=eqP7aB9cFOZj69kxatKW5SQ4yWh6l0tQos2+988x5xrN5Jz0j7Hd5axrPmZAbTSxwdZRQX5FrLf8pqmz0Uh+z/C4rFc+lGzjSAqYktFhT1rUKEc4bnl7gINxX6hHPqQBvytwhMx7n1O/D2tdGEOq8ZWSvCTYD5DTtP0/7D7dwULk6d+2weDEo9qAM+Q7R8GjcW9GlkXjg0L6ZLL9orw2CqTAnlFKzhEcLqszERNhhnFraQx5UvRwauMmeGuwHC9c+hVlPZAIda6YKNXBYuHflCY2JzZSoO5a+LnQJGRyr/iB1ti9y3++yNT4RojxOEvj6OFFbZzqUg4eiyxzeDTfBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749331746; c=relaxed/relaxed;
	bh=KkWeWZJ7OaUkC1X3RA6ZmwTpiZVwf7Rem3pqOW9gu1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mgftbgqDm2WMXa/q0VUvmt0NHODVd+NyXeWulIHTI/dVgLCSFdM9sN4KJMhIH6LQhn+JaS/GGU+Dfj+cdorIGP4p5mVzGsynq6pBVy/w3Se0An9gU0LHnNKdw5SwNEQ4A7mpS5ssU6oGN+yAWkx5edaIo+bEA5ImEjOgTKAp3OeQnXRBihwzEyOvxYMaYgn3RPKoYFu0yC/E+DZzicCoiJngwrt9hm7ZSpSIJwxBgZc3aVwSQK3VMDLL0p7ZX2MRwIbo1BkbQ6w9WtJMncg88NN3QORlDVpej75/3x5JviurguJJMyHLgwL5S7Tn1DzvqfBypDxw+Q04KKgeoofqSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mY86qNwL; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mY86qNwL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bFBC52hb4z2xsM
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jun 2025 07:29:05 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 96087A4145E;
	Sat,  7 Jun 2025 21:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540EDC4CEF0;
	Sat,  7 Jun 2025 21:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749331742;
	bh=XHrP+0GPTa7TRd2JvYw/E9otF7QNFDMpfbQMlQ7dElg=;
	h=From:To:Cc:Subject:Date:From;
	b=mY86qNwLX6I8JsCEklNFAVUsALMNhrv3Un7nVJZOgfLG8Vjap7lU4Dh33SKVCpxtT
	 /s/YxErxfMieOAAzAKULW93ulhJ7UhvK08BaLkSUQ9kW4mWPPLX7a+1rpaUcFKZw5H
	 SXUbrHbaVghMnhV0JWmCLG2mUckX++JyqQyBL1QkY+rzjR9HGFr7IknJak+oQtfkIf
	 mfmlSEp3a/AR1em62nYh4xOQrR/CKWt4nCXzh23R8mNmGDt+YPzeJfnc4uSyBiSyDH
	 Jz+xzEkKXFvccncEX6UV1j4DVRSc/OPiZgC2EX42LbSMsqk0JTKrwS0+vtrG24Gy6h
	 TMhT68ouW3ueQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: soc: fsl,ls1028a-reset: Drop extra "/" in $id
Date: Sat,  7 Jun 2025 16:28:13 -0500
Message-ID: <20250607212813.747203-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The $id value has a double "//". Drop it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
index 234089b5954d..b43df10c5ef4 100644
--- a/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas//soc/fsl/fsl,ls1028a-reset.yaml#
+$id: http://devicetree.org/schemas/soc/fsl/fsl,ls1028a-reset.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Freescale Layerscape Reset Registers Module
-- 
2.47.2


