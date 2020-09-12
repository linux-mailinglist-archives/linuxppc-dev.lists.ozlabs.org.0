Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B242679FA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 13:33:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BpVqZ3dy9zDrF4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 21:33:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=KLE1PL50; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BpVH96ZDLzDqsv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 21:08:37 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id bh1so2148148plb.12
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 04:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yfwK3v59ulDG8xRv4Cwr4k2seeBZHBJy/fMB9LYQCYQ=;
 b=KLE1PL50FLBo8ev5qSDoj1kBBVOJoMyiHr99ME6rCPqlayRiESNpQWvxCHB3om2Bfc
 XN0BVMjBNpBx5otJmu1jvqPjeWgsI4KksNuYIwR70mc27cvFLWlhjTRLgt83KBE2MFDw
 Dm8vSbSJaJpHsO2XD/IeVUJf+GCoM9n5H04mM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yfwK3v59ulDG8xRv4Cwr4k2seeBZHBJy/fMB9LYQCYQ=;
 b=sEbduDPKLulXOxUBy3cgXUU6dyhGJDek8o6vP6m8pgDcx69nfGqphKwQBA2D3jk44z
 H/FLuvfiKw8di9ItbNxtSpklDxrtvWjhey/WKMs5P+z9j9v4bFuAXmETdEJ+fI5j0q0/
 AY6HRxofGHuHQAIfLu8i/qBmA/+zVM29YPAa5LeUnC2ivYyZVeLkmXJRMB/J2tueOo+m
 yBfb1G182bF5qPhjuTyAvgU1i9AO5rJEL1pdKsCtXjVL5yIf8PeYwQsZ4WnIxy/WDRNS
 Nc4pYXtXcFmrKQMK9lLnqlsXlc/icyRA/8Gf+B6U5Ylo1nRfwub6hGfpU7pXzIHFLNVl
 n63Q==
X-Gm-Message-State: AOAM533Mbss9+U8htWq5UzJ15yiNt+0buqKo5OEcw+c0Z0nSg5nie81Z
 pvm9iHOw4mgS+/WVDlAJU2ftYw==
X-Google-Smtp-Source: ABdhPJz39VXqPylLzqvKf+nVy4cjgyiwubNgnhEKUOy/E1w6B1m+xyacV3sKJYHyjEOTCLca7/KdBw==
X-Received: by 2002:a17:902:7489:b029:d0:4c09:be with SMTP id
 h9-20020a1709027489b02900d04c0900bemr6604087pll.0.1599908915516; 
 Sat, 12 Sep 2020 04:08:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id q190sm5265820pfq.99.2020.09.12.04.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 04:08:34 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 14/15] selftests/clone3: Avoid OS-defined clone_args
Date: Sat, 12 Sep 2020 04:08:19 -0700
Message-Id: <20200912110820.597135-15-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200912110820.597135-1-keescook@chromium.org>
References: <20200912110820.597135-1-keescook@chromium.org>
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
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 Will Drewry <wad@chromium.org>, Kees Cook <keescook@chromium.org>,
 linux-xtensa@linux-xtensa.org, linux-mips@vger.kernel.org,
 Andy Lutomirski <luto@amacapital.net>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Christian Brauner <christian@brauner.io>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As the UAPI headers start to appear in distros, we need to avoid
outdated versions of struct clone_args to be able to test modern
features. Additionally pull in the syscall numbers correctly.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
I needed to fix this to get MIPS to build the seccomp selftests.
---
 .../testing/selftests/clone3/clone3_selftests.h  | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/clone3/clone3_selftests.h b/tools/testing/selftests/clone3/clone3_selftests.h
index 91c1a78ddb39..bc0f34e37ae1 100644
--- a/tools/testing/selftests/clone3/clone3_selftests.h
+++ b/tools/testing/selftests/clone3/clone3_selftests.h
@@ -4,11 +4,19 @@
 #define _CLONE3_SELFTESTS_H
 
 #define _GNU_SOURCE
+
+/* Pull in syscall numbers. */
+#include <unistd.h>
+#include <sys/syscall.h>
+
+/* Avoid old OS versions of "struct clone_args". */
+#define clone_args old_clone_args
 #include <sched.h>
 #include <linux/sched.h>
+#undef clone_args
+
 #include <linux/types.h>
 #include <stdint.h>
-#include <syscall.h>
 #include <sys/wait.h>
 
 #include "../kselftest.h"
@@ -25,6 +33,7 @@
 
 #ifndef __NR_clone3
 #define __NR_clone3 -1
+#endif
 struct clone_args {
 	__aligned_u64 flags;
 	__aligned_u64 pidfd;
@@ -34,13 +43,16 @@ struct clone_args {
 	__aligned_u64 stack;
 	__aligned_u64 stack_size;
 	__aligned_u64 tls;
+#ifndef CLONE_ARGS_SIZE_VER1
 #define CLONE_ARGS_SIZE_VER1 80
+#endif
 	__aligned_u64 set_tid;
 	__aligned_u64 set_tid_size;
+#ifndef CLONE_ARGS_SIZE_VER2
 #define CLONE_ARGS_SIZE_VER2 88
+#endif
 	__aligned_u64 cgroup;
 };
-#endif /* __NR_clone3 */
 
 static pid_t sys_clone3(struct clone_args *args, size_t size)
 {
-- 
2.25.1

