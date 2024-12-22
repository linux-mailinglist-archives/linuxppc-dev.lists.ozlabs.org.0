Return-Path: <linuxppc-dev+bounces-4408-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B299FA561
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Dec 2024 12:16:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGJVw4qf2z2yVt;
	Sun, 22 Dec 2024 22:16:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734866168;
	cv=none; b=SgHopbz6R6N79sdFJy8XJxKwywS+PQA/rMIWvhQL5xkcpFMJBUKgHgVgsGwDq5iq85taQLTV+3un2SjVf6Bqvsa9hbwYJncPSsmO+urhzQw3ozVIwBBAUGc2YHYxBfos6/rGAYbGTqetGjlOkU+43TJu63Ks13ATdJJPvK/McJG/AWpGbSYvPLki7IgPduCSIodauvkqmc8TsQP2XRw3eOOR8s6lTxfLXWPfC7KMb5+mAA7Bl6vDpnzSiCRKr5Ivox6pRC+JZpBQq6ZeEerNxL2VthsA47rds2hG5Xu2p4cVx249gZdvURNtNb8b+7HV1r7TYtu3ZtsdmkhSBn18hA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734866168; c=relaxed/relaxed;
	bh=SeC6bQQxdK8aBJy4uBC70oPQwV/BtqL8fR6Vi5GDB30=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bjzQYvcojRsLunvpVwDgMehNTltNBFOdJGtajfQxj/aRp4ZhS5sAUMe72Gb9WsBk3VBzLi0YmwYxCWztzRSz7ZGCwd1bM5ayfW5887ALPR6XmETdExpScv/FBFjvxytYOAdk2XPr+/H6pTp+BrPwr7CzKlAs55wnDhVb/zmfhmzlwCK4dhqKk4fA7itHnREA+0OYYs2DVjDAmST/XHtzubVy2k+copKcegvsI12M+tDEUX97ElTUjBKsV7noJ56o2ikeG3WWvYSGcmzzus+QuYnVpwdnBLjf0K/VRoLLn5K5a3djlb+EdAEqf8miOHY19CaKVj3VOdoMz+nUW/ZqMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gSm4nnGP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=guoweikang.kernel@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gSm4nnGP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=guoweikang.kernel@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGJVp2bWGz2xjb
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 22:16:01 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-725f2f79ed9so2659024b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 03:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734866160; x=1735470960; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SeC6bQQxdK8aBJy4uBC70oPQwV/BtqL8fR6Vi5GDB30=;
        b=gSm4nnGPmu1neVzqObqD5q7Tf88i23UxjPNfTEIrLkbh8bhtoyvoh35cYqU8k5yNcU
         lD3bXuyrHjp2zoeOdmcJCJCWIhMt+Akrjd+MuQdbeGtXDz0TBQRY2s1noaNQn9n87eaO
         cDC+sLViF/3SXWvU4F+jdVEFI8Jc9AsTE4DPVrnrOahEDvpXUhtejWa8UMDwHTZ+pUUZ
         +53XYd/kRneCWD7litcn+9A7TBq5KMfdsGqWuteqoScvA7GK+BFJV+QV1ctC9iiejOBL
         7PVUaXRuu4HgUgbpr4TzlH2fqt2hiyBQxJDZGNhdpQARKwqLY7zdrIUldg/wX+BRMzFG
         9LVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734866160; x=1735470960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SeC6bQQxdK8aBJy4uBC70oPQwV/BtqL8fR6Vi5GDB30=;
        b=QDad1JvBfodYRHlkX2rhFp5IX+TIVIWsDKn82EqODYoJ3BJWzkbJuxPEoCLTyLRclD
         dSoq3nCH7h0HjFx1uq+X0Kv3pzxZvJQZ5FbZZaPPL9mPsOwJlniZmtXjqs7UgRB8ZyRN
         zrCDn90Va/7fgTth8INA4aLHWW3km4tehsgfPV2CzhP15A89HdgFpAMGd+8aYscKl5fy
         aRoD41i+FS7JS2AXaAOWdoIPGoPDSTpib/nbPydpWBN7uSIqYfDtgqcXiiWhjkHVKv9g
         kixSvwCsLxgpaaAsqJ7530fRufO/5MpazAfgUYNlJmV6MQyNV6wtSUuLIdEPuamr+hzM
         BvxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXnndW5lqudgWTAyR+EvSz5L0T4juM8Qbs24Yhi0dLYiwhPgDlbHouNvpAph2E5w99+8YY+egbX8sxbMM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz/eR+1ERLdtbtM4ukGZjELpwb71pqJZoXccAFUFkZF6gAJBG0F
	YMAvE6/x3gz+bo/kFTpL5NXtLn8+Fr7Ewl8wheBfvAY+RDeEcu+b
X-Gm-Gg: ASbGncuiLisMi21uTMpGPmfk6aWBxDZeowR7lTZTpI40wG5vrCq/d0hsnYMlE4065qO
	LFY2B3fPb6jd9YBvw20F4maQK0PpB0f9p9LX0HDz63JtCCAeLkII4pzPSP2ZYUmuM/CFD32Z8Rj
	vEyNN/+k9CaHzwedUzCp6h9GxeQ7ushhTvqmUdqAvVf2gbleNO14qfWag6/gl5UmCb3OkRxg00/
	jOab21O6swX/VAm9pvTUKOGqpESbOOjmeJJuRU3ZsHaDH1d/pUj1GIYiQ/JIkyVc/HvAAEnP1b0
	vbK4
X-Google-Smtp-Source: AGHT+IHI/JMvlwrl0da0Ame6E1ZTyFkE5zonGKdIKc6/0G+/W4In6zlqr2lpYt4G5359RcnaBBobmQ==
X-Received: by 2002:a05:6a20:a127:b0:1e1:aa24:2e56 with SMTP id adf61e73a8af0-1e5e07ffd4bmr16632897637.30.1734866159305;
        Sun, 22 Dec 2024 03:15:59 -0800 (PST)
Received: from localhost.localdomain ([36.110.106.149])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e25951c2sm5511753a12.71.2024.12.22.03.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 03:15:58 -0800 (PST)
From: Guo Weikang <guoweikang.kernel@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Weikang <guoweikang.kernel@gmail.com>
Cc: Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sam Creasey <sammy@sammy.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Oreoluwa Babatunde <quic_obabatun@quicinc.com>,
	rafael.j.wysocki@intel.com,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Ingo Molnar <mingo@kernel.org>,
	Dave Hansen <dave.hansen@intel.com>,
	Christian Brauner <brauner@kernel.org>,
	KP Singh <kpsingh@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	WANG Xuerui <kernel@xen0n.name>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Geoff Levand <geoff@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	kasan-dev@googlegroups.com,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-omap@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-pm@vger.kernel.org,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH v7] mm/memblock: Add memblock_alloc_or_panic interface
Date: Sun, 22 Dec 2024 19:15:37 +0800
Message-Id: <20241222111537.2720303-1-guoweikang.kernel@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Before SLUB initialization, various subsystems used memblock_alloc to
allocate memory. In most cases, when memory allocation fails, an immediate
panic is required. To simplify this behavior and reduce repetitive checks,
introduce `memblock_alloc_or_panic`. This function ensures that memory
allocation failures result in a panic automatically, improving code
readability and consistency across subsystems that require this behavior.

Changelog:
----------
v1: initial version
v2: add __memblock_alloc_or_panic support panic output caller
v3: panic output phys_addr_t use printk's %pap
v4: make __memblock_alloc_or_panic out-of-line, move to memblock.c
v6: Fix CI compile error
Links to CI: https://lore.kernel.org/oe-kbuild-all/202412221000.r1NzXJUO-lkp@intel.com/
v6: Fix CI compile warinigs
Links to CI: https://lore.kernel.org/oe-kbuild-all/202412221259.JuGNAUCq-lkp@intel.com/
v7: add chagelog and adjust function declaration alignment format
----------

Signed-off-by: Guo Weikang <guoweikang.kernel@gmail.com>
Reviewed-by: Andrew Morton <akpm@linux-foundation.org>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: Xi Ruoyao <xry111@xry111.site>
---
 arch/alpha/kernel/core_cia.c            |  5 +-
 arch/alpha/kernel/core_marvel.c         | 10 +---
 arch/alpha/kernel/pci.c                 | 13 +----
 arch/alpha/kernel/pci_iommu.c           | 10 +---
 arch/arm/kernel/setup.c                 | 10 +---
 arch/arm/mm/mmu.c                       | 17 ++----
 arch/arm/mm/nommu.c                     |  5 +-
 arch/arm64/kernel/setup.c               |  4 +-
 arch/loongarch/kernel/setup.c           |  2 +-
 arch/loongarch/mm/init.c                | 13 ++---
 arch/m68k/mm/init.c                     |  5 +-
 arch/m68k/mm/mcfmmu.c                   | 10 +---
 arch/m68k/mm/motorola.c                 |  5 +-
 arch/m68k/mm/sun3mmu.c                  | 10 +---
 arch/m68k/sun3/sun3dvma.c               |  6 +--
 arch/mips/kernel/setup.c                |  5 +-
 arch/openrisc/mm/ioremap.c              |  5 +-
 arch/parisc/mm/init.c                   | 20 ++-----
 arch/powerpc/kernel/dt_cpu_ftrs.c       | 10 ++--
 arch/powerpc/kernel/pci_32.c            |  5 +-
 arch/powerpc/kernel/setup-common.c      |  5 +-
 arch/powerpc/kernel/setup_32.c          |  8 +--
 arch/powerpc/mm/book3s32/mmu.c          |  5 +-
 arch/powerpc/mm/book3s64/pgtable.c      |  6 +--
 arch/powerpc/mm/kasan/init_book3e_64.c  |  8 +--
 arch/powerpc/mm/kasan/init_book3s_64.c  |  2 +-
 arch/powerpc/mm/nohash/mmu_context.c    | 16 ++----
 arch/powerpc/mm/pgtable_32.c            |  7 +--
 arch/powerpc/platforms/powermac/nvram.c |  5 +-
 arch/powerpc/platforms/powernv/opal.c   |  5 +-
 arch/powerpc/platforms/ps3/setup.c      |  5 +-
 arch/powerpc/sysdev/msi_bitmap.c        |  5 +-
 arch/riscv/kernel/setup.c               |  4 +-
 arch/riscv/mm/kasan_init.c              | 14 ++---
 arch/s390/kernel/numa.c                 |  5 +-
 arch/s390/kernel/setup.c                | 20 ++-----
 arch/s390/kernel/smp.c                  |  9 ++--
 arch/s390/kernel/topology.c             | 10 +---
 arch/sh/mm/init.c                       | 10 +---
 arch/sparc/kernel/prom_32.c             |  4 +-
 arch/sparc/mm/srmmu.c                   | 14 ++---
 arch/um/drivers/net_kern.c              |  5 +-
 arch/um/drivers/vector_kern.c           |  5 +-
 arch/um/kernel/load_file.c              |  4 +-
 arch/x86/coco/sev/core.c                |  4 +-
 arch/x86/kernel/acpi/boot.c             |  5 +-
 arch/x86/kernel/apic/io_apic.c          |  9 +---
 arch/x86/kernel/e820.c                  |  5 +-
 arch/x86/platform/olpc/olpc_dt.c        |  6 +--
 arch/x86/xen/p2m.c                      |  8 +--
 arch/xtensa/mm/kasan_init.c             |  6 +--
 drivers/clk/ti/clk.c                    |  5 +-
 drivers/macintosh/smu.c                 |  6 +--
 drivers/of/fdt.c                        |  8 +--
 drivers/of/unittest.c                   |  8 +--
 include/linux/memblock.h                |  6 +++
 init/main.c                             | 18 ++-----
 kernel/power/snapshot.c                 |  5 +-
 lib/cpumask.c                           |  5 +-
 mm/kmsan/shadow.c                       |  8 +--
 mm/memblock.c                           | 20 +++++++
 mm/numa.c                               |  8 +--
 mm/percpu.c                             | 70 +++++--------------------
 mm/sparse.c                             |  5 +-
 64 files changed, 143 insertions(+), 423 deletions(-)

