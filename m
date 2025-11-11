Return-Path: <linuxppc-dev+bounces-14033-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 069A8C4BC35
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 07:56:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5HNx1J4Zz30Fp;
	Tue, 11 Nov 2025 17:55:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762844144;
	cv=none; b=olHnIXt0pkCT3TXUpFh4bzh0VFtw1JR6T8m9r8yoHYv6he30662mWa46OgL69MV9Z2j5KfVwD1YWsH/rpfPSf7zYIwmtwyOm/cQlWsMNDR7d6QTNBV/JyO+ln4dOyaYkI5RfG/otxTGf/hGr287OQfhRR400aP0g240Rb7XdqpmR3QG1Czv03Wx9YlEXvrJns8bipQyAItX9WR9Oa9GBOAYmcyznXpKV3Mgved7PnhGaHH8u37ZF0pwL6wsGGRVPyrFo+1aIAApa+hveNCn+pUxtFpF8Rpwqv3dgXuZIAvNo9lrCiu3zzL6KvzRvVJucNcTcrGOLdmThGNnRqKdEFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762844144; c=relaxed/relaxed;
	bh=IpNAvIvaquRQO1Ji53mf5vyLMZJ4O2UIIE/EO15yw64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nIRCNqwY62mkhS7Gvg3+p7OUsZ4bD8lRxi05k1WbgWsgufH8nqo5VHnXdYSftSGCo/qlVw+iSl/24I5S6HsrQD1wpyTe8OsoI8Y1HcFBdBQkWR/s4WWz25PQVxW+JoVFyuUL7szuuJYtRqp9k4qj3dd//ve1+gvAO1I7zwpbAJm1DlvWe8cA/oreVJynzhNxjC5yIKmEUOtm6Phd/4Cqkxy0Dwz7LL+fIwuDgKou79Uf2GLzx0BaXEcVMwcKX7dOiElvH9cjHnFxmGE9oI29D2aTqSOBJ42pU0b6BTWZD/TKDHTMPASRR2t3JPb8pcoOrYssOCpprwuEV0Gi4oFAVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=WXIL7oKW; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=WXIL7oKW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5HNp5THqz2yvV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 17:55:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=IpNAvIvaquRQO1Ji53mf5vyLMZJ4O2UIIE/EO15yw64=; b=WXIL7oKWy9HSEHoMSySZvGsg9C
	HZvXk7ur65/jTDXn6YYUhFwacBQF/Fiuvc10VS9Xsn2QTYNJviwjaUBuekxRtO11Dz6DWxo52FpOW
	xx+ZAWpH5IdaikOJr+SbHm78dNqDE2qZY+DP1N0bGiBMbz3aP11/TIksIad5bfQV5LMa8w658GqFc
	PUj46ECxO6udLrf5JY3DFWh513jOhp89Sb2BW1rFbpnxjAhi2kFDDHVq5N9vbQexaMhN/htdPvnVc
	B0ZK7pnVCrUaDpqBGoNoZ8x2c6t6wD7OjT+9UR9FRgOyeCOzpJ8vK7G4mE4q2vcKe9yJN0K6r6owU
	UJuGjEKg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiHj-0000000Bwy6-0yJJ;
	Tue, 11 Nov 2025 06:55:23 +0000
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
Subject: [PATCH v3 12/50] convert smackfs
Date: Tue, 11 Nov 2025 06:54:41 +0000
Message-ID: <20251111065520.2847791-13-viro@zeniv.linux.org.uk>
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


