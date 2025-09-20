Return-Path: <linuxppc-dev+bounces-12444-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A27F2B8C1C4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 09:48:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTM1S2ZT9z30RK;
	Sat, 20 Sep 2025 17:48:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758354491;
	cv=none; b=B4RuOMlOD4IjxqcCr8tDI7HbYDn+jxQCQrDhQpDUIYBWyQuJ7Pney9l7Zrl0zJQpdN1c8aGPMRoo8qHg3QeHfb5hLwV2viWOt1Hr6T2TCAtXJT5Y00MQqTTxksVxZk4d8lE9sUB92C66/5KIrbFlGWjPdG0Xgo/CZGAnJlLyyO1bQIErN9rm7hFfqoke7Qfi6QBK0M8Ia1uFw5pPZj7JR8C8ltvlbfrhupPF/B8JgRF3niP2pMNz1nR+JkohK32IfPDxAqzsvP6sH/+kAvW0LfCpKxr5PwnvYge6oq4uIEUZLMVV2DFitsc1euowespYgp9NvCPwCfRnO830sbs+oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758354491; c=relaxed/relaxed;
	bh=gUEimjhDUEQYPy4l3MdZr7NUKB2dX1VaNYCU+wgrlmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F7VqhfRZs70eMK19+gNoP8/rtPJReVdqZbHnhxeQDFhPTok/vqybpLHl9J6hzKreVMzxHn95hCaqBKm6hTUY8Icg2ZdBy8ibfibcTVIgu0g4/WBq/foSI5Z21POCSIyaiXZ6zGKS7iYEwzR/+ZTuNZHQsCTGrbqZLpI9OHi/UrJ1oRFHJmIK6/pSqkaNur9Tz2tllVRK2NP7vkBvgudIzI4f1eFQ95718S3qgBEChtD02RNchN/wj/qRrziY+Jx8a9JZmOxAbAS0BbANwfzzgKEZHkoX7hyKjD6gy/sQm90xN25MxxgViBfT4W4Spf7W/HErI2qEqgYFqxh5GIIMFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=UbGImuk0; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=UbGImuk0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTM1N6czQz30T8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 17:48:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=gUEimjhDUEQYPy4l3MdZr7NUKB2dX1VaNYCU+wgrlmM=; b=UbGImuk0Hl6O05dAIo++tXbfXg
	bvlF4ugn/z7/w2EQ+WJfE3qSwayHfSD7FZ2WBMNz6K9ZLxBAo3Xnp6YwxFn5v3MYwW9exoDqfBQPF
	fkdf5Xo577FTLg28ACzp2DbLTl14n8fe8XdzONACrcH3J3yyw/FRyw5d5qhgIHPN6lPd6qL/thgiF
	pLFF9csM6voffxVRfWz4kaHMGAm8pWVCRuKvIK0kEco36Q6TaQ+1aDbR3reF1QABJt4euhpb6Uaev
	NB8FQ3WEx33mWi4DdRTG0CAbF4XVByyQvcQW8WGsh4BaP5ZX5i6ODqkzW1xWrQypVDIO7EFhiAEv0
	/aAZWThw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsK9-0000000ExCU-0Idj;
	Sat, 20 Sep 2025 07:48:01 +0000
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
Subject: [PATCH 08/39] configfs, securityfs: kill_litter_super() not needed
Date: Sat, 20 Sep 2025 08:47:27 +0100
Message-ID: <20250920074759.3564072-8-viro@zeniv.linux.org.uk>
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

These are guaranteed to be empty by the time they are shut down;
both are single-instance and there is an internal mount maintained
for as long as there is any contents.

Both have that internal mount pinned by every object in root.

In other words, kill_litter_super() boils down to kill_anon_super()
for those.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/configfs/mount.c | 2 +-
 security/inode.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/configfs/mount.c b/fs/configfs/mount.c
index 740f18b60c9d..fa66e25f0d75 100644
--- a/fs/configfs/mount.c
+++ b/fs/configfs/mount.c
@@ -116,7 +116,7 @@ static struct file_system_type configfs_fs_type = {
 	.owner		= THIS_MODULE,
 	.name		= "configfs",
 	.init_fs_context = configfs_init_fs_context,
-	.kill_sb	= kill_litter_super,
+	.kill_sb	= kill_anon_super,
 };
 MODULE_ALIAS_FS("configfs");
 
diff --git a/security/inode.c b/security/inode.c
index 43382ef8896e..bf7b5e2e6955 100644
--- a/security/inode.c
+++ b/security/inode.c
@@ -70,7 +70,7 @@ static struct file_system_type fs_type = {
 	.owner =	THIS_MODULE,
 	.name =		"securityfs",
 	.init_fs_context = securityfs_init_fs_context,
-	.kill_sb =	kill_litter_super,
+	.kill_sb =	kill_anon_super,
 };
 
 /**
-- 
2.47.3


