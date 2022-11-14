Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE6C6285F8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 17:49:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9wJx5KHCz3f4B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 03:49:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=IZwW/pXt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=srs0=7n51=3o=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=IZwW/pXt;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9wFr6ZVVz3cMH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 03:47:12 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 33B61B8107E;
	Mon, 14 Nov 2022 16:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 883ECC433C1;
	Mon, 14 Nov 2022 16:47:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="IZwW/pXt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1668444425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GUOLjwe2IeIpzWXOEF9lexW8mdcNzGTdZsyQ38BdoPo=;
	b=IZwW/pXtgQjRmiQ0PtVQPt2pepd0WzFJDYnD9391y9kx/P1IoPzFa7R23Ul6Y1I6NyMf54
	720Ds0WvTdN9pJBmGYz6ky6KfVM3twh/wLmfzS137SqlUCUm/EnhwjnExPBVNyJaC0r/yz
	hUqcqQRMMcMIQm2imAIC1tMqnYFTlUk=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 04ea1518 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 14 Nov 2022 16:47:04 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH v2 2/3] treewide: use get_random_u32_{above,below}() instead of manual loop
Date: Mon, 14 Nov 2022 17:45:57 +0100
Message-Id: <20221114164558.1180362-3-Jason@zx2c4.com>
In-Reply-To: <20221114164558.1180362-1-Jason@zx2c4.com>
References: <20221114164558.1180362-1-Jason@zx2c4.com>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, "Darrick J . Wong" <djwong@kernel.org>, netdev@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>, Jakub Kicinski <kuba@kernel.org>, linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-block@vger.kernel.org, SeongJae Park <sj@kernel.org>, loongarch@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore Ts'o <tytso@mit.edu>, linux-parisc@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org, linux-mips@
 vger.kernel.org, =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, linux-crypto@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These cases were done with this Coccinelle:

@@
expression E;
identifier I;
@@
-   do {
      ... when != I
-     I = get_random_u32();
      ... when != I
-   } while (I > E);
+   I = get_random_u32_below(E + 1);

@@
expression E;
identifier I;
@@
-   do {
      ... when != I
-     I = get_random_u32();
      ... when != I
-   } while (I >= E);
+   I = get_random_u32_below(E);

@@
expression E;
identifier I;
@@
-   do {
      ... when != I
-     I = get_random_u32();
      ... when != I
-   } while (I < E);
+   I = get_random_u32_above(E - 1);

@@
expression E;
identifier I;
@@
-   do {
      ... when != I
-     I = get_random_u32();
      ... when != I
-   } while (I <= E);
+   I = get_random_u32_above(E);

@@
identifier I;
@@
-   do {
      ... when != I
-     I = get_random_u32();
      ... when != I
-   } while (!I);
+   I = get_random_u32_above(0);

@@
identifier I;
@@
-   do {
      ... when != I
-     I = get_random_u32();
      ... when != I
-   } while (I == 0);
+   I = get_random_u32_above(0);

@@
expression E;
@@
- E + 1 + get_random_u32_below(U32_MAX - E)
+ get_random_u32_above(E)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 fs/ext4/mmp.c            | 8 +-------
 lib/test_fprobe.c        | 5 +----
 lib/test_kprobes.c       | 5 +----
 net/ipv6/output_core.c   | 8 +-------
 net/vmw_vsock/af_vsock.c | 3 +--
 5 files changed, 5 insertions(+), 24 deletions(-)

diff --git a/fs/ext4/mmp.c b/fs/ext4/mmp.c
index 588cb09c5291..4681fff6665f 100644
--- a/fs/ext4/mmp.c
+++ b/fs/ext4/mmp.c
@@ -262,13 +262,7 @@ void ext4_stop_mmpd(struct ext4_sb_info *sbi)
  */
 static unsigned int mmp_new_seq(void)
 {
-	u32 new_seq;
-
-	do {
-		new_seq = get_random_u32();
-	} while (new_seq > EXT4_MMP_SEQ_MAX);
-
-	return new_seq;
+	return get_random_u32_below(EXT4_MMP_SEQ_MAX + 1);
 }
 
 /*
diff --git a/lib/test_fprobe.c b/lib/test_fprobe.c
index e0381b3ec410..1fb56cf5e5ce 100644
--- a/lib/test_fprobe.c
+++ b/lib/test_fprobe.c
@@ -144,10 +144,7 @@ static unsigned long get_ftrace_location(void *func)
 
 static int fprobe_test_init(struct kunit *test)
 {
-	do {
-		rand1 = get_random_u32();
-	} while (rand1 <= div_factor);
-
+	rand1 = get_random_u32_above(div_factor);
 	target = fprobe_selftest_target;
 	target2 = fprobe_selftest_target2;
 	target_ip = get_ftrace_location(target);
diff --git a/lib/test_kprobes.c b/lib/test_kprobes.c
index eeb1d728d974..1c95e5719802 100644
--- a/lib/test_kprobes.c
+++ b/lib/test_kprobes.c
@@ -339,10 +339,7 @@ static int kprobes_test_init(struct kunit *test)
 	stacktrace_target = kprobe_stacktrace_target;
 	internal_target = kprobe_stacktrace_internal_target;
 	stacktrace_driver = kprobe_stacktrace_driver;
-
-	do {
-		rand1 = get_random_u32();
-	} while (rand1 <= div_factor);
+	rand1 = get_random_u32_above(div_factor);
 	return 0;
 }
 
diff --git a/net/ipv6/output_core.c b/net/ipv6/output_core.c
index 2685c3f15e9d..b5205311f372 100644
--- a/net/ipv6/output_core.c
+++ b/net/ipv6/output_core.c
@@ -15,13 +15,7 @@ static u32 __ipv6_select_ident(struct net *net,
 			       const struct in6_addr *dst,
 			       const struct in6_addr *src)
 {
-	u32 id;
-
-	do {
-		id = get_random_u32();
-	} while (!id);
-
-	return id;
+	return get_random_u32_above(0);
 }
 
 /* This function exists only for tap drivers that must support broken
diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index ff38c5a4d174..d593d5b6d4b1 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -626,8 +626,7 @@ static int __vsock_bind_connectible(struct vsock_sock *vsk,
 	struct sockaddr_vm new_addr;
 
 	if (!port)
-		port = LAST_RESERVED_PORT + 1 +
-			get_random_u32_below(U32_MAX - LAST_RESERVED_PORT);
+		port = get_random_u32_above(LAST_RESERVED_PORT);
 
 	vsock_addr_init(&new_addr, addr->svm_cid, addr->svm_port);
 
-- 
2.38.1

