Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEA636F4E4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 06:22:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWfNq1n9gz2yy9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 14:22:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=Fq5DnJRE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.142.91; helo=alln-iport-4.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=Fq5DnJRE; dkim-atps=neutral
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWfNL403Mz2yYp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 14:22:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=14323; q=dns/txt;
 s=iport; t=1619756546; x=1620966146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MiuyJ/6WMT2bf34yrEL4yQukUGungehil+h/8EuYpkk=;
 b=Fq5DnJREqhgJLTydm8TZhIFAQAvGhHJrcNlh+UERl7lX8Mg4b5Rdd1NZ
 WpjT9+ocb02gTEmKSqAlbsrR4yBX1Dkmwm3rKg939bsXK2aABW9+2E1ut
 aOgEUzmp4QtZcXtyOzFkgXt5LqDEe2bazxjj1H7s880NB0t5vp+O2d3fH U=;
X-IPAS-Result: =?us-ascii?q?A0A5AACLhYtgmIcNJK1aHQEBAQEJARIBBQUBggQHAQsBA?=
 =?us-ascii?q?YN2ATkxljuafoF8CwEBAQ80BAEBhFACgXsCJTUIDgIEAQEBAwIDAQEBAQEFA?=
 =?us-ascii?q?QEBAgEGBBQBAQEBAQEBAWiFXUMWAYVrBjIBRhBRVwYBEoJxgwioVYIsgQGIM?=
 =?us-ascii?q?oFEFIEmAYhsdIN2JxyBSUKBFYNghCSDY4IzBIJHBictNU1vCoEskG0mi2WCB?=
 =?us-ascii?q?Jw9gxqBJ5tzECalHS2UfZ51X4QwNYEgATaBWzMaCBsVgyRQGQ6OKw0JjkshA?=
 =?us-ascii?q?y84AgYKAQEDCYlOg0EBAQ?=
IronPort-HdrOrdr: A9a23:eafuX6N+d5NuLMBcT5z155DYdL4zR+YMi2QD/UoZc3BoW+afkN
 2jm+le6AT9jywfVGpltdeLPqSBRn20z+8Q3aA9NaqvNTOJhEKGN4dnhLGJ/xTBHGnE+vdZxe
 NcdcFFeb7NJHxbqeq/3wWiCdYnx7C8gcWVrMPT1W1kQw0vS6wI1WZEIz2WGEF3WwVKbKBRfP
 Ghz/FKqDa6dXMcYt7TPAhmY8H4u9bJmJj6CCRoOzcb7mC14A+A2frTDwWfmiwTSSpIxq0vtV
 LYihXj6r+42svLrSP05iv255RSlMCJ8Lt+Lf3JrNQJITPxjQvtQ4JtV9S5zUkIidDqzko2m9
 /RpBplBeBP0jf6e2G4pgaF4XiH7AoT
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.82,260,1613433600"; d="scan'208";a="678191681"
Received: from alln-core-2.cisco.com ([173.36.13.135])
 by alln-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 30 Apr 2021 04:22:19 +0000
Received: from zorba.cisco.com ([10.24.18.92])
 by alln-core-2.cisco.com (8.15.2/8.15.2) with ESMTP id 13U4MHxv023118;
 Fri, 30 Apr 2021 04:22:19 GMT
From: Daniel Walker <danielwa@cisco.com>
To: linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 2/3] powerpc: prom_init: switch to early string functions
Date: Thu, 29 Apr 2021 21:22:15 -0700
Message-Id: <20210430042217.1198052-2-danielwa@cisco.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430042217.1198052-1-danielwa@cisco.com>
References: <20210430042217.1198052-1-danielwa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.18.92, [10.24.18.92]
X-Outbound-Node: alln-core-2.cisco.com
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
Cc: xe-linux-external@cisco.com, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This converts the prom_init string users to the early string function
which don't suffer from KASAN or any other debugging enabled.

Cc: xe-linux-external@cisco.com
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 arch/powerpc/kernel/prom_init.c        | 185 ++++++-------------------
 arch/powerpc/kernel/prom_init_check.sh |   9 +-
 2 files changed, 51 insertions(+), 143 deletions(-)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index ccf77b985c8f..4d4343da1280 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -225,105 +225,6 @@ static bool  __prombss rtas_has_query_cpu_stopped;
 #define PHANDLE_VALID(p)	((p) != 0 && (p) != PROM_ERROR)
 #define IHANDLE_VALID(i)	((i) != 0 && (i) != PROM_ERROR)
 
