Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C83879A68
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 18:12:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M09eGzTj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvKvn60Wpz3vtq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 04:12:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M09eGzTj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvKjW501Yz3dW1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 04:03:43 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6e6adf257fdso573974b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 10:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263021; x=1710867821; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXPfnReuSHXGXOVrQxZxvKsOYxRmb4ItarTkuVBwfPs=;
        b=M09eGzTjd7aLdmjoVTsW6uW46zJ4r/OJa+VoljirTbvz8/VHSgvcEkBOh3GuI9tu2c
         q/1DriJJ4Qn9T3CYJaF1T4JBughNtoLP3Fj9wEcjttre8bnNjivlvFLbs7d2K8sLy7rr
         6t4MHl9lZ+CZl0hC/RGQMHNc7hhZfm+7hqdxg5Or2EeOhUQEWvWUrbd/08vvgwO3RDcM
         nGoz7ymIBDQx7SfXnN4Tx0aX8KpS7FQFsC5W2746b9n5+2jsmjH/jxGlz7nHK8xxLv0X
         hn9HMlnrdJves0GXkjXgP9JTSxRkrJVmWVaKTJrTe0y/5wR70oPOoVkcxf6t6DhU2yTP
         rQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263021; x=1710867821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bXPfnReuSHXGXOVrQxZxvKsOYxRmb4ItarTkuVBwfPs=;
        b=GsvBuSOzVBk0+z+J+BgYl9N37qOr3lxH5kPfNySk4YksPJurjMnhtJiEBC6vfI6S+W
         BrQyaFaO8b5s5E74MDDztvAq3ygXTmOAECizVDzNrdnxoO4/Q3HJB/5BKVZHLi04mIPa
         ld/8mP0G+GqHdpf4usU5nCbnA+vNGz1wpu76o7nwZaQ3Es76xD/S5r0DhQNrhfcMmMis
         gPdC4YC/MW5qXgF0usy3hI31C8yVMAgmxZLPF4OS3+VjSvzaQAn3yZBv5E1gXg4gKM2W
         9iF/zWWgG2OXSiA5TUYi6/QOuQaZdUs0KGw7PCJ32tXNu/N6u1WEpBbKU2dv9NcCU8Oo
         P4jg==
X-Forwarded-Encrypted: i=1; AJvYcCUCIOilztc71EvOWVtXvNwFMaPuRGQaT6STqLBAZ1BJEg6PPDfdrCau6Hyq7qBsailQi2jIk8OfHsWU8C61yOE3vPBpEgHTmpv3efVd3Q==
X-Gm-Message-State: AOJu0YygQObMn/0sm0NKG+i9B8UhkDarJFUKhkn5YWv/cUHXMzehuUix
	1Wjuje9izSMorp1JpZTNaYoW3hV2f4obQ3M7hF/yfAdXkT/OdIC8
X-Google-Smtp-Source: AGHT+IE4fVqqJ6hNP2W9YJrC0c7a73CCPEj82DwWsP9/bD/wztKwzROAlQDxzJc7BU6W2bM1RSgz/A==
X-Received: by 2002:a05:6a20:9f06:b0:1a2:ba3f:e530 with SMTP id mk6-20020a056a209f0600b001a2ba3fe530mr11544554pzb.50.1710263020818;
        Tue, 12 Mar 2024 10:03:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g1-20020a056a000b8100b006e674ef94b2sm1453577pfj.159.2024.03.12.10.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:40 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Subject: [PATCH 12/14] sh: Add support for suppressing warning backtraces
Date: Tue, 12 Mar 2024 10:03:07 -0700
Message-Id: <20240312170309.2546362-13-linux@roeck-us.net>
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
 arch/sh/include/asm/bug.h | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/sh/include/asm/bug.h b/arch/sh/include/asm/bug.h
index 05a485c4fabc..cadc335eb759 100644
--- a/arch/sh/include/asm/bug.h
+++ b/arch/sh/include/asm/bug.h
@@ -24,21 +24,36 @@
  * The offending file and line are encoded in the __bug_table section.
  */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+
+#if IS_ENABLED(CONFIG_KUNIT)
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"\t.long %O2\n"
+#else
+# define __BUG_FUNC_PTR
+#endif /* IS_ENABLED(CONFIG_KUNIT) */
+
 #define _EMIT_BUG_ENTRY				\
 	"\t.pushsection __bug_table,\"aw\"\n"	\
 	"2:\t.long 1b, %O1\n"			\
-	"\t.short %O2, %O3\n"			\
-	"\t.org 2b+%O4\n"			\
+	__BUG_FUNC_PTR				\
+	"\t.short %O3, %O4\n"			\
+	"\t.org 2b+%O5\n"			\
 	"\t.popsection\n"
 #else
 #define _EMIT_BUG_ENTRY				\
 	"\t.pushsection __bug_table,\"aw\"\n"	\
 	"2:\t.long 1b\n"			\
-	"\t.short %O3\n"			\
-	"\t.org 2b+%O4\n"			\
+	"\t.short %O4\n"			\
+	"\t.org 2b+%O5\n"			\
 	"\t.popsection\n"
 #endif
 
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC	NULL
+#endif
+
 #define BUG()						\
 do {							\
 	__asm__ __volatile__ (				\
@@ -47,6 +62,7 @@ do {							\
 		 :					\
 		 : "n" (TRAPA_BUG_OPCODE),		\
 		   "i" (__FILE__),			\
+		   "i" (__BUG_FUNC),			\
 		   "i" (__LINE__), "i" (0),		\
 		   "i" (sizeof(struct bug_entry)));	\
 	unreachable();					\
@@ -60,6 +76,7 @@ do {							\
 		 :					\
 		 : "n" (TRAPA_BUG_OPCODE),		\
 		   "i" (__FILE__),			\
+		   "i" (__BUG_FUNC),			\
 		   "i" (__LINE__),			\
 		   "i" (BUGFLAG_WARNING|(flags)),	\
 		   "i" (sizeof(struct bug_entry)));	\
@@ -85,6 +102,7 @@ do {							\
 		 :					\
 		 : "n" (TRAPA_BUG_OPCODE),		\
 		   "i" (__FILE__),			\
+		   "i" (__BUG_FUNC),			\
 		   "i" (__LINE__),			\
 		   "i" (BUGFLAG_UNWINDER),		\
 		   "i" (sizeof(struct bug_entry)));	\
-- 
2.39.2

