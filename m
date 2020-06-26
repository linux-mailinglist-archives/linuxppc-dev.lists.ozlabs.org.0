Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEEE20BB9D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 23:32:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tqpw6D92zDqLX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 07:32:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--brendanhiggins.bounces.google.com
 (client-ip=2607:f8b0:4864:20::249; helo=mail-oi1-x249.google.com;
 envelope-from=3fmt2xg4kaluwmziyvicdbbdinbjjbgz.xjh@flex--brendanhiggins.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=EvV5AKqL; dkim-atps=neutral
Received: from mail-oi1-x249.google.com (mail-oi1-x249.google.com
 [IPv6:2607:f8b0:4864:20::249])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tqRs0Pf8zDqkS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 07:15:52 +1000 (AEST)
Received: by mail-oi1-x249.google.com with SMTP id r9so7011818oia.22
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=2m42nyan1QaRICISfHXn3ke8By3LNXcToZfpb47eLnc=;
 b=EvV5AKqL3cJFlET9VlHMspDvH6mNrw9mdUE19R+kJN+pESV53C6mXgdfC4clw0ELfW
 tr1lXfgcFIiRv4MoSwDDJw9jES4cPLxshoo4C7q31woRW8JkH4PJyxgKB3GXH0/ppNWd
 VYX0IClBCrnQPoVcJ7+R41T9X+pxOD5zTcbXFZUkeJP1HULYEbP1KoSYcn4K2bAedO1v
 PFbWA1LgvH8S3ANmNmQpeNJVoIh0t7N4GhwGwZJhqxQZ2el0LxOrgFNYE/ayUYd81Dy1
 cmA2NsAPucNm9mEnjHr2mMd8N/IQtdaZZ8ZxjgdncUA3OeneJDLj9pAe/uiXPqgh5ocE
 Z5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=2m42nyan1QaRICISfHXn3ke8By3LNXcToZfpb47eLnc=;
 b=N0qfcLrWlZM8qrGTgrU42nKvzjp4Cyj0W44mWcfpuYjdhRzZ7shZ91O4e6TAZBIh7o
 wnDC2kseTfldbNh2r+RZbl16HygsoIWTBjxbCXkK/mCqUkXzGBDZBO9KZp/PTMR0L2Tj
 tud1THFormKlKgjdfc6kP0RJMqbAIrR/uZz7Flr2k25HlrD4i3SWdNxaMe2AsaQchrdc
 nV/HS4loUiBmi1p4GjX2aamoFD+2uEmx/pq7UnAtJBPTq4EBZnKOCTZyhkumYCn0ZHqJ
 OgL8PXQPAf7JUOhZKHI41lcz7JxYsPSnRQIlCdXlImwFE5NugEI27BHjfGK5b2rAwxnK
 Qa1A==
X-Gm-Message-State: AOAM530cdEbaZkrbXhQLtNJAPDxv8X90bXKZcEKXwv47jaK/cs3xfhRu
 XZL4qlYnutbmWd9rgwn51maQIqCO/Q8W6SpkWD0Q2w==
X-Google-Smtp-Source: ABdhPJy0+rXtJcmUjQAOQ1aAvDwonrj9UP+Ys357A/5trD7jFzZV4nkOkOzYhaN1/GJa0Ye3QtES5GjMO0EI2sSfq7X/1A==
X-Received: by 2002:a17:90b:3746:: with SMTP id
 ne6mr5608123pjb.166.1593205782452; 
 Fri, 26 Jun 2020 14:09:42 -0700 (PDT)
Date: Fri, 26 Jun 2020 14:09:15 -0700
In-Reply-To: <20200626210917.358969-1-brendanhiggins@google.com>
Message-Id: <20200626210917.358969-11-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20200626210917.358969-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v5 10/12] kunit: Add 'kunit_shutdown' option
From: Brendan Higgins <brendanhiggins@google.com>
To: jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com, 
 arnd@arndb.de, keescook@chromium.org, skhan@linuxfoundation.org, 
 alan.maguire@oracle.com, yzaikin@google.com, davidgow@google.com, 
 akpm@linux-foundation.org, rppt@linux.ibm.com, frowand.list@gmail.com, 
 catalin.marinas@arm.com, will@kernel.org, monstr@monstr.eu, 
 mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, 
 chris@zankel.net, jcmvbkbc@gmail.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-doc@vger.kernel.org, sboyd@kernel.org, gregkh@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>,
 mcgrof@kernel.org, linux-kselftest@vger.kernel.org, logang@deltatee.com,
 linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: David Gow <davidgow@google.com>

