Return-Path: <linuxppc-dev+bounces-16031-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 397B3D3BB2C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 00:02:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw5ZC6VLCz305M;
	Tue, 20 Jan 2026 10:02:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768863731;
	cv=none; b=fGaUfDoU/TVE3hj6JGb39vLnrzLww3ar0hWmWQ6QH4N9k2DmRv0+UmhLqlSZ75bNwklX1FvhaquFXV0K2VZA1DS3q4mCtYG4RYSGgV+YkIwha1wCX3E0BhIUjiiy0r7fD7oMKabRRcU9UxV/6N77oBgE+yMv8O0DkfsndonuuPQ3IO8brl0xewb1ZSLRpwWN2oCSTZQdikYQThnc19ybb09/GP7nJlYKQCmTpWFW6iO2E537vz+Lt/OYofYTS//iKSoiPoSmu3Y6rsvq2bW7TuINg4i/cdyZAAGnJkP/cbhUfxKTayt8+5nd5qgOvCJCvGG58tkBRZ27Cmtbp56mUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768863731; c=relaxed/relaxed;
	bh=OGlr4CR3HE26RPwTICbiLHyl58bRcW9pkYQf743lRCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mDO97D3H6l+RP8xcxGdYyT/p1RuN6rYbFjhqd1wdqm1Kbr9+dDF8jSW0Sqm2ksY9MJs21hiYS6cenr+jkUkmVQAGKPXiE8h6b6hpA1SCuZM57ybAJRkX1jqw6BT+0g4mZAXsUnH4lnvtUgIKwEvQFHtysh24diQzU+ZqoxsLD+zOpXoPZvRULydUsVdDtiQQvaqU0TNbX1VuLAIG67eRW1C827gOhbvsagYac/msg81DCVSiBiQkoqViD+iJjWR+0T+Y1aQgaq47yhWtMtlujxkzz7w0JQy+cdGMoZ46Sa2eFkzdyw7yOKaBLbE0mCwJs00uBgAG8nR/Ofjwd0uDkw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kLe0Khr6; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kLe0Khr6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dw5ZC262Sz2xpk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 10:02:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BAE984441F;
	Mon, 19 Jan 2026 23:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DCECC19424;
	Mon, 19 Jan 2026 23:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768863729;
	bh=9pFWzYgZbt+YY9kTe1GTcdn6HTneXxM/S/odovyu19w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kLe0Khr6DuCvasNoS6kxGtkTGY8Zw9brt5gCInhq8gLS+Ma4hsIx1369nWwQX1Tvf
	 IB2XumFvNDI5jcl58bu1+Pu0ZrCudk7hz7m2H9Ax2cKzotO5pTZnVWOjCHvr53Owh9
	 wWCd3vv1ICESWBRIUrkH/QL8obmlOab1LlCb5uNL/xCEid0Q/hukDlzNIqcI0jUX7I
	 MXYVPdAj/l45N6hoQMjhpukfeniE2KS3T4aRad/4Kfdv+ujJfbonv7OhpZdUpJlZdD
	 v88zh6Y7ixYKz5JxWdDwhau0K/zyUQfHaZMYxvUzxiNBuApA2jLrvXlMoViRemVpHh
	 F+IVwVmTXgxow==
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
Subject: [PATCH v3 04/24] mm/balloon_compaction: improve comments for WARN_ON_ONCE(!b_dev_info)
Date: Tue, 20 Jan 2026 00:01:12 +0100
Message-ID: <20260119230133.3551867-5-david@kernel.org>
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

Let's clarify a bit by extending the comments.

Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
---
 mm/balloon_compaction.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index 03c5dbabb1565..85eea88cea083 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -222,7 +222,11 @@ static void balloon_page_putback(struct page *page)
 	struct balloon_dev_info *b_dev_info = balloon_page_device(page);
 	unsigned long flags;
 
-	/* Isolated balloon pages cannot get deflated. */
+	/*
+	 * When we isolated the page, the page was still inflated in a balloon
+	 * device. As isolated balloon pages cannot get deflated, we still have
+	 * a balloon device here.
+	 */
 	if (WARN_ON_ONCE(!b_dev_info))
 		return;
 
@@ -241,7 +245,11 @@ static int balloon_page_migrate(struct page *newpage, struct page *page,
 	VM_BUG_ON_PAGE(!PageLocked(page), page);
 	VM_BUG_ON_PAGE(!PageLocked(newpage), newpage);
 
-	/* Isolated balloon pages cannot get deflated. */
+	/*
+	 * When we isolated the page, the page was still inflated in a balloon
+	 * device. As isolated balloon pages cannot get deflated, we still have
+	 * a balloon device here.
+	 */
 	if (WARN_ON_ONCE(!balloon))
 		return -EAGAIN;
 
-- 
2.52.0


