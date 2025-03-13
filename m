Return-Path: <linuxppc-dev+bounces-6987-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AE8A601BC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 21:00:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDJJM2Tt8z3c8Y;
	Fri, 14 Mar 2025 07:00:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741866280;
	cv=none; b=nLPxCu7mSR4/UFOn1GGqtDNfZ38+diJIonpH3vkuB4oHj/Vi0h6VFKpgbZtzea+5v5GeLnyT1RIl4M1dgE5KANO8xAnlX0f/ff4JYV+mqGrb/EofSsKBJspqNsUpSG8ES1aBec6q7389guW+8UVUL+5ab8m7KnU899ybs6WDQwlCEJtjlMDR/A9J9pFQIbXJxd0cO/iEL9wMVor1KMKLXsiWvSzgNvsfdRz5SJPSlL4EkZj3cj6ibLHVVwi3/o0FptOCk0iJ7vMtIq8wsYfy39NHPGT9nIPqp62DTN021lwyPG4t2ktxuVcGdTRqy8BDfsezeJaV4yoLJEyk1e6zYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741866280; c=relaxed/relaxed;
	bh=c9whUtdSVycPepKkB48hTehRX04VaeLWlAoVnLwkI/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-type; b=O9PbR8EN2RlGMg3cKJXFTL0xSZqSfNM7lxeJ2zz95hsqnVojo92whpfAdBq6faGP2wHKQKvRb2YgqONBr5WqymH6cVZuvNP9wEJ8tJeDgyMzP5KC1Lh70k23ikXZoaVOz5/lgIa2NVXlhs+IbsAfI4tPmXL9FcnkB/xb5ce1/C/AwkEkjafkEEI2RE0ugJLozI6ny9YOi1bSpReJ3G9SQZBvuEBvVAcVtdn0EGVsRfwoVEPBgwpCc7BP1zyjwCoctt1GlAPRBHeZVHoPFcKif6H7JTSuQxrfLo4z1LTZGfzUZEpBbJC84C/NgWMKNHC41hbfRSLsqokU6yo35hkrQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HF2Ar/UE; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FsnZF3Ni; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=acarmina@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HF2Ar/UE;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FsnZF3Ni;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=acarmina@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD5JQ5L91z2ynL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 22:44:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c9whUtdSVycPepKkB48hTehRX04VaeLWlAoVnLwkI/o=;
	b=HF2Ar/UE9HHT1fHhEhb2o7/l+FpFzQH7L9ab3HHPJN2B5PzgQUCYVoOl7hChrgwOjVc4iT
	hDt3fGS8iKYlai8dFAf3p7qp5rVBC1vQ5FzS3c3x5XUSloGktUDS8LNjtHE1uLfHq2Fola
	gSi/4JXqYdZ0lQmCC3i/F1ZqziYSX+o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c9whUtdSVycPepKkB48hTehRX04VaeLWlAoVnLwkI/o=;
	b=FsnZF3Nis6aNMTP0KXdHWbSTN5jUAjx6NWDL4Y9JbtXBcqQpPqm9n/6LJPzQxPyq47Z6Tk
	yj3RVjF1Ibb3rgNSUyzIh15JNQQZsaulXmmVLKsKO8jbSJ6NM9ltwW8UJ220NwMGkYjKjk
	5ylnShGM3UpmNlB8KvrrGJ6LW5kkuEA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-DQj42MF4NqO7fxZQqN2I5w-1; Thu, 13 Mar 2025 07:44:32 -0400
X-MC-Unique: DQj42MF4NqO7fxZQqN2I5w-1
X-Mimecast-MFC-AGG-ID: DQj42MF4NqO7fxZQqN2I5w_1741866271
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4394040fea1so4691705e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 04:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866271; x=1742471071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9whUtdSVycPepKkB48hTehRX04VaeLWlAoVnLwkI/o=;
        b=Mlbnsehmm7Ej5IhVmrDWOVh58wJSw/3xcf14Gxm3nU0yYcqABcfhm61ph0pMewp6Fl
         eAJlqKz9bdCr6PMRZp8i1/lmw83jSvGNSfWt0JiBZpZF2PHo0rhd3rbWwca8aiJWlEuu
         LtP8uLBTYvQ2cEvJseOsfi2QzExQFtVdKhXzed3dkE+a5fz6ddLWaK5wxnHj9AooX5nh
         rds4+juiGXpGb+ynbBBBnquGLaDRsH59EOM6ll82C5nMRVjRBi+l+JJEkK0wE5ma6RNZ
         20kPKuHiFElFwKbmTmcMvgCPM2NU+mXTVJmUUoXpykS0goaNsNAiwSspqnbCwmgdFD2J
         laCw==
