Return-Path: <linuxppc-dev+bounces-13099-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07720BF69B8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 15:01:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crXSy2yLMz3dWQ;
	Wed, 22 Oct 2025 00:00:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761051601;
	cv=none; b=k9cIxFlvzY68ewt51hkdvoTucq3Fn/eS049JKDXN+tMKbmEEZ9pjieg6X/cCeDgslCBJMsa//4CimpswarkulAry1F9JtjQLTDWPO/FczXkIwjBYNPnw7l6Q0usPPsv9FF6kWIoQ9H4HGKD4GQqMnAEYE3Ll/DlQFW/LqpqSilt0eGk5SPUdvyiqHCsg4AEUdYpzWIgS35D0ZrH3mc+VCtCEYZyiSUjAksw3iftijMQmGj6IWM1WRpHgistQgkDwIBe5x+W+iaNBU+cdwiYqqB+mkExlnBK8rQqOSFLNnDVJmI0lqix4Gm2RBpT0brfkNmvifQydW1hL+dpBh1kvtA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761051601; c=relaxed/relaxed;
	bh=a58UIIapVgV9zdPpt63SgupeCmEgQ8fjnLkqSW0/g7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=EObFYnuW18sg8QTTg7wMXLLiVqVzbMOZMi/mdoL95vftXdHFuTKBc4U6uXpHDnt1gTCl/ypFnpCWx95WkrRAnzdbQ9ZBDro/AZKDR23Mq+/E108RJzEleOh28cfZz16uEr5OHx2bdACVqw58TX3BO3Michd1Q+J5jt9zOKxAohrsO/1jIhd2G+I1hcvyx0pxS5CfmnrjuFB7dmPPiNTymtIfVti9n5hgpE87eDoJkVOe2rZgWS9dou9PJE9i+5gKh/+jv71MjG5wp8y2SBmaq3wQ/K2TcfzHzaQtmSXjwRpj69MIt2iXaaLSBDclQu1jMDxR0vQKBjGK4elrepkP5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PLLhvRxD; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PLLhvRxD; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PLLhvRxD;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PLLhvRxD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crXSw5CH1z3dVB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 00:00:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a58UIIapVgV9zdPpt63SgupeCmEgQ8fjnLkqSW0/g7g=;
	b=PLLhvRxDZoeOB15hDgXyuwdMleCxA0eGTvqd7Cvdd3A4YD92UEIT2ztoMZToMc9IH1cRRm
	GEMIIMvWUX72DWaBtpZpDrOPcu8w309J+BSGiohGtyuNGb5JQNd5AZcUFzoiXrrrwod1ol
	Bk4pXGOfPnYlupuevh+mPQ9L6QN1VHI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a58UIIapVgV9zdPpt63SgupeCmEgQ8fjnLkqSW0/g7g=;
	b=PLLhvRxDZoeOB15hDgXyuwdMleCxA0eGTvqd7Cvdd3A4YD92UEIT2ztoMZToMc9IH1cRRm
	GEMIIMvWUX72DWaBtpZpDrOPcu8w309J+BSGiohGtyuNGb5JQNd5AZcUFzoiXrrrwod1ol
	Bk4pXGOfPnYlupuevh+mPQ9L6QN1VHI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80--50Dk9jtPMmbYxHjrgWDbA-1; Tue, 21 Oct 2025 08:59:56 -0400
