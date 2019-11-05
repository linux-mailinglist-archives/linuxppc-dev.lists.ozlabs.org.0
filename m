Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F2BEF866
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 10:16:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476kZ01cFbzF4Hb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 20:16:40 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 476kMy0TCpzDrFp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 20:07:56 +1100 (AEDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 476kMr0pdBzQlBB;
 Tue,  5 Nov 2019 10:07:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
 [80.241.56.117]) (amavisd-new, port 10030)
 with ESMTP id xLJwHfZCUuzQ; Tue,  5 Nov 2019 10:07:46 +0100 (CET)
From: Aleksa Sarai <cyphar@cyphar.com>
To: Al Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>,
 "J. Bruce Fields" <bfields@fieldses.org>, Arnd Bergmann <arnd@arndb.de>,
 David Howells <dhowells@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v15 3/9] namei: LOOKUP_NO_XDEV: block mountpoint crossing
Date: Tue,  5 Nov 2019 20:05:47 +1100
Message-Id: <20191105090553.6350-4-cyphar@cyphar.com>
In-Reply-To: <20191105090553.6350-1-cyphar@cyphar.com>
References: <20191105090553.6350-1-cyphar@cyphar.com>
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
 Christian Brauner <christian.brauner@ubuntu.com>, Jiri Olsa <jolsa@redhat.com>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, Aleksa Sarai <asarai@suse.de>,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, linuxppc-dev@lists.ozlabs.org,
 Aleksa Sarai <cyphar@cyphar.com>, Andy Lutomirski <luto@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, David Drysdale <drysdale@google.com>,
 Christian Brauner <christian@brauner.io>, libc-alpha@sourceware.org,
 linux-parisc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-api@vger.kernel.org, Chanho Min <chanho.min@lge.com>,
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>,
 linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 containers@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

/* Background. */
The need to contain path operations within a mountpoint has been a
long-standing usecase that userspace has historically implemented
manually with liberal usage of stat(). find, rsync, tar and
many other programs implement these semantics -- but it'd be much
simpler to have a fool-proof way of refusing to open a path if it
crosses a mountpoint.

This is part of a refresh of Al's AT_NO_JUMPS patchset[1] (which was a
variation on David Drysdale's O_BENEATH patchset[2], which in turn was
based on the Capsicum project[3]).

/* Userspace API. */
LOOKUP_NO_XDEV will be exposed to userspace through openat2(2).

/* Semantics. */
Unlike most other LOOKUP flags (most notably LOOKUP_FOLLOW),
LOOKUP_NO_XDEV applies to all components of the path.

With LOOKUP_NO_XDEV, any path component which crosses a mount-point
during path resolution (including "..") will yield an -EXDEV. Absolute
paths, absolute symlinks, and magic-links will only yield an -EXDEV if
the jump involved changing mount-points.

/* Testing. */
LOOKUP_NO_XDEV is tested as part of the openat2(2) selftests.

[1]: https://lore.kernel.org/lkml/20170429220414.GT29622@ZenIV.linux.org.uk/
[2]: https://lore.kernel.org/lkml/1415094884-18349-1-git-send-email-drysdale@google.com/
[3]: https://lore.kernel.org/lkml/1404124096-21445-1-git-send-email-drysdale@google.com/

Cc: Christian Brauner <christian.brauner@ubuntu.com>
Suggested-by: David Drysdale <drysdale@google.com>
Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
Suggested-by: Andy Lutomirski <luto@kernel.org>
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Aleksa Sarai <cyphar@cyphar.com>
---
 fs/namei.c            | 34 ++++++++++++++++++++++++++++++----
 include/linux/namei.h |  1 +
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index 1f0d871199e5..b73ee1601bd4 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -504,6 +504,9 @@ struct nameidata {
 	struct filename	*name;
 	struct nameidata *saved;
 	struct inode	*link_inode;
+	struct {
+		bool same_mnt;
+	} last_magiclink;
 	unsigned	root_seq;
 	int		dfd;
 } __randomize_layout;
