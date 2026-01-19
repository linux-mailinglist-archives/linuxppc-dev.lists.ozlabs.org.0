Return-Path: <linuxppc-dev+bounces-16046-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E5FD3BB5C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 00:04:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw5cF26fdz3c7n;
	Tue, 20 Jan 2026 10:03:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768863837;
	cv=none; b=jOouAbZFfLojJgR65t5OPf2nati+mdcdMLKCnrytFSl5XxfFlFJVnIP5PaTc1+s4djTYa8yON7ssYOvEgvF6bBZDD2/NedDMfjNLO/GfN+D/WLYyxH39GGuLVpG3C12XbryINr98ZPpf5naNQNk/IDuRqiEP6w+pgeX9niBYR+NnrGz3Ya+8yxcz3QxgRHvXV5zn7A47gHjnNDuNYcTZu+7Ts7M6Pm9ZQq0sl7WtMYocMMYt1l7parfZYlix7Ef046xhmo3jZe+akOhlKZGVa3PS1FVzHXFauUvz45/Z7LQPPruYmxVLHrDD5CngCZWzl6ltM2H1hNpuXJKQR/12UA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768863837; c=relaxed/relaxed;
	bh=q0PZsdKyWYnYNA53sTkL74r4LhKT8UMg6WKjB0J3+cU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oZMajDOOghha5AasVzgI81teeetfztDx59fWfH2VIMgr3tg9zEtn565wP6Z7QbTYkt8+tOEMpGpz7a3NK3za6blBvQSVt1qOnkNKCVMulP8DD4HSrzQX/46hX7zWdn4p0sCAG48jCyoNGdFdZcP83j8iiRgHd8Mz4b4zwpOceKQmlzp+fuvKp2O3T5XdkUCcgTfWa12IJQUgoowczQLo7LDApn0Qv7LxuHK8lW+qPAaQ+c/ZxlO4ujOaNqOck1YtDyoweQ7qtzjQPHCeSr8fsB4NnpBM5AqqBhC1chbHlkTPEMKV6/9pg3J/eg+Fz9YORo955mIkQdOsTfujUAzGZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vIW4fuGu; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vIW4fuGu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dw5cD4crjz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 10:03:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A38F460155;
	Mon, 19 Jan 2026 23:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C09B1C19423;
	Mon, 19 Jan 2026 23:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768863834;
	bh=kH1VyttzME5xFeeFdR/qAHeXrLO5pFzDG/LyJb7V0HA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vIW4fuGu6Fvm5fTOSiPeFfrt4FFXeyafRlE/6kmfcrtG7aEdsGaWbIX8IeNn0sRPI
	 D1gHKWfPif0n1VW7nAJDk74228u1Cqx673N4Z9fsSSg05aYrMD2ZIUbz9hY/4oO7bM
	 VL4FmwdTOM8cvcKd/7ean9yDQe6QSyh5qIrWAMD4tSL/fBAfsAXe2BxwiO8AyPSWlw
	 Sd014FoSAVVq/hPIOFEXgyp+hyyWVjl/iMDU9M1xyvBBnP83HdnmLnVyHuaoHkldUy
	 jj+CCjjMAKeHDv2/xjWGDVT/h7E+d6KiWNokqEor3Ae83lM+IA1yIRczDY3yZDzAwQ
	 eP3Gi+2s8wxjg==
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
Subject: [PATCH v3 19/24] mm/vmscan: drop inclusion of balloon_compaction.h
Date: Tue, 20 Jan 2026 00:01:27 +0100
Message-ID: <20260119230133.3551867-20-david@kernel.org>
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

Before commit b1123ea6d3b3 ("mm: balloon: use general non-lru movable page
feature"), the include was required because of isolated_balloon_page().

It's no longer required, so let's remove it.

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
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


