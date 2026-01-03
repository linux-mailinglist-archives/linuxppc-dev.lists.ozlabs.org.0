Return-Path: <linuxppc-dev+bounces-15190-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F46CF0474
	for <lists+linuxppc-dev@lfdr.de>; Sat, 03 Jan 2026 19:58:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dk8vb4FHHz2yZ5;
	Sun, 04 Jan 2026 05:57:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767466667;
	cv=none; b=HWAr+J1KSti4NHrZ6whF0zM9uvu6oxLaGqkdQ1a7e8Ub9nUuQG5NkGIF1rBSPJrpyRfsTZtGH9N0YZeSYnXT3CRQtiTk2zGqTxJuBrsTY7C4DJg8keWv/jk/lhhvmkWw/v19y/uk6x9esaZU7cdIPIK+6A4r04lZZbz1vpcxhZYYWb23HT398l2+lcYYFkI7X7LKBTkbhM3HTJF+pzTPuWxk1MzflZCUcj8sUm5iTSZsOqQ3dfSuKA3+iaTVRpNJWwMXP2RhR9vTGigvbqHLd2zrElnuiKHU0A1y3zwSWs8AiweVge/bFlDpOkR19Kqvh9ijtXp8fgJlKAL8u2ubDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767466667; c=relaxed/relaxed;
	bh=mSecvzXgXhb3FzfToJUcHowd+qYFOFssxKdrzOYbfGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aHk0Fp4pNp79pAbhljuTox4D3KOkX2I/U4QE4cT7Trld1Xi+yoxoa2SBvGsZDZKFdB4OG+E4GOZsEpke0z65tCK2qd4630oKJnGd9oCtT1ItShTthSquy+xZSnwbyFgEgMmMvV2PrSFHviXfFs2N0ZRD2b7jdZlLO+UIjjuVFXNt8kjasb7sbTh2kMtYDCQcAW+IlWaz5E9TGYnbYKkLAPvetx7ZILmUBUrLiLvmCLY1bu1gZvgwpvWS6FMXwlt4WMeyCXFYIo1mCBqo0ouzBfQOPfweNiqwzUDBJb6wIVRmaCXP7AQ08vPNJjcmaLf0rltCBxdNiSgxMYoucDvXrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FaERaJ0A; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FaERaJ0A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dk8vZ6Zj0z2yKn
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Jan 2026 05:57:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BED094435C;
	Sat,  3 Jan 2026 18:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 841B4C2BCB5;
	Sat,  3 Jan 2026 18:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767466662;
	bh=53CsSpZsyc7xs+AdaMCHhS93fwYu+PSSE3vaZp2mGiU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FaERaJ0AIu5BeWmwL7Mkm9o8Osg7MQpO6s4C0RpmPQ0F+7gODO+GewYdc3m8ocajN
	 WkLSEKg4gO7MTeMA77D85x3RzPTihJzpV5zSwu/cJewguWVVh5dqmxHoIEBZTZeb37
	 CpgLw5mVdLKgR6mCX21P/cWlZmLZLk2BWpPXtUHu+8gCA3eU6oAji7sJjglGj3+N4H
	 ssVzC36mHe2fmFbUyv8gQHXECDPfA8MErGnzP6Hp1wf6oLpHjvC9kHFwVBB9gMdqn2
	 xWi16pzOhSyfPdvn+AWJGAtw6DrGKgySnmTyBHp5mxG/w6n0CBW3JlDu/ZGdwchWzc
	 wPXHynU1xt5tg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A545FC6182;
	Sat,  3 Jan 2026 18:57:42 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sat, 03 Jan 2026 19:54:09 +0100
Subject: [PATCH v2 5/5] powerpc: dts: mpc83xx: Add unit addresses to
 /memory
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260103-mpc83xx-cleanup-v2-5-b2a13c0a0d63@posteo.net>
References: <20260103-mpc83xx-cleanup-v2-0-b2a13c0a0d63@posteo.net>
In-Reply-To: <20260103-mpc83xx-cleanup-v2-0-b2a13c0a0d63@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767466660; l=5576;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=t9Y71lb+NmFSZt3uA171w86/UdO38JD0i35P7z+18Q0=;
 b=u0ya6NMRWPK/wrUQ53gvmrKN3VhXv2Bwj+XdEikWeYHrvnEwjL4nMP1QIV9lbUb5aM3VczOYR
 LXp8ZqjIhPfAdv2wMBGtvqIJ6Vnb5mdk54wscvWdIIqGcw+GKpZbfWZ
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

This fixes dtschema warnings such as the following:

  arch/powerpc/boot/dts/mpc8315erdb.dtb: /: memory: False schema
  does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/boot/dts/asp834x-redboot.dts | 2 +-
 arch/powerpc/boot/dts/mpc8308_p1m.dts     | 2 +-
 arch/powerpc/boot/dts/mpc8308rdb.dts      | 2 +-
 arch/powerpc/boot/dts/mpc8313erdb.dts     | 2 +-
 arch/powerpc/boot/dts/mpc8315erdb.dts     | 2 +-
 arch/powerpc/boot/dts/mpc832x_rdb.dts     | 2 +-
 arch/powerpc/boot/dts/mpc8349emitx.dts    | 2 +-
 arch/powerpc/boot/dts/mpc8349emitxgp.dts  | 2 +-
 arch/powerpc/boot/dts/mpc8377_rdb.dts     | 2 +-
 arch/powerpc/boot/dts/mpc8377_wlan.dts    | 2 +-
 arch/powerpc/boot/dts/mpc8378_rdb.dts     | 2 +-
 arch/powerpc/boot/dts/mpc8379_rdb.dts     | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/boot/dts/asp834x-redboot.dts b/arch/powerpc/boot/dts/asp834x-redboot.dts
