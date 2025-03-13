Return-Path: <linuxppc-dev+bounces-6989-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFA6A601BE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 21:00:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDJJy0mJTz3cCt;
	Fri, 14 Mar 2025 07:00:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741866280;
	cv=none; b=mJO7nkRh0xBhCplUDZaWZxxYKvQIruAg1hd8gR2yZ/4UzFamiXG7mFTJOVuRIS9RImeV+wgkpRHk+Crevo+O4HQUX/3Z/T61IQioX85P7+Bk5G5MfL4H9GOp3QCfAwFeCqqf7eWjYAgeoGnZw0Y3c0XgBpY7ZZQHN+gT0WXN2V0DSws3EktzTgp6xMuDhslmSVO1q+6ipAzdBIcNDU5iz5b5+SjDDXQrTBVi5bHzWjwq36iZxNkhkgf1Fg2ncvJHt7g+8nQfbrcWpIOrDoO9+xPrKMLTIxeoj9/fm1tGkYDy9BO0mKUba5O0sqxehym+H1aGA9TVkpoTStW1CuQgbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741866280; c=relaxed/relaxed;
	bh=UxCl1osfLw2v3G3W+1kfNU8xiBvtJTPCZorcBEjeG40=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-type; b=cUJO+LGCY7PpcTZEKVUnFh4iuTo5jNf8XNNewyRiJw9xUKsU5CZ8CTVx8gAY/0/Zx/GdztexnX2UwuUHgadGTCcEACVRsduiXdIdz19+gvZdNNWFthvWwQWPdyJsqKTL49ZD2hp1Pmu/cYKt/3HNFs2Q/xzFyBTCgw4Cd80fVQaUbmNm0dQTgcANxIwWV5i76HmRbZoZcElu9XBeNl6TBxG3epeofmpCeg2+pRnISLoN9gIl9RrB9rUgqq3uD3ujYFHDCOM6MNQUFtKy8xhbey8eZwcYQimOJSZljKagMxdogWQkKdJUTgWtsz40GqoXdEh8u6y9kClFhSpBMhN8dg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CCQVbTGs; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i1XiBCrS; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=acarmina@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CCQVbTGs;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i1XiBCrS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=acarmina@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD5JR04Cbz30Tp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 22:44:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UxCl1osfLw2v3G3W+1kfNU8xiBvtJTPCZorcBEjeG40=;
	b=CCQVbTGsElo+FrpACDCzj77GBSib9QqOEdmN3S2lVhbzeXqX4lA0kpKIvWvcTs8Q81IVcT
	WLPDEaFL/hw2ZKLRfnIlzf4Ku9Jp9JzeeqKdJmgtbsqqVTgf+vBwPZGcfp21VDEkSZRs1K
	xaWbv14lXF6seIsckbhJY8xDoga2dmk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UxCl1osfLw2v3G3W+1kfNU8xiBvtJTPCZorcBEjeG40=;
	b=i1XiBCrSF+9v2m6bPObCTrnvcNAnDgO5kEE1zMt1utiI0LpgrASITr7jbg9qG5sUCUHbgv
	40mtgZ/l3Kn37w+k5FntsbwoPAbLS778n0o3XZTL6fbH+0rb66j++/9sNOfxNM2ZoYRPti
	Px/yE3PrYMCXiUgZS76rONl/IlieYbg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-DHP8-KScPZKRK4SoTlL9Rg-1; Thu, 13 Mar 2025 07:44:34 -0400
X-MC-Unique: DHP8-KScPZKRK4SoTlL9Rg-1
X-Mimecast-MFC-AGG-ID: DHP8-KScPZKRK4SoTlL9Rg_1741866273
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso4355605e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 04:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866273; x=1742471073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UxCl1osfLw2v3G3W+1kfNU8xiBvtJTPCZorcBEjeG40=;
        b=OmwcKMXRo7Hy5Lf0kV33B3xvMHv7pEURW25b89luXkZf126kOyGywDGW6yweaKiLLP
         lf2zmroeY5FIoHMeS+112f6in6j2bjPqP/LEmsNWxOWh94yfHBe8U3HlcT5LWn/s3xI0
         wJIvpM0aQK45ibolAP8J0OcNdK60jQx55WwKUYzlbKc4QNDWU30X6qZ71+6Fbe10RbOD
         8rXEaz8Y8k9frDl+xTKNhjzwLLvnZ9PSwEWrTtxi/eXQefa7uiJtiemZCKDIwcMOD+Mb
         +GCgkxBoFIRgiQfHgi5QGN/azwOE4199S8sUzs6FIgFNU9+EwgtyLn9xvZQr2JciW9z5
         0oxA==
