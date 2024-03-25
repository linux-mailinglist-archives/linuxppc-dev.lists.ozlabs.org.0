Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E8A88ACD4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 19:01:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OkL1+5fm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3LN03Yczz3wCW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 05:01:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OkL1+5fm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2b; helo=mail-oo1-xc2b.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3LBh33kFz3ccV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 04:53:16 +1100 (AEDT)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5a51c063f99so1241674eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 10:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389193; x=1711993993; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ND8lqpveiFX6xmjgwVdwzXmzEkzcSSVNG8THPWMqf7Y=;
        b=OkL1+5fm9c46WDA+FgG4HxJIMc4q29vNrZeRbok9x5KulAXzNdY7gb3M05puavkVxq
         V9jfNi9Vi4c1Ehzl+5s+WDQedPMH4LTRS6RIj/gXEBfvFJ2i66VCD6cFfyeobKiGnOpF
         PZUMWwpszQ7JuRo5KH/kWK5JgRUsXQDgRGbi8U9ueGG0OKFgo3eidf58jDRJEbRossEz
         ld+sJ4xMfTsbR4GOXil5Yq0FBuDv4Bjifl1HKpwThH6eG+07R1X9aLrR3d42RmcIHQUs
         y91k+ueMSSPcMtsz+/PMX3Yk5SUUW3lBlwtzYSBLPadvZ/ifZHw3+gYM0b2QAtEf9rEW
         BhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389193; x=1711993993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ND8lqpveiFX6xmjgwVdwzXmzEkzcSSVNG8THPWMqf7Y=;
        b=uDVtJ7Vd3Uy0k5nRewLguj7/icCYXvb7WIzezmhTyIU5jkkffYq0wDUICP0uT+zHEA
         k9VpDtocHDSSUkTp/G4+3mmqJcEmhVCV643F+b4riTdxytV3qXzafdozbW+7UNEVYDp8
         SRnj4+qc2TH0TYOZsVdwcCzH+FvKoQ6sB/Hq6ZJG5cktXXzy/3e6luRq41XDLBXn6+VP
         XSg+BN/BTLatcXFZt0ZRbe2AsvfNH1hBNTuEIzFaTkz/0mqoDECxBseAlBeZDyLawW0K
         7Ke5/uDjXaD71vdeaadLV9++G/6ufnI0m/zIQV/ZptBSIk16nm6lycCiW3eewMiZkiUk
         kupg==
X-Forwarded-Encrypted: i=1; AJvYcCUo7OQp4LoxCB/DEDxhSGiltdM30iuV8HE4HRJigHDeBO/Z7poxXLUmBgVmbFJqi6oqg+iWOTHicf8Vla/Ny7/46oecn7li9ofwLjRpMQ==
X-Gm-Message-State: AOJu0YxWcklBYkxyZ6swEMVDwFYg/fOlIbiIQIdgbiSZ5oEzSBBMVqEL
	6fNF+r65GaON/0Rrv3uLkGh94WHBmgm2h2TRe96JlKoPD8VkcG6X
X-Google-Smtp-Source: AGHT+IGv1aIgA06o9Fu8TIRgx/HOB3QdMC5g6WhXly0xhlmCYycmN3i4bcD6kTp8Utc1wDwGC1lc7A==
X-Received: by 2002:a05:6358:fac6:b0:17f:729a:8562 with SMTP id ts6-20020a056358fac600b0017f729a8562mr2827009rwb.3.1711389192937;
        Mon, 25 Mar 2024 10:53:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w189-20020a6362c6000000b005e438ea2a5asm6051492pgb.53.2024.03.25.10.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:53:12 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Subject: [PATCH v2 11/14] s390: Add support for suppressing warning backtraces
Date: Mon, 25 Mar 2024 10:52:45 -0700
Message-Id: <20240325175248.1499046-12-linux@roeck-us.net>
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
increase due to unused __func__ entries (this is necessary because
__func__ is not a define but a virtual variable).

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
- Rebased to v6.9-rc1 (simplified assembler changes after upstream commit
  3938490e78f4 ("s390/bug: remove entry size from __bug_table section")
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option

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