diff --git a/arch/alpha/kernel/core_cia.c b/arch/alpha/kernel/core_cia.c
index ca3d9c732b61..6e577228e175 100644
--- a/arch/alpha/kernel/core_cia.c
+++ b/arch/alpha/kernel/core_cia.c
@@ -331,10 +331,7 @@ cia_prepare_tbia_workaround(int window)
 	long i;
 
 	/* Use minimal 1K map. */
-	ppte = memblock_alloc(CIA_BROKEN_TBIA_SIZE, 32768);
-	if (!ppte)
-		panic("%s: Failed to allocate %u bytes align=0x%x\n",
-		      __func__, CIA_BROKEN_TBIA_SIZE, 32768);
+	ppte = memblock_alloc_or_panic(CIA_BROKEN_TBIA_SIZE, 32768);
 	pte = (virt_to_phys(ppte) >> (PAGE_SHIFT - 1)) | 1;
 
 	for (i = 0; i < CIA_BROKEN_TBIA_SIZE / sizeof(unsigned long); ++i)
diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_marvel.c
index b22248044bf0..b1bfbd11980d 100644
--- a/arch/alpha/kernel/core_marvel.c
+++ b/arch/alpha/kernel/core_marvel.c
@@ -81,10 +81,7 @@ mk_resource_name(int pe, int port, char *str)
 	char *name;
 	
 	sprintf(tmp, "PCI %s PE %d PORT %d", str, pe, port);
-	name = memblock_alloc(strlen(tmp) + 1, SMP_CACHE_BYTES);
-	if (!name)
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      strlen(tmp) + 1);
+	name = memblock_alloc_or_panic(strlen(tmp) + 1, SMP_CACHE_BYTES);
 	strcpy(name, tmp);
 
 	return name;
@@ -119,10 +116,7 @@ alloc_io7(unsigned int pe)
 		return NULL;
 	}
 
-	io7 = memblock_alloc(sizeof(*io7), SMP_CACHE_BYTES);
-	if (!io7)
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      sizeof(*io7));
+	io7 = memblock_alloc_or_panic(sizeof(*io7), SMP_CACHE_BYTES);
 	io7->pe = pe;
 	raw_spin_lock_init(&io7->irq_lock);
 
diff --git a/arch/alpha/kernel/pci.c b/arch/alpha/kernel/pci.c
index 4458eb7f44f0..8e9b4ac86b7e 100644
--- a/arch/alpha/kernel/pci.c
+++ b/arch/alpha/kernel/pci.c
@@ -391,10 +391,7 @@ alloc_pci_controller(void)
 {
 	struct pci_controller *hose;
 
-	hose = memblock_alloc(sizeof(*hose), SMP_CACHE_BYTES);
-	if (!hose)
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      sizeof(*hose));
+	hose = memblock_alloc_or_panic(sizeof(*hose), SMP_CACHE_BYTES);
 
 	*hose_tail = hose;
 	hose_tail = &hose->next;
@@ -405,13 +402,7 @@ alloc_pci_controller(void)
 struct resource * __init
 alloc_resource(void)
 {
-	void *ptr = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);
-
-	if (!ptr)
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      sizeof(struct resource));
-
-	return ptr;
+	return memblock_alloc_or_panic(sizeof(struct resource), SMP_CACHE_BYTES);
 }
 
 
diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index 7fcf3e9b7103..681f56089d9c 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -71,14 +71,8 @@ iommu_arena_new_node(int nid, struct pci_controller *hose, dma_addr_t base,
 	if (align < mem_size)
 		align = mem_size;
 
-	arena = memblock_alloc(sizeof(*arena), SMP_CACHE_BYTES);
-	if (!arena)
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      sizeof(*arena));
-	arena->ptes = memblock_alloc(mem_size, align);
-	if (!arena->ptes)
-		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-		      __func__, mem_size, align);
+	arena = memblock_alloc_or_panic(sizeof(*arena), SMP_CACHE_BYTES);
+	arena->ptes = memblock_alloc_or_panic(mem_size, align);
 
 	spin_lock_init(&arena->lock);
 	arena->hose = hose;
diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index e6a857bf0ce6..a41c93988d2c 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -880,10 +880,7 @@ static void __init request_standard_resources(const struct machine_desc *mdesc)
 		 */
 		boot_alias_start = phys_to_idmap(start);
 		if (arm_has_idmap_alias() && boot_alias_start != IDMAP_INVALID_ADDR) {
-			res = memblock_alloc(sizeof(*res), SMP_CACHE_BYTES);
-			if (!res)
-				panic("%s: Failed to allocate %zu bytes\n",
-				      __func__, sizeof(*res));
+			res = memblock_alloc_or_panic(sizeof(*res), SMP_CACHE_BYTES);
 			res->name = "System RAM (boot alias)";
 			res->start = boot_alias_start;
 			res->end = phys_to_idmap(res_end);
@@ -891,10 +888,7 @@ static void __init request_standard_resources(const struct machine_desc *mdesc)
 			request_resource(&iomem_resource, res);
 		}
 
-		res = memblock_alloc(sizeof(*res), SMP_CACHE_BYTES);
-		if (!res)
-			panic("%s: Failed to allocate %zu bytes\n", __func__,
-			      sizeof(*res));
+		res = memblock_alloc_or_panic(sizeof(*res), SMP_CACHE_BYTES);
 		res->name  = "System RAM";
 		res->start = start;
 		res->end = res_end;
diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
index f5b7a16c5803..f02f872ea8a9 100644
--- a/arch/arm/mm/mmu.c
+++ b/arch/arm/mm/mmu.c
@@ -726,13 +726,8 @@ EXPORT_SYMBOL(phys_mem_access_prot);
 
 static void __init *early_alloc(unsigned long sz)
 {
-	void *ptr = memblock_alloc(sz, sz);
+	return memblock_alloc_or_panic(sz, sz);
 
-	if (!ptr)
-		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-		      __func__, sz, sz);
-
-	return ptr;
 }
 
 static void *__init late_alloc(unsigned long sz)
@@ -1027,10 +1022,7 @@ void __init iotable_init(struct map_desc *io_desc, int nr)
 	if (!nr)
 		return;
 
