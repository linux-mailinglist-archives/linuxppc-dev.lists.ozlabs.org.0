Return-Path: <linuxppc-dev+bounces-15781-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B545D2369F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 10:20:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsHX95Mq6z3blr;
	Thu, 15 Jan 2026 20:20:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768468841;
	cv=none; b=FvFnPPCBniAowk5tNpc2ainOuMRbk5hs7gRaowofpOquDIN3+EQPubx5MXDHKOE5LguNJzQew8EgxzaRvexDUjcCpwF9xh4QxSkzKmb8VOgFE37/ZbitBj+yqkB7ClAyO/2Gq6YFHkiS+h9P46FMLhBC9s3HQAnpbFgAK1wAHVv2EUvT17ILdE7fE+lO9cS5YdN8BvZ16kWFDf8U12dbI/x8kyd37QJJina+mAuLZCgikioZ8WxjPzQzX3NXeeTK71o0w2Q3M/QBs6Krer69fioUYveE0OxnSNd4ywErTgcHj83TC+DhQuJxKFWtLKdG6ocfLvUFGVRSNvYyN8PPwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768468841; c=relaxed/relaxed;
	bh=VGzDOwsL9PM7UwrJ0Pfn+jHlKv9JLZAV7ra+lwOfVXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GIdtOECwOBC7HPfeBfnTFqz+2ycgjKA+Y+fJL2s24et8RtKmDPtdRnZ64mdFUUn7IeDGGgr+bMtreorwnuCKvOfEmJOoKXapWF+yV/WUkxsGetpL1JADz7O6e6iWFhfD/j2ZuuwhnV6QVMWUqvTPqpeQmu8w/zttaCMfByxu+buCpbnM241mShfw0uHZJuSR451jyvAdlZ6XnUpyz0te0xY165YtKQjygNMLj9c9SnqJ32EAMTWvl3wu3FIavYrmhQ9wy3FlwdGrY7o3HimX1kfjtLCOtUKPmuzqzfORp/aJCkIVkFztqvQN/RwTIvkJwtu0QTkR1h+nRxgwpFvFpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AsKfcaRm; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AsKfcaRm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsHX86gQkz309H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 20:20:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C81C143923;
	Thu, 15 Jan 2026 09:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E52C116D0;
	Thu, 15 Jan 2026 09:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768468838;
	bh=Cgrtz1QRoaELES+PU4SN1wm9f3oPVqbLP/yVshCylTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AsKfcaRmJZR6QBoU2B6nA9WMeBDA1v0qFPTd0qrx03mzDkR5Nrbczuc/sWxeXRHPh
	 lq/FejhHEwMDemtiEzRaYK4TIBbMeGt4lXFbXhrUoYJsK8G6EEcTPcwzPMi+pFTb4h
	 F5+Rbu6bfB7cE3xBuYoT7INyzSbIiUHSlgPZwn8SetNoCS3XFXiPppFn/TGtmh+Qw6
	 Z6Iqq4cTql/fEOx82g1l+T+EDPub/eL5mnJL7Xs8eIjUVNdfPIstSZHPehcNI4ppAo
	 xcD8CZAfM7SEpMPAqxuRjP5ye4s3qDPmZ0Mzbyf955aFmneF9aDg0oTAVP0NWDlgVu
	 05tHWJAZpuPjw==
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev,
	"David Hildenbrand (Red Hat)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH v2 02/23] vmw_balloon: remove vmballoon_compaction_init()
Date: Thu, 15 Jan 2026 10:19:52 +0100
Message-ID: <20260115092015.3928975-3-david@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115092015.3928975-1-david@kernel.org>
References: <20260115092015.3928975-1-david@kernel.org>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Now that there is not a lot of logic left, let's just inline setting up
the migration function and drop all these excessive comments that are
not really required (or true) anymore.

To avoid #ifdef in the caller we can instead use IS_ENABLED() and make
the compiler happy by only providing the function declaration.

Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
---
 drivers/misc/vmw_balloon.c | 30 +++++-------------------------
 1 file changed, 5 insertions(+), 25 deletions(-)

diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
index 2cc34c4968fac..07e60a4b846aa 100644
--- a/drivers/misc/vmw_balloon.c
+++ b/drivers/misc/vmw_balloon.c
@@ -1833,27 +1833,10 @@ static int vmballoon_migratepage(struct balloon_dev_info *b_dev_info,
 	up_read(&b->conf_sem);
 	return ret;
 }
-
-/**
- * vmballoon_compaction_init() - initialized compaction for the balloon.
- *
- * @b: pointer to the balloon.
- *
- * If during the initialization a failure occurred, this function does not
- * perform cleanup. The caller must call vmballoon_compaction_deinit() in this
- * case.
- *
- * Return: zero on success or error code on failure.
- */
-static __init void vmballoon_compaction_init(struct vmballoon *b)
-{
-	b->b_dev_info.migratepage = vmballoon_migratepage;
-}
-
 #else /* CONFIG_BALLOON_COMPACTION */
-static inline void vmballoon_compaction_init(struct vmballoon *b)
-{
-}
+int vmballoon_migratepage(struct balloon_dev_info *b_dev_info,
+			  struct page *newpage, struct page *page,
+			  enum migrate_mode mode);
 #endif /* CONFIG_BALLOON_COMPACTION */
 
 static int __init vmballoon_init(void)
@@ -1873,12 +1856,9 @@ static int __init vmballoon_init(void)
 	if (error)
 		return error;
 
-	/*
-	 * Initialization of compaction must be done after the call to
-	 * balloon_devinfo_init() .
-	 */
 	balloon_devinfo_init(&balloon.b_dev_info);
-	vmballoon_compaction_init(&balloon);
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
+		balloon.b_dev_info.migratepage = vmballoon_migratepage;
 
 	INIT_LIST_HEAD(&balloon.huge_pages);
 	spin_lock_init(&balloon.comm_lock);
-- 
2.52.0


