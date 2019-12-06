Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC62115361
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 15:42:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TwKc2B4PzDqVq
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Dec 2019 01:42:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cyphar.com (client-ip=2001:67c:2050::465:202;
 helo=mout-p-202.mailbox.org; envelope-from=cyphar@cyphar.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=cyphar.com
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050::465:202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Tvnr1bMdzDqfL
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Dec 2019 01:18:23 +1100 (AEDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 47Tvnm72hWzQlC4;
 Fri,  6 Dec 2019 15:18:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
 [80.241.56.125]) (amavisd-new, port 10030)
 with ESMTP id YqKflRMrESdz; Fri,  6 Dec 2019 15:18:13 +0100 (CET)
From: Aleksa Sarai <cyphar@cyphar.com>
To: Al Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>,
 "J. Bruce Fields" <bfields@fieldses.org>, Arnd Bergmann <arnd@arndb.de>,
 David Howells <dhowells@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
 Andrii Nakryiko <andriin@fb.com>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v18 09/13] namei: LOOKUP_IN_ROOT: chroot-like scoped resolution
Date: Sat,  7 Dec 2019 01:13:34 +1100
Message-Id: <20191206141338.23338-10-cyphar@cyphar.com>
In-Reply-To: <20191206141338.23338-1-cyphar@cyphar.com>
References: <20191206141338.23338-1-cyphar@cyphar.com>
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
Cc: linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
 Christian Brauner <christian.brauner@ubuntu.com>, linux-api@vger.kernel.org,
 Jiri Olsa <jolsa@redhat.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Tycho Andersen <tycho@tycho.ws>,
 Aleksa Sarai <asarai@suse.de>, linux-sh@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, linuxppc-dev@lists.ozlabs.org,
 dev@opencontainers.org, Aleksa Sarai <cyphar@cyphar.com>,
 Andy Lutomirski <luto@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 David Drysdale <drysdale@google.com>, Christian Brauner <christian@brauner.io>,
 libc-alpha@sourceware.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-parisc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 netdev@vger.kernel.org, Chanho Min <chanho.min@lge.com>,
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>,
 linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 containers@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

/* Background. */
Container runtimes or other administrative management processes will
often interact with root filesystems while in the host mount namespace,
because the cost of doing a chroot(2) on every operation is too
prohibitive (especially in Go, which cannot safely use vfork). However,
a malicious program can trick the management process into doing
operations on files outside of the root filesystem through careful
crafting of symlinks.

Most programs that need this feature have attempted to make this process
safe, by doing all of the path resolution in userspace (with symlinks
being scoped to the root of the malicious root filesystem).
Unfortunately, this method is prone to foot-guns and usually such
implementations have subtle security bugs.

Thus, what userspace needs is a way to resolve a path as though it were
in a chroot(2) -- with all absolute symlinks being resolved relative to
the dirfd root (and ".." components being stuck under the dirfd root).
It is much simpler and more straight-forward to provide this
functionality in-kernel (because it can be done far more cheaply and
correctly).

More classical applications that also have this problem (which have
their own potentially buggy userspace path sanitisation code) include
web servers, archive extraction tools, network file servers, and so on.

/* Userspace API. */
LOOKUP_IN_ROOT will be exposed to userspace through openat2(2).

/* Semantics. */
Unlike most other LOOKUP flags (most notably LOOKUP_FOLLOW),
LOOKUP_IN_ROOT applies to all components of the path.

With LOOKUP_IN_ROOT, any path component which attempts to cross the
starting point of the pathname lookup (the dirfd passed to openat) will
remain at the starting point. Thus, all absolute paths and symlinks will
be scoped within the starting point.

There is a slight change in behaviour regarding pathnames -- if the
pathname is absolute then the dirfd is still used as the root of
resolution of LOOKUP_IN_ROOT is specified (this is to avoid obvious
foot-guns, at the cost of a minor API inconsistency).

As with LOOKUP_BENEATH, Jann's security concern about ".."[1] applies to
LOOKUP_IN_ROOT -- therefore ".." resolution is blocked. This restriction
will be lifted in a future patch, but requires more work to ensure that
permitting ".." is done safely.

Magic-link jumps are also blocked, because they can beam the path lookup
across the starting point. It would be possible to detect and block
only the "bad" crossings with path_is_under() checks, but it's unclear
whether it makes sense to permit magic-links at all. However, userspace
is recommended to pass LOOKUP_NO_MAGICLINKS if they want to ensure that
magic-link crossing is entirely disabled.

/* Testing. */
LOOKUP_IN_ROOT is tested as part of the openat2(2) selftests.

[1]: https://lore.kernel.org/lkml/CAG48ez1jzNvxB+bfOBnERFGp=oMM0vHWuLD6EULmne3R6xa53w@mail.gmail.com/

Cc: Christian Brauner <christian.brauner@ubuntu.com>
Signed-off-by: Aleksa Sarai <cyphar@cyphar.com>
---
 fs/namei.c            | 10 +++++++---
 include/linux/namei.h |  3 ++-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index f0c15d2ace54..69cd0b296e8e 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -2299,13 +2299,16 @@ static const char *path_init(struct nameidata *nd, unsigned flags)
 
 	nd->m_seq = read_seqbegin(&mount_lock);
 
-	/* Figure out the starting path and root (if needed). */
-	if (*s == '/') {
+	/* Absolute pathname -- fetch the root (LOOKUP_IN_ROOT uses nd->dfd). */
+	if (*s == '/' && !(flags & LOOKUP_IN_ROOT)) {
 		error = nd_jump_root(nd);
 		if (unlikely(error))
 			return ERR_PTR(error);
 		return s;
-	} else if (nd->dfd == AT_FDCWD) {
+	}
+
+	/* Relative pathname -- get the starting-point it is relative to. */
+	if (nd->dfd == AT_FDCWD) {
 		if (flags & LOOKUP_RCU) {
 			struct fs_struct *fs = current->fs;
 			unsigned seq;
@@ -2345,6 +2348,7 @@ static const char *path_init(struct nameidata *nd, unsigned flags)
 		}
 		fdput(f);
 	}
+
 	/* For scoped-lookups we need to set the root to the dirfd as well. */
 	if (flags & LOOKUP_IS_SCOPED) {
 		nd->root = nd->path;
diff --git a/include/linux/namei.h b/include/linux/namei.h
index 93dad378f1e8..93151e47ec47 100644
--- a/include/linux/namei.h
+++ b/include/linux/namei.h
@@ -45,8 +45,9 @@ enum {LAST_NORM, LAST_ROOT, LAST_DOT, LAST_DOTDOT, LAST_BIND};
 #define LOOKUP_NO_MAGICLINKS	0x020000 /* No nd_jump_link() crossing. */
 #define LOOKUP_NO_XDEV		0x040000 /* No mountpoint crossing. */
 #define LOOKUP_BENEATH		0x080000 /* No escaping from starting point. */
+#define LOOKUP_IN_ROOT		0x100000 /* Treat dirfd as fs root. */
 /* LOOKUP_* flags which do scope-related checks based on the dirfd. */
-#define LOOKUP_IS_SCOPED LOOKUP_BENEATH
+#define LOOKUP_IS_SCOPED (LOOKUP_BENEATH | LOOKUP_IN_ROOT)
 
 extern int path_pts(struct path *path);
 
-- 
2.24.0

