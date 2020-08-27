Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8E6254903
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 17:19:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bcmbl395BzDqLK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 01:19:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+811462fdb5f870f212f0+6213+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=qqzFGQBK; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcmBS35SHzDqdg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 01:00:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=dyzNrnbeRWDBy321zJA1JkTbM9HGH7MmVKIH+miEUVA=; b=qqzFGQBKp4rz3CojCaU6LVmeg/
 wy22QbDo3yrLseAyIZRfKajDAvgWpAmCyobfFJ98XfvNlwTwpLPBBhvVMxCvExW6QZHxzGmEPlYfv
 BDzZbXRQ/Q/mUowEfX40dLVlBockSCtJAg0jj2ua1GnJLk/A07DsBvlboc1NBxzhuGDQMnDAb0LGL
 2u3k0lxMJZcQjqcgc6JIDrCmU0l2UVWkSi6jXuaUiniQgqRmmyjseS8B9AeXw9DnJ/my/M/xjpuno
 WuwU1p7oNZkbAUz6/EsyiB4Zuu1stA+r0ytzDQyaJXNjmT7XHwL46DiKldYh9h/kRvHZSKjcPj9cg
 TmnHkMXg==;
Received: from [2001:4bb8:18c:45ba:9892:9e86:5202:32f0] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBJOJ-000451-0R; Thu, 27 Aug 2020 15:00:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org
Subject: [PATCH 05/10] lkdtm: disable set_fs-based tests for !CONFIG_SET_FS
Date: Thu, 27 Aug 2020 17:00:25 +0200
Message-Id: <20200827150030.282762-6-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827150030.282762-1-hch@lst.de>
References: <20200827150030.282762-1-hch@lst.de>
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

Once we can't manipulate the address limit, we also can't test what
happens when the manipulation is abused.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/misc/lkdtm/bugs.c     | 4 ++++
 drivers/misc/lkdtm/usercopy.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
index 4dfbfd51bdf774..0d5b93694a0183 100644
--- a/drivers/misc/lkdtm/bugs.c
+++ b/drivers/misc/lkdtm/bugs.c
@@ -315,11 +315,15 @@ void lkdtm_CORRUPT_LIST_DEL(void)
 /* Test if unbalanced set_fs(KERNEL_DS)/set_fs(USER_DS) check exists. */
 void lkdtm_CORRUPT_USER_DS(void)
 {
+#ifdef CONFIG_SET_FS
 	pr_info("setting bad task size limit\n");
 	set_fs(KERNEL_DS);
 
 	/* Make sure we do not keep running with a KERNEL_DS! */
 	force_sig(SIGKILL);
+#else
+	pr_err("XFAIL: this requires set_fs()\n");
+#endif
 }
 
 /* Test that VMAP_STACK is actually allocating with a leading guard page */
diff --git a/drivers/misc/lkdtm/usercopy.c b/drivers/misc/lkdtm/usercopy.c
index b833367a45d053..04d10063835241 100644
--- a/drivers/misc/lkdtm/usercopy.c
+++ b/drivers/misc/lkdtm/usercopy.c
@@ -327,6 +327,7 @@ void lkdtm_USERCOPY_KERNEL(void)
 
 void lkdtm_USERCOPY_KERNEL_DS(void)
 {
+#ifdef CONFIG_SET_FS
 	char __user *user_ptr =
 		(char __user *)(0xFUL << (sizeof(unsigned long) * 8 - 4));
 	mm_segment_t old_fs = get_fs();
@@ -338,6 +339,9 @@ void lkdtm_USERCOPY_KERNEL_DS(void)
 	if (copy_to_user(user_ptr, buf, sizeof(buf)) == 0)
 		pr_err("copy_to_user() to noncanonical address succeeded!?\n");
 	set_fs(old_fs);
+#else
+	pr_err("XFAIL: this requires set_fs()\n");
+#endif
 }
 
 void __init lkdtm_usercopy_init(void)
-- 
2.28.0

