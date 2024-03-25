Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4688F88ACAB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 18:57:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QSBuSMpV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3LHy09mmz3w0b
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 04:57:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QSBuSMpV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3LBW5j8hz3vjb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 04:53:07 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1def89f0cfdso41149115ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 10:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389185; x=1711993985; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZNhbleKNla2Ie/ZEatm6EVk1jlCAGbsmm+zF41MFkk=;
        b=QSBuSMpVfuD/1PikKaQvNXjrkSWdOQEUejr01T5BNhcRAuL//vq85abwLjMFt7M2dY
         YuuOg2sSz+9QqOwzQ9XOmZYFf1XxtcWY5h7CXAZZDqIIS1nj8HlDxjH7xLLzC1wQVEkX
         snln5qoCbpyVEdr2Yk9qhW2eKjDhmk/I0T1wUwAC9iegsfBPfrxVV5Jue3F7O0H0p+9C
         v2Tfa4QSCXZVAoMuSUIIDgUhwa3I0nKsV6T0DYKojQJ1mVERSHN27X+OA3fjGYPecglX
         mFqQxoEOvdWX4BojwEGiWuFvDttUELLe15nRv66boZENMYsZZEv0Ocjdbf9gYllkNQGu
         7hLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389185; x=1711993985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yZNhbleKNla2Ie/ZEatm6EVk1jlCAGbsmm+zF41MFkk=;
        b=qyrUdLnm9D8ks1zaWnzrK/ALhCcAyfqxrVBfMQRqDHseCRE5VoKsYtnM1zL4nkeaon
         94oXPahDDOlRO9+yqsHkkdEQlChBSjfoLrC52N3Dk1TrSFlGWOzo0eCH6uZzvqal88EJ
         3Z5Z/vm/pm2GfxIHzJfmo9Kc9BL+lXmPT4eJ/jcqVQtZbLUxxeB21ibyM+3wR7n37olf
         jznUnTWuV3rmz9vnDPaagYn2InlWrtZ9pSh1APyL5udWlnclT5pCGDFOFFX01+mSdSES
         fA/cR8ReIkZyJRROo8uWCS+kSMwPswZuGqthF+8EoEAnZ9IZ5vrOh5kyG5Hd+KTkk01A
         /KsA==
X-Forwarded-Encrypted: i=1; AJvYcCUlFgcb1ANUjaI6pfZM/dM6W7cPYy2B4CPfzqJkW3fTBA2ZX9Hlf7ivwIj7pxwgnsed0lwYWirRrom1ryEFCHFVkswojmqbP+3bfX8vnA==
X-Gm-Message-State: AOJu0YxfaFWtibEyXZzo9rIAux0YvsuL0phU4wEjtLBfXWx2FQUFsk63
	VfP9vhd3+pL+A2asGe2THvbU/NXdjsXe0JvEb7HZBcJXYFMR0vAc
X-Google-Smtp-Source: AGHT+IEKWGuzpihfez0cIj5Jcw9QuULSWV5Y1XxkrBzCrtkepZtfQa7QDls+G+yzQdtdIaLpfh3muA==
X-Received: by 2002:a17:902:e810:b0:1e0:960b:f395 with SMTP id u16-20020a170902e81000b001e0960bf395mr11373029plg.25.1711389185110;
        Mon, 25 Mar 2024 10:53:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902da8500b001e0c568ae8fsm1586519plx.192.2024.03.25.10.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:53:04 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Subject: [PATCH v2 06/14] net: kunit: Suppress lock warning noise at end of dev_addr_lists tests
Date: Mon, 25 Mar 2024 10:52:40 -0700
Message-Id: <20240325175248.1499046-7-linux@roeck-us.net>
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
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Linux Kernel Functional Testing <lkft@linaro.org>, Guenter Roeck <linux@roeck-us.net>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vg
 er.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
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

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Cc: David Gow <davidgow@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags

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

