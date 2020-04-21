Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5FB1B2BC6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 17:59:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4967Xg73dczDr0C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 01:58:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+e7bbf23787eeed0e081a+6085+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=QjI/7kcv; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49679T62kHzDqHJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 01:42:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=SORsRPhtytui9rgjjhHugK9i10g6qzh4zoIcUMIo6qc=; b=QjI/7kcvcAV9LVG6XxPF7jyZJV
 8Db+cQyihzXdIEIkCylbFuHMaTIxg6nGmhc5HFYNOlaS7JhA2Ml13qy+rtH2A0qmVmuHIhhpxx2zJ
 VcMatYxNQxeI5PwUEkXvQq5ra1Ze+bp1e5g3cX/+bPnu97kfDJHPDgjjX962YG1H+AHHcEeaxOEK9
 I5AGaYTRxAIKKkEnO9D06YxRlRI3g545WCmT1lT5SVxhJvDeUMBA/Xg7u206wjE6aZhsds3YSH1Eo
 2cr/qpazPo1FTXbSecXVbT67ofXwRxL1uNQ8gRvO9zWYfntn1ajB27Qw7IUHwgKOak3yYirptk+ww
 /MYj3enQ==;
Received: from [2001:4bb8:191:e12c:c70:4a89:bc61:3] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQv2N-0007qr-84; Tue, 21 Apr 2020 15:42:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 3/7] binfmt_elf: femove the set_fs in fill_siginfo_note
Date: Tue, 21 Apr 2020 17:42:00 +0200
Message-Id: <20200421154204.252921-4-hch@lst.de>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200421154204.252921-1-hch@lst.de>
References: <20200421154204.252921-1-hch@lst.de>
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

From: "Eric W. Biederman" <ebiederm@xmission.com>

The code in binfmt_elf.c is differnt from the rest of the code that
processes siginfo, as it sends siginfo from a kernel buffer to a file
rather than from kernel memory to userspace buffers.  To remove it's
use of set_fs the code needs some different siginfo helpers.

Add the helper copy_siginfo_to_external to copy from the kernel's
internal siginfo layout to a buffer in the siginfo layout that
userspace expects.

Modify fill_siginfo_note to use copy_siginfo_to_external instead of
set_fs and copy_siginfo_to_user.

Update compat_binfmt_elf.c to use the previously added
copy_siginfo_to_external32 to handle the compat case.

Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/binfmt_elf.c        | 5 +----
 fs/compat_binfmt_elf.c | 2 +-
 include/linux/signal.h | 8 ++++++++
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index 13f25e241ac4..a1f57e20c3cf 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -1556,10 +1556,7 @@ static void fill_auxv_note(struct memelfnote *note, struct mm_struct *mm)
 static void fill_siginfo_note(struct memelfnote *note, user_siginfo_t *csigdata,
 		const kernel_siginfo_t *siginfo)
 {
-	mm_segment_t old_fs = get_fs();
-	set_fs(KERNEL_DS);
-	copy_siginfo_to_user((user_siginfo_t __user *) csigdata, siginfo);
-	set_fs(old_fs);
+	copy_siginfo_to_external(csigdata, siginfo);
 	fill_note(note, "CORE", NT_SIGINFO, sizeof(*csigdata), csigdata);
 }
 
diff --git a/fs/compat_binfmt_elf.c b/fs/compat_binfmt_elf.c
index aaad4ca1217e..fa0e24e1b726 100644
--- a/fs/compat_binfmt_elf.c
+++ b/fs/compat_binfmt_elf.c
@@ -39,7 +39,7 @@
  */
 #define user_long_t		compat_long_t
 #define user_siginfo_t		compat_siginfo_t
-#define copy_siginfo_to_user	copy_siginfo_to_user32
+#define copy_siginfo_to_external	copy_siginfo_to_external32
 
 /*
  * The machine-dependent core note format types are defined in elfcore-compat.h,
diff --git a/include/linux/signal.h b/include/linux/signal.h
index 05bacd2ab135..6bb1a3f0258c 100644
--- a/include/linux/signal.h
+++ b/include/linux/signal.h
@@ -24,6 +24,14 @@ static inline void clear_siginfo(kernel_siginfo_t *info)
 
 #define SI_EXPANSION_SIZE (sizeof(struct siginfo) - sizeof(struct kernel_siginfo))
 
+static inline void copy_siginfo_to_external(siginfo_t *to,
+					    const kernel_siginfo_t *from)
+{
+	memcpy(to, from, sizeof(*from));
+	memset(((char *)to) + sizeof(struct kernel_siginfo), 0,
+		SI_EXPANSION_SIZE);
+}
+
 int copy_siginfo_to_user(siginfo_t __user *to, const kernel_siginfo_t *from);
 int copy_siginfo_from_user(kernel_siginfo_t *to, const siginfo_t __user *from);
 
-- 
2.26.1

