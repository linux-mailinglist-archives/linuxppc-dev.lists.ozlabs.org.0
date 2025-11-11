Return-Path: <linuxppc-dev+bounces-14056-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C807FC4BD37
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 07:59:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5HPQ2yrXz3dWw;
	Tue, 11 Nov 2025 17:56:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762844170;
	cv=none; b=AmrfBZs5FelmG4w+Omu+XKEfELaKwm22UtDYFgFw1C+Wi6CxM0m3Qqf5PYxxBCy72D/nD27u5uhhoDIou4ymBHdSRHhKeAJbpLb1Lg+YSoICqbOuGZXKB95qktdtt/CXz1nv/PpBxKMV/TGYywGF4DuEf4VbBewOAQ8O2SSlqyGtf3mqPSc9HDKkdp1k+jKdz4MUCKfKjZcqpRmhvdot3pppgvk6yVPDB0whfqoH7pMX2hpaZhnV+4xhHs3PP8YG4KQBWX6m/XZDg2VIDlxtGiqGEDRgTe2QyIewhdGlhY5AN/twSJdjigp14qbFdZJO6Bm2E27YFuDq6c3ZfDitag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762844170; c=relaxed/relaxed;
	bh=AteBZg1Rl8HXmlwF9pQEJDfnqUw3H67agXJaoVo2v7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hUwxCmD+jCR6WqqUjnlbZiR+YKoBbNcz+QCrxT3IKxyqVIohZLRaWHhd3fgMXdZUAnPRBZ92ZbNGhwnkL7yS5KlaM7RjquypmetTT01bPCTIX14RojmU8jGSW0siN+ziob2Ab02tNIMcAEbbZkSW2S09h4ZXZQvZL1+ySfoB+OL3FUZSIfYBl2TH9tzdB5gu5SWSnGWCMpinBejsUK0tLAGbpoF9Aj/xTMxmTeTF9Z8FBdO2CQF5POsUl0Mfbetvg4eqArMUd//ouMWSlXDBCle8EoQaqFBeW0QQq2IWHzyErkMm19RK+v9LvcNLuQ3yPnhyXM3vxvgpa7MqeLyNlw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=hUv5N0YJ; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=hUv5N0YJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5HPP53Ckz2yvc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 17:56:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=AteBZg1Rl8HXmlwF9pQEJDfnqUw3H67agXJaoVo2v7U=; b=hUv5N0YJTnik1pbrNSxtqUBlQw
	9cOvz0bTB4Y27X5wtakM2e5mLlL+A1vWqkpKBScibz62/7hNSxH8Qhl/fXtcMmytQT7KieaNS93ca
	hSKrCcXInNpOmxOg9eQWON/uKQvv6Y+fuhHuN2yUosFBERdlRKC96DkJ1Mf2tvSoj85JiuuFtleeN
	YlqExq3xf5s14ARGwCA+sxhLM52ngQal5Zw4sXygbVTV9c58CEwdgjIEIq3AGep0pSKwDneTJaDmC
	CHzBiKcobHsZWXnkvKcGNSyWFwPNG1YHAhBgL/Jbp8AOUXxVE9E06HJMW//0RGDcGPaDreuMcr9cb
	CfuCNGUA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiHh-0000000Bwu0-1wva;
	Tue, 11 Nov 2025 06:55:21 +0000
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
Subject: [PATCH v3 02/50] tracefs: fix a leak in eventfs_create_events_dir()
Date: Tue, 11 Nov 2025 06:54:31 +0000
Message-ID: <20251111065520.2847791-3-viro@zeniv.linux.org.uk>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251111065520.2847791-1-viro@zeniv.linux.org.uk>
References: <20251111065520.2847791-1-viro@zeniv.linux.org.uk>
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


