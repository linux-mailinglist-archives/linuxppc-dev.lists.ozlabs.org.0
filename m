Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B129388ACB3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 18:58:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bEnX7AjT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3LJs3SpKz3w37
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 04:58:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bEnX7AjT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3LBY1gPBz3vjC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 04:53:09 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-29fa10274e5so3094457a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 10:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389187; x=1711993987; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NkFivhI5ysBM/6se13ha6YOC4kb+BKpi8rjyyPjulPM=;
        b=bEnX7AjTwg/VGPvSDsRdz4vVPDm1d7CVBb/zm3TZzt0POxNUum0sod6pZTzhTP7jHy
         zZnaqsCQxx5ooxdDrP+HJlspQfOO8YVfsxOibgZ0Ky3cAR54TIz7JpN7rDd1h4+tpCUD
         aL40kFl3BnMel9iiemJmCp3sGdED+wMfojB/b/cvBAGdG/ulvN81rX//yhQYtwuQ5yk/
         PXY7fe/MG8AIc6JC1x9tbtWc6gpEvO5Ty2rssYDuqN+S6a/hYCxx6Ywo4gqBeOLzWdiL
         XhX251ACH44a++khOugw8dZoMHibAIwD5ZI/U+mLizu+5dwn/ZnIQjWDIiqI6n8LlgHr
         ssVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389187; x=1711993987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NkFivhI5ysBM/6se13ha6YOC4kb+BKpi8rjyyPjulPM=;
        b=vywQN9kHFYwLqo7bJVjCGSzXFwBnUPpVYIJ82hkBSDJzzeiiHjf6hKqIdXViQlFBli
         Kk/sNcUK825qRxO2Q31DLmyo6Im9Pc/yB5CuHtWZ6d9A9MGiNqppGrJ5QemPWhFQDseO
         uae4vLyfvz6RkLUfBX38kfOpdsOiCSWxJ7KYa0MFXrBrQCisRHTzEIdcOawHnGlAg1By
         1HEPBFAS6kxNZwZ28VhsmJDWWbPDBHBUBFzoiqSqsnapRhNIcqXpDiBnFDK3SLT3t5Mq
         PHWDd2ON6dlmQuhOv8Cl83IqQ/xRlZ3fRURV+Zg7ShJJymds/oq6TZ43B/vmm7tEJb+j
         OWXA==
X-Forwarded-Encrypted: i=1; AJvYcCWjhH70lYWjSTqjEdzb88ZPP+1zvqw0nygz01uBDHFhLr5MAAPuTVCu9kHzZKaMaeZDW1kNYK8THHQ72xt8ElWolp3xLRFjTBD5MZZCrQ==
X-Gm-Message-State: AOJu0YxJq6qcSo8XK6pelo0IvFm74TOA+r0V84Lyduy9CWatZJiNm4LL
	DpgSys1hMiBEwSTX9QYm4jWuu/nEHRuuT1WpbLG2WK1LCDF0yz9+
X-Google-Smtp-Source: AGHT+IGbs92c//BGiqmdUL4T55P2X9QmdN/SfOH2hxAjReRZ1Fd5UIZ7am79FuHHvN6tgafQ9jOuwg==
X-Received: by 2002:a17:90b:3005:b0:29d:fe93:52ac with SMTP id hg5-20020a17090b300500b0029dfe9352acmr5131747pjb.13.1711389186749;
        Mon, 25 Mar 2024 10:53:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u2-20020a17090ae00200b0029c693a1e6dsm6784603pjy.17.2024.03.25.10.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:53:06 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Subject: [PATCH v2 07/14] x86: Add support for suppressing warning backtraces
Date: Mon, 25 Mar 2024 10:52:41 -0700
Message-Id: <20240325175248.1499046-8-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240325175248.1499046-1-linux@roeck-us.net>
References: <20240325175248.1499046-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Linux Kernel Functional Testing <lkft@linaro.org>, Guenter Roeck <linux@roeck-us.net>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, netdev@vger.kernel.
 org, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option

 arch/x86/include/asm/bug.h | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index a3ec87d198ac..7698dfa74c98 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -23,18 +23,28 @@
 
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
@@ -80,7 +90,8 @@ do {								\
 do {								\
 	__auto_type __flags = BUGFLAG_WARNING|(flags);		\
 	instrumentation_begin();				\
-	_BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);		\
+	if (!IS_SUPPRESSED_WARNING(__func__))			\
+		_BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);	\
 	instrumentation_end();					\
 } while (0)
 
-- 
2.39.2

