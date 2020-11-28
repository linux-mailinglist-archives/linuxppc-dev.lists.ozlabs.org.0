Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBEE2C6FD2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 16:47:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cjwqj5RRlzF1gM
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 02:47:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZhyQyF3x; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjwN70kznzDrQQ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 02:27:12 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id w202so7026557pff.10
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 07:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DNjSlcfmF+OHlo4gVLmadoYUI7t/ZPA6392s3YiGIWc=;
 b=ZhyQyF3xqUCTfNzTWjnt5F47H7u0baAN9fFtRmD3iym4ZXUMOqum0cQhh3hWOctZwj
 gPht2kBh0BvlDlTsq8TVE/kd5SPzqm9X89p6ZfrT7H3C/ioyQY5tgO574Ym+INLe4FYc
 s21mRxDd6DGVyMY1fWbws1Pq/YhrjXB32LaWupdtbDbaxsW0QfJbAiHeuVFfQKfuXwL4
 4JshxsnUfWHqQSkk+FnO+m1Flu7Wg1g/bOkeKaOJwHSdKSQC2TLM6Ybi/1wfBU+oOXqX
 Ncoe8p+vMg2cCr2cs0+3oYuDvraNpEh/P6BLPY5BbX1hBeAPkFfbcGcv4oiBi8Qqp35b
 wWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DNjSlcfmF+OHlo4gVLmadoYUI7t/ZPA6392s3YiGIWc=;
 b=o2eQVGhMXtpeNTI2mg2SFEXf2eqzqQqgC/prFICRDt/bTgxE9ekavuWP8cFNfxnalA
 6lbeZcSlQKK7aDHHrCmlLkVXfahTs24CfL92f2+vAJhjVFCvfSaIbsP6UXV+DIHtHfiw
 Q/viICuY5TsGwxesJ8RmoV4B9kseQFO8Y/NfRu48VSo/s2+qs3jdJoRR8YYGVgUsq5ue
 qSkl/NG1oO8qGAFzbX/GsYPlfO3RselS9rpahTiN3IiVfmfs7IDUU8d3OtHPDg8amVxa
 Gp9HGvqeRw7VW14adK7yYkoy0wvJZUO4V1ETTp9Ud8W4tgNiicp1pwE/5budwZ9qFt0O
 EiNg==
X-Gm-Message-State: AOAM5337Yvx4Dd/zJDWsQZn9/DUDfLjOpBuw8xtruiSDlU+3N4cXSexg
 4tdDJWP+pl1hAqtQT6Ga9kw=
X-Google-Smtp-Source: ABdhPJyr33fJ1cRT/CXJUB52w14TzTSG2z78e+wqJpSmyHM7mMK5eJZP/z+qSOVYdPM5WOeIlQODnQ==
X-Received: by 2002:a17:90a:1b6f:: with SMTP id
 q102mr16974828pjq.9.1606577229927; 
 Sat, 28 Nov 2020 07:27:09 -0800 (PST)
Received: from bobo.ibm.com (193-116-103-132.tpgi.com.au. [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id d22sm15500173pjw.11.2020.11.28.07.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 07:27:09 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v8 12/12] powerpc/64s/radix: Enable huge vmalloc mappings
Date: Sun, 29 Nov 2020 01:25:59 +1000
Message-Id: <20201128152559.999540-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201128152559.999540-1-npiggin@gmail.com>
References: <20201128152559.999540-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Zefan Li <lizefan@huawei.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 ++
 arch/powerpc/Kconfig                            | 1 +
 2 files changed, 3 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 44fde25bb221..3538c750c583 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3220,6 +3220,8 @@
 
 	nohugeiomap	[KNL,X86,PPC,ARM64] Disable kernel huge I/O mappings.
 
+	nohugevmalloc	[PPC] Disable kernel huge vmalloc mappings.
+
 	nosmt		[KNL,S390] Disable symmetric multithreading (SMT).
 			Equivalent to smt=1.
 
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e9f13fe08492..ae10381dd324 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -178,6 +178,7 @@ config PPC
 	select GENERIC_TIME_VSYSCALL
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
+	select HAVE_ARCH_HUGE_VMALLOC		if HAVE_ARCH_HUGE_VMAP
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <= 14
 	select HAVE_ARCH_KASAN_VMALLOC		if PPC32 && PPC_PAGE_SHIFT <= 14
-- 
2.23.0

