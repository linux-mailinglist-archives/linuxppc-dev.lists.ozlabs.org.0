Return-Path: <linuxppc-dev+bounces-6994-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED0FA601CD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 21:01:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDJKh14npz3cVT;
	Fri, 14 Mar 2025 07:01:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741866294;
	cv=none; b=NaFF63FktHJ365L67AgAW2Ft7/Q/xXgp72tTVbxV1cXWLzGn00scVmeNdFX9SMY/vfj0ygw/XXxA3H3iO13PZ6okTsAkKaEmbJXUTOQDaRhCgIYXV7BXpIq5nv0WprP4LbIlaSnet87bQj30Ot4hvB38WfNKTs+ibXNb5tWBOBfLRUQTxEwCMF+GKHDZkemB7KezIePcNQpyXzeMowiWUvbBeRlblMu+2uoSOT9ays9qvCenPi1z90D8DCRgjpx8029Y32N4HnPlb+t0yB0pYj5tPYidM6dc03WrAfkC2eiTvI+erX05fFB8bZ+9/j4GjEODv2NzQ47SOn14Wm7aEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741866294; c=relaxed/relaxed;
	bh=PbqX7vwCNjEpHKJ2wPiix10XVQC29l2r3Yj9fEcNr2k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-type; b=cew+SBB0eT3a7ENGVmD2V81EQXyif7odXLEBqIx482E1xDQHHq2vf8v9cwwC3gduM9Rc2ST3UB3Szs5Jym8SOqZOYnLt7stDLU7oxyaNR+cgNNJzwwlYajU93qQnxLjk0B2yglieMSdfr+eZXzgcS5NElvdeEw+9sSvSFn8jcfhgNN1uw9X4jG68ccf0wgBl8FGBZ/jOBaMurRiN+SSCx2C9Kntr78i2UaT6rcF9F8f5KhZE6KJBK8ZcKjiXt1s8QJyXJXJyoJrCpOIvNq1JPK2yacQVPa01Ui5m0rBYjD5e/LfeWrec5xNfC52brYR02pSI4qxUwkf03mjKNok3yw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bWZa8nBH; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bWZa8nBH; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=acarmina@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bWZa8nBH;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bWZa8nBH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=acarmina@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD5Jj6NCsz2ynL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 22:44:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PbqX7vwCNjEpHKJ2wPiix10XVQC29l2r3Yj9fEcNr2k=;
	b=bWZa8nBHoXG3GREn2Bx7JrXtcNxzSkst9p0mvZfAAUdEEhYpgyxd0+104qxKLRCjK7EdHp
	LvHyV4ao/PPHTDZEqaAWFJOVfMRXZpbWTY5fU8OKGcx44tW3N5db537HoF605uQ9p6PZ7Y
	7rcbv0SistoNF1StwFbi9en/bsg7fyc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PbqX7vwCNjEpHKJ2wPiix10XVQC29l2r3Yj9fEcNr2k=;
	b=bWZa8nBHoXG3GREn2Bx7JrXtcNxzSkst9p0mvZfAAUdEEhYpgyxd0+104qxKLRCjK7EdHp
	LvHyV4ao/PPHTDZEqaAWFJOVfMRXZpbWTY5fU8OKGcx44tW3N5db537HoF605uQ9p6PZ7Y
	7rcbv0SistoNF1StwFbi9en/bsg7fyc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-RW4xBvQRP6-b35M0FypgvQ-1; Thu, 13 Mar 2025 07:44:48 -0400
X-MC-Unique: RW4xBvQRP6-b35M0FypgvQ-1
X-Mimecast-MFC-AGG-ID: RW4xBvQRP6-b35M0FypgvQ_1741866287
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so6438085e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 04:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866287; x=1742471087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PbqX7vwCNjEpHKJ2wPiix10XVQC29l2r3Yj9fEcNr2k=;
        b=lwS1Lc96Qif7Myy4kq0YyyRN+Zj9zBlPdNnrq/AqaBBOSLQ9aR5MBCSuh1fq/83OS9
         3j5usRzDVF7EaFMPUW9xOT+1K4vaFMxqsuM+E1c9i3t3Lu9BS4AtiUnXkEPaLLjPe9Q8
         ooQ3D8bM7k+QbCruXjUsfROIq3GcnW2nLlwG2SLSGcql7hBK22quk0H+W1BBMgnSMxBj
         X38UdLtkNU9N/N63Y2maKsrihWEU1YpvRTpC4SZK+v0x6y+QHUdUO48MNQT92o5mSZEK
         DtJCDBVNXry8s0LnjzNa5E3J/U9uASUVzh6PrHkkveacDCBFCfD1XfaCzMOsWC93Wby4
         6bZg==
X-Forwarded-Encrypted: i=1; AJvYcCUsSUa+LlavH2sphJ8NFeqH/WJmAwxSdYhlhdOdN8yQt/63VhwJvZK25z/ko5/NrXTdNsI0Vn2seqTDhAU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz80I1/TiJTJossGwWUPjx+j3Iv1CDx9wP82Uc2kmQqr8yC33ZR
	xby2j//Zwo7GBMVe24wsVJs05LrGR75FRkrAI7zD0xAbFFdo8szltaYZhOvmRm9F2afRvUgjIJ1
	7xQjG1cb0bfqM2KyxKJCzeOJIT9KNJwALHXyfWeTfM2m1KYWex0RBKshDys9ExYI=
