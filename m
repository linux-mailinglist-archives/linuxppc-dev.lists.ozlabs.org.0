Return-Path: <linuxppc-dev+bounces-13799-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A5DC35E32
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 14:43:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1mkT4h2lz3bt9;
	Thu,  6 Nov 2025 00:43:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762350225;
	cv=none; b=SnX/d37rt2jTqwe4DZtlH9ae6r7+Dx6ossN7/Ca4liUqrL6hd4qt64H3k1I4PqMgp3tZoFCCOOrtCd83+oC4ag12qruE/h0LA3kvhxzF7TKcI+5ewIfhPWIMwla/J1P0PLv7gVJ+TXpa42ysqdl1H31j0OO41MpM6S2XXyZpBXV+UaNkmxUNK6q5ADf6Ty0d+XX69sVUa/MAYAnwd4RyLyVVtRXYkdq9Gmlq7ri+H8dPGbvNopu1d0rd36tCrCP6tF7hZ1AU3Vukj8ObmOMhuoE8lsnlFH2UN1+zmEol+NSh5/Zqz0praDG86HsVvyrazSGC6bq1o3JWG16yz35GDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762350225; c=relaxed/relaxed;
	bh=zbQ1zGlZoO5t6WJhk008TtHvwsuYoe3z8ySO8zHx9/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ov3cHDTc4pE0oiyOJDUOUlUwYju4MeI8dJG/CmY34MFY881YdVQVUf60xRnuh4Wpij6DqTwZ2TThl6+XZKv/M1r1M4uxYtDYOwcz/k74NXtZnRHX4NaZBLxo7TjJ6EL8iLaWgXLVGeYU6IiT4zXJiU9uhAexsRaRt81y1/K6M8qW8ndv83DHpzhbBisn0v1VBgg+TdVV7elm6bPxJxovnMb4wE/1+cdKYLPVi3T3DJjaD+ZTzwbwwq0A8mu7Ng6bk5FHdRyszcxzLTeJrAgsyfmJHn9tZQxmyU40oqowFtbUBK3TnmUURRq8eWt7VPmG0/Ydp2UmoAi8h4yK1dJKSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gpK+52Q3; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gpK+52Q3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1mkS4Ht6z3bmk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 00:43:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1697C43B6F;
	Wed,  5 Nov 2025 13:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F06F8C116C6;
	Wed,  5 Nov 2025 13:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762350222;
	bh=Y4z+9e1UwC5T6z0wCgNZeZRbf0AM/5FfB8YJzrR21hU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gpK+52Q3omkUnkccjIvVZ+YRsgCuvNHfYI3MIjZdom3SQlkvCxWrDKlJ/warJWlfU
	 E2F8IQSoapfPbPkoeT1aoiEswcoh02gGX8oBXwk3gRHNyBeZUHUeUo+b4cr6I294iw
	 tBcxcaaq3YbSyuRjslKl88dOXL+Cy2viJZ7P25mEP2+E9ZcmFOfYi+ATgSngL6gv9n
	 v2XP08JIGf50Xp2be3XMK7gODkPeWhvGs+zC9MmCzInGZQRHdIk2nCtC0hWYBwb9+G
	 qTgu9snAFyspbiug6v3NCj2Qye16mxq7V5yOexSp8bqBCZO8FEinxKzWUVj4KRIRVG
	 zY/fGjNUXwlZA==
Date: Wed, 5 Nov 2025 14:43:34 +0100
From: Christian Brauner <brauner@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org, jack@suse.cz, raven@themaw.net, 
	miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org, linux-mm@kvack.org, 
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, kees@kernel.org, 
	rostedt@goodmis.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	paul@paul-moore.com, casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, borntraeger@linux.ibm.com, 
	bpf@vger.kernel.org
Subject: Re: [PATCH v2 22/50] convert efivarfs
Message-ID: <20251105-vorbild-zutreffen-fe00d1dd98db@brauner>
References: <66300d81c5e127e3bca8c6c4d997da386b142004.camel@HansenPartnership.com>
 <20251028174540.GN2441659@ZenIV>
 <20251028210805.GP2441659@ZenIV>
 <CAMj1kXF6tvg6+CL_1x7h0HK1PoSGtxDjc0LQ1abGQBd5qrbffg@mail.gmail.com>
 <9f079d0c8cffb150c0decb673a12bfe1b835efc9.camel@HansenPartnership.com>
 <20251029193755.GU2441659@ZenIV>
 <CAMj1kXHnEq97bzt-C=zKJdV3BK3EDJCPz3Pfyk52p2735-4wFA@mail.gmail.com>
 <20251105-aufheben-ausmusterung-4588dab8c585@brauner>
 <423f5cc5352c54fc21e0570daeeddc4a58e74974.camel@HansenPartnership.com>
 <20251105-sohlen-fenster-e7c5af1204c4@brauner>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="buvkja4jscyxhqel"
Content-Disposition: inline
In-Reply-To: <20251105-sohlen-fenster-e7c5af1204c4@brauner>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--buvkja4jscyxhqel
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

