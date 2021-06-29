Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FFB3B7A5C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 00:21:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDzTZ06Fzz3bq2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 08:21:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lHbvwZCY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lHbvwZCY; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDzSB4nRDz2yXX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 08:20:10 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id i4so325189plt.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 15:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FYWlfwwNFRAa59lnYtNMg6xM3zv1oHoF/57SD74yZ+M=;
 b=lHbvwZCY3911Tfphpkg44vmJHjAMdavyefyNruZq+65yGo4PbQzHM0h57XDDc4oUhl
 r60tY0oelroViByJpO2haA4NYSRWMFq+Kt09ABYuiRZ/c2E0NyH84x+DQ88Q3DmTBCU4
 6DIiH4ymD9B/sSnwDzTV4DI6S+BrllAIdxdyi+L3pVuCnFvLW+CsC5HUhhzYc7mQ/jMW
 2MDGnHfys/FWtzT+NDKH8q71s4exodKAYvab6T1KtMcSEoT1QEARTqoOWFnbd9D3DHmU
 iSf2fjslePt2maPjt09eKRjlEfm7HFtawlb7vrlRES+4EB5vIdckdPLYHkl4wCXM+NJf
 kFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FYWlfwwNFRAa59lnYtNMg6xM3zv1oHoF/57SD74yZ+M=;
 b=Di6/p6Xs/G1V6yIe2jb5pHr3YetkEOsvveyxhNp//D8l0yqik/9Yg9/B6oukfI09zB
 r0C86RFe5gcDraxMVt0NdCUkSO+tfSVWyJWEG4wx2roMN0a7yZaV5Pjvjs9zR2yltG4P
 OKLrqPc9EA88jYd9ASaz1Q8gfGZGbtrlTuocOvcUpk52bawDVeYc/XnsaolTVaJ49cKe
 m3UcelVJ5zLqeYioRkPH3KzX4i8NeQjjvJauYLjn9LrJcAh6QRRCyfFDzC7UrI4H5tAH
 KxsyldbC7uVNsF8/5FBk0j+LdUNMZAkEwzk/bQpOpQsspOquM+2gIHz546Pcp193cjQV
 O5sw==
X-Gm-Message-State: AOAM532DI/kSc7OpqEgPhnvGce/NMCLEf4Qw5vf5X87aqunplRwPwIie
 hHf2b9+gHhOHLuQQi7pwDabEvNKxa0o=
X-Google-Smtp-Source: ABdhPJyNHbXkd2OqYGRmKKAMTky7rAsdvsFp2J+Q+ROlU4K4T2/WFiitcjd2UPm0naLqm2snkscjDQ==
X-Received: by 2002:a17:903:18e:b029:127:a5ba:7243 with SMTP id
 z14-20020a170903018eb0290127a5ba7243mr25230471plg.4.1625005208405; 
 Tue, 29 Jun 2021 15:20:08 -0700 (PDT)
Received: from bobo.ibm.com (220-244-87-52.tpgi.com.au. [220.244.87.52])
 by smtp.gmail.com with ESMTPSA id l7sm19316583pgb.19.2021.06.29.15.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 15:20:08 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/9] powerpc/64e: fix CONFIG_RELOCATABLE build
Date: Wed, 30 Jun 2021 08:19:50 +1000
Message-Id: <20210629221957.1947577-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210629221957.1947577-1-npiggin@gmail.com>
References: <20210629221957.1947577-1-npiggin@gmail.com>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 24d33ac5b8ff ("powerpc/64s: Make prom_init require RELOCATABLE")
also made my 64e config require RELOCATABLE, which results in compile
failures.

Whether or not that's the right thing to do for prom_init for 64e, this
fixes CONFIG_RELOCATABLE=y compile errors. That commit is marked as
being fixed, but only because that's what caused the compile error to
show up for a given config.

This passes basic qemu testing.

Fixes: 24d33ac5b8ff ("powerpc/64s: Make prom_init require RELOCATABLE")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64e.S | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 22fcd95dd8dc..d634bfceed2c 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -912,8 +912,14 @@ kernel_dbg_exc:
 	b	interrupt_return
 
 .macro SEARCH_RESTART_TABLE
+#ifdef CONFIG_RELOCATABLE
+	ld	r11,PACATOC(r13)
+	ld	r14,__start___restart_table@got(r11)
+	ld	r15,__stop___restart_table@got(r11)
+#else
 	LOAD_REG_IMMEDIATE_SYM(r14, r11, __start___restart_table)
 	LOAD_REG_IMMEDIATE_SYM(r15, r11, __stop___restart_table)
+#endif
 300:
 	cmpd	r14,r15
 	beq	302f
@@ -1329,7 +1335,12 @@ a2_tlbinit_code_start:
 a2_tlbinit_after_linear_map:
 
 	/* Now we branch the new virtual address mapped by this entry */
+#ifdef CONFIG_RELOCATABLE
+	ld	r5,PACATOC(r13)
+	ld	r3,1f@got(r5)
+#else
 	LOAD_REG_IMMEDIATE_SYM(r3, r5, 1f)
+#endif
 	mtctr	r3
 	bctr
 
-- 
2.23.0