-/* Copied from lib/string.c and lib/kstrtox.c */
-
-static int __init prom_strcmp(const char *cs, const char *ct)
-{
-	unsigned char c1, c2;
-
-	while (1) {
-		c1 = *cs++;
-		c2 = *ct++;
-		if (c1 != c2)
-			return c1 < c2 ? -1 : 1;
-		if (!c1)
-			break;
-	}
-	return 0;
-}
-
-static char __init *prom_strcpy(char *dest, const char *src)
-{
-	char *tmp = dest;
-
-	while ((*dest++ = *src++) != '\0')
-		/* nothing */;
-	return tmp;
-}
-
-static int __init prom_strncmp(const char *cs, const char *ct, size_t count)
-{
-	unsigned char c1, c2;
-
-	while (count) {
-		c1 = *cs++;
-		c2 = *ct++;
-		if (c1 != c2)
-			return c1 < c2 ? -1 : 1;
-		if (!c1)
-			break;
-		count--;
-	}
-	return 0;
-}
-
-static size_t __init prom_strlen(const char *s)
-{
-	const char *sc;
-
-	for (sc = s; *sc != '\0'; ++sc)
-		/* nothing */;
-	return sc - s;
-}
-
-static int __init prom_memcmp(const void *cs, const void *ct, size_t count)
-{
-	const unsigned char *su1, *su2;
-	int res = 0;
-
-	for (su1 = cs, su2 = ct; 0 < count; ++su1, ++su2, count--)
-		if ((res = *su1 - *su2) != 0)
-			break;
-	return res;
-}
-
-static char __init *prom_strstr(const char *s1, const char *s2)
-{
-	size_t l1, l2;
-
-	l2 = prom_strlen(s2);
-	if (!l2)
-		return (char *)s1;
-	l1 = prom_strlen(s1);
-	while (l1 >= l2) {
-		l1--;
-		if (!prom_memcmp(s1, s2, l2))
-			return (char *)s1;
-		s1++;
-	}
-	return NULL;
-}
-
-static size_t __init prom_strlcat(char *dest, const char *src, size_t count)
-{
-	size_t dsize = prom_strlen(dest);
-	size_t len = prom_strlen(src);
-	size_t res = dsize + len;
-
-	/* This would be a bug */
-	if (dsize >= count)
-		return count;
-
-	dest += dsize;
-	count -= dsize;
-	if (len >= count)
-		len = count-1;
-	memcpy(dest, src, len);
-	dest[len] = 0;
-	return res;
-
-}
-
 #ifdef CONFIG_PPC_PSERIES
 static int __init prom_strtobool(const char *s, bool *res)
 {
@@ -694,7 +595,7 @@ static int __init prom_setprop(phandle node, const char *nodename,
 	add_string(&p, tohex((u32)(unsigned long) value));
 	add_string(&p, tohex(valuelen));
 	add_string(&p, tohex(ADDR(pname)));
-	add_string(&p, tohex(prom_strlen(pname)));
+	add_string(&p, tohex(early_strlen(pname)));
 	add_string(&p, "property");
 	*p = 0;
 	return call_prom("interpret", 1, 1, (u32)(unsigned long) cmd);
@@ -779,25 +680,25 @@ static void __init early_cmdline_parse(void)
 		l = prom_getprop(prom.chosen, "bootargs", p, COMMAND_LINE_SIZE-1);
 
 	if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) || l <= 0 || p[0] == '\0')
