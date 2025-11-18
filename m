Return-Path: <linuxppc-dev+bounces-14262-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C358BC676BA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 06:20:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9XsQ74yNz3ccX;
	Tue, 18 Nov 2025 16:16:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763442999;
	cv=none; b=eNV+TRBX+C6poQPwk1AI5ogGvD7KZMOS18WurLYvD3amz7OZ2qicJYnnzOv47cKJTEMUFPalShnbjgKi0Ts3ol3vEzbh5xYbhSfYma4IkLOoi3umKzbqCOG87i9aJZOAhQ66UAmGzNMURrGQM3BE1DJMztrsKlJYt+9h5B66obZAuNX92ipwoRVo9nN+8GGg4CuXcL29nrClvFL3uhBAJOnrJEN26KQVIoKN1s1BJ9HiNbHfDdIkRhitg+LqmTXsTBy+l9hylY+aYgiLQCbfYueaw5mA9iXBlLBi6Zc3HHXjssBuoRMXIPhzEiVt1XQXk2GtNxlVpwgf1MLp11wmFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763442999; c=relaxed/relaxed;
	bh=LZ6yrPf10XyjUbpb0uoz9zDvZV76d0sxqTJxoq2o+VY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=duGQ8bK+kmn/zeRiKuGEbImo3Td2o3PYPtlZ8yRNW0o8tqBLh4JHkSGzKtNA7O/kaA2HDxhNXTBxt6wevT2i4hJsQ4eXpjHeEcB9jhWhNbGPwz3i5B6ULQ7WCU9oiz46STzvgrz5v6fm5epFEYHFeAIHq7POppjMX6bbNmDReuBifbeTAu9lAR2wii+qLEclh9NTlc8kZAzJDFXpDJjXj6JzZWGGzsJ9ZNDNBWeCGpEdJjkAQwLcr8deypjzZOxvZYQFJlF2RYn6zP1pL2DP+1W02JoDiEUU9unh/0ce9zsYtWpEdP2SRxfNpY2wpNjMEwP1sooFGwWj5uZzxaB2+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=U4N6FHfz; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=U4N6FHfz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9Xs06BQ4z30gC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 16:16:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=LZ6yrPf10XyjUbpb0uoz9zDvZV76d0sxqTJxoq2o+VY=; b=U4N6FHfzCrbb4azFmBn86hOncH
	so26EVVboKgDcIHc4NlNjYEgmAeLAcFqHHn/t/vo56xyfRQsxhg1YHRnMAAWaVNY2xD35h5jYh8k5
	yCfUGsKDh/bPgSRBJXsOPWFNagA+bppgRLXsGQ/yTJUOkhKA9V2WvyOxQRt+60nOdr3l//WnP1r3k
	6JXxdBHmyFKBis+FJb/2i7FGpynpeU4Gb/PvvgXdXoPlGD37K66yHbbJ8CLTqK63mNFUqFZZh24mm
	M+JqNVYMtGvdE7EL+ByCK96+52rNllm1LMZUcqbTbJMLt12x0is3C4q7BhBXF4em/I4Ucp3/jxwyy
	Pl/2JT3g==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLE4V-0000000GERh-1RuG;
	Tue, 18 Nov 2025 05:16:07 +0000
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
Subject: [PATCH v4 21/54] debugfs: remove duplicate checks in callers of start_creating()
Date: Tue, 18 Nov 2025 05:15:30 +0000
Message-ID: <20251118051604.3868588-22-viro@zeniv.linux.org.uk>
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

we'd already verified that DEBUGFS_ALLOW_API was there in
start_creating() - it would've failed otherwise

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/debugfs/inode.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index 682120fdbb17..25a554331ac4 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -433,11 +433,6 @@ static struct dentry *__debugfs_create_file(const char *name, umode_t mode,
 	if (IS_ERR(dentry))
 		return dentry;
 
-	if (!(debugfs_allow & DEBUGFS_ALLOW_API)) {
-		failed_creating(dentry);
-		return ERR_PTR(-EPERM);
-	}
-
 	inode = debugfs_get_inode(dentry->d_sb);
 	if (unlikely(!inode)) {
 		pr_err("out of free dentries, can not create file '%s'\n",
@@ -583,11 +578,6 @@ struct dentry *debugfs_create_dir(const char *name, struct dentry *parent)
 	if (IS_ERR(dentry))
 		return dentry;
 
-	if (!(debugfs_allow & DEBUGFS_ALLOW_API)) {
-		failed_creating(dentry);
-		return ERR_PTR(-EPERM);
-	}
-
 	inode = debugfs_get_inode(dentry->d_sb);
 	if (unlikely(!inode)) {
 		pr_err("out of free dentries, can not create directory '%s'\n",
@@ -630,11 +620,6 @@ struct dentry *debugfs_create_automount(const char *name,
 	if (IS_ERR(dentry))
 		return dentry;
 
-	if (!(debugfs_allow & DEBUGFS_ALLOW_API)) {
-		failed_creating(dentry);
-		return ERR_PTR(-EPERM);
-	}
-
 	inode = debugfs_get_inode(dentry->d_sb);
 	if (unlikely(!inode)) {
 		pr_err("out of free dentries, can not create automount '%s'\n",
-- 
2.47.3