@@ -837,6 +840,11 @@ static inline void path_to_nameidata(const struct path *path,
 
 static int nd_jump_root(struct nameidata *nd)
 {
+	if (unlikely(nd->flags & LOOKUP_NO_XDEV)) {
+		/* Absolute path arguments to path_init() are allowed. */
+		if (nd->path.mnt != NULL && nd->path.mnt != nd->root.mnt)
+			return -EXDEV;
+	}
 	if (nd->flags & LOOKUP_RCU) {
 		struct dentry *d;
 		nd->path = nd->root;
@@ -862,6 +870,8 @@ static int nd_jump_root(struct nameidata *nd)
 void nd_jump_link(struct path *path)
 {
 	struct nameidata *nd = current->nameidata;
+
+	nd->last_magiclink.same_mnt = (nd->path.mnt == path->mnt);
 	path_put(&nd->path);
 
 	nd->path = *path;
@@ -1082,6 +1092,10 @@ const char *get_link(struct nameidata *nd)
 		if (nd->flags & LOOKUP_MAGICLINK_JUMPED) {
 			if (unlikely(nd->flags & LOOKUP_NO_MAGICLINKS))
 				return ERR_PTR(-ELOOP);
+			if (unlikely(nd->flags & LOOKUP_NO_XDEV)) {
+				if (!nd->last_magiclink.same_mnt)
+					return ERR_PTR(-EXDEV);
+			}
 		}
 		if (IS_ERR_OR_NULL(res))
 			return res;
@@ -1271,12 +1285,16 @@ static int follow_managed(struct path *path, struct nameidata *nd)
 		break;
 	}
 
-	if (need_mntput && path->mnt == mnt)
-		mntput(path->mnt);
+	if (need_mntput) {
+		if (path->mnt == mnt)
+			mntput(path->mnt);
+		if (unlikely(nd->flags & LOOKUP_NO_XDEV))
+			ret = -EXDEV;
+		else
+			nd->flags |= LOOKUP_JUMPED;
+	}
 	if (ret == -EISDIR || !ret)
 		ret = 1;
-	if (need_mntput)
-		nd->flags |= LOOKUP_JUMPED;
 	if (unlikely(ret < 0))
 		path_put_conditional(path, nd);
 	return ret;
@@ -1333,6 +1351,8 @@ static bool __follow_mount_rcu(struct nameidata *nd, struct path *path,
 		mounted = __lookup_mnt(path->mnt, path->dentry);
 		if (!mounted)
 			break;
+		if (unlikely(nd->flags & LOOKUP_NO_XDEV))
+			return false;
 		path->mnt = &mounted->mnt;
 		path->dentry = mounted->mnt.mnt_root;
 		nd->flags |= LOOKUP_JUMPED;
@@ -1379,6 +1399,8 @@ static int follow_dotdot_rcu(struct nameidata *nd)
 				return -ECHILD;
 			if (&mparent->mnt == nd->path.mnt)
 				break;
+			if (unlikely(nd->flags & LOOKUP_NO_XDEV))
+				return -EXDEV;
 			/* we know that mountpoint was pinned */
 			nd->path.dentry = mountpoint;
 			nd->path.mnt = &mparent->mnt;
@@ -1393,6 +1415,8 @@ static int follow_dotdot_rcu(struct nameidata *nd)
 			return -ECHILD;
 		if (!mounted)
 			break;
+		if (unlikely(nd->flags & LOOKUP_NO_XDEV))
+			return -EXDEV;
 		nd->path.mnt = &mounted->mnt;
 		nd->path.dentry = mounted->mnt.mnt_root;
 		inode = nd->path.dentry->d_inode;
@@ -1491,6 +1515,8 @@ static int follow_dotdot(struct nameidata *nd)
 		}
 		if (!follow_up(&nd->path))
 			break;
+		if (unlikely(nd->flags & LOOKUP_NO_XDEV))
+			return -EXDEV;
 	}
 	follow_mount(&nd->path);
 	nd->inode = nd->path.dentry->d_inode;
diff --git a/include/linux/namei.h b/include/linux/namei.h
index a8b3f93338da..6105c8a59fc8 100644
--- a/include/linux/namei.h
+++ b/include/linux/namei.h
@@ -43,6 +43,7 @@ enum {LAST_NORM, LAST_ROOT, LAST_DOT, LAST_DOTDOT, LAST_BIND};
 /* Scoping flags for lookup. */
 #define LOOKUP_NO_SYMLINKS	0x020000 /* No symlink crossing. */
 #define LOOKUP_NO_MAGICLINKS	0x040000 /* No /proc/$pid/fd/ "symlink" crossing. */
+#define LOOKUP_NO_XDEV		0x080000 /* No mountpoint crossing. */
 
 extern int path_pts(struct path *path);
 
-- 
2.23.0

