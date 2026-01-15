Return-Path: <linuxppc-dev+bounces-15788-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BCED236D5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 10:21:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsHY44PM3z3cJr;
	Thu, 15 Jan 2026 20:21:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768468888;
	cv=none; b=NBHFcbRsSa8RbJZALoZbG2TEapfvtP/3FDwjogFqcg0THYYjf3dxe5BodNBgcTaEymlISM62NSzPs68aXHa6AjstqA3EnEsWE7VpBcYbRrpBsBmo04lc/Pu3E0dTvlHcwd+BQz1HctYdg1xqOKwjV8Ech2kUNOQXLvuSZTx1mcugaW5DH2Im6ZSiNjA6ihuYDKnDuuEFa+682SYM57nqgCUOOEQ38qBAqwGCCEq2v8YXP31TdYSv0EjYUVbiaCTbp+dSgfCPPdxT0fhl9RAemVauLlw5lMigdjDZRxCFe/Qn7Dq1eyaRkuzCm3Dk9eFKRzpix3qi9c36qARP402Erg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768468888; c=relaxed/relaxed;
	bh=v1pQu0oIDX1FMSmN8mEQcr/88w1AsOZnaAzg3v1Ad1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UvW6UTCUaCA+XixAPfGKadrAGzIiw75/zTAkIJaHhfOPPvw8yiAboEBd2Gq5p1aFPecdJCaQQl5oc5MovuneBWFQ0UdohB7Er8c4chbfTywvTEVQ59vHb4T/wRwNYISb65jpidgEKbx4TwNHDansZ6n5GUk0a72+dB7/b+s8ots7nnR0XhyzVQdsbUqCa5qL2+LyXi9Ad6sYi4RQUYE6K2wEwUZUfB472YqAnfp0tQQach1Q7sd41EMmssAT8Y8zTSGuP+fCg+aLyHRCBjO0kIUy5cemZtTUqJdmJQ1uZN4ttRQR6BJKs9hk8HuxBCbD72r95jT3mHsmdCiI6tKIeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rNcPPF+w; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rNcPPF+w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsHY406fwz309H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 20:21:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 79A4741705;
	Thu, 15 Jan 2026 09:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27829C116D0;
	Thu, 15 Jan 2026 09:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768468886;
	bh=41/pQYkps40P9BcPiu0aWSmWbv563rsgLU3lmcgFkvQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rNcPPF+w00AAr53scL8jR18Q7fOodmmK2UlCZZsCOPQEG5dye1hFhrFWKaWMBcJsq
	 HcvZireBCalmRO4S4nV/b3swFSKslwc+AyIpYszWZNzpBRDkKLrIM7Qe2hzywmeN9O
	 Sswm7p6jhDQufIH2rpGOhnmmofd9rfW1tFqNoe9bTTmC+sA18UEjJXkGartnfR4SZU
	 slgCMrFZ6F6p3/cLrbx6GaFoyd8wTmKak9rlPOTC5e8cYpYOALbBCDc2HP+SehECP7
	 EhSNzizFDkYAsy4RMNk/vLZyhmWm1w38i52nIJqG3Dm1ajv8iW2pK80Bt91m1Dc8It
	 l+bdhGCDichyw==
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
Subject: [PATCH v2 09/23] mm/balloon_compaction: make balloon_mops static
Date: Thu, 15 Jan 2026 10:19:59 +0100
Message-ID: <20260115092015.3928975-10-david@kernel.org>
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

There is no need to expose this anymore, so let's just make it static.

Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
---
 include/linux/balloon_compaction.h | 1 -
 mm/balloon_compaction.c            | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index ad594af6ed100..7db66c2c86cdc 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -78,7 +78,6 @@ static inline void balloon_devinfo_init(struct balloon_dev_info *balloon)
 }
 
 #ifdef CONFIG_BALLOON_COMPACTION
-extern const struct movable_operations balloon_mops;
 /*
  * balloon_page_device - get the b_dev_info descriptor for the balloon device
  *			 that enqueues the given page.
diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index 28ef0cb6b3bbc..c44e0b62203cc 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -286,7 +286,7 @@ static int balloon_page_migrate(struct page *newpage, struct page *page,
 	return 0;
 }
 
-const struct movable_operations balloon_mops = {
+static const struct movable_operations balloon_mops = {
 	.migrate_page = balloon_page_migrate,
 	.isolate_page = balloon_page_isolate,
 	.putback_page = balloon_page_putback,
-- 
2.52.0


