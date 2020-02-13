Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7619815B62E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 01:53:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HygW2gw3zDqTx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 11:53:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=f3+zjZPL; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HyY62CngzDqSK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2020 11:48:10 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id j7so1621124plt.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 16:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CaOpE+RnykMge29WfCqnRai8zpZuPSzzYfJQc7CCb6s=;
 b=f3+zjZPLroh9v/srLMResHUURGulEqa1TIn2eNJbsZT02ZxhHsRPkA9k0qw76MvdTd
 CsvJWPkuISec5SALYDCzKnkeMg0By2NuPdP9hKr5vwQQphWe7SO0/Sq0X91W6zF9B9z6
 ZeG+15K1Hk5r2SlBuRh5E7wT/B8cJA9YraLL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CaOpE+RnykMge29WfCqnRai8zpZuPSzzYfJQc7CCb6s=;
 b=GAIf7N0NZeio8UQ9zFvNoMU3z7Jg+Hzo9YLh9bVW8A6NVBC9Xqa+kBhbe1tW8LZWme
 IGNJto5MwpW0OnUmPoG73ZKMZtBSjtzDDdhhOopJqY+u/nL/+n1doxyDbESA7zf2tcre
 nMlFz6g3/QR45DdCGV+YGwUaCudH1mk4OKpEaxFoI9A8YxQtwc+egVI69eCKP7qD341Y
 xnFrh7wrw4V5jqePpVjImjqaJPMOzJV/i0b048unuGvH1KAqw6qghxhHxF6Dtm4hpgO4
 2ilz3Ihu0+w3cDeLEnPE2ljDx14JLyuYnSc8C8FTEl60pJsSm1Xs1gTcj5y2uKJ00ecS
 7M9w==
X-Gm-Message-State: APjAAAX+6R99SVN4B3M1bUsjtbfuvqmjl/TiDXU3e7oMupiQlVVq1mhZ
 oMmp6qruk6mQt0c1YVXEA159OA==
X-Google-Smtp-Source: APXvYqyeOHjQf5Bxk67rYMg6dqoxPmAvSH1SohWbFDUDX4cuyAdfkJPx7JAuve/KqUZz4YX4tZ+rcQ==
X-Received: by 2002:a17:902:7c88:: with SMTP id
 y8mr11104973pll.321.1581554887611; 
 Wed, 12 Feb 2020 16:48:07 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-f1ea-0ab5-027b-8841.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:f1ea:ab5:27b:8841])
 by smtp.gmail.com with ESMTPSA id q7sm297478pgk.62.2020.02.12.16.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 16:48:06 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@c-s.fr, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: [PATCH v7 2/4] kasan: Document support on 32-bit powerpc
Date: Thu, 13 Feb 2020 11:47:50 +1100
Message-Id: <20200213004752.11019-3-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200213004752.11019-1-dja@axtens.net>
References: <20200213004752.11019-1-dja@axtens.net>
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

KASAN is supported on 32-bit powerpc and the docs should reflect this.

Document s390 support while we're at it.

Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Daniel Axtens <dja@axtens.net>

---

Changes since v5:
 - rebase - riscv has now got support.
 - document s390 support while we're at it
 - clarify when kasan_vmalloc support is required
---
 Documentation/dev-tools/kasan.rst |  7 +++++--
 Documentation/powerpc/kasan.txt   | 12 ++++++++++++
 2 files changed, 17 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/powerpc/kasan.txt

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index c652d740735d..012ef3d91d1f 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -22,7 +22,8 @@ global variables yet.
 Tag-based KASAN is only supported in Clang and requires version 7.0.0 or later.
 
 Currently generic KASAN is supported for the x86_64, arm64, xtensa, s390 and
-riscv architectures, and tag-based KASAN is supported only for arm64.
+riscv architectures. It is also supported on 32-bit powerpc kernels. Tag-based 
+KASAN is supported only on arm64.
 
 Usage
 -----
@@ -255,7 +256,9 @@ CONFIG_KASAN_VMALLOC
 ~~~~~~~~~~~~~~~~~~~~
 
 With ``CONFIG_KASAN_VMALLOC``, KASAN can cover vmalloc space at the
-cost of greater memory usage. Currently this is only supported on x86.
+cost of greater memory usage. Currently this supported on x86, s390
+and 32-bit powerpc. It is optional, except on 32-bit powerpc kernels
+with module support, where it is required.
 
 This works by hooking into vmalloc and vmap, and dynamically
 allocating real shadow memory to back the mappings.
diff --git a/Documentation/powerpc/kasan.txt b/Documentation/powerpc/kasan.txt
new file mode 100644
index 000000000000..26bb0e8bb18c
--- /dev/null
+++ b/Documentation/powerpc/kasan.txt
@@ -0,0 +1,12 @@
+KASAN is supported on powerpc on 32-bit only.
+
+32 bit support
+==============
+
+KASAN is supported on both hash and nohash MMUs on 32-bit.
+
+The shadow area sits at the top of the kernel virtual memory space above the
+fixmap area and occupies one eighth of the total kernel virtual memory space.
+
+Instrumentation of the vmalloc area is optional, unless built with modules,
+in which case it is required.
-- 
2.20.1

