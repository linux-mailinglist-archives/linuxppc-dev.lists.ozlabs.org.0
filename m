Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B77372AC1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 10:55:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tq1d6Vm8zDqLS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 18:55:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gutmkJci"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tprT3xQ8zDqM0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 18:47:37 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id x15so10521813pgg.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 01:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NsmW12Fmq8hNgptqCPadGxkBE6wheyoqQdCYhpttBkA=;
 b=gutmkJcirNHc/1KUzEDuJL84/YT39nwvd26Z/zet8TbVK5Qeflszgx0VS1KtH72sp8
 So8a54+lrfD8Wjoy7naXWFeCQkD9NcLfKIaQfqXZ3xPLqJsAyRVcizBrDyffcRzKKK0B
 vOrHhVeZS5hDk7IW8usGOtY6XLA2LFpBym99Tgqv9LObNZM5jKHFPimvGT5n7kEPx61D
 3/T46i+c67i1iVNXdi8TV+PlW2vDYaprIiITS5uKrrgCnuvF7rOECvvAunKwomcubk5n
 LpsLatPhQmt0VAFL0eWekEbcMFEHguGwlpOyXds+FBMc6FAOIBSK/pZPiPT0oTwFdjY+
 B77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NsmW12Fmq8hNgptqCPadGxkBE6wheyoqQdCYhpttBkA=;
 b=VCRbYQfs4/Dnck/YvWhg4HoR4Ek8No9zq5e2lb+WU3Gfkgr7OSn9QisGlVJ6m9fSJo
 iEg6eB75dQTiiAAjYE9vILgivXOn7fpHfO6wWToRqtz6lZQIauVIN6jMybIv7NW6msTs
 HqU94JXVB+fvqH44fNDTQkPx0miE+IaQUCU2kZS0APbLc1zc84LY2QlnzU3JR+Qe8PiN
 HARnNdh9W7hkZwj+8JRZXKOw89vGd1doyaV06dRjDzNYT67GrQEFzbCa/bLInpndFJpY
 PTuQisYrhEKIyS17mmTtHVp4t7JZ8RJV4ogIXJCuWHiLPtb3AgJe9+Ej9Pkz6bsRmZE/
 1tmA==
X-Gm-Message-State: APjAAAU1Rlwks5b/275D8Ieb/ws9hLQTh8nU9rRHw8KcADud2LCMp3yv
 dkuF8xduFE7jtFlaucQOYT+QKvbP
X-Google-Smtp-Source: APXvYqyytfNlpv7NZYR/kBzAw5PZXiB2X+nSGus2kjDiG0ulwLQhOOJuNydMx7cDG6v4Z7OGcuWfkA==
X-Received: by 2002:a62:4e86:: with SMTP id c128mr10160644pfb.64.1563958054089; 
 Wed, 24 Jul 2019 01:47:34 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([220.240.251.33])
 by smtp.gmail.com with ESMTPSA id a3sm54286745pje.3.2019.07.24.01.47.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 01:47:33 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/5] powerpc/64: Add VIRTUAL_BUG_ON checks for __va and __pa
 addresses
Date: Wed, 24 Jul 2019 18:46:37 +1000
Message-Id: <20190724084638.24982-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190724084638.24982-1-npiggin@gmail.com>
References: <20190724084638.24982-1-npiggin@gmail.com>
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Reza Arbab <arbab@linux.vnet.ibm.com>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ensure __va is given a physical address below PAGE_OFFSET, and __pa is
given a virtual address above PAGE_OFFSET.

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
2.22.0

