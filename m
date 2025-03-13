Return-Path: <linuxppc-dev+bounces-6992-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D61A601C9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 21:01:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDJKP5QPKz3cTh;
	Fri, 14 Mar 2025 07:01:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741866286;
	cv=none; b=I7mYVm8tpA9wjtrjVyawbqIF1wP8NvC88wbTQMqcsRl/BoyHCBqxFa0GvUR7zznTiZwiPOoeHZytoQpOYoVZUyUCCRkJXBAvQGzHHzLTEOZmxq1jj9DpniRtH0qknjttSy8jzB6VQuXr5MdZYZaAQA4tCkbgs3kfBE7WHwmseZDaLZlre1cO+wsOpZ4nx4CFsG6Fw/siX4lrCRNuoKYddfxVW59LqZuUFEM+C4GY98W66dRMydAUabR2q+WmjV9mWEeoVAZj6Vp2xeKzRD7jUiiebqPs6IaTvNfGenSn1/JzeJL/25yNI7K8/3c6R4xpJKJqTt9GywuQuNOu9slBIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741866286; c=relaxed/relaxed;
	bh=a3r2g39Wllme+8/IppJMHdqpnHPlgxpExHUFAvvaA/g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-type; b=PwkTRhMBP23w/qLVPFRbFy5I1f7PZ3IIlAD3Kiv/a8s/CZmT+o+sOrcnf6eNtohP5ArIm9PDdUohs7ccF90LW6cAWkQzCq43wcVv6ooFLmu4OMxqOWWfMH58taRQBvG17uBCSao2nkJyyrNltDGB8WdMxC1XiCL6WFb5g0TuUdTJV1cqjaH0oUkALglmadNP7SX8xSKYdhR4vpl22tA7uEo+xQrSHApWZ5Gq0s95I/1/qAeSAnRJqcjU9QSObQwtePuWKmjFbXMNrmn24qhVMAQ/tnabyHthXHBMfO3DSWdvX50ajNaJLFvXlpWyhOBF2cBi4e38tBp5Q5EvgLINNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IpP9skhx; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IpP9skhx; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=acarmina@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IpP9skhx;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IpP9skhx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=acarmina@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD5JZ04PYz2ynL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 22:44:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a3r2g39Wllme+8/IppJMHdqpnHPlgxpExHUFAvvaA/g=;
	b=IpP9skhxfKngnuo2GwWIpIfANP5nPOOK+xJJomFK5S94mYbbeLow26QpjXGEPDu9y352dj
	VwYEvrfzN815nS19McmlxtVd67eWEmDWRTqCpAoVXjT+HlS2F+VDmsiqv0zv70anocDsqu
	mlEPXKFiJ/mTltAGw95+O2rkfMw37mc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a3r2g39Wllme+8/IppJMHdqpnHPlgxpExHUFAvvaA/g=;
	b=IpP9skhxfKngnuo2GwWIpIfANP5nPOOK+xJJomFK5S94mYbbeLow26QpjXGEPDu9y352dj
	VwYEvrfzN815nS19McmlxtVd67eWEmDWRTqCpAoVXjT+HlS2F+VDmsiqv0zv70anocDsqu
	mlEPXKFiJ/mTltAGw95+O2rkfMw37mc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-pKRya2HkN_uETq2WIubdGA-1; Thu, 13 Mar 2025 07:44:41 -0400
X-MC-Unique: pKRya2HkN_uETq2WIubdGA-1
X-Mimecast-MFC-AGG-ID: pKRya2HkN_uETq2WIubdGA_1741866280
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39149cbc77dso497395f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 04:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866280; x=1742471080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3r2g39Wllme+8/IppJMHdqpnHPlgxpExHUFAvvaA/g=;
        b=ZqIu6pacD3hqqKY9ugAbpmDj8iqhy63mkuCD7LGLc3sMe5dvBTQ9gg5lApgsMlI3+T
         N5PSSSUy6fr4VJ/V70/Rft5UKnL90D2beOx9BXGJnGpy4p/yEtAzQhPHPFyg1JRcpkjB
         X9hw0NZ0UkptVHDVjiI2zhvPRE9gUCPFfgczDKHLYCPbSLb12aDTkpx+eYuxFhv046xs
         wx2wsrci8T1UxGLOLIwf/jWZIf79QWGKaANhS5xFD0mO2DGMZ/ZO1x5Z66BUtOA0vGqy
         gMgvQtUSAzdyq/PpPKyor1cKi8DfGmKRdXQ5kGoZeDlcttW2XL44DODxNbXyoWGLaV/O
         W3aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuuMoal871STSXbTX8H5oKmBbnt8dHoEUh+Jo9NHZkgKzO/8KWvr8T0kLTEr6JEpO+fQ95/GTuyF7Sjnk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw16bDifnl4SqP+fXnnplaZ0iIg8xf7NljrPfmgWH2H3Hr3Ft7F
	vHLXXRgKz2uPA28ftxt4n3YGLscN9vYmBhdmWrej4Oh4XPpZowMs5jIEkyjfw+1AkNIHsNkcYl8
	N6jBLIJWrOtWWOE6gvr5xUC26xq9nfWJVMbbfyzM1A1D81nZYf6nN2ITAsCFyUjA=
