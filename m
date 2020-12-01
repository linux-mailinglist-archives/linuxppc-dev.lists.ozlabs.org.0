Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5212CA658
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 15:54:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CllWM44PKzDqpR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 01:54:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=LHoBrBZ+; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CllHR1H8PzDqH4
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 01:44:34 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id b12so1369889pjl.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Dec 2020 06:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JtbjV8+jTJ461PMIoBgns495ZYX58bMJi//O/k3uls0=;
 b=LHoBrBZ+WACXOa5H4OPxHViJAX0aBbDHIvjXqcXn2MChy2aSFYrG1CFRuVQKlX28r8
 7YIWBqFm1M5AHq1zduurm26gUAGf945keKOAlXMTIl4p6I/bskiuu1zAE4REW0Q8cDhM
 sIzS4DS1q6JpXZV0DYwLzg74D3DdFmR7ZECKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JtbjV8+jTJ461PMIoBgns495ZYX58bMJi//O/k3uls0=;
 b=opEbqRB7HLCJ3Y6dU3jgeo0jvSqGIuaDNqHOgdGytvzRrDKTuaMcMGCaFG985c939l
 pEZ2i2OR8AZmWPY/DnBNMnOl2V3tOI++g1DqPbhWsMp6t45mhKCKTCQuvusjdS4DCG4E
 lmdgumfYOLi8yRqkLl4fjWZQLn0jRIBZMRkibgQAPkft5DZDhL+5v39J57M+6CwOz85v
 QNJnsPe1d5rSipGGNUk2rbDcEIQRHvxtYlyZOvYG3gRFcTmyphEOz+CieWd+ctZjv48O
 mCU+/yJGvcJviP+lDohIWx+4T5UtKGVJ94nmIr3iEhUyBZnAPfH38rIOqOVKqzp/RDzs
 rX7w==
X-Gm-Message-State: AOAM533Mw4rRjr/yPcNTqIgrQPU28eCZj8avqAzOd/cDG49+5Gm/YIeb
 jL4+kVKuSWDSZykk3LlgLdiVXsroonzTJw==
X-Google-Smtp-Source: ABdhPJzyYGTkM2VeXcZv1Hl0+0rcfbOAqCofL57ONOfx7hca42Sk0PV/RSvV9YZR+kkbqO+TGt7FzA==
X-Received: by 2002:a17:90a:ec08:: with SMTP id
 l8mr2892503pjy.115.1606833872319; 
 Tue, 01 Dec 2020 06:44:32 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-f932-2db6-916f-25e2.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:f932:2db6:916f:25e2])
 by smtp.gmail.com with ESMTPSA id w137sm3228042pfc.190.2020.12.01.06.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 06:44:31 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] selftests/powerpc: update .gitignore
Date: Wed,  2 Dec 2020 01:44:27 +1100
Message-Id: <20201201144427.1228745-1-dja@axtens.net>
X-Mailer: git-send-email 2.25.1
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I did an in-place build of the self-tests and found that it left
the tree dirty.

Add missed test binaries to .gitignore

Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 tools/testing/selftests/powerpc/nx-gzip/.gitignore  | 3 +++
 tools/testing/selftests/powerpc/security/.gitignore | 1 +
 tools/testing/selftests/powerpc/signal/.gitignore   | 1 +
 tools/testing/selftests/powerpc/syscalls/.gitignore | 1 +
 4 files changed, 6 insertions(+)
 create mode 100644 tools/testing/selftests/powerpc/nx-gzip/.gitignore

diff --git a/tools/testing/selftests/powerpc/nx-gzip/.gitignore b/tools/testing/selftests/powerpc/nx-gzip/.gitignore
new file mode 100644
index 000000000000..886d522d52df
--- /dev/null
+++ b/tools/testing/selftests/powerpc/nx-gzip/.gitignore
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+gunz_test
+gzfht_test
diff --git a/tools/testing/selftests/powerpc/security/.gitignore b/tools/testing/selftests/powerpc/security/.gitignore
index 4257a1f156bb..93614b125ded 100644
--- a/tools/testing/selftests/powerpc/security/.gitignore
+++ b/tools/testing/selftests/powerpc/security/.gitignore
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 rfi_flush
 entry_flush
+spectre_v2
diff --git a/tools/testing/selftests/powerpc/signal/.gitignore b/tools/testing/selftests/powerpc/signal/.gitignore
index 405b5364044c..ce3375cd8e73 100644
--- a/tools/testing/selftests/powerpc/signal/.gitignore
+++ b/tools/testing/selftests/powerpc/signal/.gitignore
@@ -3,3 +3,4 @@ signal
 signal_tm
 sigfuz
 sigreturn_vdso
+sig_sc_double_restart
diff --git a/tools/testing/selftests/powerpc/syscalls/.gitignore b/tools/testing/selftests/powerpc/syscalls/.gitignore
index b00cab225476..a1e19ccdef84 100644
--- a/tools/testing/selftests/powerpc/syscalls/.gitignore
+++ b/tools/testing/selftests/powerpc/syscalls/.gitignore
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 ipc_unmuxed
+rtas_filter
-- 
2.25.1

