Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BE5707FD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 19:57:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45sq7P6cjtzDqVn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2019 03:57:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="l74Ga2UN"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45spwK4JyVzDqTk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 03:47:29 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id y15so17728885pfn.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 10:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7xS0c3M+AYF9dKnSJXbr9Z9WeQPtRSwknJMFizoWC90=;
 b=l74Ga2UN8F8Q/yrY5xAsIprRWmkxXAfNn/X4DwnYFxOyp1PozvuOzixIF5vXrPCfk3
 wMT4IPrKD7VIsStfNGlc5OxVg14B+mtPtkWLdyGeN36uOks0cO1CQHPaw66VIA2VNasv
 3+R599uaHPyBZofjPQTJ0zj1Om2JbP/YXyTUFbz2OVrfD3mu/m9DfL/MCQTFy4UORChe
 Y5cAjK66yZAmYTqaQ0m7Hs1lXeVQW3BrEzXStYWpO65/uCyZTxBn6KsyfPLYvG5VINFJ
 nt5iS4DecNENKw1iV6h0Q9lEkKmNQwxzapZAhnyDOydl+hV8XL6f9QSKycpy6IHzOn5D
 fwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7xS0c3M+AYF9dKnSJXbr9Z9WeQPtRSwknJMFizoWC90=;
 b=GbWe/RDtRKR2qRL6hcuglBmdFfF7HmRxohhVIkHLSr27CvmAY93khr7Of4Gb9O6ESf
 NCYiiT+AsLtPz9qZcR2COCFDVY/IRvs4/WG7WevyVAEZLsDvqiWFuXJ+paQuSX5/EKb9
 MfhXEk6ZmoE97iEdM6sFh+Y3vrSjTNtv7oMZs3BS4PxWoB5Lt4fv3XMfXgRxFQf54aaO
 9LVvFgp1fbWBs7CWz/cJiz1yylsxrpS11fK1vQlLf2dZfKR6FHHmwCIEqyb2z77eMDx6
 dwSdsQ6RkiNaBek5IUbi0wV4aAi/lhMmDnQGEC0onv3ugAN7vVKYUT+2sbIWjpPyrerq
 d1bQ==
X-Gm-Message-State: APjAAAVNxNJoeoCStL17ApqGS8D790VUFpTMyOL4u/Yt1yCz0yZ8HStK
 E7BrjSjG1e4bIGg3eoVllMcGyO+k
X-Google-Smtp-Source: APXvYqweo9oJiRNiZHFMcTx/83oiB+aspk0v/724rAEJcNrvUY5UTGh7Js9kZKkw+eMKqVHklAWKew==
X-Received: by 2002:aa7:8007:: with SMTP id j7mr1394993pfi.154.1563817647434; 
 Mon, 22 Jul 2019 10:47:27 -0700 (PDT)
Received: from bobo.local0.net (193-116-123-212.tpgi.com.au. [193.116.123.212])
 by smtp.gmail.com with ESMTPSA id z24sm69170057pfr.51.2019.07.22.10.47.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 10:47:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 4/4] powerpc/64: Add VIRTUAL_BUG_ON checks for __va and
 __pa addresses
Date: Tue, 23 Jul 2019 03:47:00 +1000
Message-Id: <20190722174700.11483-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722174700.11483-1-npiggin@gmail.com>
References: <20190722174700.11483-1-npiggin@gmail.com>
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
Cc: Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ensure __va is given an address below PAGE_OFFSET, and __pa is given
one above PAGE_OFFSET.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/page.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
index 0d52f57fca04..c8bb14ff4713 100644
--- a/arch/powerpc/include/asm/page.h
+++ b/arch/powerpc/include/asm/page.h
@@ -215,9 +215,19 @@ static inline bool pfn_valid(unsigned long pfn)
 /*
  * gcc miscompiles (unsigned long)(&static_var) - PAGE_OFFSET
  * with -mcmodel=medium, so we use & and | instead of - and + on 64-bit.
+ * This also results in better code generation.
  */
-#define __va(x) ((void *)(unsigned long)((phys_addr_t)(x) | PAGE_OFFSET))
-#define __pa(x) ((unsigned long)(x) & 0x0fffffffffffffffUL)
+#define __va(x)								\
+({									\
+	VIRTUAL_BUG_ON((unsigned long)(x) >= PAGE_OFFSET);		\
+	(void *)(unsigned long)((phys_addr_t)(x) | PAGE_OFFSET);	\
+})
+
+#define __pa(x)								\
+({									\
+	VIRTUAL_BUG_ON((unsigned long)(x) < PAGE_OFFSET);		\
+	(unsigned long)(x) & 0x0fffffffffffffffUL;			\
+})
 
 #else /* 32-bit, non book E */
 #define __va(x) ((void *)(unsigned long)((phys_addr_t)(x) + PAGE_OFFSET - MEMORY_START))
-- 
2.20.1