X-Gm-Gg: ASbGncuwOWSjgrGORFeguZODk/DaOf6oRb2bOqWHLKIzAc94mfrHqI1BCO3Mz85DQmI
	8C1XELpaaMUG7d2Fr/8Y2RcbPnxN111exmx0irIahC94VRqXxmEeJE5hMBmYHmm4uPihETsusp9
	afzkjerrHffK1JNcGrp0DjEIPobwlYPJjgXYDVZlVLY61Igedz/xU+JYUJqzy7x/7JwW7+WH7KD
	8WfV9H3UkUn2z/4Dw/N0I1YA0mCjRowZEwsIbL8k9Eg+4h8nx/QFMxEVVFvnFIifh4Lqk+su+Nj
	EBVTJ1Zw0ptWX5Mi2Tlb
X-Received: by 2002:a05:6000:402a:b0:390:d73a:4848 with SMTP id ffacd0b85a97d-39132db1bdcmr22489008f8f.47.1741866280384;
        Thu, 13 Mar 2025 04:44:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX54DwhuuXuiX517uvSUEgVEhgO3UBbgNo/IaPOPi6DbNC92jX9q/7SC3qQwivycyOtbvIkA==
X-Received: by 2002:a05:6000:402a:b0:390:d73a:4848 with SMTP id ffacd0b85a97d-39132db1bdcmr22488963f8f.47.1741866280013;
        Thu, 13 Mar 2025 04:44:40 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:38 -0700 (PDT)
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
Subject: [PATCH v4 05/14] drm: Suppress intentional warning backtraces in scaling unit tests
Date: Thu, 13 Mar 2025 11:43:20 +0000
Message-Id: <20250313114329.284104-6-acarmina@redhat.com>
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
X-Mimecast-MFC-PROC-ID: gER9Ez-5aBJRE7zVVwOwxQ8S3SFI6AdYmh9f8H_yZuU_1741866280
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Guenter Roeck <linux@roeck-us.net>

The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tests
intentionally trigger warning backtraces by providing bad parameters to
the tested functions. What is tested is the return value, not the existence
of a warning backtrace. Suppress the backtraces to avoid clogging the
kernel log and distraction from real problems.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Acked-by: Maíra Canal <mcanal@igalia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 drivers/gpu/drm/tests/drm_rect_test.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
index 17e1f34b7610..e8d707b4a101 100644
--- a/drivers/gpu/drm/tests/drm_rect_test.c
+++ b/drivers/gpu/drm/tests/drm_rect_test.c
@@ -406,22 +406,38 @@ KUNIT_ARRAY_PARAM(drm_rect_scale, drm_rect_scale_cases, drm_rect_scale_case_desc
 
 static void drm_test_rect_calc_hscale(struct kunit *test)
 {
+	DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
 	const struct drm_rect_scale_case *params = test->param_value;
 	int scaling_factor;
 
+	/*
+	 * drm_rect_calc_hscale() generates a warning backtrace whenever bad
+	 * parameters are passed to it. This affects all unit tests with an
+	 * error code in expected_scaling_factor.
+	 */
+	KUNIT_START_SUPPRESSED_WARNING(drm_calc_scale);
 	scaling_factor = drm_rect_calc_hscale(&params->src, &params->dst,
 					      params->min_range, params->max_range);
+	KUNIT_END_SUPPRESSED_WARNING(drm_calc_scale);
 
 	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
 }
 
 static void drm_test_rect_calc_vscale(struct kunit *test)
 {
+	DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
 	const struct drm_rect_scale_case *params = test->param_value;
 	int scaling_factor;
 
+	/*
+	 * drm_rect_calc_vscale() generates a warning backtrace whenever bad
+	 * parameters are passed to it. This affects all unit tests with an
+	 * error code in expected_scaling_factor.
+	 */
+	KUNIT_START_SUPPRESSED_WARNING(drm_calc_scale);
 	scaling_factor = drm_rect_calc_vscale(&params->src, &params->dst,
 					      params->min_range, params->max_range);
+	KUNIT_END_SUPPRESSED_WARNING(drm_calc_scale);
 
 	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
 }
-- 
2.34.1


