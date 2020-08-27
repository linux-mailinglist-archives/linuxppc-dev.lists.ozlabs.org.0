Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0583D25497F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 17:32:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcmtR2kLCzDqcg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 01:31:59 +1000 (AEST)
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
 header.s=casper.20170209 header.b=ucwKvpXo; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcmBS23CyzDqdW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 01:00:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=faawAQ0ySi9KwV9Nz/HOf3bAadCUcHJmafL0aq9dK7s=; b=ucwKvpXoAl6KZXmwubbKWMkjs0
 sk3A6jhGVU/kez8e3ZPaRV7J6bvrgjtLNxVQoxZU7pGRKQIMe5UHsK/kEk6JJEE+sefvuxmafy9x6
 03OQ5i8moygKRIgk0ztsefk3460stZV9x605CD0JHLQ3VMcyB9mHp55Ph9QT7yd8fjuuuBdXuVEB4
 uEPJSdRellSjVLhBagykXpVj6Uwx55FibHqHTP35PDDh8vSLW5nE7mQjgneTZdvXPMjjNsnLa2GXY
 6yQLlqVkcXyHq36zAukKbwaZDGQWGV5xNM1VhDO/Na0guH0rTcggXKncUiZb1bIys2F4SkQyqXSNz
 jRmfosSg==;
Received: from [2001:4bb8:18c:45ba:9892:9e86:5202:32f0] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBJOG-00044n-Pw; Thu, 27 Aug 2020 15:00:37 +0000
From: Christoph Hellwig <hch@lst.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org
Subject: [PATCH 04/10] test_bitmap: skip user bitmap tests for !CONFIG_SET_FS
Date: Thu, 27 Aug 2020 17:00:24 +0200
Message-Id: <20200827150030.282762-5-hch@lst.de>
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

We can't run the tests for userspace bitmap parsing if set_fs() doesn't
exist.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 lib/test_bitmap.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
index df903c53952bb9..49b1d25fbaf546 100644
--- a/lib/test_bitmap.c
+++ b/lib/test_bitmap.c
@@ -365,6 +365,7 @@ static void __init __test_bitmap_parselist(int is_user)
 	for (i = 0; i < ARRAY_SIZE(parselist_tests); i++) {
 #define ptest parselist_tests[i]
 
+#ifdef CONFIG_SET_FS
 		if (is_user) {
 			mm_segment_t orig_fs = get_fs();
 			size_t len = strlen(ptest.in);
@@ -375,7 +376,9 @@ static void __init __test_bitmap_parselist(int is_user)
 						    bmap, ptest.nbits);
 			time = ktime_get() - time;
 			set_fs(orig_fs);
-		} else {
+		} else
+#endif /* CONFIG_SET_FS */
+		{
 			time = ktime_get();
 			err = bitmap_parselist(ptest.in, bmap, ptest.nbits);
 			time = ktime_get() - time;
@@ -454,6 +457,7 @@ static void __init __test_bitmap_parse(int is_user)
 	for (i = 0; i < ARRAY_SIZE(parse_tests); i++) {
 		struct test_bitmap_parselist test = parse_tests[i];
 
+#ifdef CONFIG_SET_FS
 		if (is_user) {
 			size_t len = strlen(test.in);
 			mm_segment_t orig_fs = get_fs();
@@ -464,7 +468,9 @@ static void __init __test_bitmap_parse(int is_user)
 						bmap, test.nbits);
 			time = ktime_get() - time;
 			set_fs(orig_fs);
-		} else {
+		} else
+#endif /* CONFIG_SET_FS */
+		{
 			size_t len = test.flags & NO_LEN ?
 				UINT_MAX : strlen(test.in);
 			time = ktime_get();
-- 
2.28.0

