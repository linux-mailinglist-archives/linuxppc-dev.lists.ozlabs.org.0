Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 173B8879A04
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 18:06:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bKubvVE9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvKn51Y77z3vb4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 04:06:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bKubvVE9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvKj92P07z3dTr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 04:03:25 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1dd97fd66cdso19992665ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 10:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263002; x=1710867802; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36BrykVX1YEJvDrrNJGSTLQfgxZ1lgqGPC6PgqTTbEw=;
        b=bKubvVE9OAe4cTL3M3sDioTEGj0rd8uN/TkoG/qWwi0i7SB7NHAQNEg3pl7z5CyMaE
         8T/pNVbfHDN+eWh9N5lTAb7/sx4DWvDWt0HfIXA47V8PGvpmlj8VadBGheaO/QHQnCxq
         VUUirb+5U4Vzknv5DA7/gf4ViJ97HqnyWYXV62BRmxCQ/u9Rpc6jRoBO3R5WyavJ4Hw2
         VB8iJFnPRHs/atNimMV0WWB9anyUtwFHwn3hNBPPBzTAolXUvS9W1FO813pKcyiOmfu4
         P7qJjl4bBCA5pGCHYQV7b0N1GPOn+jfq8Rh1Hm+23DKZWB7pZyIoscwHxC8dWgGNbPBv
         g/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263002; x=1710867802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=36BrykVX1YEJvDrrNJGSTLQfgxZ1lgqGPC6PgqTTbEw=;
        b=m/9UYbHDgE9rjTLi6w02WktQYIljwEQkBPcai2N+oPNN/eIIGdevHOlx23WRGUIzky
         oVJWa++j+lbNq4rnrfRtdaSQHINipgt37cQmhLT6NvsLJt2zRySesWdp66XjpKMeUyjR
         p97mzMvYZBCjekSGQM9yvCroIAoYmgcHunCxh2EPpAcAfKa9a5mRnUf9hX2vhU6lozg5
         q/aNyP3M8qy+s27swdyjev6oIeMJB/Jd1T+WKtQeDWwkDrYxbNulofTzsuvpULqbBFEI
         Fu3pr8zYzRM5bi6QMPlTLKTIbcfEWVAaTWMhi1j5e2+tQGgKehdCLuyEhey1glu5mW9q
         VtRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGpFKDJrJIuhVXpR2rp30OkFruhJHaPrUtb5jpozoWGvJTWwSbG3B8bmLyia6En+tHMDfas+FMVne9UR6K+tKriy24XOtqxWOynoxV9w==
X-Gm-Message-State: AOJu0YwtzoQJYjGX08qRacFxR5K3j715CL7xTN/Ff1pPeIuzB7iQbXjU
	LWlfLW4Loag3DNWl1II0zKaJz7gI7a9aYPiu+1QaPB8Zf/gMi1td
X-Google-Smtp-Source: AGHT+IHYAZUPDqsFw7GWyh1RSbVI2Qwrh9Mdl1wKcQdsH3Ao31Ql441CQm7bvVJxkQ6v+AiS/8LElw==
X-Received: by 2002:a17:902:b198:b0:1dc:d8de:5664 with SMTP id s24-20020a170902b19800b001dcd8de5664mr9227736plr.33.1710263002517;
        Tue, 12 Mar 2024 10:03:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902a3c100b001dbb6fef41fsm7095813plb.257.2024.03.12.10.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:21 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Subject: [PATCH 04/14] kunit: Add documentation for warning backtrace suppression API
Date: Tue, 12 Mar 2024 10:02:59 -0700
Message-Id: <20240312170309.2546362-5-linux@roeck-us.net>
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

Document API functions for suppressing warning backtraces.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
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

