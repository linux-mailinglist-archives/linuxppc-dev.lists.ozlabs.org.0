Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5DC2CFA3F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 08:20:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cp1F82LNPzDqGk
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 18:20:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=F0AUUFvJ; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cp0mC4WXdzDqf5
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 17:58:51 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id 4so4384887plk.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Dec 2020 22:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yJtR5xFkunhGW99GQOAU+TGQjkAsTnnQTxf07zcOvgs=;
 b=F0AUUFvJuyPvisQotGkESCF08thwJoD8pLvQ56/LvEXslmEH0PbmpE3VoVsYHUPh5W
 R4sViBSPmYFfv8z31pBurxkieAdobFffotdSKXfs+2S5OID6ZZ07rbUBM/zOjiNNjRsr
 zRXHtgOhNfM9dDwmlzC1SpPNOSfdH3IMYzmJq72shpEdCADu3y8GX/BBhyMKh4OFH/nx
 JDyVkGBQyzZGwfsyzWil2bss/hIM0VPEQHehTp01lUD6ikeVvH7yq/Jh/MZHF0igWAH4
 QZjVQt0sjl4YqvkXzfsPZHwxpwiK/6DWxbxy+JfSP7qEsFVJoHAQmiRucUWNY0F2KecP
 91GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yJtR5xFkunhGW99GQOAU+TGQjkAsTnnQTxf07zcOvgs=;
 b=CWh+qQv+RNnuoEFWMKSJvl4i7ZLhIcPomQi9GpOBuCv+1xMcC/DAzG0Tq/3lPc2+Z0
 fRVt6xE3Cuco9PoYS58H4kFF3eOJKZQF3fno2i9hfaszFFIcRrIKEdjS8HapPnHBCkE+
 YwVIEXWCZYLaWxyOCyZW/cKeOb7jVjfDOvCqyfJmFGvBCd4PaI9FWNwc4IoORffn3fHz
 2J4mOsTWom6VOI71EFr/LQcKh6o+2lYchowi8V30Rhf59cnBUSBCAEnVLWhu5Y7JLv7P
 C0RJIzPvoN7VJ5bdhLg+XJ4yLC0brN1N5JOXudFn1t0+UBCNvXiBP33HhyfPF5ZQwUuC
 jJpQ==
X-Gm-Message-State: AOAM530TPAej4eAZzIk1t0TlAfM/z6ddqUAoTv+gPSu8wnSTTnICu8aY
 gnjkxNAMP6frNqsnGlhziD4=
X-Google-Smtp-Source: ABdhPJzkUWSPz0m3VE8zS2RyFMHsvOwCooTxRUR8sFq0DkwXmyrcWvagfoOGE71yDd28mcnPgNNnig==
X-Received: by 2002:a17:90b:a53:: with SMTP id
 gw19mr7522366pjb.216.1607151529339; 
 Fri, 04 Dec 2020 22:58:49 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([1.129.145.238])
 by smtp.gmail.com with ESMTPSA id a14sm1110848pfl.141.2020.12.04.22.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 22:58:49 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v9 12/12] powerpc/64s/radix: Enable huge vmalloc mappings
Date: Sat,  5 Dec 2020 16:57:25 +1000
Message-Id: <20201205065725.1286370-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201205065725.1286370-1-npiggin@gmail.com>
References: <20201205065725.1286370-1-npiggin@gmail.com>
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

