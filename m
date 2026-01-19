Return-Path: <linuxppc-dev+bounces-16028-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA2AD3BB22
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 00:01:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw5Yr1Y5vz30Sv;
	Tue, 20 Jan 2026 10:01:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768863712;
	cv=none; b=m/kglTZpbuC/QnXaMdQotHmT64Bzx2v9RO9JCT6ymGhaCVrtlEC4w1VjM35foyfi0XcMFhGfXPdFUp9sm+38OR/AN6gGKfwJJbkGififHyjdbAs2n2FlCgaj24DjSRI0rKn637JJEn85EI6y/cX00a2LfWS9n750VRPG5PgW3Ujq/8/ITuXCSsX5Avut1EKOfilHQ8fSxFMeXci8D9g9lBVBxHpcuYT/AUxu0g3bIq9jtucMgEaysuqxiGkO1+RTWqIESBjGTVOisUmgPNwnaixMUgkzx2BeouBgberdR/fxyoY7l7oaDbTi2V3pJTONAY99f/Xdv9vP9ojZYILH8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768863712; c=relaxed/relaxed;
	bh=o7tXOMpSvTNAehyXPE87lP43EUeW8U2886S35Q+iVnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MB8rgcDMYisOVk7ID+kVuxxZzYn7DkVold0B4TIDWB171l6LX0k5NovuwbKgtQ+UOTefsN7tHpsbpGcV34mQjMANpuv5aVE8bYWiNKE00ACPtp61Lwwh4tf5I4bk3ukU2siMbK1FxgB9BVb8NgaMQ21mClikDBAuBmhmyq4wIbWsgkFUVxIVGtEDvOeiwmOzk68PpfjUkjj/Cz7grIk6HbgoOeoEOK40Zmb0RZoc9m7cuxD5xh1Kk8SVhEiqhCOMA2DQksAcmQpDcHqbwnuUgP+Zh/AOVFuTSEbwBXba/UcPtA4pLbN6FI1d5EeSHsuNHOQ5lMw47dTbwYpOuBFB0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ty14IhFY; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ty14IhFY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dw5Yq4BHNz2xjQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 10:01:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A90160151;
	Mon, 19 Jan 2026 23:01:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 531E9C19423;
	Mon, 19 Jan 2026 23:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768863709;
	bh=luihl3MbyU6omYSiSWj4BOo3mmNqgAivFPTCpm64S5A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ty14IhFYRg1l/2Ez+3EIhcGA92inZASN9By1yGWpfoCYQQoaXhF9GeSHpXh/4o7wh
	 rv2jd1KqUv7sxbQENf3+a93+kiHs6Pt5G9xfUtig2LlyAvg5fqgjrRlYOU451DxdQV
	 xFS/6MQL9QO4d/tcIUcQUVkk5Ga5MkYY1UtDOLULiGw7WY4N60Pad45nIyjD3Ohaa7
	 1u8b3HPjwXFqvexE1sUgx5Pa9UxBfNk4UNre7uxGAjjqz0uqzNWWM+n6+PIJW/KZC+
	 PdVBqArgnZb/xbX+khcmpQlrZp1iBBmSTeD10FX6KYq5s943DkILJgOIVYjGLYJiq6
	 qwGIPnllyT+GA==
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
	Zi Yan <ziy@nvidia.com>,
	SeongJae Park <sj@kernel.org>
Subject: [PATCH v3 01/24] vmw_balloon: adjust BALLOON_DEFLATE when deflating while migrating
Date: Tue, 20 Jan 2026 00:01:09 +0100
Message-ID: <20260119230133.3551867-2-david@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119230133.3551867-1-david@kernel.org>
References: <20260119230133.3551867-1-david@kernel.org>
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

When we're effectively deflating the balloon while migrating a page
because inflating the new page failed, we're not adjusting
BALLOON_DEFLATE.

Let's do that. This is a preparation for factoring out this handling to
the core code, making it work in a similar way first.

As this (deflating while migrating because of inflation error) is a
corner case that I don't really expect to happen in practice
and the stats are not that crucial, this likely doesn't classify as a fix.

Reviewed-by: SeongJae Park <sj@kernel.org>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
---
 drivers/misc/vmw_balloon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
index cc1d18b3df5ca..2cc34c4968fac 100644
--- a/drivers/misc/vmw_balloon.c
+++ b/drivers/misc/vmw_balloon.c
@@ -1818,6 +1818,8 @@ static int vmballoon_migratepage(struct balloon_dev_info *b_dev_info,
 	if (status == VMW_BALLOON_SUCCESS) {
 		balloon_page_insert(&b->b_dev_info, newpage);
 		__count_vm_event(BALLOON_MIGRATE);
+	} else {
+		__count_vm_event(BALLOON_DEFLATE);
 	}
 
 	/*
-- 
2.52.0


