Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7146145DA88
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 13:57:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0HwK2WxVz3ddt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 23:57:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HkuAnV15;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HkuAnV15; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Hml2LMGz3bjJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 23:51:03 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id 28so5156389pgq.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 04:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XuRZuXMp4TxqU1SsXIYoSuXCGrcjNgo7TLmZp/yqIWg=;
 b=HkuAnV15+1Ya2bPpB7ILfcWOGmfiEcBgvtuY4K0kAv+krNwwFg+h2XxWm7TsDj0oos
 eXvnjQga5j7E+e74UMyKB8pgjemh8U6ZoNNMNIl7GTmLjUtmpcDAQ3lAiNGGMp1jdOrm
 HTgRxP43mreFVJQqzMADKtfrl1RuPRw/DGHCDHlOu3vkYK78cqoKr21ljI3N0ii5lm9e
 RnTjvyZNX8xEFbrnLlB59WljPF/OPTpiXI/yN0Ay2ATorlhKX48k4sPza/lvX/Rr8xjB
 WbNDJ14zyQnE5XNiatS2EnpIgcC389Ke+vARVwE/m/75pNp/aXTQbFm9gASLeAVu76D0
 TsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XuRZuXMp4TxqU1SsXIYoSuXCGrcjNgo7TLmZp/yqIWg=;
 b=EY8AeA8Ykzw40/Tzn9gHDVYkvyl3g/le9no6BEdgsGDEgGqhTkZ+Qp65kmZ4sPKjik
 RSi7MqlfTEIAhtL4Vhklid7zJewtqGTaQtHeOnwBtKiuD+YoFZAlbtOLdCvlV6qGdq4N
 OdlrqSd/st4TMJqlSly2zKX0MLuAHXpHIYO2+q8ZEyc1ympaux26ICEmxqgNE5naqn3d
 V+XrWGqa34jY7D5Kd/y5ieKPUN1fuu/cZ5GKczDq3qfNhmsxWk71El6vYnVAri6co4Au
 BhkNNHkvrf7tAvESgS+GiAGJiC9/LreMLUgqZK4SdgtP5LCCUg7Uj4hr2bGAuqHUFlVM
 kqcw==
X-Gm-Message-State: AOAM530TS1pbHT+rbWh3Ed/mj0vWpva3sm7amSbqegSF7W1W5h/v9f19
 BKuyo07fNQ9fNPQUWkMVt114Jm9qOt8=
X-Google-Smtp-Source: ABdhPJzMLo7NtMRNze/HNez+qIBpTYd5axFf/9ODvxnDsidYGkenphZBhVNM4YJeEBxUJLD3e/nSFg==
X-Received: by 2002:aa7:86c6:0:b0:4a4:ac66:99fc with SMTP id
 h6-20020aa786c6000000b004a4ac6699fcmr13502978pfo.83.1637844661099; 
 Thu, 25 Nov 2021 04:51:01 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id gc22sm7242851pjb.57.2021.11.25.04.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 04:51:00 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 10/17] powerpc/64s: Rename hash_hugetlbpage.c to
 hugetlbpage.c
Date: Thu, 25 Nov 2021 22:50:18 +1000
Message-Id: <20211125125025.1472060-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211125125025.1472060-1-npiggin@gmail.com>
References: <20211125125025.1472060-1-npiggin@gmail.com>
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

