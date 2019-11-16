Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AA2FE9AB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 01:34:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47FGSJ37skzF7MK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 11:34:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cyphar.com (client-ip=2001:67c:2050::465:201;
 helo=mout-p-201.mailbox.org; envelope-from=cyphar@cyphar.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=cyphar.com
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org
 [IPv6:2001:67c:2050::465:201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47FGLM1vPbzF7jl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2019 11:29:15 +1100 (AEDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 47FGLB4shzzQl99;
 Sat, 16 Nov 2019 01:29:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id ha-TL_CvKMz0; Sat, 16 Nov 2019 01:29:02 +0100 (CET)
From: Aleksa Sarai <cyphar@cyphar.com>
To: Al Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>,
 "J. Bruce Fields" <bfields@fieldses.org>, Arnd Bergmann <arnd@arndb.de>,
 David Howells <dhowells@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
 Andrii Nakryiko <andriin@fb.com>
Subject: [PATCH v16 01/12] nsfs: clean-up ns_get_path() signature to return int
Date: Sat, 16 Nov 2019 11:27:51 +1100
Message-Id: <20191116002802.6663-2-cyphar@cyphar.com>
In-Reply-To: <20191116002802.6663-1-cyphar@cyphar.com>
References: <20191116002802.6663-1-cyphar@cyphar.com>
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
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-api@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, Aleksa Sarai <asarai@suse.de>,
 David Drysdale <drysdale@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>,
 linuxppc-dev@lists.ozlabs.org, dev@opencontainers.org,
 Aleksa Sarai <cyphar@cyphar.com>, Andy Lutomirski <luto@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Christian Brauner <christian@brauner.io>, libc-alpha@sourceware.org,
 linux-parisc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 netdev@vger.kernel.org, Chanho Min <chanho.min@lge.com>,
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>,
 linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 containers@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ns_get_path() and ns_get_path_cb() only ever return either NULL or an
ERR_PTR. It is far more idiomatic to simply return an integer, and it
makes all of the callers of ns_get_path() more straightforward to read.

Fixes: e149ed2b805f ("take the targets of /proc/*/ns/* symlinks to separate fs")
Signed-off-by: Aleksa Sarai <cyphar@cyphar.com>
---
 fs/nsfs.c               | 29 ++++++++++++++---------------
 fs/proc/namespaces.c    |  6 +++---
 include/linux/proc_ns.h |  4 ++--
 kernel/bpf/offload.c    | 12 ++++++------
 kernel/events/core.c    |  2 +-
 5 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/fs/nsfs.c b/fs/nsfs.c
index a0431642c6b5..f3d2833c5781 100644
--- a/fs/nsfs.c
+++ b/fs/nsfs.c
@@ -52,7 +52,7 @@ static void nsfs_evict(struct inode *inode)
 	ns->ops->put(ns);
 }
 
-static void *__ns_get_path(struct path *path, struct ns_common *ns)
+static int __ns_get_path(struct path *path, struct ns_common *ns)
 {
 	struct vfsmount *mnt = nsfs_mnt;
 	struct dentry *dentry;
@@ -71,13 +71,13 @@ static void *__ns_get_path(struct path *path, struct ns_common *ns)
 got_it:
 	path->mnt = mntget(mnt);
 	path->dentry = dentry;
-	return NULL;
+	return 0;
 slow:
 	rcu_read_unlock();
 	inode = new_inode_pseudo(mnt->mnt_sb);
 	if (!inode) {
 		ns->ops->put(ns);
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 	}
 	inode->i_ino = ns->inum;
 	inode->i_mtime = inode->i_atime = inode->i_ctime = current_time(inode);
@@ -89,7 +89,7 @@ static void *__ns_get_path(struct path *path, struct ns_common *ns)
 	dentry = d_alloc_anon(mnt->mnt_sb);
 	if (!dentry) {
 		iput(inode);
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 	}
 	d_instantiate(dentry, inode);
 	dentry->d_fsdata = (void *)ns->ops;
@@ -98,23 +98,22 @@ static void *__ns_get_path(struct path *path, struct ns_common *ns)
 		d_delete(dentry);	/* make sure ->d_prune() does nothing */
 		dput(dentry);
 		cpu_relax();
-		return ERR_PTR(-EAGAIN);
+		return -EAGAIN;
 	}
 	goto got_it;
 }
 
-void *ns_get_path_cb(struct path *path, ns_get_path_helper_t *ns_get_cb,
+int ns_get_path_cb(struct path *path, ns_get_path_helper_t *ns_get_cb,
 		     void *private_data)
 {
-	void *ret;
+	int ret;
 
 	do {
 		struct ns_common *ns = ns_get_cb(private_data);
 		if (!ns)
-			return ERR_PTR(-ENOENT);
-
+			return -ENOENT;
 		ret = __ns_get_path(path, ns);
-	} while (ret == ERR_PTR(-EAGAIN));
+	} while (ret == -EAGAIN);
 
 	return ret;
 }
@@ -131,7 +130,7 @@ static struct ns_common *ns_get_path_task(void *private_data)
 	return args->ns_ops->get(args->task);
 }
 
