Return-Path: <linuxppc-dev+bounces-14276-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E247C67726
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 06:21:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9Xsg1FZ9z30dt;
	Tue, 18 Nov 2025 16:16:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763443002;
	cv=none; b=la6bHAsuAQykgccnflqdGCMLLpW+r/uhel6SOtVSP7wmv8AAe0nvH+n8Xgs8JkEgrN5y7RdswG2PLlhPGYlRQrchR30CxganE/ZBeMtihJ2N5DAScE+Vvb8UYUeSQeBWnCmW3Aqdwtznl04Kftou4kCx2SkN+MriaorePHCbts8c2p7sH6V/rodq/1y6SQqBizbVpf2mCF3Xx/TylEU0lavZrrYzbF0Y/wfzkevABl9Y6x1LdSVvSRa0bE8w3HDK+Jqhy0ciZp+jEwbfLBUs614cFlzD3hZZUD5mqHqAq2RPh1Bbj+b1EbAmV6RYYU8D7ZuS34nJ5KkYRhLHAivQIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763443002; c=relaxed/relaxed;
	bh=AteBZg1Rl8HXmlwF9pQEJDfnqUw3H67agXJaoVo2v7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oE/DYRgNKnrgjDi1huzh/U0IN/+rq8duRe25t7cYQDayUl0naLJ8B495dIK8PWzQDuMOxk3gYqRu1ANm6f7tKmULQdQz99tG9bIkkiZebNOin6uVlPCtKpSJ2SO3n6k+nKwX0flIioGLCoBPbx+LyZDdoNHBSbrghzocJJ3YvyP0OPpVZC/h4q0tzB5QI6wffHEZMSr7MV/t+TxL+I+nm7v5PIiNMcQAbpvAKQNzNRkCqVzQNYnNk58yuWyQmPw+3q+Lbu1qG3KQ7w+VvOCCm8bHDuYE61veTOSCenWbsc2gEA0pKiwvTUw1UPjOPbtjcfqDKJ3Nu642gDzl3Wxaaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=uebdJF5p; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=uebdJF5p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9Xs12c6vz3bTR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 16:16:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=AteBZg1Rl8HXmlwF9pQEJDfnqUw3H67agXJaoVo2v7U=; b=uebdJF5pf07uYuFSwWcvMcjJA4
	aMBIgBZ07P6Z7Z5i2y6WJB9aj7c4VP5/O9k2aF7DzcSYPG1dwqEOTubJtzYsWoiPZo0kA2/jDUEF2
	b7r0UsEwbChuPZROhUWdb3uUGI7EdA5kZNpkgsHvboUEniW8t2gp12fPx3iHxPaq0vSuAJbv2p1HI
	kHCzgWGRfgOsZmsmtrjipM9tulW2sRBO40L3kgNJMHpw6+JqgEQ+1w2YyYwLjGPaQ73xX5QhOeyew
	yKSk130DpWM8QXtbXxc9lfE7z25d/IUY835TAk/kl1TCuVJN7Mr7fefmvVmRISgxVpvMmFWtqSBgp
	DZssowdQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLE4T-0000000GEPl-14AR;
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
Subject: [PATCH v4 02/54] tracefs: fix a leak in eventfs_create_events_dir()
Date: Tue, 18 Nov 2025 05:15:11 +0000
Message-ID: <20251118051604.3868588-3-viro@zeniv.linux.org.uk>
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

If we have LOCKDOWN_TRACEFS, the function bails out - *after*
having locked the parent directory and without bothering to
undo that.  Just check it before tracefs_start_creating()...

Fixes: e24709454c45 "tracefs/eventfs: Add missing lockdown checks"
Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/tracefs/event_inode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/tracefs/event_inode.c b/fs/tracefs/event_inode.c
index 8705c77a9e75..93c231601c8e 100644
--- a/fs/tracefs/event_inode.c
+++ b/fs/tracefs/event_inode.c
@@ -757,7 +757,7 @@ struct eventfs_inode *eventfs_create_events_dir(const char *name, struct dentry
 						const struct eventfs_entry *entries,
 						int size, void *data)
 {
-	struct dentry *dentry = tracefs_start_creating(name, parent);
+	struct dentry *dentry;
 	struct eventfs_root_inode *rei;
 	struct eventfs_inode *ei;
 	struct tracefs_inode *ti;
@@ -768,6 +768,7 @@ struct eventfs_inode *eventfs_create_events_dir(const char *name, struct dentry
 	if (security_locked_down(LOCKDOWN_TRACEFS))
 		return NULL;
 
+	dentry = tracefs_start_creating(name, parent);
 	if (IS_ERR(dentry))
 		return ERR_CAST(dentry);
 
-- 
2.47.3


