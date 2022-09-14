Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C345B8C3A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 17:50:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSPtD45qzz30Bp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 01:50:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bF8d5bIt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bF8d5bIt;
	dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSPql5SZnz2xy4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 01:48:03 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id a80so6760238pfa.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 08:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=/7J/hO7DSbMODCirMCFkKaZJzA41MXCJl5bIy80vYCY=;
        b=bF8d5bItVf86rgWBySmbHA4lbXdjm6ygM2oeuTWu3zyFCMj56GiDpzXdOh29i6SZ3Q
         51C2HyEK1W6DfE0SMo9c7ANQZe7lVZM4fHaDkry+rdgpC2buBJw6fQHCsUa65IY8+X8+
         sxlJgV2CYUQN/TJdxTAU4FFYVNwP8ZAkdqXSoQf2RrIezeABunCTXRBmLm5n+3e+PIFa
         QdF2gpGg64ZBSSvLzMCr3RJ7xMKLfrzFvuKQ7KfsD/TRndDO03LRt8jOm6HMnEmrbwhw
         rObxEDDouQ1oOiZDHLEMgjLTOANgi9vL2OUaeFYYr8f1YsSmuYoUYBjvyRkjOqcn4QfZ
         cuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/7J/hO7DSbMODCirMCFkKaZJzA41MXCJl5bIy80vYCY=;
        b=cHTLWawm2ETUpmvQY5MHoZxbjAgAZepIKZmWIitvl7s8pMwbe0UoRFVhOv7AKTCd72
         ASWqwPoi70ihNQBcafCE0yNfGNGGKUh2Rd4qJT1lcmrOyMYhu9VkUnuwaGiESCCS+2b0
         dVqub+At3BTaBRe1jdCZroT0F2O821jnlZdG2kZlGWoWETgXqKym0Z8OZHO5TNAPgrbw
         nZIFDljFBM20reaPDrgdzHsMWYKxsk07SiDRtLN751bEDBrMlSF19K8lgOhw1ZhfMbPV
         ze9NlyAIqPJ9erHY37OBETuPGbhmp1D+AvuJWcLzcA2wsaxhej2pYSAL3b//Qjzw4cNb
         Q2dg==
X-Gm-Message-State: ACgBeo00z6UxFnxwH4oICAX8SWP5KLDVCguzanTB6e+4Ws1lkq+NxuyN
	PVRV70O6UG5mnXekPBJUiIID1T4W/cs=
X-Google-Smtp-Source: AA6agR4M5UBAL60SfJSZgItzGb4Rsa7O6orWtPrjCFn19JdE0aJPIeqkGz4S2k5JeEnhERZ9Z6Xzmg==
X-Received: by 2002:a63:8b44:0:b0:434:f911:52a6 with SMTP id j65-20020a638b44000000b00434f91152a6mr30602649pge.496.1663170480868;
        Wed, 14 Sep 2022 08:48:00 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id i7-20020a17090332c700b00177e263303dsm9919892plr.183.2022.09.14.08.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 08:48:00 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/7] powerpc/32/build: move got1/got2 sections out of text
Date: Thu, 15 Sep 2022 01:47:42 +1000
Message-Id: <20220914154746.1122482-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220914154746.1122482-1-npiggin@gmail.com>
References: <20220914154746.1122482-1-npiggin@gmail.com>
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

Following the example from the binutils default linker script, move
.got1 and .got2 out of .text, to just after RO_DATA where they are in
read-only NX memory.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/vmlinux.lds.S | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 90ac5ff73df2..341ac79f49a9 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -122,14 +122,6 @@ SECTIONS
 		*(.sfpr);
 		MEM_KEEP(init.text)
 		MEM_KEEP(exit.text)
-
-#ifdef CONFIG_PPC32
-		*(.got1)
-		__got2_start = .;
-		*(.got2)
-		__got2_end = .;
-#endif /* CONFIG_PPC32 */
-
 	} :text
 
 	. = ALIGN(PAGE_SIZE);
@@ -139,7 +131,16 @@ SECTIONS
 	/* Read-only data */
 	RO_DATA(PAGE_SIZE)
 
-#ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC32
+	.got1 : AT(ADDR(.got1) - LOAD_OFFSET) {
+		*(.got1)
+	}
+	.got2 : AT(ADDR(.got2) - LOAD_OFFSET) {
+		__got2_start = .;
+		*(.got2)
+		__got2_end = .;
+	}
+#else /* CONFIG_PPC32 */
 	SOFT_MASK_TABLE(8)
 	RESTART_TABLE(8)
 
@@ -190,7 +191,7 @@ SECTIONS
 		*(__rfi_flush_fixup)
 		__stop___rfi_flush_fixup = .;
 	}
-#endif /* CONFIG_PPC64 */
+#endif /* CONFIG_PPC32 */
 
 #ifdef CONFIG_PPC_BARRIER_NOSPEC
 	. = ALIGN(8);
-- 
2.37.2