-	svm = memblock_alloc(sizeof(*svm) * nr, __alignof__(*svm));
-	if (!svm)
-		panic("%s: Failed to allocate %zu bytes align=0x%zx\n",
-		      __func__, sizeof(*svm) * nr, __alignof__(*svm));
+	svm = memblock_alloc_or_panic(sizeof(*svm) * nr, __alignof__(*svm));
 
 	for (md = io_desc; nr; md++, nr--) {
 		create_mapping(md);
@@ -1052,10 +1044,7 @@ void __init vm_reserve_area_early(unsigned long addr, unsigned long size,
 	struct vm_struct *vm;
 	struct static_vm *svm;
 
-	svm = memblock_alloc(sizeof(*svm), __alignof__(*svm));
-	if (!svm)
-		panic("%s: Failed to allocate %zu bytes align=0x%zx\n",
-		      __func__, sizeof(*svm), __alignof__(*svm));
+	svm = memblock_alloc_or_panic(sizeof(*svm), __alignof__(*svm));
 
 	vm = &svm->vm;
 	vm->addr = (void *)addr;
diff --git a/arch/arm/mm/nommu.c b/arch/arm/mm/nommu.c
index c415f3859b20..1a8f6914ee59 100644
--- a/arch/arm/mm/nommu.c
+++ b/arch/arm/mm/nommu.c
@@ -162,10 +162,7 @@ void __init paging_init(const struct machine_desc *mdesc)
 	mpu_setup();
 
 	/* allocate the zero page. */
-	zero_page = (void *)memblock_alloc(PAGE_SIZE, PAGE_SIZE);
-	if (!zero_page)
-		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-		      __func__, PAGE_SIZE, PAGE_SIZE);
+	zero_page = (void *)memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
 
 	bootmem_init();
 
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 4f613e8e0745..85104587f849 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -223,9 +223,7 @@ static void __init request_standard_resources(void)
 
 	num_standard_resources = memblock.memory.cnt;
 	res_size = num_standard_resources * sizeof(*standard_resources);
-	standard_resources = memblock_alloc(res_size, SMP_CACHE_BYTES);
-	if (!standard_resources)
-		panic("%s: Failed to allocate %zu bytes\n", __func__, res_size);
+	standard_resources = memblock_alloc_or_panic(res_size, SMP_CACHE_BYTES);
 
 	for_each_mem_region(region) {
 		res = &standard_resources[i++];
diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 56934fe58170..edcfdfcad7d2 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -431,7 +431,7 @@ static void __init resource_init(void)
 
 	num_standard_resources = memblock.memory.cnt;
 	res_size = num_standard_resources * sizeof(*standard_resources);
-	standard_resources = memblock_alloc(res_size, SMP_CACHE_BYTES);
+	standard_resources = memblock_alloc_or_panic(res_size, SMP_CACHE_BYTES);
 
 	for_each_mem_region(region) {
 		res = &standard_resources[i++];
diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index 188b52bbb254..ca5aa5f46a9f 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -174,9 +174,7 @@ pte_t * __init populate_kernel_pte(unsigned long addr)
 	pmd_t *pmd;
 
 	if (p4d_none(p4dp_get(p4d))) {
-		pud = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
-		if (!pud)
-			panic("%s: Failed to allocate memory\n", __func__);
+		pud = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
 		p4d_populate(&init_mm, p4d, pud);
 #ifndef __PAGETABLE_PUD_FOLDED
 		pud_init(pud);
@@ -185,9 +183,7 @@ pte_t * __init populate_kernel_pte(unsigned long addr)
 
 	pud = pud_offset(p4d, addr);
 	if (pud_none(pudp_get(pud))) {
-		pmd = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
-		if (!pmd)
-			panic("%s: Failed to allocate memory\n", __func__);
+		pmd = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
 		pud_populate(&init_mm, pud, pmd);
 #ifndef __PAGETABLE_PMD_FOLDED
 		pmd_init(pmd);
@@ -198,10 +194,7 @@ pte_t * __init populate_kernel_pte(unsigned long addr)
 	if (!pmd_present(pmdp_get(pmd))) {
 		pte_t *pte;
 
-		pte = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
-		if (!pte)
-			panic("%s: Failed to allocate memory\n", __func__);
-
+		pte = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
 		pmd_populate_kernel(&init_mm, pmd, pte);
 		kernel_pte_init(pte);
 	}
diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
index 1b47bec15832..8b11d0d545aa 100644
--- a/arch/m68k/mm/init.c
+++ b/arch/m68k/mm/init.c
@@ -68,10 +68,7 @@ void __init paging_init(void)
 
 	high_memory = (void *) end_mem;
 
-	empty_zero_page = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
-	if (!empty_zero_page)
-		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-		      __func__, PAGE_SIZE, PAGE_SIZE);
+	empty_zero_page = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
 	max_zone_pfn[ZONE_DMA] = end_mem >> PAGE_SHIFT;
 	free_area_init(max_zone_pfn);
 }
diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
index 9a6fa342e872..19a75029036c 100644
--- a/arch/m68k/mm/mcfmmu.c
+++ b/arch/m68k/mm/mcfmmu.c
@@ -42,20 +42,14 @@ void __init paging_init(void)
 	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
 	int i;
 
-	empty_zero_page = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
-	if (!empty_zero_page)
-		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-		      __func__, PAGE_SIZE, PAGE_SIZE);
+	empty_zero_page = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
 
 	pg_dir = swapper_pg_dir;
 	memset(swapper_pg_dir, 0, sizeof(swapper_pg_dir));
 
 	size = num_pages * sizeof(pte_t);
 	size = (size + PAGE_SIZE) & ~(PAGE_SIZE-1);
-	next_pgtable = (unsigned long) memblock_alloc(size, PAGE_SIZE);
-	if (!next_pgtable)
-		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-		      __func__, size, PAGE_SIZE);
+	next_pgtable = (unsigned long) memblock_alloc_or_panic(size, PAGE_SIZE);
 
 	pg_dir += PAGE_OFFSET >> PGDIR_SHIFT;
 
diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index c1761d309fc6..795dd1f2b24f 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -491,10 +491,7 @@ void __init paging_init(void)
 	 * initialize the bad page table and bad page to point
 	 * to a couple of allocated pages
 	 */
-	empty_zero_page = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
-	if (!empty_zero_page)
-		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-		      __func__, PAGE_SIZE, PAGE_SIZE);
+	empty_zero_page = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
 
 	/*
 	 * Set up SFC/DFC registers
diff --git a/arch/m68k/mm/sun3mmu.c b/arch/m68k/mm/sun3mmu.c
index 494739c1783e..1ecf6bdd08bf 100644
--- a/arch/m68k/mm/sun3mmu.c
+++ b/arch/m68k/mm/sun3mmu.c
@@ -44,10 +44,7 @@ void __init paging_init(void)
 	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0, };
 	unsigned long size;
 
-	empty_zero_page = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
-	if (!empty_zero_page)
-		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-		      __func__, PAGE_SIZE, PAGE_SIZE);
+	empty_zero_page = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
 
 	address = PAGE_OFFSET;
 	pg_dir = swapper_pg_dir;
@@ -57,10 +54,7 @@ void __init paging_init(void)
 	size = num_pages * sizeof(pte_t);
 	size = (size + PAGE_SIZE) & ~(PAGE_SIZE-1);
 
-	next_pgtable = (unsigned long)memblock_alloc(size, PAGE_SIZE);
-	if (!next_pgtable)
-		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-		      __func__, size, PAGE_SIZE);
+	next_pgtable = (unsigned long)memblock_alloc_or_panic(size, PAGE_SIZE);
 	bootmem_end = (next_pgtable + size + PAGE_SIZE) & PAGE_MASK;
 
 	/* Map whole memory from PAGE_OFFSET (0x0E000000) */
diff --git a/arch/m68k/sun3/sun3dvma.c b/arch/m68k/sun3/sun3dvma.c
index 6ebf52740ad7..225fc735e466 100644
--- a/arch/m68k/sun3/sun3dvma.c
+++ b/arch/m68k/sun3/sun3dvma.c
@@ -252,12 +252,8 @@ void __init dvma_init(void)
 
 	list_add(&(hole->list), &hole_list);
 
-	iommu_use = memblock_alloc(IOMMU_TOTAL_ENTRIES * sizeof(unsigned long),
+	iommu_use = memblock_alloc_or_panic(IOMMU_TOTAL_ENTRIES * sizeof(unsigned long),
 				   SMP_CACHE_BYTES);
-	if (!iommu_use)
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      IOMMU_TOTAL_ENTRIES * sizeof(unsigned long));
-
 	dvma_unmap_iommu(DVMA_START, DVMA_SIZE);
 
 	sun3_dvma_init();
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 12a1a4ffb602..fbfe0771317e 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -704,10 +704,7 @@ static void __init resource_init(void)
 	for_each_mem_range(i, &start, &end) {
 		struct resource *res;
 
-		res = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);
-		if (!res)
-			panic("%s: Failed to allocate %zu bytes\n", __func__,
-			      sizeof(struct resource));
+		res = memblock_alloc_or_panic(sizeof(struct resource), SMP_CACHE_BYTES);
 
 		res->start = start;
 		/*
diff --git a/arch/openrisc/mm/ioremap.c b/arch/openrisc/mm/ioremap.c
index f59ea4c10b0f..8e63e86251ca 100644
--- a/arch/openrisc/mm/ioremap.c
+++ b/arch/openrisc/mm/ioremap.c
@@ -38,10 +38,7 @@ pte_t __ref *pte_alloc_one_kernel(struct mm_struct *mm)
 	if (likely(mem_init_done)) {
 		pte = (pte_t *)get_zeroed_page(GFP_KERNEL);
 	} else {
-		pte = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
-		if (!pte)
-			panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-			      __func__, PAGE_SIZE, PAGE_SIZE);
+		pte = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
 	}
 
 	return pte;
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 96970fa75e4a..61c0a2477072 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -377,10 +377,8 @@ static void __ref map_pages(unsigned long start_vaddr,
 
 #if CONFIG_PGTABLE_LEVELS == 3
 		if (pud_none(*pud)) {
-			pmd = memblock_alloc(PAGE_SIZE << PMD_TABLE_ORDER,
+			pmd = memblock_alloc_or_panic(PAGE_SIZE << PMD_TABLE_ORDER,
 					     PAGE_SIZE << PMD_TABLE_ORDER);
-			if (!pmd)
-				panic("pmd allocation failed.\n");
 			pud_populate(NULL, pud, pmd);
 		}
 #endif
@@ -388,9 +386,7 @@ static void __ref map_pages(unsigned long start_vaddr,
 		pmd = pmd_offset(pud, vaddr);
 		for (tmp1 = start_pmd; tmp1 < PTRS_PER_PMD; tmp1++, pmd++) {
 			if (pmd_none(*pmd)) {
-				pg_table = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
-				if (!pg_table)
-					panic("page table allocation failed\n");
+				pg_table = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
 				pmd_populate_kernel(NULL, pmd, pg_table);
 			}
 
@@ -648,9 +644,7 @@ static void __init pagetable_init(void)
 	}
 #endif
 
-	empty_zero_page = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
-	if (!empty_zero_page)
-		panic("zero page allocation failed.\n");
+	empty_zero_page = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
 
 }
 
@@ -687,19 +681,15 @@ static void __init fixmap_init(void)
 
 #if CONFIG_PGTABLE_LEVELS == 3
 	if (pud_none(*pud)) {
-		pmd = memblock_alloc(PAGE_SIZE << PMD_TABLE_ORDER,
+		pmd = memblock_alloc_or_panic(PAGE_SIZE << PMD_TABLE_ORDER,
 				     PAGE_SIZE << PMD_TABLE_ORDER);
-		if (!pmd)
-			panic("fixmap: pmd allocation failed.\n");
 		pud_populate(NULL, pud, pmd);
 	}
 #endif
 
 	pmd = pmd_offset(pud, addr);
 	do {
-		pte_t *pte = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
-		if (!pte)
-			panic("fixmap: pte allocation failed.\n");
+		pte_t *pte = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
 
 		pmd_populate_kernel(&init_mm, pmd, pte);
 
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 1bee15c013e7..3af6c06af02f 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -1087,12 +1087,10 @@ static int __init dt_cpu_ftrs_scan_callback(unsigned long node, const char
 	/* Count and allocate space for cpu features */
 	of_scan_flat_dt_subnodes(node, count_cpufeatures_subnodes,
 						&nr_dt_cpu_features);
-	dt_cpu_features = memblock_alloc(sizeof(struct dt_cpu_feature) * nr_dt_cpu_features, PAGE_SIZE);
-	if (!dt_cpu_features)
-		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
-		      __func__,
-		      sizeof(struct dt_cpu_feature) * nr_dt_cpu_features,
-		      PAGE_SIZE);
+	dt_cpu_features =
+		memblock_alloc_or_panic(
+			sizeof(struct dt_cpu_feature) * nr_dt_cpu_features,
+			PAGE_SIZE);
 
 	cpufeatures_setup_start(isa);
 
diff --git a/arch/powerpc/kernel/pci_32.c b/arch/powerpc/kernel/pci_32.c
index ce0c8623e563..f8a3bd8cfae4 100644
--- a/arch/powerpc/kernel/pci_32.c
+++ b/arch/powerpc/kernel/pci_32.c
@@ -213,11 +213,8 @@ pci_create_OF_bus_map(void)
 	struct property* of_prop;
 	struct device_node *dn;
 
