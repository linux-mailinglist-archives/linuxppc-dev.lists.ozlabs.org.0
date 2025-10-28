Return-Path: <linuxppc-dev+bounces-13390-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03510C124C8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 01:50:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwWt137Vxz3fJh;
	Tue, 28 Oct 2025 11:47:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761612425;
	cv=none; b=f9ngx0MMg8PTz8KYi1FRLITjGf4mRMBxMWY0TAth5k1kV888+Di6tPzmwM5Hr/xe8Y3Rj8z3oRz0EsJPfQrZG3FYOnY3/IJ3hPeeSnvoGfuJq3biBsb2gsP4TRoR9AqE5nN61ZePcaiGeM+RTGBB1668WxOGolbQ8aeb9vtZYPn68L0hmGyFJU9etuPCzd0gApHgzW54hOmvib+u1xEg/t+W6iuwU2MpCY1/GTeqd0sZL7jASRD+367kczWG3vajeZMhrxDSj955tLqRGn0Q5ht5TJwRq5Nt+GcGK6gs//agXQYLz6sChhk/cKfEOWUCGgxF3tvg0OMj7+uFpeHMXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761612425; c=relaxed/relaxed;
	bh=LZ6yrPf10XyjUbpb0uoz9zDvZV76d0sxqTJxoq2o+VY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IVN+fb9Veam2b6g1otkpHY7tS1lKHbDQPtZiDUTMr/Xmf3TXMAfI4mUwXNPAr7BZHPUMZdoc+0HauSdkl6WhqrvrdKx9wgXz2oeJTj2yjE9GgYg/Xpm88G1JRTPLIHaqw6T38a4uDf0zfz/3Xw0wxnnJGyj8dlR7Fyy0RBAl3bavf44Bxz9oJn/HJep6C96OAzyQI52ZJ+vJ7FOph1vmBKLLEbZbla7zdo90SQiK+q5HA9A13tNyITZUXSF13Tv+xSdM7zQ2QfYpLdSqgf4xKKbM1ILWvZj2DSifRgprFL3kbXhbtQ3qeBzGJ1+ex/Jem60ZmCe92QUtr4mOspFfAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=N1HyiXqW; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=N1HyiXqW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwWt04lgGz3btC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 11:47:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=LZ6yrPf10XyjUbpb0uoz9zDvZV76d0sxqTJxoq2o+VY=; b=N1HyiXqWvHuK6eYbHoqjsKF4yS
	sRZR3R+AAf6swru+RmI/QN/YSkxT19z6dcL9RxoRt93tDwIfw8aweTO/4iA9n9JU+jR603TVBSnk+
	Q2YJ74xC/uQLAY75lEg1xiQjThGulXfxJPHOqIx4++XcFlGut3/cwxrsMFTf0DgAoU4re6hB8TA1M
	3D10mdbSmAzj5Eoeu/6TEUA1WUtGct5NSYbTRd/fYRips79EkV3WYcVtfDidNQWbDxf0wxBszRyaY
	S8UHHm0pO8PDTgf+NmR2oCic03QfrrrZZGr2Mr642AXlexwRwbP3JkXztjANyhVSGqgVHU/kqDZ6X
	WD2OlCNw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXqq-00000001eYF-3cOg;
	Tue, 28 Oct 2025 00:46:16 +0000
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
Subject: [PATCH v2 21/50] debugfs: remove duplicate checks in callers of start_creating()
Date: Tue, 28 Oct 2025 00:45:40 +0000
Message-ID: <20251028004614.393374-22-viro@zeniv.linux.org.uk>
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

we'd already verified that DEBUGFS_ALLOW_API was there in
start_creating() - it would've failed otherwise

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/debugfs/inode.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index 682120fdbb17..25a554331ac4 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -433,11 +433,6 @@ static struct dentry *__debugfs_create_file(const char *name, umode_t mode,
 	if (IS_ERR(dentry))
 		return dentry;
 
-	if (!(debugfs_allow & DEBUGFS_ALLOW_API)) {
-		failed_creating(dentry);
-		return ERR_PTR(-EPERM);
-	}
-
 	inode = debugfs_get_inode(dentry->d_sb);
 	if (unlikely(!inode)) {
 		pr_err("out of free dentries, can not create file '%s'\n",
@@ -583,11 +578,6 @@ struct dentry *debugfs_create_dir(const char *name, struct dentry *parent)
 	if (IS_ERR(dentry))
 		return dentry;
 
-	if (!(debugfs_allow & DEBUGFS_ALLOW_API)) {
-		failed_creating(dentry);
-		return ERR_PTR(-EPERM);
-	}
-
 	inode = debugfs_get_inode(dentry->d_sb);
 	if (unlikely(!inode)) {
 		pr_err("out of free dentries, can not create directory '%s'\n",
@@ -630,11 +620,6 @@ struct dentry *debugfs_create_automount(const char *name,
 	if (IS_ERR(dentry))
 		return dentry;
 
-	if (!(debugfs_allow & DEBUGFS_ALLOW_API)) {
-		failed_creating(dentry);
-		return ERR_PTR(-EPERM);
-	}
-
 	inode = debugfs_get_inode(dentry->d_sb);
 	if (unlikely(!inode)) {
 		pr_err("out of free dentries, can not create automount '%s'\n",
-- 
2.47.3


