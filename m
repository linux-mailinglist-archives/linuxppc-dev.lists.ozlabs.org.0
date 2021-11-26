Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A674045E684
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 04:23:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0g7W6CDdz3c5q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 14:23:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=j89VpPiO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=j89VpPiO; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0g6s18ZNz2x9g
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 14:22:59 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id
 nh10-20020a17090b364a00b001a69adad5ebso7057297pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 19:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GUaUmTr1C3qa9qMGfGDtZO3hUTUW9SwzE/2YoH0XipE=;
 b=j89VpPiOLuLWVjFMpUdPKb0pDBpUjRwbRR4qI377GR6bkwB51re4Ar52eVMQMupTOd
 YS3Xj3gqMgjoZYe7JsFstT0oehD3W3JK2ipP4IgCZQ07nNtzPcsbcrR7cdZQdT1vTCnm
 VI+8FV35jeFKvCtOReAfs6U4YQHNWhGBxrAaLWlQElpzalrc0ARJGgnV3EbQYIXiZ3Gf
 AzbHZY6T6U17T523GI9Oyw07P+gmUZKMdKKVs4g+JtNAIvn2tc9E4JDcdVxQKlSKWk29
 vaNcLJIS7kR9wX/dVDLTuUdLQvPjN72FYFc5FCE+nN5y50RxdwC1IEJyFag9k5Lt5ncE
 qfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GUaUmTr1C3qa9qMGfGDtZO3hUTUW9SwzE/2YoH0XipE=;
 b=VrQTS2DfxUgnE7IpugGaSQSutUL4o8Ty4b+lftIlpr0OsPfCLHkY5ba10eDjWXf/tD
 XHjXpJfKOnpFvBPWbGLUcwHueDSUWIdAZMTIg8cxqippk66hOgYL9g58E+Omhk6ztdA2
 X/+h/upB3+segIOAT0HIS/VNPb/HWKT3MYYNiLAAiYV6PtFDXNWohDVmaDZxe6n7GVCt
 r88zCfV3HKorW/LSoKHVXmXItBcO3P7EaSTlT/7Id8X4y9l8T6vP4iPm2YGZ0GqeT2/4
 HT9uaTFLUyupo3cztm58UxWbQ63TIjAQHF1oKxpUXzi+pSQ8TS3SaulBqiEeUxykOhPo
 zONg==
X-Gm-Message-State: AOAM532qEmPVTr983a3xFIsAW1JeEc1zxr7AwtD/4eaby62HdZRcrlji
 g/ONQpwF+up8Om8r8H5d/Vingdivg1s=
X-Google-Smtp-Source: ABdhPJyq9vtgQ1WWEjdpXY/r7Of5mLpG89C3zPAC5Rc3CzOd/2f2wPfSnRb9V/dG4X1x44i0qZ5PdA==
X-Received: by 2002:a17:90a:3e09:: with SMTP id
 j9mr12682511pjc.24.1637896976099; 
 Thu, 25 Nov 2021 19:22:56 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id l4sm5143386pfc.121.2021.11.25.19.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 19:22:55 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powerpc/code-patching: work around code patching
 verification in patching tests
Date: Fri, 26 Nov 2021 13:22:47 +1000
Message-Id: <20211126032249.1652080-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Code patching tests patch the stack and (non-module) vmalloc space now,
which falls afoul of the new address check.

The stack patching can easily be fixed, but the vmalloc patching is more
difficult. For now, add an ugly workaround to skip the check while the
test code is running.

Fixes: 8b8a8f0ab3f55 ("powerpc/code-patching: Improve verification of patchability")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/code-patching.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 5e2fe133639e..57e160963ab7 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -187,10 +187,12 @@ static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
 
 #endif /* CONFIG_STRICT_KERNEL_RWX */
 
+static bool skip_addr_verif = false;
+
 int patch_instruction(u32 *addr, struct ppc_inst instr)
 {
 	/* Make sure we aren't patching a freed init section */
-	if (!kernel_text_address((unsigned long)addr))
+	if (!skip_addr_verif && !kernel_text_address((unsigned long)addr))
 		return 0;
 
 	return do_patch_instruction(addr, instr);
@@ -738,11 +740,13 @@ static int __init test_code_patching(void)
 {
 	printk(KERN_DEBUG "Running code patching self-tests ...\n");
 
+	skip_addr_verif = true;
 	test_branch_iform();
 	test_branch_bform();
 	test_create_function_call();
 	test_translate_branch();
 	test_prefixed_patching();
+	skip_addr_verif = false;
 
 	return 0;
 }
-- 
2.23.0

