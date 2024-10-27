Return-Path: <linuxppc-dev+bounces-2622-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CF39B2115
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Oct 2024 23:32:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcB9G6zj3z2xjP;
	Mon, 28 Oct 2024 09:32:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.183
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730068134;
	cv=none; b=ZBtv6XM3fp8f/W9K5GJlKpNYNQMV2gUE08tyEyH9ujJHHEo/CkPo6osSXaQcwRJ6rfXb6B98euYdaobpyQcuiVE+VPpFOwfzDNznryuL8wbjDDQQdMawKZZKi58S3yYKw7P2viAjIWV5JICCME9qHlgSvdBLG+OL8qD36ZBsCHeygCAes0ADaXRPdWk2RQMiA2he7ui64CLPT6iTfAH9k6ZFgX8d42TH+RIMjG47WALq73hzo+sptXqUaf+MdsjXMhXiX4U2iV91a/ECzBPxj8Sk1ri8FcS0lWS6eNGd53vDIPNX9cfJCEqYYbM7i7brFrL7Yv8Z5MeRxr7agNds/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730068134; c=relaxed/relaxed;
	bh=sPyEMx1Cix540CPR4LmCJqBqTR/s1Cf9zBXVuWCkKvk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WAaARK/aPltsvFqmYFenWR4hEHEtNP7YD0H1Q48v3vSz5w1v5c0uF/RBcTUjc/pPv9DUwDYAnG1lOstgOieu6eGkEE6dz0cBQFvE7aXBzdY/nJRSODW8h5oU/qJc1rLBVpnyGbKfTdL1S0nvFV/3jNMLIGac0nTMCeLn4Kc4oBFei0Lt2cfzZl0j3UHLuXCLuyXJ3TkkaBtGBgTIRRN63qh39M+uje7tK3J6cMwYdrABoPQp6IQA4iub6rYSTQyh23xBBluJAMGeMCceOIBDYLHNyuWTSnyII0mGkIBBJni5I4Tpz5taTKNXpdU5FxUPbdnrxSRjFrKE6oDhjDK5yQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uWijFkqO; dkim-atps=neutral; spf=pass (client-ip=95.215.58.183; helo=out-183.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uWijFkqO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.183; helo=out-183.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 322 seconds by postgrey-1.37 at boromir; Mon, 28 Oct 2024 09:28:51 AEDT
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XcB4z08mGz2xjP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 09:28:50 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730067776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sPyEMx1Cix540CPR4LmCJqBqTR/s1Cf9zBXVuWCkKvk=;
	b=uWijFkqOZALURJnEJ7HQegQOrIjy+GesZoYx1yOWz7w+grl4V1xgKtyXecoxmxUJ9eFyHq
	A3Hc36K4eBydTZWlw2KBSzRq8lTK9diYYz3aSG7xcPGa3fvrfj1s8mVYIJOeiGZgoStUMo
	/105F4irNL20nzTkjomy+oHQAAva+0c=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Rob Herring <robh@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: Use str_enabled_disabled() helper function
Date: Sun, 27 Oct 2024 23:22:17 +0100
Message-ID: <20241027222219.1173-2-thorsten.blum@linux.dev>
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
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Remove hard-coded strings by using the str_enabled_disabled() helper
function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/powerpc/kernel/secure_boot.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/secure_boot.c b/arch/powerpc/kernel/secure_boot.c
index 9e0efb657f39..3a28795b4ed8 100644
--- a/arch/powerpc/kernel/secure_boot.c
+++ b/arch/powerpc/kernel/secure_boot.c
@@ -5,6 +5,7 @@
  */
 #include <linux/types.h>
 #include <linux/of.h>
+#include <linux/string_choices.h>
 #include <asm/secure_boot.h>
 
 static struct device_node *get_ppc_fw_sb_node(void)
@@ -38,7 +39,7 @@ bool is_ppc_secureboot_enabled(void)
 	of_node_put(node);
 
 out:
-	pr_info("Secure boot mode %s\n", enabled ? "enabled" : "disabled");
+	pr_info("Secure boot mode %s\n", str_enabled_disabled(enabled));
 
 	return enabled;
 }
@@ -62,7 +63,7 @@ bool is_ppc_trustedboot_enabled(void)
 	of_node_put(node);
 
 out:
-	pr_info("Trusted boot mode %s\n", enabled ? "enabled" : "disabled");
+	pr_info("Trusted boot mode %s\n", str_enabled_disabled(enabled));
 
 	return enabled;
 }
-- 
2.47.0


