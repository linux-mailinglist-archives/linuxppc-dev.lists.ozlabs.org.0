Return-Path: <linuxppc-dev+bounces-6993-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D8FA601CC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 21:01:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDJKY3xw1z3cTs;
	Fri, 14 Mar 2025 07:01:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741866289;
	cv=none; b=Ev2/BZy+YtX4oZHXvseQg40NGohNT5PyaGRm/w+MBY+SErOnaWhb0ofgNkYambq0Kzt4sb6sfsejfmnrbrEoMGUApsrLxrAGWsUEhIG/0c23MwmYW515zYOwERBoYKNXwgpjt4pLdmYZFfFkTZiN33xfgjuwKWBmcbHvuZKu6ZkJQGeB6csjHYee3tyzEDcO2ChIAptHsAzu5c3MLAY23sT7QdWD1fcvu3h6Gsgi8DWp3JYVo605ahWzDYgumQCGlsGH++poJtsut2oXazIPzAvVHjmxa5am2flxZYnnefgz7mSlkLdVsSDPK+8LCZlhhhNRbUihga5UxoaMLKlp2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741866289; c=relaxed/relaxed;
	bh=8P6wNaO+XIHVOsaMiUxPKzcQyyRjSmyu7hy/Ke33WeI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-type; b=NoSW+d1/4Xc9Kk6gbRXhuN1LjvO6rhAnp1oaq4LxvuN7LiaCZ9iXbJ77BZauCEwkkgYTXSwj4/gNM19QmqFt/gnIHLKcVOCpTQNGtfQA3P3/ih914EpaDYTCbCvPDFkfxQo4F0haoBY/V/kn4eymHy1RxWLHQgRirG9hQznEM9zvRGohum84hVSoDQ0yTMN8OsnB0/A7O8R2ZWWXBIecoMUnP+UEL6xbrXcQFNNoGtm/oqwtICN4HjjAl0gx05Jop8ttYsPKl8hF3kPbOqEJDz4q3kno019tee21xIU813tK33QZtAtUJjDy4mhqnHIbhAvepBL+fLSIlpNChzzIAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ct+v0wxr; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ct+v0wxr; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=acarmina@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ct+v0wxr;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ct+v0wxr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=acarmina@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD5Jc5Nlvz2ynL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 22:44:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8P6wNaO+XIHVOsaMiUxPKzcQyyRjSmyu7hy/Ke33WeI=;
	b=Ct+v0wxrtzPDPcLlSLMppeB2ZEGv4dNYYH7JLP03rCjmRQTZNltcZIBykPIo560Zmpa8z7
	sd18hWvDmBZ6L+k7o0g9lGGetHk5BFuw5sdAGIE/I54d8U48Z/q+cmLAb0jlnCsuKosJlf
	5V8PGJjqmxresde02Qn/AOfrmJIkAps=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8P6wNaO+XIHVOsaMiUxPKzcQyyRjSmyu7hy/Ke33WeI=;
	b=Ct+v0wxrtzPDPcLlSLMppeB2ZEGv4dNYYH7JLP03rCjmRQTZNltcZIBykPIo560Zmpa8z7
	sd18hWvDmBZ6L+k7o0g9lGGetHk5BFuw5sdAGIE/I54d8U48Z/q+cmLAb0jlnCsuKosJlf
	5V8PGJjqmxresde02Qn/AOfrmJIkAps=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-c3-L1koFNZiNyXf7k3yagg-1; Thu, 13 Mar 2025 07:44:43 -0400
X-MC-Unique: c3-L1koFNZiNyXf7k3yagg-1
X-Mimecast-MFC-AGG-ID: c3-L1koFNZiNyXf7k3yagg_1741866283
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d01024089so5946295e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 04:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866283; x=1742471083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8P6wNaO+XIHVOsaMiUxPKzcQyyRjSmyu7hy/Ke33WeI=;
        b=cD8QsXyuelvWpLX9Ww0C/oZXoZlqkjA0kZJy11tmSXqF4BSQTqijGD2N1PXDRC95Pp
         Fz74hswsBZYWI9ayh3hVK/toJV90bj10od54O5g4tJyU4HzpHfZFitVLWS06dSgjfSH1
         8KTUOlm+FBWXVy2DXS2vxV2Jj8j3EyAwkmPGDpr/T3EEJ2CfUL8po4RMMUIEeGG8efFF
         Mn5VVCfVW5bYqbAIyVBbHgo0gUr5fjMYPYWEkwwyRcbjhE+QFviAViSuYgfE0toef0YL
         PRSEKmOz6YPx40NhDxm44FNDwn43CgpO2tf999+AuJKunWFs0jytv5XFVSWbHOS8duDj
         NCHA==
