Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 116E7301AB2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jan 2021 09:45:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DNmls1QSBzDrfs
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jan 2021 19:45:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SFxxpwF4; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DNmHT5yqzzDqlh
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jan 2021 19:24:05 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id 31so5722507plb.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jan 2021 00:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X4PdAkKAj1M/Yo1TeEkwcmE5+wLYrx2vqWkun80SjU4=;
 b=SFxxpwF4aZqAtiyha8DpNwD8NhP2VPk/75SmbcOcUMe8/tsdfJEhfXIo72nG1U14DU
 /Lfme/sKGozWIGX0E2hSH8Mi7eKm/t+eYpIlLC1+AGsIAouFEPWAWEPQ5E2m1pe4ABGR
 35pNfkvvqCINxLbhZT5Hq4lI7a3fhieQBBuWzw14T0cITiJIeHWoZrFD0AVaieTifYF3
 jM6UOz0iA0NrXmVRl77vIVdAkSKXjl4Bf57i/GvL3hmvpx0acyI1x74L9491tfkkkeMK
 zEfDoR3CJ3WHkKTAVtJmYF4vJM1atUQiY108Xs6ol5GzVxQ9tLCHsdLKFzL4raSrcER4
 X60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X4PdAkKAj1M/Yo1TeEkwcmE5+wLYrx2vqWkun80SjU4=;
 b=AVsCChE6e50YNmRGYhDu5AbeHWrW/c2bAHO9okFennBvXyaHZO/oVHfOQQ8mn9IQW5
 jlFjgeDO6iUIWf+dvHogq+yKn5++nF1SR6PcDWlUQPrVfjmpal47x5P3x2cxt33HWHzG
 YV398+hqX6zRGKN4r4Y1tBZy9P/T4dUOLFbKVdzoeLKIf0qMhOWQ6e2Q01sMnoB/7fNs
 4ID9GZD6695wuCqfAZjfzKNq6oOTA3FVn7IBcxEG5KikeIct7C6OmGgG1OgcmCpwawcn
 uRZIDHES2CzMJIhJK7EqBje5bT5SNl0NLxGKoZ/8EfoG/ivzqw3E8BchHbBKti/ypfXr
 8p4A==
X-Gm-Message-State: AOAM532dECfUf4iRHLoYNWvIwlwOS6teEproxNBURI3Zv08atIQxijFA
 GTCeHXK84/JgHDoPi/m4ubE=
X-Google-Smtp-Source: ABdhPJwWSI9slFc6FiGRew3Dj4/h6/vkxLw9qnQk1wa1Zw10/YWu1xYbDC+boiJwyVxb/47ASvxmaA==
X-Received: by 2002:a17:902:e84e:b029:de:45bf:1296 with SMTP id
 t14-20020a170902e84eb02900de45bf1296mr7950370plg.49.1611476641776; 
 Sun, 24 Jan 2021 00:24:01 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id gb12sm11799757pjb.51.2021.01.24.00.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 00:24:01 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v10 12/12] powerpc/64s/radix: Enable huge vmalloc mappings
Date: Sun, 24 Jan 2021 18:22:30 +1000
Message-Id: <20210124082230.2118861-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210124082230.2118861-1-npiggin@gmail.com>
References: <20210124082230.2118861-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Ding Tianhong <dingtianhong@huawei.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, Zefan Li <lizefan@huawei.com>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  2 ++
 arch/powerpc/Kconfig                            |  1 +
 arch/powerpc/kernel/module.c                    | 13 +++++++++++--
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a10b545c2070..d62df53e5200 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3225,6 +3225,8 @@
 
 	nohugeiomap	[KNL,X86,PPC,ARM64] Disable kernel huge I/O mappings.
 
+	nohugevmalloc	[PPC] Disable kernel huge vmalloc mappings.
+
 	nosmt		[KNL,S390] Disable symmetric multithreading (SMT).
 			Equivalent to smt=1.
 
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 107bb4319e0e..781da6829ab7 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -181,6 +181,7 @@ config PPC
 	select GENERIC_GETTIMEOFDAY
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
+	select HAVE_ARCH_HUGE_VMALLOC		if HAVE_ARCH_HUGE_VMAP
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <= 14
 	select HAVE_ARCH_KASAN_VMALLOC		if PPC32 && PPC_PAGE_SHIFT <= 14
diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index a211b0253cdb..bc2695eeeb4c 100644
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@ -92,8 +92,17 @@ void *module_alloc(unsigned long size)
 {
 	BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
 
-	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END, GFP_KERNEL,
-				    PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
+	/*
+	 * Don't do huge page allocations for modules yet until more testing
+	 * is done. STRICT_MODULE_RWX may require extra work to support this
+	 * too.
+	 */
+
+	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
+				    GFP_KERNEL,
+				    PAGE_KERNEL_EXEC,
+				    VM_NOHUGE | VM_FLUSH_RESET_PERMS,
+				    NUMA_NO_NODE,
 				    __builtin_return_address(0));
 }
 #endif
-- 
2.23.0

