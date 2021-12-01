Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0711465064
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 15:49:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J426H3YNnz3f4V
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 01:49:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OLL0nSrV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=OLL0nSrV; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J41yb3jLBz3bhh
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 01:42:31 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id x7so18215636pjn.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Dec 2021 06:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XuRZuXMp4TxqU1SsXIYoSuXCGrcjNgo7TLmZp/yqIWg=;
 b=OLL0nSrVSt4aQw2tq9EXU1K1yRBpnDcbXxOZSkWFboWp2wE9HcBfL5GooEabw2ZHpe
 +Ji7OUEA3XviH5/4wxYQu9qLmkQiN91dsbfXQtvMLAStZjXq5hAncb8oXKygrcaxTxbM
 /THJAzlBWUm2W7QeoDxzRaaBTmi5GVgJcmQJVwAGYHMHmItVmFLnqyKldL72pezoD9Le
 4nLCuWgTCbaD+UiCZUwYh2oikkeHq04BfFj6d2mj3XYw/nyAVtMikfttJj2Iq4BnrK1X
 uDWXf2UcSwfVKDQ54pbjcmTPZoQ4Z9GJm15r4SPIYiyddk4N5zD1C2eZmzCqqB/dJSHB
 vG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XuRZuXMp4TxqU1SsXIYoSuXCGrcjNgo7TLmZp/yqIWg=;
 b=wK/P6/KLYB0pfTbS6mT8mhH6YcQuI2lzRbxgHo4VBDccRZNLtaVso2muerr/P/oEO8
 M/OYwNx6phdw4aNPfwZS3BCujsWSjkiyrbjfjQ8ICg/kTXELItx7qk6odtkN9tj+kc5f
 +Mq+93V7wlqF6dHyCA7elsF3YCeEDxFwm3KxBsUncnQArZ6atRvOwt/G1Z4PrGnOAzdS
 PWkKp6zhehed1Zcl/wtQvLNGInvo6WAzq9UHLas+r/8YO4OOBIljNVFgM8M48B8eHIR6
 9iO51VJmrW+eDUC5a0a290NUR2hr5ly9CZOq692RIjUaNgjiVkxljo43LIiMAUZHugFH
 xwfA==
X-Gm-Message-State: AOAM532E066JJYfPopdnIQ5SSKzgJU3zpe0zHUqrWGwvhsXYoNS4X/l6
 vAeluEmA9VM5bY8WwVdTaI6Irb0gciA=
X-Google-Smtp-Source: ABdhPJxt91rN8GP3bsswgGPjUYsRMG0r+PPQ+XbJXYeXbvbdClQoUoKh0x8XEBM9BVkFy22C4QUSuw==
X-Received: by 2002:a17:90a:ca11:: with SMTP id
 x17mr7988011pjt.61.1638369748645; 
 Wed, 01 Dec 2021 06:42:28 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id e13sm29230pgb.8.2021.12.01.06.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 06:42:28 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 10/18] powerpc/64s: Rename hash_hugetlbpage.c to
 hugetlbpage.c
Date: Thu,  2 Dec 2021 00:41:45 +1000
Message-Id: <20211201144153.2456614-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211201144153.2456614-1-npiggin@gmail.com>
References: <20211201144153.2456614-1-npiggin@gmail.com>
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

This file contains functions and data common to radix, so rename it to
remove the hash_ prefix.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/Makefile                              | 2 +-
 arch/powerpc/mm/book3s64/{hash_hugetlbpage.c => hugetlbpage.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename arch/powerpc/mm/book3s64/{hash_hugetlbpage.c => hugetlbpage.c} (100%)

diff --git a/arch/powerpc/mm/book3s64/Makefile b/arch/powerpc/mm/book3s64/Makefile
index 1579e18e098d..501efadb287f 100644
--- a/arch/powerpc/mm/book3s64/Makefile
+++ b/arch/powerpc/mm/book3s64/Makefile
@@ -10,7 +10,7 @@ obj-$(CONFIG_PPC_HASH_MMU_NATIVE)	+= hash_native.o
 obj-$(CONFIG_PPC_RADIX_MMU)	+= radix_pgtable.o radix_tlb.o
 obj-$(CONFIG_PPC_4K_PAGES)	+= hash_4k.o
 obj-$(CONFIG_PPC_64K_PAGES)	+= hash_64k.o
-obj-$(CONFIG_HUGETLB_PAGE)	+= hash_hugetlbpage.o
+obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
 ifdef CONFIG_HUGETLB_PAGE
 obj-$(CONFIG_PPC_RADIX_MMU)	+= radix_hugetlbpage.o
 endif
diff --git a/arch/powerpc/mm/book3s64/hash_hugetlbpage.c b/arch/powerpc/mm/book3s64/hugetlbpage.c
similarity index 100%
rename from arch/powerpc/mm/book3s64/hash_hugetlbpage.c
rename to arch/powerpc/mm/book3s64/hugetlbpage.c
-- 
2.23.0

