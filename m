Return-Path: <linuxppc-dev+bounces-10863-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DFDB227D8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 15:10:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1X150DRDz3dRY;
	Tue, 12 Aug 2025 23:10:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755004217;
	cv=none; b=LghOkIFdRBXrx5/B40QsovGgvLbFLDv9L4+U2H1aGd/BDZyPADYUvnixq0OLJiY2x5tjrLy2LLiV2UFW//E75Sk21PdZ97Qg3G0/TAq4BHOvd8z4091KLcdolFJXNq6gszHb8C2s31AL95kP5d3Bni1Tkzayty+Lw2sWIWg8E0RDKwsSOa+NfpBZzi3568XyRx2y329hGgzlcOe8DCcetSP28st1xhqyChLADtpgANG69H+0i19bhGqBzWXYgImcvQc9PE30CILbSlVNeMnItDV2n8JQEF2QPVP7bXQ13aYhL4rElYkfeBP6k4STR3vOtUWXbyyiVzS483R7AW8+pg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755004217; c=relaxed/relaxed;
	bh=SMz5O7u0akvXjVncCick/hCZpGXIHb0iYHhbJTqmUJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=XJxpxD+Ehm5B/bN3wxtxs0tQBW2uwOHyur1/PinmWRsFPYjrBR4E8rdnj6UChPl7Xw/wmsPAPUxutIAEPMb0w/naQ2RtS6ZuzY6mpnAIsWtgTI1ZSDYVLHJWEKBm/Yh7OLOA7co1GvoWjjuowG/Zd+qzcN7P3iIZV1MTlBqwP6rh4OZBYszxCnNfMIFJG9kY9XWqVKfqCvTOq35A6BVQcuZi30C6P9VC3Z6vmKTm893re/CvI6Ll//adBMRxk9MS0qPWRwSTEYPVyJqk9Xsas71cucsC7h2iCGkL+ZBhC3QmWuN5KleN0JVPzsoo5iDevELOBw/JsuooAYDbZloMSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GNi+pwJb; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GNi+pwJb; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GNi+pwJb;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GNi+pwJb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1X141758z3dT5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 23:10:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755004213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SMz5O7u0akvXjVncCick/hCZpGXIHb0iYHhbJTqmUJE=;
	b=GNi+pwJbXKzI1L4V2/gN3EmZKfOKK1TwxDXUq+M8PgJdr+3UTCwdQYjQtDe3lAXgkYG4Vw
	tfDd1PG5fqlaHKhVslIs6wNTVmrb3Mb/ByI71OQRN2HwKXOqRb/FtyGS+KKfpwRXQY1lDR
	/rzIE6p9B6/AF8HjNbYsN9GK33bmb+A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755004213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SMz5O7u0akvXjVncCick/hCZpGXIHb0iYHhbJTqmUJE=;
	b=GNi+pwJbXKzI1L4V2/gN3EmZKfOKK1TwxDXUq+M8PgJdr+3UTCwdQYjQtDe3lAXgkYG4Vw
	tfDd1PG5fqlaHKhVslIs6wNTVmrb3Mb/ByI71OQRN2HwKXOqRb/FtyGS+KKfpwRXQY1lDR
	/rzIE6p9B6/AF8HjNbYsN9GK33bmb+A=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-365-087PP938PFqZR3S46zQ-3g-1; Tue,
 12 Aug 2025 09:10:10 -0400
X-MC-Unique: 087PP938PFqZR3S46zQ-3g-1
X-Mimecast-MFC-AGG-ID: 087PP938PFqZR3S46zQ-3g_1755004207
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1F303180034D;
	Tue, 12 Aug 2025 13:10:07 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.156])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 499F41955F16;
	Tue, 12 Aug 2025 13:09:56 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: snovitoll@gmail.com,
	ryabinin.a.a@gmail.com,
	christophe.leroy@csgroup.eu,
	hca@linux.ibm.com,
	andreyknvl@gmail.com,
	akpm@linux-foundation.org,
	chenhuacai@loongson.cn,
	davidgow@google.com,
	glider@google.com,
	dvyukov@google.com,
	alexghiti@rivosinc.com,
	kasan-dev@googlegroups.com,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	agordeev@linux.ibm.com,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 2/4] arch/powerpc: remove kasan_arch_is_ready()
Date: Tue, 12 Aug 2025 21:09:31 +0800
Message-ID: <20250812130933.71593-3-bhe@redhat.com>
In-Reply-To: <20250812130933.71593-1-bhe@redhat.com>
References: <20250812130933.71593-1-bhe@redhat.com>
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
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>

With the help of static key kasan_flag_enabled, kasan_arch_is_ready()
is not needed any more. So reomve the unneeded kasan_arch_is_ready() and
the relevant codes.

Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/powerpc/include/asm/kasan.h       | 13 -------------
 arch/powerpc/mm/kasan/init_book3s_64.c |  4 ----
 2 files changed, 17 deletions(-)

diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
index b5bbb94c51f6..73466d3ff302 100644
--- a/arch/powerpc/include/asm/kasan.h
+++ b/arch/powerpc/include/asm/kasan.h
@@ -53,19 +53,6 @@
 #endif
 
 #ifdef CONFIG_KASAN
-#ifdef CONFIG_PPC_BOOK3S_64
-DECLARE_STATIC_KEY_FALSE(powerpc_kasan_enabled_key);
-
-static __always_inline bool kasan_arch_is_ready(void)
-{
-	if (static_branch_likely(&powerpc_kasan_enabled_key))
-		return true;
-	return false;
-}
-
-#define kasan_arch_is_ready kasan_arch_is_ready
-#endif
-
 void kasan_early_init(void);
 void kasan_mmu_init(void);
 void kasan_init(void);
diff --git a/arch/powerpc/mm/kasan/init_book3s_64.c b/arch/powerpc/mm/kasan/init_book3s_64.c
index 9c5cf2354c8b..c1b78a9cd0a9 100644
--- a/arch/powerpc/mm/kasan/init_book3s_64.c
+++ b/arch/powerpc/mm/kasan/init_book3s_64.c
@@ -19,8 +19,6 @@
 #include <linux/memblock.h>
 #include <asm/pgalloc.h>
 
-DEFINE_STATIC_KEY_FALSE(powerpc_kasan_enabled_key);
-
 static void __init kasan_init_phys_region(void *start, void *end)
 {
 	unsigned long k_start, k_end, k_cur;
@@ -95,8 +93,6 @@ void __init kasan_init(void)
 	 */
 	memset(kasan_early_shadow_page, 0, PAGE_SIZE);
 
-	static_branch_inc(&powerpc_kasan_enabled_key);
-
 	/* KASAN is now initialized, enable it. */
 	static_branch_enable(&kasan_flag_enabled);
 
-- 
2.41.0


