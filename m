Return-Path: <linuxppc-dev+bounces-1440-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BE497C2F6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 04:57:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8KtQ35rXz2yGD;
	Thu, 19 Sep 2024 12:57:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726714622;
	cv=none; b=HIx7hYS13KhENQh2563D9uZx0XTT0x6mGjWA6buBy6PczHnFS7sqcUvoZFLfXTES86MeyYBYF2rC4OwAkgrKSes6QLAFlwKCOhIghZeTKVDHhkK04HcWathcLJLOXzwWkslCCzuiwH746ln/lzrhpSwmTWKIAwyJ3QTi9cdqx8GaR/00bVyh8IRsawMjDJ2cLva2ajS1f6SBRPJl1dsEijGPkO+BxActEHg20Tk0Ke4o8mMzj0e3QdGFDkYAty4Yny+ChlFusb8DHsBLonQGXl59jKqnhVg2AD+kIOl/jwFBeSdv6ErX54LaoVWzrUJiiBFSBcZexjqRxxlxt38iyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726714622; c=relaxed/relaxed;
	bh=oTnklaF1aF0bTWeWldi91Sj9bwNgHQZw6gVAVQdUYd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T9sMPyG2d3h4DRt5tgABw0lWGUuqJJWh4RUU9g8fFV/0whR15V9JVvhsKY/Xa7xbk82yEqxvjISIKhM756OopzFGMMS/qaB1e7uu1l8yWICEMBOGtPBlfIxUwdhmo69rOVTUFXV3VEM4PszrfIySnMkGMpb1j5x2JzpcOujMnAlFEZx4KpHRNuAQWYuKEQe+3jx6dc2s58baDt+MkqoWYq2EjbXG4PLz4DpD75cDlMFYSrvF5uxDb7JMWID/XGxyZ3P495GGxvUrlQKHAkisQHYg3cSG5zKLm5UJ/ihRgw+K95dfPc3FMOe0gFEHWPjBISDMW51GOTQY97UCRQzcYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=frYLqBt1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=frYLqBt1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8KtQ0tF1z2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 12:57:02 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2053a0bd0a6so4300385ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2024 19:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726714620; x=1727319420; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTnklaF1aF0bTWeWldi91Sj9bwNgHQZw6gVAVQdUYd0=;
        b=frYLqBt1j80xfUY+Vc8grI4k3a0aXDpOZ6vgYyW5Qj7oi9np+Yv/b1kT7GWCzjCdr3
         hCB6RhFXEPHNz6K4EVvU4bH+Ti0ujX4zz8+36F3vTClQEkRyoarnb0nZWf77ycXVYPmz
         QIubm8afTlXIp/DVZux1wku1yu6K/ccBYO9dfWRm4mOCvvUwKSwjgzEHPASBMBQ0fH+h
         h26ZJVjH6T/qsxxv3+qWBB77SxwPkHN1BzHTlzxOJ6jPuZ6hWC2vfttPF74UU+WrCzIQ
         oxXnyyQv0jOHAshWEj2l1+3/0Vx/0re+hzkQL57xmYLpXXTuoGXxe2fCQvFNWAIKO37m
         4PDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726714620; x=1727319420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTnklaF1aF0bTWeWldi91Sj9bwNgHQZw6gVAVQdUYd0=;
        b=cHh+OAUZEfmUAqYj7ZzcP46dlLfLGpoX7W1HNEoIs2i/bPRE0GGiIyErrxwuE5S7IO
         5vnsF8gBcoJlHj8yi4Q5TFHi0M/8EJAyaazF8nDUywBDsceFll4yJC8tpJHCDjVfbTn9
         SMpo3z8/0nlb3CgatFZ7K1MXJhBDllIrs5pXwN0u7r5xPzF9HcpnOhAFijBFA+kCgtEw
         tHDHV4/shcAeOng6pnVdWzWQ9mROcdekdGwHc7/qZRPHnn1/2GzCqb/vELyGBqOQGa2O
         wHkp2qaQN9gOPjVcArImU4FU01BLx4HMtm7E/bcpWNUW/Eq57L7nICmeU0Rbc3OtHSRr
         Zehg==
X-Gm-Message-State: AOJu0Yzdp8P+K9HJLgmMnsXvWio0aPI22219B2NPQnG9lr3C4smDkC/+
	/9U39w+Dgv+yuW5sQqchJ92+El+jqs5zVEQQyZJzFnA337rFaPYszxzXCQ==
X-Google-Smtp-Source: AGHT+IFXJApA5WgaqQlHFHHFqKDy2nOzFXTEZu7K9vwx9KzKHpaYLGI4OiWl2mQQHdfyZu/PNzppfQ==
X-Received: by 2002:a17:903:2445:b0:205:7574:3b79 with SMTP id d9443c01a7336-2076e3622b7mr412645275ad.25.1726714619622;
        Wed, 18 Sep 2024 19:56:59 -0700 (PDT)
Received: from dw-tp.. ([171.76.85.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d2823sm71389105ad.148.2024.09.18.19.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 19:56:59 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.vnet.ibm.com>,
	Pavithra Prakash <pavrampu@linux.vnet.ibm.com>,
	Nirjhar Roy <nirjhar@linux.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kasan-dev@googlegroups.com,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC v2 07/13] book3s64/hash: Refactor hash__kernel_map_pages() function
Date: Thu, 19 Sep 2024 08:26:05 +0530
Message-ID: <0ced93c215459479ae70dd9bbe00daa595f9aff0.1726571179.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726571179.git.ritesh.list@gmail.com>
References: <cover.1726571179.git.ritesh.list@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This refactors hash__kernel_map_pages() function to call
hash_debug_pagealloc_map_pages(). This will come useful when we will add
kfence support.

No functionality changes in this patch.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 030c120d1399..da9b089c8e8b 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -349,7 +349,8 @@ static inline void hash_debug_pagealloc_add_slot(phys_addr_t paddr, int slot)
 		linear_map_hash_slots[paddr >> PAGE_SHIFT] = slot | 0x80;
 }
 
-int hash__kernel_map_pages(struct page *page, int numpages, int enable)
+static int hash_debug_pagealloc_map_pages(struct page *page, int numpages,
+					  int enable)
 {
 	unsigned long flags, vaddr, lmi;
 	int i;
@@ -368,6 +369,12 @@ int hash__kernel_map_pages(struct page *page, int numpages, int enable)
 	local_irq_restore(flags);
 	return 0;
 }
+
+int hash__kernel_map_pages(struct page *page, int numpages, int enable)
+{
+	return hash_debug_pagealloc_map_pages(page, numpages, enable);
+}
+
 #else /* CONFIG_DEBUG_PAGEALLOC */
 int hash__kernel_map_pages(struct page *page, int numpages,
 					 int enable)
-- 
2.46.0


