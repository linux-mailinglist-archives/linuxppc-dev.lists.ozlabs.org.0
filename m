Return-Path: <linuxppc-dev+bounces-15780-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F59D23699
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 10:20:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsHX41SMYz3bf2;
	Thu, 15 Jan 2026 20:20:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768468836;
	cv=none; b=iKjNnkY+14n3AnwuapTygJqlKfHmXzMjp2aiGsaHy8gxxyIvErVh+csjSvnyOk5MQBSteEhkCV6y7mQTD9EInbjghHwk/Pl49uB0WHYpIEgRNc4dQMnLQ5c/lk76iWER6tef4pAfSS5a4wnXTN6SR76BRF2+uLxeSw4us/RGjR4Kn4NOc7YDwGZzzd93Xy+HMACxxqAvRLNzNpholiXR7P3i1cQ0n2iewFW4acWps7eb2XDpyBBp+iXbl1yxa6A2tZNebzOLIhXHPWlZdR5ph2aDoERvl7u5symaoU5gcUjWPN00fXGAzlwegRC1GkjdplnthE1QqFUorAFOrPeuVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768468836; c=relaxed/relaxed;
	bh=d8hRciOpYMgwwM4lWsV+OrnHR4QWdNhYMUfFtku6z4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CatWkC2KtEqa/zl8tKnzOr986qXkGKa0a5H8ETZHP/aoHHEIHd/2JU13tv+WlYKqfPlgafagEwf8WZNA6Zqr+5ZAOizCU81WgUqnf1uUepQWcP2nW+fInygrCVJqFmHVd1G6Los5cMGUgknqG9dFLQiGR2OiEz+69PkBOv/+UY2YdLQBsMoz7cGTlnSpTDILxw/faKK0HdCvEYB8Bie4WGv+1rSUBhAe7yOkUBx4mvBKB6Cu7srbYVNsgdfydBpyBYz5Ia8M16Np686uK1xeRYVgF05nczyYGhAGHUJiAhTWGrhIrw8UddXZlMXktmf3i/FiviXo+ZWitJMsNEN6Yw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EYttf9RS; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EYttf9RS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsHX34dg3z309H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 20:20:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C98B7601B2;
	Thu, 15 Jan 2026 09:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E4AC116D0;
	Thu, 15 Jan 2026 09:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768468831;
	bh=Scv31UliB8apDlHu70nbhgpokthEcnnhLLec4iJu0Qg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EYttf9RSd3DbdTaPTVk+zCGJKvc/Oez8ig0lU53ia9jJ6aGdraYIQwgrN8yJDx0Pr
	 5qlJKitoIajMNIWc7kDHGqVMM0UaKRvQAC7bbk7mgQkugqLRCBR8BUyRmOqRFH2N7Y
	 EJ2au93bd/o+ApHVyv0ol6BDQCWpCFNv1hC3BOgoWcmnv7HvfTvufkfjUo08S6jWy3
	 5opLIIVpz8SqHZkxP47qBlAAYzOLBQ5lRLzyIQQhvTJHLC1jIMu6+wxgilo4nYr7cJ
	 DeabCkk2c8fFv90mHyJ5RnYg2v4W7YzhuhYwVVVE1jXv557Xjjd9lvqckiUc5tazSb
	 PsIdQFPAUZZCA==
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
Subject: [PATCH v2 01/23] vmw_balloon: adjust BALLOON_DEFLATE when deflating while migrating
Date: Thu, 15 Jan 2026 10:19:51 +0100
Message-ID: <20260115092015.3928975-2-david@kernel.org>
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

When we're effectively deflating the balloon while migrating a page
because inflating the new page failed, we're not adjusting
BALLOON_DEFLATE.

Let's do that. This is a preparation for factoring out this handling to
the core code, making it work in a similar way first.

As this (deflating while migrating because of inflation error) is a
corner case that I don't really expect to happen in practice
and the stats are not that crucial, this likely doesn't classify as a fix.

Reviewed-by: SeongJae Park <sj@kernel.org>
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