X-Forwarded-Encrypted: i=1; AJvYcCUBgdW24bzULVAoAkzEKYRKHTRLU9R7xLMks75a6ntGEmF98Q5y4mDOvFnFIMaT6x8Z/c+/qmnGgivDw6A=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywm5J1ymu5QGOkpwch7NZiPCgD+igvpeBUzQ6pqvgsi6Fg1DAAa
	PclLnAprzbDkiCs1G+Nywvh9RBhTV/j7eQVGmiam2jFpkSAoQzXpuiQOJpAUIlTt2CzWz8DsWOh
	tB5J8UJrgH2XaUtD53FNw3aZ+9Tnh3+N9j/5a++M5x7fotVHnE0texfm9xOoi5zw=
X-Gm-Gg: ASbGnctxWVFiUiOocdjioS/y4Mg2+6XAzvNs4YEfycM2wWhLkdlnW4UxlIqtMkzP5yT
	j8bHosMPhsYh6JebTBrrl6Kl9zchiHPlzyJDE2uEH8pzhJx7hm8L5Ufk2R04OiRI6rhidtREdjF
	ibPFzphx4GUrccOYw0MxbStmGYs+CnWsh+kd2aTIuIfxqjBDlp/iQ2hzadr5meleI7TerwZC8qa
	cghAnId6gY6c0tFpPf2VRBXYXwJrkVCo/gBb3Cg+ID/y2vll4HikcP9475x6kMKJsKSAPyR7JZg
	PdouV7EKXP6N1m31YV47
X-Received: by 2002:a05:600c:46d2:b0:439:8e95:796a with SMTP id 5b1f17b1804b1-43d180a4435mr17959295e9.13.1741866271288;
        Thu, 13 Mar 2025 04:44:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwbP4l4FVtrSDnlyy+D6/JgQ5XIs1l5aoFtF0Hno/5cr8h07s4+r9vz3ImSRA+QwHoshLsPA==
X-Received: by 2002:a05:600c:46d2:b0:439:8e95:796a with SMTP id 5b1f17b1804b1-43d180a4435mr17959115e9.13.1741866270833;
        Thu, 13 Mar 2025 04:44:30 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:30 -0700 (PDT)
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
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 01/14] bug/kunit: Core support for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:16 +0000
Message-Id: <20250313114329.284104-2-acarmina@redhat.com>
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
X-Mimecast-MFC-PROC-ID: r8mRJiszN7cvxM-DDNKYV7TmmNQsOhO6TR35eaJDmyQ_1741866271
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Guenter Roeck <linux@roeck-us.net>

Some unit tests intentionally trigger warning backtraces by passing
bad parameters to API functions. Such unit tests typically check the
return value from those calls, not the existence of the warning backtrace.

Such intentionally generated warning backtraces are neither desirable
nor useful for a number of reasons.
- They can result in overlooked real problems.
- A warning that suddenly starts to show up in unit tests needs to be
  investigated and has to be marked to be ignored, for example by
  adjusting filter scripts. Such filters are ad-hoc because there is
  no real standard format for warnings. On top of that, such filter
  scripts would require constant maintenance.

One option to address problem would be to add messages such as "expected
warning backtraces start / end here" to the kernel log.  However, that
would again require filter scripts, it might result in missing real
problematic warning backtraces triggered while the test is running, and
the irrelevant backtrace(s) would still clog the kernel log.

Solve the problem by providing a means to identify and suppress specific
warning backtraces while executing test code. Since the new functionality
results in an image size increase of about 1% if CONFIG_KUNIT is enabled,
provide configuration option KUNIT_SUPPRESS_BACKTRACE to be able to disable
the new functionality. This option is by default enabled since almost all
systems with CONFIG_KUNIT enabled will want to benefit from it.

