Return-Path: <linuxppc-dev+bounces-14249-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F22EC67648
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 06:18:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9XsF32yTz3dLQ;
	Tue, 18 Nov 2025 16:16:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763442991;
	cv=none; b=IAlEbOTrZQnI4UTKZr3CN+ZAELx51Xndo3IOe9edo+3/mjmlx0mP/XPgYOCbiKOrVvBFXJLeWeqbijysal6zuDRaVuPQ8mBcGmwE3aTl3CUL+POKhF6Th8kWkKjDSABtIpgiYS0sTJS0UyaBQxMGD6ZlY9mN2Kc+U8qFCdo9TohWXuyST63Nevru2bLuQZ2WDgg4ZaPsXVQkELD51jZ5yt0mp/wJ9gQSqH0PslLfRrr1TrM2xpIZTE5e9EDZJvWDhwI70F+pwY8t0w0L3NDdOsWf061TVDruhTStTh3zaX+exID1IXaQB52mq09IDlnlRSe4/I9Lhmv+YZ2V0YKcJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763442991; c=relaxed/relaxed;
	bh=3maaNWdAFQG6lKGkg4q4mAf3fnGzZVX1VVI0dDX3CYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H5fD4sLQ/mWHGo2s67n2Xj62TX8SrmTCbGzha5O+1SWd27OCVkiBedPlHRNxaeRZ57driT5BxEGHyrE5jQWMbKYgx297zbrAy2wK7ALtEJ3mWSBkJfAguV6J1eDF4GkFGH5lChEY0/DY/ABRsGWmN+9hpORMJ3LBSQvrFnpJSt//IJlnfwbMH9J9DdKL5MfhrpCahvE3/cbuU05PhMxo2isBBVtN0SlypHiXHYjPC2dLsex6ue88z2S6lEi4CisBHIxL38ySIIs4xlwQzV48U3laA9qPl0I527gjayYdMAz8OjpWVH6+IFZzpf+BH+E/KxF1ImlRyadbNW0AfSlvGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=cFv8SfpD; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=cFv8SfpD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9Xrz1wJvz30Vq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 16:16:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=3maaNWdAFQG6lKGkg4q4mAf3fnGzZVX1VVI0dDX3CYE=; b=cFv8SfpD4XhexPHCWH7/OaafAx
	zoyhLBt2gZ6Bo0exSZh/EUEd34RcxVWLSD7Ta/Iy1vivHDdk94UUme2dABOwuDIMDn8cYDrXVqgaH
	uVbNZBm4ZOairE9ghYr7dZqkJrX1l7sxHzbHrzYBzs8Y1cGdvKHYtTBLzOUya4Wwib7EWJ2/oP/0q
	uUJhsljVSMSwY+deCdkmeZoJzN2eBCKHQyuctBq+A0XuPcZagkssyT7uMiUGxws7ZVIgTTy/hTyp6
	XksFCJZEgumPee6QRATnW84VXYxOcx12OMZffSrYlgKBFeel+lcJq7TmOMdm4m+EEU3l077HnR4iF
	/JI7nb7w==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLE4T-0000000GEPy-2GRn;
	Tue, 18 Nov 2025 05:16:05 +0000
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
Subject: [PATCH v4 04/54] new helper: simple_done_creating()
Date: Tue, 18 Nov 2025 05:15:13 +0000
Message-ID: <20251118051604.3868588-5-viro@zeniv.linux.org.uk>
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

should be paired with simple_start_creating() - unlocks parent and
drops dentry reference.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/libfs.c         | 8 ++++++++
 include/linux/fs.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index d029aff41f66..a033f35493d0 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -2326,3 +2326,11 @@ struct dentry *simple_start_creating(struct dentry *parent, const char *name)
 	return dentry;
 }
 EXPORT_SYMBOL(simple_start_creating);
+
+/* parent must have been held exclusive since simple_start_creating() */
+void simple_done_creating(struct dentry *child)
+{
+	inode_unlock(child->d_parent->d_inode);
+	dput(child);
+}
+EXPORT_SYMBOL(simple_done_creating);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 28bd4e8d3892..f5037c556f61 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3662,6 +3662,7 @@ extern int simple_fill_super(struct super_block *, unsigned long,
 extern int simple_pin_fs(struct file_system_type *, struct vfsmount **mount, int *count);
 extern void simple_release_fs(struct vfsmount **mount, int *count);
 struct dentry *simple_start_creating(struct dentry *, const char *);
+void simple_done_creating(struct dentry *);
 
 extern ssize_t simple_read_from_buffer(void __user *to, size_t count,
 			loff_t *ppos, const void *from, size_t available);
-- 
2.47.3


