Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB6F8970FF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 15:29:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Zf8DkBqL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8lwG1xJwz3wFk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 00:29:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Zf8DkBqL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8ljL6K55z3w38
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 00:20:06 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1e0bfc42783so53741815ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Apr 2024 06:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712150404; x=1712755204; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cRPOdz6AnxublM7n3KmjYybYhLan42asyWOmMDzsw+o=;
        b=Zf8DkBqL284K2/FDG9NDNvAlyOSGb2cTugD4di9VVT2vr0sQjRjVOXNBwz9Cahhh4f
         Maes8URjvhrJZOSnia0XjzA0pBDDQQOGYddQUqLXWySqzlWrFhiOQFCBg1YRMkX/NggM
         ZHafJJvrA9UO5oTtmsmj/dNGmJG285PI15fl8b5rmj9mcowYWQyxP3OFiyYWRQ4V2KEu
         xAhGs2J6pWnGyOJyTFyg4yj4l+65dbqT1CgtAnTyGKLm8qdlh3X3HpThJ1g3R+2u/pCu
         EErFAlPQrthbDIDYNVQVggO01qGK749I6WTvpnOGZRd5PMKll0ONFSdj8SWYyiSyXdvw
         3Fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150404; x=1712755204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cRPOdz6AnxublM7n3KmjYybYhLan42asyWOmMDzsw+o=;
        b=UR5hiInGm5fzdtUbzoBE8P0q60nGYbdJmgLltQzxeyJOPqN2itbLvrlV2FBkHpEeb2
         T84+h9ML1EvwFobxdfGbadvXXdOtAvS6QoikrLlpHRCyX9e5YAh4xUrPWQ2tQNFphfvL
         o9SecFJMEX3HTG0n9w1eUv/W/U2LkYhXPlKaiFI0fTUwyLSbtG4WKi2ZxxRhWkIIV2Gk
         JWZa9Vk7tMDr4uH1v/KVN3WZotQla9OkHQlgHrD348NamwFSzKtf5aVHw2jlD1pyw2CQ
         iIn7bFvOuzO7SOm3L1tlD7iS9WBE20bmq+tElsB1sq6V8zvgxPE0jLer4e0Fh6gkfFuk
         W97Q==
X-Forwarded-Encrypted: i=1; AJvYcCX/5zBgtVZwBkNJn8nHbsvuZWdhk1wgbWpDPjSX/ooiaOcy1JE2b0nZeWS9Fie+H/OihajCW6NF3bq9ZAHa6t9jMX2Xwb+TaMlNTRViNA==
X-Gm-Message-State: AOJu0YyDFKHz6Sp0ZI1hbK6FdA26+IHskpKUPYzuf6b9skWf7vG6pGVh
	vHJPMvbj9lG+ABMHBvtB/MHQOLFpzWqmTTdeU1JIzpKvUGzcWjlg
X-Google-Smtp-Source: AGHT+IGx8oRVikcJmoZrmV6I1PpggSRavr/G5SNCkYR+IkJlaqrk2wHgg+ZazQ8Nymmw82Dh4v/u5A==
X-Received: by 2002:a17:903:32cc:b0:1e2:2d0c:fef0 with SMTP id i12-20020a17090332cc00b001e22d0cfef0mr17310539plr.48.1712150404272;
        Wed, 03 Apr 2024 06:20:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d5-20020a170903230500b001dd4d0082c8sm3855527plh.216.2024.04.03.06.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:20:03 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Subject: [PATCH v3 13/15] sh: Move defines needed for suppressing warning backtraces
Date: Wed,  3 Apr 2024 06:19:34 -0700
Message-Id: <20240403131936.787234-14-linux@roeck-us.net>
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, Rich Felker <dalias@libc.org>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Guenter Roeck <linux@roeck-us.net>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel
 @lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Declaring the defines needed for suppressing warning inside
'#ifdef CONFIG_DEBUG_BUGVERBOSE' results in a kerneldoc warning.

.../bug.h:29: warning: expecting prototype for _EMIT_BUG_ENTRY().
	Prototype was for HAVE_BUG_FUNCTION() instead

Move the defines above the kerneldoc entry for _EMIT_BUG_ENTRY
to make kerneldoc happy.

Reported-by: Simon Horman <horms@kernel.org>
Cc: Simon Horman <horms@kernel.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v3: Added patch. Possibly squash into previous patch.

 arch/sh/include/asm/bug.h | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/sh/include/asm/bug.h b/arch/sh/include/asm/bug.h
index 470ce6567d20..bf4947d51d69 100644
--- a/arch/sh/include/asm/bug.h
+++ b/arch/sh/include/asm/bug.h
@@ -11,6 +11,15 @@
 #define HAVE_ARCH_BUG
 #define HAVE_ARCH_WARN_ON
 
+#ifdef CONFIG_DEBUG_BUGVERBOSE
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"\t.long %O2\n"
+#else
+# define __BUG_FUNC_PTR
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+#endif /* CONFIG_DEBUG_BUGVERBOSE */
+
 /**
  * _EMIT_BUG_ENTRY
  * %1 - __FILE__
@@ -25,13 +34,6 @@
  */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
-#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
-# define HAVE_BUG_FUNCTION
-# define __BUG_FUNC_PTR	"\t.long %O2\n"
-#else
-# define __BUG_FUNC_PTR
-#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
-
 #define _EMIT_BUG_ENTRY				\
 	"\t.pushsection __bug_table,\"aw\"\n"	\
 	"2:\t.long 1b, %O1\n"			\
-- 
2.39.2

