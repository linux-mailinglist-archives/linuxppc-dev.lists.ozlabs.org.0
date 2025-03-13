Return-Path: <linuxppc-dev+bounces-6991-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2483A601C3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 21:01:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDJKG3yhNz3c9D;
	Fri, 14 Mar 2025 07:01:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741866283;
	cv=none; b=IUMC+6IpXMAWoQM6OqPJLxtx3dEupafD1kVbUMT0SG63DrP/orupUCxuITGUYi1Emp0dldvasdzGiXOMaLb2zC7TJHn2PCKylTsPyDs8HsO4MS/Il2v8CRFJWgAY/pu21xA9PJcfYE/JvfNCw7knFotW9s2WlER4xYgQUWU/KMR6BhHvUbWmEKq1fu+l7/5ybLNmew+mmGRDOM3UWLEDjHuTY/ypbII+FBtfDLDt5w1+k6vHVEJSAwSNEsBEE5HWNhlAPMmdk1fRTMkLCIFiU0HHBu55iU5ZeAJnZafLt8KBAGBk181TVocWnYId59kKUugwWY3jAO2lbw43pfYhNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741866283; c=relaxed/relaxed;
	bh=piebsVU5QZFL/FeYXj8vMs1AI4HP2ZYK+Wi3o0pUrOA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-type; b=VPxQaZAnY3wbzxu6FWIbPi3sb5atbOgJo/5v1rQ4ejlw1eq38FrBEAlW0ojo1bLQkqkNkJ5xxmNsezupUAtzV3E5T/iEuiRQukJBQ9/WESQp0VQRQdHNUEiOy2WGwX+98SgVKruV1JI3FHJHLFlYtyK2KaDJ/cFSC6qijVjt0HJw6jEE5iZuuSTGZYCLM4UmriJrVnfJGlgS8Df+c5y6bSIXOqprlqs+JzqY3CZRGCs1DMAESVxxNwmdWH8OpysLbigR9b/qN3+9zOVf7j0tG6bAssRMgDgrQIEhXptaqlhZoEN3qivJ47q78K5A1m2h9u7rShv62ZFO3xutOUxIhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dDT8Ld3i; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dDT8Ld3i; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=acarmina@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dDT8Ld3i;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dDT8Ld3i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=acarmina@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD5JW0Dtqz2ynL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 22:44:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=piebsVU5QZFL/FeYXj8vMs1AI4HP2ZYK+Wi3o0pUrOA=;
	b=dDT8Ld3iMDbNLuPtKnwtwxnk1TH7HtnkGAXjEqLyEFPK4LmprwWoFs2HMl3iFWS/OzYfZy
	1KoI4jEU/cc6j4SlnWN7bldVylm68N2CsIW9kLnt+jVvPKmxLdv1Opp/oBmmeU9nRj5h2/
	yv4gscgc9EPIoUYRBU0w/db5+FyLpMw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=piebsVU5QZFL/FeYXj8vMs1AI4HP2ZYK+Wi3o0pUrOA=;
	b=dDT8Ld3iMDbNLuPtKnwtwxnk1TH7HtnkGAXjEqLyEFPK4LmprwWoFs2HMl3iFWS/OzYfZy
	1KoI4jEU/cc6j4SlnWN7bldVylm68N2CsIW9kLnt+jVvPKmxLdv1Opp/oBmmeU9nRj5h2/
	yv4gscgc9EPIoUYRBU0w/db5+FyLpMw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-kHJnM5rWPhC9-DE0Eem1hA-1; Thu, 13 Mar 2025 07:44:39 -0400
X-MC-Unique: kHJnM5rWPhC9-DE0Eem1hA-1
X-Mimecast-MFC-AGG-ID: kHJnM5rWPhC9-DE0Eem1hA_1741866278
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3913f97d115so435690f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 04:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866278; x=1742471078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=piebsVU5QZFL/FeYXj8vMs1AI4HP2ZYK+Wi3o0pUrOA=;
        b=ZBhLEVW/6hulNlgYbNDyyOPRNNFOo1fPvbq+aoPubX0N3q12/Q74pOc1/N7Kn0bB4s
         HAVbkTLMv5dvSSNm2PiCELP7NrVqpONXTgeyXQhG1xLAH2Y5hTLU7PTWYam0vkPp8dJK
         sV7oSTELSvI9o6fFn3ZQJC8I0rAM6L1Wkj4j87aTreA8n7bshxsoi+CFbzU/TTjcleYm
         S43PeB/5yJxThHBtO8l4lfrW0ZeX3TgGn21lHq7x/9j92V3HzgShLs6wZ8OlHeHVAT/M
         Vbwtq5ewUoj3XHJsKej2HuMGEGwm4+QYOAlgokOPEjsuKluKQGtxgmwqv+5z+dIoKjse
         F/pg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ75pyWdaD3EZpcyuunr6VIwbaPS5zqr6GqFnVFTSiAlCeC0WukQv71ZXWT96Jk14gCTBAQpqsQuqN/Ig=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzSAoEqe1b+je3NdGjGZh8M9EilSSkPP2BkXV5bSC2JOY8FQaPS
	Odv21tJsT31Na9GIOL+eLVhcAqcKAtuXMEL8xdSvv1qZYIaTKgzOBx4DT/TQzt7iYsTuttruz+s
	N4IzzWWZCnayld+ofjkwCD2SSx8bLS+XYo0M/jL9oENXIGgN91UsuVrkHnBsJwYw=
