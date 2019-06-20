Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F95D4C6F9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 07:58:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Trhv6WHFzDr3m
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 15:58:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vZe+wwgj"; 
 dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tqln0fFDzDqvh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:15:48 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d126so978495pfd.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L9+GSvbLewhwBQ9VwuQjJbbBDMzqhgDBjoHx4ME7YxM=;
 b=vZe+wwgjwY7TbBNAsD2EHAjaIY1yhc8gUWgRy/aE2Av2il+OGv4IpVwB69HzcjmTLv
 yCWsEXF2cEco/3RRKss9FKZNJpH2OqPOGB4Ud33o2njyGqM4QGQ0YcAgT34udZm/17oW
 +efpXvUAKdCB/kBLn+zZTNngI0/DGJuU4Fq0fd84U7nKGfONimw85un+n8sGTBTqwR7y
 WacAOjJBMcNXdgXJT5DZ1Bf0AJ1KKE2xp9CQp1XIDTTcrxKKURTDqNdlCt5sq4fd3znF
 SasiWZA7VPXLutGT3MZ5QJsupYwwpJnzOlv274wKnTENoRwwYX/HiVVSHGLvVZeS4sOj
 PVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L9+GSvbLewhwBQ9VwuQjJbbBDMzqhgDBjoHx4ME7YxM=;
 b=KeKNRvvVgHFrOxFBLmHCEIbexkyF/KbwlpHjkwc4ES4MzxolrEFt0IflS6G/MWZSWt
 M46Xyhak8Fj8heXuRWNlSqOKFSPUyitagbokZiIdblNk0WeNYvwktkCt5Q/OIIZ7wwav
 G15gNKgv+xQfR9XNNGEc69xs2sBy8bqU/oCVNL0IZLKKQnXvGlrY2R/HxKzquGB7VZ+l
 VgwYg/h289BKS4NwxxbgxQb9eDLOdCdoebZvsL1IuSGks0JCpifC01GsF8+lRXQpljq5
 XWG9l0xtdXzZwtH+7EwKyQUN4+30ChuC68oKiMKxiH+7XCq8lsSidUYdLhPZrl4GQjoM
 1kkA==
X-Gm-Message-State: APjAAAWOFgUZqfoVn4TNUwCaMZJyECMX6T7bXE28mlmcStlx/dDvGAHX
 fL7ZClUZ7ZSfVmBq86y3zq2Gng6K
X-Google-Smtp-Source: APXvYqwZAtMi+n1ZrxKriwnz3g56+eex7B2/F6XSOV+rY950heMJfTIo1IseJWS76voS9w1MtMq5sA==
X-Received: by 2002:a63:eb4f:: with SMTP id b15mr11250078pgk.418.1561007744488; 
 Wed, 19 Jun 2019 22:15:44 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.15.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:15:44 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 21/52] powerpc/64s/exception: remove unused BRANCH_TO_COMMON
Date: Thu, 20 Jun 2019 15:14:28 +1000
Message-Id: <20190620051459.29573-22-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190620051459.29573-1-npiggin@gmail.com>
References: <20190620051459.29573-1-npiggin@gmail.com>
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

---
 arch/powerpc/kernel/exceptions-64s.S | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 87db0f5a67c4..f1f1278cb131 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -224,20 +224,12 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	bctr
 
 #ifdef CONFIG_RELOCATABLE
-#define BRANCH_TO_COMMON(reg, label)					\
-	__LOAD_HANDLER(reg, label);					\
-	mtctr	reg;							\
-	bctr
-
 #define BRANCH_LINK_TO_FAR(label)					\
 	__LOAD_FAR_HANDLER(r12, label);					\
 	mtctr	r12;							\
 	bctrl
 
 #else
-#define BRANCH_TO_COMMON(reg, label)					\
-	b	label
-
 #define BRANCH_LINK_TO_FAR(label)					\
 	bl	label
 #endif
-- 
2.20.1

