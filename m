Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F8D879A5D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 18:11:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RQZLlj3T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvKt50bFnz3vcj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 04:11:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RQZLlj3T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvKjQ6Gg4z3dVv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 04:03:38 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1dc5d0162bcso33494275ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 10:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263016; x=1710867816; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yPqiFdiMaUo8CT/x9a2ZlbShLK74ZzL6qnaxWOIrD0=;
        b=RQZLlj3T59sjrFg/DieAJgXhF5t0Tq8mDUc7kVyNzHpba0kNwe0PXF7yiHa2lqlvH7
         s2aJP00TqDA3c9Pg5rRsWNPAoDPIxoHSOJTCj+CW0KdwrU5N5AlhpHq9/B+mlZcJ73SO
         hsgOan917vCuhgdvQQe/wRx5ek1C3VI4y5z13VmEKruTTEovGz0Uk3nn/thpqnkiaszr
         jgMKISHx633rVE6oPFhVq69zcZVyLxBj1r88dQYvejNWO/BNKS31aOB2ugE+tDefAgj1
         /ffdpAblZccg7SWGNyMyf9+7zBGH+YlvvEDtFvx/FY9ehJkgZ2/1u4bTjpHCF7vufkkm
         sFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263016; x=1710867816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8yPqiFdiMaUo8CT/x9a2ZlbShLK74ZzL6qnaxWOIrD0=;
        b=wH19XawJdulKwQG2fhwby460ehmJ/q3Lmi19Vcs6cti+royTVK8e4nhE0R7uKXY2bD
         NvSdGRIp9Dgmow0C9cvwPBu3207rzPBVGX/gjladP4raExXe4AsnWeEVoZzvz1LJB+CM
         7RfYnPvpRxhF3Lzex3LV/W0HPrNtLA49Ol2T+YL1DbUflJCR4VfSXyN5HR06axo4zvQ+
         24S4xSc4ZQZwSR7wafyolOJiCEEWHFt+wW8QpWSlcg5KYJwOLmgH7G4hNyWIhSlS8lNH
         yxNOL/Vx5AhI4PH+sQ5PVxxw+/Q4QNtGFeGW8X60wdr0M7FWNqpAUGf907fB8dx+RrO0
         UpHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8BsRe7cVof5LB1XeZVYEOIUiTUQ/WS5xQCTdnJdXKxQs3/kjcYBguOObP/P17r2rtni28XnFCYeHMfB09h53jve5epUsZShSymSmpqA==
X-Gm-Message-State: AOJu0YzKgqXejQ0UP5wsYtLZF72ixF6NlmPit8x0BbgvmYZiv0PaJkC1
	J7KGw41PzGKyfVF9koE/vyAuHVr0hCINnGJRpX8nu82hsvzVQs8U
X-Google-Smtp-Source: AGHT+IFoEsNPPrMLHPvnKMDpnnejQqa8I+dYMyPxL8EBJ4sDwkePMFxEwmxbDBpOVTaOpj6jJj/c1w==
X-Received: by 2002:a17:903:2349:b0:1dd:afc9:a34f with SMTP id c9-20020a170903234900b001ddafc9a34fmr4471610plh.50.1710263016146;
        Tue, 12 Mar 2024 10:03:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902ed1500b001d9a42f6183sm6958877pld.45.2024.03.12.10.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:35 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Subject: [PATCH 10/14] parisc: Add support for suppressing warning backtraces
Date: Tue, 12 Mar 2024 10:03:05 -0700
Message-Id: <20240312170309.2546362-11-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
References: <20240312170309.2546362-1-linux@roeck-us.net>
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
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Guenter Roeck <linux@roeck-us.net>, netdev@lists.linux.dev, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Zimmerman
 n <tzimmermann@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add name of functions triggering warning backtraces to the __bug_table
object section to enable support for suppressing WARNING backtraces.

To limit image size impact, the pointer to the function name is only added
to the __bug_table section if both CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBOSE
are enabled. Otherwise, the __func__ assembly parameter is replaced with a
(dummy) NULL parameter to avoid an image size increase due to unused
__func__ entries (this is necessary because __func__ is not a define but a
virtual variable).

While at it, declare assembler parameters as constants where possible.
Refine .blockz instructions to calculate the necessary padding instead
of using fixed values.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/parisc/include/asm/bug.h | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/arch/parisc/include/asm/bug.h b/arch/parisc/include/asm/bug.h
index 833555f74ffa..792dacc2a653 100644
--- a/arch/parisc/include/asm/bug.h
+++ b/arch/parisc/include/asm/bug.h
@@ -23,8 +23,17 @@
 # define __BUG_REL(val) ".word " __stringify(val)
 #endif
 
-
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+
+#if IS_ENABLED(CONFIG_KUNIT)
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	__BUG_REL(%c1)
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC_PTR
+# define __BUG_FUNC	NULL
+#endif /* IS_ENABLED(CONFIG_KUNIT) */
+
 #define BUG()								\
 	do {								\
 		asm volatile("\n"					\
@@ -33,10 +42,12 @@
 			     "\t.align 4\n"				\
 			     "2:\t" __BUG_REL(1b) "\n"			\
 			     "\t" __BUG_REL(%c0)  "\n"			\
-			     "\t.short %1, %2\n"			\
-			     "\t.blockz %3-2*4-2*2\n"			\
+			     "\t" __BUG_FUNC_PTR  "\n"			\
+			     "\t.short %c2, %c3\n"			\
+			     "\t.blockz %c4-(.-2b)\n"			\
 			     "\t.popsection"				\
-			     : : "i" (__FILE__), "i" (__LINE__),	\
+			     : : "i" (__FILE__), "i" (__BUG_FUNC),	\
+			     "i" (__LINE__),				\
 			     "i" (0), "i" (sizeof(struct bug_entry)) );	\
 		unreachable();						\
 	} while(0)
@@ -58,10 +69,12 @@
 			     "\t.align 4\n"				\
 			     "2:\t" __BUG_REL(1b) "\n"			\
 			     "\t" __BUG_REL(%c0)  "\n"			\
-			     "\t.short %1, %2\n"			\
-			     "\t.blockz %3-2*4-2*2\n"			\
+			     "\t" __BUG_FUNC_PTR  "\n"			\
+			     "\t.short %c2, %3\n"			\
+			     "\t.blockz %c4-(.-2b)\n"			\
 			     "\t.popsection"				\
-			     : : "i" (__FILE__), "i" (__LINE__),	\
+			     : : "i" (__FILE__), "i" (__BUG_FUNC),	\
+			     "i" (__LINE__),				\
 			     "i" (BUGFLAG_WARNING|(flags)),		\
 			     "i" (sizeof(struct bug_entry)) );		\
 	} while(0)
@@ -74,7 +87,7 @@
 			     "\t.align 4\n"				\
 			     "2:\t" __BUG_REL(1b) "\n"			\
 			     "\t.short %0\n"				\
-			     "\t.blockz %1-4-2\n"			\
+			     "\t.blockz %c1-(.-2b)\n"			\
 			     "\t.popsection"				\
 			     : : "i" (BUGFLAG_WARNING|(flags)),		\
 			     "i" (sizeof(struct bug_entry)) );		\
-- 
2.39.2

