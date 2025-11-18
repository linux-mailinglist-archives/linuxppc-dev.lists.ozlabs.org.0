Return-Path: <linuxppc-dev+bounces-14250-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B44BC67621
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 06:18:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9XsF45QBz3dLW;
	Tue, 18 Nov 2025 16:16:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763442991;
	cv=none; b=J7OC7aSLPlQE3qZZGZr9A9YeT507iz6IaaOWLjqfPxVuj+KwFMjSeptP5rwMrA9C4WAjOlp9BHFPsYGsgatTjEwvEV3sKAJOjc67F8idDLxSIVYl7aQRO9Q04tgFPNjXhYO9Wahg8jLOiZvNAoUZF6va8Z7dPbvyokUgy+USA1yW7zocI7/9bAiWWB+b2E4Vx9eMTwOos1vwH7Nx9CbYp4mHOyigYjtbiWcKIlGnPIl7BKcG6K7XnnSqx7PfqiFX0ymApr1bCaKpBayyegTPJuYnmNVX+p5bruaGm21WQMbAZMk+2Qb5EUWHAwiSkzvccJRHbMFYTSvD9dQTWASZhA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763442991; c=relaxed/relaxed;
	bh=0rQmwI4wUCW4CFIUjCTrKY3EBmJE6MZ3qh3WAaCxCww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mFE/9iqfJd+MxzMz9F1CMIR63BmWI0POr/Ut6o9nQ8PNy9kNos6PpnHIixiTfM/U1mBvPn/F2uaCzhat3YfogqjGak7pgQoZX9vAlfj2CoGh+FKdtEb2mIEv08LMIvG7fi+RDR40gx/iJjXJRAI4S7VNjzbAQmwPgClCZg7Lj5j9Fn0sYuiqmeS37ZOwDphcHWnssa+sY8+E/DQPaKlZeDcf5YkXN9ChL7Vo+bAYErbsK9gCOpZcQ9B863BqAmVOc/zbvLNAISevlvzd/XDFPfSWIA8mw10EWDe5yXp5N9feVE3W2OanDMd7/016JpOBGdc0nRVl78cWUBb804dBdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=uNtO1O3U; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=uNtO1O3U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9Xrz15PRz30Vn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 16:16:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=0rQmwI4wUCW4CFIUjCTrKY3EBmJE6MZ3qh3WAaCxCww=; b=uNtO1O3UM5XYJjR3Umb/AXtuAE
	/UaVKUHdbF8Jill3VqnkLbxn+dF+p6/2J2YFKutdv2Vj3cvpIq/UnA4DO+2r+wMB0syfw/5nBy+8q
	ppfqRdgCIKNrgI+PIoRP+NvE7e06iT5cHoc07dEMGZEdbOmLw1m6BQsD8Aj33fgnviMSZiudPYfr4
	mjlljUw8qilUEgPq8n01ak+owUb5kGcLdWGIst9/tjfsn5UdEn1vJ7Kh+sI3mhKfybxBIBDoK0ytj
	O5KFqSQNLOkojNyRWyb/K5UkmBcgeObcaoX8o/JzeixcH52uP1EJXYKoLTdpsFqKOUok6+qndXJqw
	9bMS8P8Q==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLE4T-0000000GEQ9-2sGp;
	Tue, 18 Nov 2025 05:16:05 +0000
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
	bpf@vger.kernel.org,
	clm@meta.com
Subject: [PATCH v4 06/54] primitives for maintaining persisitency
Date: Tue, 18 Nov 2025 05:15:15 +0000
Message-ID: <20251118051604.3868588-7-viro@zeniv.linux.org.uk>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251118051604.3868588-1-viro@zeniv.linux.org.uk>
References: <20251118051604.3868588-1-viro@zeniv.linux.org.uk>
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

* d_make_persistent(dentry, inode) - bump refcount, mark persistent and
make hashed positive.  Return value is a borrowed reference to dentry;
it can be used until something removes persistency (at the very least,
until the parent gets unlocked, but some filesystems may have stronger
exclusion).

* d_make_discardable() - remove persistency mark and drop reference.

d_make_persistent() is similar to combination of d_instantiate(), dget()
and setting flag.  The only difference is that unlike d_instantiate()
it accepts hashed and unhashed negatives alike.  It is always called in
strong locking environment (parent held exclusive, or, in some cases,
dentry coming from d_alloc_name()); if we ever start using it with parent
held only shared and dentry coming from d_alloc_parallel(), we'll need
to copy the in-lookup logics from __d_add().

d_make_discardable() is eqiuvalent to combination of removing flag and
dput(); since flag removal requires ->d_lock, there's no point trying
to avoid taking that for refcount decrement as fast_dput() does.
The slow path of dput() has been taken into a helper and reused in
d_make_discardable() instead.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/dcache.c            | 74 +++++++++++++++++++++++++++++++++---------
 include/linux/dcache.h |  2 ++
 2 files changed, 61 insertions(+), 15 deletions(-)

diff --git a/fs/dcache.c b/fs/dcache.c
index f2c9f4fef2a2..3cc6c3876177 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -869,6 +869,24 @@ static inline bool fast_dput(struct dentry *dentry)
 	return false;
 }
 
