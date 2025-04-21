Return-Path: <linuxppc-dev+bounces-7868-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE11A959DE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 01:46:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhMSn3BFgz2xrb;
	Tue, 22 Apr 2025 09:46:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745260305;
	cv=none; b=kA1+v6Fw6GL+FTrqcwNxY1ykPcNpnbDxsVOoQw9El4fYMO1dP+l4JUHSA6uySoxtWT+0zForRUFWsiL0L1SqsmUdZRQFTYO8II0oQdcbI5p4BTOldsgCmP1zPiQp/jD0lmwyf1Amk9wv5sMgX0Elgbzg+AH1MFLrWZkCR/jdlwrNrgNBm2A19g0lqpvWR7zg+XHcVmKZrbpOzUBCcLSHiXYn8hwiCXQwvdXqdKqF7Zq+ajDV0rLsEkZgCTB0RRh6SXWD0Lc32rVFGXCqA+wwKCJhBOKzZrtjE4oWC6iDBhuyTRhLCnGINLh0Dq63ut5LLNq0jJWau0yaLHLa/ea4uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745260305; c=relaxed/relaxed;
	bh=E3ybrypQERCxYfRiNAJIXspuGT3P1YIpk3kQKCZFkuA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LuBNL4+P9Agey5LIvRgn0fC+TIvkeDMVqNlcMHiHG/vJREVeGhFtFHxb+kNEAiRvMWK+TCmq75/0Jcmuoz3tq9H/3nDDQT8QuJDaneKTCeWTXGPiWc7jco+z48mt1dRycgXoVbfR5BWOCF3Evjqay/ONo4brFZ2dkUuNhKp857KmoEsKOzWAKtJ0rmgykSz4KOXU8uVwnsQvz8HmyOxVQcbaqMEvKiiAjoK4OCrSZ5nSOICYjTm0KI++qmof1X6CT6jKd38HmLcm39AypgW8oPWLZqyt58qzyhgeDjW+T2Z4or8cwQRVQdtNHnzrr9YG2N6Be4fqtNCBHue3b7zvTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hYRQdE86; dkim-atps=neutral; spf=pass (client-ip=95.215.58.172; helo=out-172.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hYRQdE86;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.172; helo=out-172.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhDV54rZMz2yN2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 04:31:40 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745260278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E3ybrypQERCxYfRiNAJIXspuGT3P1YIpk3kQKCZFkuA=;
	b=hYRQdE86HeqsEcoqI/4cwdCjv74pqBqzj6DJxsGYhb0mgqznsY5AKDDsaUhJAp067OyRZv
	sbcx6QCusIv/+iPbVsrUOJbqh8a3xIPxI1SSuQwXvBRI+saVR5Atg0LBUVzAJMbt0p6az8
	S3yqyPaPxqK9LurcsMU357yPgKMYMXU=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-hardening@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: Replace strcpy() with strscpy() in proc_ppc64_init()
Date: Mon, 21 Apr 2025 20:31:08 +0200
Message-ID: <20250421183110.436265-1-thorsten.blum@linux.dev>
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
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

strcpy() is deprecated; use strscpy() instead.

Don't cast the destination buffer from 'u8[]' to 'char *' to satisfy the
__must_be_array() requirement of strscpy().

No functional changes intended.

Link: https://github.com/KSPP/linux/issues/88
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/powerpc/kernel/proc_powerpc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/proc_powerpc.c b/arch/powerpc/kernel/proc_powerpc.c
index 3816a2bf2b84..d083b4517065 100644
--- a/arch/powerpc/kernel/proc_powerpc.c
+++ b/arch/powerpc/kernel/proc_powerpc.c
@@ -9,6 +9,7 @@
 #include <linux/proc_fs.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
+#include <linux/string.h>
 
 #include <asm/machdep.h>
 #include <asm/vdso_datapage.h>
@@ -56,7 +57,7 @@ static int __init proc_ppc64_init(void)
 {
 	struct proc_dir_entry *pde;
 
-	strcpy((char *)systemcfg->eye_catcher, "SYSTEMCFG:PPC64");
+	strscpy(systemcfg->eye_catcher, "SYSTEMCFG:PPC64");
 	systemcfg->version.major = SYSTEMCFG_MAJOR;
 	systemcfg->version.minor = SYSTEMCFG_MINOR;
 	systemcfg->processor = mfspr(SPRN_PVR);
-- 
2.49.0


