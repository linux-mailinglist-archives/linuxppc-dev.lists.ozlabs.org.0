Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E045BA5A3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 06:12:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTLJf1XR5z3fDW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 14:12:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=n/YfM7Sv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=n/YfM7Sv;
	dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTLCd2ZlFz3c6N
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 14:08:29 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id r23so10626039pgr.6
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 21:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=FzVeBl6UEwj4BGFvXAQc6ukNXP28RZr0i6SJS1709Xk=;
        b=n/YfM7Sv4h+ygDRer1ktk6/5A89oxTLmogZiwGSYhK24iFTemo1+LU4ZasacManI0E
         VhlshWpwF36cdv9hcA3PHE0JwBOS4MsmDVyHkaMIUe4+/ljevbg2FLgnZtaS3/6UvD6T
         nDsdR6HISwg7kXZvBOlfFUlIx3+xxAoHnIYKn5Xvmd30kzemObEIeC9RQ3vSCn0NyiM8
         +nav0kC3hPJjjRchGdIeV1nme3o2af7Jz2C+rDHvI41DnZyfZjEqSB9+j9XVpDl8i00t
         rkvCa7oRhqHvt6YP8TJKVuNX58mXW7eZ5jJYZ2JlOrMxsrJj24LXa7tR/ivnG+4Xzc8n
         gdqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=FzVeBl6UEwj4BGFvXAQc6ukNXP28RZr0i6SJS1709Xk=;
        b=nn+N8WF0tc3hgmfthx8ydeaDDoCDyiIKIhu0PGG+QxDQsbAuluGiuo6KDaJH4we82H
         AeoHgcgrHJYUIb6lzy8BlRdAORZJUjHEs4/d/ZJwx1Im5+ECnYwYF+OWSHRqn7r86YCY
         ODIQela5iKnzAyAdmd3+UNFwA24SOKVVr6cTfmd8INK/d2UJXZ+sqR0/HCAA2hU4vryr
         bGJJ42v/sgu2jx1rKQE1GLSTcn3vVq+1dRG/u6gxaL2pLqcSRBKXJx2p6tl0uIi6cjUS
         a4FjxhFvioo18JSjkSb9uNEXmy3Ud5jpf0J4H0Wk5yaLq2Fi7tX5Y4f1E9dlU8mNGW+J
         VZWg==
X-Gm-Message-State: ACrzQf3TSa67nxgnjDMGQ3EKepp1o0hdbyp+jOQ1hIAONwASrQ51w2lB
	/3s9wyuhBQzQrBkKMhA/ItHSe9GfrVY=
X-Google-Smtp-Source: AMsMyM5dHg4JOQq59j5GFod8A5rxeWlfZ31C8Ime7QFGzcQs5/BQLxBAsp4GRAIzZdew6oC8uXA0mQ==
X-Received: by 2002:a63:1349:0:b0:438:fa5a:b6f1 with SMTP id 9-20020a631349000000b00438fa5ab6f1mr2913581pgt.250.1663301306326;
        Thu, 15 Sep 2022 21:08:26 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-127-167.tpgi.com.au. [193.116.127.167])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0017534ffd491sm13696816plb.163.2022.09.15.21.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 21:08:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 7/7] powerpc/build: put sys_call_table in .data.rel.ro if RELOCATABLE
Date: Fri, 16 Sep 2022 14:07:55 +1000
Message-Id: <20220916040755.2398112-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220916040755.2398112-1-npiggin@gmail.com>
References: <20220916040755.2398112-1-npiggin@gmail.com>
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

Const function pointers by convention live in .data.rel.ro if they need
to be relocated. Now that .data.rel.ro is linked into the read-only
region, put them in the right section. This doesn't make much practical
difference, but it will make the C conversion of sys_call_table a
smaller change as far as linking goes.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/systbl.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/systbl.S b/arch/powerpc/kernel/systbl.S
index cb3358886203..0bec33e86f50 100644
--- a/arch/powerpc/kernel/systbl.S
+++ b/arch/powerpc/kernel/systbl.S
@@ -12,7 +12,11 @@
 
 #include <asm/ppc_asm.h>
 
+#ifdef CONFIG_RELOCATABLE
+.section .data.rel.ro,"aw"
+#else
 .section .rodata,"a"
+#endif
 
 #ifdef CONFIG_PPC64
 	.p2align	3
-- 
2.37.2

