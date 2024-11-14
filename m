Return-Path: <linuxppc-dev+bounces-3199-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AACD9C8B82
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 14:11:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq0sW5gPJz300g;
	Fri, 15 Nov 2024 00:11:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731589887;
	cv=none; b=SP8B/r+lbAF32axTDufBE1RTrqFrRnUe0562I4dtEp+jdO/qqJ2SSzec/zxA4Mmg9cNMR1PLtFpuQG5BcOiv1YwVepN254O3t+keVT3zjuZqZ4nxq7c7/tEQQrwUNa4lL1ekJ14G+ac1Nlslqghd6pSVF0XVHd7PYkaJ5KqGLxUAP0rpcJB4fhsUzDL7xcpqtpULWKwS8s384myWG+CacwbMmckIF9u0A30Q0bpiibDAKDbx0cV4XIy1exjWWfTuRA4SIIhXmOvBBH2/2WQI0YYt2K+59scbZGMkai5vJbdBVGDTqZf2i/DchrcerWaW1TOV68vcXsqYaIO6+iyPYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731589887; c=relaxed/relaxed;
	bh=SFfY1Ei+f27k37oE25d77G2m8Eso4IttgQ6BlXa9+4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qokz9apITZ3HToYCmFGwdGrnrjO5IMVsAEnMNcWIDth342qAY8nn2YE3ZGm25Dzruhzf2+4nsJpA3aLqL2cMWTc4YEDkttd5jJ+f+i5k33vLxjwLJF3QFbEgGQutiXhaqMOokb2NWeBIxHpDrYWUd8vk1jqMSZ486YCwKSYlIHVNzNncTU+WCntdwae8i5vAch4NsboVOkQnpFh0fuhShpbUG2ITgxXOT48Ylqxw/nsoIHBWJnuJf5FCQZG7sd1xVy7Gbe3vHylYhqyo6TSGvIhHlt8IC532n07OTZMHGsEajEO0Ls+966sHyhXsD0bwkMkF2EKYhe5GXhBTpuXwnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=D0UgKNU7; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=D0UgKNU7;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq0sV75FLz301w
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 00:11:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731589884;
	bh=SFfY1Ei+f27k37oE25d77G2m8Eso4IttgQ6BlXa9+4w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D0UgKNU7nWKInoWE2oC6CrSlTHGQ05VMdGF2KXVt1KKjMB4vD+Y+IKJP1QcOD/ktC
	 UGruDyBBjAzCChmQ/otjFKPeDt809ROmXM1eYyjr61bwHHkGpWY0jJ6+OGuIq8btff
	 Ez3io3TtGrSOe/lgQZwofO7GXFg2G7ko2uWC6oNKL8I8K0SJhu6opCzpBFzPUtOobq
	 h9mDV9Mxa9A1K7oJPjPUYO8zgj3Idbo8lcOZj0aveCAmYZ+/GZ/AohLmElzhMBXrwu
	 ziCGB6VPJowijZwbz7oVsCH8lEeH+YB/Wb0uKuLu1lmdX9+anvOxRWraju/HZDslCM
	 99l2WfRKdSLdA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xq0sS0pL2z4x9G;
	Fri, 15 Nov 2024 00:11:24 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kernel@vger.kernel.org>,
	<geert@linux-m68k.org>,
	<arnd@arndb.de>
Subject: [RFC PATCH 06/10] powerpc: Remove prom_init longtrail work arounds
Date: Fri, 15 Nov 2024 00:11:09 +1100
Message-ID: <20241114131114.602234-6-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114131114.602234-1-mpe@ellerman.id.au>
References: <20241114131114.602234-1-mpe@ellerman.id.au>
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
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Although these work arounds aren't guarded by PPC_CHRP, they should only
ever have taken effect on CHRP Long Trail machines due to the firmware
version check. With CHRP support removed they are no longer needed,
remove them.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/prom_init.c | 62 +++------------------------------
 1 file changed, 5 insertions(+), 57 deletions(-)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 94ffc52440bd..1485494cfc38 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -94,7 +94,6 @@ static int of_workarounds __prombss;
 #endif
 
 #define OF_WA_CLAIM	1	/* do phys/virt claim separately, then map */
