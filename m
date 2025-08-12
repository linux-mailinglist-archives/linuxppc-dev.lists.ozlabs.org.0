Return-Path: <linuxppc-dev+bounces-10864-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA2DB227DB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 15:10:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1X1L6Cgsz3dTl;
	Tue, 12 Aug 2025 23:10:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755004230;
	cv=none; b=I1J1YaxKVfKSs00cQVuAZSImj9iOXj9NLjKRtCk+sBQhQr4nSleLyS/f3Qy17rppkYVkep3MBSEClibRTk1JY4QgB5DFQCQgSMSVyIhWD+XEbcXtR+bKiC5QL8uz0SDdOHDCnkROun36pqLqMZGDR6Bu4iuMrANYvFO1qZG1dQidAF9vNDgdTP2Qjt4gu8t4Jzd2JXCkIUWkQQ/Q5529kD8rYxr68QKOPvSo4CIZI/k3odLMVtYC+BLiemNalNiXLiQG2VLclI8DbV4Xn9zGP3gHIOgalqQevK+oP/RAqif8ZwXB7xbnYddnk5r5cnjB8pCi6l0r8307nV2UrYzk+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755004230; c=relaxed/relaxed;
	bh=Shp71aTpcjkRwp8fdFozCS7DFDAA9ma8z9v4/SjxSDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=F8arLmj1xkvK0cFjnpgOCDbOR3fVyr0Xuk03lJrrlmguFKAGyXCTy7+02OQL05D3yy907/M6UVOyOtiiQoKrTSfEp7XAmr76KX8PV14LuRs65oT3w4obTSFNhyTjdk6a/FKq8lLhL6DFgCFacxtsAmyZ2zkEp0tbsfBufyZBCsGxumJK2LWSJw3Q/BTEQ/XZxlCL92l4jZDp/Np+PAppgmsGE130wuU/rIJM8CNDFRzfa/DCdqvD+RmDA/uvDNnOncNFjB8/6LJiDdFuB8WjMczZm8nF/lFa+wKga48GpZol6ktHFh0eWRv4JeSd07Qcv3A1bAYINwhMMetGVfqPxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QNvit8TR; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QNvit8TR; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QNvit8TR;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QNvit8TR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1X1L0n5Nz3dTg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 23:10:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755004227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Shp71aTpcjkRwp8fdFozCS7DFDAA9ma8z9v4/SjxSDw=;
	b=QNvit8TRWTHh3H53f76e4D/mDYTZkvQmBf7d/pRtblSrPSKeNCgaogvCM91NKbklRtDWvr
	ZLhbS/1hu/n9LA/4xuoNz96VoXJNbxwYK3Sa77X0esW/Xax+8D8gsobMOgmavJzHUnZS+2
	xvkCxplMTpURtxDxne5o4mOCrxl1pCg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755004227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Shp71aTpcjkRwp8fdFozCS7DFDAA9ma8z9v4/SjxSDw=;
	b=QNvit8TRWTHh3H53f76e4D/mDYTZkvQmBf7d/pRtblSrPSKeNCgaogvCM91NKbklRtDWvr
	ZLhbS/1hu/n9LA/4xuoNz96VoXJNbxwYK3Sa77X0esW/Xax+8D8gsobMOgmavJzHUnZS+2
	xvkCxplMTpURtxDxne5o4mOCrxl1pCg=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-584-DibAMnFxNhOH8o8J4OV6gw-1; Tue,
 12 Aug 2025 09:10:21 -0400
X-MC-Unique: DibAMnFxNhOH8o8J4OV6gw-1
X-Mimecast-MFC-AGG-ID: DibAMnFxNhOH8o8J4OV6gw_1755004218
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BD2F4195608A;
	Tue, 12 Aug 2025 13:10:17 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.156])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D4E08195608F;
	Tue, 12 Aug 2025 13:10:07 +0000 (UTC)
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
Subject: [PATCH 3/4] arch/um: remove kasan_arch_is_ready()
Date: Tue, 12 Aug 2025 21:09:32 +0800
Message-ID: <20250812130933.71593-4-bhe@redhat.com>
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

And also error out if both CONFIG_STATIC_LINK and CONFIG_KASAN_INLINE
are set at the same time as UML supports each of them but done's support
both at the same time.

And also add code comment to explain why static key kasan_flag_enabled
need be deferred to arch_mm_preinit().

Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/um/include/asm/kasan.h | 5 ++---
 arch/um/kernel/mem.c        | 6 +++++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/um/include/asm/kasan.h b/arch/um/include/asm/kasan.h
index f97bb1f7b851..b54a4e937fd1 100644
--- a/arch/um/include/asm/kasan.h
+++ b/arch/um/include/asm/kasan.h
@@ -24,10 +24,9 @@
 
 #ifdef CONFIG_KASAN
 void kasan_init(void);
-extern int kasan_um_is_ready;
 
-#ifdef CONFIG_STATIC_LINK
-#define kasan_arch_is_ready() (kasan_um_is_ready)
+#if defined(CONFIG_STATIC_LINK) && defined(CONFIG_KASAN_INLINE)
+#error UML does not work in KASAN_INLINE mode with STATIC_LINK enabled!
 #endif
 #else
 static inline void kasan_init(void) { }
diff --git a/arch/um/kernel/mem.c b/arch/um/kernel/mem.c
index 392a23d4ef96..d62f494e0808 100644
--- a/arch/um/kernel/mem.c
+++ b/arch/um/kernel/mem.c
@@ -35,7 +35,11 @@ void kasan_init(void)
 	 */
 	kasan_map_memory((void *)KASAN_SHADOW_START, KASAN_SHADOW_SIZE);
 	init_task.kasan_depth = 0;
-	kasan_um_is_ready = true;
+	/*
+	 * Since kasan_init() is called before main(),
+	 * KASAN is initialized but the enablement is deferred after
+	 * jump_label_init(). See arch_mm_preinit().
+	 */
 }
 
 static void (*kasan_init_ptr)(void)
-- 
2.41.0


