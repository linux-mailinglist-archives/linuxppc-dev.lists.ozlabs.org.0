Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C08FE9F6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 01:57:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47FGyZ5yVtzF4RN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 11:57:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cyphar.com (client-ip=80.241.56.172; helo=mout-p-202.mailbox.org;
 envelope-from=cyphar@cyphar.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=cyphar.com
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47FGRG176ZzF5XK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2019 11:33:30 +1100 (AEDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 47FGRB6JZbzQlC3;
 Sat, 16 Nov 2019 01:33:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
 [80.241.56.117]) (amavisd-new, port 10030)
 with ESMTP id YEkgPeX8z_f3; Sat, 16 Nov 2019 01:33:22 +0100 (CET)
From: Aleksa Sarai <cyphar@cyphar.com>
To: Al Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>,
 "J. Bruce Fields" <bfields@fieldses.org>, Arnd Bergmann <arnd@arndb.de>,
 David Howells <dhowells@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
 Andrii Nakryiko <andriin@fb.com>
Subject: [PATCH v16 12/12] Documentation: path-lookup: include new LOOKUP flags
Date: Sat, 16 Nov 2019 11:28:02 +1100
Message-Id: <20191116002802.6663-13-cyphar@cyphar.com>
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

Now that we have new LOOKUP flags, we should document them in the
relevant path-walking documentation. And now that we've settled on a
common name for nd_jump_link() style symlinks ("magic links"), use that
term where magic-link semantics are described.

Signed-off-by: Aleksa Sarai <cyphar@cyphar.com>
---
 Documentation/filesystems/path-lookup.rst | 68 +++++++++++++++++++++--
 1 file changed, 62 insertions(+), 6 deletions(-)

diff --git a/Documentation/filesystems/path-lookup.rst b/Documentation/filesystems/path-lookup.rst
index 434a07b0002b..a3216979298b 100644
--- a/Documentation/filesystems/path-lookup.rst
+++ b/Documentation/filesystems/path-lookup.rst
@@ -13,6 +13,7 @@ It has subsequently been updated to reflect changes in the kernel
 including:
 
 - per-directory parallel name lookup.
+- ``openat2()`` resolution restriction flags.
 
 Introduction to pathname lookup
 ===============================
@@ -235,6 +236,13 @@ renamed.  If ``d_lookup`` finds that a rename happened while it
 unsuccessfully scanned a chain in the hash table, it simply tries
 again.
 
+``rename_lock`` is also used to detect and defend against potential attacks
+against ``LOOKUP_BENEATH`` and ``LOOKUP_IN_ROOT`` when resolving ".." (where
+the parent directory is moved outside the root, bypassing the ``path_equal()``
+check). If ``rename_lock`` is updated during the lookup and the path encounters
+a "..", a potential attack occurred and ``handle_dots()`` will bail out with
+``-EAGAIN``.
+
 inode->i_rwsem
 ~~~~~~~~~~~~~~
 
@@ -348,6 +356,13 @@ any changes to any mount points while stepping up.  This locking is
 needed to stabilize the link to the mounted-on dentry, which the
 refcount on the mount itself doesn't ensure.
 
+``mount_lock`` is also used to detect and defend against potential attacks
+against ``LOOKUP_BENEATH`` and ``LOOKUP_IN_ROOT`` when resolving ".." (where
+the parent directory is moved outside the root, bypassing the ``path_equal()``
+check). If ``mount_lock`` is updated during the lookup and the path encounters
+a "..", a potential attack occurred and ``handle_dots()`` will bail out with
+``-EAGAIN``.
+
 RCU
 ~~~
 
@@ -405,6 +420,10 @@ is requested.  Keeping a reference in the ``nameidata`` ensures that
 only one root is in effect for the entire path walk, even if it races
 with a ``chroot()`` system call.
 
+It should be noted that in the case of ``LOOKUP_IN_ROOT`` or
+``LOOKUP_BENEATH``, the effective root becomes the directory file descriptor
+passed to ``openat2()`` (which exposes these ``LOOKUP_`` flags).
+
 The root is needed when either of two conditions holds: (1) either the
 pathname or a symbolic link starts with a "'/'", or (2) a "``..``"
 component is being handled, since "``..``" from the root must always stay
@@ -1149,7 +1168,7 @@ so ``NULL`` is returned to indicate that the symlink can be released and
 the stack frame discarded.
 
 The other case involves things in ``/proc`` that look like symlinks but
-aren't really::
+aren't really (and are therefore commonly referred to as "magic-links")::
 
      $ ls -l /proc/self/fd/1
      lrwx------ 1 neilb neilb 64 Jun 13 10:19 /proc/self/fd/1 -> /dev/pts/4
@@ -1286,7 +1305,9 @@ A few flags
 A suitable way to wrap up this tour of pathname walking is to list
 the various flags that can be stored in the ``nameidata`` to guide the
 lookup process.  Many of these are only meaningful on the final
-component, others reflect the current state of the pathname lookup.
+component, others reflect the current state of the pathname lookup, and some
+apply restrictions to all path components encountered in the path lookup.
+
 And then there is ``LOOKUP_EMPTY``, which doesn't fit conceptually with
 the others.  If this is not set, an empty pathname causes an error
 very early on.  If it is set, empty pathnames are not considered to be
@@ -1310,13 +1331,48 @@ longer needed.
 ``LOOKUP_JUMPED`` means that the current dentry was chosen not because
 it had the right name but for some other reason.  This happens when
 following "``..``", following a symlink to ``/``, crossing a mount point
-or accessing a "``/proc/$PID/fd/$FD``" symlink.  In this case the
-filesystem has not been asked to revalidate the name (with
-``d_revalidate()``).  In such cases the inode may still need to be
-revalidated, so ``d_op->d_weak_revalidate()`` is called if
+or accessing a "``/proc/$PID/fd/$FD``" symlink (also known as a "magic
+link"). In this case the filesystem has not been asked to revalidate the
+name (with ``d_revalidate()``).  In such cases the inode may still need
+to be revalidated, so ``d_op->d_weak_revalidate()`` is called if
 ``LOOKUP_JUMPED`` is set when the look completes - which may be at the
 final component or, when creating, unlinking, or renaming, at the penultimate component.
 
+Resolution-restriction flags
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+In order to allow userspace to protect itself against certain race conditions
+and attack scenarios involving changing path components, a series of flags are
+available which apply restrictions to all path components encountered during
+path lookup. These flags are exposed through ``openat2()``'s ``resolve`` field.
+
+``LOOKUP_NO_SYMLINKS`` blocks all symlink traversals (including magic-links).
+This is distinctly different from ``LOOKUP_FOLLOW``, because the latter only
+relates to restricting the following of trailing symlinks.
+
+``LOOKUP_NO_MAGICLINKS`` blocks all magic-link traversals. Filesystems must
+ensure that they return errors from ``nd_jump_link()``, because that is how
+``LOOKUP_NO_MAGICLINKS`` and other magic-link restrictions are implemented.
+
+``LOOKUP_NO_XDEV`` blocks all ``vfsmount`` traversals (this includes both
+bind-mounts and ordinary mounts). Note that the ``vfsmount`` which contains the
+lookup is determined by the first mountpoint the path lookup reaches --
+absolute paths start with the ``vfsmount`` of ``/``, and relative paths start
+with the ``dfd``'s ``vfsmount``. Magic-links are only permitted if the
+``vfsmount`` of the path is unchanged.
+
+``LOOKUP_BENEATH`` blocks any path components which resolve outside the
+starting point of the resolution. This is done by blocking ``nd_jump_root()``
+as well as blocking ".." if it would jump outside the starting point.
+``rename_lock`` and ``mount_lock`` are used to detect attacks against the
+resolution of "..". Magic-links are also blocked.
+
+``LOOKUP_IN_ROOT`` resolves all path components as though the starting point
+were the filesystem root. ``nd_jump_root()`` brings the resolution back to to
+the starting point, and ".." at the starting point will act as a no-op. As with
+``LOOKUP_BENEATH``, ``rename_lock`` and ``mount_lock`` are used to detect
+attacks against ".." resolution. Magic-links are also blocked.
+
 Final-component flags
 ~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.24.0