-#define OF_WA_LONGTRAIL	2	/* work around longtrail bugs */
 
 #ifdef DEBUG_PROM
 #define prom_debug(x...)	prom_printf(x)
@@ -267,6 +266,7 @@ static ssize_t __init prom_strscpy_pad(char *dest, const char *src, size_t n)
 	return rc;
 }
 
+#ifdef CONFIG_PPC64
 static int __init prom_strncmp(const char *cs, const char *ct, size_t count)
 {
 	unsigned char c1, c2;
@@ -282,6 +282,7 @@ static int __init prom_strncmp(const char *cs, const char *ct, size_t count)
 	}
 	return 0;
 }
+#endif
 
 static size_t __init prom_strlen(const char *s)
 {
@@ -668,52 +669,11 @@ static inline int __init prom_getproplen(phandle node, const char *pname)
 	return call_prom("getproplen", 2, 1, node, ADDR(pname));
 }
 
-static void __init add_string(char **str, const char *q)
-{
-	char *p = *str;
-
-	while (*q)
-		*p++ = *q++;
-	*p++ = ' ';
-	*str = p;
-}
-
-static char *__init tohex(unsigned int x)
-{
-	static const char digits[] __initconst = "0123456789abcdef";
-	static char result[9] __prombss;
-	int i;
-
-	result[8] = 0;
-	i = 8;
-	do {
-		--i;
-		result[i] = digits[x & 0xf];
-		x >>= 4;
-	} while (x != 0 && i > 0);
-	return &result[i];
-}
-
 static int __init prom_setprop(phandle node, const char *nodename,
 			       const char *pname, void *value, size_t valuelen)
 {
-	char cmd[256], *p;
-
-	if (!(OF_WORKAROUNDS & OF_WA_LONGTRAIL))
-		return call_prom("setprop", 4, 1, node, ADDR(pname),
-				 (u32)(unsigned long) value, (u32) valuelen);
-
-	/* gah... setprop doesn't work on longtrail, have to use interpret */
-	p = cmd;
-	add_string(&p, "dev");
-	add_string(&p, nodename);
-	add_string(&p, tohex((u32)(unsigned long) value));
-	add_string(&p, tohex(valuelen));
-	add_string(&p, tohex(ADDR(pname)));
-	add_string(&p, tohex(prom_strlen(pname)));
-	add_string(&p, "property");
-	*p = 0;
-	return call_prom("interpret", 1, 1, (u32)(unsigned long) cmd);
+	return call_prom("setprop", 4, 1, node, ADDR(pname),
+			 (u32)(unsigned long) value, (u32) valuelen);
 }
 
 /* We can't use the standard versions because of relocation headaches. */
@@ -1678,14 +1638,6 @@ static void __init prom_init_mem(void)
 	for (node = 0; prom_next_node(&node); ) {
 		type[0] = 0;
 		prom_getprop(node, "device_type", type, sizeof(type));
-
-		if (type[0] == 0) {
-			/*
-			 * CHRP Longtrail machines have no device_type
-			 * on the memory node, so check the name instead...
-			 */
-			prom_getprop(node, "name", type, sizeof(type));
-		}
 		if (prom_strcmp(type, "memory"))
 			continue;
 
@@ -2238,7 +2190,6 @@ static void __init prom_init_client_services(unsigned long pp)
 /*
  * For really old powermacs, we need to map things we claim.
  * For that, we need the ihandle of the mmu.
- * Also, on the longtrail, we need to work around other bugs.
  */
 static void __init prom_find_mmu(void)
 {
@@ -2254,10 +2205,7 @@ static void __init prom_find_mmu(void)
 	/* XXX might need to add other versions here */
 	if (prom_strcmp(version, "Open Firmware, 1.0.5") == 0)
 		of_workarounds = OF_WA_CLAIM;
-	else if (prom_strncmp(version, "FirmWorks,3.", 12) == 0) {
-		of_workarounds = OF_WA_CLAIM | OF_WA_LONGTRAIL;
-		call_prom("interpret", 1, 1, "dev /memory 0 to allow-reclaim");
-	} else
+	else
 		return;
 	prom.memory = call_prom("open", 1, 1, ADDR("/memory"));
 	prom_getprop(prom.chosen, "mmu", &prom.mmumap,
-- 
2.47.0