> > > And suspend/resume works just fine with freeze/thaw. See commit
> > > eacfbf74196f ("power: freeze filesystems during suspend/resume")
> > > which implements exactly that.
> > > 
> > > The reason this didn't work for you is very likely:
> > > 
> > > cat /sys/power/freeze_filesystems
> > > 0
> > > 
> > > which you must set to 1.
> > 
> > Actually, no, that's not correct.  The efivarfs freeze/thaw logic must
> > run unconditionally regardless of this setting to fix the systemd bug,
> > so all the variable resyncing is done in the thaw call, which isn't
> > conditioned on the above (or at least it shouldn't be).
> 
> It is conditioned on the above currently but we can certainly fix it
> easily to not be.

Something like the appended patch would do it.

--buvkja4jscyxhqel
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment;
	filename="0001-power-always-freeze-efivarfs.patch"

From 1f9dc293cebb10b18d9ec8e01b60c014664c98ab Mon Sep 17 00:00:00 2001
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 5 Nov 2025 14:39:45 +0100
Subject: [PATCH] power: always freeze efivarfs

The efivarfs filesystems must always be frozen and thawed to resync
variable state. Make it so.

Signed-off-by: Christian Brauner <brauner@kernel.org>
---
 fs/efivarfs/super.c      |  1 +
 fs/super.c               | 14 +++++++++++---
 include/linux/fs.h       |  3 ++-
 kernel/power/hibernate.c |  9 +++------
 kernel/power/suspend.c   |  3 +--
 5 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/fs/efivarfs/super.c b/fs/efivarfs/super.c
index 1f4d8ce56667..6f9cd18ce6f0 100644
--- a/fs/efivarfs/super.c
+++ b/fs/efivarfs/super.c
@@ -512,6 +512,7 @@ static int efivarfs_init_fs_context(struct fs_context *fc)
 	sfi->mount_opts.gid = GLOBAL_ROOT_GID;
 
 	fc->s_fs_info = sfi;
+	fc->s_iflags |= SB_I_FREEZE_POWER;
 	fc->ops = &efivarfs_context_ops;
 
 	return 0;
diff --git a/fs/super.c b/fs/super.c
index 5bab94fb7e03..017f0be22c61 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -1183,11 +1183,19 @@ static inline bool get_active_super(struct super_block *sb)
 
 static const char *filesystems_freeze_ptr = "filesystems_freeze";
 
-static void filesystems_freeze_callback(struct super_block *sb, void *unused)
+static void filesystems_freeze_callback(struct super_block *sb, void *bool_freeze_all)
 {
+	bool freeze_all = *(bool *)bool_freeze_all;
+
 	if (!sb->s_op->freeze_fs && !sb->s_op->freeze_super)
 		return;
 
+	if (!freeze_all) {
+		if (!(sb->s_iflags & SB_I_FREEZE_POWER))
+			return;
+		pr_info("VFS: Freezing %s filesystems\n", sb->s_type->name);
+	}
+
 	if (!get_active_super(sb))
 		return;
 
@@ -1201,9 +1209,9 @@ static void filesystems_freeze_callback(struct super_block *sb, void *unused)
 	deactivate_super(sb);
 }
 
-void filesystems_freeze(void)
+void filesystems_freeze(bool freeze_all)
 {
-	__iterate_supers(filesystems_freeze_callback, NULL,
+	__iterate_supers(filesystems_freeze_callback, &freeze_all,
 			 SUPER_ITER_UNLOCKED | SUPER_ITER_REVERSE);
 }
 
diff --git a/include/linux/fs.h b/include/linux/fs.h
index c895146c1444..bde4967fdb68 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1419,6 +1419,7 @@ extern int send_sigurg(struct file *file);
 #define SB_I_NOUMASK	0x00001000	/* VFS does not apply umask */
 #define SB_I_NOIDMAP	0x00002000	/* No idmapped mounts on this superblock */
 #define SB_I_ALLOW_HSM	0x00004000	/* Allow HSM events on this superblock */
+#define SB_I_FREEZE_POWER	0x00008000	/* Always freeze on suspend/hibernate */
 
 /* Possible states of 'frozen' field */
 enum {
@@ -3606,7 +3607,7 @@ extern void drop_super_exclusive(struct super_block *sb);
 extern void iterate_supers(void (*f)(struct super_block *, void *), void *arg);
 extern void iterate_supers_type(struct file_system_type *,
 			        void (*)(struct super_block *, void *), void *);
-void filesystems_freeze(void);
+void filesystems_freeze(bool freeze_all);
 void filesystems_thaw(void);
 
 extern int dcache_dir_open(struct inode *, struct file *);
diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index 14e85ff23551..1f250ce036a0 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -825,8 +825,7 @@ int hibernate(void)
 		goto Restore;
 
 	ksys_sync_helper();
-	if (filesystem_freeze_enabled)
-		filesystems_freeze();
+	filesystems_freeze(filesystem_freeze_enabled);
 
 	error = freeze_processes();
 	if (error)
@@ -932,8 +931,7 @@ int hibernate_quiet_exec(int (*func)(void *data), void *data)
 	if (error)
 		goto restore;
 
-	if (filesystem_freeze_enabled)
-		filesystems_freeze();
+	filesystems_freeze(filesystem_freeze_enabled);
 
 	error = freeze_processes();
 	if (error)
@@ -1083,8 +1081,7 @@ static int software_resume(void)
 	if (error)
 		goto Restore;
 
-	if (filesystem_freeze_enabled)
-		filesystems_freeze();
+	filesystems_freeze(filesystem_freeze_enabled);
 
 	pm_pr_dbg("Preparing processes for hibernation restore.\n");
 	error = freeze_processes();
diff --git a/kernel/power/suspend.c b/kernel/power/suspend.c
index 4bb4686c1c08..c933a63a9718 100644
--- a/kernel/power/suspend.c
+++ b/kernel/power/suspend.c
@@ -375,8 +375,7 @@ static int suspend_prepare(suspend_state_t state)
 	if (error)
 		goto Restore;
 
-	if (filesystem_freeze_enabled)
-		filesystems_freeze();
+	filesystems_freeze(filesystem_freeze_enabled);
 	trace_suspend_resume(TPS("freeze_processes"), 0, true);
 	error = suspend_freeze_processes();
 	trace_suspend_resume(TPS("freeze_processes"), 0, false);
-- 
2.47.3


--buvkja4jscyxhqel--

