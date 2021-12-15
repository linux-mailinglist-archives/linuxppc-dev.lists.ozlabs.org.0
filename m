Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEBF476BBE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 09:18:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF4kw6K3Nz3cnm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 19:18:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mFvaSnGh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::829;
 helo=mail-qt1-x829.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mFvaSnGh; dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDgKB4HyWz308b
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 03:13:34 +1100 (AEDT)
Received: by mail-qt1-x829.google.com with SMTP id o17so22316572qtk.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 08:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vSiB7JDOwttvuwLnH5gnXorZjOCeKpBQJbMfG8qoknA=;
 b=mFvaSnGhuEUSWCd6DAknZOOE7/KyxzorKZYltshutXIvs8N+IFEOn3F+8OBG6k1NJa
 e5KaefgrG+4n62CPjrEGky+nSVvNiLkTXekP/4f965X0dkAqiJiNKiextAk8urqtPz0Y
 UEQGlVyKgiry/RpLT4bG9M/lvwyKRKCDbOi+zhedVAaLR9EJ2k2Ks8r1+B3trCd+ANlu
 WRM8XlfTqYDPdJS6TviSzTo5Z3r50VYqUBD+8I53KKswOiUludmQgaLRRcQ+PjOhxiWh
 3QUcMs3F0rxhroG66/Vz+76oiIDr0I4tI00ryiVu41dPKvvWb/V99PuZ0A/Uod42H3dc
 eO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vSiB7JDOwttvuwLnH5gnXorZjOCeKpBQJbMfG8qoknA=;
 b=nnpszm85DhRoLLITCQ/uttkyBPmEzdEOXjDARkibdUkL/ZOy43aP0QeBQ/en9IX/Za
 YIdKH65PVX4+NvPurqn5DyhEunnriYzA2R3Y1wnjuavFBiGrxXpkXkARzC0PTqyVmCPg
 jWDFu7uw/2sWQCNN+LZB2W0GwVNGDKQkE4WO/rrRy6j2sgk1IkSUk1oZFwjktVzD9m9S
 1GbFJngtDOzu1mmmGduuGEK01rT/ELnNhNCxmS7ClO7plcY+lGeY7yAdH0gPi2FgsonF
 I5khIOUOVI/HVycT9YnjqFAiJdjPyTDRsNwV/BknGYnh8PHZoz+e6mPsC30OCXLNhPkz
 iKJA==
X-Gm-Message-State: AOAM530yYlvU7QWA2CMTm5l/LW32PjMcykUyYPkrXfsSq9RBD9BDbD74
 zEBNvLzNxPZgVqUULD0q8JYeNiZRCSY=
X-Google-Smtp-Source: ABdhPJzksO4VwQ4Yw3eoq0HAup24KBwuO0hg3Tu1pYq6cxGUbl4QBnrEr0IaR6ZswUSFe611w1V22w==
X-Received: by 2002:ac8:5e0f:: with SMTP id h15mr12321723qtx.490.1639584811593; 
 Wed, 15 Dec 2021 08:13:31 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:73:d0b0:acf1:e2d0])
 by smtp.gmail.com with ESMTPSA id t11sm1276436qkp.56.2021.12.15.08.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:13:30 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 13/20] powerpc/ps3: Add __init attribute to eligible functions
Date: Wed, 15 Dec 2021 11:12:36 -0500
Message-Id: <20211215161243.16396-14-nick.child@ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215161243.16396-1-nick.child@ibm.com>
References: <20211215161243.16396-1-nick.child@ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Dec 2021 19:09:28 +1100
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
Cc: Nick Child <nick.child@ibm.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some functions defined in 'arch/powerpc/platforms/ps3' are deserving of an
`__init` macro attribute. These functions are only called by other
initialization functions and therefore should inherit the attribute.
Also, change function declarations in header files to include `__init`.

Signed-off-by: Nick Child <nick.child@ibm.com>
---
 arch/powerpc/platforms/ps3/gelic_udbg.c |  2 +-
 arch/powerpc/platforms/ps3/mm.c         |  4 ++--
 arch/powerpc/platforms/ps3/os-area.c    |  4 ++--
 arch/powerpc/platforms/ps3/platform.h   | 14 +++++++-------
 arch/powerpc/platforms/ps3/repository.c | 20 ++++++++++----------
 arch/powerpc/platforms/ps3/smp.c        |  2 +-
 arch/powerpc/platforms/ps3/spu.c        |  2 +-
 7 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/platforms/ps3/gelic_udbg.c b/arch/powerpc/platforms/ps3/gelic_udbg.c
index cba4f8f5b8d7..6b298010fd84 100644
--- a/arch/powerpc/platforms/ps3/gelic_udbg.c
+++ b/arch/powerpc/platforms/ps3/gelic_udbg.c
@@ -113,7 +113,7 @@ static int unmap_dma_mem(int bus_id, int dev_id, u64 bus_addr, size_t len)
 	return lv1_free_device_dma_region(bus_id, dev_id, real_bus_addr);
 }
 
