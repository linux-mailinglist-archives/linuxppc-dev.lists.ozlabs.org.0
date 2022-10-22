Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCB0608366
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Oct 2022 03:48:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MvPNt59M8z3dsN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Oct 2022 12:47:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=RYModmzz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=nrlw=2x=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=RYModmzz;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MvPK156CLz3dsC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Oct 2022 12:44:37 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0BC4361FB4;
	Sat, 22 Oct 2022 01:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8EB2C43141;
	Sat, 22 Oct 2022 01:44:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="RYModmzz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1666403065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6V7n7WLPPuhmK3sEMGuUnn+DVRADTUodeMZgVjm6mzw=;
	b=RYModmzzec1OgskkcQmS88KlPnl8bEDxVs4NFDzK61wcmW5QvikH5xeZo68AnjN6PonqCT
	u/znWy0ao8IKhXHXs/gq7RjG6sZSoZ1g/F1NTIf3MbxHxZ33HyaUZgMQA9GjldEfSrFsFn
	1AU24c29vQR9f+tA0s5hbhp1IEc7HeQ=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bec1a5aa (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Sat, 22 Oct 2022 01:44:25 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/5] treewide: use get_random_u32_{above,below}() instead of manual loop
Date: Fri, 21 Oct 2022 21:44:02 -0400
Message-Id: <20221022014403.3881893-5-Jason@zx2c4.com>
In-Reply-To: <20221022014403.3881893-1-Jason@zx2c4.com>
References: <20221022014403.3881893-1-Jason@zx2c4.com>
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
      ...
-     I = get_random_u32();
      ...
-   } while (I > E);
+   I = get_random_u32_below(E + 1);

@@
expression E;
identifier I;
@@
-   do {
      ...
-     I = get_random_u32();
      ...
-   } while (I >= E);
+   I = get_random_u32_below(E);

@@
expression E;
identifier I;
@@
-   do {
      ...
-     I = get_random_u32();
      ...
-   } while (I < E);
+   I = get_random_u32_above(E - 1);

@@
expression E;
identifier I;
@@
-   do {
      ...
-     I = get_random_u32();
      ...
-   } while (I <= E);
+   I = get_random_u32_above(E);

@@
identifier I;
@@
-   do {
      ...
-     I = get_random_u32();
      ...
-   } while (!I);
+   I = get_random_u32_above(0);

@@
identifier I;
@@
-   do {
      ...
-     I = get_random_u32();
      ...
-   } while (I == 0);
+   I = get_random_u32_above(0);

@@
expression E;
identifier I;
@@
- E + 1 + get_random_u32_below(U32_MAX - E)
+ get_random_u32_above(E)

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
index f185f57c34e7..9cfed7fd8740 100644
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

