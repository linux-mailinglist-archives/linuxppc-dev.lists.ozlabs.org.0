Return-Path: <linuxppc-dev+bounces-13379-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A737C1245B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 01:48:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwWsd396Xz3f4M;
	Tue, 28 Oct 2025 11:46:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761612404;
	cv=none; b=OV6JH0F4oLprYctxjp3iSSY1H4IBSnrFHvsmgcEBM3EAMroTZoOcNXjjxH2S5MjR/NgMSUxUrqIRe5EhjgW12u08suZri0RgFamP7SOr2CEoJk/Sf26lAOoCAd2HWyfTI0a1NwWnoTav95RghgiyHCF5ktbTOBR2arIamqdpEH6rmmNuZviYSXQlZ7l/zcpAli1zG/btP/6FrA10UzngdlGYZRDoSkk5dBOVJcZDKGCWLVpUMGNpsDjvaDU34EKj3ifrpZjfKCMiUFaYAw6y6E5O05xMaPHR/EnCorr4yw4xAdXYEhqey6drJ8LNL1T9s8zPFXz/x9IVEFwSNICagA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761612404; c=relaxed/relaxed;
	bh=VD4R3gUn11tbzuOSrLlHcr6CK6toCdQdVG0PoPu8WQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KaV+EF5X12F6sY7XMiO4oqN2/g10+WLVaQuJLPM6pnD+RkWidyQ+CNT1sbmjW9RYbZrlxrvvM1RwxRpcHf11uPOdm/7vwVC1rjkR5hMS3sD7fxBCbHOuyrLCSAwseu02q2P8m4GGafMhMseA2v0BEzlLkRcS8N7bvg97XB1n1dOmH3ecdMwCBC7PGsAvgSvbMITRFDX6NvPqrCAikcKOxxIEJDusbUdSfh8IGlcZeuducT2BkThTggbFvcZYcofxqh0N+BgR/oRqVr05wUhy+YmJyaOxNsZgcU+pMrsP59ONQeZ3lnbiIAgalSAh0HUqKrLl2TX8bCHSFMesbHytjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=a1Ou47jU; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=a1Ou47jU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwWsY6Jsgz3dXH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 11:46:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=VD4R3gUn11tbzuOSrLlHcr6CK6toCdQdVG0PoPu8WQM=; b=a1Ou47jUeDFPDyFuwMzS1mCZUD
	t4KSAdCbW8S0oXxyua9xCSIy5xSnMG+YugoYQEQs86rDE8nYyKYjvCHzS+nI5LqBcYi129ADzTFCk
	8J97IQGe12RNPvNE65YFEV/sc7YmlTc8FgbW9sm4WHyGoIt4F5ohMiEVIHREZGxXXSgU656MOLje7
	/GmObfB7I2zPX0ezu6D3E1HvYj5dLt+dIGNfqk6kH2v6u1i+uhNlkjCzwPTb80l7bGeHK3tVg30dp
	yhiPLC8K4uwvPWJ/+4G67Un8B6U5D3oTqzwaV+HjVkQrNeq+zZIGY80OEG0AkUFFQLxU8HtTC/0Lh
	/JT2lAUg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXqp-00000001eVu-0XWM;
	Tue, 28 Oct 2025 00:46:15 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-fsdevel@vger.kernel.org
Cc: torvalds@linux-foundation.org,
	brauner@kernel.org,
	jack@suse.cz,
	raven@themaw.net,
	miklos@szeredi.hu,
	neil@brown.name,
	a.hindborg@kernel.org,
	linux-mm@kvack.org,
	linux-efi@vger.kernel.org,
	ocfs2-devel@lists.linux.dev,
	kees@kernel.org,
	rostedt@goodmis.org,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	paul@paul-moore.com,
	casey@schaufler-ca.com,
	linuxppc-dev@lists.ozlabs.org,
	john.johansen@canonical.com,
	selinux@vger.kernel.org,
	borntraeger@linux.ibm.com,
	bpf@vger.kernel.org
Subject: [PATCH v2 05/50] introduce a flag for explicitly marking persistently pinned dentries
Date: Tue, 28 Oct 2025 00:45:24 +0000
Message-ID: <20251028004614.393374-6-viro@zeniv.linux.org.uk>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
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
Content-Transfer-Encoding: 8bit
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Some filesystems use a kinda-sorta controlled dentry refcount leak to pin
dentries of created objects in dcache (and undo it when removing those).
Reference is grabbed and not released, but it's not actually _stored_
anywhere.  That works, but it's hard to follow and verify; among other
things, we have no way to tell _which_ of the increments is intended
to be an unpaired one.  Worse, on removal we need to decide whether
the reference had already been dropped, which can be non-trivial if
that removal is on umount and we need to figure out if this dentry is
pinned due to e.g. unlink() not done.  Usually that is handled by using
kill_litter_super() as ->kill_sb(), but there are open-coded special
cases of the same (consider e.g. /proc/self).

