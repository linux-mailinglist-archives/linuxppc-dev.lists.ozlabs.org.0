Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E1D211A79
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 05:02:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49y2vp4NZpzDqg8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 13:02:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=cPFe1UFu; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49y2kg0w9MzDqsQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 12:54:51 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id j19so5864728pgm.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jul 2020 19:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s2vaNiCstBIb+WWFV0QIyynMgzg46gv0imUofC6H27w=;
 b=cPFe1UFuVB5bSAqO8gzT0dcmEzl5dr+yPN/2vTgkw6gJ0x+9PbjI4KodzysL8Sq22w
 hUrQJeIHBpG3h8MYz3SiC41U7Ar/kzpMy7Q2lyibqJ472GyP77xLN6lU2TtbEKrg4LwQ
 aSU522rlTzkc6mfecJMBcMWQ9/2N1ry6XdjV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s2vaNiCstBIb+WWFV0QIyynMgzg46gv0imUofC6H27w=;
 b=bFfnvWu1B25fFc2uTiiqLJyZE02XzbS6Vq58apPCYpKRfgWeqXK8ZKyLUq94A/Pz9i
 lSMYFA5vtPdQAXmMLMkSdlhGXt2uZDyGSRExCkUUrtGAEQ3iFp8+WQ7EYMKYbrBTdlVX
 T+spQC2IrXquWKyGm37jLdIsDs+MQpD7L8NleAByOGHBYO3CWXA4+tf6pTXQcKA+ljJP
 yuuv6iw9RC+JkU1q4BxfOF8+j4LRX8B9GajFAhPUGkn6IPJF48KZ3FWyDsP2nBEBZWvj
 s7nk6QVz30fxQDDwS/H2uSuF5emMsjBSC+luLSZtsh3YUwlnMYdGaj0/6/1buNAdnjHW
 6MoQ==
X-Gm-Message-State: AOAM533UEPgilC/hpnH0+NWjgI4IyChwolRqznoLs4OP9ig1s8oZFDGs
 5lJnqzf9jDRR7ITP7/VBkMhHeg==
X-Google-Smtp-Source: ABdhPJyXmFA8fucYvwuXRwDdGknORYIojGHyP9C/hmb1sbVz/1EdQsOerDFGeamE2e8WgmO0U7NMKA==
X-Received: by 2002:a63:8f58:: with SMTP id r24mr21924594pgn.379.1593658488570; 
 Wed, 01 Jul 2020 19:54:48 -0700 (PDT)
Received: from localhost
 (2001-44b8-1113-6700-3c80-6152-10ca-83bc.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:3c80:6152:10ca:83bc])
 by smtp.gmail.com with ESMTPSA id c19sm6198267pjs.11.2020.07.01.19.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 19:54:48 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@c-s.fr, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: [PATCH v8 3/4] powerpc/mm/kasan: rename kasan_init_32.c to init_32.c
Date: Thu,  2 Jul 2020 12:54:31 +1000
Message-Id: <20200702025432.16912-4-dja@axtens.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702025432.16912-1-dja@axtens.net>
References: <20200702025432.16912-1-dja@axtens.net>
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kasan is already implied by the directory name, we don't need to
repeat it.

Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 arch/powerpc/mm/kasan/Makefile                       | 2 +-
 arch/powerpc/mm/kasan/{kasan_init_32.c => init_32.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename arch/powerpc/mm/kasan/{kasan_init_32.c => init_32.c} (100%)

diff --git a/arch/powerpc/mm/kasan/Makefile b/arch/powerpc/mm/kasan/Makefile
index bb1a5408b86b..42fb628a44fd 100644
--- a/arch/powerpc/mm/kasan/Makefile
+++ b/arch/powerpc/mm/kasan/Makefile
@@ -2,6 +2,6 @@
 
 KASAN_SANITIZE := n
 
-obj-$(CONFIG_PPC32)           += kasan_init_32.o
+obj-$(CONFIG_PPC32)           += init_32.o
 obj-$(CONFIG_PPC_8xx)		+= 8xx.o
 obj-$(CONFIG_PPC_BOOK3S_32)	+= book3s_32.o
diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/init_32.c
similarity index 100%
rename from arch/powerpc/mm/kasan/kasan_init_32.c
rename to arch/powerpc/mm/kasan/init_32.c
-- 
2.25.1

