Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDA53AE385
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 08:50:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7gCT26RWz3c3D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 16:50:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Uyj1eoyZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Uyj1eoyZ; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7gBQ6CRfz2yXh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 16:49:50 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G7gBG1tZKz9sW7; Mon, 21 Jun 2021 16:49:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1624258182;
 bh=/1SDxNaltuutHLL7NBoTW0wRrrQbKL1s2r0ffiYuMFA=;
 h=From:To:Subject:Date:From;
 b=Uyj1eoyZ+yJiW51VtHTeynhIfvFj4oaFVx8ZWd1SOTkg1O67hJmd/aGnEFmAgCU8J
 MCwczZ/9mn9O6RgaVVvSd9C37BEXmdkOmPlWBev2N9IiZSPHRYxnPLDVfaQj7Vayy2
 9NR8bF6no2Io12u7W9fu2naSabBNq1o5wisZv0Bb5BpgSIR1Ve39TRqcf2DUI8JtDD
 9AsAzSL84zK5lisQVX53BVmdjMU5OIeHoH8O2PWxmwVCN76NvvKa9ngC0kTCLxCdtd
 PFZJWskg2Y9Wl/WKM3UAn+3AUDyUAkDFgzu1FHy91kjkncp8GMO3XXDHkVeQX+qVNG
 yhaRb+9PvhjaQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/prom_init: Convert prom_strcpy() into
 prom_strscpy_pad()
Date: Mon, 21 Jun 2021 16:49:37 +1000
Message-Id: <20210621064938.2021419-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In a subsequent patch we'd like to have something like a strscpy_pad()
implementation usable in prom_init.c.

Currently we have a strcpy() implementation with only one caller, so
convert it into strscpy_pad() and update the caller.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/prom_init.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 523b31685c4c..c18d55f8b951 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -242,13 +242,31 @@ static int __init prom_strcmp(const char *cs, const char *ct)
 	return 0;
 }
 
-static char __init *prom_strcpy(char *dest, const char *src)
+static ssize_t __init prom_strscpy_pad(char *dest, const char *src, size_t n)
 {
-	char *tmp = dest;
+	ssize_t rc;
+	size_t i;
 
-	while ((*dest++ = *src++) != '\0')
-		/* nothing */;
-	return tmp;
+	if (n == 0 || n > INT_MAX)
+		return -E2BIG;
+
+	// Copy up to n bytes
+	for (i = 0; i < n && src[i] != '\0'; i++)
+		dest[i] = src[i];
+
+	rc = i;
+
+	// If we copied all n then we have run out of space for the nul
+	if (rc == n) {
+		// Rewind by one character to ensure nul termination
+		i--;
+		rc = -E2BIG;
+	}
+
+	for (; i < n; i++)
+		dest[i] = '\0';
+
+	return rc;
 }
 
 static int __init prom_strncmp(const char *cs, const char *ct, size_t count)
@@ -2701,7 +2719,7 @@ static void __init flatten_device_tree(void)
 
 	/* Add "phandle" in there, we'll need it */
 	namep = make_room(&mem_start, &mem_end, 16, 1);
-	prom_strcpy(namep, "phandle");
+	prom_strscpy_pad(namep, "phandle", sizeof("phandle"));
 	mem_start = (unsigned long)namep + prom_strlen(namep) + 1;
 
 	/* Build string array */
-- 
2.25.1