X-Gm-Gg: ASbGncus1PPKtiDvVOWxr/37MsoffzlrmMCDQNH5+JBt7o1m04UT3M+Bk/md++me8ij
	1BMIqWJttH+PtBiblU7mlYNZEoCZtFx3lKxjJKM1WYk0NlvRnD6/nELzj8ogH/aEtTfWU+0yyb+
	+jFx1XICkfXtV6ZmcySXoeFc/mxd0FzEjMOnTF3dfaVc+Z6U9pK1J0N+CDhHNcZ89VF/IkYS3iR
	niuzk98iV+ctras0ig1y2TTXj3l/ru7c1gkQCSXpbooZD1SG11YAh1loBfqExBbX3yuIs8UhNTJ
	+ww5CHSPwU8XmgJ9JEwZ
X-Received: by 2002:a05:600c:3512:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-43cfe154338mr111255375e9.9.1741866287306;
        Thu, 13 Mar 2025 04:44:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDgHdaZ1G01z8VuKBQ3BfPMVXgqQ5rvdTXEZ7bpTSjr+Dr16GZrLUPpD2KPNpGCET/hDHX7g==
X-Received: by 2002:a05:600c:3512:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-43cfe154338mr111254865e9.9.1741866286869;
        Thu, 13 Mar 2025 04:44:46 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:45 -0700 (PDT)
From: Alessandro Carminati <acarmina@redhat.com>
To: linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org,
	kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	loongarch@lists.linux.dev,
	x86@kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 08/14] loongarch: Add support for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:23 +0000
Message-Id: <20250313114329.284104-9-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313114329.284104-1-acarmina@redhat.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
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
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: skz2bnxvIR37s9kiRY7I7irJSn7-oHmQ-b366o2Py24_1741866287
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Guenter Roeck <linux@roeck-us.net>

Add name of functions triggering warning backtraces to the __bug_table
object section to enable support for suppressing WARNING backtraces.

To limit image size impact, the pointer to the function name is only added
to the __bug_table section if both CONFIG_KUNIT_SUPPRESS_BACKTRACE and
CONFIG_DEBUG_BUGVERBOSE are enabled. Otherwise, the __func__ assembly
parameter is replaced with a (dummy) NULL parameter to avoid an image size
increase due to unused __func__ entries (this is necessary because __func__
is not a define but a virtual variable).

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Huacai Chen <chenhuacai@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 arch/loongarch/include/asm/bug.h | 42 ++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/arch/loongarch/include/asm/bug.h b/arch/loongarch/include/asm/bug.h
index f6f254f2c5db..b79ff6696ce6 100644
--- a/arch/loongarch/include/asm/bug.h
+++ b/arch/loongarch/include/asm/bug.h
@@ -3,49 +3,65 @@
 #define __ASM_BUG_H
 
 #include <asm/break.h>
+#include <kunit/bug.h>
 #include <linux/stringify.h>
 #include <linux/objtool.h>
 
 #ifndef CONFIG_DEBUG_BUGVERBOSE
-#define _BUGVERBOSE_LOCATION(file, line)
+#define _BUGVERBOSE_LOCATION(file, func, line)
 #else
-#define __BUGVERBOSE_LOCATION(file, line)			\
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR(func)  .long func - .;
+#else
+# define __BUG_FUNC_PTR(func)
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
+#define __BUGVERBOSE_LOCATION(file, func, line)			\
 		.pushsection .rodata.str, "aMS", @progbits, 1;	\
 	10002:	.string file;					\
 		.popsection;					\
 								\
 		.long 10002b - .;				\
+		__BUG_FUNC_PTR(func)				\
 		.short line;
-#define _BUGVERBOSE_LOCATION(file, line) __BUGVERBOSE_LOCATION(file, line)
+#define _BUGVERBOSE_LOCATION(file, func, line) __BUGVERBOSE_LOCATION(file, func, line)
 #endif
 
 #ifndef CONFIG_GENERIC_BUG
-#define __BUG_ENTRY(flags)
+#define __BUG_ENTRY(flags, func)
 #else
-#define __BUG_ENTRY(flags) 					\
+#define __BUG_ENTRY(flags, func)				\
 		.pushsection __bug_table, "aw";			\
 		.align 2;					\
 	10000:	.long 10001f - .;				\
-		_BUGVERBOSE_LOCATION(__FILE__, __LINE__)	\
+		_BUGVERBOSE_LOCATION(__FILE__, func, __LINE__)	\
 		.short flags; 					\
 		.popsection;					\
 	10001:
 #endif
 
-#define ASM_BUG_FLAGS(flags)					\
-	__BUG_ENTRY(flags)					\
+#define ASM_BUG_FLAGS(flags, func)				\
+	__BUG_ENTRY(flags, func)				\
 	break		BRK_BUG;
 
-#define ASM_BUG()	ASM_BUG_FLAGS(0)
+#define ASM_BUG()	ASM_BUG_FLAGS(0, .)
+
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC    __func__
+#else
+# define __BUG_FUNC    NULL
+#endif
 
-#define __BUG_FLAGS(flags, extra)					\
-	asm_inline volatile (__stringify(ASM_BUG_FLAGS(flags))		\
-			     extra);
+#define __BUG_FLAGS(flags, extra)				\
+	asm_inline volatile (__stringify(ASM_BUG_FLAGS(flags, %0)) \
+			     extra : : "i" (__BUG_FUNC) );
 
 #define __WARN_FLAGS(flags)					\
 do {								\
 	instrumentation_begin();				\
-	__BUG_FLAGS(BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
+	if (!KUNIT_IS_SUPPRESSED_WARNING(__func__))			\
+		__BUG_FLAGS(BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
 	instrumentation_end();					\
 } while (0)
 
-- 
2.34.1


