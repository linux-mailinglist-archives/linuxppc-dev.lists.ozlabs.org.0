Return-Path: <linuxppc-dev+bounces-13110-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A42DFBF737B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 17:01:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crb8V4ZtSz3bfV;
	Wed, 22 Oct 2025 02:00:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761058858;
	cv=none; b=LUFFlmC1cEYU0W4JAgZWup+5coDzhISFbBNC4yE/YEy9HZFqQEx9WThM7ArtY43sMeJiZdObUjm9Vz4ZwhEGv7kCWcObx3zGTrRQSlTPRjlhDvVC5xidtBJIhgzc4ptuzvccKJhbyjW7F6fVObG8V6e2RQwNLisPpI9eWJxinNtICHoJQqSqA/vhvXiaZnmvonDeDUgjzC6dD4yNxc0xcd1NsulSIgIW0ihfWFAEcJHgRVl4FkPb31Ly6kzWHYf8i4hI+BrgWV4a5RJzgHYYMbfORP3Gu575u9sQyDDzQ3W8RKfRl0/DsBFIlBKqLWir3ww5RnIrzLuBt9eIcksxRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761058858; c=relaxed/relaxed;
	bh=ky9IQ4YAsBLfeIwBY21tvLCKpQrC6NzvR2EdWfDbaQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=L2AZWyRi6UFWkt7fBp5f1OqK856BQ6bB4Dz09s+Q5cDxZm+eoxACLv+J1xPUqCo1ImKRWxkGimSdhZP8DdcEz+F6aKr2zRdD9k7x5PSYjK/9OXFSoWEYVpvAE7BEhUYctlC1avafuR8r6BDYot54wRep4hSFgiLtmvrUxhgMSdJT1k+yJo/1y3/L/QPIiWOA6+Bo1ozIu+dEc3ynQ0RH8LG84A5Faz5mjvba0OgoNSpbYVW3z8TWyJ+CWHk+nq9OHPzwShLKwQGl2QQcSiTl/DBiZlIpgKe7f+qKPg8DoMffntiELp8Xm8ikA7rvVjTX2z+tOhOIcH8zyI1ZIHzHJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LEXzm3QC; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CBdfFR1r; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LEXzm3QC;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CBdfFR1r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crb8T6TyLz300M
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 02:00:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761058854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ky9IQ4YAsBLfeIwBY21tvLCKpQrC6NzvR2EdWfDbaQg=;
	b=LEXzm3QCfIFhU52evrbDS7IA2clSs7t0T7di/1hOq+oRNJeyrcc4TffXl00J/1eRgfSX62
	qiFdYi3o2EmUf9RL9T89FLzaryPTijfnZhrXN2kBAWKm+yRV9Ae4bOmMDiXM1y+87t+ghd
	MiUPasXWn17ad+iQJMQAPGESe4KVmCQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761058855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ky9IQ4YAsBLfeIwBY21tvLCKpQrC6NzvR2EdWfDbaQg=;
	b=CBdfFR1r1sArNX85/fuAGuHcStc3gIBWlIdgI73FrOz3bdJyC6da2vyJCNkiHiaQ2i2m0f
	04FZo9Oo/D9UBrSwkrkSf7jOIMh7SUjggyBjbW6TKH8TDWdD+3j6id5qtbqXmzAWxgM3gn
	5XUw85yP3+TO+o9S4YkucdHYsaSVV6c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-XIeQUD1OP52JgbnQNZ8bOQ-1; Tue, 21 Oct 2025 11:00:47 -0400
X-MC-Unique: XIeQUD1OP52JgbnQNZ8bOQ-1
X-Mimecast-MFC-AGG-ID: XIeQUD1OP52JgbnQNZ8bOQ_1761058846
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-471168953bdso41189055e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 08:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761058846; x=1761663646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ky9IQ4YAsBLfeIwBY21tvLCKpQrC6NzvR2EdWfDbaQg=;
        b=hJVx6+rSlDvxsg1kNWmPXb9UP2O8KVEREpvafj6FkKsQZ281zIJ3E+13Xp5tm3IvYI
         14Rk2Pvzxp3BKx8nWlkvw3oVHj4tojIr1WNSTlT22peqZAkzEpLRPuutJ4enFi6ItR3f
         2MBGT5HE8OVNjCkssBKS56QnJ6WTyMBs7xJeNiI1S8v2yrzfEDXMJlau07WByuwIc9dP
         XwAEfhD8vsMk57M+DkT/2Ukw5lT1dVIF/Zdt2qftOHKvER6YFElF6dHYd1wFO1kKpDRT
         x4+rGfvqPmfjf8PUXsabU8xAuNnVW8ZYO1KsEGPSMoOXNVfOteaUZCC70yvywos6KYOd
         O+cA==
