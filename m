Return-Path: <linuxppc-dev+bounces-13135-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B23BF98F2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Oct 2025 03:03:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crrX90Pd7z2yjy;
	Wed, 22 Oct 2025 12:03:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761095032;
	cv=none; b=GrIbWs5kdYsyIYqBqvdoV/ukk4lrXLBbWqhN4gBFjFytmPnaekQiVfIXFiOsS4jH/NMl3uOXbEpDpl2hTdmrMQrDnh0jvnjMKbej8zrMFBwiNg1bDA4rtc9Xe7SX/nhnecHlZFc8KDEpxiYZqZcDpsb4iQSfdh2oDcVzC7QbWRDrbFXnPPmugNFur/ChfFqsjkCcg20BHd7LbId/YOVGlVeSdMCmTk9z5t6zqshz9BXjy6WaBNmTlCd/iMy4m5NSORa5lbohtMoTGdUr2KGtHMZL1P6Wzdb9rI+mgyIevLUw6D3wPnjQxaetQvknh38rpuWLE4yuhRnFYJbBmHVzVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761095032; c=relaxed/relaxed;
	bh=UzGxLIIphyjVfprwHlUbtT7cKBUxBJbWCrX50M3UC9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OorTss3F1WtdcylrLI9zo3MEnXU/xUMgK7xWWQopm7KEEQe8Pqso5lRjNLHsDCEsnh8narNVjACKZYFQ6UkgVndUNAeJyN8JLrOPIKGmiMRUZAwWn6Rhmfma2OynjDQyNLftviLBNK6aDDnuNH4NzyD0oGMkHhqXDhzwParvbDX7YybGcGRmdLga66rxu51wuIngGgWcSbSxqvmJNFc6VDwuQye4MH+MBze/f4o72ZYIx0jDMjZD9rPIeDdN706+b+NrmqVwzq0Zqjuj9UV1nCf71DyD6go4x7pCtVW1oOstv96FknDhYusF2+Rp7pmcsrhsT+CGntZukNhcshPWIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gSFpifbE; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=sj@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gSFpifbE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=sj@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crrX81ScRz2ySm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 12:03:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AEF1E6278F;
	Wed, 22 Oct 2025 01:03:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4EAC4CEF1;
	Wed, 22 Oct 2025 01:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761095029;
	bh=OpMA0/9oAABJIYywTiyokiqjgPxdO7YtYPB8cGTro78=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gSFpifbEasbVizf5V3L+2KexanyFQzbtMZbuq1jID6FIIOpVK3LUZLcwNkdppbUfX
	 KyLZt5A1mWA8+tMC4qhQG3ccj+DqFq5FDiWKnCfw/BqSffd6Q3GcCpQPrWyppEVZgt
	 fEiVydz2yGP/8nXF0gpqrdCtOVVkhFrickGHoNnFGLswugZP26omm9ZPTIGEqSCKnU
	 ySvF5uR+tyclSU2n9Ndn3J8WAcC5FZDL9cXvuGOydUp5f0CyzNs+gy4hcaiFKHL82/
	 j/rZ5EpSy1mOkV5UCVIfXHEUdkQuZBtwfFtQmD7o+ctsQWGS327B4vqY7Kd4p3kWba
	 IeN2GAkgTIwdg==
From: SeongJae Park <sj@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: SeongJae Park <sj@kernel.org>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev,
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
Subject: Re: [PATCH v1 01/23] vmw_balloon: adjust BALLOON_DEFLATE when deflating while migrating
Date: Tue, 21 Oct 2025 18:03:44 -0700
Message-ID: <20251022010345.120425-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251021125929.377194-2-david@redhat.com>
References: 
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

On Tue, 21 Oct 2025 14:59:06 +0200 David Hildenbrand <david@redhat.com> wrote:

> When we're effectively deflating the balloon while migrating a page
> because inflating the new page failed, we're not adjusting
> BALLOON_DEFLATE.
> 
> Let's do that. This is a preparation for factoring out this handling to
> the core code, making it work in a similar way first.
> 
> As this (deflating while migrating because of inflation error) is a
> corner case that I don't really expect to happen in practice
> and the stats are not that crucial, this likely doesn't classify as a fix.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]

