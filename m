Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3715B456222
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 19:13:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hw7G61Kbtz3cb8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 05:13:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.46; helo=mail-ot1-f46.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hw7Dj5GZVz2yP3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 05:12:21 +1100 (AEDT)
Received: by mail-ot1-f46.google.com with SMTP id
 w6-20020a9d77c6000000b0055e804fa524so12379094otl.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Nov 2021 10:12:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dLt0RZJa74+vNh4jDKN+dYBZdmAo4EX18x32cfOfPN4=;
 b=Kk8Z7P8ESzX4tRoOCaBoBs5tLntOtBckPNRsburZ2JWp2ooLi1t6Nyeb/IKmr0Tgwz
 /4cVswvz6p5Q12sOPLLHQyJCR6DirmH+UqhfPCuOFUpbR8SCY1BtJPw54xtbGbh09IV7
 zM66YLEYFq5XiCdE96sTq2Liuem2jrMArLFpszjaQzjD6O1D/PAlBFLbu8lq7k/X2Gcd
 3IxWXynTis2lWF78O7VERYc0kB5GHhBQNIeJG9/76CdZ4aeGJ373HZgpcC04e4sKGbiS
 e0JRF06bTmOdqcIFwH5nyr6nCUFXT/r8KCzM+fVmyrH3KV/DaEjcc7YRNEVMZ7AuogcH
 lyPA==
X-Gm-Message-State: AOAM532MJlziyzv1aNDjmkkHTx5YvaAVTG5d8TpsCe5twmYZtqqqiKyX
 rg+7PF/6+/eiuQPZGjTv+A==
X-Google-Smtp-Source: ABdhPJzpUAvhUd7W//YYzQqI5nzcWqV3VbIx84BBpT3fmoaGXQeR5vCEkV+9QEEI4kdGuBzn0aCDtg==
X-Received: by 2002:a05:6830:280a:: with SMTP id
 w10mr21977632otu.78.1637259138974; 
 Thu, 18 Nov 2021 10:12:18 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id n20sm99339ooe.7.2021.11.18.10.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 10:12:18 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Frank Rowand <frowand.list@gmail.com>, John Crispin <john@phrozen.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH 2/3] of/fdt: Rework early_init_dt_scan_root() to call directly
Date: Thu, 18 Nov 2021 12:12:11 -0600
Message-Id: <20211118181213.1433346-3-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211118181213.1433346-1-robh@kernel.org>
References: <20211118181213.1433346-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use of the of_scan_flat_dt() function predates libfdt and is discouraged
as libfdt provides a nicer set of APIs. Rework early_init_dt_scan_root()
to be called directly and use libfdt.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/powerpc/kernel/prom.c |  4 ++--
 drivers/of/fdt.c           | 14 +++++++-------
 include/linux/of_fdt.h     |  3 +--
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index c6c398ccd98a..6e1a106f02eb 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -748,7 +748,7 @@ void __init early_init_devtree(void *params)
 	of_scan_flat_dt(early_init_dt_scan_chosen_ppc, boot_command_line);
 
 	/* Scan memory nodes and rebuild MEMBLOCKs */
-	of_scan_flat_dt(early_init_dt_scan_root, NULL);
+	early_init_dt_scan_root();
 	of_scan_flat_dt(early_init_dt_scan_memory_ppc, NULL);
 
 	parse_early_param();
@@ -857,7 +857,7 @@ void __init early_get_first_memblock_info(void *params, phys_addr_t *size)
 	 * mess the memblock.
 	 */
 	add_mem_to_memblock = 0;
-	of_scan_flat_dt(early_init_dt_scan_root, NULL);
+	early_init_dt_scan_root();
 	of_scan_flat_dt(early_init_dt_scan_memory_ppc, NULL);
 	add_mem_to_memblock = 1;
 
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 1f1705f76263..5e216555fe4f 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1042,13 +1042,14 @@ int __init early_init_dt_scan_chosen_stdout(void)
 /*
  * early_init_dt_scan_root - fetch the top level address and size cells
  */
-int __init early_init_dt_scan_root(unsigned long node, const char *uname,
-				   int depth, void *data)
+int __init early_init_dt_scan_root(void)
 {
 	const __be32 *prop;
+	const void *fdt = initial_boot_params;
+	int node = fdt_path_offset(fdt, "/");
 
-	if (depth != 0)
-		return 0;
+	if (node < 0)
+		return -ENODEV;
 
 	dt_root_size_cells = OF_ROOT_NODE_SIZE_CELLS_DEFAULT;
 	dt_root_addr_cells = OF_ROOT_NODE_ADDR_CELLS_DEFAULT;
@@ -1063,8 +1064,7 @@ int __init early_init_dt_scan_root(unsigned long node, const char *uname,
 		dt_root_addr_cells = be32_to_cpup(prop);
 	pr_debug("dt_root_addr_cells = %x\n", dt_root_addr_cells);
 
-	/* break now */
-	return 1;
+	return 0;
 }
 
 u64 __init dt_mem_next_cell(int s, const __be32 **cellp)
@@ -1263,7 +1263,7 @@ void __init early_init_dt_scan_nodes(void)
 	int rc;
 
 	/* Initialize {size,address}-cells info */
-	of_scan_flat_dt(early_init_dt_scan_root, NULL);
+	early_init_dt_scan_root();
 
 	/* Retrieve various information from the /chosen node */
 	rc = early_init_dt_scan_chosen(boot_command_line);
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index 654722235df6..df3d31926c3c 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -68,8 +68,7 @@ extern void early_init_dt_add_memory_arch(u64 base, u64 size);
 extern u64 dt_mem_next_cell(int s, const __be32 **cellp);
 
 /* Early flat tree scan hooks */
-extern int early_init_dt_scan_root(unsigned long node, const char *uname,
-				   int depth, void *data);
+extern int early_init_dt_scan_root(void);
 
 extern bool early_init_dt_scan(void *params);
 extern bool early_init_dt_verify(void *params);
-- 
2.32.0

