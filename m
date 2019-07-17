Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA136B43B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 04:00:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pL7r5r9HzDqbx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 12:00:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=sifive.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=palmer@sifive.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sifive.com header.i=@sifive.com header.b="DLAJM7oG"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pKRx4sFMzDqWN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2019 11:29:17 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id c14so11018619plo.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 18:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=Km6i2EwlnHTMsEa+Chc8B8lkJXrzGe+ncWgEI0oBDH8=;
 b=DLAJM7oG3ybeUmclWPVZfMhBUnRrw9wGMdXduIn2giXhaGrJ7S5W8yVcEE2KwLFQAh
 D1fm8Qfvlg4+vU/wK9eEo2SBWGFnrW2QH4msqzaJa2F5Mqtk545ueU4VzXlO2Pka91aE
 0ZIjIFL3MsFSMfhP6hasIsWi+LC5nQsPKwISrpKwFjetWndP1gu0y7RwT7xlLsYYY3bX
 aA9+vRQ2Jy/EGfc2fUemHwW+nDNJKVxhk9EQMc/dKQv4LICHm3AoRl9JnxONdNyJNxBk
 BKPc4PBCTZeLcTJbqW33HPUobtx12bsfbsrHt2Ek4XDY+qdDSWFBlI6LBq/1RrDbWAwT
 fAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=Km6i2EwlnHTMsEa+Chc8B8lkJXrzGe+ncWgEI0oBDH8=;
 b=B+gCeaCYolVVY+StFSgUNtluAcNZIb5X664vQqPIN983D/pMTnAMwy8aBEBV6t8rA7
 SQMLY4qFOMyOf4GY2numWoh5gEMNmWJT0nD2+pV8q/SKyXyJ5H4g7RMcAWIs3fbR2WCr
 cMFsW9lx6kHXKQ3zLl12wc+FfWRwRM4+nXVP4KT6sX3+vhN4DraDqHbg9YUXLDuc5YiQ
 EMRykDRUkLe4Dy3VkPA0FT5giLV7Kl8fysIZfQWPABqTU45wYm2E60vUeA2k3XrCT2kX
 ib5l4sA6Xokok2/dvlCn4zv2OB9aSgdOY81KdTtUKprmrZFLrV9Be4z4sbIzRnAPQGNI
 iPlw==
X-Gm-Message-State: APjAAAUOZCENPf/6ivVbzSYPPAQpAv/m5FJGugJvw2gBB3++UsbHFnzG
 L4nbRerWuEn2Y8pxya3zqf7oGA==
X-Google-Smtp-Source: APXvYqy1hMVJ/bl9aSMVuTE5nvwz4oMGbsdCr+A6D4NXU76rmJy3i+4M2pUivduNcdb15I23YjfxXQ==
X-Received: by 2002:a17:902:ba96:: with SMTP id
 k22mr40372539pls.44.1563326954956; 
 Tue, 16 Jul 2019 18:29:14 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id s11sm20793710pgv.13.2019.07.16.18.29.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 18:29:14 -0700 (PDT)
Subject: [PATCH v2 2/4] Add fchmodat4(), a new syscall
Date: Tue, 16 Jul 2019 18:27:17 -0700
Message-Id: <20190717012719.5524-3-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190717012719.5524-1-palmer@sifive.com>
References: <20190717012719.5524-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@sifive.com>
To: viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
X-Mailman-Approved-At: Wed, 17 Jul 2019 11:58:47 +1000
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 peterz@infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 heiko.carstens@de.ibm.com, stefan@agner.ch,
 James.Bottomley@HansenPartnership.com, namhyung@kernel.org,
 kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com,
 sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, hare@suse.com, Arnd Bergmann <arnd@arndb.de>,
 ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org,
 linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com,
 geert@linux-m68k.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, jhogan@kernel.org, firoz.khan@linaro.org,
 mattst88@gmail.com, fenghua.yu@intel.com, gor@linux.ibm.com, jolsa@redhat.com,
 tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org,
 ink@jurassic.park.msu.ru, luto@kernel.org, alexander.shishkin@linux.intel.com,
 tglx@linutronix.de, christian@brauner.io, rth@twiddle.net, axboe@kernel.dk,
 dhowells@redhat.com, monstr@monstr.eu, tony.luck@intel.com,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, ralf@linux-mips.org,
 paul.burton@mips.com, linux-alpha@vger.kernel.org, schwidefsky@de.ibm.com,
 bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

