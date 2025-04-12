Return-Path: <linuxppc-dev+bounces-7623-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0474A86D16
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Apr 2025 15:01:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZZYb33kldz2ygm;
	Sat, 12 Apr 2025 23:01:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744462879;
	cv=none; b=UqO11bPHhuIbteFIe269LZcUiggxQhYOVdtfuMEWqf950elKRaVgiITG2sCfj55m/D8kLxMsKfLXy7kbM7HhQTk2DiSRJiwhjp8idYc0dCVQUEdAjmUWuVohLdpQdmJLylK9GBbKhAUy5bZ0ZCPush/yvZnIuxrAvzyS3W2pUOyz6iai1E271M66ie59QknX7GXTKCy/iIHFG+wi8A2Y6M9AUuKtQDkYv/Z6eae0mgI2bqYgAZmz8WqRNfJqToSkErwv07FMIC34dymDLczzp9HILwyeGPA/GFx+djTDGLqoQf7Myf4PK7Jg2PoFkAITxUZFPUYr7kops4UWNp3r2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744462879; c=relaxed/relaxed;
	bh=Mb8Un0pZMHJrUWypgv6qt72kigcfB3xGrkP0g6ZDMQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PagFYAE60grolds7QgX0wL5sfcKOTqidS2NjiAeazaZ1uIOTXVsB5GgFp937jl2KC1ZTIwxUtOtqyC0T0dcXoOFIU53NWQsizYh63TCYMFf4hsrdNTKi1UlyPsJuPLmNDMV+MI1EBMLbubCEtQcpuFDmGUiMMI8UxcOHRjMdIGdUj/+NIOxokkep4s3/s6H8nF1mtXEGPbq3Vr4erB7HKdk8UT9qBLtVUQ05arae4qD8UGcqPJJmJzbjI1sYTJj76d04B7wQM+SKEIQ6bZ2YtqC6AgOaqU7zCYntw157ToPEJBTuonItxAOY+bpREZNuXQitKYe7qytVBK99KfU3IQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZX8TTkrn; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZX8TTkrn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZZYb26Cn3z2ygJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Apr 2025 23:01:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 48DD461126;
	Sat, 12 Apr 2025 13:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F3A2C4CEE3;
	Sat, 12 Apr 2025 13:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744462876;
	bh=YkZnxUHC6Pl47YE27YCJbGhgb6aZZ5MzUw6WcQieAqo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ZX8TTkrn/bN/nL7jKF9tAvHS2UYiWesIjPHeh6EvzIHGu4xjSCa7C0KHNYNN6F42l
	 BLMtS4IbDch60vrHjHtlc8hlhRrX28kNuFAB39TXDMAw4Qra3crvqtHpBLFsfQcKra
	 uMnW4IePAcn6GfecaI5gl/2LY6Y0nodr1N/niv3FoeTgmCxgdBOZpsQdwFm6DlQz8l
	 MUlNWecdY92y/RomGyJT/LQo69XKvzuYHiWM2aA1ummaZUiD+FSXCFdPcS97M9RYiP
	 vi1VOzQ5hog7p5J1BNb6ce7BwtmoXba2ibWLQwEiA8u+r+GGA7GNhoqfV30uyaJzAe
	 JBniG1FJO6fMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D59C369AE;
	Sat, 12 Apr 2025 13:01:16 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sat, 12 Apr 2025 15:01:13 +0200
Subject: [PATCH v2] powerpc/microwatt: Fix model property in device tree
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
Message-Id: <20250412-microwatt-v2-1-b7b9e376c8c1@posteo.net>
X-B4-Tracking: v=1; b=H4sIABhk+mcC/23MQQ7CIBCF4as0sxZTJhKpK+9hukAY7CyEBghqG
 u4udu3yf3n5NsiUmDJchg0SVc4cQw88DGAXEx4k2PUGHPEkEZV4sk3xZUoRbkKlpZ6M9wr6f03
 k+b1bt7n3wrnE9NnpKn/rP6VKIYWm8Sy99Rbv7rrGXCgeAxWYW2tf39K/ZaMAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744462874; l=989;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=0awhdLFMY97nl4C5F/YShrc0qAsdI3niSehOCyjeP30=;
 b=AJkLGPu4bDJCFRhuQWdrlPSic38AcE1x0aY+UH23rpWQcoqHRfkEj6FCMSdS6585Bjj7pH5cT
 2qV5bNEKZvjCb6/y0cJzatYQP4hTneRSNHX6f7+oTuY3kw6DlTxvqR2
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

The standard property for the model name is called "model".

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
Changes in v2:
- Rebase on v6.15-rc1 (no changes except line numbers)
- Link to v1: https://lore.kernel.org/r/20241225-microwatt-v1-1-8e071fcfc2bd@posteo.net
---
 arch/powerpc/boot/dts/microwatt.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/microwatt.dts b/arch/powerpc/boot/dts/microwatt.dts
index c4e4d2a9b4606a689e3f9eefd1ca5bcf1aa3395f..b7eac4e56019eaa84d8afe70c639f2112defdd7d 100644
--- a/arch/powerpc/boot/dts/microwatt.dts
+++ b/arch/powerpc/boot/dts/microwatt.dts
@@ -4,7 +4,7 @@
 / {
 	#size-cells = <0x02>;
 	#address-cells = <0x02>;
-	model-name = "microwatt";
+	model = "microwatt";
 	compatible = "microwatt-soc";
 
 	aliases {

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20241225-microwatt-d9258189aff5

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