X-Forwarded-Encrypted: i=1; AJvYcCXKjj8SJSRkkQsmmeRhDCnfJQt7uPh5w+7RNK3TRmFxP/NecxeVjnfwfgogOcWgBKuB/0tVCvMALmHUO6M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwDLn4G4F5JyWtrZWdeAGK8QRewlCphJdr32b08ogOCe1zB6Hbw
	Pydkm6jk1vo1ybsMQhjRMxMwvgqFuc6Tbmbh4sE1vv7A3nBx1JxcDdKW8AaW0TtI1/uSnkIPevZ
	29TCZVS/H3G56V1v/wm0uFqOJZPu22UkWHvEUZuwRMbOGXM/nRAHC4JmkDcs9at0=
X-Gm-Gg: ASbGncvb1/Xy3mpvX2pzpWWOGhfnTHUj+tAS5h5bwmlKX1BKmY7IzbO4jdkmLRuNAJp
	WehN5lckIxp2xnuGefae3m8xI0AoHcpl7/CGiW2n8yZX+yxlx09pMqWr8RWW1odU1TyU291H+Vw
	05E02VGRuDYKGaFzOcmA45HMARSGVx+X4fefLRQnBjfhl6mGu7Mo+mMTnlKmjk6ACRZTbliUyJv
	wQ9la+h4TNEMnP2LR35eWURXXIrRVzSCgN5Mq0JWiqp8AoHMRwzAv5ypc5ODpVC9bLngkGh6Nfj
	NJ7w7pGKMlbUje7ZT9DE
X-Received: by 2002:a05:600c:190c:b0:43c:ea40:ae4a with SMTP id 5b1f17b1804b1-43cea40af7amr174500795e9.31.1741866273499;
        Thu, 13 Mar 2025 04:44:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs6EAEForVjkecQAM8kbehVzhKfM/0tK/SxXfrbXe4b06Gjm7InnzRnhjTKgVzk9sVgzkBAA==
X-Received: by 2002:a05:600c:190c:b0:43c:ea40:ae4a with SMTP id 5b1f17b1804b1-43cea40af7amr174500265e9.31.1741866273039;
        Thu, 13 Mar 2025 04:44:33 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:32 -0700 (PDT)
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
Subject: [PATCH v4 02/14] kunit: bug: Count suppressed warning backtraces
Date: Thu, 13 Mar 2025 11:43:17 +0000
Message-Id: <20250313114329.284104-3-acarmina@redhat.com>
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
X-Mimecast-MFC-PROC-ID: RGqOoj6obodIOD1ok20v2-n6njeQaFXt9YgATG6cFr0_1741866273
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Guenter Roeck <linux@roeck-us.net>

Count suppressed warning backtraces to enable code which suppresses
warning backtraces to check if the expected backtrace(s) have been
observed.

Using atomics for the backtrace count resulted in build errors on some
architectures due to include file recursion, so use a plain integer
for now.

Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 include/kunit/bug.h | 7 ++++++-
 lib/kunit/bug.c     | 4 +++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/kunit/bug.h b/include/kunit/bug.h
index 0a8e62c1fcaf..44efa7d5c902 100644
--- a/include/kunit/bug.h
+++ b/include/kunit/bug.h
@@ -20,6 +20,7 @@
 struct __suppressed_warning {
 	struct list_head node;
 	const char *function;
+	int counter;
 };
 
 void __kunit_start_suppress_warning(struct __suppressed_warning *warning);
@@ -28,7 +29,7 @@ bool __kunit_is_suppressed_warning(const char *function);
 
 #define DEFINE_SUPPRESSED_WARNING(func)	\
 	struct __suppressed_warning __kunit_suppress_##func = \
-		{ .function = __stringify(func) }
+		{ .function = __stringify(func), .counter = 0 }
 
 #define KUNIT_START_SUPPRESSED_WARNING(func) \
 	__kunit_start_suppress_warning(&__kunit_suppress_##func)
@@ -39,12 +40,16 @@ bool __kunit_is_suppressed_warning(const char *function);
 #define KUNIT_IS_SUPPRESSED_WARNING(func) \
 	__kunit_is_suppressed_warning(func)
 
+#define SUPPRESSED_WARNING_COUNT(func) \
+	(__kunit_suppress_##func.counter)
+
 #else /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
 
 #define DEFINE_SUPPRESSED_WARNING(func)
 #define KUNIT_START_SUPPRESSED_WARNING(func)
 #define KUNIT_END_SUPPRESSED_WARNING(func)
 #define KUNIT_IS_SUPPRESSED_WARNING(func) (false)
+#define SUPPRESSED_WARNING_COUNT(func) (0)
 
 #endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
 #endif /* __ASSEMBLY__ */
diff --git a/lib/kunit/bug.c b/lib/kunit/bug.c
index 351f9a595a71..84c05b1a9e8b 100644
--- a/lib/kunit/bug.c
+++ b/lib/kunit/bug.c
@@ -32,8 +32,10 @@ bool __kunit_is_suppressed_warning(const char *function)
 		return false;
 
 	list_for_each_entry(warning, &suppressed_warnings, node) {
-		if (!strcmp(function, warning->function))
+		if (!strcmp(function, warning->function)) {
+			warning->counter++;
 			return true;
+		}
 	}
 	return false;
 }
-- 
2.34.1


