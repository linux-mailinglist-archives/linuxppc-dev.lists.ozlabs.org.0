Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAAB1AF79D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 08:49:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 494gQz43X0zDqlf
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 16:48:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=jagdsh.linux@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YRvu52Ag; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 494gP40M0yzDqSs
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Apr 2020 16:47:17 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id g2so2721417plo.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Apr 2020 23:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=HC8EzgDyXgY+Ahd0LWEHBYjj8NnTQwXiZWvYzIr89FA=;
 b=YRvu52AghzhI/BoIxJQT9pS0iYRnAZfDN4yfISSN6G7Y1/S9hMpl+e5jv+QI4C5NdO
 1PpDnil9SeqXK13yueVgpaqIbYTB2lsONhlm6/pS0HtdrsqXwXX9fjjOZ7bBGchmoDTE
 XqYZg7Ue9devgWIJX6tI4i0zj7voUhV5Sa9JrXlwtgeB3ZbbIeiH7wa6EYWCCjNQSWqY
 XklJ0kJQ8FvUC836yR2FMEWJnySL4c6Zb2I8mhjzUflJJ4jNnBwXvWL8NK1a5zapsuKP
 Rj9f0APBKBEoGJUoappNWfN2eLseLKi7apxNVm5/ZYNTC5zCt8LLdoVb5Khe5diw3WKR
 7l3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=HC8EzgDyXgY+Ahd0LWEHBYjj8NnTQwXiZWvYzIr89FA=;
 b=e28wLg8KF6kP/vOUoz02NpWISptfTBaldV5OIG+s/uq/HVE9Dnhk/l3Wt5Nv8j7aGj
 Am8fmCLzEYrVdcUnWm0ojoyLVWZ+ErTfT/64GjXADVxvfv5ZEworpXwuRPBPbcLgJZdw
 dr5tXvXPYxrrVeV9f8g1oBhxJbpBoGyTIzL9u9x6ATxyu/X7MIdDi2uFo7efkyH96FZ/
 OXyC/3hODpr32FlAKCBYxUsqP3smrYrICWZN/dd8PhjDObMpjrlYzTF9qhQEw7XWFmU5
 Fq2bvt1oxXTsiFT9a03ak0CgNWyiZJPm/IT6Pq5oOr0hGcSI5NyZqmD1H0OApGdkrZGF
 /yeg==
X-Gm-Message-State: AGi0PuZI3w2HwZiF7XukG9mpi54IbGPGLgJRxXKKkoT2aKFXcEI0X4Sg
 ltP7cqoxKOhmIldGJbT63Aw=
X-Google-Smtp-Source: APiQypIzlSUWxRzYEDXedUWj1Pe1NbxG2MRy5KjBGpXDhPr4lEsSTwZqUHoS2jm0voKHjbhs4L8pKw==
X-Received: by 2002:a17:90b:374f:: with SMTP id
 ne15mr5162521pjb.181.1587278834246; 
 Sat, 18 Apr 2020 23:47:14 -0700 (PDT)
Received: from CentOS76.localdomain.localdomain ([27.59.158.48])
 by smtp.gmail.com with ESMTPSA id q97sm10689215pjb.7.2020.04.18.23.47.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 18 Apr 2020 23:47:13 -0700 (PDT)
From: jagdsh.linux@gmail.com
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 huah@kernel.org, mikey@neuling.org, gromero@linux.ibm.com,
 gregkh@linuxfoundation.org, alexios.zavras@intel.com, tglx@linutronix.de,
 swinslow@gmail.com, rfontana@redhat.com
Subject: [PATCH] tools/testing/selftests/powerpc/tm: Remove duplicate headers
Date: Sun, 19 Apr 2020 12:16:04 +0530
Message-Id: <1587278764-18640-1-git-send-email-jagdsh.linux@gmail.com>
X-Mailer: git-send-email 1.8.3.1
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
Cc: Jagadeesh Pagadala <jagdsh.linux@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Jagadeesh Pagadala <jagdsh.linux@gmail.com>

Code cleanup: Remove duplicate headers which are included twice.

Signed-off-by: Jagadeesh Pagadala <jagdsh.linux@gmail.com>
---
 tools/testing/selftests/powerpc/tm/tm-poison.c      | 1 -
 tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/tools/testing/selftests/powerpc/tm/tm-poison.c b/tools/testing/selftests/powerpc/tm/tm-poison.c
index 9775584..f0257c6 100644
--- a/tools/testing/selftests/powerpc/tm/tm-poison.c
+++ b/tools/testing/selftests/powerpc/tm/tm-poison.c
@@ -20,7 +20,6 @@
 #include <sched.h>
 #include <sys/types.h>
 #include <signal.h>
-#include <inttypes.h>
 
 #include "tm.h"
 
diff --git a/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c b/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c
index e2a0c07..9ef37a9 100644
--- a/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c
+++ b/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c
@@ -17,7 +17,6 @@
 #include <pthread.h>
 #include <sys/mman.h>
 #include <unistd.h>
-#include <pthread.h>
 
 #include "tm.h"
 #include "utils.h"
-- 
1.8.3.1

