Return-Path: <linuxppc-dev+bounces-4475-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7389FC69D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Dec 2024 22:48:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YJQPM3kM1z2xr4;
	Thu, 26 Dec 2024 08:48:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735131242;
	cv=none; b=jt2B0QzKu76Hl+ScCPUz1K7szrzd+FsI+B2FDS7zyh+z+VIO9X9mEE8tnypVqheguGTfXKi8BPX1jCWmXEq96b1z23FFaf0xHLAeNW3yz9mbZfvbpQFZXr7J0sURDqJzP9Q0eqPIIyk71dUhHRW8U0CfLXk/gwO2pS74Cz0AYL+MIyVRAzpoe41KolHsRZkwh+GDs+8iSbbBfeENdvscqxcbqYkztNhyjyD8jsQKfSl/qlG+ssjdhQ3FTaA2wP/0wCRkHIQtlKrZpkYwOTQ4m/GmzK0vGU8ZMzObVO70RlKIDiuX/2P4WBjRs43U5f2YYc+RNZksQN9oxGbYV4pzRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735131242; c=relaxed/relaxed;
	bh=Z1DtaSRvEQo8whBd1myqvxHRkixcWdelC4duOVviqaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nb6p3y+RheAJbYvF/SClQ6I6V4+9oQeoFOlr6SKuo21AjknRDzI3dVQi7PwqRdlWyB/v89S/7W52ZodAlf4+cibKMCTRBeymhZgVaANBf1PiwN4K0178J2SZzuWmhbDA5m8wAVg42TJaswS5Aw8xQQCzKTOXD8qgUAgfEQ5ShkXN6HuyyDGmJuH6JE2UkvfB53yQoVpDomj8Fk5AEvXMs6a7awTPGLGtv0iZnLxfCb9fnL+qsWdKYZZppPa8QM773UpO8LbANuUxxDY5HaSdNcKLI8b60lexEoSaeO1A6rXq1ifB1aYaDJJcunN7GC6vfB3brq2/ELpyiHemmqkCBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cn2xtT1y; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cn2xtT1y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YJBXT5Xbwz2xsd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Dec 2024 23:54:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AC5A4A40101;
	Wed, 25 Dec 2024 12:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41711C4CECD;
	Wed, 25 Dec 2024 12:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735131237;
	bh=PJMCplFGaL2xcxrMFWZxT4JyB/8KOHMpGiDIatQ1R9k=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=cn2xtT1yEQSgn/UEHHHogVsCEPmwdIUhrwkmK5ztjHKhfsdYbMM3PLXaLq+DueR8p
	 PdswUAjc4ACpqUrKfF3rjGbBTa7ldh4dfnTRYPsqmsOI9LIQqrQRon7PokljodVRps
	 BSOqWfJLEJgEUWonNKyO+1n93/IelNiXghlJEYA2bJ4avxEi4JY12iNt9DcZL5ZYJ1
	 g9WsDCb/x8zjovknb1b6Q/tdMy5H/lqZjmPQc1wg9NUbtaoQ+txJQY6Mg8Le4jzCjA
	 vxNPFTatbgqoY17yonMQWLXvjeiK2OEV5IVsr8uqADcLVSzoc2lq+hRcPBDqHw/DCw
	 3kZl5FjbYoC2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C6BEE7718B;
	Wed, 25 Dec 2024 12:53:57 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Wed, 25 Dec 2024 13:53:42 +0100
Subject: [PATCH] powerpc/microwatt: Fix model property in device tree
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
Message-Id: <20241225-microwatt-v1-1-8e071fcfc2bd@posteo.net>
X-B4-Tracking: v=1; b=H4sIAFUAbGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIyNT3dzM5KL88sSSEt0USyNTC0MLy8S0NFMloPqCotS0zAqwWdGxtbU
 AJNlPVVsAAAA=
X-Change-ID: 20241225-microwatt-d9258189aff5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735131236; l=823;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=3C1YCyi76jTrcxunvIWw4CH9zMDlOTH9wFP4VAcUHL0=;
 b=gkj0v9fIXqP50WvdD1SfkJUpjFjLAxSQVPwzXugvNYqFDK0iRkHSiJMzU4XvUxnmld76zHA1p
 pBfh2O1PUKDDClwd94hbm7Hf+I8lRPTvRO7Iz74DKLwhFi4IFvtAdAJ
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

The standard property for the model name is called "model".

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/boot/dts/microwatt.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/microwatt.dts b/arch/powerpc/boot/dts/microwatt.dts
index 269e930b3b0b14a2bf6a76261062294c1d003c72..162b5f2f8aac2d6c50824b55a8b894a19d741f07 100644
--- a/arch/powerpc/boot/dts/microwatt.dts
+++ b/arch/powerpc/boot/dts/microwatt.dts
@@ -3,7 +3,7 @@
 / {
 	#size-cells = <0x02>;
 	#address-cells = <0x02>;
-	model-name = "microwatt";
+	model = "microwatt";
 	compatible = "microwatt-soc";
 
 	aliases {

---
base-commit: 4bbf9020becbfd8fc2c3da790855b7042fad455b
change-id: 20241225-microwatt-d9258189aff5

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



