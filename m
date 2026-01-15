Return-Path: <linuxppc-dev+bounces-15789-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35860D236E4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 10:21:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsHYD6rCqz3bhG;
	Thu, 15 Jan 2026 20:21:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768468896;
	cv=none; b=JHf+/a4h2Wm78Op/wPgfYCdDhD6wDoPKT0CaGAynX7TrjhRppgjisy4QOvYiDKvbjqWQ9jR9QT3SGHEuhijqeGUbVu1UFKpYZne09xRBf9yvg7UuWp/rqGU8mBvEwyXxTiQ4tltLfNyx4xUoMAN0ZMhQtPE0JoQEXJld0gMLR/O/idMIEf/tOwBqv0GgLO7rGOAwwdFUIQ7nyhZ6fhIluGrYmj7zmY73LUksFvpshj3OVFzoVOqFsIS7rQmk4q7QYfpT7an6DCTLC9+OC62ThpEACYEzLlIdbDNMmAaNpwm31iKqAUYIaInOsJLpaW0kvU3WDsM4NsyS4cWzV7PyWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768468896; c=relaxed/relaxed;
	bh=8EenS6axDsQIs8DcrM4euNT5BSxpIt2vNmE+FFtH6lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XLghxM4Y46yM0QW9ZJPWba/bz7qdWPfR6DRat4GAFm0BSqZI3i5fvzLk/NADqrp12W9w9io7NF95mdmziriLR7Z7PbiwVhNhzUOZfHY6K6zpunOK8O3PsDcaEbqzYtfD7cUB3w1N2p/iAmZhNVn2p0LU4WiBVyx/tiVooXgZaR9treVJzEoezCrd0UElRAS0Rs3NcQi90Q0dH9C4+qjMRy3RIr7nb0sKNJlVx0R4f/VF0AJrr0MRR6TGErBGMOSNGQqaX11f/nMf3AGM/GiugEFCBZaj4Ulyhgj2/3zdXU4i+86gFXonPuWuQqPMQhMifpgG1pO44pxXNgRbyrp4ug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qu5cnsss; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qu5cnsss;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsHYD2dsYz309H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 20:21:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 29AE6440E5;
	Thu, 15 Jan 2026 09:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D840AC19421;
	Thu, 15 Jan 2026 09:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768468893;
	bh=6msByTrRia9i6vND/vW1jweXAy1e72/r1CKD4n734CU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qu5cnsssHM0VOA2MGc8aTwkHs5DfKAxz8/KwFTSko1lI+ScylNG3t6KiXREGnGYG4
	 bbajnHy0fVOa5j3ek1JI70AVPeN+FZW+TEy1INoJw+F2pAFEGzIjvs7q8F0zIqdheB
	 5SIpjUgk5E9J67b6iBFVQmoZiYC+BeHVbM658tP0rwFlhllNOQDloLuGo7VYiWbeIk
	 ORaDqAHDYEraa10Y7nrOVGW6wIKuRACCqbuew8ilXlfJ2fEj4fTQYD4OTtSs52Uagr
	 8ZwIkkfcpdPLwwkRUB5iFUqhulaWwTq3TRtoMlYOChCsWG1c1YUkGSDalb9T3rxaXa
	 W4fHfh+JcLDbQ==
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
Subject: [PATCH v2 10/23] mm/balloon_compaction: drop fs.h include from balloon_compaction.h
Date: Thu, 15 Jan 2026 10:20:00 +0100
Message-ID: <20260115092015.3928975-11-david@kernel.org>
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

Ever since commit 68f2736a8583 ("mm: Convert all PageMovable users to
movable_operations") we no longer store an inode in balloon_dev_info,
so we can stop including "fs.h".

Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
---
 include/linux/balloon_compaction.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index 7db66c2c86cdc..1452ea0635245 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -42,7 +42,6 @@
 #include <linux/migrate.h>
 #include <linux/gfp.h>
 #include <linux/err.h>
-#include <linux/fs.h>
 #include <linux/list.h>
 
 /*
-- 
2.52.0


