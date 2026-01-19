Return-Path: <linuxppc-dev+bounces-16051-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F02D3BB6A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 00:04:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw5cv4Gjpz3c9r;
	Tue, 20 Jan 2026 10:04:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768863871;
	cv=none; b=SA3SeBOYQxToZT5BvGdXAi0uTk0g0s+x7Cr4LlrTK5+0BtmI+SqWcrtv8mDUsTAiNKEy64UZpZeTNrU8v+/+hBeLZHrchh8ol8oosvaaqSxgVAV25kasP4RHWPp4uX1anlAqLa82Yx+m1dW4IszThyR2kunus3Q2HT+FAoIHaFdfABlUdu5xq8fyVaCIqfde5so9LRsx4BhgWaeugLR4i5zBIgMeqy885y6ZHTGHuObTcM1Wfnrc5ek3jHqQDJ5ICiTH87qBe/PiG3SPcfMddw93HGfyB97wGyvn/zedL3FpoQlxtLhRQ7/DLibrYS2ptVcen9MJgz80Uh4o2IF7UA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768863871; c=relaxed/relaxed;
	bh=k158cyD7oCbNoXtiGNFRA1wdgAAG3gz0dJWgIplLiI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c+liaXHtF/GizXaz44QfitMvvysD/4R8t7eG24IxCuWOqVCEUJL/rlHCUNN8KKtcpV3pTokxgEtdW+uBRYQhnaIduvPThD4hLcQZkP10280Mpkg3erRoqpmf0YRBlywt7aO0co/DBgsVvrJt3hQVGLgjl2P1S4XjcWE/o2+oIsdj1GT7jDx29mHTK2xNJgUba3QQue4v5UfmX7M2m57COafowUduxtWSW1TjoOpZW+VftDGEKok9fjlWR9uPrwTlEfvHDXx8QjCineFy+Y7R4PBiFp6Adibtnhzz6gnguES/sxkhAlZeyr28jhqGiiwzFgtX1BPJQ4utBW4cVxo0JA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JddkqrE6; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JddkqrE6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dw5ct5YWnz305M
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 10:04:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BBEF96015A;
	Mon, 19 Jan 2026 23:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A63EC116C6;
	Mon, 19 Jan 2026 23:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768863868;
	bh=S1lJXi3TslhD2DUEpYR7JuVS5MOqETlTcS4z0PNouhg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JddkqrE6RvS1AkcsaP0vtdPHirYtI6v+ox8YHuFnXoHZ6NJfOnr3M+yynoay6gTTs
	 2CSXcn90icHiGYaNfQcjwZ5gBkXXRJdWMqLpgNOW25skxtZ0cVYbGJUW8kM68yJjsF
	 xYxt39UFsY+/oOcthmFoy7p0q/3U5dWozuyWhB0B4IAEPbJwcOnI9Qv37JnTchNeIm
	 zer4O9EWA4zNWmtWZucviW7z2hJBTJJSFMqW2pjllnEM9ZoJQDnaoN+5yVxeyv0iPU
	 ley6W9IKnFUbeFASccnDtJvSJcW2dPCjakmFabdI4HFB4fknl1l42IDGOcMdpEVToz
	 T00lzVZ1LJSCA==
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
Subject: [PATCH v3 24/24] MAINTAINERS: move memory balloon infrastructure to "MEMORY MANAGEMENT - BALLOON"
Date: Tue, 20 Jan 2026 00:01:32 +0100
Message-ID: <20260119230133.3551867-25-david@kernel.org>
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

Nowadays, there is nothing virtio-balloon specific anymore about these
files, the basic infrastructure is used by multiple memory balloon
drivers.

For now we'll route it through Andrew's tree, maybe in some future it
makes sense to route this through a separate tree.

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
---
 MAINTAINERS | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index de8f89ca1149f..11720728d92f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16454,6 +16454,17 @@ T:	quilt git://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new
 F:	mm/
 F:	tools/mm/
 
+MEMORY MANAGEMENT - BALLOON
+M:	Andrew Morton <akpm@linux-foundation.org>
+M:	David Hildenbrand <david@kernel.org>
+L:	linux-mm@kvack.org
+L:	virtualization@lists.linux.dev
+S:	Maintained
+W:	http://www.linux-mm.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
+F:	include/linux/balloon.h
+F:	mm/balloon.c
+
 MEMORY MANAGEMENT - CORE
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	David Hildenbrand <david@kernel.org>
@@ -27536,9 +27547,7 @@ M:	David Hildenbrand <david@kernel.org>
 L:	virtualization@lists.linux.dev
 S:	Maintained
 F:	drivers/virtio/virtio_balloon.c
-F:	include/linux/balloon.h
 F:	include/uapi/linux/virtio_balloon.h
-F:	mm/balloon.c
 
 VIRTIO BLOCK AND SCSI DRIVERS
 M:	"Michael S. Tsirkin" <mst@redhat.com>
-- 
2.52.0


