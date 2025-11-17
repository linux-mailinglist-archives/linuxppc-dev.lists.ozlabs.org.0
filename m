Return-Path: <linuxppc-dev+bounces-14227-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53951C6664B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Nov 2025 23:05:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9MJ32cVLz30gC;
	Tue, 18 Nov 2025 09:05:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763417139;
	cv=none; b=TsHGyaJuIoalVThjDy4bJ2m6ZDjhuIcZd1niPES7xu164crwf9DkAjOkm59CZ9E83NJoo+YK6K5m4jSBnICMHVwW6Eco+XrinmAo1mQlH1GeSHvPbpzOv2txnJVERnX/ZVaaMTe8upkeL9AY1e2behqLUjH+5zF0L+eNmZhge36CtZn3Yo0oof/FXrISkie6q1lyetcuGesBLYNDhC8JWr0/SBGKZpTWfOHEbj86H+jpmgIpIBJ5li+wiSTF/lYbKgMgq5U8dtpNA6IOfaTK2tq8S8Oo5SMMw1lcvSkOrEDxX3LgUzlLscUP1IxaNeyCH391DmYqNHXhQ2oek03HNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763417139; c=relaxed/relaxed;
	bh=NdoiPvduAJmban0XZT9fHwC8ngtnF/xlF3wyZoQDdKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NehVYzlNMpjWpxSkgwBRuD8+7pYXRnQ5P8VgAdeZJuPQTdRBcoBYzFFhWNgBLxtyQ3xGUqImFgXy0bi2wQJCf2LK3S56lw7XBFeetVdlBCYrxTzykyy3NYvKNiABuziUYBKC2dHp5xJ1fvBq62EySQIl94zTdF82bU1v8YR1aSN6GKBfbytqBJPvxeWo0Dl4NpjyEyfG7F5W9ewtTtLPHuSpl6rn+b5MHTfgMzsJPgIYoKa0STzl/qh3fHiSa/Un48rHHVOXq9p90lHLtqdpa0aRnPMQsqU7rp81EnM2PZawQss4qobK0ucDaWUwMNQCgs8oYVc/uqfUOXF+l0DRDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=nBqNNFGf; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=nBqNNFGf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9MJ2552qz30dt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 09:05:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NdoiPvduAJmban0XZT9fHwC8ngtnF/xlF3wyZoQDdKo=; b=nBqNNFGfdqKxxSVEFbkYBH7HCK
	RZfgjjxQt74gHErvaYYpkM2nEVrvPO8Nl+WDX/wqK5bDZXz6a3KmFOoolgEeeFQX8I6N9hEwOstb6
	eKW568HlCJUscl9G3yajgwQxt1BIpLKjeDl4FAnlEgHfYO7xY5nm8CaGpXgaNtawvouTB0dDnq9JP
	Iriyh0hzqdr24etHseBuYN8DJhgCquXEdYC8+yw394UMOgRqpndamrmYqV2cUQZeToveKbWGQ82ht
	jZa05E50eSuXK1dWOd9GvHgd9EgQKMc45jeQKbD3foNOO8qfNDPYv6IxQGLYsKYfSmPxms13r+lI5
	J/l4QRZw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7Ll-00000007Lbh-1xvx;
	Mon, 17 Nov 2025 22:05:29 +0000
Date: Mon, 17 Nov 2025 22:05:29 +0000
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
Subject: [PATCH 2/4] functionfs: don't bother with ffs->ref in
 ffs_data_{opened,closed}()
Message-ID: <20251117220529.GB1745314@ZenIV>
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

A reference is held by the superblock (it's dropped in ffs_kill_sb())
and filesystem will not get to ->kill_sb() while there are any opened
files, TYVM...

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 drivers/usb/gadget/function/f_fs.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 43926aca8a40..0bcff49e1f11 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -2128,7 +2128,6 @@ static void ffs_data_get(struct ffs_data *ffs)
 
 static void ffs_data_opened(struct ffs_data *ffs)
 {
-	refcount_inc(&ffs->ref);
 	if (atomic_add_return(1, &ffs->opened) == 1 &&
 			ffs->state == FFS_DEACTIVATED) {
 		ffs->state = FFS_CLOSING;
@@ -2153,11 +2152,11 @@ static void ffs_data_put(struct ffs_data *ffs)
 
 static void ffs_data_closed(struct ffs_data *ffs)
 {
-	struct ffs_epfile *epfiles;
-	unsigned long flags;
-
 	if (atomic_dec_and_test(&ffs->opened)) {
 		if (ffs->no_disconnect) {
+			struct ffs_epfile *epfiles;
+			unsigned long flags;
+
 			ffs->state = FFS_DEACTIVATED;
 			spin_lock_irqsave(&ffs->eps_lock, flags);
 			epfiles = ffs->epfiles;
@@ -2176,7 +2175,6 @@ static void ffs_data_closed(struct ffs_data *ffs)
 			ffs_data_reset(ffs);
 		}
 	}
-	ffs_data_put(ffs);
 }
 
 static struct ffs_data *ffs_data_new(const char *dev_name)
-- 
2.47.3


