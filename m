Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 765293B5A10
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 09:50:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GD0CG3Bqgz3bgs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 17:50:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=CRlAG7oT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CRlAG7oT; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GD0BJ5Nclz303t
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 17:49:44 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id w15so10211699pgk.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 00:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FYWlfwwNFRAa59lnYtNMg6xM3zv1oHoF/57SD74yZ+M=;
 b=CRlAG7oTpgQ99P/nlpLcEkeS3pEHW3/ErLoLo+pJZf+QHPjskJJT+8l/MZ2oIBrY7Z
 4vJ+GaUplyvuYuJ7occ+J02sg8GzhC741phvPwkZmke420rmq2YUurFtD67xxkY+6SQq
 C561OnSm4nBi8lnimhpBKeaRlHJsrkPq9YaGJXE/c6xC8zYHeLS5p7sVu5n0gimJQVOf
 jhlc8XXhfsPbC5JUpSe95kIdnEHMbn8IMS5FvgLkJmOwZfEQN7WuToL8y4yDqSnCTt0u
 V8fnftoa8TI2/bA0wkOxOqmScctmb+bhJmjye/jXhVNu3dwXwzsuj8UyI7xGq6IuBufZ
 VqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FYWlfwwNFRAa59lnYtNMg6xM3zv1oHoF/57SD74yZ+M=;
 b=UVZk8+XX+anm6V+XDDuGg6SXXqI6yrxAImfAG/X3zpXGienDokVnfjn3bhFECVuxGc
 7kPAGSCQPW3FSt002jCrG8cVVNApsQgg/vYnhp6FlkjnM4X+qRurzIb+XgNpypjP2hI7
 L/r+1gczRWVLMMLUosGlJ/jeILo+52Gn+mtuhPz7dPOf+s1zMVd3EduXWKnm6xouDcI9
 eb/kw4p0dYhButrQhcLmFzdikgBiuhhFn/+kClMm6l3/VsVKh49NSx5hOdXKixr+Cs2Z
 QdwqfJ3RqSS6TT2UrlwV1ZDpicwSvo2UQVthg223QJgggiGVagrEDOy6+vd1RBSze+lz
 zWzQ==
X-Gm-Message-State: AOAM532Q69P9A+h7QHgyruRMIco3nlUW2uYElP+TAiq+5JzVN9XR8H5h
 p17uYWRHVq6h0upe29NhTe+MLBI6gMo=
X-Google-Smtp-Source: ABdhPJyNH29F01E+k1c/JZHJj4LOvWC4xMgZ2XRarJbonOZPkgqi5KlxrInr231QtGPOlHizzkq6Jw==
X-Received: by 2002:aa7:9638:0:b029:303:1969:2290 with SMTP id
 r24-20020aa796380000b029030319692290mr24038049pfg.81.1624866581958; 
 Mon, 28 Jun 2021 00:49:41 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id b22sm5264962pfp.20.2021.06.28.00.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 00:49:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/8] powerpc/64e: fix CONFIG_RELOCATABLE build
Date: Mon, 28 Jun 2021 17:49:25 +1000
Message-Id: <20210628074932.1499554-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210628074932.1499554-1-npiggin@gmail.com>
References: <20210628074932.1499554-1-npiggin@gmail.com>
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

