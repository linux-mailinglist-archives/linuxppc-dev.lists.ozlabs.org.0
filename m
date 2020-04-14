Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B415D1A748A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 09:19:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491cL64zGvzDqLV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 17:19:10 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=tlPfosRr; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491byV6j83zDqWy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 17:02:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=KHVzeUUAH3X0C6cb/ymYAEgh7N1ttmSFET3iRg2WhBE=; b=tlPfosRrj3qkmtLbo7WAC3GLFM
 pZUo0pIHOMgV2ItCPG5KBLuBF6ptIBBgLnIC4mv3ugIcbqiTPrTD4kSThZ+6eM6vxBWR4ykY/hSre
 I/9rty73cmTUeDn2B4K0O6O+ExQVh32xgF8rLfpUGLVt9krhTDBPxGUS7USXvuyPnhE+wb18GjNU0
 b1FOJMBrXQzxMuFzEuT1P21UflcExmhYZ4jpJVV+ivuOOnVsEZ7GNoV8qESgFv5BYbiAQ600qhB4D
 Y34UOIvdtYsCXzVV2UPoVPFATeJIAyLH3KxISCe5cU2rsB4RGAmi0qfFYW+Ip70BFDF2yTOywgZCu
 7Md5KSYw==;
Received: from [2001:4bb8:180:384b:4c21:af7:dd95:e552] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOFa8-0005Zi-VO; Tue, 14 Apr 2020 07:02:05 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 7/8] exec: simplify the copy_strings_kernel calling convention
Date: Tue, 14 Apr 2020 09:01:41 +0200
Message-Id: <20200414070142.288696-8-hch@lst.de>
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

copy_strings_kernel is always used with a single argument,
adjust the calling convention to that.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/binfmt_em86.c        |  6 +++---
 fs/binfmt_misc.c        |  4 ++--
 fs/binfmt_script.c      |  6 +++---
 fs/exec.c               | 13 ++++++-------
 include/linux/binfmts.h |  3 +--
 5 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/fs/binfmt_em86.c b/fs/binfmt_em86.c
index 466497860c62..f33fa668c91f 100644
--- a/fs/binfmt_em86.c
+++ b/fs/binfmt_em86.c
@@ -68,15 +68,15 @@ static int load_em86(struct linux_binprm *bprm)
 	 * user environment and arguments are stored.
 	 */
 	remove_arg_zero(bprm);
-	retval = copy_strings_kernel(1, &bprm->filename, bprm);
+	retval = copy_string_kernel(bprm->filename, bprm);
 	if (retval < 0) return retval; 
 	bprm->argc++;
 	if (i_arg) {
-		retval = copy_strings_kernel(1, &i_arg, bprm);
+		retval = copy_string_kernel(i_arg, bprm);
 		if (retval < 0) return retval; 
 		bprm->argc++;
 	}
-	retval = copy_strings_kernel(1, &i_name, bprm);
+	retval = copy_string_kernel(i_name, bprm);
 	if (retval < 0)	return retval;
 	bprm->argc++;
 
diff --git a/fs/binfmt_misc.c b/fs/binfmt_misc.c
index cdb45829354d..b15257d8ff5e 100644
--- a/fs/binfmt_misc.c
+++ b/fs/binfmt_misc.c
@@ -190,13 +190,13 @@ static int load_misc_binary(struct linux_binprm *bprm)
 		bprm->file = NULL;
 	}
 	/* make argv[1] be the path to the binary */
-	retval = copy_strings_kernel(1, &bprm->interp, bprm);
+	retval = copy_string_kernel(bprm->interp, bprm);
 	if (retval < 0)
 		goto error;
 	bprm->argc++;
 
 	/* add the interp as argv[0] */
-	retval = copy_strings_kernel(1, &fmt->interpreter, bprm);
+	retval = copy_string_kernel(fmt->interpreter, bprm);
 	if (retval < 0)
 		goto error;
 	bprm->argc++;
diff --git a/fs/binfmt_script.c b/fs/binfmt_script.c
index e9e6a6f4a35f..c4fb7f52a46e 100644
--- a/fs/binfmt_script.c
+++ b/fs/binfmt_script.c
@@ -117,17 +117,17 @@ static int load_script(struct linux_binprm *bprm)
 	retval = remove_arg_zero(bprm);
 	if (retval)
 		return retval;
-	retval = copy_strings_kernel(1, &bprm->interp, bprm);
+	retval = copy_string_kernel(bprm->interp, bprm);
 	if (retval < 0)
 		return retval;
 	bprm->argc++;
 	if (i_arg) {
-		retval = copy_strings_kernel(1, &i_arg, bprm);
+		retval = copy_string_kernel(i_arg, bprm);
 		if (retval < 0)
 			return retval;
 		bprm->argc++;
 	}
-	retval = copy_strings_kernel(1, &i_name, bprm);
+	retval = copy_string_kernel(i_name, bprm);
 	if (retval)
 		return retval;
 	bprm->argc++;
diff --git a/fs/exec.c b/fs/exec.c
index 06b4c550af5d..b2a77d5acede 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -588,24 +588,23 @@ static int copy_strings(int argc, struct user_arg_ptr argv,
 }
 
 /*
- * Like copy_strings, but get argv and its values from kernel memory.
+ * Copy and argument/environment string from the kernel to the processes stack.
  */
-int copy_strings_kernel(int argc, const char *const *__argv,
-			struct linux_binprm *bprm)
+int copy_string_kernel(const char *arg, struct linux_binprm *bprm)
 {
 	int r;
 	mm_segment_t oldfs = get_fs();
 	struct user_arg_ptr argv = {
-		.ptr.native = (const char __user *const  __user *)__argv,
+		.ptr.native = (const char __user *const  __user *)&arg,
 	};
 
 	set_fs(KERNEL_DS);
-	r = copy_strings(argc, argv, bprm);
+	r = copy_strings(1, argv, bprm);
 	set_fs(oldfs);
 
 	return r;
 }
-EXPORT_SYMBOL(copy_strings_kernel);
+EXPORT_SYMBOL(copy_string_kernel);
 
 #ifdef CONFIG_MMU
 
@@ -1863,7 +1862,7 @@ static int __do_execve_file(int fd, struct filename *filename,
 	if (retval < 0)
 		goto out;
 
-	retval = copy_strings_kernel(1, &bprm->filename, bprm);
+	retval = copy_string_kernel(bprm->filename, bprm);
 	if (retval < 0)
 		goto out;
 
diff --git a/include/linux/binfmts.h b/include/linux/binfmts.h
index a345d9fed3d8..3d3afe094c97 100644
--- a/include/linux/binfmts.h
+++ b/include/linux/binfmts.h
@@ -144,8 +144,7 @@ extern int setup_arg_pages(struct linux_binprm * bprm,
 extern int transfer_args_to_stack(struct linux_binprm *bprm,
 				  unsigned long *sp_location);
 extern int bprm_change_interp(const char *interp, struct linux_binprm *bprm);
-extern int copy_strings_kernel(int argc, const char *const *argv,
-			       struct linux_binprm *bprm);
+int copy_string_kernel(const char *arg, struct linux_binprm *bprm);
 extern void install_exec_creds(struct linux_binprm *bprm);
 extern void set_binfmt(struct linux_binfmt *new);
 extern ssize_t read_code(struct file *, unsigned long, loff_t, size_t);
-- 
2.25.1