X-Gm-Gg: ASbGncslD04fD++Oa9RrxQU3INMq0Aa0g85sE7aasvPBw+Uo2O1ghlZrGtlx7ASk3R/
	IMT3Cr/i6p+Z5ImBCbwrHrHSUxN5oOqNqi5v0o7UhpPL1feHBNGrFofpHbUXYmEYT2T5GweDAxb
	9oK2z4C/6GOQzIfHVudC6uZmiK1XC8TI833Y9X4pYawOBoPJto+5qbpCebSkhOlLZlJR7lb2Umq
	lwpuFsqUFYhVc6afc1hCr+EUqnou46Y6EKnRkZADQE53D1OYuTNSx7K87Y64VNqpE1y0Akg0fHp
	5aN7YOsg+WwD3erEKpaK
X-Received: by 2002:a05:6000:1fa9:b0:390:f025:9e85 with SMTP id ffacd0b85a97d-395b954eeeamr1447649f8f.21.1741866277769;
        Thu, 13 Mar 2025 04:44:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPsIsJrLJpu/wcDWacnMw+4SNJEtb8GetI5Mzi5kv4VuMQGkXurfVfuA8bqNlB7JY189Yj3A==
X-Received: by 2002:a05:6000:1fa9:b0:390:f025:9e85 with SMTP id ffacd0b85a97d-395b954eeeamr1447604f8f.21.1741866277398;
        Thu, 13 Mar 2025 04:44:37 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:36 -0700 (PDT)
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
Subject: [PATCH v4 04/14] kunit: Add documentation for warning backtrace suppression API
Date: Thu, 13 Mar 2025 11:43:19 +0000
Message-Id: <20250313114329.284104-5-acarmina@redhat.com>
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
X-Mimecast-MFC-PROC-ID: _IVpqZujniEl9rw1JE2jEuxF-Zxvt257IS7U_xgTIjI_1741866278
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Guenter Roeck <linux@roeck-us.net>

Document API functions for suppressing warning backtraces.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 Documentation/dev-tools/kunit/usage.rst | 30 ++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
index 22955d56b379..b2f1e56d53b4 100644
--- a/Documentation/dev-tools/kunit/usage.rst
+++ b/Documentation/dev-tools/kunit/usage.rst
@@ -157,6 +157,34 @@ Alternatively, one can take full control over the error message by using
 	if (some_setup_function())
 		KUNIT_FAIL(test, "Failed to setup thing for testing");
 
+Suppressing warning backtraces
+------------------------------
+
+Some unit tests trigger warning backtraces either intentionally or as side
+effect. Such backtraces are normally undesirable since they distract from
+the actual test and may result in the impression that there is a problem.
+
+Such backtraces can be suppressed. To suppress a backtrace in some_function(),
+use the following code.
+
+.. code-block:: c
+
+	static void some_test(struct kunit *test)
+	{
+		DEFINE_SUPPRESSED_WARNING(some_function);
+
+		KUNIT_START_SUPPRESSED_WARNING(some_function);
+		trigger_backtrace();
+		KUNIT_END_SUPPRESSED_WARNING(some_function);
+	}
+
+SUPPRESSED_WARNING_COUNT() returns the number of suppressed backtraces. If the
+suppressed backtrace was triggered on purpose, this can be used to check if
+the backtrace was actually triggered.
+
+.. code-block:: c
+
+	KUNIT_EXPECT_EQ(test, SUPPRESSED_WARNING_COUNT(some_function), 1);
 
 Test Suites
 ~~~~~~~~~~~
@@ -857,4 +885,4 @@ For example:
 		dev_managed_string = devm_kstrdup(fake_device, "Hello, World!");
 
 		// Everything is cleaned up automatically when the test ends.
-	}
\ No newline at end of file
+	}
-- 
2.34.1