-		prom_strlcat(prom_cmd_line, " " CONFIG_CMDLINE,
+		early_strlcat(prom_cmd_line, " " CONFIG_CMDLINE,
 			     sizeof(prom_cmd_line));
 
 	prom_printf("command line: %s\n", prom_cmd_line);
 
 #ifdef CONFIG_PPC64
-	opt = prom_strstr(prom_cmd_line, "iommu=");
+	opt = early_strstr(prom_cmd_line, "iommu=");
 	if (opt) {
 		prom_printf("iommu opt is: %s\n", opt);
 		opt += 6;
 		while (*opt && *opt == ' ')
 			opt++;
-		if (!prom_strncmp(opt, "off", 3))
+		if (!early_strncmp(opt, "off", 3))
 			prom_iommu_off = 1;
-		else if (!prom_strncmp(opt, "force", 5))
+		else if (!early_strncmp(opt, "force", 5))
 			prom_iommu_force_on = 1;
 	}
 #endif
-	opt = prom_strstr(prom_cmd_line, "mem=");
+	opt = early_strstr(prom_cmd_line, "mem=");
 	if (opt) {
 		opt += 4;
 		prom_memory_limit = prom_memparse(opt, (const char **)&opt);
@@ -809,7 +710,7 @@ static void __init early_cmdline_parse(void)
 
 #ifdef CONFIG_PPC_PSERIES
 	prom_radix_disable = !IS_ENABLED(CONFIG_PPC_RADIX_MMU_DEFAULT);
-	opt = prom_strstr(prom_cmd_line, "disable_radix");
+	opt = early_strstr(prom_cmd_line, "disable_radix");
 	if (opt) {
 		opt += 13;
 		if (*opt && *opt == '=') {
@@ -825,13 +726,13 @@ static void __init early_cmdline_parse(void)
 	if (prom_radix_disable)
 		prom_debug("Radix disabled from cmdline\n");
 
-	opt = prom_strstr(prom_cmd_line, "radix_hcall_invalidate=on");
+	opt = early_strstr(prom_cmd_line, "radix_hcall_invalidate=on");
 	if (opt) {
 		prom_radix_gtse_disable = true;
 		prom_debug("Radix GTSE disabled from cmdline\n");
 	}
 
-	opt = prom_strstr(prom_cmd_line, "xive=off");
+	opt = early_strstr(prom_cmd_line, "xive=off");
 	if (opt) {
 		prom_xive_disable = true;
 		prom_debug("XIVE disabled from cmdline\n");
@@ -839,7 +740,7 @@ static void __init early_cmdline_parse(void)
 #endif /* CONFIG_PPC_PSERIES */
 
 #ifdef CONFIG_PPC_SVM
-	opt = prom_strstr(prom_cmd_line, "svm=");
+	opt = early_strstr(prom_cmd_line, "svm=");
 	if (opt) {
 		bool val;
 
@@ -1199,7 +1100,7 @@ static int __init prom_count_smt_threads(void)
 		type[0] = 0;
 		prom_getprop(node, "device_type", type, sizeof(type));
 
-		if (prom_strcmp(type, "cpu"))
+		if (early_strcmp(type, "cpu"))
 			continue;
 		/*
 		 * There is an entry for each smt thread, each entry being
@@ -1650,7 +1551,7 @@ static void __init prom_init_mem(void)
 			 */
 			prom_getprop(node, "name", type, sizeof(type));
 		}
-		if (prom_strcmp(type, "memory"))
+		if (early_strcmp(type, "memory"))
 			continue;
 
 		plen = prom_getprop(node, "reg", regbuf, sizeof(regbuf));
@@ -1972,19 +1873,19 @@ static void __init prom_initialize_tce_table(void)
 		prom_getprop(node, "device_type", type, sizeof(type));
 		prom_getprop(node, "model", model, sizeof(model));
 
-		if ((type[0] == 0) || (prom_strstr(type, "pci") == NULL))
+		if ((type[0] == 0) || (early_strstr(type, "pci") == NULL))
 			continue;
 
 		/* Keep the old logic intact to avoid regression. */
 		if (compatible[0] != 0) {
-			if ((prom_strstr(compatible, "python") == NULL) &&
-			    (prom_strstr(compatible, "Speedwagon") == NULL) &&
-			    (prom_strstr(compatible, "Winnipeg") == NULL))
+			if ((early_strstr(compatible, "python") == NULL) &&
+			    (early_strstr(compatible, "Speedwagon") == NULL) &&
+			    (early_strstr(compatible, "Winnipeg") == NULL))
 				continue;
 		} else if (model[0] != 0) {
-			if ((prom_strstr(model, "ython") == NULL) &&
-			    (prom_strstr(model, "peedwagon") == NULL) &&
-			    (prom_strstr(model, "innipeg") == NULL))
+			if ((early_strstr(model, "ython") == NULL) &&
+			    (early_strstr(model, "peedwagon") == NULL) &&
+			    (early_strstr(model, "innipeg") == NULL))
 				continue;
 		}
 
@@ -2133,12 +2034,12 @@ static void __init prom_hold_cpus(void)
 
 		type[0] = 0;
 		prom_getprop(node, "device_type", type, sizeof(type));
-		if (prom_strcmp(type, "cpu") != 0)
+		if (early_strcmp(type, "cpu") != 0)
 			continue;
 
 		/* Skip non-configured cpus. */
 		if (prom_getprop(node, "status", type, sizeof(type)) > 0)
-			if (prom_strcmp(type, "okay") != 0)
+			if (early_strcmp(type, "okay") != 0)
 				continue;
 
 		reg = cpu_to_be32(-1); /* make sparse happy */
@@ -2214,9 +2115,9 @@ static void __init prom_find_mmu(void)
 		return;
 	version[sizeof(version) - 1] = 0;
 	/* XXX might need to add other versions here */
-	if (prom_strcmp(version, "Open Firmware, 1.0.5") == 0)
+	if (early_strcmp(version, "Open Firmware, 1.0.5") == 0)
 		of_workarounds = OF_WA_CLAIM;
-	else if (prom_strncmp(version, "FirmWorks,3.", 12) == 0) {
+	else if (early_strncmp(version, "FirmWorks,3.", 12) == 0) {
 		of_workarounds = OF_WA_CLAIM | OF_WA_LONGTRAIL;
 		call_prom("interpret", 1, 1, "dev /memory 0 to allow-reclaim");
 	} else
@@ -2249,7 +2150,7 @@ static void __init prom_init_stdout(void)
 	call_prom("instance-to-path", 3, 1, prom.stdout, path, 255);
 	prom_printf("OF stdout device is: %s\n", of_stdout_device);
 	prom_setprop(prom.chosen, "/chosen", "linux,stdout-path",
-		     path, prom_strlen(path) + 1);
+		     path, early_strlen(path) + 1);
 
 	/* instance-to-package fails on PA-Semi */
 	stdout_node = call_prom("instance-to-package", 1, 1, prom.stdout);
@@ -2259,7 +2160,7 @@ static void __init prom_init_stdout(void)
 		/* If it's a display, note it */
 		memset(type, 0, sizeof(type));
 		prom_getprop(stdout_node, "device_type", type, sizeof(type));
-		if (prom_strcmp(type, "display") == 0)
+		if (early_strcmp(type, "display") == 0)
 			prom_setprop(stdout_node, path, "linux,boot-display", NULL, 0);
 	}
 }
@@ -2280,19 +2181,19 @@ static int __init prom_find_machine_type(void)
 		compat[len] = 0;
 		while (i < len) {
 			char *p = &compat[i];
-			int sl = prom_strlen(p);
+			int sl = early_strlen(p);
 			if (sl == 0)
 				break;
-			if (prom_strstr(p, "Power Macintosh") ||
-			    prom_strstr(p, "MacRISC"))
+			if (early_strstr(p, "Power Macintosh") ||
+			    early_strstr(p, "MacRISC"))
 				return PLATFORM_POWERMAC;
 #ifdef CONFIG_PPC64
 			/* We must make sure we don't detect the IBM Cell
 			 * blades as pSeries due to some firmware issues,
 			 * so we do it here.
 			 */
-			if (prom_strstr(p, "IBM,CBEA") ||
-			    prom_strstr(p, "IBM,CPBW-1.0"))
+			if (early_strstr(p, "IBM,CBEA") ||
+			    early_strstr(p, "IBM,CPBW-1.0"))
 				return PLATFORM_GENERIC;
 #endif /* CONFIG_PPC64 */
 			i += sl + 1;
@@ -2309,7 +2210,7 @@ static int __init prom_find_machine_type(void)
 			   compat, sizeof(compat)-1);
 	if (len <= 0)
 		return PLATFORM_GENERIC;
-	if (prom_strcmp(compat, "chrp"))
+	if (early_strcmp(compat, "chrp"))
 		return PLATFORM_GENERIC;
 
 	/* Default to pSeries. We need to know if we are running LPAR */
@@ -2371,7 +2272,7 @@ static void __init prom_check_displays(void)
 	for (node = 0; prom_next_node(&node); ) {
 		memset(type, 0, sizeof(type));
 		prom_getprop(node, "device_type", type, sizeof(type));
-		if (prom_strcmp(type, "display") != 0)
+		if (early_strcmp(type, "display") != 0)
 			continue;
 
 		/* It seems OF doesn't null-terminate the path :-( */
@@ -2485,9 +2386,9 @@ static unsigned long __init dt_find_string(char *str)
 	s = os = (char *)dt_string_start;
 	s += 4;
 	while (s <  (char *)dt_string_end) {
-		if (prom_strcmp(s, str) == 0)
+		if (early_strcmp(s, str) == 0)
 			return s - os;
-		s += prom_strlen(s) + 1;
+		s += early_strlen(s) + 1;
 	}
 	return 0;
 }
@@ -2520,7 +2421,7 @@ static void __init scan_dt_build_strings(phandle node,
 		}
 
  		/* skip "name" */
-		if (prom_strcmp(namep, "name") == 0) {
+		if (early_strcmp(namep, "name") == 0) {
  			*mem_start = (unsigned long)namep;
  			prev_name = "name";
  			continue;
@@ -2532,7 +2433,7 @@ static void __init scan_dt_build_strings(phandle node,
 			namep = sstart + soff;
 		} else {
 			/* Trim off some if we can */
-			*mem_start = (unsigned long)namep + prom_strlen(namep) + 1;
+			*mem_start = (unsigned long)namep + early_strlen(namep) + 1;
 			dt_string_end = *mem_start;
 		}
 		prev_name = namep;
@@ -2601,7 +2502,7 @@ static void __init scan_dt_build_struct(phandle node, unsigned long *mem_start,
 			break;
 
  		/* skip "name" */
-		if (prom_strcmp(pname, "name") == 0) {
+		if (early_strcmp(pname, "name") == 0) {
  			prev_name = "name";
  			continue;
  		}
@@ -2632,7 +2533,7 @@ static void __init scan_dt_build_struct(phandle node, unsigned long *mem_start,
 		call_prom("getprop", 4, 1, node, pname, valp, l);
 		*mem_start = ALIGN(*mem_start, 4);
 
-		if (!prom_strcmp(pname, "phandle"))
+		if (!early_strcmp(pname, "phandle"))
 			has_phandle = 1;
 	}
 
@@ -2702,8 +2603,8 @@ static void __init flatten_device_tree(void)
 
 	/* Add "phandle" in there, we'll need it */
 	namep = make_room(&mem_start, &mem_end, 16, 1);
-	prom_strcpy(namep, "phandle");
-	mem_start = (unsigned long)namep + prom_strlen(namep) + 1;
+	early_strcpy(namep, "phandle");
+	mem_start = (unsigned long)namep + early_strlen(namep) + 1;
 
 	/* Build string array */
 	prom_printf("Building dt strings...\n"); 
@@ -3025,7 +2926,7 @@ static void __init fixup_device_tree_efika(void)
 	rv = prom_getprop(node, "model", prop, sizeof(prop));
 	if (rv == PROM_ERROR)
 		return;
-	if (prom_strcmp(prop, "EFIKA5K2"))
+	if (early_strcmp(prop, "EFIKA5K2"))
 		return;
 
 	prom_printf("Applying EFIKA device tree fixups\n");
@@ -3033,13 +2934,13 @@ static void __init fixup_device_tree_efika(void)
 	/* Claiming to be 'chrp' is death */
 	node = call_prom("finddevice", 1, 1, ADDR("/"));
 	rv = prom_getprop(node, "device_type", prop, sizeof(prop));
-	if (rv != PROM_ERROR && (prom_strcmp(prop, "chrp") == 0))
+	if (rv != PROM_ERROR && (early_strcmp(prop, "chrp") == 0))
 		prom_setprop(node, "/", "device_type", "efika", sizeof("efika"));
 
 	/* CODEGEN,description is exposed in /proc/cpuinfo so
 	   fix that too */
 	rv = prom_getprop(node, "CODEGEN,description", prop, sizeof(prop));
-	if (rv != PROM_ERROR && (prom_strstr(prop, "CHRP")))
+	if (rv != PROM_ERROR && (early_strstr(prop, "CHRP")))
 		prom_setprop(node, "/", "CODEGEN,description",
 			     "Efika 5200B PowerPC System",
 			     sizeof("Efika 5200B PowerPC System"));
diff --git a/arch/powerpc/kernel/prom_init_check.sh b/arch/powerpc/kernel/prom_init_check.sh
index b183ab9c5107..bbdeba750d52 100644
--- a/arch/powerpc/kernel/prom_init_check.sh
+++ b/arch/powerpc/kernel/prom_init_check.sh
@@ -27,7 +27,14 @@ __secondary_hold_acknowledge __secondary_hold_spinloop __start
 logo_linux_clut224 btext_prepare_BAT
 reloc_got2 kernstart_addr memstart_addr linux_banner _stext
 __prom_init_toc_start __prom_init_toc_end btext_setup_display TOC.
-relocate"
+relocate
+early_strcmp
+early_strcpy
+early_strlcat
+early_strlen
+early_strncmp
+early_strstr
+"
 
 NM="$1"
 OBJ="$2"
-- 
2.25.1

