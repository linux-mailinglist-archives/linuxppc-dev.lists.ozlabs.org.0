Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B58DC456C84
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 10:41:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwWs74904z3cV0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 20:41:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nzW89fNZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=calvinzhang.cool@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=nzW89fNZ; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwTfP3yvGz2yPZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 19:02:21 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id z6so6342314plk.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 00:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qOCx5sFVE+zhsZMFm7VYYi5j9KabUFYLGScDeGkNxio=;
 b=nzW89fNZIaeGG7iFC/anmbyYxdYeiIPsY0WyiJL9dBOt/8uw3ODbBglPEFVbBiYTFV
 0pv6LksmsP2oSI7akfzeUVVDy20WgJ8k3Rv/wn0P8mO0aNHHtrwk7Uq1DAm2tz0pk8FA
 pyHsLEzmZnvO6aptkJL6vJeOlrnGVjQ8DlD967ddxsYJ1T8QRmI3cN0eGcPyOLxdkh7J
 JFWJebETXfh0MEmv7iOioLeT+GLXWL8dQGOU7S+PWH74qRoFtdGbVE6oXI0KrvG0FTVd
 +teDlDj3djGGS3rhXtJn8bFeiCJlF9gtWq6C9oZE6cyVc4LO5QXagcnEvn69nlQBAycU
 pkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qOCx5sFVE+zhsZMFm7VYYi5j9KabUFYLGScDeGkNxio=;
 b=2l5YIDtidmCr5dhHX3RRjH0fqa24gcD2ZeLMjFBYwb8L3cpv2+SJnJeeQAvW0Gj78w
 rK7hO9ZFzwePchR0bFHBy19iTQaBi7jZ7A7bRcsDmS/MJc14XbHOMXrv2rTTK6DlZJBP
 4jZZtc/osMSKmcovb+fwxgeOJop1GlQmpc1WdVBEBp/7l+jrOi9UsgFNIMPQdQRAIGuN
 6RQpxbXS6G1EZc05okMhL5rV9rSIp8ynWp6C3wVEzD7YLDaUaOMaP+/v2I5IMPclHNmn
 ijsiad8JMU57LYEMaFT5hNq+yYILD8g8tvXnPXW+aTuYu3m84vunn/Yw4MjK6q3HM34c
 H+RQ==
X-Gm-Message-State: AOAM532TfGXoOH9Dn6XSFUjDLFETKrXxrJcaiGmM9aoOZbp9x+GPmghP
 E/mwjiNka6eSFdGTtzV7BPk=
X-Google-Smtp-Source: ABdhPJxD8TG96sq1MtTt8E+2ENWTqJbXT9h5ZtPUFFHaIxmjzzibkl/E4Joc49HUY6kx/0RfviZh7Q==
X-Received: by 2002:a17:902:f209:b0:141:99d1:7cef with SMTP id
 m9-20020a170902f20900b0014199d17cefmr75711457plc.70.1637308938491; 
 Fri, 19 Nov 2021 00:02:18 -0800 (PST)
Received: from localhost.localdomain ([103.99.179.247])
 by smtp.gmail.com with ESMTPSA id o6sm1791259pfh.70.2021.11.19.00.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 00:02:18 -0800 (PST)
From: Calvin Zhang <calvinzhang.cool@gmail.com>
To: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rich Felker <dalias@libc.org>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Vladimir Isaev <isaev@synopsys.com>,
 Calvin Zhang <calvinzhang.cool@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Guenter Roeck <linux@roeck-us.net>, Marc Zyngier <maz@kernel.org>,
 David Brazdil <dbrazdil@google.com>, Mark Rutland <mark.rutland@arm.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Souptick Joarder <jrdr.linux@gmail.com>,
 Jinyang He <hejinyang@loongson.cn>,
 Mauri Sandberg <sandberg@mailfence.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Andreas Oetken <andreas.oetken@siemens.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Markus Elfring <elfring@users.sourceforge.net>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Alexandre Ghiti <alex@ghiti.fr>,
 Vitaly Wool <vitaly.wool@konsulko.com>
