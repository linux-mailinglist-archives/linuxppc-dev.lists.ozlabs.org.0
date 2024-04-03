Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F5F8970E3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 15:28:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iw4yvl3y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8ltj4lSGz3wBc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 00:28:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iw4yvl3y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8ljH62xQz3w2c
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 00:20:03 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1e0ae065d24so53958005ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Apr 2024 06:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712150401; x=1712755201; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klYg8xMT6MjrhYgIxkpLnDg0Lyaa6cQfR4UsA0LeN2U=;
        b=iw4yvl3ydVft8ASuhZO+/JVjpkF2fGBQXh533ELZs6mKMfJFSd7z7KTW2zmhHEYG9c
         Xjg9bMmCNmaJPQiwDTscRERObinqBLLtdloxlvElJuLwI6wp62xRF6k56z09VeaUr7/2
         biESqgP3hd+bPJWz63NJnLoHPAuXz7qMG+qN7HgNoq0K2VQNLiSrZV7zDIvIuJpyi58V
         bloOBcrY6l8SfQqg+BrxIvasZt08+YTBE6KxHos34ZoRhUL3ulWkURXMX6PYCzAiUUSW
         je0y0VoHrAeFDPeNQp6X2jtEn65sIX3NphbJbOHNb47koDcs28jyiT8wWI5p4A/O0pYE
         BCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150401; x=1712755201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=klYg8xMT6MjrhYgIxkpLnDg0Lyaa6cQfR4UsA0LeN2U=;
        b=MZv+a9GOouRrQxkcjDe5HOASS+p4reLbvTvGRNLiI56w71oc2F3dcJdLCoJ0BcAv9n
         VhckQjv5cAXICH4yw8McvTg7Q8eQuO7+AeZn5UleMu2Py35G7/pAAt7dudgT1SaW8hqB
         oFwzfK+vl5OhUbweQoaOxgJF6t/Ws3V3p2LLbHCGVjbkx0xb8W8D0xKDvS+IKpsucNOq
         y+/Qdtt6aRM9i7pLIQbtgto+LzMTMXKK2l/XkT5CuTTuamNgHADjSh7hM9/yzHa4GRcM
         OciaoJ+J+TR1BGDh9RnKzvo15XKFeWTLMi7n5dr7hqn0bmHQH+VTkv8sI1QRK85zg94F
         lHAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZvmLZl1o6/s2OAHQoll3W8c40284e/VyEEMLqFpwpeVz3evnr8hL5Zip2ZeYsGEcdWO0mHhGMaT0GmxevcRlMkbXF0sOFQzs3nffNRw==
X-Gm-Message-State: AOJu0YyhYzS/5SUTsTptHPHooUflpHPAfKooaTXZMYdIBk4gDRWw8j2j
	dkJbxVxpLFZcHxCsmmBrmKBKEvaz5MbzIo04xc8hP1YgSinSNJMQ
X-Google-Smtp-Source: AGHT+IEMqe589WW9yt5k/lfzrxxoDYVpXeSOxtyZyHF9LDTCjhOnJNt1j89G1vs1iICWdJ7uWy226Q==
X-Received: by 2002:a17:902:bb16:b0:1e0:b871:53f1 with SMTP id im22-20020a170902bb1600b001e0b87153f1mr12301982plb.31.1712150401114;
        Wed, 03 Apr 2024 06:20:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x3-20020a170902a38300b001e2461c52c6sm9309915pla.149.2024.04.03.06.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:20:00 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Subject: [PATCH v3 11/15] s390: Add support for suppressing warning backtraces
Date: Wed,  3 Apr 2024 06:19:32 -0700
Message-Id: <20240403131936.787234-12-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403131936.787234-1-linux@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, Vasily Gorbik <gor@linux.ibm.com>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Linux Kernel Functional Testing <lkft@linaro.org>, Guenter Roeck <linux@roeck-us.net>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, Daniel Vetter <da
 niel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add name of functions triggering warning backtraces to the __bug_table
object section to enable support for suppressing WARNING backtraces.

To limit image size impact, the pointer to the function name is only added
to the __bug_table section if both CONFIG_KUNIT_SUPPRESS_BACKTRACE and
CONFIG_DEBUG_BUGVERBOSE are enabled. Otherwise, the __func__ assembly
parameter is replaced with a (dummy) NULL parameter to avoid an image size
increase due to unused __func__ entries (this is necessary because
__func__ is not a define but a virtual variable).

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2:
- Rebased to v6.9-rc1 (simplified assembler changes after upstream commit
  3938490e78f4 ("s390/bug: remove entry size from __bug_table section")
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option
v3:
- Rebased to v6.9-rc2

 arch/s390/include/asm/bug.h | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
index c500d45fb465..44d4e9f24ae0 100644
--- a/arch/s390/include/asm/bug.h
+++ b/arch/s390/include/asm/bug.h
@@ -8,6 +8,15 @@
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"	.long	%0-.\n"
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC_PTR
+# define __BUG_FUNC	NULL
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
 #define __EMIT_BUG(x) do {					\
 	asm_inline volatile(					\
 		"0:	mc	0,0\n"				\
@@ -17,10 +26,12 @@
 		".section __bug_table,\"aw\"\n"			\
 		"2:	.long	0b-.\n"				\
 		"	.long	1b-.\n"				\
-		"	.short	%0,%1\n"			\
-		"	.org	2b+%2\n"			\
+		__BUG_FUNC_PTR					\
+		"	.short	%1,%2\n"			\
+		"	.org	2b+%3\n"			\
 		".previous\n"					\
-		: : "i" (__LINE__),				\
+		: : "i" (__BUG_FUNC),				\
+		    "i" (__LINE__),				\
 		    "i" (x),					\
 		    "i" (sizeof(struct bug_entry)));		\
 } while (0)
-- 
2.39.2