Things get simpler if we introduce a new dentry flag (DCACHE_PERSISTENT)
marking those "leaked" dentries.  Having it set claims responsibility
for +1 in refcount.

The end result this series is aiming for:

* get these unbalanced dget() and dput() replaced with new primitives that
  would, in addition to adjusting refcount, set and clear persistency flag.
* instead of having kill_litter_super() mess with removing the remaining
  "leaked" references (e.g. for all tmpfs files that hadn't been removed
  prior to umount), have the regular shrink_dcache_for_umount() strip
  DCACHE_PERSISTENT of all dentries, dropping the corresponding
  reference if it had been set.  After that kill_litter_super() becomes
  an equivalent of kill_anon_super().

Doing that in a single step is not feasible - it would affect too many places
in too many filesystems.  It has to be split into a series.

Here we
	* introduce the new flag
	* teach shrink_dcache_for_umount() to handle it (i.e. remove
and drop refcount on anything that survives to umount with that flag
still set)
	* teach kill_litter_super() that anything with that flag does
*not* need to be unpinned.

Next commits will add primitives for maintaing that flag and convert the
common helpers to those.  After that - a long series of per-filesystem
patches converting to those primitives.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/dcache.c            | 27 ++++++++++++++++++++++-----
 include/linux/dcache.h |  1 +
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/fs/dcache.c b/fs/dcache.c
index 035cccbc9276..f2c9f4fef2a2 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -1511,6 +1511,15 @@ static enum d_walk_ret select_collect(void *_data, struct dentry *dentry)
 	return ret;
 }
 
+static enum d_walk_ret select_collect_umount(void *_data, struct dentry *dentry)
+{
+	if (dentry->d_flags & DCACHE_PERSISTENT) {
+		dentry->d_flags &= ~DCACHE_PERSISTENT;
+		dentry->d_lockref.count--;
+	}
+	return select_collect(_data, dentry);
+}
+
 static enum d_walk_ret select_collect2(void *_data, struct dentry *dentry)
 {
 	struct select_data *data = _data;
@@ -1539,18 +1548,20 @@ static enum d_walk_ret select_collect2(void *_data, struct dentry *dentry)
 }
 
 /**
- * shrink_dcache_parent - prune dcache
+ * shrink_dcache_tree - prune dcache
  * @parent: parent of entries to prune
+ * @for_umount: true if we want to unpin the persistent ones
  *
  * Prune the dcache to remove unused children of the parent dentry.
  */
-void shrink_dcache_parent(struct dentry *parent)
+static void shrink_dcache_tree(struct dentry *parent, bool for_umount)
 {
 	for (;;) {
 		struct select_data data = {.start = parent};
 
 		INIT_LIST_HEAD(&data.dispose);
-		d_walk(parent, &data, select_collect);
+		d_walk(parent, &data,
+			for_umount ? select_collect_umount : select_collect);
 
 		if (!list_empty(&data.dispose)) {
 			shrink_dentry_list(&data.dispose);
@@ -1575,6 +1586,11 @@ void shrink_dcache_parent(struct dentry *parent)
 			shrink_dentry_list(&data.dispose);
 	}
 }
+
+void shrink_dcache_parent(struct dentry *parent)
+{
+	shrink_dcache_tree(parent, false);
+}
 EXPORT_SYMBOL(shrink_dcache_parent);
 
 static enum d_walk_ret umount_check(void *_data, struct dentry *dentry)
@@ -1601,7 +1617,7 @@ static enum d_walk_ret umount_check(void *_data, struct dentry *dentry)
 
 static void do_one_tree(struct dentry *dentry)
 {
-	shrink_dcache_parent(dentry);
+	shrink_dcache_tree(dentry, true);
 	d_walk(dentry, dentry, umount_check);
 	d_drop(dentry);
 	dput(dentry);
@@ -3111,7 +3127,8 @@ static enum d_walk_ret d_genocide_kill(void *data, struct dentry *dentry)
 {
 	struct dentry *root = data;
 	if (dentry != root) {
-		if (d_unhashed(dentry) || !dentry->d_inode)
+		if (d_unhashed(dentry) || !dentry->d_inode ||
+		    dentry->d_flags & DCACHE_PERSISTENT)
 			return D_WALK_SKIP;
 
 		if (!(dentry->d_flags & DCACHE_GENOCIDE)) {
diff --git a/include/linux/dcache.h b/include/linux/dcache.h
index c83e02b94389..94b58655322a 100644
--- a/include/linux/dcache.h
+++ b/include/linux/dcache.h
@@ -225,6 +225,7 @@ enum dentry_flags {
 	DCACHE_PAR_LOOKUP		= BIT(24),	/* being looked up (with parent locked shared) */
 	DCACHE_DENTRY_CURSOR		= BIT(25),
 	DCACHE_NORCU			= BIT(26),	/* No RCU delay for freeing */
+	DCACHE_PERSISTENT		= BIT(27)
 };
 
 #define DCACHE_MANAGED_DENTRY \
-- 
2.47.3


