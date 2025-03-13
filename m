Return-Path: <linuxppc-dev+bounces-7001-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC25A601D5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 21:02:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDJLb53fFz3cXD;
	Fri, 14 Mar 2025 07:02:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741866316;
	cv=none; b=dsf3bt4+2il4YytwzETd6bil4YjKlREqjC4ahI8Vmw7hXwJVHFoeQZJEzM1MO2HIdJdnVEUJxw2yQgopd6LL5DKNh0uo8L6Kash/tzD4/yG30bpfVe1kuSpHw7R56nbk2CAkxiVGIbUk0uHT3NMKZbCncKrqpGiPQ3kK6fppl9B+lKzChONn4IrU4MgeHgseJu8OYu01xH0HwT9eXWKTjxUt641tu6ylMoagO/pV3i9uIRYOq/EAyMATnrjLLBaLdK3QFHjVFncnNS4maUeYqCXfZeG0YTjJg04MmU/t56EDZF/qokUCYXlKwl3VVM6bpfJpV+Aw5UvMk72TOgoE0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741866316; c=relaxed/relaxed;
	bh=GROr3WSjkuWJZb5whyX7QQnwj0kVrCWo4LNK5GIabXk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-type; b=eNQ2keKYfucw4rqkHie5RFmjxYMHPagILN6uPvTjSGPNSIAxqQQZ/MwZ3sbLWdzCp+DN9RW0NK2uxLyTUEof0cWSS6hsNFqsb1ElyRl0yMfqraM5VVgDCIfyrtomWAkrJgSjse1lpO20sC6OaZjTX7aTkdhGtUDzOGyNZBYfozlbaFOcqHXk9ch4INAipc6MDUzrLw9QJPYQ8bKe8VV6q63b7fBrzkX+idI+nglxY8nUTRl1KpWuDByq0kzgt45RGqNU0M+BBR8pPWxPFAGC3QtYWkrle4MGGoBTK7jUVF70IsB0hudKkXJ7hoUysU2bzMheq/XwRXVU4FGt71nb5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JyLiy12g; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JyLiy12g; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=acarmina@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JyLiy12g;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JyLiy12g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=acarmina@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD5K767sxz2ynL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 22:45:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GROr3WSjkuWJZb5whyX7QQnwj0kVrCWo4LNK5GIabXk=;
	b=JyLiy12gdDlGLNB9fthIUmeT3xCiEx6GuMFO5YOWJNgtG4XOW66oajMUS9bftGunoARL+s
	UpfsIomTJuPDb13cDqUR5rVD3SDxrJrfRhVw54RyJYakuUW8/qZDGqO94pOCg3gaVQiS/i
	4BCX9ztnkeqEs3dtTr30fn78Eg2Voqg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GROr3WSjkuWJZb5whyX7QQnwj0kVrCWo4LNK5GIabXk=;
	b=JyLiy12gdDlGLNB9fthIUmeT3xCiEx6GuMFO5YOWJNgtG4XOW66oajMUS9bftGunoARL+s
	UpfsIomTJuPDb13cDqUR5rVD3SDxrJrfRhVw54RyJYakuUW8/qZDGqO94pOCg3gaVQiS/i
	4BCX9ztnkeqEs3dtTr30fn78Eg2Voqg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-KA8FttboOdK8EkCqjQi6Aw-1; Thu, 13 Mar 2025 07:44:46 -0400
X-MC-Unique: KA8FttboOdK8EkCqjQi6Aw-1
X-Mimecast-MFC-AGG-ID: KA8FttboOdK8EkCqjQi6Aw_1741866285
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so5868415e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 04:44:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866285; x=1742471085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GROr3WSjkuWJZb5whyX7QQnwj0kVrCWo4LNK5GIabXk=;
        b=siAB7RR0M2EQbbiQuRdHsdCaix1wvjR3abCkSm81J4vwC3zWu2+rGG0wop19WvMV4U
         gLNQ3eoZwHPJTOGRzPKxy4mYlt+PUPXqONYdS5/Qj7gsVzew1qL7uUUEM5bFX7puUYZO
         RdFdoe/R9VEyXhEkTvDGKyhNQv2rthuvGKKjofw1B3uDd33gbDbpbWvzojbBF1R1kUuJ
         8BiLvCzJwIrLvOkPxZfsn4UC7O0VDOztaPQAXAESc0Zp+FREgPys5/gvNbpFdll3UZd3
         71C02lUsrnG2QMbnbhICUbMzIdrriV7VEcIba36dsqYYti3GYhzsiWaSd+7oAS10/rWp
         2UGQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3aEKc1phZNmZFkDH7aLVU8JQOdQ148AhKb0vSXiadWcS20NLR+Wlst5S1HHqN70cy0DSa0RLPVdnOt2o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxW28c2rJu7COMp5U2uvipRspqXWTT4sLJ7hvDkPMl1hGr0UcM4
	mcp4AqZfrQW0V49na3XVxy50DqADlrZ5/q8iYM19eBNnF3UDbra6wXIyUzaey6bVKIsGGVoaEqR
	IT/eyTYQh5PUawFYz3AWp47E4esNVkT51RMYPaWcZ/pPYV90z7P2kLh5cx7Wz+eQ=
