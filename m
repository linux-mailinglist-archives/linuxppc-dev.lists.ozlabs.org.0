Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 464F47069A8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 15:22:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLv0N1D1hz3ftw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 23:22:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D1+6zXZH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D1+6zXZH;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLtp04YW0z3fHb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 23:13:12 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E6D6D642BB;
	Wed, 17 May 2023 13:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82ACBC433A1;
	Wed, 17 May 2023 13:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684329190;
	bh=d19FT2UXzed3oRWIfJJFjSTk/2JiLUfj9No4RlO7/6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D1+6zXZHFnxnG+wOAs+I7Jk3ZmwjP67pJgzP0uRLk1KweQErWDtrD6kcCaiJbOcnT
	 FeyForINJFNNHVR7SlZDLxBqXsy6U1Q8QSU2g7HzT+HDxANY+2tRRB/juS7IWqHnN0
	 R7uJEX9uIR2BJ1iVGwpgqVvJxOimPbuxDH8nVE33oigOLH+a2C6WGLVT5O2FBvlKz1
	 1cchN4Ol9FfjcJdHRvb6NG6ME/EGUJBb5JSRXXIOYIHDL60v7knAjAptFgq2qEdzKr
	 kBNHvdOcis7Z2szvD6pixKpaEvKxiNP2G0OykAdHnW8HCBkYh+jiZUMYx1rLc8DsBc
	 EwxZhq5xDzb7g==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 12/14] init: move cifs_root_data() prototype into linux/mount.h
Date: Wed, 17 May 2023 15:11:00 +0200
Message-Id: <20230517131102.934196-13-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517131102.934196-1-arnd@kernel.org>
References: <20230517131102.934196-1-arnd@kernel.org>
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
Cc: linux-kselftest@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Pavel Machek <pavel@ucw.cz>, Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Paul Moore <paul@paul-moore.com>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Dennis Zhou <dennis@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Waiman Long <longman@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Paris <eparis
 @redhat.com>, audit@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Tejun Heo <tj@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

cifs_root_data() is defined in cifs and called from early init
code, but lacks a global prototype:

fs/cifs/cifsroot.c:83:12: error: no previous prototype for 'cifs_root_data'

Move the declaration from do_mounts.c into an appropriate header.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/mount.h | 2 ++
 init/do_mounts.c      | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mount.h b/include/linux/mount.h
index 1ea326c368f7..f381eb44b24c 100644
--- a/include/linux/mount.h
+++ b/include/linux/mount.h
@@ -124,4 +124,6 @@ extern int iterate_mounts(int (*)(struct vfsmount *, void *), void *,
 			  struct vfsmount *);
 extern void kern_unmount_array(struct vfsmount *mnt[], unsigned int num);
 
+extern int cifs_root_data(char **dev, char **opts);
+
 #endif /* _LINUX_MOUNT_H */
diff --git a/init/do_mounts.c b/init/do_mounts.c
index 811e94daf0a8..83447c46ad6d 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -489,8 +489,6 @@ static int __init mount_nfs_root(void)
 
 #ifdef CONFIG_CIFS_ROOT
 
-extern int cifs_root_data(char **dev, char **opts);
-
 #define CIFSROOT_TIMEOUT_MIN	5
 #define CIFSROOT_TIMEOUT_MAX	30
 #define CIFSROOT_RETRY_MAX	5
-- 
2.39.2

