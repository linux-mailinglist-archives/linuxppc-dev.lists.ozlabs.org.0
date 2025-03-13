Return-Path: <linuxppc-dev+bounces-7000-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C240A601D4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 21:02:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDJLR3DKmz3cWp;
	Fri, 14 Mar 2025 07:02:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741866307;
	cv=none; b=NLe1h4PeZjgrhNBFL7UylAywruUKCBq1dFxx3GJS5JflDccDGPzkZ5+4RVOg7sOHRaPRyto7PG+rpv1958alGAfm3hzjZ2tmk7m6fWgaXxLvBQ0PVJfPzlWHoLld4jT5GbOCeS5JlAIziX2I5NDbbn29/leuj6+FfqUDhGeqtwCL8pn1RyBlcF5e6SpXF8vw+TwwCHoYdUtMmHOWe4m8+Gw7ZgTtse6cXCRNZKW0v8mVEvIRRChj2Zv6mlFx11UlvBgBvycdb1NtqZH5GtE/QGcbB2g5OCTPon/DFdwrK5ozBEaDcACsleQ4Nsrs/3TttETwWbM0MLz94PzgsR9FkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741866307; c=relaxed/relaxed;
	bh=BMlGspdrpbJ31u0fCjYvjyAZlqg7W4BaKawB7P7nRsE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-type; b=XZchrt4gV2euS/Bq9pubeJ0pRh2KPCkxt0sUL1I71oykMvzkHlO+H2a283ORbSFJX8UqRpccVDqw2cfYDWuO3XArw/QQDebzLhnYFdnunxTHarC0rHpLbAAddWE+bTEWptLYKGhYucjti0eFaw0990HEYWD+ppQJXEJlvUTPxgDlPTF6hsEY9Gp6JxHOAZAPZSmssEqPMOvYeRx5ZZMe4l6JebOb8O4TmRQ5cqz2iLBdHZXq4EFlRIczCXLicynHeoGwxclC4XsTT9utbCZVRtxmxtTf4yo2wQRWhdc6zBIM8BSbTOUfGlgQs871u1YqAE3HHrEO2IHL7QB4Z2i0PQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OJlb6PYS; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OJlb6PYS; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=acarmina@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OJlb6PYS;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OJlb6PYS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=acarmina@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD5Jy51R5z2ynL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 22:45:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BMlGspdrpbJ31u0fCjYvjyAZlqg7W4BaKawB7P7nRsE=;
	b=OJlb6PYSxU9LbRORvVFk3hARMTTdpBs0ZPWrPwKW8hyyzSPOyJq6iFqoxLwDG6yBP1H4gc
	wDsFcTJi/qt99ViNprq3/5Qs3UPvvL04hGFXr7jAJSMi1v6jWDZZKQBRlMXllEToALFhNy
	U1vSlKptOzh7ThtJfhz4tJHzqg3T+B4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BMlGspdrpbJ31u0fCjYvjyAZlqg7W4BaKawB7P7nRsE=;
	b=OJlb6PYSxU9LbRORvVFk3hARMTTdpBs0ZPWrPwKW8hyyzSPOyJq6iFqoxLwDG6yBP1H4gc
	wDsFcTJi/qt99ViNprq3/5Qs3UPvvL04hGFXr7jAJSMi1v6jWDZZKQBRlMXllEToALFhNy
	U1vSlKptOzh7ThtJfhz4tJHzqg3T+B4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-l3NAsdMiOCiEwgn9QEK8SQ-1; Thu, 13 Mar 2025 07:45:01 -0400
X-MC-Unique: l3NAsdMiOCiEwgn9QEK8SQ-1
X-Mimecast-MFC-AGG-ID: l3NAsdMiOCiEwgn9QEK8SQ_1741866300
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so6439385e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 04:45:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866300; x=1742471100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMlGspdrpbJ31u0fCjYvjyAZlqg7W4BaKawB7P7nRsE=;
        b=KScNBbRgHwHqdoeYHbxWHObq58sJYtrECE+Mvm3KZ0KIw4o7dS4it4LoAhZgP0j7iW
         T22F0dZsF/VYlCZM5bSVTAmGNA4GBXip9dzMXy3N89ePzVNPz6PA8hMcTswxIxSioVKU
         /rLPEqBvIzWDjQrUA0hhKzv+xjn4IBRU9Y22NVdvKWuwhw1EEbsIKcxpo/cGMNCrruNW
         w0rh5C/78Kz2AwzHAIm5uVdUkp3L620YZ6pjA57QKv6AFjKKAlfM7sIciUJVOsGivaSu
         NA1Cz93HYBILE8htMDhRfUwd430o/tDU96Gcmj/sMb/yMqWgmvYCsJg4MzphI3j/LMOG
         q7IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiMfgnobZoSlgA2enAzTHZns8MK5So85DHPJ7M72cjSUWwkylPh06O9Ypb1FGQmOSlqO1f1Rtj+RvCw50=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwPwVxCIqQ3JyxT+1EY5doKvPHrKQdQDpecFRRCOZ+BNpSspRYo
	GIjtv8njIUYXnBa1dtalNdwBEHhYBAGWD599j1NwjUk+htICWDjiPw7At5MusnkXINxyMAWTEHD
	K4JVyB+uX4RANjTOFuWHAlvdWaaEaKaE5KAbmLOiIBRsNZNd/Nu6SZCVLY5hhCRQ=
