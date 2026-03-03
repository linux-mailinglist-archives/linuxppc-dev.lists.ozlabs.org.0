Return-Path: <linuxppc-dev+bounces-17590-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJqcJH8Dp2k7bgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17590-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 16:51:27 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCEF1F2F6E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 16:51:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQKz12Gv3z3c9y;
	Wed, 04 Mar 2026 02:51:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772553068;
	cv=none; b=EfxMzmSA8V8NSS8YXq180quiDCKtW2REMVaa1xSLCUCea2cI4a1QtlPhiMltsctlFmSSTEoxtojP9c5BgzrLQC18ZHR5QzAkg4TCvXF6HKB1/79AaQI5iFWpz8NonpP6aBa1puBbU0rGa56z3jJY43KwkUyH0mi7mwyLx377iD5qjLWlpuBJUYDvXUzq1xhOSIprHfvIoelYfXVjg7nWfOC6w/zadk+/1UFcWVCPCKpQSPjlp8uWeeK3O54kOSr4St/kGNBuHlwgYff7Kh82xqJMwbr7YFz9JZFRVzZrWKP3BJ8Dj2xBEH6eT58BUnc2VqMIuMjrSoMR0DQ7cAgMzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772553068; c=relaxed/relaxed;
	bh=mSecvzXgXhb3FzfToJUcHowd+qYFOFssxKdrzOYbfGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dteGXyo9GmEQhSfJJ1IBHwWbnth6hqoW+2svL84CkFLyqDWiXiggHJRQMPe2YG49TMrXmJLEAq3plcpY9SnMDTAF+iKK0aqdSfxnYJ6E7XkGtkEHvoGra+/cq5XMNpVIpKfg2NUXCQHMw6xSVnaMxLQm6qItpMlUrCH8fve6jWlgbFG+F5rrUDkfkO8/j1LwvivR23eDwj77XSvEqben0Fp+TtTMlSUP6nEbcRbwldwNETR8fMi1LzPcgQ8OP6YpVdZL5NsZbfYy/BY7Jr1o0WHwFcH5ECnamVYxEHT/fnJ6xRaGcfHAPO+mooztmF4vAS45UUUL71Daf2LpxXApZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kp/TyFy3; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kp/TyFy3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQKyx2nSWz3bnv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 02:51:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E4E2844561;
	Tue,  3 Mar 2026 15:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C3DBC2BCB3;
	Tue,  3 Mar 2026 15:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772553062;
	bh=53CsSpZsyc7xs+AdaMCHhS93fwYu+PSSE3vaZp2mGiU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kp/TyFy3g0TYycraCeUU/AJDhJ3DfytSRQlkjvU3n0vQNBeTo1Y4RWwMbKDRTJIm6
	 1RnDjQQNTmTGjYuInSU/65K86yuGsq1+V/ACY0AWEl12yKmiHKCiaiM9zKLBUEqkQO
	 0n058+g1zi+2ka1SQF+RQOwe2ziynmkqCzjwKulryu5bp3RoqzvRwzOwfOHlypxZ5f
	 KXhZFxlp2E2t2raFpse2zMuJ0qM1ZsYnugIK0LkAvaQX2acPngV+LKulcFS2dV9SmB
	 uMWx2aqKPKelYBWwS8U9Zty4440Jg4KKA34q3c4V+PvPGrMtK4fsTM618Pzu24oJg4
	 OINqtPOTLS+Lg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA5FEDA68F;
	Tue,  3 Mar 2026 15:51:02 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Tue, 03 Mar 2026 16:50:55 +0100
Subject: [PATCH RESEND v2 5/5] powerpc: dts: mpc83xx: Add unit addresses to
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
Message-Id: <20260303-mpc83xx-cleanup-v2-5-187d3a13effa@posteo.net>
References: <20260303-mpc83xx-cleanup-v2-0-187d3a13effa@posteo.net>
In-Reply-To: <20260303-mpc83xx-cleanup-v2-0-187d3a13effa@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772553061; l=5576;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=t9Y71lb+NmFSZt3uA171w86/UdO38JD0i35P7z+18Q0=;
 b=IxOaMiqBi12tObxf7a9xs73qThqTLmT65EEm24vxL3OWI1bfEnegliAO5JGLldmAxqfgHogTq
 CFctZjYT3I5BFD64hm1bwMZgXBESpXGpeVxSZoJ+cLzAb9ggPc8NUv/
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
X-Rspamd-Queue-Id: CCCEF1F2F6E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17590-lists,linuxppc-dev=lfdr.de,j.ne.posteo.net];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.ibm.com,ellerman.id.au,gmail.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:j.ne@posteo.net,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[j.ne@posteo.net];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,lists.ozlabs.org:rdns,lists.ozlabs.org:helo,posteo.net:replyto,posteo.net:email,posteo.net:mid]
X-Rspamd-Action: no action

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