Add a new kernel command-line option, 'kunit_shutdown', which allows the
user to specify that the kernel poweroff, halt, or reboot after
completing all KUnit tests; this is very handy for running KUnit tests
on UML or a VM so that the UML/VM process exits cleanly immediately
after running all tests without needing a special initramfs.

Signed-off-by: David Gow <davidgow@google.com>
Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 lib/kunit/executor.c                | 20 ++++++++++++++++++++
 tools/testing/kunit/kunit_kernel.py |  2 +-
 tools/testing/kunit/kunit_parser.py |  2 +-
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
index a95742a4ece73..38061d456afb2 100644
--- a/lib/kunit/executor.c
+++ b/lib/kunit/executor.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <linux/reboot.h>
 #include <kunit/test.h>
 
 /*
@@ -11,6 +12,23 @@ extern struct kunit_suite * const * const __kunit_suites_end[];
 
 #if IS_BUILTIN(CONFIG_KUNIT)
 
+static char *kunit_shutdown;
+core_param(kunit_shutdown, kunit_shutdown, charp, 0644);
+
+static void kunit_handle_shutdown(void)
+{
+	if (!kunit_shutdown)
+		return;
+
+	if (!strcmp(kunit_shutdown, "poweroff"))
+		kernel_power_off();
+	else if (!strcmp(kunit_shutdown, "halt"))
+		kernel_halt();
+	else if (!strcmp(kunit_shutdown, "reboot"))
+		kernel_restart(NULL);
+
+}
+
 static void kunit_print_tap_header(void)
 {
 	struct kunit_suite * const * const *suites, * const *subsuite;
@@ -37,6 +55,8 @@ int kunit_run_all_tests(void)
 	     suites++)
 			__kunit_test_suites_init(*suites);
 
+	kunit_handle_shutdown();
+
 	return 0;
 }
 
diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/kunit_kernel.py
index 63dbda2d029f6..d6a575f92317c 100644
--- a/tools/testing/kunit/kunit_kernel.py
+++ b/tools/testing/kunit/kunit_kernel.py
@@ -172,7 +172,7 @@ class LinuxSourceTree(object):
 		return self.validate_config(build_dir)
 
 	def run_kernel(self, args=[], build_dir='', timeout=None):
-		args.extend(['mem=1G'])
+		args.extend(['mem=1G', 'kunit_shutdown=halt'])
 		outfile = 'test.log'
 		self._ops.linux_bin(args, timeout, build_dir, outfile)
 		subprocess.call(['stty', 'sane'])
diff --git a/tools/testing/kunit/kunit_parser.py b/tools/testing/kunit/kunit_parser.py
index 6d6d94a0ee7db..a8998a5effaad 100644
--- a/tools/testing/kunit/kunit_parser.py
+++ b/tools/testing/kunit/kunit_parser.py
@@ -49,7 +49,7 @@ class TestStatus(Enum):
 
 kunit_start_re = re.compile(r'TAP version [0-9]+$')
 kunit_end_re = re.compile('(List of all partitions:|'
-			  'Kernel panic - not syncing: VFS:)')
+			  'Kernel panic - not syncing: VFS:|reboot: System halted)')
 
 def isolate_kunit_output(kernel_output):
 	started = False
-- 
2.27.0.212.ge8ba1cc988-goog

