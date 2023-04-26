Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B6B6EEDE8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 08:00:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5pBT1pMVz3cMj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 16:00:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=QPFVYq0D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=QPFVYq0D;
	dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5p8h2wZ1z3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 15:59:00 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-63b67a26069so8666964b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 22:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682488738; x=1685080738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLtGq6eHOAM3DTVIPx6oJc5txbYmlmt0PPopdt1OT7Y=;
        b=QPFVYq0DON6qSyY2pdAMxQz5T6anCV285ukvPmLVhUMh1f9aILmgrNVu7XSVb+mIqq
         BYq31rZcOVENaqxmRzVZBxA0uU07tl/4Rx6z47JXEIKALSk7xEAIJgaJ9UtYw7RRmAV1
         SnZT5wB4CCfdfZXAAg+CKC8iU6mXe2BRPCnjJxOftk6cSB2J03Jv60HSx8tN8aXXaKaY
         F8+GBssrp1GSwKtehyk1WmzoBDIwfXjGE/w5OFOrkWWE/QT/+0rP9mHBPauZE1tiZpUU
         QvUsZsxd333qBQRaaPpY8kdVFpDwF+gHU5wnMr0kZgTllAcQ4CiR7OYSUtiouEBKcwD9
         xUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682488738; x=1685080738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WLtGq6eHOAM3DTVIPx6oJc5txbYmlmt0PPopdt1OT7Y=;
        b=dAhC/3FRNeDwDZGvxqNrYflSwtX75xdFrocHY4xMbd8ttMm9hqrntE87uYxGV6qYhC
         8lDYtLJrj1xiKFgaQML0P+7s3bv/BTaaQtTYCwJwHbaS64bHTLN+J1urR8v2ez/VhrqY
         /3DM9hiiFhC9NygCO91m7pHRWAQT5zqPN6sr2oIkUKCtB6tumZwEbzydXCrr8oZdZAzN
         gVvKuaAhi0q0GlIrifJ/Ll98oKJttwsx6/7TbyXG/xUklRhByMvdpEujbMivboetj2I0
         x2wsBHLRbJcwC9GZrEKXgKVAKRHOfLCo+mhBl/ySTDZZYomuOypo9bDZztmITlKnlp9D
         fOyQ==
X-Gm-Message-State: AAQBX9dAYEv19fHap9hnFr1yBqCpRBDzIVkZGn9eabVBh9NGiAl3sOeR
	EZ5Bli5yilFpfwTgaukrQMJ/ScxdIvRxLQ==
X-Google-Smtp-Source: AKy350Yq4iAGbjwcurKUmO1g1n/wx+i3li+ZxwH9UqjP0pzKJOkhPbvod3TXiTFcLKlYYNUNa/vCNQ==
X-Received: by 2002:a05:6a00:cd3:b0:627:f1f1:a97d with SMTP id b19-20020a056a000cd300b00627f1f1a97dmr27307537pfv.24.1682488737867;
        Tue, 25 Apr 2023 22:58:57 -0700 (PDT)
Received: from wheely.local0.net ([203.221.203.54])
        by smtp.gmail.com with ESMTPSA id f25-20020aa782d9000000b0063a1e7d7439sm10300479pfn.69.2023.04.25.22.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 22:58:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/9] powerpc: Fix merge conflict between pcrel and copy_thread changes
Date: Wed, 26 Apr 2023 15:58:38 +1000
Message-Id: <20230426055848.402993-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426055848.402993-1-npiggin@gmail.com>
References: <20230426055848.402993-1-npiggin@gmail.com>
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

Fix a conflict between commit 4e991e3c16a35 ("powerpc: add CFUNC
assembly label annotation") and commit b504b6aade040 ("powerpc:
differentiate kthread from user kernel thread start").

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt_64.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 6730d676284c..bd863702d812 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -756,7 +756,7 @@ _GLOBAL(ret_from_kernel_user_thread)
 	b	.Lsyscall_exit
 
 _GLOBAL(start_kernel_thread)
-	bl	schedule_tail
+	bl	CFUNC(schedule_tail)
 	mtctr	r14
 	mr	r3,r15
 #ifdef CONFIG_PPC64_ELF_ABI_V2
-- 
2.40.0

