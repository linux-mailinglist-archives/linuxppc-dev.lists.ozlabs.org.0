Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB8A1A7465
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 09:12:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491cBr0SylzDqJ3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 17:12:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+4a22011dcb1da0b09bf4+6078+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=brLQnI//; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491byK2ZJbzDqWJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 17:02:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=EWZgZ6zyaZ6YMEIgvBGyR6v+qe30cpq5NGkMXzw4/z0=; b=brLQnI//YTVH10A1ASGVRH5ecM
 6D4KzVn5tJO5QdGtAC9GiH9cbvSIclxkBmD6MqKjC0qQCzI18Qxioj1Iy2beU52vZEEhtBmcrhILh
 bNGgEOK2yIm7cGevcumIY+OXpkfqH9wLqCub4OhtjyxjGWhpnbUIU5TEr8Um1An3BD5+QN/ftElkh
 OH+k7eUnl47pqatXQukhLm1pHnZ/APl8buAPWRuZGmZPHOOw2ddmUgDK5jfVwNSvjlZqaBP/c4Fwr
 RxEEqx56YHzv/XRdnWOkjzzVUdKKAKC0GFHYADKTaQTubMVvHTHpMfVfzPrKvoW1kJYXZXIdYr0kq
 9WUHsQYw==;
Received: from [2001:4bb8:180:384b:4c21:af7:dd95:e552] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOFa0-0005Yq-5U; Tue, 14 Apr 2020 07:01:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 4/8] binfmt_elf: open code copy_siginfo_to_user to kernelspace
 buffer
Date: Tue, 14 Apr 2020 09:01:38 +0200
Message-Id: <20200414070142.288696-5-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414070142.288696-1-hch@lst.de>
References: <20200414070142.288696-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Jeremy Kerr <jk@ozlabs.org>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "Eric W . Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Instead of messing with the address limit just open code the trivial
memcpy + memset logic for the native version, and a call to
to_compat_siginfo for the compat version.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/binfmt_elf.c        | 9 +++++----
 fs/compat_binfmt_elf.c | 6 +++++-
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index 13f25e241ac4..607c5a5f855e 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -1553,15 +1553,16 @@ static void fill_auxv_note(struct memelfnote *note, struct mm_struct *mm)
 	fill_note(note, "CORE", NT_AUXV, i * sizeof(elf_addr_t), auxv);
 }
 
+#ifndef fill_siginfo_note
 static void fill_siginfo_note(struct memelfnote *note, user_siginfo_t *csigdata,
 		const kernel_siginfo_t *siginfo)
 {
-	mm_segment_t old_fs = get_fs();
-	set_fs(KERNEL_DS);
-	copy_siginfo_to_user((user_siginfo_t __user *) csigdata, siginfo);
-	set_fs(old_fs);
+	memcpy(csigdata, siginfo, sizeof(struct kernel_siginfo));
+	memset((char *)csigdata + sizeof(struct kernel_siginfo), 0,
+		SI_EXPANSION_SIZE);
 	fill_note(note, "CORE", NT_SIGINFO, sizeof(*csigdata), csigdata);
 }
+#endif
 
 #define MAX_FILE_NOTE_SIZE (4*1024*1024)
 /*
diff --git a/fs/compat_binfmt_elf.c b/fs/compat_binfmt_elf.c
index aaad4ca1217e..ab84e095618b 100644
--- a/fs/compat_binfmt_elf.c
+++ b/fs/compat_binfmt_elf.c
@@ -39,7 +39,11 @@
  */
 #define user_long_t		compat_long_t
 #define user_siginfo_t		compat_siginfo_t
-#define copy_siginfo_to_user	copy_siginfo_to_user32
+#define fill_siginfo_note(note, csigdata, siginfo)		\
+do {									\
+	to_compat_siginfo(csigdata, siginfo, compat_siginfo_flags());	\
+	fill_note(note, "CORE", NT_SIGINFO, sizeof(*csigdata), csigdata); \
+} while (0)
 
 /*
  * The machine-dependent core note format types are defined in elfcore-compat.h,
-- 
2.25.1

