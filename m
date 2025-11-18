Return-Path: <linuxppc-dev+bounces-14268-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9D4C676D5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 06:20:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9Xsc0kZ8z3fQh;
	Tue, 18 Nov 2025 16:16:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763443008;
	cv=none; b=FUhBxro5KByoIJMyPPdiOsufBXTUvdx00e/8Rg4YtqHB+1jGeucjQvM4QiCIJ8Q9HIS0yjVteU9A1zWSm+MZALvkqcvS/Albwgv8bdXcIy3N7IWHUpagHqe8RIYkIrYMdtZpSVF10lEIEqtUIbEdDQu16E/vfaI3idfSFVqmduqOjOMRWcHy9Otqmpvt7OIjT23Jl7Ifrl1FDUDNO0rl7rs2E0SqkDvjotQdqkJP6T4eYO4y5ymx9ceUyPSs5bU/3q0Tak+ADTwKVcd2Qga55QXHh6qezcBXWQ/2c6L+G910e9onwToiwT/1+1oYlsmuJWBWwYC2QbRKB0+G0PjD7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763443008; c=relaxed/relaxed;
	bh=Wj6NtuoUx6rorSoJrKwRjGX8DQ+3LbRm6UPbWp7kXpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lfuEst5zjouWjfgw6LwEDBVjnh1f0eyleYvecGAyCa1ip2oHNbBmYhGJIqj3kYl0nDOlHK3yo95kTpg8rkqkiVJRSiHBKbI/wtvOqKxmr1gpvU/QEJtDYI15bG9BjCvPmAueDbA/VYRLw7UK+YIFh3l8oVlljJW4mxaqw92oGa68Mz6nbPGehgTldSnRG43/atch5WIV8NxcDz2WM/zUJ/LzTErZS1Y7L4DyYWNW/iiQycLpJ1xgYDExb0JQqD1QVyID9TEPVD5o0y9kOHFTqm73RsvLEJgxhWp3JdJFvPQrtSJijLC4b48yQ+uA8JPPC7xQyDMQ7FHa0UBQDxpZxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=kRoO2gVK; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=kRoO2gVK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9Xs14K9tz3bZf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 16:16:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Wj6NtuoUx6rorSoJrKwRjGX8DQ+3LbRm6UPbWp7kXpM=; b=kRoO2gVK7d/cWqBJ6oqBUlnxJH
	PhTjJHkTsQ83nuQ9+vhtRJ8QzehJ3LyLXh5vXFlKySjTDD2J39bDe/QAeQjkboxVZ3qqGUZIHXKnt
	t2CTLX+Q1auCj0k9O/9fdY+TiRGfykMKhF0OVCj2HS3tmT7w+g5QYzstUb/2rtQknF5pkF2vamB4H
	RYoIoGtUJrv8jQISXhpX1bgNQKTKn/LFLjd7/h5fo4kg7ypdg4GaP8sX0RyEPxEjIEOS/Dr+nz0GT
	JreJhFuS/cYBtc965Q+g0ADUymVs0TT+phfONbdrB9vnyxiJde8/FCIJ/+y7e3z23zj+RnwyTeLEq
	Ww3jTsBQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLE4a-0000000GEhn-42P8;
	Tue, 18 Nov 2025 05:16:13 +0000
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
Subject: [PATCH v4 53/54] kill securityfs_recursive_remove()
Date: Tue, 18 Nov 2025 05:16:02 +0000
Message-ID: <20251118051604.3868588-54-viro@zeniv.linux.org.uk>
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

it's an unused alias for securityfs_remove()

Acked-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 include/linux/security.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index 92ac3f27b973..9e710cfee744 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -2258,8 +2258,6 @@ static inline void securityfs_remove(struct dentry *dentry)
 
 #endif
 
-#define securityfs_recursive_remove securityfs_remove
-
 #ifdef CONFIG_BPF_SYSCALL
 union bpf_attr;
 struct bpf_map;
-- 
2.47.3


