Return-Path: <linuxppc-dev+bounces-12795-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C44ABD3563
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Oct 2025 16:05:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4clfHm2nGzz30V1;
	Tue, 14 Oct 2025 01:05:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760364308;
	cv=none; b=b792Vnn93FpHZK2k9HfORBTlxXiz2PxeFEpPDcKzdVZHag/zQ9lEF2VPAl1uNDzML2B2Bg7bL4BDHaxf3ESIVXcdIY/azkB//BHg5RgW5O4JyXs5+INWDSO03YyDD52Z9P2D4ulOEpC0XM8CLRSw0ej6PVGkrsiloDFZjmCAJwveK5ax7FziTYyQgJSdXgvp98RmSlFHQJMWozaL6/TW+F2hdCMiORjjkKYBm3c7u91kOzBSttyOVp8Rc3tqiHJLjUcl/wgvw33J3kkCkGQ6NvrVDNAzMPHuAohvJ6vuxf/5ELXUWs+Jlsy3asCvIsee+cQ+JJQa/8F+4nAA7WmwZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760364308; c=relaxed/relaxed;
	bh=uKCeVoplcSeU8bHZlk1TaSw0Kbvlf2fYQNyEbPJVu1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EcyDXObI/CfsCdYCLOoCxyTfbJ1Rb07X2IZJ8vsWRdTswFaAeR8asBhUadtnCgUFZTDSenxEy9ziG3hInolDKWiJ97kRKls8FnGKfbqXZePsvqjgLmvtJ74o78E7NfqaFNlsZJzl8HipS3SQap3P+sg37Y+iWgLPrTFTcSmXCq6xHMkGlbUAu0P9inDZdQ3TmB+zjYOaXfN+ndAja/1p/KkxJgPNE68FEq/UjOQDot5f5vGy1UPo2yc7gi83PmaLB0fcTgecSjV204t0+HOB4mvHQ1yzWe1iL7eYkLe+orUMQiWvQfzktGbTjaM4CBHRhIf7rzNStt/JxHM0YR1EaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FywpRp8N; dkim-atps=neutral; spf=pass (client-ip=95.215.58.182; helo=out-182.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FywpRp8N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.182; helo=out-182.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 442 seconds by postgrey-1.37 at boromir; Tue, 14 Oct 2025 01:05:05 AEDT
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4clfHj1GkHz302l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 01:05:04 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760363840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uKCeVoplcSeU8bHZlk1TaSw0Kbvlf2fYQNyEbPJVu1Q=;
	b=FywpRp8NBqUYnNzKAOFOcnOnhX1b4P2C5vwMnLxu+2RmWGmmRRP/NGEXHeHbnjLUSNGKeZ
	z134yp+cqInNjJV9A4+pmcO2poKGw80v0v8pGT6u9VGlR5rfitm+UlFclLQnqWCf4NTB+I
	++mpvlPEZ8Wa0fA4uMtrhAEuCooXnXQ=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-hardening@vger.kernel.org,
	Thorsten Blum <thorsten.blum@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/pseries/lparcfg: Replace deprecated strcpy in parse_system_parameter_string
Date: Mon, 13 Oct 2025 15:57:02 +0200
Message-ID: <20251013135703.97260-2-thorsten.blum@linux.dev>
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
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

strcpy() is deprecated; use strscpy() instead. Use the return value of
strscpy() instead of calling strlen() again, and ignore any potential
string truncation since both strings are much shorter than the buffer
size SPLPAR_MAXLENGTH.

Change both if conditions to silence the following checkpatch warnings:

  Comparisons should place the constant on the right side of the test

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/powerpc/platforms/pseries/lparcfg.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index cc22924f159f..533a6edf2e03 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -22,6 +22,7 @@
 #include <asm/papr-sysparm.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/uaccess.h>
 #include <linux/hugetlb.h>
 #include <asm/lppaca.h>
@@ -420,17 +421,18 @@ static void parse_system_parameter_string(struct seq_file *m)
 				w_idx = 0;
 			} else if (local_buffer[idx] == '=') {
 				/* code here to replace workbuffer contents
-				   with different keyword strings */
-				if (0 == strcmp(workbuffer, "MaxEntCap")) {
-					strcpy(workbuffer,
-					       "partition_max_entitled_capacity");
-					w_idx = strlen(workbuffer);
-				}
-				if (0 == strcmp(workbuffer, "MaxPlatProcs")) {
-					strcpy(workbuffer,
-					       "system_potential_processors");
-					w_idx = strlen(workbuffer);
-				}
+				 * with different keyword strings. Truncation
+				 * by strscpy is deliberately ignored because
+				 * SPLPAR_MAXLENGTH >= maximum string size.
+				 */
+				if (!strcmp(workbuffer, "MaxEntCap"))
+					w_idx = strscpy(workbuffer,
+							"partition_max_entitled_capacity",
+							SPLPAR_MAXLENGTH);
+				if (!strcmp(workbuffer, "MaxPlatProcs"))
+					w_idx = strscpy(workbuffer,
+							"system_potential_processors",
+							SPLPAR_MAXLENGTH);
 			}
 		}
 		kfree(workbuffer);
-- 
2.51.0


