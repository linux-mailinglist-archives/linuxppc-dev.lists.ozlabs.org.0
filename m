Return-Path: <linuxppc-dev+bounces-13381-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C398DC12479
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 01:49:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwWsh4FXRz3fDD;
	Tue, 28 Oct 2025 11:46:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761612408;
	cv=none; b=d2mAQYLQi2uPFzhnXpZfwlXSk3yofyAWFH9nbkQVZC8GVgAgZFCWEeesQBjvRm2IK4tBiQPqzgtc+CjAJNQzSGnG1p1QrK+1NlfqfNkQ6frMoFqCOGy87LFkd0hkzulyzACImYZLRkIv+77K0SMQ0xFDTauW7gZPthiU006Tv8iA2sepUDkOc3cm2tAib/zOMm+/kC38Qquo6VVHQV8N+Ibxb82YRigLlsFubJc+tpxiu+9w8k+MfNhGqzHBdb5a7vfIhjyFOPM+3P317xYnKVBd0S1tobnweM/ty56BLqCJ956hbI5zSwW5OFS1YPLuPKvjwCjSNx5awkJfJ8gzpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761612408; c=relaxed/relaxed;
	bh=IpNAvIvaquRQO1Ji53mf5vyLMZJ4O2UIIE/EO15yw64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MzJeTFig+CYIxHy6DpXff88Ua+dAMgpUMHKe46p6l/Zk0F+l32WsQpifNWcWSZeZkLji2FjtMek89V8t8gPFIvGc07Ot3PIbMI4k49ivVQfoHkvceTzWatHugXQKoI6FB3wUh7EjgL7J9aRPdD7UMTgENGMaxrf+1pp74TnfGnQN+sQ7VIF1DHO+2M7jRa5nGuFwTKOKdm7+cXn/0pbpF3YEjqfdEfbTiWrcLKZuLcS5lKY/HQgvGMajan9ljYH14XEka4N5K6jH7LEhQi/hRKcdlNhfEiVD1oc8GZy6rld5rA93m8wgfHfYkdL8VozjmUMDrBusCMyNBAzlHatAtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=ZP/5LJ2L; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=ZP/5LJ2L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwWsg5flCz3fCn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 11:46:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=IpNAvIvaquRQO1Ji53mf5vyLMZJ4O2UIIE/EO15yw64=; b=ZP/5LJ2LFqkgPJcGiYKyxpw1bl
	eE3CR/YNuYLN0WTyuXwstIsr4MFxI2VWRTUkfj42e3nPv/cUgi0kuvG/bWyRLxSi5NQw7ta1hlYv4
	Xd5dbq/1RgBzh34OYZIx+WEXJGf6km9LeONaBmB9ZMfMIPXlmqSQ+hT7FWjsKbJ9vbGyq/LFSSxKm
	A0vkavXp26fq9SVKdWu5aIE6UDcTLlY77eXEFO/mLAq+Ea1RoI513C5nQ17dKaQ87vH129hNwOX9w
	ckBwjy/VEiET6MWdU6BL+O/WKM5gcsk8pDaiZz5CqjAwGDoqmKOewqwSjwO/29YQIX+8JGowiC0Jp
	MRIn2MRQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXqp-00000001eWz-3auK;
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
Subject: [PATCH v2 12/50] convert smackfs
Date: Tue, 28 Oct 2025 00:45:31 +0000
Message-ID: <20251028004614.393374-13-viro@zeniv.linux.org.uk>
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


