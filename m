Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E80879A62
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 18:11:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AM9m552C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvKtt1R5Nz3w3M
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 04:11:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AM9m552C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvKjS31cjz3dVw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 04:03:40 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1dc1ff3ba1aso958295ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 10:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263019; x=1710867819; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNfBGF7ZRB5gRY5ju3ZTnVyluuI6d4pIMWMvwwDFCuc=;
        b=AM9m552CHC/VBh17g4rO0tFL5aB39px/dbWyTwf8KBJT26b7LekI9nd/wQfzk1n8hO
         yO7CtvvmGA+anIh7SCnd1VxHsh+Y78BHZVYT4+FHTaXEgf5PR3NANrKnk5MtaQNb0tg/
         e0CeBUEZSQ4Cg/gWEO78W286021LPUfzB2/pcxeSZwToT4JCzpICiyiQtGYGY3J+E6Gd
         0njvmGQeQkVAinZWNZV5jC89dBvqarXYsXjXQ75JcqArceOT8+HYTf5ixqNH02xC5sf4
         QlfRvzQEW4Lc44gXmrSx9BNtcFQ2aI45B45W9qz41ZHAny9qGLisf1VErAQfr5XbNK9O
         GeIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263019; x=1710867819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UNfBGF7ZRB5gRY5ju3ZTnVyluuI6d4pIMWMvwwDFCuc=;
        b=OdunmqxspR1lRmSuUZ3UZUYAyWp0l+FBQjf+R8rxGWdYw+WZdl340HR9Uu6l6k42uW
         vcomTY8v38y4y6+LddaPECj9BA0L4PKm4EEJG0aur9nxBFlv29nGX4eMF31Q2YcVu7Lf
         RWxxnAQTk1bFhEQmKEC50QR+Y7CsdFmaV8iKgmNQlrnczMv+lX2rWleICq4IgMze8zyJ
         WhG/VNYtpP3I15U00U7W06OmrK5IfIXZd8ObqY/ABwRRAXH4QJUuoW4szufHJFjesIC2
         VvpPLSnIu3WtSoYT3UzW9ABgSqe9BlWEeGuVN79wGOs+WHKl4Mbq6pVJsOaoMShxn/TH
         g+2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWuHRFcjSBJzx1GfntVsz09upIo9P14+SKNxwRZJ9Xv92KudraY8XmRmUqW+bCGAfVLdUbIjzn9xHsYLawzGWbAfFnMYvnkQ+JtYUc/oQ==
X-Gm-Message-State: AOJu0Yz+7PHoP6MpnoNcqGTcRVM34g/xY1w4kG/c4kvwwc9u4KXLIB+v
	saKfYcy1EfVN/ypqpKMmxvJ17rJKbAr6j2CW1SW/IS7aQLT6RwES
X-Google-Smtp-Source: AGHT+IGjcPO5G+GnCGVDj4Jcw0R4zzS4LNLUn52exaX20Pa+MrIRq7GoxtzdXir/jkag847FtE7VIQ==
X-Received: by 2002:a17:902:cec8:b0:1dd:7d6a:de4f with SMTP id d8-20020a170902cec800b001dd7d6ade4fmr939106plg.2.1710263018703;
        Tue, 12 Mar 2024 10:03:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k17-20020a170902c41100b001d9edac54b1sm6398555plk.171.2024.03.12.10.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:38 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Subject: [PATCH 11/14] s390: Add support for suppressing warning backtraces
Date: Tue, 12 Mar 2024 10:03:06 -0700
Message-Id: <20240312170309.2546362-12-linux@roeck-us.net>
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

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/s390/include/asm/bug.h | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
index aebe1e22c7be..01e2aa4069d7 100644
--- a/arch/s390/include/asm/bug.h
+++ b/arch/s390/include/asm/bug.h
@@ -8,19 +8,30 @@
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
+#if IS_ENABLED(CONFIG_KUNIT)
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"	.long	%0-.\n"
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC_PTR
+# define __BUG_FUNC	NULL
+#endif /* IS_ENABLED(CONFIG_KUNIT) */
+
 #define __EMIT_BUG(x) do {					\
 	asm_inline volatile(					\
 		"0:	mc	0,0\n"				\
 		".section .rodata.str,\"aMS\",@progbits,1\n"	\
 		"1:	.asciz	\""__FILE__"\"\n"		\
 		".previous\n"					\
-		".section __bug_table,\"awM\",@progbits,%2\n"	\
+		".section __bug_table,\"awM\",@progbits,%3\n"	\
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