X-MC-Unique: -50Dk9jtPMmbYxHjrgWDbA-1
X-Mimecast-MFC-AGG-ID: -50Dk9jtPMmbYxHjrgWDbA_1761051595
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3ee130237e1so2431486f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 05:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051595; x=1761656395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a58UIIapVgV9zdPpt63SgupeCmEgQ8fjnLkqSW0/g7g=;
        b=JIu19D6ZMNJg2kFK8c0RTXbD5c4RwjrnSK2DgxB4hf5jaYY/1/x8mn/VQvXwAksH47
         DrLjYTk1GEmp5ttIDP3xh5MH66MuRE6F9/qMikvh2CTvMB0fEMSl1V9Q0HaoY5yy8PHo
         auT2lm187qUw/a7TMTs5DOCEmEmcNbzvPuuKfMyV5aRS+9gWSOw+/sn/gQZez8a8UqWa
         3bhNwJg30YT23/5avshwQVyy5zS4PKEEFDD9nuZy7WgI5HvtgILQk4SSYf2iLg+FM3oR
         pZrnqsxpeHz9iRgEP6BvQYzIQRopCrZRf2+vyEgLROLthC1+N5p/NgrY0E8/7+DwfSOq
         VPFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4XqMrTVE8UruBlnnu0/27pkqilNUfmYWLtDA78ERGJDhxBuhM7680jDq+wvvu6YCZEHeoa3j4izaZ0VE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzpUh9dPaIVUpCnW5bgE0FTbxuXjiA3JLa9gaN51kccj7jL4dko
	4hgaEM8x6iXObaapREzV3odwMpbXvzkll7JotA6fXKkLQxB8E5f0HnR3ggxGFOQvvvjsnp44SQG
	r95mb7zdtLxdTKi4JSjOb2ILwxYJ+n1SofV0SzO4Skplb8k4ThjYnATWVeEvvVgcucQQ=
X-Gm-Gg: ASbGnctxULIIRtjE6+JuWqBBH65uNhmNim3dDKqn0asjDSRIpycx2PbJuKZBwhOmB5x
	WSIrrEOXFviTOh3bVwXHUXe1kZUwO9GJ+ncfal9J+0GLxIIgxvKJUKaYqk2MIZ/TfF+oAkKcxMU
	zANc/08xWj20Tt1NZWhO+45OB0IDOQazb1zqdiWjutNiSNxZ5CFpdbbawsN3RjuU7YA6Vy1Krb6
	1AEk7Ch1gCAv0F9gvNHG8AKpnmreR1np49yBS9kaHzqnxgYNbxWFG6Q4/6exD7Ac5W9lqJDBit+
	8L81DNUgQ606MFJ8gA+NFDZAOYV4MNLeukQ5Yiv4IX9JdG1FgGuzvDn7chyB+JhRNDQj4IesP/T
	koK+GhUh83zWfSnbuiVGqW7warxqRB+a+k2iwMYUHEnJ5BrSezdihZOrD+lFn
X-Received: by 2002:a5d:5f48:0:b0:427:2e8:fe5e with SMTP id ffacd0b85a97d-42704d83898mr11742002f8f.13.1761051594838;
        Tue, 21 Oct 2025 05:59:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOL78NSzfD/K3cQTXDnH1hifM9lFea/fB9GzfGevY7RVlJ9OG6SsU/tMvE3AQ+AuHnf7dxjA==
X-Received: by 2002:a5d:5f48:0:b0:427:2e8:fe5e with SMTP id ffacd0b85a97d-42704d83898mr11741985f8f.13.1761051594394;
        Tue, 21 Oct 2025 05:59:54 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f00ce56csm20023457f8f.50.2025.10.21.05.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:59:53 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
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
Subject: [PATCH v1 10/23] mm/balloon_compaction: drop fs.h include from balloon_compaction.h
Date: Tue, 21 Oct 2025 14:59:15 +0200
Message-ID: <20251021125929.377194-11-david@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021125929.377194-1-david@redhat.com>
References: <20251021125929.377194-1-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: zEgGl-0plTKXLi1EmjGF-_Z1VF5AXt1UA9EtDjeyW8M_1761051595
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Ever since commit 68f2736a8583 ("mm: Convert all PageMovable users to
movable_operations") we no longer store an inode in balloon_dev_info,
so we can stop including "fs.h".

Signed-off-by: David Hildenbrand <david@redhat.com>
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
2.51.0


