Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E53A879A20
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 18:07:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CXiiMbPx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvKnv0fmjz3vgK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 04:07:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CXiiMbPx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvKjC6Dq2z3dWF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 04:03:27 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6e68bab3e4cso2357726b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 10:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263005; x=1710867805; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGQg+0HBD/PmNnv+fI5fQqG3IGlyLsIaZmNJE7ZYwjo=;
        b=CXiiMbPxeamhk54LU656VgVLK9bPUP3Z5SIjDi6HA5ujEF0Zs4F7z/s7WKNdmAYTYt
         DmKqJqZth+aFxum3yi4u8yEigugywJYV1FVkzH16S6i2nTgTMqWhgPmDdXfmZkhxzf7l
         bJLvmD9h9+jo/dp9Iw178elXV4Gc6qkXN7SK0Al0B/7DbIl6p1b0xVOZ2V/Se2kE3HJG
         knH0450hC1Kmfas7YIjG2Wx2UhsNHLXYWI5dh5lA/MUAKXe4G3TTA3PFUusvWTDKXOkc
         M+Bcz6DHuOdGKQ/G/RY1IMOMlUIuG766txxEwk1A4xUwr9/GhtAsBVHX1KeNv4WgR0Bx
         Z/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263005; x=1710867805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NGQg+0HBD/PmNnv+fI5fQqG3IGlyLsIaZmNJE7ZYwjo=;
        b=BVZHrpyLKDlrsgv3GU16rhN4NIRjAMuTpLdxGGFCgZUm51snTc54NHUYsyT3odn4QS
         GO0OXFrkdECmKIl9SO9hcVnZMHARksXmkW0kS/Q+JJ2Ba4mqYOhL0YwokTeShoFZko7L
         OTFq2OQgWm3iNem2RkBqwZX5F8hzYs1bMsjxjbJIpJ7JnjXROufbJgouzu4EUYH6Rmvn
         R3xhGssF/e7GulyzvTrQCmRKFprOVkugd9PCFumrm0qL/j8i0xq6coxljK51h61yNCrd
         w9oW6gji9kEwcRfgHxVJZMXPTG3vzU4JnFwXT2gevRwvYf/Sy8UMvMiQOzeo/bb1L0+E
         Hj+A==
X-Forwarded-Encrypted: i=1; AJvYcCXV/QP+WE60qYMr4vFmI8IWlJ50sWSrkItb00LpxyT6CEXVFngaX6WuIKPhoXZYHf4hijSiNPwA4TYL2gT49QbY1GegTmQ/Csuv4o5G3w==
X-Gm-Message-State: AOJu0YwiLnlGTNi6aqe4uPL0jnnNALrPnOADDZBSzgjpeVJ3tPGXmhYq
	uYR8hL2KH+4EzZUrX/9qMx36V8+sYABkkXMOZ6Agjr3/k7kBj94t
X-Google-Smtp-Source: AGHT+IGxFzq6cbK7MrvIXcZlkGCehcjfwe014BGxyN94I+kP8/p7v7PJMJz1gy7c7O8kch/y3R6C8g==
X-Received: by 2002:a05:6a20:1a8f:b0:1a1:4ea8:1844 with SMTP id ci15-20020a056a201a8f00b001a14ea81844mr8418900pzb.26.1710263004751;
        Tue, 12 Mar 2024 10:03:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t123-20020a628181000000b006e657c72cf8sm6830699pfd.148.2024.03.12.10.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:23 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Subject: [PATCH 05/14] drm: Suppress intentional warning backtraces in scaling unit tests
Date: Tue, 12 Mar 2024 10:03:00 -0700
Message-Id: <20240312170309.2546362-6-linux@roeck-us.net>
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

The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tests
intentionally trigger warning backtraces by providing bad parameters to
the tested functions. What is tested is the return value, not the existence
of a warning backtrace. Suppress the backtraces to avoid clogging the
kernel log.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/gpu/drm/tests/drm_rect_test.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
index 76332cd2ead8..75614cb4deb5 100644
--- a/drivers/gpu/drm/tests/drm_rect_test.c
+++ b/drivers/gpu/drm/tests/drm_rect_test.c
@@ -406,22 +406,28 @@ KUNIT_ARRAY_PARAM(drm_rect_scale, drm_rect_scale_cases, drm_rect_scale_case_desc
 
 static void drm_test_rect_calc_hscale(struct kunit *test)
 {
+	DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
 	const struct drm_rect_scale_case *params = test->param_value;
 	int scaling_factor;
 
+	START_SUPPRESSED_WARNING(drm_calc_scale);
 	scaling_factor = drm_rect_calc_hscale(&params->src, &params->dst,
 					      params->min_range, params->max_range);
+	END_SUPPRESSED_WARNING(drm_calc_scale);
 
 	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
 }
 
 static void drm_test_rect_calc_vscale(struct kunit *test)
 {
+	DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
 	const struct drm_rect_scale_case *params = test->param_value;
 	int scaling_factor;
 
+	START_SUPPRESSED_WARNING(drm_calc_scale);
 	scaling_factor = drm_rect_calc_vscale(&params->src, &params->dst,
 					      params->min_range, params->max_range);
+	END_SUPPRESSED_WARNING(drm_calc_scale);
 
 	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
 }
-- 
2.39.2

