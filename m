Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1440DC2613
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 20:40:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hrnB5B2xzDqNZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 04:40:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cyphar.com
 (client-ip=80.241.60.215; helo=mx2.mailbox.org;
 envelope-from=cyphar@cyphar.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=cyphar.com
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hrgC5Bc8zDqMK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2019 04:35:19 +1000 (AEST)
Received: from smtp2.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id D2982A18EA;
 Mon, 30 Sep 2019 20:35:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.240])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id 11lnC-7cGECu; Mon, 30 Sep 2019 20:35:11 +0200 (CEST)
From: Aleksa Sarai <cyphar@cyphar.com>
To: Al Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>,
 "J. Bruce Fields" <bfields@fieldses.org>, Arnd Bergmann <arnd@arndb.de>,
 David Howells <dhowells@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v13 2/9] procfs: switch magic-link modes to be more sane
Date: Tue,  1 Oct 2019 04:33:09 +1000
Message-Id: <20190930183316.10190-3-cyphar@cyphar.com>
In-Reply-To: <20190930183316.10190-1-cyphar@cyphar.com>
References: <20190930183316.10190-1-cyphar@cyphar.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
 Jiri Olsa <jolsa@redhat.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Tycho Andersen <tycho@tycho.ws>,
 Aleksa Sarai <asarai@suse.de>, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>,
 linuxppc-dev@lists.ozlabs.org, Aleksa Sarai <cyphar@cyphar.com>,
 Andy Lutomirski <luto@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 David Drysdale <drysdale@google.com>, Christian Brauner <christian@brauner.io>,
 libc-alpha@sourceware.org, linux-parisc@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-api@vger.kernel.org,
 Chanho Min <chanho.min@lge.com>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 containers@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that magic-link modes are obeyed for file re-opening purposes, some
of the pre-existing magic-link modes need to be adjusted to be more
semantically correct.

The most blatant example of this is /proc/self/exe, which had a mode of
a+rwx even though tautologically the file could never be opened for
writing (because it is the current->mm of a live process).

With the new O_PATH restrictions, changing the default mode of these
magic-links allows us to avoid delayed-access attacks such as we saw in
CVE-2019-5736.

Signed-off-by: Aleksa Sarai <cyphar@cyphar.com>
---
 fs/proc/base.c       | 20 ++++++++++----------
 fs/proc/namespaces.c |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/proc/base.c b/fs/proc/base.c
index 96c9ec66846f..908edd0e875e 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -133,9 +133,9 @@ struct pid_entry {
 
 #define DIR(NAME, MODE, iops, fops)	\
 	NOD(NAME, (S_IFDIR|(MODE)), &iops, &fops, {} )
-#define LNK(NAME, get_link)					\
-	NOD(NAME, (S_IFLNK|S_IRWXUGO),				\
-		&proc_pid_link_inode_operations, NULL,		\
+#define LNK(NAME, MODE, get_link)			\
+	NOD(NAME, (S_IFLNK|(MODE)),			\
+		&proc_pid_link_inode_operations, NULL,	\
 		{ .proc_get_link = get_link } )
 #define REG(NAME, MODE, fops)				\
 	NOD(NAME, (S_IFREG|(MODE)), NULL, &fops, {})
@@ -3047,9 +3047,9 @@ static const struct pid_entry tgid_base_stuff[] = {
 	REG("numa_maps",  S_IRUGO, proc_pid_numa_maps_operations),
 #endif
 	REG("mem",        S_IRUSR|S_IWUSR, proc_mem_operations),
-	LNK("cwd",        proc_cwd_link),
-	LNK("root",       proc_root_link),
-	LNK("exe",        proc_exe_link),
+	LNK("cwd",        S_IRWXUGO, proc_cwd_link),
+	LNK("root",       S_IRWXUGO, proc_root_link),
+	LNK("exe",        S_IRUGO|S_IXUGO, proc_exe_link),
 	REG("mounts",     S_IRUGO, proc_mounts_operations),
 	REG("mountinfo",  S_IRUGO, proc_mountinfo_operations),
 	REG("mountstats", S_IRUSR, proc_mountstats_operations),
@@ -3448,11 +3448,11 @@ static const struct pid_entry tid_base_stuff[] = {
 	REG("numa_maps", S_IRUGO, proc_pid_numa_maps_operations),
 #endif
 	REG("mem",       S_IRUSR|S_IWUSR, proc_mem_operations),
-	LNK("cwd",       proc_cwd_link),
-	LNK("root",      proc_root_link),
-	LNK("exe",       proc_exe_link),
+	LNK("cwd",       S_IRWXUGO, proc_cwd_link),
+	LNK("root",      S_IRWXUGO, proc_root_link),
+	LNK("exe",       S_IRUGO|S_IXUGO, proc_exe_link),
 	REG("mounts",    S_IRUGO, proc_mounts_operations),
-	REG("mountinfo",  S_IRUGO, proc_mountinfo_operations),
+	REG("mountinfo", S_IRUGO, proc_mountinfo_operations),
 #ifdef CONFIG_PROC_PAGE_MONITOR
 	REG("clear_refs", S_IWUSR, proc_clear_refs_operations),
 	REG("smaps",     S_IRUGO, proc_pid_smaps_operations),
diff --git a/fs/proc/namespaces.c b/fs/proc/namespaces.c
index 0142992eceea..cadf0ae796a2 100644
--- a/fs/proc/namespaces.c
+++ b/fs/proc/namespaces.c
@@ -94,7 +94,7 @@ static struct dentry *proc_ns_instantiate(struct dentry *dentry,
 	struct inode *inode;
 	struct proc_inode *ei;
 
-	inode = proc_pid_make_inode(dentry->d_sb, task, S_IFLNK | S_IRWXUGO);
+	inode = proc_pid_make_inode(dentry->d_sb, task, S_IFLNK | S_IRUGO);
 	if (!inode)
 		return ERR_PTR(-ENOENT);
 
-- 
2.23.0

