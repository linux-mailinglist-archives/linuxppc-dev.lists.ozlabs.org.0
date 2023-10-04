Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D397B8B78
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 20:54:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dpOrlZpJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S13lJ3CPzz3cQr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 05:54:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dpOrlZpJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jlayton@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S13kS3k9Pz3c3g
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Oct 2023 05:53:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D83C6165C;
	Wed,  4 Oct 2023 18:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A720C433C8;
	Wed,  4 Oct 2023 18:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696445630;
	bh=jwS/maqXmK0T9pimsNUUGNYN+WZVE+M+UfX5KqHyk1w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dpOrlZpJSqLuel0lQLPdPOTonwy+6VYYeFt7ydcVpG1CIXwDVqnK+ehXtyCLiMCEZ
	 yRkFAtkLQEsTSW03T3wkPVqxur3jAWS/jyFvFtjeDZLHBqclPwF2TZX5z/a3UJX4xE
	 GLOnUHAsfRrrBXxBqJZAJyJVcmIAZ4fm5D4aNqZuhNlfma7i/PYYGBrXTpPyMq8JDk
	 xSBGV87ATL/NvkViy2Gq+kan4g9EoU4SSrjUQkbfF+fe/+6Zy08T4r+Ezk8GjA7VQ2
	 MHYKWZcZ3yhbV8oMAxhPvPsiv2QRAQW03aI6yG3zS/EoNb51/p8m07NX82dKE2yQea
	 EeMuB2M49THEg==
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/89] spufs: convert to new timestamp accessors
Date: Wed,  4 Oct 2023 14:51:48 -0400
Message-ID: <20231004185347.80880-1-jlayton@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004185221.80802-1-jlayton@kernel.org>
References: <20231004185221.80802-1-jlayton@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Convert to using the new inode timestamp accessor functions.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 arch/powerpc/platforms/cell/spufs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/cell/spufs/inode.c b/arch/powerpc/platforms/cell/spufs/inode.c
index 38c5be34c895..10c1320adfd0 100644
--- a/arch/powerpc/platforms/cell/spufs/inode.c
+++ b/arch/powerpc/platforms/cell/spufs/inode.c
@@ -86,7 +86,7 @@ spufs_new_inode(struct super_block *sb, umode_t mode)
 	inode->i_mode = mode;
 	inode->i_uid = current_fsuid();
 	inode->i_gid = current_fsgid();
-	inode->i_atime = inode->i_mtime = inode_set_ctime_current(inode);
+	simple_inode_init_ts(inode);
 out:
 	return inode;
 }
-- 
2.41.0