-static void gelic_debug_init(void)
+static void __init gelic_debug_init(void)
 {
 	s64 result;
 	u64 v2;
diff --git a/arch/powerpc/platforms/ps3/mm.c b/arch/powerpc/platforms/ps3/mm.c
index 9c44f335c0b9..5ce924611b94 100644
--- a/arch/powerpc/platforms/ps3/mm.c
+++ b/arch/powerpc/platforms/ps3/mm.c
@@ -41,7 +41,7 @@ enum {
 	PAGE_SHIFT_16M = 24U,
 };
 
-static unsigned long make_page_sizes(unsigned long a, unsigned long b)
+static unsigned long __init make_page_sizes(unsigned long a, unsigned long b)
 {
 	return (a << 56) | (b << 48);
 }
@@ -215,7 +215,7 @@ notrace void ps3_mm_vas_destroy(void)
 	}
 }
 
-static int ps3_mm_get_repository_highmem(struct mem_region *r)
+static int __init ps3_mm_get_repository_highmem(struct mem_region *r)
 {
 	int result;
 
diff --git a/arch/powerpc/platforms/ps3/os-area.c b/arch/powerpc/platforms/ps3/os-area.c
index e8530371aed6..cb844e0add2b 100644
--- a/arch/powerpc/platforms/ps3/os-area.c
+++ b/arch/powerpc/platforms/ps3/os-area.c
@@ -501,7 +501,7 @@ static int db_set_64(struct os_area_db *db, const struct os_area_db_id *id,
 	return -1;
 }
 
-static int db_get_64(const struct os_area_db *db,
+static int __init db_get_64(const struct os_area_db *db,
 	const struct os_area_db_id *id, uint64_t *value)
 {
 	struct db_iterator i;
@@ -517,7 +517,7 @@ static int db_get_64(const struct os_area_db *db,
 	return -1;
 }
 
-static int db_get_rtc_diff(const struct os_area_db *db, int64_t *rtc_diff)
+static int __init db_get_rtc_diff(const struct os_area_db *db, int64_t *rtc_diff)
 {
 	return db_get_64(db, &os_area_db_id_rtc_diff, (uint64_t*)rtc_diff);
 }
diff --git a/arch/powerpc/platforms/ps3/platform.h b/arch/powerpc/platforms/ps3/platform.h
index 07bd39ef71ff..d43ddb8f7210 100644
--- a/arch/powerpc/platforms/ps3/platform.h
+++ b/arch/powerpc/platforms/ps3/platform.h
@@ -35,7 +35,7 @@ void __init ps3_register_ipi_irq(unsigned int cpu, unsigned int virq);
 
 /* smp */
 
-void smp_init_ps3(void);
+void smp_init_ps3(void) __init;
 #ifdef CONFIG_SMP
 void ps3_smp_cleanup_cpu(int cpu);
 #else
@@ -135,9 +135,9 @@ int ps3_repository_find_device(struct ps3_repository_device *repo);
 int ps3_repository_find_device_by_id(struct ps3_repository_device *repo,
 				     u64 bus_id, u64 dev_id);
 int ps3_repository_find_devices(enum ps3_bus_type bus_type,
-	int (*callback)(const struct ps3_repository_device *repo));
+	int (*callback)(const struct ps3_repository_device *repo)) __init;
 int ps3_repository_find_bus(enum ps3_bus_type bus_type, unsigned int from,
-	unsigned int *bus_index);
+	unsigned int *bus_index) __init;
 int ps3_repository_find_interrupt(const struct ps3_repository_device *repo,
 	enum ps3_interrupt_type intr_type, unsigned int *interrupt_id);
 int ps3_repository_find_reg(const struct ps3_repository_device *repo,
@@ -211,8 +211,8 @@ static inline int ps3_repository_delete_highmem_info(unsigned int region_index)
 int ps3_repository_read_num_be(unsigned int *num_be);
 int ps3_repository_read_be_node_id(unsigned int be_index, u64 *node_id);
 int ps3_repository_read_be_id(u64 node_id, u64 *be_id);
-int ps3_repository_read_tb_freq(u64 node_id, u64 *tb_freq);
-int ps3_repository_read_be_tb_freq(unsigned int be_index, u64 *tb_freq);
+int ps3_repository_read_tb_freq(u64 node_id, u64 *tb_freq) __init;
+int ps3_repository_read_be_tb_freq(unsigned int be_index, u64 *tb_freq) __init;
 
 /* repository performance monitor info */
 
@@ -247,7 +247,7 @@ int ps3_repository_read_spu_resource_id(unsigned int res_index,
 
 /* repository vuart info */
 
-int ps3_repository_read_vuart_av_port(unsigned int *port);
-int ps3_repository_read_vuart_sysmgr_port(unsigned int *port);
+int ps3_repository_read_vuart_av_port(unsigned int *port) __init;
+int ps3_repository_read_vuart_sysmgr_port(unsigned int *port) __init;
 
 #endif
diff --git a/arch/powerpc/platforms/ps3/repository.c b/arch/powerpc/platforms/ps3/repository.c
index 21712964e76f..205763061a2d 100644
--- a/arch/powerpc/platforms/ps3/repository.c
+++ b/arch/powerpc/platforms/ps3/repository.c
@@ -413,7 +413,7 @@ int ps3_repository_find_device_by_id(struct ps3_repository_device *repo,
 	return 0;
 }
 
-int ps3_repository_find_devices(enum ps3_bus_type bus_type,
+int __init ps3_repository_find_devices(enum ps3_bus_type bus_type,
 	int (*callback)(const struct ps3_repository_device *repo))
 {
 	int result = 0;
@@ -455,7 +455,7 @@ int ps3_repository_find_devices(enum ps3_bus_type bus_type,
 	return result;
 }
 
-int ps3_repository_find_bus(enum ps3_bus_type bus_type, unsigned int from,
+int __init ps3_repository_find_bus(enum ps3_bus_type bus_type, unsigned int from,
 	unsigned int *bus_index)
 {
 	unsigned int i;
@@ -908,7 +908,7 @@ int ps3_repository_read_boot_dat_size(unsigned int *size)
 	return result;
 }
 
-int ps3_repository_read_vuart_av_port(unsigned int *port)
+int __init ps3_repository_read_vuart_av_port(unsigned int *port)
 {
 	int result;
 	u64 v1 = 0;
@@ -923,7 +923,7 @@ int ps3_repository_read_vuart_av_port(unsigned int *port)
 	return result;
 }
 
-int ps3_repository_read_vuart_sysmgr_port(unsigned int *port)
+int __init ps3_repository_read_vuart_sysmgr_port(unsigned int *port)
 {
 	int result;
 	u64 v1 = 0;
@@ -1005,7 +1005,7 @@ int ps3_repository_read_be_id(u64 node_id, u64 *be_id)
 		be_id, NULL);
 }
 
-int ps3_repository_read_tb_freq(u64 node_id, u64 *tb_freq)
+int __init ps3_repository_read_tb_freq(u64 node_id, u64 *tb_freq)
 {
 	return read_node(PS3_LPAR_ID_PME,
 		make_first_field("be", 0),
@@ -1015,7 +1015,7 @@ int ps3_repository_read_tb_freq(u64 node_id, u64 *tb_freq)
 		tb_freq, NULL);
 }
 
-int ps3_repository_read_be_tb_freq(unsigned int be_index, u64 *tb_freq)
+int __init ps3_repository_read_be_tb_freq(unsigned int be_index, u64 *tb_freq)
 {
 	int result;
 	u64 node_id;
@@ -1178,7 +1178,7 @@ int ps3_repository_delete_highmem_info(unsigned int region_index)
 
 #if defined(DEBUG)
 
-int ps3_repository_dump_resource_info(const struct ps3_repository_device *repo)
+int __init ps3_repository_dump_resource_info(const struct ps3_repository_device *repo)
 {
 	int result = 0;
 	unsigned int res_index;
@@ -1231,7 +1231,7 @@ int ps3_repository_dump_resource_info(const struct ps3_repository_device *repo)
 	return result;
 }
 
-static int dump_stor_dev_info(struct ps3_repository_device *repo)
+static int __init dump_stor_dev_info(struct ps3_repository_device *repo)
 {
 	int result = 0;
 	unsigned int num_regions, region_index;
@@ -1279,7 +1279,7 @@ static int dump_stor_dev_info(struct ps3_repository_device *repo)
 	return result;
 }
 
-static int dump_device_info(struct ps3_repository_device *repo,
+static int __init dump_device_info(struct ps3_repository_device *repo,
 	unsigned int num_dev)
 {
 	int result = 0;
@@ -1323,7 +1323,7 @@ static int dump_device_info(struct ps3_repository_device *repo,
 	return result;
 }
 
-int ps3_repository_dump_bus_info(void)
+int __init ps3_repository_dump_bus_info(void)
 {
 	int result = 0;
 	struct ps3_repository_device repo;
diff --git a/arch/powerpc/platforms/ps3/smp.c b/arch/powerpc/platforms/ps3/smp.c
index 93b1e73b3529..85295756005a 100644
--- a/arch/powerpc/platforms/ps3/smp.c
+++ b/arch/powerpc/platforms/ps3/smp.c
@@ -112,7 +112,7 @@ static struct smp_ops_t ps3_smp_ops = {
 	.kick_cpu	= smp_generic_kick_cpu,
 };
 
-void smp_init_ps3(void)
+void __init smp_init_ps3(void)
 {
 	DBG(" -> %s\n", __func__);
 	smp_ops = &ps3_smp_ops;
diff --git a/arch/powerpc/platforms/ps3/spu.c b/arch/powerpc/platforms/ps3/spu.c
index 0c252478e556..4a2520ec6d7f 100644
--- a/arch/powerpc/platforms/ps3/spu.c
+++ b/arch/powerpc/platforms/ps3/spu.c
@@ -137,7 +137,7 @@ u64 ps3_get_spe_id(void *arg)
 }
 EXPORT_SYMBOL_GPL(ps3_get_spe_id);
 
-static unsigned long get_vas_id(void)
+static unsigned long __init get_vas_id(void)
 {
 	u64 id;
 
-- 
2.25.1