X-Gm-Gg: ASbGnct9XKKyY9ILLIbC3LynXKSk6EXTJaPqKGbUodST8lT6VAQqT0ysp40qQHUuPxc
	AIrzwSSCm+n/VR3F14Y+9Id1GDniH2K2HWaKX0ssrWn5/v3oItmaKTlGq5KjdzF7HC4EwKH44L5
	XNgCTNoZLO/aME2CEVoxlj1JuERgucC3/thr/mT0VjSGco4scjiQi4pfyVBWFNwU3W3jnxPySVi
	02tnpWWlROXHgCmoCQGVfq4UgfsyUnyg9S3Q2L/7PAs6bnfhuwFtd9IX8FSZWubOABAu90Rqmi3
	hcmmk6JC/6dmqtlUh0T9
X-Received: by 2002:a05:600c:470a:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-43cf44c76ccmr144326905e9.2.1741866300509;
        Thu, 13 Mar 2025 04:45:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERxTxm4YW1Ezaow82Z48NXt1aSx6Vv01Gh0iy7KljuVnLSLjwCs9KSAjTKcqnBX6jh4hKEWQ==
X-Received: by 2002:a05:600c:470a:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-43cf44c76ccmr144326735e9.2.1741866300120;
        Thu, 13 Mar 2025 04:45:00 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:59 -0700 (PDT)
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
	Michael Ellerman <mpe@ellerman.id.au>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 14/14] powerpc: Add support for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:29 +0000
Message-Id: <20250313114329.284104-15-acarmina@redhat.com>
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
X-Mimecast-MFC-PROC-ID: MK8gdCqST8y0fF6GaWOF7f4v1uVklo-VDScd3Xgxj1E_1741866300
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
Cc: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 arch/powerpc/include/asm/bug.h | 37 +++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 1db485aacbd9..5b06745d20aa 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -14,6 +14,9 @@
 	 .section __bug_table,"aw"
 5001:	 .4byte \addr - .
 	 .4byte 5002f - .
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+	 .4byte 0
+#endif
 	 .short \line, \flags
 	 .org 5001b+BUG_ENTRY_SIZE
 	 .previous
@@ -32,30 +35,46 @@
 #endif /* verbose */
 
 #else /* !__ASSEMBLY__ */
-/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
-   sizeof(struct bug_entry), respectively */
+/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3,%4 to be FILE, __func__, LINE, flags
+   and sizeof(struct bug_entry), respectively */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"	.4byte %1 - .\n"
+#else
+# define __BUG_FUNC_PTR
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
 #define _EMIT_BUG_ENTRY				\
 	".section __bug_table,\"aw\"\n"		\
 	"2:	.4byte 1b - .\n"		\
 	"	.4byte %0 - .\n"		\
-	"	.short %1, %2\n"		\
-	".org 2b+%3\n"				\
+	__BUG_FUNC_PTR				\
+	"	.short %2, %3\n"		\
+	".org 2b+%4\n"				\
 	".previous\n"
 #else
 #define _EMIT_BUG_ENTRY				\
 	".section __bug_table,\"aw\"\n"		\
 	"2:	.4byte 1b - .\n"		\
-	"	.short %2\n"			\
-	".org 2b+%3\n"				\
+	"	.short %3\n"			\
+	".org 2b+%4\n"				\
 	".previous\n"
 #endif
 
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC	NULL
+#endif
+
 #define BUG_ENTRY(insn, flags, ...)			\
 	__asm__ __volatile__(				\
 		"1:	" insn "\n"			\
 		_EMIT_BUG_ENTRY				\
-		: : "i" (__FILE__), "i" (__LINE__),	\
+		: : "i" (__FILE__), "i" (__BUG_FUNC),	\
+		  "i" (__LINE__),			\
 		  "i" (flags),				\
 		  "i" (sizeof(struct bug_entry)),	\
 		  ##__VA_ARGS__)
@@ -80,7 +99,7 @@
 		if (x)						\
 			BUG();					\
 	} else {						\
-		BUG_ENTRY(PPC_TLNEI " %4, 0", 0, "r" ((__force long)(x)));	\
+		BUG_ENTRY(PPC_TLNEI " %5, 0", 0, "r" ((__force long)(x)));	\
 	}							\
 } while (0)
 
@@ -90,7 +109,7 @@
 		if (__ret_warn_on)				\
 			__WARN();				\
 	} else {						\
-		BUG_ENTRY(PPC_TLNEI " %4, 0",			\
+		BUG_ENTRY(PPC_TLNEI " %5, 0",			\
 			  BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),	\
 			  "r" (__ret_warn_on));	\
 	}							\
-- 
2.34.1