Subject: [PATCH 2/2] of: reserved_mem: Remove reserved regions count
 restriction
Date: Fri, 19 Nov 2021 15:58:19 +0800
Message-Id: <20211119075844.2902592-3-calvinzhang.cool@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
References: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 19 Nov 2021 20:39:55 +1100
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
Cc: uclinux-h8-devel@lists.sourceforge.jp, Rob Herring <robh@kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, linux-sh@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux-xtensa.org,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 devicetree@vger.kernel.org, Zhang Yunkai <zhang.yunkai@zte.com.cn>,
 linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Change to allocate reserved_mems dynamically. Static reserved regions
must be reserved before any memblock allocations. The reserved_mems
array couldn't be allocated until memblock and linear mapping are ready.

So move the allocation and initialization of records and reserved memory
from early_init_fdt_scan_reserved_mem() to of_reserved_mem_init().

Signed-off-by: Calvin Zhang <calvinzhang.cool@gmail.com>
---
 arch/arc/mm/init.c                 |  3 ++
 arch/arm/kernel/setup.c            |  2 +
 arch/arm64/kernel/setup.c          |  3 ++
 arch/csky/kernel/setup.c           |  3 ++
 arch/h8300/kernel/setup.c          |  2 +
 arch/mips/kernel/setup.c           |  3 ++
 arch/nds32/kernel/setup.c          |  3 ++
 arch/nios2/kernel/setup.c          |  2 +
 arch/openrisc/kernel/setup.c       |  3 ++
 arch/powerpc/kernel/setup-common.c |  3 ++
 arch/riscv/kernel/setup.c          |  2 +
 arch/sh/kernel/setup.c             |  3 ++
 arch/xtensa/kernel/setup.c         |  2 +
 drivers/of/fdt.c                   |  1 -
 drivers/of/of_reserved_mem.c       | 66 ++++++++++++++++++++----------
 15 files changed, 79 insertions(+), 22 deletions(-)

diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index ce4e939a7f07..a75f0e693f37 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -10,6 +10,7 @@
 #include <linux/initrd.h>
 #endif
 #include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/swap.h>
 #include <linux/module.h>
 #include <linux/highmem.h>
@@ -165,6 +166,8 @@ void __init setup_arch_memory(void)
 
 #endif /* CONFIG_HIGHMEM */
 
+	of_reserved_mem_init();
+
 	free_area_init(max_zone_pfn);
 }
 
diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index 284a80c0b6e1..e76737effbf4 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -20,6 +20,7 @@
 #include <linux/kexec.h>
 #include <linux/libfdt.h>
 #include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
 #include <linux/smp.h>
@@ -1153,6 +1154,7 @@ void __init setup_arch(char **cmdline_p)
 	early_ioremap_reset();
 
 	paging_init(mdesc);
+	of_reserved_mem_init();
 	kasan_init();
 	request_standard_resources(mdesc);
 
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index be5f85b0a24d..4624e5193d6e 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -27,6 +27,7 @@
 #include <linux/proc_fs.h>
 #include <linux/memblock.h>
 #include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/efi.h>
 #include <linux/psci.h>
 #include <linux/sched/task.h>
@@ -339,6 +340,8 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
 
 	paging_init();
 
+	of_reserved_mem_init();
+
 	acpi_table_upgrade();
 
 	/* Parse the ACPI tables for possible boot-time configuration */
diff --git a/arch/csky/kernel/setup.c b/arch/csky/kernel/setup.c
index c64e7be2045b..40878906644d 100644
--- a/arch/csky/kernel/setup.c
+++ b/arch/csky/kernel/setup.c
@@ -6,6 +6,7 @@
 #include <linux/initrd.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/start_kernel.h>
 #include <linux/dma-map-ops.h>
 #include <linux/screen_info.h>
@@ -64,6 +65,8 @@ static void __init csky_memblock_init(void)
 #endif
 	memblock_set_current_limit(PFN_PHYS(max_low_pfn));
 
