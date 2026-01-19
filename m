Return-Path: <linuxppc-dev+bounces-16038-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 607A4D3BB43
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 00:03:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw5b83HbHz2xpk;
	Tue, 20 Jan 2026 10:03:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768863780;
	cv=none; b=OAsIP3DcI76MqAldHpuRaVaiIejZWBFRhJJpLrYvotpxRWXWSbwp8VXKQyYxHZeols+93yW2biUWwRNZ+B+D7hDg3IY/tyxLg5yKy/KIR4Sr4e1TSTJxrc03QuvC0CNo9nPiXVBzteTnzfpNEexxp6YfUoaHP/weYSJTMd767YisNz0QzcTROBUEgan3KleN8Y/1Dn0ljBfhimnK4aTZxgGrGZtWr/6zJ0FNiOL92j/tpooBl3NN55QqUwQJplaEMBX8xgcZl23J5Xx4Wiul9OC1Ds3oG/Mc35aOyETthzTHpbcHFbrKqnxWtx/nC2C72IWPr9MxVK1m1IJwpL/CyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768863780; c=relaxed/relaxed;
	bh=LOhimITwx1r2zuEIDc2ZQ3tSXbcjEeOsA5hsp/L0Lbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ofyOmL8aRLIVx+boThr6DqwUCV0G9/h+FsL2zarnMJJnNnLYrHm4muwPN2OO9m60MNmYtHxvgGZc/VRWATJrGZOrjaxRCTktGUBVb9C5sXfv4A3HtnhvLeUlvtyVamht+RilT20oCDkrRFitc5/tTuutwRTW2uHPlOX8k3bXoIyA5R13buk9RXIZ/xrbyAKBKiTBioOwBOhsExnloYYm6lmvJt6datg7gUznX42Wo2e4mAl7HqkwPgsDHLU7mrLKkiO6q7Iw+FWWl/vbRKf13P+YTdtNxsmO9hy2vh75uUFvjPpr7GjnQkxiBgFAm5O7EL0btR4i35+KV8saQq0QEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Br5khT2B; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Br5khT2B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dw5b75wl8z2xjQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 10:02:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 46EDE40846;
	Mon, 19 Jan 2026 23:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F01C116C6;
	Mon, 19 Jan 2026 23:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768863778;
	bh=QtradRf0GStbdIUHbJa+QxsYtSkr1ee15tID6//kWAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Br5khT2BqgdVGETSbAaQu5YrjdjqXAvfXqQO1VMxW81Py8o5g7cf/09LcteyZ+CjP
	 VMkGGAnJ8GPsE1LyANcYOnXfeiSRbDgg7MhrSmwtzPuqS4MgxJRjqVToYtAkXTPVJA
	 80NtDQhI3xgllJk3hAdxv2JszAzpIuLWMNjNgYDsHPyM1gnGqRaq8jiISVtc3DSKb1
	 4XUufNGKEG13eLM3e8HEUHsOs6WdQVrPLBpmRGZZS+cPouXUJUplA+4tg7GZ+4ZUma
	 BO4JhKXQUjH3JcydqiW4udhJysaXEMdd7XxhQCej1whSbJaHBvADBiVb/EtAMzsa2t
	 rnfM2VyKYEtZw==
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
Subject: [PATCH v3 11/24] mm/balloon_compaction: drop fs.h include from balloon_compaction.h
Date: Tue, 20 Jan 2026 00:01:19 +0100
Message-ID: <20260119230133.3551867-12-david@kernel.org>
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

Ever since commit 68f2736a8583 ("mm: Convert all PageMovable users to
movable_operations") we no longer store an inode in balloon_dev_info,
so we can stop including "fs.h".

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
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