+static void finish_dput(struct dentry *dentry)
+	__releases(dentry->d_lock)
+	__releases(RCU)
+{
+	while (lock_for_kill(dentry)) {
+		rcu_read_unlock();
+		dentry = __dentry_kill(dentry);
+		if (!dentry)
+			return;
+		if (retain_dentry(dentry, true)) {
+			spin_unlock(&dentry->d_lock);
+			return;
+		}
+		rcu_read_lock();
+	}
+	rcu_read_unlock();
+	spin_unlock(&dentry->d_lock);
+}
 
 /* 
  * This is dput
@@ -906,22 +924,28 @@ void dput(struct dentry *dentry)
 		rcu_read_unlock();
 		return;
 	}
-	while (lock_for_kill(dentry)) {
-		rcu_read_unlock();
-		dentry = __dentry_kill(dentry);
-		if (!dentry)
-			return;
-		if (retain_dentry(dentry, true)) {
-			spin_unlock(&dentry->d_lock);
-			return;
-		}
-		rcu_read_lock();
-	}
-	rcu_read_unlock();
-	spin_unlock(&dentry->d_lock);
+	finish_dput(dentry);
 }
 EXPORT_SYMBOL(dput);
 
+void d_make_discardable(struct dentry *dentry)
+{
+	spin_lock(&dentry->d_lock);
+	/*
+	 * By the end of the series we'll add
+	 * WARN_ON(!(dentry->d_flags & DCACHE_PERSISTENT);
+	 * here, but while object removal is done by a few common helpers,
+	 * object creation tends to be open-coded (if nothing else, new inode
+	 * needs to be set up), so adding a warning from the very beginning
+	 * would make for much messier patch series.
+	 */
+	dentry->d_flags &= ~DCACHE_PERSISTENT;
+	dentry->d_lockref.count--;
+	rcu_read_lock();
+	finish_dput(dentry);
+}
+EXPORT_SYMBOL(d_make_discardable);
+
 static void to_shrink_list(struct dentry *dentry, struct list_head *list)
 __must_hold(&dentry->d_lock)
 {
@@ -1939,7 +1963,6 @@ static void __d_instantiate(struct dentry *dentry, struct inode *inode)
 	unsigned add_flags = d_flags_for_inode(inode);
 	WARN_ON(d_in_lookup(dentry));
 
-	spin_lock(&dentry->d_lock);
 	/*
 	 * The negative counter only tracks dentries on the LRU. Don't dec if
 	 * d_lru is on another list.
@@ -1952,7 +1975,6 @@ static void __d_instantiate(struct dentry *dentry, struct inode *inode)
 	__d_set_inode_and_type(dentry, inode, add_flags);
 	raw_write_seqcount_end(&dentry->d_seq);
 	fsnotify_update_flags(dentry);
-	spin_unlock(&dentry->d_lock);
 }
 
 /**
@@ -1976,7 +1998,9 @@ void d_instantiate(struct dentry *entry, struct inode * inode)
 	if (inode) {
 		security_d_instantiate(entry, inode);
 		spin_lock(&inode->i_lock);
+		spin_lock(&entry->d_lock);
 		__d_instantiate(entry, inode);
+		spin_unlock(&entry->d_lock);
 		spin_unlock(&inode->i_lock);
 	}
 }
@@ -1995,7 +2019,9 @@ void d_instantiate_new(struct dentry *entry, struct inode *inode)
 	lockdep_annotate_inode_mutex_key(inode);
 	security_d_instantiate(entry, inode);
 	spin_lock(&inode->i_lock);
+	spin_lock(&entry->d_lock);
 	__d_instantiate(entry, inode);
+	spin_unlock(&entry->d_lock);
 	WARN_ON(!(inode->i_state & I_NEW));
 	inode->i_state &= ~I_NEW & ~I_CREATING;
 	/*
@@ -2754,6 +2780,24 @@ void d_add(struct dentry *entry, struct inode *inode)
 }
 EXPORT_SYMBOL(d_add);
 
+struct dentry *d_make_persistent(struct dentry *dentry, struct inode *inode)
+{
+	WARN_ON(!hlist_unhashed(&dentry->d_u.d_alias));
+	WARN_ON(!inode);
+	security_d_instantiate(dentry, inode);
+	spin_lock(&inode->i_lock);
+	spin_lock(&dentry->d_lock);
+	__d_instantiate(dentry, inode);
+	dentry->d_flags |= DCACHE_PERSISTENT;
+	dget_dlock(dentry);
+	if (d_unhashed(dentry))
+		__d_rehash(dentry);
+	spin_unlock(&dentry->d_lock);
+	spin_unlock(&inode->i_lock);
+	return dentry;
+}
+EXPORT_SYMBOL(d_make_persistent);
+
 static void swap_names(struct dentry *dentry, struct dentry *target)
 {
 	if (unlikely(dname_external(target))) {
diff --git a/include/linux/dcache.h b/include/linux/dcache.h
index 94b58655322a..6ec4066825e3 100644
--- a/include/linux/dcache.h
+++ b/include/linux/dcache.h
@@ -611,5 +611,7 @@ static inline struct dentry *d_next_sibling(const struct dentry *dentry)
 }
 
 void set_default_d_op(struct super_block *, const struct dentry_operations *);
+struct dentry *d_make_persistent(struct dentry *, struct inode *);
+void d_make_discardable(struct dentry *dentry);
 
 #endif	/* __LINUX_DCACHE_H */
-- 
2.47.3