+	of_reserved_mem_init();
+
 	dma_contiguous_reserve(0);
 
 	free_area_init(max_zone_pfn);
diff --git a/arch/h8300/kernel/setup.c b/arch/h8300/kernel/setup.c
index 61091a76eb7e..0f0ec72a260e 100644
--- a/arch/h8300/kernel/setup.c
+++ b/arch/h8300/kernel/setup.c
@@ -24,6 +24,7 @@
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/clk-provider.h>
 #include <linux/memblock.h>
 #include <linux/screen_info.h>
@@ -87,6 +88,7 @@ static void __init bootmem_init(void)
 
 	early_init_fdt_reserve_self();
 	early_init_fdt_scan_reserved_mem();
+	of_reserved_mem_init();
 
 	memblock_dump_all();
 }
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index f979adfd4fc2..053a10d80cb9 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -27,6 +27,7 @@
 #include <linux/dma-map-ops.h>
 #include <linux/decompress/generic.h>
 #include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/dmi.h>
 #include <linux/crash_dump.h>
 
@@ -776,6 +777,8 @@ void __init setup_arch(char **cmdline_p)
 	cpu_cache_init();
 	paging_init();
 
+	of_reserved_mem_init();
+
 	memblock_dump_all();
 }
 
diff --git a/arch/nds32/kernel/setup.c b/arch/nds32/kernel/setup.c
index b3d34d646652..1054804526c5 100644
--- a/arch/nds32/kernel/setup.c
+++ b/arch/nds32/kernel/setup.c
@@ -10,6 +10,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/of_fdt.h>
 #include <linux/of_platform.h>
+#include <linux/of_reserved_mem.h>
 #include <asm/setup.h>
 #include <asm/sections.h>
 #include <asm/proc-fns.h>
@@ -301,6 +302,8 @@ void __init setup_arch(char **cmdline_p)
 	/* paging_init() sets up the MMU and marks all pages as reserved */
 	paging_init();
 
+	of_reserved_mem_init();
+
 	/* invalidate all TLB entries because the new mapping is created */
 	__nds32__tlbop_flua();
 
diff --git a/arch/nios2/kernel/setup.c b/arch/nios2/kernel/setup.c
index 40bc8fb75e0b..7e40e90bc3cd 100644
--- a/arch/nios2/kernel/setup.c
+++ b/arch/nios2/kernel/setup.c
@@ -19,6 +19,7 @@
 #include <linux/memblock.h>
 #include <linux/initrd.h>
 #include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/screen_info.h>
 
 #include <asm/mmu_context.h>
@@ -173,6 +174,7 @@ void __init setup_arch(char **cmdline_p)
 
 	early_init_fdt_reserve_self();
 	early_init_fdt_scan_reserved_mem();
+	of_reserved_mem_init();
 
 	unflatten_and_copy_device_tree();
 
diff --git a/arch/openrisc/kernel/setup.c b/arch/openrisc/kernel/setup.c
index 0cd04d936a7a..6830bd110ac4 100644
--- a/arch/openrisc/kernel/setup.c
+++ b/arch/openrisc/kernel/setup.c
@@ -32,6 +32,7 @@
 #include <linux/initrd.h>
 #include <linux/of_fdt.h>
 #include <linux/of.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/device.h>
 
 #include <asm/sections.h>
@@ -299,6 +300,8 @@ void __init setup_arch(char **cmdline_p)
 	/* paging_init() sets up the MMU and marks all pages as reserved */
 	paging_init();
 
+	of_reserved_mem_init();
+
 	*cmdline_p = boot_command_line;
 
 	printk(KERN_INFO "OpenRISC Linux -- http://openrisc.io\n");
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 4f1322b65760..1902b4472991 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -31,6 +31,7 @@
 #include <linux/percpu.h>
 #include <linux/memblock.h>
 #include <linux/of_platform.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/hugetlb.h>
 #include <linux/pgtable.h>
 #include <asm/io.h>