man 3p says that fchmodat() takes a flags argument, but the Linux
syscall does not.  There doesn't appear to be a good userspace
workaround for this issue but the implementation in the kernel is pretty
straight-forward.  The specific use case where the missing flags came up
was WRT a fuse filesystem implemenation, but the functionality is pretty
generic so I'm assuming there would be other use cases.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 fs/open.c                | 20 ++++++++++++++++----
 include/linux/syscalls.h |  7 +++++--
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/fs/open.c b/fs/open.c
index b5b80469b93d..2f72b4d6a2c1 100644
--- a/fs/open.c
+++ b/fs/open.c
@@ -569,11 +569,17 @@ SYSCALL_DEFINE2(fchmod, unsigned int, fd, umode_t, mode)
 	return ksys_fchmod(fd, mode);
 }
 
-int do_fchmodat(int dfd, const char __user *filename, umode_t mode)
+int do_fchmodat4(int dfd, const char __user *filename, umode_t mode, int flags)
 {
 	struct path path;
 	int error;
-	unsigned int lookup_flags = LOOKUP_FOLLOW;
+	unsigned int lookup_flags;
+
+	if (unlikely(flags & ~AT_SYMLINK_NOFOLLOW))
+		return -EINVAL;
+
+	lookup_flags = flags & AT_SYMLINK_NOFOLLOW ? 0 : LOOKUP_FOLLOW;
+
 retry:
 	error = user_path_at(dfd, filename, lookup_flags, &path);
 	if (!error) {
@@ -587,15 +593,21 @@ int do_fchmodat(int dfd, const char __user *filename, umode_t mode)
 	return error;
 }
 
+SYSCALL_DEFINE4(fchmodat4, int, dfd, const char __user *, filename,
+		umode_t, mode, int, flags)
+{
+	return do_fchmodat4(dfd, filename, mode, flags);
+}
+
 SYSCALL_DEFINE3(fchmodat, int, dfd, const char __user *, filename,
 		umode_t, mode)
 {
-	return do_fchmodat(dfd, filename, mode);
+	return do_fchmodat4(dfd, filename, mode, 0);
 }
 
 SYSCALL_DEFINE2(chmod, const char __user *, filename, umode_t, mode)
 {
-	return do_fchmodat(AT_FDCWD, filename, mode);
+	return do_fchmodat4(AT_FDCWD, filename, mode, 0);
 }
 
 static int chown_common(const struct path *path, uid_t user, gid_t group)
diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index e1c20f1d0525..a4bde25ad264 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -433,6 +433,8 @@ asmlinkage long sys_chroot(const char __user *filename);
 asmlinkage long sys_fchmod(unsigned int fd, umode_t mode);
 asmlinkage long sys_fchmodat(int dfd, const char __user *filename,
 			     umode_t mode);
+asmlinkage long sys_fchmodat4(int dfd, const char __user *filename,
+			     umode_t mode, int flags);
 asmlinkage long sys_fchownat(int dfd, const char __user *filename, uid_t user,
 			     gid_t group, int flag);
 asmlinkage long sys_fchown(unsigned int fd, uid_t user, gid_t group);
@@ -1320,11 +1322,12 @@ static inline long ksys_link(const char __user *oldname,
 	return do_linkat(AT_FDCWD, oldname, AT_FDCWD, newname, 0);
 }
 
-extern int do_fchmodat(int dfd, const char __user *filename, umode_t mode);
+extern int do_fchmodat4(int dfd, const char __user *filename, umode_t mode,
+			int flags);
 
 static inline int ksys_chmod(const char __user *filename, umode_t mode)
 {
-	return do_fchmodat(AT_FDCWD, filename, mode);
+	return do_fchmodat4(AT_FDCWD, filename, mode, 0);
 }
 
 extern long do_faccessat(int dfd, const char __user *filename, int mode);
-- 
2.21.0