-	of_prop = memblock_alloc(sizeof(struct property) + 256,
+	of_prop = memblock_alloc_or_panic(sizeof(struct property) + 256,
 				 SMP_CACHE_BYTES);
-	if (!of_prop)
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      sizeof(struct property) + 256);
 	dn = of_find_node_by_path("/");
 	if (dn) {
 		memset(of_prop, -1, sizeof(struct property) + 256);
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 6fa179448c33..f3ea1329c566 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -458,11 +458,8 @@ void __init smp_setup_cpu_maps(void)
 
 	DBG("smp_setup_cpu_maps()\n");
 
-	cpu_to_phys_id = memblock_alloc(nr_cpu_ids * sizeof(u32),
+	cpu_to_phys_id = memblock_alloc_or_panic(nr_cpu_ids * sizeof(u32),
 					__alignof__(u32));
-	if (!cpu_to_phys_id)
-		panic("%s: Failed to allocate %zu bytes align=0x%zx\n",
-		      __func__, nr_cpu_ids * sizeof(u32), __alignof__(u32));
 
 	for_each_node_by_type(dn, "cpu") {
 		const __be32 *intserv;
diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
index 75dbf3e0d9c4..5a1bf501fbe1 100644
--- a/arch/powerpc/kernel/setup_32.c
+++ b/arch/powerpc/kernel/setup_32.c
@@ -140,13 +140,7 @@ arch_initcall(ppc_init);
 
 static void *__init alloc_stack(void)
 {
-	void *ptr = memblock_alloc(THREAD_SIZE, THREAD_ALIGN);
-
-	if (!ptr)
-		panic("cannot allocate %d bytes for stack at %pS\n",
-		      THREAD_SIZE, (void *)_RET_IP_);
-
-	return ptr;
+	return memblock_alloc_or_panic(THREAD_SIZE, THREAD_ALIGN);
 }
 
 void __init irqstack_early_init(void)
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 6978344edcb4..be9c4106e22f 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -377,10 +377,7 @@ void __init MMU_init_hw(void)
 	 * Find some memory for the hash table.
 	 */
 	if ( ppc_md.progress ) ppc_md.progress("hash:find piece", 0x322);
-	Hash = memblock_alloc(Hash_size, Hash_size);
-	if (!Hash)
-		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-		      __func__, Hash_size, Hash_size);
+	Hash = memblock_alloc_or_panic(Hash_size, Hash_size);
 	_SDR1 = __pa(Hash) | SDR1_LOW_BITS;
 
 	pr_info("Total memory = %lldMB; using %ldkB for hash table\n",
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 374542528080..0b1f419b7404 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -330,11 +330,7 @@ void __init mmu_partition_table_init(void)
 	unsigned long ptcr;
 
 	/* Initialize the Partition Table with no entries */
-	partition_tb = memblock_alloc(patb_size, patb_size);
-	if (!partition_tb)
-		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-		      __func__, patb_size, patb_size);
-
+	partition_tb = memblock_alloc_or_panic(patb_size, patb_size);
 	ptcr = __pa(partition_tb) | (PATB_SIZE_SHIFT - 12);
 	set_ptcr_when_no_uv(ptcr);
 	powernv_set_nmmu_ptcr(ptcr);
diff --git a/arch/powerpc/mm/kasan/init_book3e_64.c b/arch/powerpc/mm/kasan/init_book3e_64.c
index 43c03b84ff32..60c78aac0f63 100644
--- a/arch/powerpc/mm/kasan/init_book3e_64.c
+++ b/arch/powerpc/mm/kasan/init_book3e_64.c
@@ -40,19 +40,19 @@ static int __init kasan_map_kernel_page(unsigned long ea, unsigned long pa, pgpr
 	pgdp = pgd_offset_k(ea);
 	p4dp = p4d_offset(pgdp, ea);
 	if (kasan_pud_table(*p4dp)) {
-		pudp = memblock_alloc(PUD_TABLE_SIZE, PUD_TABLE_SIZE);
+		pudp = memblock_alloc_or_panic(PUD_TABLE_SIZE, PUD_TABLE_SIZE);
 		memcpy(pudp, kasan_early_shadow_pud, PUD_TABLE_SIZE);
 		p4d_populate(&init_mm, p4dp, pudp);
 	}
 	pudp = pud_offset(p4dp, ea);
 	if (kasan_pmd_table(*pudp)) {
-		pmdp = memblock_alloc(PMD_TABLE_SIZE, PMD_TABLE_SIZE);
+		pmdp = memblock_alloc_or_panic(PMD_TABLE_SIZE, PMD_TABLE_SIZE);
 		memcpy(pmdp, kasan_early_shadow_pmd, PMD_TABLE_SIZE);
 		pud_populate(&init_mm, pudp, pmdp);
 	}
 	pmdp = pmd_offset(pudp, ea);
 	if (kasan_pte_table(*pmdp)) {
-		ptep = memblock_alloc(PTE_TABLE_SIZE, PTE_TABLE_SIZE);
+		ptep = memblock_alloc_or_panic(PTE_TABLE_SIZE, PTE_TABLE_SIZE);
 		memcpy(ptep, kasan_early_shadow_pte, PTE_TABLE_SIZE);
 		pmd_populate_kernel(&init_mm, pmdp, ptep);
 	}
@@ -74,7 +74,7 @@ static void __init kasan_init_phys_region(void *start, void *end)
 	k_start = ALIGN_DOWN((unsigned long)kasan_mem_to_shadow(start), PAGE_SIZE);
 	k_end = ALIGN((unsigned long)kasan_mem_to_shadow(end), PAGE_SIZE);
 
-	va = memblock_alloc(k_end - k_start, PAGE_SIZE);
+	va = memblock_alloc_or_panic(k_end - k_start, PAGE_SIZE);
 	for (k_cur = k_start; k_cur < k_end; k_cur += PAGE_SIZE, va += PAGE_SIZE)
 		kasan_map_kernel_page(k_cur, __pa(va), PAGE_KERNEL);
 }
diff --git a/arch/powerpc/mm/kasan/init_book3s_64.c b/arch/powerpc/mm/kasan/init_book3s_64.c
index 3fb5ce4f48f4..7d959544c077 100644
--- a/arch/powerpc/mm/kasan/init_book3s_64.c
+++ b/arch/powerpc/mm/kasan/init_book3s_64.c
@@ -32,7 +32,7 @@ static void __init kasan_init_phys_region(void *start, void *end)
 	k_start = ALIGN_DOWN((unsigned long)kasan_mem_to_shadow(start), PAGE_SIZE);
 	k_end = ALIGN((unsigned long)kasan_mem_to_shadow(end), PAGE_SIZE);
 
-	va = memblock_alloc(k_end - k_start, PAGE_SIZE);
+	va = memblock_alloc_or_panic(k_end - k_start, PAGE_SIZE);
 	for (k_cur = k_start; k_cur < k_end; k_cur += PAGE_SIZE, va += PAGE_SIZE)
 		map_kernel_page(k_cur, __pa(va), PAGE_KERNEL);
 }
diff --git a/arch/powerpc/mm/nohash/mmu_context.c b/arch/powerpc/mm/nohash/mmu_context.c
index 0b181da40ddb..a1a4e697251a 100644
--- a/arch/powerpc/mm/nohash/mmu_context.c
+++ b/arch/powerpc/mm/nohash/mmu_context.c
@@ -385,21 +385,11 @@ void __init mmu_context_init(void)
 	/*
 	 * Allocate the maps used by context management
 	 */
-	context_map = memblock_alloc(CTX_MAP_SIZE, SMP_CACHE_BYTES);
-	if (!context_map)
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      CTX_MAP_SIZE);
-	context_mm = memblock_alloc(sizeof(void *) * (LAST_CONTEXT + 1),
+	context_map = memblock_alloc_or_panic(CTX_MAP_SIZE, SMP_CACHE_BYTES);
+	context_mm = memblock_alloc_or_panic(sizeof(void *) * (LAST_CONTEXT + 1),
 				    SMP_CACHE_BYTES);
-	if (!context_mm)
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      sizeof(void *) * (LAST_CONTEXT + 1));
 	if (IS_ENABLED(CONFIG_SMP)) {
-		stale_map[boot_cpuid] = memblock_alloc(CTX_MAP_SIZE, SMP_CACHE_BYTES);
-		if (!stale_map[boot_cpuid])
-			panic("%s: Failed to allocate %zu bytes\n", __func__,
-			      CTX_MAP_SIZE);
-
+		stale_map[boot_cpuid] = memblock_alloc_or_panic(CTX_MAP_SIZE, SMP_CACHE_BYTES);
 		cpuhp_setup_state_nocalls(CPUHP_POWERPC_MMU_CTX_PREPARE,
 					  "powerpc/mmu/ctx:prepare",
 					  mmu_ctx_cpu_prepare, mmu_ctx_cpu_dead);
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 787b22206386..15276068f657 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -50,13 +50,8 @@ notrace void __init early_ioremap_init(void)
 
 void __init *early_alloc_pgtable(unsigned long size)
 {
-	void *ptr = memblock_alloc(size, size);
+	return memblock_alloc_or_panic(size, size);
 
-	if (!ptr)
-		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-		      __func__, size, size);
-
-	return ptr;
 }
 
 pte_t __init *early_pte_alloc_kernel(pmd_t *pmdp, unsigned long va)
diff --git a/arch/powerpc/platforms/powermac/nvram.c b/arch/powerpc/platforms/powermac/nvram.c
index fe2e0249cbc2..a112d26185a0 100644
--- a/arch/powerpc/platforms/powermac/nvram.c
+++ b/arch/powerpc/platforms/powermac/nvram.c
@@ -514,10 +514,7 @@ static int __init core99_nvram_setup(struct device_node *dp, unsigned long addr)
 		printk(KERN_ERR "nvram: no address\n");
 		return -EINVAL;
 	}
-	nvram_image = memblock_alloc(NVRAM_SIZE, SMP_CACHE_BYTES);
-	if (!nvram_image)
-		panic("%s: Failed to allocate %u bytes\n", __func__,
-		      NVRAM_SIZE);
+	nvram_image = memblock_alloc_or_panic(NVRAM_SIZE, SMP_CACHE_BYTES);
 	nvram_data = ioremap(addr, NVRAM_SIZE*2);
 	nvram_naddrs = 1; /* Make sure we get the correct case */
 
diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 5d0f35bb917e..09bd93464b4f 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -180,10 +180,7 @@ int __init early_init_dt_scan_recoverable_ranges(unsigned long node,
 	/*
 	 * Allocate a buffer to hold the MC recoverable ranges.
 	 */
-	mc_recoverable_range = memblock_alloc(size, __alignof__(u64));
-	if (!mc_recoverable_range)
-		panic("%s: Failed to allocate %u bytes align=0x%lx\n",
-		      __func__, size, __alignof__(u64));
+	mc_recoverable_range = memblock_alloc_or_panic(size, __alignof__(u64));
 
 	for (i = 0; i < mc_recoverable_range_len; i++) {
 		mc_recoverable_range[i].start_addr =
diff --git a/arch/powerpc/platforms/ps3/setup.c b/arch/powerpc/platforms/ps3/setup.c
index 5144f11359f7..150c09b58ae8 100644
--- a/arch/powerpc/platforms/ps3/setup.c
+++ b/arch/powerpc/platforms/ps3/setup.c
@@ -115,10 +115,7 @@ static void __init prealloc(struct ps3_prealloc *p)
 	if (!p->size)
 		return;
 
-	p->address = memblock_alloc(p->size, p->align);
-	if (!p->address)
-		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-		      __func__, p->size, p->align);
+	p->address = memblock_alloc_or_panic(p->size, p->align);
 
 	printk(KERN_INFO "%s: %lu bytes at %p\n", p->name, p->size,
 	       p->address);
diff --git a/arch/powerpc/sysdev/msi_bitmap.c b/arch/powerpc/sysdev/msi_bitmap.c
index 0b6e37f3ffb8..456a4f64ae0a 100644
--- a/arch/powerpc/sysdev/msi_bitmap.c
+++ b/arch/powerpc/sysdev/msi_bitmap.c
@@ -124,10 +124,7 @@ int __ref msi_bitmap_alloc(struct msi_bitmap *bmp, unsigned int irq_count,
 	if (bmp->bitmap_from_slab)
 		bmp->bitmap = kzalloc(size, GFP_KERNEL);
 	else {
-		bmp->bitmap = memblock_alloc(size, SMP_CACHE_BYTES);
-		if (!bmp->bitmap)
-			panic("%s: Failed to allocate %u bytes\n", __func__,
-			      size);
+		bmp->bitmap = memblock_alloc_or_panic(size, SMP_CACHE_BYTES);
 		/* the bitmap won't be freed from memblock allocator */
 		kmemleak_not_leak(bmp->bitmap);
 	}
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 45010e71df86..f1793630fc51 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -147,9 +147,7 @@ static void __init init_resources(void)
 	res_idx = num_resources - 1;
 
 	mem_res_sz = num_resources * sizeof(*mem_res);
-	mem_res = memblock_alloc(mem_res_sz, SMP_CACHE_BYTES);
-	if (!mem_res)
-		panic("%s: Failed to allocate %zu bytes\n", __func__, mem_res_sz);
+	mem_res = memblock_alloc_or_panic(mem_res_sz, SMP_CACHE_BYTES);
 
 	/*
 	 * Start by adding the reserved regions, if they overlap
diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index c301c8d291d2..41c635d6aca4 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -32,7 +32,7 @@ static void __init kasan_populate_pte(pmd_t *pmd, unsigned long vaddr, unsigned
 	pte_t *ptep, *p;
 
 	if (pmd_none(pmdp_get(pmd))) {
-		p = memblock_alloc(PTRS_PER_PTE * sizeof(pte_t), PAGE_SIZE);
+		p = memblock_alloc_or_panic(PTRS_PER_PTE * sizeof(pte_t), PAGE_SIZE);
 		set_pmd(pmd, pfn_pmd(PFN_DOWN(__pa(p)), PAGE_TABLE));
 	}
 
@@ -54,7 +54,7 @@ static void __init kasan_populate_pmd(pud_t *pud, unsigned long vaddr, unsigned
 	unsigned long next;
 
 	if (pud_none(pudp_get(pud))) {
-		p = memblock_alloc(PTRS_PER_PMD * sizeof(pmd_t), PAGE_SIZE);
+		p = memblock_alloc_or_panic(PTRS_PER_PMD * sizeof(pmd_t), PAGE_SIZE);
 		set_pud(pud, pfn_pud(PFN_DOWN(__pa(p)), PAGE_TABLE));
 	}
 
@@ -85,7 +85,7 @@ static void __init kasan_populate_pud(p4d_t *p4d,
 	unsigned long next;
 
 	if (p4d_none(p4dp_get(p4d))) {
-		p = memblock_alloc(PTRS_PER_PUD * sizeof(pud_t), PAGE_SIZE);
+		p = memblock_alloc_or_panic(PTRS_PER_PUD * sizeof(pud_t), PAGE_SIZE);
 		set_p4d(p4d, pfn_p4d(PFN_DOWN(__pa(p)), PAGE_TABLE));
 	}
 
@@ -116,7 +116,7 @@ static void __init kasan_populate_p4d(pgd_t *pgd,
 	unsigned long next;
 
 	if (pgd_none(pgdp_get(pgd))) {
-		p = memblock_alloc(PTRS_PER_P4D * sizeof(p4d_t), PAGE_SIZE);
+		p = memblock_alloc_or_panic(PTRS_PER_P4D * sizeof(p4d_t), PAGE_SIZE);
 		set_pgd(pgd, pfn_pgd(PFN_DOWN(__pa(p)), PAGE_TABLE));
 	}
 
@@ -385,7 +385,7 @@ static void __init kasan_shallow_populate_pud(p4d_t *p4d,
 		next = pud_addr_end(vaddr, end);
 
 		if (pud_none(pudp_get(pud_k))) {
-			p = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
+			p = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
 			set_pud(pud_k, pfn_pud(PFN_DOWN(__pa(p)), PAGE_TABLE));
 			continue;
 		}
@@ -405,7 +405,7 @@ static void __init kasan_shallow_populate_p4d(pgd_t *pgd,
 		next = p4d_addr_end(vaddr, end);
 
 		if (p4d_none(p4dp_get(p4d_k))) {
-			p = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
+			p = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
 			set_p4d(p4d_k, pfn_p4d(PFN_DOWN(__pa(p)), PAGE_TABLE));
 			continue;
 		}
@@ -424,7 +424,7 @@ static void __init kasan_shallow_populate_pgd(unsigned long vaddr, unsigned long
 		next = pgd_addr_end(vaddr, end);
 
 		if (pgd_none(pgdp_get(pgd_k))) {
-			p = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
+			p = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
 			set_pgd(pgd_k, pfn_pgd(PFN_DOWN(__pa(p)), PAGE_TABLE));
 			continue;
 		}
diff --git a/arch/s390/kernel/numa.c b/arch/s390/kernel/numa.c
index ddc1448ea2e1..a33e20f73330 100644
--- a/arch/s390/kernel/numa.c
+++ b/arch/s390/kernel/numa.c
@@ -22,10 +22,7 @@ void __init numa_setup(void)
 	node_set(0, node_possible_map);
 	node_set_online(0);
 	for (nid = 0; nid < MAX_NUMNODES; nid++) {
-		NODE_DATA(nid) = memblock_alloc(sizeof(pg_data_t), 8);
-		if (!NODE_DATA(nid))
-			panic("%s: Failed to allocate %zu bytes align=0x%x\n",
-			      __func__, sizeof(pg_data_t), 8);
+		NODE_DATA(nid) = memblock_alloc_or_panic(sizeof(pg_data_t), 8);
 	}
 	NODE_DATA(0)->node_spanned_pages = memblock_end_of_DRAM() >> PAGE_SHIFT;
 	NODE_DATA(0)->node_id = 0;
diff --git a/arch/s390/kernel/setup.c b/arch/s390/kernel/setup.c
index 0ce550faf073..1298f0860733 100644
--- a/arch/s390/kernel/setup.c
+++ b/arch/s390/kernel/setup.c
@@ -376,11 +376,7 @@ static unsigned long __init stack_alloc_early(void)
 {
 	unsigned long stack;
 
-	stack = (unsigned long)memblock_alloc(THREAD_SIZE, THREAD_SIZE);
-	if (!stack) {
-		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-		      __func__, THREAD_SIZE, THREAD_SIZE);
-	}
+	stack = (unsigned long)memblock_alloc_or_panic(THREAD_SIZE, THREAD_SIZE);
 	return stack;
 }
 
@@ -504,10 +500,7 @@ static void __init setup_resources(void)
 	bss_resource.end = __pa_symbol(__bss_stop) - 1;
 
 	for_each_mem_range(i, &start, &end) {
-		res = memblock_alloc(sizeof(*res), 8);
-		if (!res)
-			panic("%s: Failed to allocate %zu bytes align=0x%x\n",
-			      __func__, sizeof(*res), 8);
+		res = memblock_alloc_or_panic(sizeof(*res), 8);
 		res->flags = IORESOURCE_BUSY | IORESOURCE_SYSTEM_RAM;
 
 		res->name = "System RAM";
@@ -526,10 +519,7 @@ static void __init setup_resources(void)
 			    std_res->start > res->end)
 				continue;
 			if (std_res->end > res->end) {
-				sub_res = memblock_alloc(sizeof(*sub_res), 8);
-				if (!sub_res)
-					panic("%s: Failed to allocate %zu bytes align=0x%x\n",
-					      __func__, sizeof(*sub_res), 8);
+				sub_res = memblock_alloc_or_panic(sizeof(*sub_res), 8);
 				*sub_res = *std_res;
 				sub_res->end = res->end;
 				std_res->start = res->end + 1;
@@ -816,9 +806,7 @@ static void __init setup_randomness(void)
 {
 	struct sysinfo_3_2_2 *vmms;
 
-	vmms = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
-	if (!vmms)
-		panic("Failed to allocate memory for sysinfo structure\n");
+	vmms = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
 	if (stsi(vmms, 3, 2, 2) == 0 && vmms->count)
 		add_device_randomness(&vmms->vm, sizeof(vmms->vm[0]) * vmms->count);
 	memblock_free(vmms, PAGE_SIZE);
diff --git a/arch/s390/kernel/smp.c b/arch/s390/kernel/smp.c
index 822d8e6f8717..d77aaefb59bd 100644
--- a/arch/s390/kernel/smp.c
+++ b/arch/s390/kernel/smp.c
@@ -611,9 +611,9 @@ void __init smp_save_dump_ipl_cpu(void)
 	if (!dump_available())
 		return;
 	sa = save_area_alloc(true);
-	regs = memblock_alloc(512, 8);
-	if (!sa || !regs)
+	if (!sa)
 		panic("could not allocate memory for boot CPU save area\n");
+	regs = memblock_alloc_or_panic(512, 8);
 	copy_oldmem_kernel(regs, __LC_FPREGS_SAVE_AREA, 512);
 	save_area_add_regs(sa, regs);
 	memblock_free(regs, 512);
@@ -792,10 +792,7 @@ void __init smp_detect_cpus(void)
 	u16 address;
 
 	/* Get CPU information */
-	info = memblock_alloc(sizeof(*info), 8);
-	if (!info)
-		panic("%s: Failed to allocate %zu bytes align=0x%x\n",
-		      __func__, sizeof(*info), 8);
+	info = memblock_alloc_or_panic(sizeof(*info), 8);
 	smp_get_core_info(info, 1);
 	/* Find boot CPU type */
 	if (sclp.has_core_type) {
diff --git a/arch/s390/kernel/topology.c b/arch/s390/kernel/topology.c
index 0fd56a1cadbd..cf5ee6032c0b 100644
--- a/arch/s390/kernel/topology.c
+++ b/arch/s390/kernel/topology.c
@@ -548,10 +548,7 @@ static void __init alloc_masks(struct sysinfo_15_1_x *info,
 		nr_masks *= info->mag[TOPOLOGY_NR_MAG - offset - 1 - i];
 	nr_masks = max(nr_masks, 1);
 	for (i = 0; i < nr_masks; i++) {
-		mask->next = memblock_alloc(sizeof(*mask->next), 8);
-		if (!mask->next)
-			panic("%s: Failed to allocate %zu bytes align=0x%x\n",
-			      __func__, sizeof(*mask->next), 8);
+		mask->next = memblock_alloc_or_panic(sizeof(*mask->next), 8);
 		mask = mask->next;
 	}
 }
@@ -569,10 +566,7 @@ void __init topology_init_early(void)
 	}
 	if (!MACHINE_HAS_TOPOLOGY)
 		goto out;
-	tl_info = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
-	if (!tl_info)
-		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-		      __func__, PAGE_SIZE, PAGE_SIZE);
+	tl_info = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
 	info = tl_info;
 	store_topology(info);
 	pr_info("The CPU configuration topology of the machine is: %d %d %d %d %d %d / %d\n",
diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
index 2a88b0c9e70f..289a2fecebef 100644
--- a/arch/sh/mm/init.c
+++ b/arch/sh/mm/init.c
@@ -137,10 +137,7 @@ static pmd_t * __init one_md_table_init(pud_t *pud)
 	if (pud_none(*pud)) {
 		pmd_t *pmd;
 
-		pmd = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
-		if (!pmd)
-			panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-			      __func__, PAGE_SIZE, PAGE_SIZE);
+		pmd = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
 		pud_populate(&init_mm, pud, pmd);
 		BUG_ON(pmd != pmd_offset(pud, 0));
 	}
@@ -153,10 +150,7 @@ static pte_t * __init one_page_table_init(pmd_t *pmd)
 	if (pmd_none(*pmd)) {
 		pte_t *pte;
 
-		pte = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
-		if (!pte)
-			panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-			      __func__, PAGE_SIZE, PAGE_SIZE);
+		pte = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
 		pmd_populate_kernel(&init_mm, pmd, pte);
 		BUG_ON(pte != pte_offset_kernel(pmd, 0));
 	}
