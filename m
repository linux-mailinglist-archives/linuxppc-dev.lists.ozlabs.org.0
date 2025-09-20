Return-Path: <linuxppc-dev+bounces-12443-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 255A2B8C1B5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 09:48:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTM1P756dz3cYr;
	Sat, 20 Sep 2025 17:48:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758354489;
	cv=none; b=kWnRmlhEcJEqBbUYiWLSOdsPtvaennAUNtxw0uLlBiP6xqgepGczsbTh87u+K8fHSCLJBjP6clOPsyYw47VKrF+//gn0ksQoNajEZWZDcRqJJP6GMCtKzpHi1G7oxsw+OgCf0ULkWU9tCUeDMenG9tyzhzpCGPbClXyqOb6ifS2xgTj/yZpic3k5cuF46PYRs4qstwHv/AfSqE69Ni2GjfzcUvlUwdm2K21KuUr6dfLt09QTue/Y5fv5Mce5wYkAshM2LfOtPp4untMsaSw8iVuVnyHU7wiilu79+K1Aqu5Dcecq36P9ZlobE6MhGoU0KKLIJWmZ9KrYR8zXIg6DYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758354489; c=relaxed/relaxed;
	bh=1X8MC3Kv2szH/aZW8Vz8ecvuKZEkFejBxtbewl37q7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=karTpUuLED2KOeDGmT56mO5LlGfrSYgNQdlEruDcfSrGDl4oMosO6+IWSXZ+ELEpXZVcgL+vjQyZJDEztoBxiEIt2pTMQTNLqlXMfQ7yxCdxzt/PIsry0MV+pv+BDPc0iCTGao0dV8xwT3eOGwKBMSmp4+OzBSyQTK3o1tQWjbPV8AdcGN5i/P6lYhpLNhN655WLXiQmu/JKZl2wLBYHbAvoAS9lbiDra2sUcakYYFswlHzLuynGJfv15SAVj57Tl8tpl6XKcczMeF1hbe6aWcIN11+Sag0VJHb2YYKJ75sDdUWdRjcomkGTQljBEgvWwbEb3Exoj/UWW8JaMlcZUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=qmfxZkHa; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=qmfxZkHa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTM1N5N91z30RK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 17:48:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=1X8MC3Kv2szH/aZW8Vz8ecvuKZEkFejBxtbewl37q7g=; b=qmfxZkHaOy6z213r3hoOLfPjJq
	z5H9zRL8cOu1GzvBs73WpMj+FIYrP7dwqTnnSJ2WNyzAxDOvrv1MaXglsNWmTRhLlFWNTwVj5/o9y
	XjOBTMfpWSYL6tEl+iH5wSQWOC0S4dYhFKVdGR50n09pqsxGd9zpEmzyqWeIowslcjIeyBVJ/zW9P
	Kl/dzZ9WwwYl4BLeUVzB4SjeCf71sDkKYgQca2Hh2mQaJaIoAzJdanSBuHL6fKJCte90eiSRb+56n
	0G3WLx25Foc2DorqmP2+Hpw3LetMjXLyjC7IUR/7nrNv3vsSS0SGTzDYfl5P5mZ2TgLpWKrpE3shU
	2Ti5jkBw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsK8-0000000ExBm-0p68;
	Sat, 20 Sep 2025 07:48:00 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-fsdevel@vger.kernel.org
Cc: torvalds@linux-foundation.org,
	brauner@kernel.org,
	jack@suse.cz,
	raven@themaw.net,
	miklos@szeredi.hu,
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
	borntraeger@linux.ibm.com
Subject: [PATCH 02/39] new helper: simple_done_creating()
Date: Sat, 20 Sep 2025 08:47:21 +0100
Message-ID: <20250920074759.3564072-2-viro@zeniv.linux.org.uk>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250920074759.3564072-1-viro@zeniv.linux.org.uk>
References: <20250920074156.GK39973@ZenIV>
 <20250920074759.3564072-1-viro@zeniv.linux.org.uk>
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

should be paired with simple_start_creating() - unlocks parent and
drops dentry reference.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/libfs.c         | 8 ++++++++
 include/linux/fs.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index d029aff41f66..a033f35493d0 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -2326,3 +2326,11 @@ struct dentry *simple_start_creating(struct dentry *parent, const char *name)
 	return dentry;
 }
 EXPORT_SYMBOL(simple_start_creating);
+
+/* parent must have been held exclusive since simple_start_creating() */
+void simple_done_creating(struct dentry *child)
+{
+	inode_unlock(child->d_parent->d_inode);
+	dput(child);
+}
+EXPORT_SYMBOL(simple_done_creating);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 3a33c68249e2..e3000302c3b9 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3659,6 +3659,7 @@ extern int simple_fill_super(struct super_block *, unsigned long,
 extern int simple_pin_fs(struct file_system_type *, struct vfsmount **mount, int *count);
 extern void simple_release_fs(struct vfsmount **mount, int *count);
 struct dentry *simple_start_creating(struct dentry *, const char *);
+void simple_done_creating(struct dentry *);
 
 extern ssize_t simple_read_from_buffer(void __user *to, size_t count,
 			loff_t *ppos, const void *from, size_t available);
-- 
2.47.3


