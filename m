Return-Path: <linuxppc-dev+bounces-15797-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6736ED2371D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 10:22:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsHZH1v5wz3c4d;
	Thu, 15 Jan 2026 20:22:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768468951;
	cv=none; b=YmgT/IRVKM4dTYmOTAi7wQlvUdUInycmdm2qDSWD/TWnZzrj10iLcMdNlHBUpvDWCe2Ih7LtXSWmV5DDvxS9yrxxMQg6pNS9asQkYUHMbGhaCdEjB95hcKFPSeQbHwb7Dag31Inya+Xa6uL1BWtYiT6LLHZhyIPo/dcHl8zaY8FjkudGylY42q4fqreedvry0Bh7KH3/f5mh3MskJwErw2xOO2X6xFv+hgmS9IJEPYlzNW2WWr0FjBAgYxrL0nv6Fhq5wx034azMTeNV+bKOlD13ZETRqphIV/amf3mRh4QZC4eYqrzBjv8WuBxUjZg1vE0t2FNXKb49HLvVsgKz3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768468951; c=relaxed/relaxed;
	bh=rDArjlos7kWXyg0CRwz2zGueO6kO8dJSOVHUuCYOmOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BLzixKLTD/0p4XKWxajn3k6HBLOvbQHGhOGtQg7hUOUH/lX0/N4iIde8qS1WFhxGLtGiVcxlCNe9BIgU2Yj14vJO9q63J7/TA3X72nJj+OXNj7GV89U4VYN/os36oPigt0tuJwjODKDluIi1VqVKh5lYjuJ35l2qj9iamXp1v6iPBZKtExhGRqt5GEcRNtHXc6P8cq+QCQ01gV96OWZW3JzZEQL48DspTKGlkaWmZV7C7ZCiJzQD8/7l+9aJ2RlrmQ46U6S3rWJURmuZZK0KBWFhhzVHnFxxnYhwWnTCRr1p2PEGjGCBygGbFbrRowPGFTJJS3gXus3YxapzIgUfjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BYTnHiFW; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BYTnHiFW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsHZG3stfz30Lv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 20:22:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A812601B8;
	Thu, 15 Jan 2026 09:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FE0C19421;
	Thu, 15 Jan 2026 09:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768468948;
	bh=xIjT/yGPbzWdy9CPPKodSOcwDaIkDPisOU81OKu1Nkw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BYTnHiFW7YPOe2J6Fze71iGPPpPxEwmxWfzUTk14RKrKFn43bosoW++6osAwhU5wA
	 q1rDiNffO1rJz6FGY3F2Ky5wp0qW7xYClI601zpW0HycKpBc/SJkGGvDucxJk25GoG
	 wMpJF3z8qZQC1e6zOMpasbtacWBOTpKXfutSC2ewiyGEUStYFrt1GnXGT8w57OD0K1
	 wmPV95kTvJ3GGM4fs7FU7MYFZ5+73R5SCqaFY8Mkp6QpcLMpKFy2KrC5v3U4UJ8L8B
	 ScLVUp/VAdCHnagkQF7bLWsOzfl8QWFhD94a+zVmyPP33NRDslhtn6lO/g0hK+i2Up
	 VO8uFwXwKrqgA==
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
Subject: [PATCH v2 18/23] mm/vmscan: drop inclusion of balloon_compaction.h
Date: Thu, 15 Jan 2026 10:20:08 +0100
Message-ID: <20260115092015.3928975-19-david@kernel.org>
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

Before commit b1123ea6d3b3 ("mm: balloon: use general non-lru movable page
feature"), the include was required because of isolated_balloon_page().

It's no longer required, so let's remove it.

Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
---
 mm/vmscan.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index a0e3f51de749e..cd9f9a779e89b 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -63,7 +63,6 @@
 #include <asm/div64.h>
 
 #include <linux/swapops.h>
-#include <linux/balloon_compaction.h>
 #include <linux/sched/sysctl.h>
 
 #include "internal.h"
-- 
2.52.0


