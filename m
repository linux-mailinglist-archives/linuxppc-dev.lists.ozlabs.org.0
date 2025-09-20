Return-Path: <linuxppc-dev+bounces-12454-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27603B8C233
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 09:49:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTM1Y1V9Jz3d42;
	Sat, 20 Sep 2025 17:48:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758354496;
	cv=none; b=QfsYoi/4R/9U2R0u9sij3016Qu8e8CfFX6K6XoLBHlY2+5WIU7CGaZ8+Bd7l6gSulk2og/mZdjgdcCPFKdV1AQUJlV2MkK4BZK/cGJU0ILCMgRDo6XtKRV8EEM3eLWXCjXwtxF3gqFmoMFcWQmPVVBx7uOm6r5cSFPVvSSiVIA153/9lRIxzVhu5Ef/XEDZAZsI97Bf3S/7FGdC4t2iYAxP/SfKmP9f+CtXK1IznoC8RFK0DjVCt168BLVoi/PDp9scrih43sTYGrPiRt2KMcpKcmq8MA3gK48SDxEcZipbjAMF+cOA+uS9c7zF6bpPRQRpWkXNok1pLsKWk3Qq87g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758354496; c=relaxed/relaxed;
	bh=09KvsjW0ORXF5yAgFsWr4BmJpUanJ8JfB+m1F7eGQps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YhIxhVdjc0IfTRZzUCbvvnXuvezZhQzdE10YLcRh01fsql+gxmz01NWvPZBqRcl5dGGIuvJEYqRtaRjpjgoxSFCg+orYvipvVRfWVdgSREIKFqxctpQRYOq64VftnZLHqAHoyIOsKhMJIUOoyiOQ5D9tvndDcpWwmHK/EDsPaNB46MccmYh1yS67jPPhCcsVeeF6bJN4EnAPU9TFI9wI8ruNSEcEux5ujh0LLlZhYNn77qayuP4iWXuN8Uw49FGEh54yRWpoNQ0A9AZTmdmRAtzcpY7GhO6c0CrNN9jfjiqQNZ8WgzeXu0GguZ8/ZE/PoQvHEMs6Pr2ug4XmqqvPlw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=jaQK8cKf; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=jaQK8cKf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTM1R33WBz3ccF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 17:48:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=09KvsjW0ORXF5yAgFsWr4BmJpUanJ8JfB+m1F7eGQps=; b=jaQK8cKfGBnniJ4xeduBuQ4mdy
	Z8Qh0j68aqBnrjxEeoVTW67vl2L9GR+wcjUmE89Mle6Q0bb7rqeHVynY9bc9tpgu5c4WmNLaHTz8X
	pFRwaQvcdhRslmEdhfemL9wmhLt/ZRnjNK8/6wVMphnzkYT81oAUr3WBFPmzUNXaKcTJoPn5wwBwc
	3gT57+VI+M0C00eOsH5pS2UWTzhm3bdqs39h/XrVkl+cBOEFT7NpLQAwdCOKXhmimfGv9/rNxJhf8
	Nk/W5J5B2wgPV7mcNvQdzkMn0mOJWtnkhY+5Q6eDuX1azINcV1hEDsPAZ76dQYgApjHI3y0T0qVvI
	VWGDlqAw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsKC-0000000ExGw-3OF2;
	Sat, 20 Sep 2025 07:48:04 +0000
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
Subject: [PATCH 26/39] binderfs_binder_ctl_create(): kill a bogus check
Date: Sat, 20 Sep 2025 08:47:45 +0100
Message-ID: <20250920074759.3564072-26-viro@zeniv.linux.org.uk>
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

It's called once, during binderfs mount, right after allocating
root dentry.  Checking that it hadn't been already called is
only obfuscating things.

Looks like that bogosity had been copied from devpts...

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 drivers/android/binderfs.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/android/binderfs.c b/drivers/android/binderfs.c
index 41a0f3c26fcf..bb81280a3e9f 100644
--- a/drivers/android/binderfs.c
+++ b/drivers/android/binderfs.c
@@ -395,12 +395,6 @@ static int binderfs_binder_ctl_create(struct super_block *sb)
 	if (!device)
 		return -ENOMEM;
 
-	/* If we have already created a binder-control node, return. */
-	if (info->control_dentry) {
-		ret = 0;
-		goto out;
-	}
-
 	ret = -ENOMEM;
 	inode = new_inode(sb);
 	if (!inode)
-- 
2.47.3


