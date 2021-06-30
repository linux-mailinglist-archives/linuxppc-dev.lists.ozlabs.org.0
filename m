Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF493B7E51
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 09:47:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFD2g6zDGz3bjq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 17:47:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=vXIhR1yz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vXIhR1yz; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFD1m0155z2yNl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 17:46:35 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so3709535pjs.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 00:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F1a1E2BCCn6DZc4l3whIjyHJtZlrVViqU9sbIz1bIWE=;
 b=vXIhR1yzEwET320jNvXjKO4q64tx4Gj+HrC4ZaQnWeImETaPyiYNaJZ4PD1mQEklp6
 QsYxrgIFc7ZKGa4t8am/lr7BSZ5UHne70+4EEKJ/DA4nlDHOe57oMS04WA6XcOE81eYZ
 ct8hBz08uGSr/4dkXgCNrn1VxTBlf81O8EnZ69wmynxEZk+PiigskT0cy7V2b4jjlXcZ
 U4rBLfsjwb7Xy/wPpQZz1EmbrVezOSY6u2IixsrGlRCRtVXeLwbe2i1zbOsa+Uz06bCX
 HPD27dTPrgxmOvf42weiwPAjj0Bs1oybsGiSQneqaMqN6RMaf7xe6O3UWqkNIYh0lmap
 /RNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F1a1E2BCCn6DZc4l3whIjyHJtZlrVViqU9sbIz1bIWE=;
 b=fRczpFvOM017/xrmh6IDwrVqe+hN4TTtf5Ts9O64UNjCYLd278+9cYgUo+P2YR+7Rb
 PJLWPUTwkp44L40tI1jYpQOQtL0FuC5WW2eEeNGCik4cmwUphKEhbDsgmpahYrBCOU68
 8pJWIyupG/pm2n2JERg8ik1yTVjr6lfFL/4E2mj9p/bgzo9kSC9tuLwcbgLhQDNfBcCa
 hSD4JXMdVCqiXkqjjL5WesoDX0oq89eobKM2yUbwKI8F+hBvJPPcC8LXXGLDWS3bB/jW
 QDwBtFLAvwU2S5uG6iwf2lDMvS3JQlJjT6kSGSHY+jMwYrHxfgFlO7t2qxbvsKzUzGIF
 1/4A==
X-Gm-Message-State: AOAM531I81KJCw6MqMJvrza+1bTcMdv7wBevDc1A973FVXMKhDF3f2hh
 4WC8xm/PaKt4RBxYOaVxuMaKPt2AMHA=
X-Google-Smtp-Source: ABdhPJy69Ir4H/ByllDR+uAmmoGz+J1O4btQei57q0I0zpn+OWWWUuiVsv6Tn+jeUX3zxfYDwCImuQ==
X-Received: by 2002:a17:90a:d590:: with SMTP id
 v16mr37885542pju.205.1625039192943; 
 Wed, 30 Jun 2021 00:46:32 -0700 (PDT)
Received: from bobo.ibm.com (220-244-87-52.tpgi.com.au. [220.244.87.52])
 by smtp.gmail.com with ESMTPSA id g4sm20503369pfu.134.2021.06.30.00.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 00:46:32 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/9] powerpc/64e: fix CONFIG_RELOCATABLE build warnings
Date: Wed, 30 Jun 2021 17:46:14 +1000
Message-Id: <20210630074621.2109197-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210630074621.2109197-1-npiggin@gmail.com>
References: <20210630074621.2109197-1-npiggin@gmail.com>
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

CONFIG_RELOCATABLE=y causes build warnings from unresolved relocations.
Fix these by using TOC addressing for these cases.

Commit 24d33ac5b8ff ("powerpc/64s: Make prom_init require RELOCATABLE")
caused some 64e configs to select RELOCATABLE resulting in these
warnings, but the underlying issue was already there.

This passes basic qemu testing.

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

