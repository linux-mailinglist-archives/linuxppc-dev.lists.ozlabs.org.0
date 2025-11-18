Return-Path: <linuxppc-dev+bounces-14273-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 298DFC676E7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 06:20:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9Xsf6QKgz3fRf;
	Tue, 18 Nov 2025 16:16:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=62.89.141.173
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763443012;
	cv=none; b=lXI+Z0UMH3jL9ExNvkFZVDpyDoVT0oT79AmRyKw+SK7rEyeCtmrzS+kVLS50RR35+qD9JVTySvkq9k7aoMfx5cAvVb/6D50gPBdYhaqkyER4JEQ6NkC3Dpzo/14frAvxF84Gi1RoeDXb6XngPJC3gcoyCj4C/+uj49A12IwJnCP5xL/1cilA+Mm4AjyHkL8co2oDzi2C4wa0Y6HeVyEBakINCkLwy4uYPSPfY1JVCizzEN4Q1gRBB0/53GnoGWIc57SoyLfAQhRoUvoFITqSVw5DtoLctChCT7jroS6JbaCV+8HjavdTsd8pEGa8tw9zSbZ/I5jZK8GA9p9bXJ8iHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763443012; c=relaxed/relaxed;
	bh=IpNAvIvaquRQO1Ji53mf5vyLMZJ4O2UIIE/EO15yw64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lY24IKxdWrII/l+jMP5WIDAsVRZ/6udHUXRtCeKZgLeUGF2MBJ0TWu89/olGz4UdhNiiW+hiqQhtxpiOtOjBoJKEpcxeShhW915H5ChV3gdV3y4RH/6tFbKJCqgccPu/194a8l/eVMVzX8p4HUzp/ksTfeHgiEBrWecUYug63kzCPVmQJFhgEpIWIYCXwd0cKf8LcBve6bDBEhcLHrb42uoQ8HrDPI6s4iei/LjbVagHe5yhxwTy+t3weTSTNO0XNV/IC6fKxW4/sSi0bDE7IjG55IXcZu9wIAmehpWTHLZXWHYg/0svb1JNun3fb2jTuJx7wgfWl+fvIgMuxRgJSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=FE7OJf/U; dkim-atps=neutral; spf=none (client-ip=62.89.141.173; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=FE7OJf/U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=62.89.141.173; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9Xs55W3vz3bvX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 16:16:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=IpNAvIvaquRQO1Ji53mf5vyLMZJ4O2UIIE/EO15yw64=; b=FE7OJf/UU+lFlMVRVRToGhRAzP
	N8qGXHCOjkSsJDHwHKHBs4K6aMWob5Nbszex9l+s6ZK7OfCYvZ+9TG8qyL4a56MGLrMSV9WS+QFaH
	s1N/VE1lLOH2Yk6U5H6G2Poh2PqGUWSQ3NEN0RCixCbVN/RP60yPNMYvhHIPBExVfx/5/OZTzs1EE
	bhLcn7ls1cB8YCrarexnMvFo0q+gbwMu1mw9xNZu/jFbTij+eRpShRImoLn13GuhwUkVAFtVXI+yz
	d1EdjG7xvDxR5x71JxFMIMLgaP4kB7U4RmZn17NAJrLLzst9bGtt1ub4xZUECV8by7OLH3v8P7leP
	M9vSGWsg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLE4U-0000000GEQo-1hsg;
	Tue, 18 Nov 2025 05:16:06 +0000
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
Subject: [PATCH v4 12/54] convert smackfs
Date: Tue, 18 Nov 2025 05:15:21 +0000
Message-ID: <20251118051604.3868588-13-viro@zeniv.linux.org.uk>
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

Entirely static tree populated by simple_fill_super().  Can use
kill_anon_super() as-is.

Acked-by: Casey Schaufler <casey@schaufler-ca.com>
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 security/smack/smackfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/smack/smackfs.c b/security/smack/smackfs.c
index b1e5e62f5cbd..e989ae3890c7 100644
--- a/security/smack/smackfs.c
+++ b/security/smack/smackfs.c
@@ -2960,7 +2960,7 @@ static int smk_init_fs_context(struct fs_context *fc)
 static struct file_system_type smk_fs_type = {
 	.name		= "smackfs",
 	.init_fs_context = smk_init_fs_context,
-	.kill_sb	= kill_litter_super,
+	.kill_sb	= kill_anon_super,
 };
 
 static struct vfsmount *smackfs_mount;
-- 
2.47.3