@@ -840,6 +841,8 @@ void __init setup_arch(char **cmdline_p)
 	/* Set a half-reasonable default so udelay does something sensible */
 	loops_per_jiffy = 500000000 / HZ;
 
+	of_reserved_mem_init();
+
 	/* Unflatten the device-tree passed by prom_init or kexec */
 	unflatten_device_tree();
 
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index b42bfdc67482..e3a211cdf5e1 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -16,6 +16,7 @@
 #include <linux/screen_info.h>
 #include <linux/of_fdt.h>
 #include <linux/of_platform.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/sched/task.h>
 #include <linux/smp.h>
 #include <linux/efi.h>
@@ -273,6 +274,7 @@ void __init setup_arch(char **cmdline_p)
 
 	efi_init();
 	paging_init();
+	of_reserved_mem_init();
 #if IS_ENABLED(CONFIG_BUILTIN_DTB)
 	unflatten_and_copy_device_tree();
 #else
diff --git a/arch/sh/kernel/setup.c b/arch/sh/kernel/setup.c
index 1fcb6659822a..51e85a17c202 100644
--- a/arch/sh/kernel/setup.c
+++ b/arch/sh/kernel/setup.c
@@ -31,6 +31,7 @@
 #include <linux/memblock.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/uaccess.h>
 #include <uapi/linux/mount.h>
 #include <asm/io.h>
@@ -326,6 +327,8 @@ void __init setup_arch(char **cmdline_p)
 	/* Let earlyprintk output early console messages */
 	sh_early_platform_driver_probe("earlyprintk", 1, 1);
 
+	of_reserved_mem_init();
+
 #ifdef CONFIG_OF_FLATTREE
 #ifdef CONFIG_USE_BUILTIN_DTB
 	unflatten_and_copy_device_tree();
diff --git a/arch/xtensa/kernel/setup.c b/arch/xtensa/kernel/setup.c
index 8db20cfb44ab..527d425490fd 100644
--- a/arch/xtensa/kernel/setup.c
+++ b/arch/xtensa/kernel/setup.c
@@ -25,6 +25,7 @@
 #include <linux/cpu.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
 
 #if defined(CONFIG_VGA_CONSOLE) || defined(CONFIG_DUMMY_CONSOLE)
 # include <linux/console.h>
@@ -356,6 +357,7 @@ void __init setup_arch(char **cmdline_p)
 	parse_early_param();
 	bootmem_init();
 	kasan_init();
+	of_reserved_mem_init();
 	unflatten_and_copy_device_tree();
 
 #ifdef CONFIG_SMP
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 445af4e69300..715ce8ec6ac6 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -540,7 +540,6 @@ void __init early_init_fdt_scan_reserved_mem(void)
 	}
 
 	fdt_scan_reserved_mem();
-	of_reserved_mem_init();
 	fdt_reserve_elfcorehdr();
 }
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 784cfc5cd251..6dc22a1ad472 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -26,9 +26,8 @@
 
 #include "of_private.h"
 
-#define MAX_RESERVED_REGIONS	64
-static struct reserved_mem reserved_mems[MAX_RESERVED_REGIONS];
-static int reserved_mem_count;
+static struct reserved_mem *reserved_mems;
+static int reserved_mem_count, reserved_mem_max_count;
 
 static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
 	phys_addr_t align, phys_addr_t start, phys_addr_t end, bool nomap,
