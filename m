Return-Path: <linuxppc-dev+bounces-12452-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F27EB8C21F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 09:49:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTM1X2xm2z3d0x;
	Sat, 20 Sep 2025 17:48:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758354496;
	cv=none; b=Q5+CLukWLXQMEPN7rGM9R1tQiXbhbIXfYHcPavJP7ND5PN8BFHZ/jk2qrKr/z7ZT1MjWoedV/e042cDHMuxevgMlvxW+pDwa/W6BGvFhwVATjsEJ5WDT+Ap4x0cgPEogijqPp1cxrJWlfvwFCIIe1z/w2+p+PzHY1zz5mWLL8sEfkcgi7126bc8HlQw1gj3DELIiQ2Rvw22zqejUTi1JRCuWIkwqHxNMAC3gr7MUvLgWtH3QpOoDSogAaBvPOhcdf2hT/iq2GcRXItzVAm1fPiiv0M7Wz1zoF50V9knec7CF4pzFnMo86CYPPyKNRhxRZDu1s2V0I8zbDE2ZM8596g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758354496; c=relaxed/relaxed;
	bh=h7zac5CXxUxkb7q5ONcJstI1n7DJUlke+AKINjwUKhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZwljrdkCV4Byp4GF8DvbxeXDJ5aVKIAR4jq1s7187aauxvmyZ+5C4J0OJwdfuH5tmopvz/46XMhTAj4PzoyBfUeU9XaiHbGKVi2gxJzjiP49x9wPaVvTuLMmPOfb8ZYTBP8j5c6yHuvZcBjvMcwM/dN/DyiV1GMu3WdliVIxmZuQeyrpYS8Oy97L1JYI3QBBRy8aewZUN+zM2Ca4pN1XGA34npt7XmZUxdd+yMMCbwrmYwp6EAy3er+2qTCJzt6yGxeNRHINDrRK6nGASQI20gcQ+jJFd+lzE+C/G9trC86fhXACZu/wr/Z0pnuDDvFt5kmYv8D1mSqFEGmARNOuFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=gOsZ11R9; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=gOsZ11R9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTM1R1MXLz3cbL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 17:48:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=h7zac5CXxUxkb7q5ONcJstI1n7DJUlke+AKINjwUKhw=; b=gOsZ11R95Mc6khqYieAvGNI546
	t4Q3F2LQ7usNltEcKyWm/9q4pggxTthiwjrBd5D4D6ge/9g4pAacGuMO+LGMFkuKgNcAetY1uRIjn
	1qm8refseK5xgcF0CtotO59paOWWy2bEc6aCmUneBZZJ2yDM3AirMhLl3Fuz4pwnJS4EJnLbHoDJs
	7ZfBeVXB9yoK+zD+iEbTR75Eao9+iKvcSvcdLCPmoLcgSC1KsAv1kl7D2ExJ2MaIaiLRuPw1Ivapi
	0y0XdSclxK2XOFjXsEvYABaBSFZ/vhA541uq1Fso7uSMCuhN5Du2vVdFUz8AQy/207j12dYYopi5y
	SapVXyqA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsK9-0000000ExCp-1Qie;
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
Subject: [PATCH 10/39] convert smackfs
Date: Sat, 20 Sep 2025 08:47:29 +0100
Message-ID: <20250920074759.3564072-10-viro@zeniv.linux.org.uk>
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

Entirely static tree populated by simple_fill_super().  Can use
kill_anon_super() as-is.

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