X-Forwarded-Encrypted: i=1; AJvYcCWhp9+ujCG6lT4yNi4jyW6RpI3ZAC8CxV+zYBDVzHJPFV/FY2zxN4nJ14XjnzLJ3rycZZj0JDTTQyWlFns=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwANTY0M3Gni48tT0MzwsBv3TcRIc7tA8ON5O+ai5rHCNQ1HMwD
	KLFiPe3xG040AgoccbaXr9NiGtvzz5JxFcwaJ+2exvL0EQwPKUibKxChYlHtkybxY+kGlAlvF9G
	uJhizqpD9FC0tep3Y78QvzqGaqd48DVJL6ABueEzGYz4hPvp9G1S70I2YY60UqOI=
X-Gm-Gg: ASbGncvPruq+X6O4mrBB2//oBESNKzs4QX2MW3Cmod1zn59S2p84J/6UU19NQU1HYyF
	ntnMa59JUuVf7cUj2y5+Y8EA4aMlBSD5Eku9b30k14h6Eq6GCyQO2uBWXiimy7+Ud+HmEU2EwiL
	WR8U6AZnyy1vrmFB+2eKVUqZaE7YDvT9IB+u1yRm8IaCLduIbCSBobOuQBM7ttpFm6RlTvE6UkS
	e6QYpflBlvVy6Et3SOw3E29XJ40H0TyIAvF8+v93iZSXDrTvn7padkxMvSSBuUhdHUnJuTEVNAz
	eE7Y4sw74xcFKiA+x2tB
X-Received: by 2002:a05:600c:46d3:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-43c602223f0mr255847155e9.30.1741866282652;
        Thu, 13 Mar 2025 04:44:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXX+a12CkpViQK6U7ArlV7I00zmbs9phG5wa1a6gevfoSJzXsUnRwbzS8Xh3mqpEsYOihpsg==
X-Received: by 2002:a05:600c:46d3:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-43c602223f0mr255846615e9.30.1741866282213;
        Thu, 13 Mar 2025 04:44:42 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:41 -0700 (PDT)
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
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 06/14] x86: Add support for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:21 +0000
Message-Id: <20250313114329.284104-7-acarmina@redhat.com>
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
X-Mimecast-MFC-PROC-ID: yNw9ABGhz68MdWSEyMbvN-7EjVwSm9ALeSMJumVfMU4_1741866283
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
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
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 arch/x86/include/asm/bug.h | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index e85ac0c7c039..f6e13fc675ab 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -35,18 +35,28 @@
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	__BUG_REL(%c1)
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC_PTR
+# define __BUG_FUNC	NULL
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
 #define _BUG_FLAGS(ins, flags, extra)					\
 do {									\
 	asm_inline volatile("1:\t" ins "\n"				\
 		     ".pushsection __bug_table,\"aw\"\n"		\
 		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
 		     "\t"  __BUG_REL(%c0) "\t# bug_entry::file\n"	\
-		     "\t.word %c1"        "\t# bug_entry::line\n"	\
-		     "\t.word %c2"        "\t# bug_entry::flags\n"	\
-		     "\t.org 2b+%c3\n"					\
+		     "\t"  __BUG_FUNC_PTR "\t# bug_entry::function\n"	\
+		     "\t.word %c2"        "\t# bug_entry::line\n"	\
+		     "\t.word %c3"        "\t# bug_entry::flags\n"	\
+		     "\t.org 2b+%c4\n"					\
 		     ".popsection\n"					\
 		     extra						\
-		     : : "i" (__FILE__), "i" (__LINE__),		\
+		     : : "i" (__FILE__), "i" (__BUG_FUNC), "i" (__LINE__),\
 			 "i" (flags),					\
 			 "i" (sizeof(struct bug_entry)));		\
 } while (0)
@@ -92,7 +102,8 @@ do {								\
 do {								\
 	__auto_type __flags = BUGFLAG_WARNING|(flags);		\
 	instrumentation_begin();				\
-	_BUG_FLAGS(ASM_UD2, __flags, ANNOTATE_REACHABLE(1b));	\
+	if (!KUNIT_IS_SUPPRESSED_WARNING(__func__))			\
+		_BUG_FLAGS(ASM_UD2, __flags, ANNOTATE_REACHABLE(1b));	\
 	instrumentation_end();					\
 } while (0)
 
-- 
2.34.1


