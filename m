Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF274879A2D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 18:08:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EMCYn8vP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvKpg4g0rz3vr0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 04:08:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EMCYn8vP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvKjD6J7Dz3dWF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 04:03:28 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1dd8f7d50c6so475345ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 10:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263006; x=1710867806; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFp+F6/qbMDKwppN9CX4ZWrh/15b9XKC6E4V4vAKNpU=;
        b=EMCYn8vP/ZAED4ebXobFg8tx52sznGr/9Zs+DPOX3iSiFvkQ5tBuhXhEJMlQpwbm1k
         a3XHDYQc9DsddFGCYk7OsdfeItfFVB7WhZ9ps11SOIHB70VoV4y732X+3KGH4gaC3Bfo
         3A600dz7mTl+sgMMI4npIoGme59s5MV1/41lMgUuGYHdGODpTQ3Q2m5RTR+UmNg0yvzy
         /wZeG3d8niiUklX1d6+7iin7rbPjptIOQRVPG6WxSpjswkebJ3meLfqHJ6iuQRttAEdF
         +9+Hx/VzUDq8YlMUVuRVy2El9qWtZnKIo0l6wpm0QgpAvrJNhF95Ake6bmI1V6LTxL2D
         f7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263006; x=1710867806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mFp+F6/qbMDKwppN9CX4ZWrh/15b9XKC6E4V4vAKNpU=;
        b=rXqcdzDkq3dA34yMMAvSo3C0fhgXhDaaoKSrOJ9M/yoUPFjkeJ+sGPwwdBzIM/KdXr
         TiZTUSMBMo7GWoxoC9joC/enJ8ocPG5NNhdAbd8yVqxcwBXm6kq6g7L/+1oM3YisI2mT
         +KGFZ8H/KJzWE86Egk7aLa6UNk01xqmIXdfCSjTQ+9wd1Y4jaq4GsF10SeyXldenFDtG
         pBLqrafZVr6QzzokCWHG+qNIauBZDh2merKuB0tkWW4FZNHymgSqExxSuQYab6lbYLKY
         axobmrrCSHIAYrSCyR+s7OWptO9CqIdv/zfuDTSRtw6a/Q/4n2j7tSGCcZFGrbEweQxX
         LiQg==
X-Forwarded-Encrypted: i=1; AJvYcCWJCmZVZjh2oqZkWOBnSWboXtlqpyb3o8bChifjWgovVCyJfNcq5A4kqS2HlcjU/ZVWgrWRhkq1jahPrcXJMZqFHLTSXg/uR4Kl45AwyQ==
X-Gm-Message-State: AOJu0YzqFpkzIvDIg4xeCylYeJb4PxfBMsCOJhlUc25zaV+u3ShCvW9N
	kkvdmhYn9JrzErKN8Or3QjcuY6anArzS4TZG6xCqoxprlSU3uhaR
X-Google-Smtp-Source: AGHT+IFHgAu4TIvnFI5COGYb5tswxOQ5AvbfbseYntF0tu2SzSXjMyu1g4BetZFgaKzrp5WqY1rOuQ==
X-Received: by 2002:a17:902:db10:b0:1dd:8ed0:59d0 with SMTP id m16-20020a170902db1000b001dd8ed059d0mr179469plx.17.1710263006272;
        Tue, 12 Mar 2024 10:03:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902ed1500b001d9a42f6183sm6958740pld.45.2024.03.12.10.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:25 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Subject: [PATCH 06/14] net: kunit: Suppress lock warning noise at end of dev_addr_lists tests
Date: Tue, 12 Mar 2024 10:03:01 -0700
Message-Id: <20240312170309.2546362-7-linux@roeck-us.net>
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
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>, netdev@lists.linux.dev, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, linux-kernel
 @vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

dev_addr_lists_test generates lock warning noise at the end of tests
if lock debugging is enabled. There are two sets of warnings.

WARNING: CPU: 0 PID: 689 at kernel/locking/mutex.c:923 __mutex_unlock_slowpath.constprop.0+0x13c/0x368
DEBUG_LOCKS_WARN_ON(__owner_task(owner) != __get_current())

WARNING: kunit_try_catch/1336 still has locks held!

KUnit test cleanup is not guaranteed to run in the same thread as the test
itself. For this test, this means that rtnl_lock() and rtnl_unlock() may
be called from different threads. This triggers the warnings.
Suppress the warnings because they are irrelevant for the test and just
confusing.

The first warning can be suppressed by using START_SUPPRESSED_WARNING()
and END_SUPPRESSED_WARNING() around the call to rtnl_unlock(). To suppress
the second warning, it is necessary to set debug_locks_silent while the
rtnl lock is held.

Cc: David Gow <davidgow@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 net/core/dev_addr_lists_test.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/core/dev_addr_lists_test.c b/net/core/dev_addr_lists_test.c
index 4dbd0dc6aea2..b427dd1a3c93 100644
--- a/net/core/dev_addr_lists_test.c
+++ b/net/core/dev_addr_lists_test.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
 #include <kunit/test.h>
+#include <linux/debug_locks.h>
 #include <linux/etherdevice.h>
 #include <linux/netdevice.h>
 #include <linux/rtnetlink.h>
@@ -49,6 +50,7 @@ static int dev_addr_test_init(struct kunit *test)
 		KUNIT_FAIL(test, "Can't register netdev %d", err);
 	}
 
+	debug_locks_silent = 1;
 	rtnl_lock();
 	return 0;
 }
@@ -56,8 +58,12 @@ static int dev_addr_test_init(struct kunit *test)
 static void dev_addr_test_exit(struct kunit *test)
 {
 	struct net_device *netdev = test->priv;
+	DEFINE_SUPPRESSED_WARNING(__mutex_unlock_slowpath);
 
+	START_SUPPRESSED_WARNING(__mutex_unlock_slowpath);
 	rtnl_unlock();
+	END_SUPPRESSED_WARNING(__mutex_unlock_slowpath);
+	debug_locks_silent = 0;
 	unregister_netdev(netdev);
 	free_netdev(netdev);
 }
-- 
2.39.2

