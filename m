Return-Path: <linuxppc-dev+bounces-6945-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C95DEA5EA95
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 05:29:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZCvfR3Z4dz3btc;
	Thu, 13 Mar 2025 15:29:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741840175;
	cv=none; b=FCaMrYAE76FD4OpsVVBkobrNPSOiRvvBf7i/+/02mJBke8CjVOEc7W3HrZi8tb4Db6c+C28W5JMh6PZvFU5/m/gKsz0fClxdN16SL1M5i8fzT28B1sU9Gq2GclDUr8APp9xqtc8BNYV+cCpwDvB7zrXpNzez0znzJhxW4i0S5IdKkXrrVztbXyM5tswHUwmpEX96XoyC3AJQyhV1Nsv1W3xIFhKM1ZAatIOS/CvHejVLL1Q5cGSvMNJyGbZ5C4Gy3S5b5FxIVqZs3MPvqhgU3LVtSIA/K3lbsT1S2r0q8rI1QVlewt4kf0rlpww56NYtcAo0KL1KZJJakoFUgvoNyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741840175; c=relaxed/relaxed;
	bh=r3XimgkWh+v3Pk6WwqVJOIdff7gbdmDD9MXU+Y8RHIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZEX5zTsrauWXZaZxOOut1JLnK77pkUGwInuv11ry/gIayzqTbp3RwRNBlZVwxH3C8kHZ9pRh4FQuq3WIVwQspAMz/5KpYpG9zkgBxzFSze32hsoJuP3qNav0EtFdvnnRiCa6O+Bi2bqxQFPOAKhZNiu5oYgTkcMatTGskLK7iVfP7a7kr3qJgactJhChAL5314csaMcj/dJrFuXFpBXAyhjv7ikUsXTssG5w5hZtGC6O1sHcFpl14JrGNz0U0g1feGRn3Rf2JSWxY6dmS7ngDsAx656eozLx16us5x0YF3V+P0lP1/G7JKFG1etjrZYmwj6+U5fCsMXk/Z3zbtqKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=r66vlrB3; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=r66vlrB3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZCvfQ5fBqz30RK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 15:29:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=r3XimgkWh+v3Pk6WwqVJOIdff7gbdmDD9MXU+Y8RHIs=; b=r66vlrB3EhAsHruV5Zd43iQCcZ
	MqLOiTBQvehkbnlCsfWJ5O80Y+lHqwklIM5oSDOIualrvlmxEdvpMe4WHwQfbk6jk3t1tkqlQKnFC
	Neqjp6kEvHVCBkeRkfwJDGIe60gs81mUFxGMiLL5IgS3Bni5+vHEqffJs9gSbIfiMQP4HoGWlzUNg
	UBtWl+4le960Fnory0ZqWz0bprxxfG0+bF2digYEXVaXgYqM0I/gdcBeHWuixivzc0LdXnYrerGTc
	2hccnJHRj8dpJZFNeiRtLhZ4SV8l5YNkYzuaoQhHvxkCDg3nw3sMzS11F+9jOZlHHWnHsAHJpWR8/
	SvRQoCwg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tsaCK-00000008uor-2Ufy;
	Thu, 13 Mar 2025 04:29:32 +0000
Date: Thu, 13 Mar 2025 04:29:32 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-fsdevel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/4] spufs: fix a leak in spufs_create_context()
Message-ID: <20250313042932.GC2123707@ZenIV>
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

Leak fixes back in 2008 missed one case - if we are trying to set affinity
and spufs_mkdir() fails, we need to drop the reference to neighbor.

Fixes: 58119068cb27 "[POWERPC] spufs: Fix memory leak on SPU affinity"
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/powerpc/platforms/cell/spufs/inode.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/cell/spufs/inode.c b/arch/powerpc/platforms/cell/spufs/inode.c
index c566e7997f2c..9f9e4b871627 100644
--- a/arch/powerpc/platforms/cell/spufs/inode.c
+++ b/arch/powerpc/platforms/cell/spufs/inode.c
@@ -460,8 +460,11 @@ spufs_create_context(struct inode *inode, struct dentry *dentry,
 	}
 
 	ret = spufs_mkdir(inode, dentry, flags, mode & 0777);
-	if (ret)
+	if (ret) {
+		if (neighbor)
+			put_spu_context(neighbor);
 		goto out_aff_unlock;
+	}
 
 	if (affinity) {
 		spufs_set_affinity(flags, SPUFS_I(d_inode(dentry))->i_ctx,
-- 
2.39.5


