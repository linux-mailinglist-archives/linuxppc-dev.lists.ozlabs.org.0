Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8587B199B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 13:05:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QtotdQ5V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rx9cJ3qrBz3ccW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 21:05:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QtotdQ5V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=jlayton@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rx9bS2gPFz2yMJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 21:04:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 32FD3CE1D18;
	Thu, 28 Sep 2023 11:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD4F5C433C9;
	Thu, 28 Sep 2023 11:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695899056;
	bh=vy4iAqS+2cdTey8A1Hl+Z+9oNsRq3NaJubtqW8MD3oU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QtotdQ5VeXWt9qtlPLzJfVS978zsBoD95Vsr3Vwe3/bMBUfsDw7LIoVItXc4yuUui
	 0qVKpaE8LAbipCamK4hwvmjgx+8OTbSajy6cy+Cb/UWvpUFqHhxDcjGopD9HYL9sEZ
	 hP6gCGRPRf1rQWybWszN/Jaa5+//XTPoPeDe0c7hSOLw08DlfPAJZC+AOyoI3eCFlQ
	 sqLESoWAUvzT8zYinaBp7EptGyIyiRmXptcmpIHirb4q1/8BDwNyy93KnnUV9LEAtG
	 MiZBgYvA8J2zUuauvH+sD4dAU+Gap1cvQNcvbZYoM2uRbh292ukBO+PRtJ9GaOBEjP
	 mvTBnCVYZthRA==
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/87] arch/powerpc/platforms/cell/spufs: convert to new inode {a,m}time accessors
Date: Thu, 28 Sep 2023 07:02:12 -0400
Message-ID: <20230928110413.33032-2-jlayton@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928110413.33032-1-jlayton@kernel.org>
References: <20230928110300.32891-1-jlayton@kernel.org>
 <20230928110413.33032-1-jlayton@kernel.org>
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

