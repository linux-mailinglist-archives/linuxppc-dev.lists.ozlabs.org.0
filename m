Return-Path: <linuxppc-dev+bounces-13392-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80191C124D9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 01:50:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwWt16DxSz3fNd;
	Tue, 28 Oct 2025 11:47:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761612425;
	cv=none; b=Tp3XEfrY3g9rC8y09JPHsT7IQ+VguNzZkxkgJUvvvjZj4itRhEORnR7vfoHt+3X2sIpCf2TKpU0bLSYMTNnWF2YfTFFRu11S++ByDLzPRjuZLTLGFI3QMmk+uCtd3kKRDfuvVtEUCQosmoFfHg8PVrkymA1Tag8Zfg9tKJKWDqUQfTar2Ub/GA0+dwX3LLhUMO8NLYJAAqYkyZJh/FijyzFdsc88CyWUSMSCbnsT6i1xVw8cn5ngMz2K1S0tHcQbxkJ9yh9RTcMkoduKo9iB7qMZX9QBGYMaggpCFYAGKWmmeJ1GFkrGFm/qXtE9OWCj4WtcTOotW1K0z7BEwGptRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761612425; c=relaxed/relaxed;
	bh=0EOMkT/UFsYLOkQCFILn7xjwHlMa0Zq2h7YoVPTnFkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GA4qVPrQpLi6vuI6T9tb9n4sPqCD48FX0/WUi6BVn1qXdNB1lo6/H4O9j8PM4Dmm6n8fG0TkfxkEdtgkiv7ln+7MdjWfoZgugCvs8ZlYQcUvJjRhnL9UpioT4NNiyhNZxa1rdiUUWM8ZcR0ZF49vbM/CBWzimkUVuZWNYpqv6kR/V/SlqtWoLvQihqbWM/MdYTxshx+9BXShq9469kYtTUT087B/IP3nDRuZwBARpez261pr+tQnCy7ptpvUlHdZlT9u4YwBTT8Xx/RTRuckkUxyCzMh6sh6lapO148tFfHoDJ4BmqOQxNyOjgUcSmeVvSNZNyVKZ5PlV5/2T8wuFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=k3/3EO/q; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=k3/3EO/q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwWt054Cxz3btf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 11:47:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=0EOMkT/UFsYLOkQCFILn7xjwHlMa0Zq2h7YoVPTnFkU=; b=k3/3EO/qtUoRTTjg9La+IgmqPA
	j3Fr77LMk7+8F1jeQrlZWYLdQyRNkCmkV8qxDp6YqqEYNtLKEPkW3TjMzd1xQKukE4QjVxpC09HmT
	N1IdVpWkZvIrMC8lkymsc1IrGbRhdDJuLx2/xFjuuihjMnfQGCXAWppU7M3TPJTGbfaZja5tN941G
	HhHiLUw+1zz5om0pDfrEBjE3v4cTBu9bYvXPPhZ+yYSfHYjsPtUe5pkpLDQzaIhYGzNctarrH196u
	U91d62uRws8Due5hStM4w+Qvubn61E3Ap+eNSwXSLDLUIwPoTV9IaaNf4NNScmIhj9YxNqjePMScg
	EJ37ogQQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXqr-00000001eZJ-2zYl;
	Tue, 28 Oct 2025 00:46:17 +0000
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
Subject: [PATCH v2 30/50] autofs_{rmdir,unlink}: dentry->d_fsdata->dentry == dentry there
Date: Tue, 28 Oct 2025 00:45:49 +0000
Message-ID: <20251028004614.393374-31-viro@zeniv.linux.org.uk>
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

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/autofs/root.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/autofs/root.c b/fs/autofs/root.c
index 174c7205fee4..39794633d484 100644
--- a/fs/autofs/root.c
+++ b/fs/autofs/root.c
@@ -623,12 +623,11 @@ static int autofs_dir_symlink(struct mnt_idmap *idmap,
 static int autofs_dir_unlink(struct inode *dir, struct dentry *dentry)
 {
 	struct autofs_sb_info *sbi = autofs_sbi(dir->i_sb);
-	struct autofs_info *ino = autofs_dentry_ino(dentry);
 	struct autofs_info *p_ino;
 
 	p_ino = autofs_dentry_ino(dentry->d_parent);
 	p_ino->count--;
-	dput(ino->dentry);
+	dput(dentry);
 
 	d_inode(dentry)->i_size = 0;
 	clear_nlink(d_inode(dentry));
@@ -710,7 +709,7 @@ static int autofs_dir_rmdir(struct inode *dir, struct dentry *dentry)
 
 	p_ino = autofs_dentry_ino(dentry->d_parent);
 	p_ino->count--;
-	dput(ino->dentry);
+	dput(dentry);
 	d_inode(dentry)->i_size = 0;
 	clear_nlink(d_inode(dentry));
 
-- 
2.47.3