-void *ns_get_path(struct path *path, struct task_struct *task,
+int ns_get_path(struct path *path, struct task_struct *task,
 		  const struct proc_ns_operations *ns_ops)
 {
 	struct ns_get_path_task_args args = {
@@ -147,7 +146,7 @@ int open_related_ns(struct ns_common *ns,
 {
 	struct path path = {};
 	struct file *f;
-	void *err;
+	int err;
 	int fd;
 
 	fd = get_unused_fd_flags(O_CLOEXEC);
@@ -164,11 +163,11 @@ int open_related_ns(struct ns_common *ns,
 		}
 
 		err = __ns_get_path(&path, relative);
-	} while (err == ERR_PTR(-EAGAIN));
+	} while (err == -EAGAIN);
 
-	if (IS_ERR(err)) {
+	if (err) {
 		put_unused_fd(fd);
-		return PTR_ERR(err);
+		return err;
 	}
 
 	f = dentry_open(&path, O_RDONLY, current_cred());
diff --git a/fs/proc/namespaces.c b/fs/proc/namespaces.c
index dd2b35f78b09..08dd94df1a66 100644
--- a/fs/proc/namespaces.c
+++ b/fs/proc/namespaces.c
@@ -42,14 +42,14 @@ static const char *proc_ns_get_link(struct dentry *dentry,
 	const struct proc_ns_operations *ns_ops = PROC_I(inode)->ns_ops;
 	struct task_struct *task;
 	struct path ns_path;
-	void *error = ERR_PTR(-EACCES);
+	int error = -EACCES;
 
 	if (!dentry)
 		return ERR_PTR(-ECHILD);
 
 	task = get_proc_task(inode);
 	if (!task)
-		return error;
+		return ERR_PTR(-EACCES);
 
 	if (ptrace_may_access(task, PTRACE_MODE_READ_FSCREDS)) {
 		error = ns_get_path(&ns_path, task, ns_ops);
@@ -57,7 +57,7 @@ static const char *proc_ns_get_link(struct dentry *dentry,
 			nd_jump_link(&ns_path);
 	}
 	put_task_struct(task);
-	return error;
+	return ERR_PTR(error);
 }
 
 static int proc_ns_readlink(struct dentry *dentry, char __user *buffer, int buflen)
diff --git a/include/linux/proc_ns.h b/include/linux/proc_ns.h
index d31cb6215905..aed366b4795c 100644
--- a/include/linux/proc_ns.h
+++ b/include/linux/proc_ns.h
@@ -76,10 +76,10 @@ static inline int ns_alloc_inum(struct ns_common *ns)
 
 extern struct file *proc_ns_fget(int fd);
 #define get_proc_ns(inode) ((struct ns_common *)(inode)->i_private)
-extern void *ns_get_path(struct path *path, struct task_struct *task,
+extern int ns_get_path(struct path *path, struct task_struct *task,
 			const struct proc_ns_operations *ns_ops);
 typedef struct ns_common *ns_get_path_helper_t(void *);
-extern void *ns_get_path_cb(struct path *path, ns_get_path_helper_t ns_get_cb,
+extern int ns_get_path_cb(struct path *path, ns_get_path_helper_t ns_get_cb,
 			    void *private_data);
 
 extern int ns_get_name(char *buf, size_t size, struct task_struct *task,
diff --git a/kernel/bpf/offload.c b/kernel/bpf/offload.c
index ba635209ae9a..a2253a044f90 100644
--- a/kernel/bpf/offload.c
+++ b/kernel/bpf/offload.c
@@ -302,14 +302,14 @@ int bpf_prog_offload_info_fill(struct bpf_prog_info *info,
 	struct inode *ns_inode;
 	struct path ns_path;
 	char __user *uinsns;
-	void *res;
+	int res;
 	u32 ulen;
 
 	res = ns_get_path_cb(&ns_path, bpf_prog_offload_info_fill_ns, &args);
-	if (IS_ERR(res)) {
+	if (res) {
 		if (!info->ifindex)
 			return -ENODEV;
-		return PTR_ERR(res);
+		return res;
 	}
 
 	down_read(&bpf_devs_lock);
@@ -526,13 +526,13 @@ int bpf_map_offload_info_fill(struct bpf_map_info *info, struct bpf_map *map)
 	};
 	struct inode *ns_inode;
 	struct path ns_path;
-	void *res;
+	int res;
 
 	res = ns_get_path_cb(&ns_path, bpf_map_offload_info_fill_ns, &args);
-	if (IS_ERR(res)) {
+	if (res) {
 		if (!info->ifindex)
 			return -ENODEV;
-		return PTR_ERR(res);
+		return res;
 	}
 
 	ns_inode = ns_path.dentry->d_inode;
diff --git a/kernel/events/core.c b/kernel/events/core.c
index aec8dba2bea4..39c5711e868a 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7258,7 +7258,7 @@ static void perf_fill_ns_link_info(struct perf_ns_link_info *ns_link_info,
 {
 	struct path ns_path;
 	struct inode *ns_inode;
-	void *error;
+	int error;
 
 	error = ns_get_path(&ns_path, task, ns_ops);
 	if (!error) {
-- 
2.24.0

