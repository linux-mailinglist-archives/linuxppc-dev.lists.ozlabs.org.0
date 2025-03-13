Return-Path: <linuxppc-dev+bounces-6943-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09208A5EA8E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 05:28:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZCvcy5Rl5z30Kg;
	Thu, 13 Mar 2025 15:28:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741840098;
	cv=none; b=YhzEOuvgMjwj8g3YNbdYpVDNuFRJj93dV+aVkr1F+9zbOa9ClvgyI8pSO3Ay2AYr9LuoEEVS0QBVbKM/5g3Lphf5+e9ZnUuM3irlDpwrOpBK73WqjzrfRcSbD2sc1bVC9kjMYX6w3wGrY2KT9fOb0t2/Bu2Mn34lnkCLdWEohr1MjoSXq3h//OUtaKeXXx/qP1Q51iwt+CjtSk6jEaJqHi6OzScxYU7vyRsHC+g0bNUOxecXE2on2Ot/XLU2jjeJTpb7KkUgm7+Vtwu7pDOdoody6dbSNrl+C4zGgOSmeFdXKeIyxhDrj0vWNy5so3LW9B12KyXdVhBeF4Sn6OpUHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741840098; c=relaxed/relaxed;
	bh=0BP8MfTLuj9N3cb4tR84hglIRqD5ctl8ZjP83WvUF9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fe885HTNWN8bKKyQAK5uOF5o1p4s8kM/GDlCkpwF8SyeavuI/SiuwZRehOcXJZdk7HrwhUpLjBMuL49SsrWa7HxYh8sfaZYsjw71tv0+Aq35H4FtMkwjdVYAG/WSkzc+GfSFTTAvxIDP4oJC9uVCaVgFZMn+eVtbFCKrVZ46S3thrG7jW+rxiRKdXn8hwJcJ7h5mvszyPwczi5jbIGlQWGTeYDgwowJ/knKEA9RJABI/WXIwUE3cr4ZPwivV29eboQaTih/11sWYqhNjYtf9ToqX6GE4/MDJpk9DSKr8N3OUW65hjBVpuVxpE6ExHpDXznpbqwcwsRMKK3siY4+pfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=pBTHsjpL; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=pBTHsjpL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZCvcy0PCKz2yn4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 15:28:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0BP8MfTLuj9N3cb4tR84hglIRqD5ctl8ZjP83WvUF9U=; b=pBTHsjpL1jvToEEn5hmZzajt2u
	umPZBo0JNyohTPH51UgCJPPsfaaWlChpDgzaqSzdA67dH/ZAk7ZQmPq68EqzBK0fELPHJ6CK8+fu2
	1PNa6nCDCQHY3m3P36WrpcozAV2eWK0co7zHe+IHr+U0QfJzaHkKcoeGcmoqQKIAi30sjHVUt5kYY
	Iogo0vEVNfmhoLNCt+rGrtVr8l4LAf4OOvmhPTPKjb/KaKNgsYXkKWfcQK3k7QZ/IW7IYsSSWaefD
	/5+UE+JcU7hiNO/j7Lym29TYRu+qNYMZe16CoQYLMzfo8pBwRE5Dowd1Zw879/uHMKdEy32g5TGhh
	C6n+TzBw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tsaB5-00000008udD-2yth;
	Thu, 13 Mar 2025 04:28:15 +0000
Date: Thu, 13 Mar 2025 04:28:15 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-fsdevel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/4] spufs: fix a leak on spufs_new_file() failure
Message-ID: <20250313042815.GA2123707@ZenIV>
References: <20250313042702.GU2023217@ZenIV>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313042702.GU2023217@ZenIV>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

It's called from spufs_fill_dir(), and caller of that will do
spufs_rmdir() in case of failure.  That does remove everything
we'd managed to create, but... the problem dentry is still
negative.  IOW, it needs to be explicitly dropped.

Fixes: 3f51dd91c807 "[PATCH] spufs: fix spufs_fill_dir error path"
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/powerpc/platforms/cell/spufs/inode.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/cell/spufs/inode.c b/arch/powerpc/platforms/cell/spufs/inode.c
index 70236d1df3d3..793c005607cf 100644
--- a/arch/powerpc/platforms/cell/spufs/inode.c
+++ b/arch/powerpc/platforms/cell/spufs/inode.c
@@ -192,8 +192,10 @@ static int spufs_fill_dir(struct dentry *dir,
 			return -ENOMEM;
 		ret = spufs_new_file(dir->d_sb, dentry, files->ops,
 					files->mode & mode, files->size, ctx);
-		if (ret)
+		if (ret) {
+			dput(dentry);
 			return ret;
+		}
 		files++;
 	}
 	return 0;
-- 
2.39.5