X-Gm-Gg: ASbGncuWroBt6updNHeHyWtH1y9oyFQJCHgM/PFLwYVeM9v0SPZHAJ+sn4eK7Q+Wp6l
	Xeu3/E+ZjcGe4VL62VAAGEGesNvDfeVMAecpSrqOPsJgexyIJjTpxfu2YVDDD8VONT93v5w2Q7p
	Y7QIN6PB+Mq4YTWTHX+YI8FUjdXpXgizx5BqQRLmT5Qs8JBGf7NwGOTYx+HGGPvYbCp2s/0gdBV
	AQ7RxAaPjMpldO7QNacHrN5OvxEPXn9BvNZ1kdUIuHiwN6qXpoJfqcGOa2iPIKzRRetXZbeyTvw
	qartxQBCeB7wtOYbbgcE
X-Received: by 2002:a05:600c:5493:b0:43c:fb8e:aec0 with SMTP id 5b1f17b1804b1-43d01bd21e2mr95038665e9.1.1741866284839;
        Thu, 13 Mar 2025 04:44:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmAbVJJ3Axf7J+/aQFhSVgbztnHuV0D3aaCUWl74kfxPn81ZspK5wVSFqWrESjIWmYzw2aJw==
X-Received: by 2002:a05:600c:5493:b0:43c:fb8e:aec0 with SMTP id 5b1f17b1804b1-43d01bd21e2mr95038375e9.1.1741866284399;
        Thu, 13 Mar 2025 04:44:44 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:43 -0700 (PDT)
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 07/14] arm64: Add support for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:22 +0000
Message-Id: <20250313114329.284104-8-acarmina@redhat.com>
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
X-Mimecast-MFC-PROC-ID: rDAxoL-VIcgVHPlrm4h6vycFkk0nbMErJGgCDiRuDpE_1741866285
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
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 arch/arm64/include/asm/asm-bug.h | 27 ++++++++++++++++++---------
 arch/arm64/include/asm/bug.h     |  8 +++++++-
 2 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/asm-bug.h b/arch/arm64/include/asm/asm-bug.h
index 6e73809f6492..bf0a5ba81611 100644
--- a/arch/arm64/include/asm/asm-bug.h
+++ b/arch/arm64/include/asm/asm-bug.h
@@ -8,37 +8,46 @@
 #include <asm/brk-imm.h>
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
-#define _BUGVERBOSE_LOCATION(file, line) __BUGVERBOSE_LOCATION(file, line)
-#define __BUGVERBOSE_LOCATION(file, line)			\
+
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR(func)	.long func - .;
+#else
+# define __BUG_FUNC_PTR(func)
+#endif
+
+#define _BUGVERBOSE_LOCATION(file, func, line) __BUGVERBOSE_LOCATION(file, func, line)
+#define __BUGVERBOSE_LOCATION(file, func, line)		\
 		.pushsection .rodata.str,"aMS",@progbits,1;	\
 	14472:	.string file;					\
 		.popsection;					\
 								\
 		.long 14472b - .;				\
+		__BUG_FUNC_PTR(func)				\
 		.short line;
 #else
-#define _BUGVERBOSE_LOCATION(file, line)
+#define _BUGVERBOSE_LOCATION(file, func, line)
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
 
-#define __BUG_ENTRY(flags) 				\
+#define __BUG_ENTRY(flags, func)			\
 		.pushsection __bug_table,"aw";		\
 		.align 2;				\
 	14470:	.long 14471f - .;			\
-_BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
+_BUGVERBOSE_LOCATION(__FILE__, func, __LINE__)		\
 		.short flags; 				\
 		.align 2;				\
 		.popsection;				\
 	14471:
 #else
-#define __BUG_ENTRY(flags)
+#define __BUG_ENTRY(flags, func)
 #endif
 
-#define ASM_BUG_FLAGS(flags)				\
-	__BUG_ENTRY(flags)				\
+#define ASM_BUG_FLAGS(flags, func)			\
+	__BUG_ENTRY(flags, func)			\
 	brk	BUG_BRK_IMM
 
-#define ASM_BUG()	ASM_BUG_FLAGS(0)
+#define ASM_BUG()	ASM_BUG_FLAGS(0, .)
 
 #endif /* __ASM_ASM_BUG_H */
diff --git a/arch/arm64/include/asm/bug.h b/arch/arm64/include/asm/bug.h
index 28be048db3f6..044c5e24a17d 100644
--- a/arch/arm64/include/asm/bug.h
+++ b/arch/arm64/include/asm/bug.h
@@ -11,8 +11,14 @@
 
 #include <asm/asm-bug.h>
 
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC	NULL
+#endif
+
 #define __BUG_FLAGS(flags)				\
-	asm volatile (__stringify(ASM_BUG_FLAGS(flags)));
+	asm volatile (__stringify(ASM_BUG_FLAGS(flags, %c0)) : : "i" (__BUG_FUNC));
 
 #define BUG() do {					\
 	__BUG_FLAGS(0);					\
-- 
2.34.1


