Return-Path: <linuxppc-dev+bounces-13534-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E986C1C847
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 18:41:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxZKj6N3dz302l;
	Thu, 30 Oct 2025 04:41:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761759673;
	cv=none; b=NRM5T3QIGPoqTo+kJGFGbJPUY9ZQWldga3v3x+Mi3WGSxrPzitdR+w/cuXp5VGi+GpB/VRyoGLkCJCxB8IPeJVgsLyCclqWWYu5w2rgMQkCgGtoC8ggbtjEnjbL5Uuo4iylirUayfDCBLnXvei/pEFGabB1hw7WGVtmlGVjkq5IzntAEWAS1ejgyfBCMi0y1+JBluyI1qI148Ju4UFXKlH9cJqcGkfUnJZeJ8y784QCcpNsCa5DVLsr2KyF+Ex6udH1k4AV6L64iTzwe8PV93Lg13/agzvzE4o67wyPTkXbl0EkjEWkXydpOGN1mu9fNxtazjYytd08eYOcxOig89A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761759673; c=relaxed/relaxed;
	bh=ykY78AS/7Z3x1mtADUnDQsFR/ZVp5PkSxUzT7+B8jM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ic7M0zeBVtDv66kAB+PGD8ise8trIh0Dhu8e2hNwNE1ztP9wWEcyeIkgVxELYLFr24h5qeFVJUi7R6GhAA2akDgenovuF11QxLvxV5iupmq2JM5KmX0oRLcD1x2wo26BfBc/IhmMIn336FeztCGsjOlIvuetW43SWdhXroGq1pE2Vb8S6pwA/1RhwSmZm5Z1nyLexhbuvcELHsu1zn7JkokgyG+fTTAUtnJITk1CsSC9SRpoLpb6g3ZT8uHp29mzP3EFaObrKvGV4kj3TUM0v7elq8/FJkuF1bajLxKUPKi3j+bqDGjyI7gfrxfJEiEg1wetb/sWv27Gif8mrBpAOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tdoTTqrB; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tdoTTqrB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxZKc4HlDz2yG3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 04:41:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E7D9D43F46;
	Wed, 29 Oct 2025 17:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97AC1C4CEF7;
	Wed, 29 Oct 2025 17:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761759665;
	bh=iPr8+Z1bwHsaNyPHs/N4eEQetvDlzmbe8TK2+r6mUk8=;
	h=From:To:Cc:Subject:Date:From;
	b=tdoTTqrBykeIDu/xpcw5kRMYvX8Qs8OL3nIpG7/EbzWnXeo6/nXDEy1+yHMP++Qa3
	 Qj2goPtSUDkjPjxa/h3QdNYEmeiGwm/d4v7TP0lKtzMWomTYSQ3YC3SB5UzdiSiTVM
	 n6/F9CF8PwwZ+ENRGLH1j5sCw3Jn/Gx3DxmQlUbwDq6FFVhoSXWyUcU4TP2/Q/DCut
	 Ov9lxmhAbVxnt2FqABqTv1RNEZ4rVI9ZSe1fUQW+TjnxkjTcRP8vCUp33dD0zH6c6+
	 6Buhwge9XeC9efuubO10f7vrAz6miLEDaNiVM6WcCK7G1Rr5JZ3GQ0hSA5DiBT3BqV
	 7ljgmdGmEgvOg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Stan Johnson <userm57@yahoo.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/prom_init: Fixup missing #size-cells on PowerMac media-bay nodes
Date: Wed, 29 Oct 2025 12:40:46 -0500
Message-ID: <20251029174047.1620073-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Similar to other PowerMac mac-io devices, the media-bay node is missing the
"#size-cells" property.

Depends-on: commit 045b14ca5c36 ("of: WARN on deprecated #address-cells/#size-cells handling")
Reported-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/powerpc/kernel/prom_init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 827c958677f8..f26e80cbc615 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -2893,7 +2893,8 @@ static void __init fixup_device_tree_pmac(void)
 	for (node = 0; prom_next_node(&node); ) {
 		type[0] = '\0';
 		prom_getprop(node, "device_type", type, sizeof(type));
-		if (prom_strcmp(type, "escc") && prom_strcmp(type, "i2s"))
+		if (prom_strcmp(type, "escc") && prom_strcmp(type, "i2s") &&
+		    prom_strcmp(type, "media-bay"))
 			continue;
 
 		if (prom_getproplen(node, "#size-cells") != PROM_ERROR)
-- 
2.51.0


