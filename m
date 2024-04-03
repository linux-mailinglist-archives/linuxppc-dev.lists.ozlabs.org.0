Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1002789708D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 15:23:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aF3b79Qk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8lmy5ZY1z3wKJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 00:23:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aF3b79Qk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8lj43J67z3w0y
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 00:19:52 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1e034607879so51027315ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Apr 2024 06:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712150390; x=1712755190; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUpuwFkhA/ZZkaJrm+5DUMvKoRunaI4/ZlB0ejZmZW4=;
        b=aF3b79Qk8yLcJzk11CZt8+CctAj6us3FJmCknXx4AuuAYbsno5AoNgwPKvrl+igjOz
         /5yk3VR4kTOQ66up8Z3U2Zmb9A/hXBy4o2aoUDHIGgznRKNaytcueYywIFv6O+i6TN+u
         6rbrdp9iYr6fWL+9pMc0Pcm6TiAIMvu99ryk8PvSm6hJIC7hoQECKZXvI0g909tAXZyO
         86DHsSKV2kbIMrRCUerqbuMGuth1zNLdL4fT2KZXu9MDqIv4rhHNgz4F5E0h8OOaj2AU
         /hxYm9Y5zCYE9bdESYeSafUhTbHcgi7p+HKXl1Uh25v8dKcK/yG+oXCIy2enlYgkWT+M
         chMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150390; x=1712755190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KUpuwFkhA/ZZkaJrm+5DUMvKoRunaI4/ZlB0ejZmZW4=;
        b=tO+1o5dS8oKFAg7bd7t7o00tAfF7s11yl0HXciePCdN9ZLdH9HXfgyyg/0r1kC/dzq
         P/AATHvVN8+Nf/FJrraJQ8SVchEErurq/z+7erEhKADvcOJiltO6U3NyTRV0UmG0ts/p
         gab8MC2vZIYN1VtTMfCf9weyYtN20WpfMBX+LbgNpEZxxYI9IGAybtBVQ1JXXuiY86m9
         qUOq6RbhBxqwRwwgI8Bsd9SnMRxUkdeb6EAF1hqPq5M0d3VgRUwqlc0np1XW6XZQxM9+
         bCRjkwkSSfVrMGPK8D75N6zuYjVxCHQM3tywUunR7/HUZmcvf61Q6pUjksOQJnooz2+5
         6Igw==
X-Forwarded-Encrypted: i=1; AJvYcCXbivLpXPYGPNxasrBcZlJpWExZeddPvE0LKSy6QQTA+ZzV3m3dfGRqfleRejwmlZcT7C3ceXWcLJSFOXWuvRshvPDHmD5PjWDnGhthrw==
X-Gm-Message-State: AOJu0Yw66wXgrfqeYbCYh1mOeUBm/hg5QyRp8/31li7dG/sbDjDXdv4u
	7XWHXKvT/o5qe4Jy4W4yhIgjuIMH1uTrRwX/KHPIWWBeR1fQfmHe
X-Google-Smtp-Source: AGHT+IE/2OacMp/2cfvaRksBgAjGZgKxyI++pmI4VDvZRW0+d8012wJeFPX8kGKifNbdvVT4SH77dg==
X-Received: by 2002:a17:902:f68a:b0:1e2:9205:5254 with SMTP id l10-20020a170902f68a00b001e292055254mr1881147plg.7.1712150389795;
        Wed, 03 Apr 2024 06:19:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001e088a9e2bcsm13158796plt.292.2024.04.03.06.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:19:49 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Subject: [PATCH v3 04/15] kunit: Add documentation for warning backtrace suppression API
Date: Wed,  3 Apr 2024 06:19:25 -0700
Message-Id: <20240403131936.787234-5-linux@roeck-us.net>
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Linux Kernel Functional Testing <lkft@linaro.org>, Guenter Roeck <linux@roeck-us.net>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, net
 dev@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Document API functions for suppressing warning backtraces.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2:
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
v3:
- Rebased to v6.9-rc2

 Documentation/dev-tools/kunit/usage.rst | 30 ++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
index 22955d56b379..8d3d36d4103d 100644
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
+		START_SUPPRESSED_WARNING(some_function);
+		trigger_backtrace();
+		END_SUPPRESSED_WARNING(some_function);
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
2.39.2