@@ -62,7 +61,7 @@ static void __init fdt_reserved_mem_save_node(unsigned long node, const char *un
 {
 	struct reserved_mem *rmem = &reserved_mems[reserved_mem_count];
 
-	if (reserved_mem_count == ARRAY_SIZE(reserved_mems)) {
+	if (reserved_mem_count == reserved_mem_max_count) {
 		pr_err("not enough space for all defined regions.\n");
 		return;
 	}
@@ -200,13 +199,12 @@ static int __init __reserved_mem_check_root(unsigned long node)
  * __reserved_mem_reserve_reg() - reserve all memory described in 'reg' property
  */
 static int __init __reserved_mem_reserve_reg(unsigned long node,
-					     const char *uname)
+					     const char *uname, bool reserve_only)
 {
 	int t_len = (dt_root_addr_cells + dt_root_size_cells) * sizeof(__be32);
 	phys_addr_t base, size;
 	int len;
 	const __be32 *prop;
-	int first = 1;
 	bool nomap;
 
 	prop = of_get_flat_dt_prop(node, "reg", &len);
@@ -225,30 +223,35 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
 		base = dt_mem_next_cell(dt_root_addr_cells, &prop);
 		size = dt_mem_next_cell(dt_root_size_cells, &prop);
 
-		if (size &&
-		    early_init_dt_reserve_memory_arch(base, size, nomap) == 0)
-			pr_debug("Reserved memory: reserved region for node '%s': base %pa, size %lu MiB\n",
-				uname, &base, (unsigned long)(size / SZ_1M));
-		else
-			pr_info("Reserved memory: failed to reserve memory for node '%s': base %pa, size %lu MiB\n",
-				uname, &base, (unsigned long)(size / SZ_1M));
-
-		len -= t_len;
-		if (first) {
+		if (reserve_only) {
+			if (size &&
+				early_init_dt_reserve_memory_arch(base, size, nomap) == 0)
+				pr_debug("Reserved memory: reserved region for node '%s': base %pa, size %lu MiB\n",
+					uname, &base, (unsigned long)(size / SZ_1M));
+			else
+				pr_info("Reserved memory: failed to reserve memory for node '%s': base %pa, size %lu MiB\n",
+					uname, &base, (unsigned long)(size / SZ_1M));
+		} else {
 			fdt_reserved_mem_save_node(node, uname, base, size);
-			first = 0;
+			break;
 		}
+		len -= t_len;
 	}
 	return 0;
 }
 
 /*
- * fdt_scan_reserved_mem() - scan a single FDT node for reserved memory
+ * fdt_scan_reserved_mem() - scan /reserved-memory node
+ *
+ * Get the max count of regions in the first pass. Early allocator is
+ * not fully available yet. Store information of reserved region to
+ * reserved_mems array in the second pass.
  */
 int __init fdt_scan_reserved_mem(void)
 {
-	int node, child;
+	int node, child, regions = 0;
 	const void *fdt = initial_boot_params;
+	static bool first = true;
 
 	node = fdt_path_offset(fdt, "/reserved-memory");
 	if (node < 0)
@@ -266,12 +269,19 @@ int __init fdt_scan_reserved_mem(void)
 		if (!of_fdt_device_is_available(fdt, child))
 			continue;
 
+		regions++;
 		uname = fdt_get_name(fdt, child, NULL);
 
-		err = __reserved_mem_reserve_reg(child, uname);
-		if (err == -ENOENT && of_get_flat_dt_prop(child, "size", NULL))
+		err = __reserved_mem_reserve_reg(child, uname, first);
+		if (err == -ENOENT && of_get_flat_dt_prop(child, "size", NULL) && !first)
 			fdt_reserved_mem_save_node(child, uname, 0, 0);
 	}
+
+	if (first) {
+		reserved_mem_max_count = regions;
+		first = false;
+	}
+
 	return 0;
 }
 
@@ -358,6 +368,20 @@ void __init of_reserved_mem_init(void)
 {
 	int i;
 
+	if (!reserved_mem_max_count)
+		return;
+
+	reserved_mems = memblock_alloc(
+			sizeof(struct reserved_mem) * reserved_mem_max_count,
+			SMP_CACHE_BYTES);
+	if (!reserved_mems) {
+		reserved_mem_max_count = 0;
+		pr_err("failed to allocate reserved_mems array.\n");
+		return;
+	}
+
+	fdt_scan_reserved_mem();
+
 	/* check for overlapping reserved regions */
 	__rmem_check_for_overlap();
 
-- 
2.30.2

