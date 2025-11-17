Return-Path: <linuxppc-dev+bounces-14228-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFFBC6665D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Nov 2025 23:06:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9MJp0xCLz3bb2;
	Tue, 18 Nov 2025 09:06:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763417178;
	cv=none; b=AVKXwudqaTAk8y+70wJpLa2Q9h/dH1pdW/kxOJWPeh8a4RyFtjX26Yxr8ag1DHkphHFHkHjVCVqh6zNKqahOEX1ZlIU1OcFJTjkjPXp+QXtYNLLK+PK+wzKz64clwEeX6k41RxfpWMqOajz540dRFoUwO7tC8iqZf5mA2ueHUr1fOAjIHVBI6kBKhHrocY+/B3Vkc13C/BugCQvqDXYOcsBa8PeZzGkr27xSpagH84laQDgVTGSCzSOlPeha8yNX7n402G+t3VJY6gdo7BQnjQNLngyVlgOGmHDn02PKXHBSUG872IhBC8Hhhqi15wlhj3aouHuNUyyd6W0gFQ+wng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763417178; c=relaxed/relaxed;
	bh=cWu60E9A6eXyK8hzFZrjRSDEhFiIM1wWoXt1TAJWCcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LWf+LyBQc0LCTLOPw4dO5dEKLws5vtD1SwSBwJfD7CSBGNfAjfSVLB+JSo4FigCWz1u9kVkUzuDyMq9WDk3G9++jGCpugHbq5o4KtTFyJZfuVF2KJvHrNRpqlrYncLwUC8J4A9dS7HlEcchdyEuUnua96xP2HfDjSZaPi4m+MfIRN/yWSt/3BltI06fk9Ywk5ai8uCfrrezwBqHFkXhSgJxwq19lv+dbp1+614LjXIkZhgYTXz50JdF+sK1gDWsvrdKlNXmUmraesQzKoFKBU324ZO9h520yvnglFhOKuvxGhwfxsaBOQxMF10HTdi3qZV0+hXXfTTRK0ndwsGRWHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=pqNWxOKL; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=pqNWxOKL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9MJn2Jykz2xqr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 09:06:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cWu60E9A6eXyK8hzFZrjRSDEhFiIM1wWoXt1TAJWCcw=; b=pqNWxOKL+lbKRWfwobdUpl+/CV
	FcB+NN4AnY+inY4vDZGGcMrdUGyeqhRm7MfkvQuub3rnJfDwBilzKnvLWSwotdOFmy7j9ZACrxOah
	bI+DiB2vEhxdAsNCrUqPAcG+4DnBsP4tTJsXlbNqbm4xhcmuZDcb4Xv2P9y/KmD/wK1zeAYOZCAnc
	M+7iRmhBwl+iF9VqgMjyYbEp48RREHAm09kCiAeBo5irXFHK83o47/cHAXqVvTI1NvdDqD4DdbzgO
	Mme0uqmBRdU1Piy6uk54hLooqG0LNlg6hm0MiXcK+rUE3cQx0+SOKw0v2SRLNhld45JqeQ6WL3lJb
	Sp9BIcFw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7MP-00000007MQ0-1yLf;
	Mon, 17 Nov 2025 22:06:09 +0000
Date: Mon, 17 Nov 2025 22:06:09 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: bot+bpf-ci@kernel.org, linux-fsdevel@vger.kernel.org,
	torvalds@linux-foundation.org, brauner@kernel.org, jack@suse.cz,
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name,
	a.hindborg@kernel.org, linux-mm@kvack.org,
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev,
	kees@kernel.org, rostedt@goodmis.org, linux-usb@vger.kernel.org,
	paul@paul-moore.com, casey@schaufler-ca.com,
	linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com,
	selinux@vger.kernel.org, borntraeger@linux.ibm.com,
	bpf@vger.kernel.org, ast@kernel.org, andrii@kernel.org,
	daniel@iogearbox.net, martin.lau@kernel.org, eddyz87@gmail.com,
	yonghong.song@linux.dev, ihor.solodrai@linux.dev,
	Chris Mason <clm@meta.com>
Subject: [PATCH 3/4] functionfs: need to cancel ->reset_work in ->kill_sb()
Message-ID: <20251117220609.GC1745314@ZenIV>
References: <20251111065520.2847791-37-viro@zeniv.linux.org.uk>
 <20754dba9be498daeda5fe856e7276c9c91c271999320ae32331adb25a47cd4f@mail.kernel.org>
 <20251111092244.GS2441659@ZenIV>
 <e6b90909-fdd7-4c4d-b96e-df27ea9f39c4@meta.com>
 <20251113092636.GX2441659@ZenIV>
 <2025111316-cornfield-sphinx-ba89@gregkh>
 <20251114074614.GY2441659@ZenIV>
 <2025111555-spoon-backslid-8d1f@gregkh>
 <20251117220415.GB2441659@ZenIV>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117220415.GB2441659@ZenIV>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

... otherwise we just might free ffs with ffs->reset_work
still on queue.  That needs to be done after ffs_data_reset() -
that's the cutoff point for configfs accesses (serialized
on gadget_info->lock), which is where the schedule_work()
would come from.

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


