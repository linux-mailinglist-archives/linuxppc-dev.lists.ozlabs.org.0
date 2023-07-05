Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D266748CD4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 21:04:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p6kAsrLT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qx8GS2pPSz3brc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 05:04:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p6kAsrLT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jlayton@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx8Fb6PMhz3bNm
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 05:03:31 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D236061711;
	Wed,  5 Jul 2023 19:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F7BC433C8;
	Wed,  5 Jul 2023 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688583809;
	bh=hW90uH7dSdyF/Nri3HQx0Av6AkeVn1n99HlMWuhoknQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p6kAsrLTw8OX38qd6i4pQd0M+hsaDTabPFxVINuCdQ4xhS2k+c1hdfnWLgFt6GgHW
	 +yjJdVfQBF5K9TMxRNt7ga07vAxzJRlLknE2ux8YsmXHOQqCuI6waffLLuJXyk1/gJ
	 90myZ2C2Vgdq2KWqHkKsuK5wOeZCkFrnECC4J6+Nh7ve6XvsKCi2B1VG3m2mlX7eMF
	 JvBnyss/OChDfLvw8Dxx521uTVcW8n1qbA6COWTfL/KgbQo0TXcTiRYHziAulEdyXa
	 +o+qRoM2sgx3Jq6u2NcEck+Jow/G77bqQH3cykxTYaz3KAuVHOogrQ/4uCKSw8xLUV
	 /eQALPLxJZX+w==
From: Jeff Layton <jlayton@kernel.org>
To: Christian Brauner <brauner@kernel.org>,
	Jeremy Kerr <jk@ozlabs.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 15/92] spufs: convert to ctime accessor functions
Date: Wed,  5 Jul 2023 15:00:40 -0400
Message-ID: <20230705190309.579783-13-jlayton@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705190309.579783-1-jlayton@kernel.org>
References: <20230705185755.579053-1-jlayton@kernel.org>
 <20230705190309.579783-1-jlayton@kernel.org>
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
Cc: linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Jan Kara <jack@suse.cz>, Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In later patches, we're going to change how the inode's ctime field is
used. Switch to using accessor functions instead of raw accesses of
inode->i_ctime.

Acked-by: Jeremy Kerr <jk@ozlabs.org>
Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 arch/powerpc/platforms/cell/spufs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/cell/spufs/inode.c b/arch/powerpc/platforms/cell/spufs/inode.c
index ea807aa0c31a..38c5be34c895 100644
--- a/arch/powerpc/platforms/cell/spufs/inode.c
+++ b/arch/powerpc/platforms/cell/spufs/inode.c
@@ -86,7 +86,7 @@ spufs_new_inode(struct super_block *sb, umode_t mode)
 	inode->i_mode = mode;
 	inode->i_uid = current_fsuid();
 	inode->i_gid = current_fsgid();
-	inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
+	inode->i_atime = inode->i_mtime = inode_set_ctime_current(inode);
 out:
 	return inode;
 }
-- 
2.41.0

