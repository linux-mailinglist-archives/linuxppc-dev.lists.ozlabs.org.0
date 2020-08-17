Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDA7245E5F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 09:50:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVR6S1K10zDqQx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 17:50:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+1cabf852a0fb828109f5+6203+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=DRbSf1xd; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVQjs0t11zDqMG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 17:32:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=kbVpg/Cl7hMfUpOgrf+/Vgol2i5kqu+MYLE479vmK28=; b=DRbSf1xdtM0Veg0yrNRpLZXRjf
 q1WKVkrp3BJUpkB5kIhmQHz8q3FUV4DkBN8Bhd9c8EQ39b7lazN0kSQNsXRZ7fek8lKmaiw9R/s6u
 +BJfkllHYNyp7/lAJsZ1E0sSklSUEBXdy+uK0bGT9BfOWwtDZsBG0qXjw8ibhyq9HyigEXAmuOwWv
 LRycTnwzhscQ2ZHZOiZ3r9A1VxorQ+ObkBQ7Ri+QNRIJ9OqXobvG6vDtibaUpmBthcfYuZpeQ0J4h
 lqELAh9ElaLekMU1L72SC6fsd3gT40ZLwJxZb5HRzrUr3lplbGivjU5XL+NKeEH/nAoygyPCdvk7s
 WxdH8Geg==;
Received: from [2001:4bb8:188:3918:4550:cdf7:3d45:afb9] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7Zd4-0000wg-E8; Mon, 17 Aug 2020 07:32:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org
Subject: [PATCH 08/11] x86: make TASK_SIZE_MAX usable from assembly code
Date: Mon, 17 Aug 2020 09:32:09 +0200
Message-Id: <20200817073212.830069-9-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817073212.830069-1-hch@lst.de>
References: <20200817073212.830069-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For 64-bit the only hing missing was a strategic _AC, and for 32-bit we
need to use __PAGE_OFFSET instead of PAGE_OFFSET in the TASK_SIZE
definition to escape the explicit unsigned long cast.  This just works
because __PAGE_OFFSET is defined using _AC itself and thus never needs
the cast anyway.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/x86/include/asm/page_32_types.h | 4 ++--
 arch/x86/include/asm/page_64_types.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/page_32_types.h b/arch/x86/include/asm/page_32_types.h
index 26236925fb2c36..f462895a33e452 100644
--- a/arch/x86/include/asm/page_32_types.h
+++ b/arch/x86/include/asm/page_32_types.h
@@ -44,8 +44,8 @@
 /*
  * User space process size: 3GB (default).
  */
-#define IA32_PAGE_OFFSET	PAGE_OFFSET
-#define TASK_SIZE		PAGE_OFFSET
+#define IA32_PAGE_OFFSET	__PAGE_OFFSET
+#define TASK_SIZE		__PAGE_OFFSET
 #define TASK_SIZE_LOW		TASK_SIZE
 #define TASK_SIZE_MAX		TASK_SIZE
 #define DEFAULT_MAP_WINDOW	TASK_SIZE
diff --git a/arch/x86/include/asm/page_64_types.h b/arch/x86/include/asm/page_64_types.h
index 996595c9897e0a..838515daf87b36 100644
--- a/arch/x86/include/asm/page_64_types.h
+++ b/arch/x86/include/asm/page_64_types.h
@@ -76,7 +76,7 @@
  *
  * With page table isolation enabled, we map the LDT in ... [stay tuned]
  */
-#define TASK_SIZE_MAX	((1UL << __VIRTUAL_MASK_SHIFT) - PAGE_SIZE)
+#define TASK_SIZE_MAX	((_AC(1,UL) << __VIRTUAL_MASK_SHIFT) - PAGE_SIZE)
 
 #define DEFAULT_MAP_WINDOW	((1UL << 47) - PAGE_SIZE)
 
-- 
2.28.0

