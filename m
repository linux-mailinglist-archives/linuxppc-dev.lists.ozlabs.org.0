Return-Path: <linuxppc-dev+bounces-8420-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2ABAAEE3C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 23:59:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zt8LB2NxFz30Sx;
	Thu,  8 May 2025 07:59:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746655154;
	cv=none; b=YAcd7pagzjlvvcW6O1b/2ZSTizTn1uzGnsuWBxNt5H4VJdYNCm+QdZEJ03PBACOVqGs2ZsVHuvPYTWx7MDrqZht7RBkV1C7uAFR2NG4C7GRUNh7CSXRfS4dua1BnqPiFuj7O4JltkDrU0fYudO+uHufgrf4m2zsEbs6mPPdZ+xzkI2SEBhh8Hs0MDPU3htFnk+FB7tV9Wh3YmA4Uy9IrxEO+aGhFLrRn/B2qrQ3Ez4OnS+TXhPfzZRSno+kgjaIofV02WyDGiyLzkb5FKCfZDzvDo04O4aJjrtUaEAeSt2EUKWgdH3bzMKKBMw036gSHRKc6eJkLChnC8imi5WbU3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746655154; c=relaxed/relaxed;
	bh=q/yKUykqMXCZwQzi+gFRB5wtVJeuGF5yZJuP2Mj4Bzs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bI7V7BmnIA+FbuZV3i6zQQ74SqArCRw9IotdcH+3ry9tMeaF0NQ0R0/F6FIX7RGY9jrVLIApVKetMpU+362v4BHyBu0wHujM476KuWnbo+0pesnPDaGUe1Ji+FLh3KHlhPgIwEVgYt7BswnQNd0EP184TLi9oxpAB4zlbOOPcOBBq4YhaLNfjPaR1hyWKuAdGCnXV5Qi+yxrL7Z/Omw378wfUOj+e1RhIxiBfgZ54ulJYkKEBvWqFcd+d8rPcJVKKw9WY8p3rQXYFKJjBp6yUQzZo9qLgmDhWM0QQRChfDahJIEw+88AvFNmuX6iEULu+Kg+giKSA03HWUJ4EPGOeA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ReoGpdNa; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ReoGpdNa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zt8L91SsZz30Sv
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 07:59:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE63D629E5;
	Wed,  7 May 2025 21:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63634C4CEE2;
	Wed,  7 May 2025 21:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746655149;
	bh=9858hxWVasl9qYR0rBtvA66gC6j5dx4PpfDs0u1OvTo=;
	h=From:To:Cc:Subject:Date:From;
	b=ReoGpdNaV5J7M/aCOifp9gSt3dnm3MrMaoL4K91pjhOLRSU/MSTjKzXEJEOZPUrMB
	 bEO7tYLv6aGRy1OLdB4B8dNIpZ3uizXyjpt/73Tk18bZZqH6WnWlRKdsKI38H477uL
	 Xx3ufl0khAamWDDgwChmGJRugic2nWxDh3F8Wkmm9FqPufQN3cRAlenH+pW+KU1Ni8
	 8MSyuqbtgLY3wp8u9SFXFfQsdljbkJz7oh1DjJZGNn4TiimV8Qc1Ta9UxKJfQYsfL7
	 2vEb9nE4rNOUWQ9t1MBp8GklCqynV4pp0p5rtXaOSgEYF0+5twoNP/dgHTgJKDpUTg
	 OjPdicqxlYkvw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: soc: fsl,ls1028a-reset: Drop extra "/" in $id
Date: Wed,  7 May 2025 16:59:02 -0500
Message-ID: <20250507215903.2748698-1-robh@kernel.org>
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The $id value has a double "//". Drop it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
index 31295be91013..558a8c7aab9c 100644
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


