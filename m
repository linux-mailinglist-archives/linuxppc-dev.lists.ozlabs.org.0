Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C5AC2617
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 20:46:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hrwD12PrzDq77
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 04:46:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cyphar.com
 (client-ip=2001:67c:2050:104:0:2:25:2; helo=mx2.mailbox.org;
 envelope-from=cyphar@cyphar.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=cyphar.com
Received: from mx2.mailbox.org (mx2a.mailbox.org
 [IPv6:2001:67c:2050:104:0:2:25:2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hrhM5ZNCzDqNH
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2019 04:36:19 +1000 (AEST)
Received: from smtp2.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id E26AFA1889;
 Mon, 30 Sep 2019 20:36:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.240])
 by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de
 [80.241.56.116]) (amavisd-new, port 10030)
 with ESMTP id MmwYvW0_-1k4; Mon, 30 Sep 2019 20:36:10 +0200 (CEST)
From: Aleksa Sarai <cyphar@cyphar.com>
To: Al Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>,
 "J. Bruce Fields" <bfields@fieldses.org>, Arnd Bergmann <arnd@arndb.de>,
 David Howells <dhowells@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v13 5/9] namei: LOOKUP_IN_ROOT: chroot-like path resolution
Date: Tue,  1 Oct 2019 04:33:12 +1000
Message-Id: <20190930183316.10190-6-cyphar@cyphar.com>
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

The primary motivation for the need for this flag is container runtimes
which have to interact with malicious root filesystems in the host
namespaces. One of the first requirements for a container runtime to be
secure against a malicious rootfs is that they correctly scope symlinks
(that is, they should be scoped as though they are chroot(2)ed into the
container's rootfs) and ".."-style paths[*]. The already-existing
LOOKUP_NO_XDEV and LOOKUP_NO_MAGICLINKS help defend against other
potential attacks in a malicious rootfs scenario.

Currently most container runtimes try to do this resolution in
userspace[1], causing many potential race conditions. In addition, the
"obvious" alternative (actually performing a {ch,pivot_}root(2))
requires a fork+exec (for some runtimes) which is *very* costly if
necessary for every filesystem operation involving a container.

[*] At the moment, ".." and magic-link jumping are disallowed for the
    same reason it is disabled for LOOKUP_BENEATH -- currently it is not
    safe to allow it. Future patches may enable it unconditionally once
    we have resolved the possible races (for "..") and semantics (for
    magic-link jumping).

The most significant *at(2) semantic change with LOOKUP_IN_ROOT is that
absolute pathnames no longer cause the dirfd to be ignored completely.

The rationale is that LOOKUP_IN_ROOT must necessarily chroot-scope
symlinks with absolute paths to dirfd, and so doing it for the base path
seems to be the most consistent behaviour (and also avoids foot-gunning
users who want to scope paths that are absolute).

[1]: https://github.com/cyphar/filepath-securejoin

Signed-off-by: Aleksa Sarai <cyphar@cyphar.com>
---
 fs/namei.c            | 5 +++++
 include/linux/namei.h | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/namei.c b/fs/namei.c
index b80efc0ae0f3..efed62c6136e 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -2274,6 +2274,11 @@ static const char *path_init(struct nameidata *nd, unsigned flags)
 
 	nd->m_seq = read_seqbegin(&mount_lock);
 
+	/* LOOKUP_IN_ROOT treats absolute paths as being relative-to-dirfd. */
+	if (flags & LOOKUP_IN_ROOT)
+		while (*s == '/')
+			s++;
+
 	/* Figure out the starting path and root (if needed). */
 	if (*s == '/') {
 		error = nd_jump_root(nd);
diff --git a/include/linux/namei.h b/include/linux/namei.h
index 88b610ca4d83..1ace31052237 100644
--- a/include/linux/namei.h
+++ b/include/linux/namei.h
@@ -48,8 +48,9 @@ enum {LAST_NORM, LAST_ROOT, LAST_DOT, LAST_DOTDOT, LAST_BIND};
 #define LOOKUP_NO_MAGICLINKS	0x080000 /* No /proc/$pid/fd/ "symlink" crossing. */
 #define LOOKUP_NO_SYMLINKS	0x100000 /* No symlink crossing *at all*.
 					    Implies LOOKUP_NO_MAGICLINKS. */
+#define LOOKUP_IN_ROOT		0x200000 /* Treat dirfd as %current->fs->root. */
 /* LOOKUP_* flags which do scope-related checks based on the dirfd. */
-#define LOOKUP_DIRFD_SCOPE_FLAGS LOOKUP_BENEATH
+#define LOOKUP_DIRFD_SCOPE_FLAGS (LOOKUP_BENEATH | LOOKUP_IN_ROOT)
 
 extern int path_pts(struct path *path);
 
-- 
2.23.0