X-Forwarded-Encrypted: i=1; AJvYcCXXl8BJ5MkQV1FX4AWssutWLwOWUG50mcoG5GozmL3zmi6gJeowIl1RgJJZoOjgogD6b3liFEPrthx/16E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxKiymJeBeAj8muVWLqiMAX7SWOgLR6dD3cRPYylTjH4Vt3P8Y0
	fUR2bipglhwxbWYSuwGkLsd+15iyhx48pegd7VLzZ3EFRrN5LgOuAaJzj1B5dNVm4KBXNvwJrY6
	89E4RBnGhrzVB1kCl7BgnmsjMFNBiPm3sEZfOt1kcZoY40I9v0LZiHx3GqdBNNck12qI=
X-Gm-Gg: ASbGnctDiidJDoRyp+nk09+qB3VWxEnkknZHreMO4B6Ov1IKWO4QVyrXDvCC7CCETkr
	2hLAEKVR4XU+oBCcYG9FgaRvNebH4rAMJD8VyiGhR2zqYO++0Ho5yeNNet18PvFvd6OilMFsEDv
	zWeOfUwhozLCtkM6orWPE0sNGCl+jz1PDNowQRuaeHr681dTiZkWEhikd1RQXA+CdMzknXVpeBI
	hdSfBJcMBUDVYnoJZiI0ROCj2lyqRzmw90Xj5hzL1xsJRVP9jeZdKA6pYWIPqcjuJOoVkseQmgu
	9WMb6GE9P/QcdVNs9vz97HyupzVar17nl5CwMEjfca1BmWq8Vt8L4uBh4iA8XTSKIT/EK7zrmXW
	ailWGAZqsRV80EyYVs6dS0RaXfVsV3rVDq9os8t/dd7g1Oxgt0S44tT2f4Ng0
X-Received: by 2002:a05:600c:4856:b0:46e:6a3f:6c6 with SMTP id 5b1f17b1804b1-475c3ea4513mr292355e9.6.1761058845727;
        Tue, 21 Oct 2025 08:00:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcCb5n53mP5PF5MfJ9HO5RP4uaN8pdS2o1XXt/OVHNFMEn6HOLQj1RdbKKLXflQ72jgla+hg==
X-Received: by 2002:a05:600c:4856:b0:46e:6a3f:6c6 with SMTP id 5b1f17b1804b1-475c3ea4513mr292005e9.6.1761058845283;
        Tue, 21 Oct 2025 08:00:45 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47152959b55sm204336915e9.6.2025.10.21.08.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 08:00:44 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
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
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v1 18/23] mm/vmscan: drop inclusion of balloon_compaction.h
Date: Tue, 21 Oct 2025 17:00:35 +0200
Message-ID: <20251021150040.498160-2-david@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021150040.498160-1-david@redhat.com>
References: <20251021125929.377194-1-david@redhat.com>
 <20251021150040.498160-1-david@redhat.com>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: puGQQmvpB-_9iFfi80HzHXdvFd0LIEZuQLjTSng8cG8_1761058846
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Before commit b1123ea6d3b3 ("mm: balloon: use general non-lru movable page
feature"), the include was required because of isolated_balloon_page().

It's no longer required, so let's remove it.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/vmscan.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index c922bad2b8fd4..b96448b562823 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -63,7 +63,6 @@
 #include <asm/div64.h>
 
 #include <linux/swapops.h>
-#include <linux/balloon_compaction.h>
 #include <linux/sched/sysctl.h>
 
 #include "internal.h"
-- 
2.51.0


