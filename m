Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD733AE4A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 06:44:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45MgXC26L2zDqN0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 14:44:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fz34Jtvm"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45MgSM1d2fzDqD9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2019 14:41:06 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id i189so4503661pfg.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Jun 2019 21:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hJ710Nece9JdDCt+W2M5u9CutQXF450XDxzyXKmRa0k=;
 b=fz34JtvmsEEbz+uG7YHcmaePdpnvHSrr9OzG0Fob2Vn/ojNW3ILIH/7028H5WbNhf/
 ozwk2iOir1e6dQLEkGP6el5dRxrVSReFLnAqVr050NDHhkui/0LVdt5/hWGRB0Quv5ry
 MwcfC53bLQB5nw6tMMWHl5S2ClvoJ/dI4A6eJN0A4OvoGJ2OS3XhKIou0oDGf9rzwRs5
 jtggh0AqFgaHwYeCfg9cR6kagIuVfcpp+sfjWTqBHuVGTir0il8bOgANLRz3fwgf5tKL
 fn6NFsZYGYRUj/uudTy5p/8SjGhYPJ1jpLuoGku/u7LnyvT35k2ZkTlrj6CU6TrUNbP0
 qpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hJ710Nece9JdDCt+W2M5u9CutQXF450XDxzyXKmRa0k=;
 b=Q4yBX3hWk0GXPSz17xwoWlhYX51m0c33+f2OJlzSs3W7xcPeXoVc+vjEasq/Zo3WiP
 6LiaMyzrh0n+up6+TjJYGJ5wMERGJJDatIVp/vNLu2qIzSta0mvylDNTLUdp/aVBKG5j
 g3J4Zn3AYdM3UG/QxSzYpR9VBjgruqypPWEhRCWrDse/z1m2NdeT7NNLQXHfny6cU/9q
 Bw8YeC+x0hSz/VEAUmgtoJE4C00Pu/RlDXpWm1ZnlviRufvb/tWGYPAQZmsIBOslovQo
 NagEDb7YklLK4YF7prT//PqXN+gPI+JcDvosa9/b4hZvUIdpQLQGDzQb2lq3b3yWmuQY
 IS7Q==
X-Gm-Message-State: APjAAAVvjOcnhVnfGEmrgMHei/V5SHxORENj6WDNTMFgfCcfqg2baYEY
 V2FEbIVa4EpHuqNL0oIqc6Y=
X-Google-Smtp-Source: APXvYqz9ZBs8sn3RctkWOS+ZWyR8ZuOTeqNvx84zu+AkZf7kx8BtX4P+3MbV3oNpSvArhcN856sjFA==
X-Received: by 2002:a65:4544:: with SMTP id x4mr14322154pgr.323.1560141664470; 
 Sun, 09 Jun 2019 21:41:04 -0700 (PDT)
Received: from bobo.local0.net (60-241-56-246.tpgi.com.au. [60.241.56.246])
 by smtp.gmail.com with ESMTPSA id l1sm9166802pgj.67.2019.06.09.21.41.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 09 Jun 2019 21:41:04 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org
Subject: [PATCH 2/4] arm64: support huge vmap vmalloc
Date: Mon, 10 Jun 2019 14:38:36 +1000
Message-Id: <20190610043838.27916-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190610043838.27916-1-npiggin@gmail.com>
References: <20190610043838.27916-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Applying huge vmap to vmalloc requires vmalloc_to_page to walk huge
pages. Define pud_large and pmd_large to support this.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/arm64/include/asm/pgtable.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 2c41b04708fe..30fe7b344bf7 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -428,6 +428,7 @@ extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 				 PMD_TYPE_TABLE)
 #define pmd_sect(pmd)		((pmd_val(pmd) & PMD_TYPE_MASK) == \
 				 PMD_TYPE_SECT)
+#define pmd_large(pmd)		pmd_sect(pmd)
 
 #if defined(CONFIG_ARM64_64K_PAGES) || CONFIG_PGTABLE_LEVELS < 3
 #define pud_sect(pud)		(0)
@@ -438,6 +439,7 @@ extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 #define pud_table(pud)		((pud_val(pud) & PUD_TYPE_MASK) == \
 				 PUD_TYPE_TABLE)
 #endif
+#define pud_large(pud)		pud_sect(pud)
 
 extern pgd_t init_pg_dir[PTRS_PER_PGD];
 extern pgd_t init_pg_end[];
-- 
2.20.1