Cc: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Daniel Diaz <daniel.diaz@linaro.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Kees Cook <keescook@chromium.org>
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 include/asm-generic/bug.h | 16 +++++++++---
 include/kunit/bug.h       | 51 +++++++++++++++++++++++++++++++++++++++
 include/kunit/test.h      |  1 +
 include/linux/bug.h       | 13 ++++++++++
 lib/bug.c                 | 51 ++++++++++++++++++++++++++++++++++++---
 lib/kunit/Kconfig         |  9 +++++++
 lib/kunit/Makefile        |  6 +++--
 lib/kunit/bug.c           | 40 ++++++++++++++++++++++++++++++
 8 files changed, 178 insertions(+), 9 deletions(-)
 create mode 100644 include/kunit/bug.h
 create mode 100644 lib/kunit/bug.c

diff --git a/include/asm-generic/bug.h b/include/asm-generic/bug.h
index 387720933973..9194cf743ec3 100644
--- a/include/asm-generic/bug.h
+++ b/include/asm-generic/bug.h
@@ -18,6 +18,7 @@
 #endif
 
 #ifndef __ASSEMBLY__
+#include <kunit/bug.h>
 #include <linux/panic.h>
 #include <linux/printk.h>
 
@@ -39,8 +40,14 @@ struct bug_entry {
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 #ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
 	const char	*file;
+#ifdef HAVE_BUG_FUNCTION
+	const char      *function;
+#endif
 #else
 	signed int	file_disp;
+#ifdef HAVE_BUG_FUNCTION
+	signed int	function_disp;
+#endif
 #endif
 	unsigned short	line;
 #endif
@@ -96,15 +103,18 @@ extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
 #define __WARN()		__WARN_printf(TAINT_WARN, NULL)
 #define __WARN_printf(taint, arg...) do {				\
 		instrumentation_begin();				\
-		warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);	\
+		if (!KUNIT_IS_SUPPRESSED_WARNING(__func__))			\
+			warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);\
 		instrumentation_end();					\
 	} while (0)
 #else
 #define __WARN()		__WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
 #define __WARN_printf(taint, arg...) do {				\
 		instrumentation_begin();				\
-		__warn_printk(arg);					\
-		__WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
+		if (!KUNIT_IS_SUPPRESSED_WARNING(__func__)) {			\
+			__warn_printk(arg);				\
+			__WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
+		}							\
 		instrumentation_end();					\
 	} while (0)
 #define WARN_ON_ONCE(condition) ({				\
