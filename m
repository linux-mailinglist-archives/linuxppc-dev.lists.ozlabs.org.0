Return-Path: <linuxppc-dev+bounces-4585-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D38009FFE70
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 19:34:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPFgS5LTSz30Tm;
	Fri,  3 Jan 2025 05:32:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735842756;
	cv=none; b=FmqShoC760GAJII5DUB1kmmSSVmmXmD/4nUKB50e6kdex5fdjYOEzje7qWlkE6rZ57C4i7G6AAwKjo0xtI2Na4+EDqo7smt70rY5fVumWPPX35Hb8LFwTcV5J2nwY0UbrOcrLX+mCHY06ejF2TPnOPDC6T27iRFM/SiCb+I9LmSUiKf3c2RLP46MueoNKYLscTaD4bae2mWo8lWmSBKjzGbi2Zk3SY5KzrE6D90ZEZUjhDA0o9xp9ZFeN45dAypHQPlgTwHgKaz8Bd2xmgLUCoDi8zMtIN4Ymg1PbM0KH5XyNM8IkImdhBRHuHVWSt80CJXRplMSk13iMtTv4jnuhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735842756; c=relaxed/relaxed;
	bh=dFyWvl+roGnljAC7FcAumGgmjvs2205FzxvDoG8gaFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ajcWTtWWgHo5VUlh0NvlziVfXmj8wp2MeSVCx+apN9CgJj0K7p/tXjAASsbAw2xlkHEmf2SUoqjmX0GwPTrWuS21oH6eMWeDAsI1NICf3tRNI9wPDaZyDYJlZMstp5T/jBZFIlJwbXcPq/0NgJrjqhyg++xcIDnb3Gm1NPFVK++/h5vONnqJzR22GYsMieDx90uQsGvUOr5gWZr8TgM+orSWCE3ef7xpZCQCHAR5mmwFxP7Smw9JGCaAjCm0WPv0JqKJwsHzM7nrMtaoX5txPHpbjNwMdGpg60b76MQWuGF2RmUlYh18BhJnzYK8mWeBIOOo5VQuBJDxMxXNTio08g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YvMfwT+n; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YvMfwT+n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPFgM4N6sz30MM
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 05:32:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1C4A55C608A;
	Thu,  2 Jan 2025 18:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 953A3C116D0;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842742;
	bh=y03cb4wbkJsgpcDVgkqHzQqW3P9VgCOSpkaGH+61Xxg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YvMfwT+nmj/dnRXngQckHyNSh8yyr59T2fYo/VD+8afSbt2xyU92NpgdgW3RpZeIC
	 CsTl/o0DbdL3itGJvqN5pQwb3TtU1Cd5VGVa9JVPApalHnDYUbItVqTHCdG4MdFc2k
	 FlNQfZ8f/K56fYntIfuLnat7vq4HgOk21GNyJwVjjrvGabZY617VyVVkiISpQgPq6u
	 AvegsM+tH/HncnPppAdoUrkTmV910rIqKpAxCy2wvhMtCTMJrhGKIEadlZ+vX7GjWs
	 UkRawZn3RI4cPxGwuPdrkbHE/qxvhxxoNbX2MEi2rKKvtsaYDmCvMjBDMTppw7Oqe8
	 8cSkCzMh/NCMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ACA1E77197;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:56 +0100
Subject: [PATCH 15/19] dt-bindings: vendor-prefixes: Add LANCOM Systems
 GmbH
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
Message-Id: <20250102-mpc83xx-v1-15-86f78ba2a7af@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=888;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=cPDycNl9By3Hm5+1t2n1h/bJeTOlBcJ2oe1IgSAfN6U=;
 b=JRK8A4LytpWFYp4wFnkZVdi329GFgJOOHAqqi81i/HoTMERuo7v01lvfwpwuGoeDe15XGIdFE
 kebxru9TD1CBOOAasWFhF3rU6HfzY4Rac07KuLWFyVyBs2GeaUMP2bo
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

LANCOM Systems is a manufacturer of networking equipment.

  https://www.lancom-systems.com/

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index da01616802c76830a520594a69bd6a2e0231df0d..56d88162b184e45d6b05fc749d77ca952a5eb2e2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -812,6 +812,8 @@ patternProperties:
     description: Laird PLC
   "^lamobo,.*":
     description: Ketai Huajie Technology Co., Ltd.
+  "^lancom,.*":
+    description: LANCOM Systems GmbH
   "^lantiq,.*":
     description: Lantiq Semiconductor
   "^lattice,.*":

-- 
2.45.2



