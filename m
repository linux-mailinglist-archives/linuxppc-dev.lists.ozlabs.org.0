Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1193727A7C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 12:26:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458lzN33XYzDqdD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 20:26:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=mathieu.malaterre@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hS4Slwo3"; 
 dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458ly05Nq3zDqX0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 20:25:28 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id q15so5200963wmj.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 03:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jhXKgTFg9TGyapt/Wg0K0EHXXYsIVuNn8IRint8KwaY=;
 b=hS4Slwo3RwY1NewVpLWNl2+kR4blGJ/6yaEYtj7DsYTFV147VMXN4gUbn3wgwf5Wxx
 rvn5sSr0yAN3RWEOyb7cGkMlcsGyvJtvcOB2LvmU8egwtW8DsswH3UivToQL+mEZ74KW
 h+7Omca6Qfc8iGh/gi2UIizPRlgBtn20xP9sk3CgwzB6KDL/mnlgj9R/T5d0MAPLjG34
 o/EPZ/9izbLqwIVYLKuA8Ie8YUbi3Y8izlvmcTftUCeRI9bQ5cLaWZWSTL9pXhi2F0lW
 iBN+DR1qawy45dymIxfjZxaGMIjdsYZqVQtIl/Jl1OjXADQwjFU5UXvm+vMgbocHA+i9
 3dQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=jhXKgTFg9TGyapt/Wg0K0EHXXYsIVuNn8IRint8KwaY=;
 b=GhD62sGRtNtIYGIh0yWq9gdqY/8d1chL/S1XENYDDCSnGWgTijqDnLkxPFGfgDFW+D
 oWeX/bRc5tzJzkpP/Mz/yj7EeDq2hntwZIXQriwKw1uYmIY6H8m8d4w1ykAJcTQI5KrF
 0mjSF5uXL7CZ0BNe25Uzyz8PLlT1Z+BqEN7kFYAvg4x9BOzie4Q58ikZSaXGbKv531dy
 lJIV6plEZHg4B0YM0Y8/oTow/+sr/tpIEIcg7r6y7M2TrIQPFvkArJmhdt3AMmRh63eb
 ZFPRgwU0TWOoa/VUQWp1eAXPMPTS+A/HkQ62ErujtlqjyA86HzaUAAgDxUp1H4UmLdVW
 wjcQ==
X-Gm-Message-State: APjAAAWVdNZSP69/WprmE5hj8GxnSr6eBym7SiIkIwp073KWLRAbA9lY
 y+jCYG2r3iMSmbJ9IkrqoRc=
X-Google-Smtp-Source: APXvYqy6AZ8N3abqshqgIWcdkAkzE2sYArWIM4dCqSpWjtdBCh4+BA62g62qbgTWHlJU1efLcQhTWg==
X-Received: by 2002:a05:600c:230a:: with SMTP id
 10mr10567550wmo.13.1558607124467; 
 Thu, 23 May 2019 03:25:24 -0700 (PDT)
Received: from macbookpro.malat.net (bru31-1-78-225-224-134.fbx.proxad.net.
 [78.225.224.134])
 by smtp.gmail.com with ESMTPSA id s11sm51472858wrb.71.2019.05.23.03.25.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 May 2019 03:25:23 -0700 (PDT)
Received: by macbookpro.malat.net (Postfix, from userid 1000)
 id AC4D21146DCB; Thu, 23 May 2019 12:25:22 +0200 (CEST)
From: Mathieu Malaterre <malat@debian.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] =?UTF-8?q?powerpc:=20Remove=20variable=20=E2=80=98path?=
 =?UTF-8?q?=E2=80=99=20since=20not=20used?=
Date: Thu, 23 May 2019 12:25:20 +0200
Message-Id: <20190523102520.20585-1-malat@debian.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Mathieu Malaterre <malat@debian.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In commit eab00a208eb6 ("powerpc: Move `path` variable inside
DEBUG_PROM") DEBUG_PROM sentinels were added to silence a warning
(treated as error with W=1):

  arch/powerpc/kernel/prom_init.c:1388:8: error: variable ‘path’ set but not used [-Werror=unused-but-set-variable]

Rework the original patch and simplify the code, by removing the
variable ‘path’ completely. Fix line over 90 characters.

Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 arch/powerpc/kernel/prom_init.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 7edb23861162..f6df4ddebb82 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -1566,9 +1566,6 @@ static void __init reserve_mem(u64 base, u64 size)
 static void __init prom_init_mem(void)
 {
 	phandle node;
-#ifdef DEBUG_PROM
-	char *path;
-#endif
 	char type[64];
 	unsigned int plen;
 	cell_t *p, *endp;
@@ -1590,9 +1587,6 @@ static void __init prom_init_mem(void)
 	prom_debug("root_size_cells: %x\n", rsc);
 
 	prom_debug("scanning memory:\n");
-#ifdef DEBUG_PROM
-	path = prom_scratch;
-#endif
 
 	for (node = 0; prom_next_node(&node); ) {
 		type[0] = 0;
@@ -1617,9 +1611,10 @@ static void __init prom_init_mem(void)
 		endp = p + (plen / sizeof(cell_t));
 
 #ifdef DEBUG_PROM
-		memset(path, 0, sizeof(prom_scratch));
-		call_prom("package-to-path", 3, 1, node, path, sizeof(prom_scratch) - 1);
-		prom_debug("  node %s :\n", path);
+		memset(prom_scratch, 0, sizeof(prom_scratch));
+		call_prom("package-to-path", 3, 1, node, prom_scratch,
+			  sizeof(prom_scratch) - 1);
+		prom_debug("  node %s :\n", prom_scratch);
 #endif /* DEBUG_PROM */
 
 		while ((endp - p) >= (rac + rsc)) {
-- 
2.20.1

