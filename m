Return-Path: <linuxppc-dev+bounces-14271-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1197C676F3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 06:20:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9Xsd66NPz3bn8;
	Tue, 18 Nov 2025 16:16:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763443012;
	cv=none; b=LOSe3I02+pX5XGZfl3epjr1p4XLBEVhujTsJq61b/PLHWzHfEtEMkkVvuCJeVAw3acUfg01hymUOHmXLGzWcEjGgBWptIspvQazZQAUlS7zlkiul8sFFfw0vjoRPonfx9HgL8SHZT4PPimO6eXUBkHEVN+bOcBxxi0jsSZ6LwNmvxwOiFtyDMskuJU20OoX/hOOD7NYZPOUGg9VpPYf6m4VFeOAJedjRgmwHI25pE8f4je252Sr7b97KvMvl8VyTE8kyvqytBNMnoGS10QcoD45AmN+xC77avcLnPX60AM/4zN96iWGaBRW8LDN5TN+YbzF1STlzuWiZde3JSaRHZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763443012; c=relaxed/relaxed;
	bh=4iwuLyMN17JmghA7oE4FXYqqV44QgzYixBKeo+FLe7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nCIs1ZKPnQ8sGBvlQbfe7a7eqTJ+h9WtmYd/CupQwYZJyneYzwS46ToR/SDL/30lZsz8djH7VDM9LanyXmg3Z0ndPozIt697lMxNwYBKzqrf7E41TXYB57T4h/KKPhGyPCoSrbSq5IMPbKiGmfDUJsj7oyuRv8n+U+37Q7NyKbwVs5e5zSNskPPw6fH2dRs9MdFUHEKuSYlDxaMFcbkn5VNO7M9x0oPNLPmOKAf+oj1ZKLpLT39Xm0+m+XUVyECmJxV3xGVM9D/f24qTKJ/gR2iH98W6G+DpWzgBY6z69aweDrR3MXbNeUu2DT2nP2hA3ejuRIb6jxRP/IbrrDEM5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=BapOXWjG; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=BapOXWjG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9Xs23CCjz3bdW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 16:16:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=4iwuLyMN17JmghA7oE4FXYqqV44QgzYixBKeo+FLe7E=; b=BapOXWjGs2VkVmavXIaruV9LIv
	fif5sNmvyXkkdrDgGBqvJe+gDqebM9jIRxp8VYwkQif2zT7dd60tH6gnsbnKJeM80HoeSo8cV3S/J
	7cvPXxsjHToUl2jyND5pdDnRqaqtmtee59nhp5aprgpMxQ49CNkCGicip3k3PR8jUsIkblO/bI4AM
	FcZG/9n0w2l0fF1uIyvfPbBmcvlR1gvM0n4aSfF2z+EJTtM5gBvSDcBVlz+eaYrnZbMLIYqc+tCHW
	WlzE5x5ZPhulvSTyNPvpiHrztKiIo4U5K/NsolyfyXElZgmK57FrofPikDQX4EEONIKZdExG+oCeI
	/m1h14/A==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLE4X-0000000GETR-0lJW;
	Tue, 18 Nov 2025 05:16:09 +0000
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
Subject: [PATCH v4 38/54] functionfs: need to cancel ->reset_work in ->kill_sb()
Date: Tue, 18 Nov 2025 05:15:47 +0000
Message-ID: <20251118051604.3868588-39-viro@zeniv.linux.org.uk>
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
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

... otherwise we just might free ffs with ffs->reset_work
still on queue.  That needs to be done after ffs_data_reset() -
that's the cutoff point for configfs accesses (serialized
on gadget_info->lock), which is where the schedule_work()
would come from.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 drivers/usb/gadget/function/f_fs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 0bcff49e1f11..27860fc0fd7d 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -2081,6 +2081,9 @@ ffs_fs_kill_sb(struct super_block *sb)
 		struct ffs_data *ffs = sb->s_fs_info;
 		ffs->state = FFS_CLOSING;
 		ffs_data_reset(ffs);
+		// no configfs accesses from that point on,
+		// so no further schedule_work() is possible
+		cancel_work_sync(&ffs->reset_work);
 		ffs_data_put(ffs);
 	}
 }
-- 
2.47.3


