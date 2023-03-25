Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 130796C8E79
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 14:26:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PkKbh6HGVz3fR3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Mar 2023 00:26:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PmSe/7G0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PmSe/7G0;
	dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PkKYq5LMRz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Mar 2023 00:24:47 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id iw3so4257291plb.6
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 06:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679750684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ahsM/4QaguHrKEpWtbCXX2QKaAa0hihhvMv4R3UpDc=;
        b=PmSe/7G0ekW4XqrOBDUYQnrY2bzR3v4Z0m3KehOWEfxTKY06h3OEcw//jTSv/hHbNr
         TWwJzfttmLo85T68Y4cA70vieJSZBS3mJ+wd0hotncpTDDBz09gGqLg19mtCxFOqlB0i
         9Q8g5qtRSRo/8KE/zYWixp7jGUCIS6uHuSyYiYrOqniokhl1TcnIVqMs39NccTFa7+Ys
         vOxfPb75Nw2FU3JYRSJLmbmcRvlTFdd2As6qMqCjvI2buZFrwjVyxN05jcpalX5VmkxQ
         YAGkrBy6R7Mj6cbs0ZKID+qnYEr97RwkwSOqHbz9dpHimp4Cj3MEL06uc6ikaIqUMk2+
         LfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679750684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ahsM/4QaguHrKEpWtbCXX2QKaAa0hihhvMv4R3UpDc=;
        b=NH3EDg1yo3Wz+GHyrZmTI1LkMBohKUGISYCBu2JQFSDL27w8q0Z31lkY/tH3clU7KU
         iLvHfFMLGlPstouX6ppMaf8xdRFjveW7sIvZ47hdmsdnN8adixhaIA7V5+jr65LwVZsH
         2wVxXrcjny6mKERPAsOhpDuVnFhchs9PhlyBuhYR9Asks+qmf6EuqlOmx2b72EeSUWk2
         DAi9WzkOczxyykBoRJsMJRkBa8mi77sJ7j+25cZSdnbzC5ynaeDSnKWpY38CrGOTa04w
         zTsea5EWiQG4vkWpe245FF13vrRICqvaXrwDWpfTNuxzmnkL24fq0KeNiNevOVGRjUAJ
         zObg==
X-Gm-Message-State: AAQBX9dGP0GERbYpGMmVZ1Q3MJJ5Os5NhZxeqW/jyjJFLmJEA7sxDDxa
	fuAfJwcMSXaj39b8bfpjJ6hwUun/+Og=
X-Google-Smtp-Source: AKy350ZIBGcFIuTrpun2Eetps9nGajG1dX/tzIwhQ0FSvw8ZnGgCzzdoBkNzoTLQ9ss/6pJSuA83nA==
X-Received: by 2002:a17:902:f54e:b0:1a0:6a47:184e with SMTP id h14-20020a170902f54e00b001a06a47184emr7522374plf.42.1679750684558;
        Sat, 25 Mar 2023 06:24:44 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([124.170.18.191])
        by smtp.gmail.com with ESMTPSA id k2-20020a170902e90200b0019c919bccf8sm16001552pld.86.2023.03.25.06.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 06:24:44 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/2] powerpc/64: Move initial base and TOC pointer calculation
Date: Sat, 25 Mar 2023 23:24:34 +1000
Message-Id: <20230325132435.2459170-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230325132435.2459170-1-npiggin@gmail.com>
References: <20230325132435.2459170-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A later change moves the non-prom case to run at the virtual address
earlier, which calls for virtual TOC and kernel base. Split these two
calculations for prom and non-prom to make that change simpler.

Signed: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/head_64.S | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 1febb56ebaeb..5b2d607cd1e8 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -515,15 +515,6 @@ __start_initialization_multiplatform:
 	/* Zero r13 (paca) so early program check / mce don't use it */
 	li	r13,0
 
-	/* Get TOC pointer (current runtime address) */
-	bl	relative_toc
-
-	/* find out where we are now */
-	bcl	20,31,$+4
-0:	mflr	r26			/* r26 = runtime addr here */
-	addis	r26,r26,(_stext - 0b)@ha
-	addi	r26,r26,(_stext - 0b)@l	/* current runtime base addr */
-
 	/*
 	 * Are we booted from a PROM Of-type client-interface ?
 	 */
@@ -545,11 +536,30 @@ __start_initialization_multiplatform:
 #else
 	bl	start_initialization_book3s
 #endif /* CONFIG_PPC_BOOK3E_64 */
+
+	/* Get TOC pointer */
+	bl	relative_toc
+
+	/* find out where we are now */
+	bcl	20,31,$+4
+0:	mflr	r26			/* r26 = runtime addr here */
+	addis	r26,r26,(_stext - 0b)@ha
+	addi	r26,r26,(_stext - 0b)@l	/* current runtime base addr */
+
 	b	__after_prom_start
 
 __REF
 __boot_from_prom:
 #ifdef CONFIG_PPC_OF_BOOT_TRAMPOLINE
+	/* Get TOC pointer */
+	bl	relative_toc
+
+	/* find out where we are now */
+	bcl	20,31,$+4
+0:	mflr	r26			/* r26 = runtime addr here */
+	addis	r26,r26,(_stext - 0b)@ha
+	addi	r26,r26,(_stext - 0b)@l	/* current runtime base addr */
+
 	/* Save parameters */
 	mr	r31,r3
 	mr	r30,r4
-- 
2.37.2