diff --git a/arch/sparc/kernel/prom_32.c b/arch/sparc/kernel/prom_32.c
index 3df960c137f7..a67dd67f10c8 100644
--- a/arch/sparc/kernel/prom_32.c
+++ b/arch/sparc/kernel/prom_32.c
@@ -28,9 +28,7 @@ void * __init prom_early_alloc(unsigned long size)
 {
 	void *ret;
 
-	ret = memblock_alloc(size, SMP_CACHE_BYTES);
-	if (!ret)
-		panic("%s: Failed to allocate %lu bytes\n", __func__, size);
+	ret = memblock_alloc_or_panic(size, SMP_CACHE_BYTES);
 
 	prom_early_allocated += size;
 
diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index 9df51a62333d..e36c2a0ff748 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -277,19 +277,13 @@ static void __init srmmu_nocache_init(void)
 
 	bitmap_bits = srmmu_nocache_size >> SRMMU_NOCACHE_BITMAP_SHIFT;
 
-	srmmu_nocache_pool = memblock_alloc(srmmu_nocache_size,
+	srmmu_nocache_pool = memblock_alloc_or_panic(srmmu_nocache_size,
 					    SRMMU_NOCACHE_ALIGN_MAX);
-	if (!srmmu_nocache_pool)
-		panic("%s: Failed to allocate %lu bytes align=0x%x\n",
-		      __func__, srmmu_nocache_size, SRMMU_NOCACHE_ALIGN_MAX);
 	memset(srmmu_nocache_pool, 0, srmmu_nocache_size);
 
 	srmmu_nocache_bitmap =
-		memblock_alloc(BITS_TO_LONGS(bitmap_bits) * sizeof(long),
+		memblock_alloc_or_panic(BITS_TO_LONGS(bitmap_bits) * sizeof(long),
 			       SMP_CACHE_BYTES);
-	if (!srmmu_nocache_bitmap)
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      BITS_TO_LONGS(bitmap_bits) * sizeof(long));
 	bit_map_init(&srmmu_nocache_map, srmmu_nocache_bitmap, bitmap_bits);
 
 	srmmu_swapper_pg_dir = __srmmu_get_nocache(SRMMU_PGD_TABLE_SIZE, SRMMU_PGD_TABLE_SIZE);
@@ -452,9 +446,7 @@ static void __init sparc_context_init(int numctx)
 	unsigned long size;
 
 	size = numctx * sizeof(struct ctx_list);
-	ctx_list_pool = memblock_alloc(size, SMP_CACHE_BYTES);
-	if (!ctx_list_pool)
-		panic("%s: Failed to allocate %lu bytes\n", __func__, size);
+	ctx_list_pool = memblock_alloc_or_panic(size, SMP_CACHE_BYTES);
 
 	for (ctx = 0; ctx < numctx; ctx++) {
 		struct ctx_list *clist;
diff --git a/arch/um/drivers/net_kern.c b/arch/um/drivers/net_kern.c
index 75d04fb4994a..d5a9c5aabaec 100644
--- a/arch/um/drivers/net_kern.c
+++ b/arch/um/drivers/net_kern.c
@@ -636,10 +636,7 @@ static int __init eth_setup(char *str)
 		return 1;
 	}
 
-	new = memblock_alloc(sizeof(*new), SMP_CACHE_BYTES);
-	if (!new)
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      sizeof(*new));
+	new = memblock_alloc_or_panic(sizeof(*new), SMP_CACHE_BYTES);
 
 	INIT_LIST_HEAD(&new->list);
 	new->index = n;
diff --git a/arch/um/drivers/vector_kern.c b/arch/um/drivers/vector_kern.c
index 64c09db392c1..85b129e2b70b 100644
--- a/arch/um/drivers/vector_kern.c
+++ b/arch/um/drivers/vector_kern.c
@@ -1694,10 +1694,7 @@ static int __init vector_setup(char *str)
 				 str, error);
 		return 1;
 	}
-	new = memblock_alloc(sizeof(*new), SMP_CACHE_BYTES);
-	if (!new)
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      sizeof(*new));
+	new = memblock_alloc_or_panic(sizeof(*new), SMP_CACHE_BYTES);
 	INIT_LIST_HEAD(&new->list);
 	new->unit = n;
 	new->arguments = str;
diff --git a/arch/um/kernel/load_file.c b/arch/um/kernel/load_file.c
index 5cecd0e291fb..cb9d178ab7d8 100644
--- a/arch/um/kernel/load_file.c
+++ b/arch/um/kernel/load_file.c
@@ -48,9 +48,7 @@ void *uml_load_file(const char *filename, unsigned long long *size)
 		return NULL;
 	}
 
-	area = memblock_alloc(*size, SMP_CACHE_BYTES);
-	if (!area)
-		panic("%s: Failed to allocate %llu bytes\n", __func__, *size);
+	area = memblock_alloc_or_panic(*size, SMP_CACHE_BYTES);
 
 	if (__uml_load_file(filename, area, *size)) {
 		memblock_free(area, *size);
diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index 499b41953e3c..fa218270c1db 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -1567,9 +1567,7 @@ static void __init alloc_runtime_data(int cpu)
 		struct svsm_ca *caa;
 
 		/* Allocate the SVSM CA page if an SVSM is present */
-		caa = memblock_alloc(sizeof(*caa), PAGE_SIZE);
-		if (!caa)
-			panic("Can't allocate SVSM CA page\n");
+		caa = memblock_alloc_or_panic(sizeof(*caa), PAGE_SIZE);
 
 		per_cpu(svsm_caa, cpu) = caa;
 		per_cpu(svsm_caa_pa, cpu) = __pa(caa);
diff --git a/arch/x86/kernel/acpi/boot.c b/arch/x86/kernel/acpi/boot.c
index 3a44a9dc3fb7..7c15d6e83c37 100644
--- a/arch/x86/kernel/acpi/boot.c
+++ b/arch/x86/kernel/acpi/boot.c
@@ -911,11 +911,8 @@ static int __init acpi_parse_hpet(struct acpi_table_header *table)
 	 * the resource tree during the lateinit timeframe.
 	 */
 #define HPET_RESOURCE_NAME_SIZE 9
-	hpet_res = memblock_alloc(sizeof(*hpet_res) + HPET_RESOURCE_NAME_SIZE,
+	hpet_res = memblock_alloc_or_panic(sizeof(*hpet_res) + HPET_RESOURCE_NAME_SIZE,
 				  SMP_CACHE_BYTES);
-	if (!hpet_res)
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      sizeof(*hpet_res) + HPET_RESOURCE_NAME_SIZE);
 
 	hpet_res->name = (void *)&hpet_res[1];
 	hpet_res->flags = IORESOURCE_MEM;
diff --git a/arch/x86/kernel/apic/io_apic.c b/arch/x86/kernel/apic/io_apic.c
index 1029ea4ac8ba..a57d3fa7c6b6 100644
--- a/arch/x86/kernel/apic/io_apic.c
+++ b/arch/x86/kernel/apic/io_apic.c
@@ -2503,9 +2503,7 @@ static struct resource * __init ioapic_setup_resources(void)
 	n = IOAPIC_RESOURCE_NAME_SIZE + sizeof(struct resource);
 	n *= nr_ioapics;
 
-	mem = memblock_alloc(n, SMP_CACHE_BYTES);
-	if (!mem)
-		panic("%s: Failed to allocate %lu bytes\n", __func__, n);
+	mem = memblock_alloc_or_panic(n, SMP_CACHE_BYTES);
 	res = (void *)mem;
 
 	mem += sizeof(struct resource) * nr_ioapics;
@@ -2564,11 +2562,8 @@ void __init io_apic_init_mappings(void)
 #ifdef CONFIG_X86_32
 fake_ioapic_page:
 #endif
-			ioapic_phys = (unsigned long)memblock_alloc(PAGE_SIZE,
+			ioapic_phys = (unsigned long)memblock_alloc_or_panic(PAGE_SIZE,
 								    PAGE_SIZE);
-			if (!ioapic_phys)
-				panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-				      __func__, PAGE_SIZE, PAGE_SIZE);
 			ioapic_phys = __pa(ioapic_phys);
 		}
 		io_apic_set_fixmap(idx, ioapic_phys);
diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 4893d30ce438..82b96ed9890a 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -1146,11 +1146,8 @@ void __init e820__reserve_resources(void)
 	struct resource *res;
 	u64 end;
 
-	res = memblock_alloc(sizeof(*res) * e820_table->nr_entries,
+	res = memblock_alloc_or_panic(sizeof(*res) * e820_table->nr_entries,
 			     SMP_CACHE_BYTES);
-	if (!res)
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      sizeof(*res) * e820_table->nr_entries);
 	e820_res = res;
 
 	for (i = 0; i < e820_table->nr_entries; i++) {
diff --git a/arch/x86/platform/olpc/olpc_dt.c b/arch/x86/platform/olpc/olpc_dt.c
index 74ebd6882690..cf5dca2dbb91 100644
--- a/arch/x86/platform/olpc/olpc_dt.c
+++ b/arch/x86/platform/olpc/olpc_dt.c
@@ -136,11 +136,7 @@ void * __init prom_early_alloc(unsigned long size)
 		 * fast enough on the platforms we care about while minimizing
 		 * wasted bootmem) and hand off chunks of it to callers.
 		 */
-		res = memblock_alloc(chunk_size, SMP_CACHE_BYTES);
-		if (!res)
-			panic("%s: Failed to allocate %zu bytes\n", __func__,
-			      chunk_size);
-		BUG_ON(!res);
+		res = memblock_alloc_or_panic(chunk_size, SMP_CACHE_BYTES);
 		prom_early_allocated += chunk_size;
 		memset(res, 0, chunk_size);
 		free_mem = chunk_size;
diff --git a/arch/x86/xen/p2m.c b/arch/x86/xen/p2m.c
index b52d3e17e2c1..56914e21e303 100644
--- a/arch/x86/xen/p2m.c
+++ b/arch/x86/xen/p2m.c
@@ -178,13 +178,7 @@ static void p2m_init_identity(unsigned long *p2m, unsigned long pfn)
 static void * __ref alloc_p2m_page(void)
 {
 	if (unlikely(!slab_is_available())) {
-		void *ptr = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
-
-		if (!ptr)
-			panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-			      __func__, PAGE_SIZE, PAGE_SIZE);
-
-		return ptr;
+		return memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
 	}
 
 	return (void *)__get_free_page(GFP_KERNEL);
diff --git a/arch/xtensa/mm/kasan_init.c b/arch/xtensa/mm/kasan_init.c
index f00d122aa806..f39c4d83173a 100644
--- a/arch/xtensa/mm/kasan_init.c
+++ b/arch/xtensa/mm/kasan_init.c
@@ -39,11 +39,7 @@ static void __init populate(void *start, void *end)
 	unsigned long i, j;
 	unsigned long vaddr = (unsigned long)start;
 	pmd_t *pmd = pmd_off_k(vaddr);
-	pte_t *pte = memblock_alloc(n_pages * sizeof(pte_t), PAGE_SIZE);
-
-	if (!pte)
-		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-		      __func__, n_pages * sizeof(pte_t), PAGE_SIZE);
+	pte_t *pte = memblock_alloc_or_panic(n_pages * sizeof(pte_t), PAGE_SIZE);
 
 	pr_debug("%s: %p - %p\n", __func__, start, end);
 
diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
index f2117fef7c7d..9c75dcc9a534 100644
--- a/drivers/clk/ti/clk.c
+++ b/drivers/clk/ti/clk.c
@@ -449,10 +449,7 @@ void __init omap2_clk_legacy_provider_init(int index, void __iomem *mem)
 {
 	struct clk_iomap *io;
 
-	io = memblock_alloc(sizeof(*io), SMP_CACHE_BYTES);
-	if (!io)
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      sizeof(*io));
+	io = memblock_alloc_or_panic(sizeof(*io), SMP_CACHE_BYTES);
 
 	io->mem = mem;
 
diff --git a/drivers/macintosh/smu.c b/drivers/macintosh/smu.c
index a01bc5090cdf..a1534cc6c641 100644
--- a/drivers/macintosh/smu.c
+++ b/drivers/macintosh/smu.c
@@ -492,11 +492,7 @@ int __init smu_init (void)
 		goto fail_np;
 	}
 
-	smu = memblock_alloc(sizeof(struct smu_device), SMP_CACHE_BYTES);
-	if (!smu)
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      sizeof(struct smu_device));
-
+	smu = memblock_alloc_or_panic(sizeof(struct smu_device), SMP_CACHE_BYTES);
 	spin_lock_init(&smu->lock);
 	INIT_LIST_HEAD(&smu->cmd_list);
 	INIT_LIST_HEAD(&smu->cmd_i2c_list);
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 4b1e9f101ce3..809135e2c7f5 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1126,13 +1126,7 @@ void __init __weak early_init_dt_add_memory_arch(u64 base, u64 size)
 
 static void * __init early_init_dt_alloc_memory_arch(u64 size, u64 align)
 {
-	void *ptr = memblock_alloc(size, align);
-
-	if (!ptr)
-		panic("%s: Failed to allocate %llu bytes align=0x%llx\n",
-		      __func__, size, align);
-
-	return ptr;
+	return memblock_alloc_or_panic(size, align);
 }
 
 bool __init early_init_dt_verify(void *dt_virt, phys_addr_t dt_phys)
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index e50570629dc0..837eafa81636 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -3675,13 +3675,7 @@ static struct device_node *overlay_base_root;
 
 static void * __init dt_alloc_memory(u64 size, u64 align)
 {
-	void *ptr = memblock_alloc(size, align);
-
-	if (!ptr)
-		panic("%s: Failed to allocate %llu bytes align=0x%llx\n",
-		      __func__, size, align);
-
-	return ptr;
+	return memblock_alloc_or_panic(size, align);
 }
 
 /*
diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 673d5cae7c81..dee628350cd1 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -417,6 +417,12 @@ static __always_inline void *memblock_alloc(phys_addr_t size, phys_addr_t align)
 				      MEMBLOCK_ALLOC_ACCESSIBLE, NUMA_NO_NODE);
 }
 
+void *__memblock_alloc_or_panic(phys_addr_t size, phys_addr_t align,
+				const char *func);
+
+#define memblock_alloc_or_panic(size, align)    \
+	 __memblock_alloc_or_panic(size, align, __func__)
+
 static inline void *memblock_alloc_raw(phys_addr_t size,
 					       phys_addr_t align)
 {
diff --git a/init/main.c b/init/main.c
index 893cb77aef22..2a1757826397 100644
--- a/init/main.c
+++ b/init/main.c
@@ -640,15 +640,11 @@ static void __init setup_command_line(char *command_line)
 
 	len = xlen + strlen(boot_command_line) + ilen + 1;
 
-	saved_command_line = memblock_alloc(len, SMP_CACHE_BYTES);
-	if (!saved_command_line)
-		panic("%s: Failed to allocate %zu bytes\n", __func__, len);
+	saved_command_line = memblock_alloc_or_panic(len, SMP_CACHE_BYTES);
 
 	len = xlen + strlen(command_line) + 1;
 
-	static_command_line = memblock_alloc(len, SMP_CACHE_BYTES);
-	if (!static_command_line)
-		panic("%s: Failed to allocate %zu bytes\n", __func__, len);
+	static_command_line = memblock_alloc_or_panic(len, SMP_CACHE_BYTES);
 
 	if (xlen) {
 		/*
@@ -1146,16 +1142,10 @@ static int __init initcall_blacklist(char *str)
 		str_entry = strsep(&str, ",");
 		if (str_entry) {
 			pr_debug("blacklisting initcall %s\n", str_entry);
-			entry = memblock_alloc(sizeof(*entry),
+			entry = memblock_alloc_or_panic(sizeof(*entry),
 					       SMP_CACHE_BYTES);
-			if (!entry)
-				panic("%s: Failed to allocate %zu bytes\n",
-				      __func__, sizeof(*entry));
-			entry->buf = memblock_alloc(strlen(str_entry) + 1,
+			entry->buf = memblock_alloc_or_panic(strlen(str_entry) + 1,
 						    SMP_CACHE_BYTES);
-			if (!entry->buf)
-				panic("%s: Failed to allocate %zu bytes\n",
-				      __func__, strlen(str_entry) + 1);
 			strcpy(entry->buf, str_entry);
 			list_add(&entry->next, &blacklisted_initcalls);
 		}
diff --git a/kernel/power/snapshot.c b/kernel/power/snapshot.c
index 30894d8f0a78..c9fb559a6399 100644
--- a/kernel/power/snapshot.c
+++ b/kernel/power/snapshot.c
@@ -1011,11 +1011,8 @@ void __init register_nosave_region(unsigned long start_pfn, unsigned long end_pf
 		}
 	}
 	/* This allocation cannot fail */
-	region = memblock_alloc(sizeof(struct nosave_region),
+	region = memblock_alloc_or_panic(sizeof(struct nosave_region),
 				SMP_CACHE_BYTES);
-	if (!region)
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      sizeof(struct nosave_region));
 	region->start_pfn = start_pfn;
 	region->end_pfn = end_pfn;
 	list_add_tail(&region->list, &nosave_regions);
