Return-Path: <linuxppc-dev+bounces-10801-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 761A7B207B2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Aug 2025 13:27:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c0smJ1TRBz3d2g;
	Mon, 11 Aug 2025 21:26:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754911616;
	cv=none; b=iH6a1YZy4EOd+ciqtICanwnP8UPZWRqj3CdcVtn5ZLByZ6M3JKIfM7CmDuQ38xwV7/AHXfOVBTM84XFBNtEwtD1CAjXNjoW4zQbi4MNpk7IVSD9+GoWtcGabnSlgAlLHjX3Av/nmNgFA3VmG7iCJtXW4Wf9MGX34KXqjhsUgiUnruv76R9WFVbv+hHzpSQ4Z/Ps6MJkFNfrKMvPGp7YCfBuPRW5nMf/bSNjkf+eZkWl+5OALSMeGbwmnE8n1ITbiieDuYv0Th18vKjxe1pmf0j+Uw4hxdkyPl2s5HHmClOieQsiE+pE/1TjoFDGHRhQn7TDTweL9RQX9TKgbicbi2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754911616; c=relaxed/relaxed;
	bh=UJDg4sW92zbLWKqBjb1tVZssT9gBBixv5gdvUlii8Zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=nJVEiI09bhZfGyW9xPCEeA58Da0dVM+CbxgpuoHZOYRh8BqOcRDk/KNbpPP9kFmyJEFHV8Qrx9J7sHws5mHQ/Oo1XWi+XJM9xuDjGX2dgKY4DuqJAsXXEBildDc35wRiJq3BGBNMm+HeTpsCI7GdS9DhyhAyzJkOPviEEWAgy3ZD+t1bJbEhUnS2l5dyqdY6i8E8JNRuKJ4tzdYiSXJJh6f/40unufxE15k+WeginvGpscAZlthULOYOAp1Aul57rh7ga0BFLXOb1L+ArASz4AQTrynWnSJ4PojWBrENTcX9NzQUq6Ebx0FGH5IRXZ79xsT4IogtZYKfopA7SP0Ktw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dw7hYDSn; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MyPXC0XI; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dw7hYDSn;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MyPXC0XI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c0smH2xlgz3d2c
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 21:26:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UJDg4sW92zbLWKqBjb1tVZssT9gBBixv5gdvUlii8Zs=;
	b=Dw7hYDSn4ECdNdnpa6TzGzoX5SH1fo2SKgFssJItHmYvklx91CAYj5o+2ABXjcY/u4gWDD
	d6CQLcHShyJgVUl9k0eMRfsfMmliaFqWdYBFuyf75U07P62r875NBLQI2a1KovrvpTdNHg
	zexyAy+1g/yo9F4j1QYoIm34b+RnVVE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UJDg4sW92zbLWKqBjb1tVZssT9gBBixv5gdvUlii8Zs=;
	b=MyPXC0XIg7g5JhENW/CXpMmSyxPHsJSF73U94cOihzQptFe1FrxPz4bT1QJjQh4i0vQlPz
	CXuvTidwWacll4TLoz23wf+tlle+pd3aIEL9vbWq58yO7JEQlsU2LtgyiJKjg3r96RYgyd
	gAU6EAutwzvQuEhPJsuSTN+aRpk8jrA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-4l24TsvWNCeFTbdoGo8-qg-1; Mon, 11 Aug 2025 07:26:51 -0400
X-MC-Unique: 4l24TsvWNCeFTbdoGo8-qg-1
X-Mimecast-MFC-AGG-ID: 4l24TsvWNCeFTbdoGo8-qg_1754911610
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b7891afb31so3196135f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 04:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911610; x=1755516410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJDg4sW92zbLWKqBjb1tVZssT9gBBixv5gdvUlii8Zs=;
        b=igo+MmEfgw3+/rWK4t/7VC2FkvHHmYyaLxR7nFvf/wNAUruPN4o6o/Xw5X8uL6tJc7
         9bh2hHr1EGxgGP59DXwBNCdAhvMmdjRZFBfq9n8FNbGxf2voth0mNPe4pG6Cq+VIPHdH
         bLp31IK5WBGQn7h294zApN9PcQSRnPPy1jDxQ4wTosA2SNuyKuO78JadVHuPO3jLLXQa
         1A85+QAlVDTcJLsMo3I2j0CuFmYm2kIk4p9bl+1CgX31IMdcJ48pqFSgf0MeyWDtPhnl
         nHDbrglPkvjLRrePxInim6G6X7/ltmOj9B+cAKbwvmfSjKIagW15El2OVPwXKBnRwxfn
         2mdA==
X-Forwarded-Encrypted: i=1; AJvYcCXJNYFCSEN1TwvJAk9lQE1pxuBw0xaGnqW7q/TE3BNuUGz44/zEUzU/NwHVkc/ANdE7Eib69pBjAwMhcEo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw2uEIhOMaYywmoOuVS+o0HpEUQQPBgJ7dkWe5D1ZkKl8wyrEIY
	ARCRyIAUhP3jE1r9fYgXI3ztG8Ra3UyA093MMX7BykcmUASXXog3g8l1+DxQZUNaVvaZibAyigz
	4noUe1UBNWGibkgaOPtOAX0QLD/JVAKgXQg+ZkRExH8wfZ2kPRp5jVzwtLt/IbwA6zVY=
