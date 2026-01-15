Return-Path: <linuxppc-dev+bounces-15782-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB8BD236A5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 10:20:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsHXJ5qDlz30Lw;
	Thu, 15 Jan 2026 20:20:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768468848;
	cv=none; b=fDvnv/1G4aHjK06Wt1AYHdblKTkkm4HGlQ/WA9QjW3489+kMF8PKm4J6ac2jzxZWc6uQq3tDFyUdBC2taWaC30OkYwxIlzzldZSMdK+FfoDIKiBJZSKqDz6q53xeXWGt/+8NgRwspGtlVGts729V8EEAJtGhIMKKX9DXhJZjxn7FrbcBBAq+hn6QAJZSbtu/zWMdV0sbHaHQAqHYXUWaworI88fKCHI2RHI07ZRAJfYRa0zUABQMbbfjDZJFU+Jyh01Hauu64AaqlFf8cCC9foGuJ5huUvC3CknZupwFqYOGkSIqWVURKt3vbqJO+HuJxrdKSCJawrKWE6aiy9Pb+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768468848; c=relaxed/relaxed;
	bh=Ieq1MZjtKDgONKkNsiPAzXbKhcbuGXOsaOcGRgMyjZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MyBFq3KNY9QGCz/PvwFpF/I/RHbKfbgxq49NZBLXmTB2aYaB1SB2xDXbmAtqGZ32JLR3XkBQE356HqyxvPybBQsOH628GHW6cTjYZFQsG4sEoFVdcUSaIqyi5WyDjfxHK1aeIiNorm2gJhk5SGlAEjOZl6vL3AIoFqsRpbAWUJj2HDfYcYp5UtV288zCpQpmvlyBvzIG5MmdIbIBaV66GjrYs0TpweuY64qJKDX90x8OdxKac3vqaiM4yodJfus/pqyLJXS7Io9v7221M3DV3U2DJUKcBZ1prML0YpbRedySUcJ1TVIttSo91RWrEXbRacQHfiFqiBFM03r06R2hjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j/0/kout; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j/0/kout;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsHXH6SNvz309H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 20:20:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DFA0D601B4;
	Thu, 15 Jan 2026 09:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5EFC19421;
	Thu, 15 Jan 2026 09:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768468845;
	bh=9n8n+0cAzQ7vmJcEe9QB+II3uYJrH/Btd/75YDVJ8Ps=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j/0/koutXAAcP4I/4wro7W2QSvhddotARmsvMnQOx/nzQIh10ziCaQHXsjHoEOaqy
	 9bStFDwBLQn+lyP7xAZl3tkeGlvdb/CfyfjgsPqyrFtIrPmMOjYEHCV/23vKdM3v2d
	 KF9izQF9jAfa8ikcz+ZVZRrh9C7c/EFrXqAd6cLHHb5isfFKFyvkvam/DWsGPYByUh
	 d0nFia07jUa+e8BhXn+l+bfo0gQ+g7UMpuOJuMajOPz0SU7EAuzCbp9zimxyEJBCZM
	 ozDNgFuo4hwg9rU0B01n59OPHAlC1mgdXGgF//ZcI32EaaNtkCdbeEaFLywkokzOQ1
	 oC1dqiHkWvLzg==
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
Subject: [PATCH v2 03/23] powerpc/pseries/cmm: remove cmm_balloon_compaction_init()
Date: Thu, 15 Jan 2026 10:19:53 +0100
Message-ID: <20260115092015.3928975-4-david@kernel.org>
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
the migration function.

To avoid #ifdef in the caller we can instead use IS_ENABLED() and make
the compiler happy by only providing the function declaration.

Now that the function is gone, drop the "out_balloon_compaction" label.
Note that before commit 68f2736a8583 ("mm: Convert all PageMovable users
to movable_operations") we actually had to undo something, now not anymore.

Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
---
 arch/powerpc/platforms/pseries/cmm.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
index 4cbbe2ee58aba..9a6efbc80d2ad 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -548,15 +548,9 @@ static int cmm_migratepage(struct balloon_dev_info *b_dev_info,
 
 	return 0;
 }
-
-static void cmm_balloon_compaction_init(void)
-{
-	b_dev_info.migratepage = cmm_migratepage;
-}
 #else /* CONFIG_BALLOON_COMPACTION */
-static void cmm_balloon_compaction_init(void)
-{
-}
+int cmm_migratepage(struct balloon_dev_info *b_dev_info, struct page *newpage,
+		    struct page *page, enum migrate_mode mode);
 #endif /* CONFIG_BALLOON_COMPACTION */
 
 /**
@@ -573,11 +567,12 @@ static int cmm_init(void)
 		return -EOPNOTSUPP;
 
 	balloon_devinfo_init(&b_dev_info);
-	cmm_balloon_compaction_init();
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
+		b_dev_info.migratepage = cmm_migratepage;
 
 	rc = register_oom_notifier(&cmm_oom_nb);
 	if (rc < 0)
-		goto out_balloon_compaction;
+		return rc;
 
 	if ((rc = register_reboot_notifier(&cmm_reboot_nb)))
 		goto out_oom_notifier;
@@ -606,7 +601,6 @@ static int cmm_init(void)
 	unregister_reboot_notifier(&cmm_reboot_nb);
 out_oom_notifier:
 	unregister_oom_notifier(&cmm_oom_nb);
-out_balloon_compaction:
 	return rc;
 }
 
-- 
2.52.0