diff --git a/include/kunit/bug.h b/include/kunit/bug.h
new file mode 100644
index 000000000000..0a8e62c1fcaf
--- /dev/null
+++ b/include/kunit/bug.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * KUnit helpers for backtrace suppression
+ *
+ * Copyright (c) 2024 Guenter Roeck <linux@roeck-us.net>
+ */
+
+#ifndef _KUNIT_BUG_H
+#define _KUNIT_BUG_H
+
+#ifndef __ASSEMBLY__
+
+#include <linux/kconfig.h>
+
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+
+#include <linux/stringify.h>
+#include <linux/types.h>
+
+struct __suppressed_warning {
+	struct list_head node;
+	const char *function;
+};
+
+void __kunit_start_suppress_warning(struct __suppressed_warning *warning);
+void __kunit_end_suppress_warning(struct __suppressed_warning *warning);
+bool __kunit_is_suppressed_warning(const char *function);
+
+#define DEFINE_SUPPRESSED_WARNING(func)	\
+	struct __suppressed_warning __kunit_suppress_##func = \
+		{ .function = __stringify(func) }
+
+#define KUNIT_START_SUPPRESSED_WARNING(func) \
+	__kunit_start_suppress_warning(&__kunit_suppress_##func)
+
+#define KUNIT_END_SUPPRESSED_WARNING(func) \
+	__kunit_end_suppress_warning(&__kunit_suppress_##func)
+
+#define KUNIT_IS_SUPPRESSED_WARNING(func) \
+	__kunit_is_suppressed_warning(func)
+
+#else /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
+#define DEFINE_SUPPRESSED_WARNING(func)
+#define KUNIT_START_SUPPRESSED_WARNING(func)
+#define KUNIT_END_SUPPRESSED_WARNING(func)
+#define KUNIT_IS_SUPPRESSED_WARNING(func) (false)
+
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+#endif /* __ASSEMBLY__ */
+#endif /* _KUNIT_BUG_H */
diff --git a/include/kunit/test.h b/include/kunit/test.h
index 58dbab60f853..cad32d174872 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -10,6 +10,7 @@
 #define _KUNIT_TEST_H
 
 #include <kunit/assert.h>
+#include <kunit/bug.h>
 #include <kunit/try-catch.h>
 
 #include <linux/args.h>
diff --git a/include/linux/bug.h b/include/linux/bug.h
index a9948a9f1093..e42f20cf8830 100644
--- a/include/linux/bug.h
+++ b/include/linux/bug.h
@@ -36,6 +36,9 @@ static inline int is_warning_bug(const struct bug_entry *bug)
 	return bug->flags & BUGFLAG_WARNING;
 }
 
+void bug_get_file_function_line(struct bug_entry *bug, const char **file,
+				const char **function, unsigned int *line);
+
 void bug_get_file_line(struct bug_entry *bug, const char **file,
 		       unsigned int *line);
 
@@ -62,6 +65,16 @@ static inline enum bug_trap_type report_bug(unsigned long bug_addr,
 }
 
 struct bug_entry;
+static inline void bug_get_file_function_line(struct bug_entry *bug,
+					      const char **file,
+					      const char **function,
+					      unsigned int *line)
+{
+	*file = NULL;
+	*function = NULL;
+	*line = 0;
+}
+
 static inline void bug_get_file_line(struct bug_entry *bug, const char **file,
 				     unsigned int *line)
 {
diff --git a/lib/bug.c b/lib/bug.c
index e0ff21989990..5eb2ee66916f 100644
--- a/lib/bug.c
+++ b/lib/bug.c
@@ -26,6 +26,14 @@
        when CONFIG_DEBUG_BUGVERBOSE is not enabled, so you must generate
        the values accordingly.
 
+  2a.Optionally implement support for the "function" entry in struct
+     bug_entry. This entry must point to the name of the function triggering
+     the warning or bug trap (normally __func__). This is only needed if
+     both CONFIG_DEBUG_BUGVERBOSE and CONFIG_KUNIT_SUPPRESS_BACKTRACE are
+     enabled and if the architecture wants to implement support for suppressing
+     warning backtraces. The architecture must define HAVE_BUG_FUNCTION if it
+     adds pointers to function names to struct bug_entry.
+
   3. Implement the trap
      - In the illegal instruction trap handler (typically), verify
        that the fault was in kernel mode, and call report_bug()
@@ -127,14 +135,21 @@ static inline struct bug_entry *module_find_bug(unsigned long bugaddr)
 }
 #endif
 
-void bug_get_file_line(struct bug_entry *bug, const char **file,
-		       unsigned int *line)
+void bug_get_file_function_line(struct bug_entry *bug, const char **file,
+				const char **function, unsigned int *line)
 {
+	*function = NULL;
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 #ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
 	*file = (const char *)&bug->file_disp + bug->file_disp;
+#ifdef HAVE_BUG_FUNCTION
+	*function = (const char *)&bug->function_disp + bug->function_disp;
+#endif
 #else
 	*file = bug->file;
+#ifdef HAVE_BUG_FUNCTION
+	*function = bug->function;
+#endif
 #endif
 	*line = bug->line;
 #else
@@ -143,6 +158,13 @@ void bug_get_file_line(struct bug_entry *bug, const char **file,
 #endif
 }
 
+void bug_get_file_line(struct bug_entry *bug, const char **file, unsigned int *line)
+{
+	const char *function;
+
+	bug_get_file_function_line(bug, file, &function, line);
+}
+
 struct bug_entry *find_bug(unsigned long bugaddr)
 {
 	struct bug_entry *bug;
@@ -157,8 +179,9 @@ struct bug_entry *find_bug(unsigned long bugaddr)
 static enum bug_trap_type __report_bug(unsigned long bugaddr, struct pt_regs *regs)
 {
 	struct bug_entry *bug;
-	const char *file;
+	const char *file, *function;
 	unsigned line, warning, once, done;
+	char __maybe_unused sym[KSYM_SYMBOL_LEN];
 
 	if (!is_valid_bugaddr(bugaddr))
 		return BUG_TRAP_TYPE_NONE;
@@ -169,12 +192,32 @@ static enum bug_trap_type __report_bug(unsigned long bugaddr, struct pt_regs *re
 
 	disable_trace_on_warning();
 
-	bug_get_file_line(bug, &file, &line);
+	bug_get_file_function_line(bug, &file, &function, &line);
+#if defined(CONFIG_KUNIT_SUPPRESS_BACKTRACE) && defined(CONFIG_KALLSYMS)
+	if (!function) {
+		/*
+		 * This will be seen if report_bug is called on an architecture
+		 * with no architecture-specific support for suppressing warning
+		 * backtraces, if CONFIG_DEBUG_BUGVERBOSE is not enabled, or if
+		 * the calling code is from assembler which does not record a
+		 * function name. Extracting the function name from the bug
+		 * address is less than perfect since compiler optimization may
+		 * result in 'bugaddr' pointing to a function which does not
+		 * actually trigger the warning, but it is better than no
+		 * suppression at all.
+		 */
+		sprint_symbol_no_offset(sym, bugaddr);
+		function = sym;
+	}
+#endif /* defined(CONFIG_KUNIT_SUPPRESS_BACKTRACE) && defined(CONFIG_KALLSYMS) */
 
 	warning = (bug->flags & BUGFLAG_WARNING) != 0;
 	once = (bug->flags & BUGFLAG_ONCE) != 0;
 	done = (bug->flags & BUGFLAG_DONE) != 0;
 
+	if (warning && KUNIT_IS_SUPPRESSED_WARNING(function))
+		return BUG_TRAP_TYPE_WARN;
+
 	if (warning && once) {
 		if (done)
 			return BUG_TRAP_TYPE_WARN;
diff --git a/lib/kunit/Kconfig b/lib/kunit/Kconfig
index a97897edd964..201402f0ab49 100644
--- a/lib/kunit/Kconfig
+++ b/lib/kunit/Kconfig
@@ -15,6 +15,15 @@ menuconfig KUNIT
 
 if KUNIT
 
+config KUNIT_SUPPRESS_BACKTRACE
+	bool "KUnit - Enable backtrace suppression"
+	default y
+	help
+	  Enable backtrace suppression for KUnit. If enabled, backtraces
+	  generated intentionally by KUnit tests are suppressed. Disable
+	  to reduce kernel image size if image size is more important than
+	  suppression of backtraces generated by KUnit tests.
+
 config KUNIT_DEBUGFS
 	bool "KUnit - Enable /sys/kernel/debug/kunit debugfs representation" if !KUNIT_ALL_TESTS
 	default KUNIT_ALL_TESTS
diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
index 5aa51978e456..3195e861d63c 100644
--- a/lib/kunit/Makefile
+++ b/lib/kunit/Makefile
@@ -16,8 +16,10 @@ ifeq ($(CONFIG_KUNIT_DEBUGFS),y)
 kunit-objs +=				debugfs.o
 endif
 
-# KUnit 'hooks' are built-in even when KUnit is built as a module.
-obj-y +=				hooks.o
+# KUnit 'hooks' and bug handling are built-in even when KUnit is built
+# as a module.
+obj-y +=				hooks.o \
+					bug.o
 
 obj-$(CONFIG_KUNIT_TEST) +=		kunit-test.o
 obj-$(CONFIG_KUNIT_TEST) +=		platform-test.o
diff --git a/lib/kunit/bug.c b/lib/kunit/bug.c
new file mode 100644
index 000000000000..351f9a595a71
--- /dev/null
+++ b/lib/kunit/bug.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit helpers for backtrace suppression
+ *
+ * Copyright (c) 2024 Guenter Roeck <linux@roeck-us.net>
+ */
+
+#include <kunit/bug.h>
+#include <linux/export.h>
+#include <linux/list.h>
+#include <linux/string.h>
+
+static LIST_HEAD(suppressed_warnings);
+
+void __kunit_start_suppress_warning(struct __suppressed_warning *warning)
+{
+	list_add(&warning->node, &suppressed_warnings);
+}
+EXPORT_SYMBOL_GPL(__kunit_start_suppress_warning);
+
+void __kunit_end_suppress_warning(struct __suppressed_warning *warning)
+{
+	list_del(&warning->node);
+}
+EXPORT_SYMBOL_GPL(__kunit_end_suppress_warning);
+
+bool __kunit_is_suppressed_warning(const char *function)
+{
+	struct __suppressed_warning *warning;
+
+	if (!function)
+		return false;
+
+	list_for_each_entry(warning, &suppressed_warnings, node) {
+		if (!strcmp(function, warning->function))
+			return true;
+	}
+	return false;
+}
+EXPORT_SYMBOL_GPL(__kunit_is_suppressed_warning);
-- 
2.34.1