X-Gm-Gg: ASbGncsPW1wK1hONlVmOZXmzosQg8eKu8v3rbKPDecW8cQovphOkqJxVG8IJjHf+V+J
	NMEBR9F4GLN14uFjUnoY3KEcXFp0x1g2S+P9HQeWLm2F3IGFHHNVOmH4ORiUB2tShqZ7lOr7ooR
	wbe9rPWh99xc7QQS/2LtNf5fjFfTa/ZTvnj793AqVaCc1/E/mG1K1srqU5mQGFCj7tzEde3OHCI
	+CpbEH945edahT+B2SzC8I6heTSvVJ5LvkXxtOzUH4NkK3YhaP/brUwpZ+d9jz1kGeMzsuKxzW/
	EuJTZavoJsryDw5BlefF3XTsD3i8z2FcsYxgYX9J0iygTB835CoDDAqEqcty5TKAeqXSw0xjuFo
	hsj8Gk4qVcvtyXXwN/QgOCDru
X-Received: by 2002:a05:6000:2010:b0:3b7:9d83:5104 with SMTP id ffacd0b85a97d-3b900b83ce4mr10356643f8f.51.1754911610087;
        Mon, 11 Aug 2025 04:26:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH28XXBuV6P4eMmACbygagN9E2w90dcNlvtCQwFebmNkdYsSnJof6QrfGHsOh8VfCIdvok2gg==
X-Received: by 2002:a05:6000:2010:b0:3b7:9d83:5104 with SMTP id ffacd0b85a97d-3b900b83ce4mr10356583f8f.51.1754911609552;
        Mon, 11 Aug 2025 04:26:49 -0700 (PDT)
Received: from localhost (p200300d82f06a600a397de1d2f8bb66f.dip0.t-ipconnect.de. [2003:d8:2f06:a600:a397:de1d:2f8b:b66f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c3bf93dsm40408983f8f.27.2025.08.11.04.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 04:26:48 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	xen-devel@lists.xenproject.org,
	linux-fsdevel@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Hugh Dickins <hughd@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v3 06/11] powerpc/ptdump: rename "struct pgtable_level" to "struct ptdump_pglevel"
Date: Mon, 11 Aug 2025 13:26:26 +0200
Message-ID: <20250811112631.759341-7-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811112631.759341-1-david@redhat.com>
References: <20250811112631.759341-1-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: OCeqKzz5p6vUmGuuNaAQZWdyIJ0XOZ0gBSQ5c74Ajt0_1754911610
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

We want to make use of "pgtable_level" for an enum in core-mm. Other
architectures seem to call "struct pgtable_level" either:
* "struct pg_level" when not exposed in a header (riscv, arm)
* "struct ptdump_pg_level" when expose in a header (arm64)

So let's follow what arm64 does.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/mm/ptdump/8xx.c      | 2 +-
 arch/powerpc/mm/ptdump/book3s64.c | 2 +-
 arch/powerpc/mm/ptdump/ptdump.h   | 4 ++--
 arch/powerpc/mm/ptdump/shared.c   | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/mm/ptdump/8xx.c b/arch/powerpc/mm/ptdump/8xx.c
index b5c79b11ea3c2..4ca9cf7a90c9e 100644
--- a/arch/powerpc/mm/ptdump/8xx.c
+++ b/arch/powerpc/mm/ptdump/8xx.c
@@ -69,7 +69,7 @@ static const struct flag_info flag_array[] = {
 	}
 };
 
-struct pgtable_level pg_level[5] = {
+struct ptdump_pg_level pg_level[5] = {
 	{ /* pgd */
 		.flag	= flag_array,
 		.num	= ARRAY_SIZE(flag_array),
diff --git a/arch/powerpc/mm/ptdump/book3s64.c b/arch/powerpc/mm/ptdump/book3s64.c
index 5ad92d9dc5d10..6b2da9241d4c4 100644
--- a/arch/powerpc/mm/ptdump/book3s64.c
+++ b/arch/powerpc/mm/ptdump/book3s64.c
@@ -102,7 +102,7 @@ static const struct flag_info flag_array[] = {
 	}
 };
 
-struct pgtable_level pg_level[5] = {
+struct ptdump_pg_level pg_level[5] = {
 	{ /* pgd */
 		.flag	= flag_array,
 		.num	= ARRAY_SIZE(flag_array),
diff --git a/arch/powerpc/mm/ptdump/ptdump.h b/arch/powerpc/mm/ptdump/ptdump.h
index 154efae96ae09..4232aa4b57eae 100644
--- a/arch/powerpc/mm/ptdump/ptdump.h
+++ b/arch/powerpc/mm/ptdump/ptdump.h
@@ -11,12 +11,12 @@ struct flag_info {
 	int		shift;
 };
 
-struct pgtable_level {
+struct ptdump_pg_level {
 	const struct flag_info *flag;
 	size_t num;
 	u64 mask;
 };
 
-extern struct pgtable_level pg_level[5];
+extern struct ptdump_pg_level pg_level[5];
 
 void pt_dump_size(struct seq_file *m, unsigned long delta);
diff --git a/arch/powerpc/mm/ptdump/shared.c b/arch/powerpc/mm/ptdump/shared.c
index 39c30c62b7ea7..58998960eb9a4 100644
--- a/arch/powerpc/mm/ptdump/shared.c
+++ b/arch/powerpc/mm/ptdump/shared.c
@@ -67,7 +67,7 @@ static const struct flag_info flag_array[] = {
 	}
 };
 
-struct pgtable_level pg_level[5] = {
+struct ptdump_pg_level pg_level[5] = {
 	{ /* pgd */
 		.flag	= flag_array,
 		.num	= ARRAY_SIZE(flag_array),
-- 
2.50.1


