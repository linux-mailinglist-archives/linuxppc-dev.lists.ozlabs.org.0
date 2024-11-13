Return-Path: <linuxppc-dev+bounces-3143-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3B59C6A4E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 09:07:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpG970vsrz2yYy;
	Wed, 13 Nov 2024 19:07:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731485243;
	cv=none; b=meJ/mlF9J6FhZPH/pgmTquevhWSF9Ej6QpDcoi6O1kRiQB23BkYF7jQ/g2FWFPdhAuJJVe2ZzJB5rr8pwcydziSwihlNvcckzUwvzW+NwSsvt7st6/Uj/BS8tfiHUk6ZeQwjay+cZeB1yCQJsZ01g+1fYKIDiKYneIVe+LH+xXeEHlnjOaqWgyZmbzacwOJpQmdspBClugtOM4S07dpWLBFW+LN+g0G9zmlrp8rH67zVR0zzUOOC+qxQgyEbMNUm28DvLGmJ3udHfeXsyYQtBXnLOjawga2TKDGeu3NGrHcF7Bfy22ehch5wh5r2sLKjcX1L2ieREyx0b34VMe9Zlg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731485243; c=relaxed/relaxed;
	bh=8azP5RNKEmRw7ZN4Xa0xxJU6YEoeWjRUA4LawtiKvo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=e7Ywk6vxfJN9fiVl6+4aNArXJaAptTtqpWMLtOBSOpk+SoUEXQHsQj8ti8J6A0ecrVZ26wt31GCKsMy/k/N+fCIkV01j/WItU5bUwaqxI0GTiKANaDZT3kbu3sHzVNzgfGxb3QeutTBJjxx4jyOsZqBj8LmD+Zw6vUnZdflvWwmNo1yZCGyF81MT3B9C3RtopF/bKEbhtB0MChkitFxzV0UfxcIhQWJcSWTqqnrc6W3A4+b/zZG0UUXUSkKD5jItBP75AIAayxjxurHy2lgaAEP8eSWjodiTPyiiJj7aCGlDYtWYuNX+NHVwV++zOJj6IRW9Jo9z4A2e6QPmg7RqRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=afbiIZed; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=3M9HbEZZ; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=afbiIZed;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=3M9HbEZZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpG9611wzz2yWK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 19:07:22 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1731485233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8azP5RNKEmRw7ZN4Xa0xxJU6YEoeWjRUA4LawtiKvo4=;
	b=afbiIZedd8fjvcocSc7LR2J8T27HQ+08dyKfVR4mVgKkppqBHVlnVG5+7yG9kHL0VYIvj/
	1Dl+3p5Rg2xRIMiCiIjsaFL5hFgLpoMGo8pAyRL/zFrjw8XX9OfcT2HU/tkRMOdxIK6j3B
	7buNIGrihkkRXCdhLN43lP/4vKdLILhntlYLoIapNtR2wN//YwNh0DQUs/D451DxYflAzg
	924P8FiVXSIrz8fFdzD/yJmDflJhbPoyz5RPDKQhsVE4t2ZC5eFYtHrltck0C7pyv7ksO3
	B9ZtHeBKtxP8V/IHgi8Kf+4GGj7sNCICiFQ/2mJVPy3gjpdzb9gWIGWr6mwGvg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1731485233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8azP5RNKEmRw7ZN4Xa0xxJU6YEoeWjRUA4LawtiKvo4=;
	b=3M9HbEZZFUv5QG4IVDnNTxhB3+CTXd2Pg0kQxS6sMEES1y0QDnOn785MZmE7M4BSeTcIFu
	RVjVy8ITPufKX+CQ==
Date: Wed, 13 Nov 2024 09:06:58 +0100
Subject: [PATCH] powerpc/vdso: Remove unused clockmode asm offsets
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
Message-Id: <20241113-vdso-powerpc-asm-offsets-v1-1-3f7e589f090d@linutronix.de>
X-B4-Tracking: v=1; b=H4sIACFeNGcC/x3MPQqAMAxA4atIZgON/3gVcRBNNYO2NFIF8e4Wx
 2947wHlIKzQZw8EjqLijgTKM5i36VgZZUmGwhQVEZUYF3Xo3cXBzzjpjs5a5VPR1I2hxnaG2gp
 S7gNbuf/1ML7vB3nugSNqAAAA
X-Change-ID: 20241113-vdso-powerpc-asm-offsets-056016f80174
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731485232; l=1145;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=3++6GpS6eJ69KS1+HG0bM6vN9BkdaF9jmm+cxdj1OjY=;
 b=7k7xztxEb90B3z0PQNrCn9sYj/veenq47sbzWWVsCUd9eIVPMfRzbGC4SfuxAJnkjnUpgR/7N
 qgs5QNJ93MdCkyiTvePnxuN+CSLY7KZR17wVNVo5lnAz6WEnD4fJCKE
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

These offsets are not used anymore, delete them.

Fixes: c39b1dcf055d ("powerpc/vdso: Add a page for non-time data")
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
This is based on powerpc/topic/vdso.
Feel free to fold this change into the original commit.
---
 arch/powerpc/kernel/asm-offsets.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 7b3feb6bc2103bc89ea14fbaac6937f1c97d4ff8..23733282de4d9f975aa9450b26c1049688e6663e 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -346,8 +346,6 @@ int main(void)
 #else
 	OFFSET(CFG_SYSCALL_MAP32, vdso_arch_data, syscall_map);
 #endif
-	OFFSET(VDSO_CLOCKMODE_OFFSET, vdso_arch_data, data[0].clock_mode);
-	DEFINE(VDSO_CLOCKMODE_TIMENS, VDSO_CLOCKMODE_TIMENS);
 
 #ifdef CONFIG_BUG
 	DEFINE(BUG_ENTRY_SIZE, sizeof(struct bug_entry));

---
base-commit: 0161bd38c24312853ed5ae9a425a1c41c4ac674a
change-id: 20241113-vdso-powerpc-asm-offsets-056016f80174

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