diff --git a/lib/cpumask.c b/lib/cpumask.c
index e77ee9d46f71..57274ba8b6d9 100644
--- a/lib/cpumask.c
+++ b/lib/cpumask.c
@@ -83,10 +83,7 @@ EXPORT_SYMBOL(alloc_cpumask_var_node);
  */
 void __init alloc_bootmem_cpumask_var(cpumask_var_t *mask)
 {
-	*mask = memblock_alloc(cpumask_size(), SMP_CACHE_BYTES);
-	if (!*mask)
-		panic("%s: Failed to allocate %u bytes\n", __func__,
-		      cpumask_size());
+	*mask = memblock_alloc_or_panic(cpumask_size(), SMP_CACHE_BYTES);
 }
 
 /**
diff --git a/mm/kmsan/shadow.c b/mm/kmsan/shadow.c
index 9c58f081d84f..1bb505a08415 100644
--- a/mm/kmsan/shadow.c
+++ b/mm/kmsan/shadow.c
@@ -280,12 +280,8 @@ void __init kmsan_init_alloc_meta_for_range(void *start, void *end)
 
 	start = (void *)PAGE_ALIGN_DOWN((u64)start);
 	size = PAGE_ALIGN((u64)end - (u64)start);
-	shadow = memblock_alloc(size, PAGE_SIZE);
-	origin = memblock_alloc(size, PAGE_SIZE);
-
-	if (!shadow || !origin)
-		panic("%s: Failed to allocate metadata memory for early boot range of size %llu",
-		      __func__, size);
+	shadow = memblock_alloc_or_panic(size, PAGE_SIZE);
+	origin = memblock_alloc_or_panic(size, PAGE_SIZE);
 
 	for (u64 addr = 0; addr < size; addr += PAGE_SIZE) {
 		page = virt_to_page_or_null((char *)start + addr);
diff --git a/mm/memblock.c b/mm/memblock.c
index 095c18b5c430..95af35fd1389 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1691,6 +1691,26 @@ void * __init memblock_alloc_try_nid(
 	return ptr;
 }
 
+/**
+ * __memblock_alloc_or_panic - Try to allocate memory and panic on failure
+ * @size: size of memory block to be allocated in bytes
+ * @align: alignment of the region and block's size
+ * @func: caller func name
+ *
+ * This function attempts to allocate memory using memblock_alloc,
+ * and in case of failure, it calls panic with the formatted message.
+ * This function should not be used directly, please use the macro memblock_alloc_or_panic.
+ */
+void *__init __memblock_alloc_or_panic(phys_addr_t size, phys_addr_t align,
+				       const char *func)
+{
+	void *addr = memblock_alloc(size, align);
+
+	if (unlikely(!addr))
+		panic("%s: Failed to allocate %pap bytes\n", func, &size);
+	return addr;
+}
+
 /**
  * memblock_free_late - free pages directly to buddy allocator
  * @base: phys starting address of the  boot memory block
diff --git a/mm/numa.c b/mm/numa.c
index e2eec07707d1..f1787d7713a6 100644
--- a/mm/numa.c
+++ b/mm/numa.c
@@ -37,13 +37,7 @@ void __init alloc_node_data(int nid)
 void __init alloc_offline_node_data(int nid)
 {
 	pg_data_t *pgdat;
-
-	pgdat = memblock_alloc(sizeof(*pgdat), SMP_CACHE_BYTES);
-	if (!pgdat)
-		panic("Cannot allocate %zuB for node %d.\n",
-		      sizeof(*pgdat), nid);
-
-	node_data[nid] = pgdat;
+	node_data[nid] = memblock_alloc_or_panic(sizeof(*pgdat), SMP_CACHE_BYTES);
 }
 
 /* Stub functions: */
diff --git a/mm/percpu.c b/mm/percpu.c
index d8dd31a2e407..ac61e3fc5f15 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -1359,10 +1359,7 @@ static struct pcpu_chunk * __init pcpu_alloc_first_chunk(unsigned long tmp_addr,
 	/* allocate chunk */
 	alloc_size = struct_size(chunk, populated,
 				 BITS_TO_LONGS(region_size >> PAGE_SHIFT));
-	chunk = memblock_alloc(alloc_size, SMP_CACHE_BYTES);
-	if (!chunk)
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      alloc_size);
+	chunk = memblock_alloc_or_panic(alloc_size, SMP_CACHE_BYTES);
 
 	INIT_LIST_HEAD(&chunk->list);
 
@@ -1374,24 +1371,14 @@ static struct pcpu_chunk * __init pcpu_alloc_first_chunk(unsigned long tmp_addr,
 	region_bits = pcpu_chunk_map_bits(chunk);
 
 	alloc_size = BITS_TO_LONGS(region_bits) * sizeof(chunk->alloc_map[0]);
-	chunk->alloc_map = memblock_alloc(alloc_size, SMP_CACHE_BYTES);
-	if (!chunk->alloc_map)
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      alloc_size);
+	chunk->alloc_map = memblock_alloc_or_panic(alloc_size, SMP_CACHE_BYTES);
 
 	alloc_size =
 		BITS_TO_LONGS(region_bits + 1) * sizeof(chunk->bound_map[0]);
-	chunk->bound_map = memblock_alloc(alloc_size, SMP_CACHE_BYTES);
-	if (!chunk->bound_map)
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      alloc_size);
+	chunk->bound_map = memblock_alloc_or_panic(alloc_size, SMP_CACHE_BYTES);
 
 	alloc_size = pcpu_chunk_nr_blocks(chunk) * sizeof(chunk->md_blocks[0]);
-	chunk->md_blocks = memblock_alloc(alloc_size, SMP_CACHE_BYTES);
-	if (!chunk->md_blocks)
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      alloc_size);
-
+	chunk->md_blocks = memblock_alloc_or_panic(alloc_size, SMP_CACHE_BYTES);
 #ifdef NEED_PCPUOBJ_EXT
 	/* first chunk is free to use */
 	chunk->obj_exts = NULL;
@@ -2595,28 +2582,16 @@ void __init pcpu_setup_first_chunk(const struct pcpu_alloc_info *ai,
 
 	/* process group information and build config tables accordingly */
 	alloc_size = ai->nr_groups * sizeof(group_offsets[0]);
-	group_offsets = memblock_alloc(alloc_size, SMP_CACHE_BYTES);
-	if (!group_offsets)
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      alloc_size);
+	group_offsets = memblock_alloc_or_panic(alloc_size, SMP_CACHE_BYTES);
 
 	alloc_size = ai->nr_groups * sizeof(group_sizes[0]);
-	group_sizes = memblock_alloc(alloc_size, SMP_CACHE_BYTES);
-	if (!group_sizes)
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      alloc_size);
+	group_sizes = memblock_alloc_or_panic(alloc_size, SMP_CACHE_BYTES);
 
 	alloc_size = nr_cpu_ids * sizeof(unit_map[0]);
-	unit_map = memblock_alloc(alloc_size, SMP_CACHE_BYTES);
-	if (!unit_map)
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      alloc_size);
+	unit_map = memblock_alloc_or_panic(alloc_size, SMP_CACHE_BYTES);
 
 	alloc_size = nr_cpu_ids * sizeof(unit_off[0]);
-	unit_off = memblock_alloc(alloc_size, SMP_CACHE_BYTES);
-	if (!unit_off)
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      alloc_size);
+	unit_off = memblock_alloc_or_panic(alloc_size, SMP_CACHE_BYTES);
 
 	for (cpu = 0; cpu < nr_cpu_ids; cpu++)
 		unit_map[cpu] = UINT_MAX;
@@ -2685,12 +2660,9 @@ void __init pcpu_setup_first_chunk(const struct pcpu_alloc_info *ai,
 	pcpu_free_slot = pcpu_sidelined_slot + 1;
 	pcpu_to_depopulate_slot = pcpu_free_slot + 1;
 	pcpu_nr_slots = pcpu_to_depopulate_slot + 1;
-	pcpu_chunk_lists = memblock_alloc(pcpu_nr_slots *
+	pcpu_chunk_lists = memblock_alloc_or_panic(pcpu_nr_slots *
 					  sizeof(pcpu_chunk_lists[0]),
 					  SMP_CACHE_BYTES);
-	if (!pcpu_chunk_lists)
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      pcpu_nr_slots * sizeof(pcpu_chunk_lists[0]));
 
 	for (i = 0; i < pcpu_nr_slots; i++)
 		INIT_LIST_HEAD(&pcpu_chunk_lists[i]);
@@ -3155,25 +3127,19 @@ void __init __weak pcpu_populate_pte(unsigned long addr)
 	pmd_t *pmd;
 
 	if (pgd_none(*pgd)) {
-		p4d = memblock_alloc(P4D_TABLE_SIZE, P4D_TABLE_SIZE);
-		if (!p4d)
-			goto err_alloc;
+		p4d = memblock_alloc_or_panic(P4D_TABLE_SIZE, P4D_TABLE_SIZE);
 		pgd_populate(&init_mm, pgd, p4d);
 	}
 
 	p4d = p4d_offset(pgd, addr);
 	if (p4d_none(*p4d)) {
-		pud = memblock_alloc(PUD_TABLE_SIZE, PUD_TABLE_SIZE);
-		if (!pud)
-			goto err_alloc;
+		pud = memblock_alloc_or_panic(PUD_TABLE_SIZE, PUD_TABLE_SIZE);
 		p4d_populate(&init_mm, p4d, pud);
 	}
 
 	pud = pud_offset(p4d, addr);
 	if (pud_none(*pud)) {
-		pmd = memblock_alloc(PMD_TABLE_SIZE, PMD_TABLE_SIZE);
-		if (!pmd)
-			goto err_alloc;
+		pmd = memblock_alloc_or_panic(PMD_TABLE_SIZE, PMD_TABLE_SIZE);
 		pud_populate(&init_mm, pud, pmd);
 	}
 
@@ -3181,16 +3147,11 @@ void __init __weak pcpu_populate_pte(unsigned long addr)
 	if (!pmd_present(*pmd)) {
 		pte_t *new;
 
-		new = memblock_alloc(PTE_TABLE_SIZE, PTE_TABLE_SIZE);
-		if (!new)
-			goto err_alloc;
+		new = memblock_alloc_or_panic(PTE_TABLE_SIZE, PTE_TABLE_SIZE);
 		pmd_populate_kernel(&init_mm, pmd, new);
 	}
 
 	return;
-
-err_alloc:
-	panic("%s: Failed to allocate memory\n", __func__);
 }
 
 /**
@@ -3237,10 +3198,7 @@ int __init pcpu_page_first_chunk(size_t reserved_size, pcpu_fc_cpu_to_node_fn_t
 	/* unaligned allocations can't be freed, round up to page size */
 	pages_size = PFN_ALIGN(unit_pages * num_possible_cpus() *
 			       sizeof(pages[0]));
-	pages = memblock_alloc(pages_size, SMP_CACHE_BYTES);
-	if (!pages)
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      pages_size);
+	pages = memblock_alloc_or_panic(pages_size, SMP_CACHE_BYTES);
 
 	/* allocate pages */
 	j = 0;
diff --git a/mm/sparse.c b/mm/sparse.c
index 13b6624d3562..133b033d0cba 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -257,10 +257,7 @@ static void __init memblocks_present(void)
 
 		size = sizeof(struct mem_section *) * NR_SECTION_ROOTS;
 		align = 1 << (INTERNODE_CACHE_SHIFT);
-		mem_section = memblock_alloc(size, align);
-		if (!mem_section)
-			panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-			      __func__, size, align);
+		mem_section = memblock_alloc_or_panic(size, align);
 	}
 #endif
 
-- 
2.25.1