index 33ddb17d18760d..c541bd3679831f 100644
--- a/arch/powerpc/boot/dts/asp834x-redboot.dts
+++ b/arch/powerpc/boot/dts/asp834x-redboot.dts
@@ -37,7 +37,7 @@ PowerPC,8347@0 {
 		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;	// 128MB at 0
 	};
diff --git a/arch/powerpc/boot/dts/mpc8308_p1m.dts b/arch/powerpc/boot/dts/mpc8308_p1m.dts
index 2638555afcc454..41f917f97dab8d 100644
--- a/arch/powerpc/boot/dts/mpc8308_p1m.dts
+++ b/arch/powerpc/boot/dts/mpc8308_p1m.dts
@@ -37,7 +37,7 @@ PowerPC,8308@0 {
 		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x08000000>;	// 128MB at 0
 	};
diff --git a/arch/powerpc/boot/dts/mpc8308rdb.dts b/arch/powerpc/boot/dts/mpc8308rdb.dts
index af2ed8380a867c..39ed26fba41093 100644
--- a/arch/powerpc/boot/dts/mpc8308rdb.dts
+++ b/arch/powerpc/boot/dts/mpc8308rdb.dts
@@ -38,7 +38,7 @@ PowerPC,8308@0 {
 		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x08000000>;	// 128MB at 0
 	};
diff --git a/arch/powerpc/boot/dts/mpc8313erdb.dts b/arch/powerpc/boot/dts/mpc8313erdb.dts
index 137217d377e91b..c9fe4dabc80a78 100644
--- a/arch/powerpc/boot/dts/mpc8313erdb.dts
+++ b/arch/powerpc/boot/dts/mpc8313erdb.dts
@@ -39,7 +39,7 @@ PowerPC,8313@0 {
 		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x08000000>;	// 128MB at 0
 	};
diff --git a/arch/powerpc/boot/dts/mpc8315erdb.dts b/arch/powerpc/boot/dts/mpc8315erdb.dts
index 0b087180e1815f..7ba1159f880311 100644
--- a/arch/powerpc/boot/dts/mpc8315erdb.dts
+++ b/arch/powerpc/boot/dts/mpc8315erdb.dts
@@ -40,7 +40,7 @@ PowerPC,8315@0 {
 		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x08000000>;	// 128MB at 0
 	};
diff --git a/arch/powerpc/boot/dts/mpc832x_rdb.dts b/arch/powerpc/boot/dts/mpc832x_rdb.dts
index ba7caaf98fd58f..06f134490d9574 100644
--- a/arch/powerpc/boot/dts/mpc832x_rdb.dts
+++ b/arch/powerpc/boot/dts/mpc832x_rdb.dts
@@ -38,7 +38,7 @@ PowerPC,8323@0 {
 		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x04000000>;
 	};
diff --git a/arch/powerpc/boot/dts/mpc8349emitx.dts b/arch/powerpc/boot/dts/mpc8349emitx.dts
index 13f17232ba83d5..12d33cb55b72a9 100644
--- a/arch/powerpc/boot/dts/mpc8349emitx.dts
+++ b/arch/powerpc/boot/dts/mpc8349emitx.dts
@@ -39,7 +39,7 @@ PowerPC,8349@0 {
 		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>;
 	};
diff --git a/arch/powerpc/boot/dts/mpc8349emitxgp.dts b/arch/powerpc/boot/dts/mpc8349emitxgp.dts
index eae0afd5abbc39..2998a233a790be 100644
--- a/arch/powerpc/boot/dts/mpc8349emitxgp.dts
+++ b/arch/powerpc/boot/dts/mpc8349emitxgp.dts
@@ -37,7 +37,7 @@ PowerPC,8349@0 {
 		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>;
 	};
diff --git a/arch/powerpc/boot/dts/mpc8377_rdb.dts b/arch/powerpc/boot/dts/mpc8377_rdb.dts
index f137ccb8cfdedf..fb311a7eb9f2cb 100644
--- a/arch/powerpc/boot/dts/mpc8377_rdb.dts
+++ b/arch/powerpc/boot/dts/mpc8377_rdb.dts
@@ -39,7 +39,7 @@ PowerPC,8377@0 {
 		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>;	// 256MB at 0
 	};
diff --git a/arch/powerpc/boot/dts/mpc8377_wlan.dts b/arch/powerpc/boot/dts/mpc8377_wlan.dts
index ce254dd74dd06b..f736a15cceffad 100644
--- a/arch/powerpc/boot/dts/mpc8377_wlan.dts
+++ b/arch/powerpc/boot/dts/mpc8377_wlan.dts
@@ -40,7 +40,7 @@ PowerPC,8377@0 {
 		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>;	// 512MB at 0
 	};
diff --git a/arch/powerpc/boot/dts/mpc8378_rdb.dts b/arch/powerpc/boot/dts/mpc8378_rdb.dts
index 19e5473d4161b5..32c49622b40402 100644
--- a/arch/powerpc/boot/dts/mpc8378_rdb.dts
+++ b/arch/powerpc/boot/dts/mpc8378_rdb.dts
@@ -39,7 +39,7 @@ PowerPC,8378@0 {
 		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>;	// 256MB at 0
 	};
diff --git a/arch/powerpc/boot/dts/mpc8379_rdb.dts b/arch/powerpc/boot/dts/mpc8379_rdb.dts
index 61519acca22804..07deb89c5a9bdc 100644
--- a/arch/powerpc/boot/dts/mpc8379_rdb.dts
+++ b/arch/powerpc/boot/dts/mpc8379_rdb.dts
@@ -37,7 +37,7 @@ PowerPC,8379@0 {
 		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>;	// 256MB at 0
 	};

-- 
2.51.0



