Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAE33618A2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 06:10:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM2nS0VCpz3bxM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 14:10:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=FVcz5IOB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.86.72; helo=rcdn-iport-1.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=FVcz5IOB; dkim-atps=neutral
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM2ly0jTxz302y
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 14:09:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=8964; q=dns/txt; s=iport;
 t=1618546174; x=1619755774;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ie6EtdAViAiALCeFYxNqsCsTGUdiUZbe/6PrULxlkAo=;
 b=FVcz5IOBUPzwD3bypEiRXzk5tfhK9APVk5HHGCR9+eHbgzU0nVwkCuVN
 Z40Kp1xVdcC2LmH6/ug4hhLAH9g0yzEEo/RgMTsue0SYnwidCxt59xD15
 0aD86d+25joex5vGXh0IaBZSYOVYdSlqYLqz19HihnMWMVns5gdOcosKq g=;
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AWHWvQ6AC+De4gZnlHejxsceALOonbusQ8z?=
 =?us-ascii?q?AX/mp6ICY4TuWzkceykPMHkSLugDEKV3063fyGMq+MQXTTnKQFhbU5EL++UG?=
 =?us-ascii?q?Dd1leAA5pl6eLZqQHIOyq7zeJF0LclTq4WMqySMXFfreLXpDa1CMwhxt7vyt?=
 =?us-ascii?q?HMuc77w212RQ9nL4Fshj0ZNi+hHkd7RBZLCPMCffL22uN9qzWtYngRZMigb0?=
 =?us-ascii?q?N1PdTrncHBl57tfHc9aCIP1Q/mt16VwY+/OwSE2FMkXylXx7A5/Sz+jxXh/a?=
 =?us-ascii?q?m4qZiAu3jh/l6Wy5xXndf7o+EiOOW8zu4INz7rlgGkIKNmVrHqhkFNnMifrH?=
 =?us-ascii?q?A3jdLLvxAse/5W1kqUVGS0rRzxsjOQtgoT1w=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BMAACIDXlg/4sNJK1aHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQGBfgcBAQsBAYIpgU0BOTGMZ4lOgQyZYoF8CwEBAQ80BAEBhFA?=
 =?us-ascii?q?CgXMCJTQJDgIDAQEMAQEFAQEBAgEGBHEThV1DFgGFawYnCwFGEFFXBgESgnG?=
 =?us-ascii?q?DCKwHgXgzgQGIM4FEFIElAYhrdIN1JxyBSUKBE4JsdIo5BIFVawUBAXsTQ4F?=
 =?us-ascii?q?CY5ERi1SBf5wtgxaBJptRDyODTop8ljKVGJ8GMYQrgVQ6gVkzGggbFYMkUBk?=
 =?us-ascii?q?OjigDFo1rAVshAy84AgYKAQEDCYlOg0ABAQ?=
X-IronPort-AV: E=Sophos;i="5.82,226,1613433600"; d="scan'208";a="876181596"
Received: from alln-core-6.cisco.com ([173.36.13.139])
 by rcdn-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 16 Apr 2021 04:09:30 +0000
Received: from zorba.cisco.com ([10.24.7.67])
 by alln-core-6.cisco.com (8.15.2/8.15.2) with ESMTP id 13G49OHh016753;
 Fri, 16 Apr 2021 04:09:29 GMT
From: Daniel Walker <danielwa@cisco.com>
To: Will Deacon <will@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Rob Herring <robh@kernel.org>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/8] scripts: insert-sys-cert: add command line insert
 capability
Date: Thu, 15 Apr 2021 21:09:13 -0700
Message-Id: <20210416040924.2882771-3-danielwa@cisco.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416040924.2882771-1-danielwa@cisco.com>
References: <20210416040924.2882771-1-danielwa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.7.67, [10.24.7.67]
X-Outbound-Node: alln-core-6.cisco.com
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
Cc: linux-kernel@vger.kernel.org, xe-linux-external@cisco.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds changes to the insert-sys-cert tool to allow updating
the cmdline_prepend and cmdline_append symbols in addition to
adding certificates.

Updating the cmdline symbols was tested on a PVH virtual machine
with a vmlinux, and with a bzImage which was repackaged on x86.

This commit intentionally keeps the tool filename the same to allow
the changes to be seen more easily. The next commit will change
the name of the tool.

Cc: xe-linux-external@cisco.com
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 scripts/insert-sys-cert.c | 241 +++++++++++++++++++++++++++-----------
 1 file changed, 170 insertions(+), 71 deletions(-)

diff --git a/scripts/insert-sys-cert.c b/scripts/insert-sys-cert.c
index 8902836c2342..77d3306cfbfb 100644
--- a/scripts/insert-sys-cert.c
+++ b/scripts/insert-sys-cert.c
@@ -30,6 +30,9 @@
 #define USED_SYM  "system_extra_cert_used"
 #define LSIZE_SYM "system_certificate_list_size"
 
+#define CMDLINE_APPEND "cmdline_append"
+#define CMDLINE_PREPEND "cmdline_prepend"
+
 #define info(format, args...) fprintf(stderr, "INFO:    " format, ## args)
 #define warn(format, args...) fprintf(stdout, "WARNING: " format, ## args)
 #define  err(format, args...) fprintf(stderr, "ERROR:   " format, ## args)
@@ -267,95 +270,46 @@ static void print_sym(Elf_Ehdr *hdr, struct sym *s)
 
 static void print_usage(char *e)
 {
-	printf("Usage %s [-s <System.map>] -b <vmlinux> -c <certfile>\n", e);
+	printf("Usage %s [-s <System.map>] -b <vmlinux> [ -c <certfile> | -p <command line prepend> | -a <command line append> ]-\n", e);
 }
 
-int main(int argc, char **argv)
+static char *cmdline_prepend, *cmdline_append;
+static char *system_map_file;
+static char *cert_file;
+static char *cli_name;
+
+static int insert_certificate(Elf_Ehdr *hdr)
 {
-	char *system_map_file = NULL;
-	char *vmlinux_file = NULL;
-	char *cert_file = NULL;
-	int vmlinux_size;
+	struct sym cert_sym, lsize_sym, used_sym;
+	Elf_Shdr *symtab = NULL;
+	unsigned long *lsize;
+	FILE *system_map;
 	int cert_size;
-	Elf_Ehdr *hdr;
 	char *cert;
-	FILE *system_map;
-	unsigned long *lsize;
 	int *used;
-	int opt;
-	Elf_Shdr *symtab = NULL;
-	struct sym cert_sym, lsize_sym, used_sym;
-
-	while ((opt = getopt(argc, argv, "b:c:s:")) != -1) {
-		switch (opt) {
-		case 's':
-			system_map_file = optarg;
-			break;
-		case 'b':
-			vmlinux_file = optarg;
-			break;
-		case 'c':
-			cert_file = optarg;
-			break;
-		default:
-			break;
-		}
-	}
 
-	if (!vmlinux_file || !cert_file) {
-		print_usage(argv[0]);
-		exit(EXIT_FAILURE);
+	if (!cert_file) {
+		print_usage(cli_name);
+		return EXIT_FAILURE;
 	}
 
 	cert = read_file(cert_file, &cert_size);
 	if (!cert)
-		exit(EXIT_FAILURE);
-
-	hdr = map_file(vmlinux_file, &vmlinux_size);
-	if (!hdr)
-		exit(EXIT_FAILURE);
-
-	if (vmlinux_size < sizeof(*hdr)) {
-		err("Invalid ELF file.\n");
-		exit(EXIT_FAILURE);
-	}
-
-	if ((hdr->e_ident[EI_MAG0] != ELFMAG0) ||
-	    (hdr->e_ident[EI_MAG1] != ELFMAG1) ||
-	    (hdr->e_ident[EI_MAG2] != ELFMAG2) ||
-	    (hdr->e_ident[EI_MAG3] != ELFMAG3)) {
-		err("Invalid ELF magic.\n");
-		exit(EXIT_FAILURE);
-	}
-
-	if (hdr->e_ident[EI_CLASS] != CURRENT_ELFCLASS) {
-		err("ELF class mismatch.\n");
-		exit(EXIT_FAILURE);
-	}
-
-	if (hdr->e_ident[EI_DATA] != endianness()) {
-		err("ELF endian mismatch.\n");
-		exit(EXIT_FAILURE);
-	}
-
-	if (hdr->e_shoff > vmlinux_size) {
-		err("Could not find section header.\n");
-		exit(EXIT_FAILURE);
-	}
+		return EXIT_FAILURE;
 
 	symtab = get_symbol_table(hdr);
 	if (!symtab) {
 		warn("Could not find the symbol table.\n");
 		if (!system_map_file) {
 			err("Please provide a System.map file.\n");
-			print_usage(argv[0]);
-			exit(EXIT_FAILURE);
+			print_usage(cli_name);
+			return EXIT_FAILURE;
 		}
 
 		system_map = fopen(system_map_file, "r");
 		if (!system_map) {
 			perror(system_map_file);
-			exit(EXIT_FAILURE);
+			return EXIT_FAILURE;
 		}
 		get_symbol_from_map(hdr, system_map, CERT_SYM, &cert_sym);
 		get_symbol_from_map(hdr, system_map, USED_SYM, &used_sym);
@@ -371,7 +325,7 @@ int main(int argc, char **argv)
 	}
 
 	if (!cert_sym.offset || !lsize_sym.offset || !used_sym.offset)
-		exit(EXIT_FAILURE);
+		return EXIT_FAILURE;
 
 	print_sym(hdr, &cert_sym);
 	print_sym(hdr, &used_sym);
@@ -382,14 +336,14 @@ int main(int argc, char **argv)
 
 	if (cert_sym.size < cert_size) {
 		err("Certificate is larger than the reserved area!\n");
-		exit(EXIT_FAILURE);
+		return EXIT_FAILURE;
 	}
 
 	/* If the existing cert is the same, don't overwrite */
 	if (cert_size == *used &&
 	    strncmp(cert_sym.content, cert, cert_size) == 0) {
 		warn("Certificate was already inserted.\n");
-		exit(EXIT_SUCCESS);
+		return EXIT_SUCCESS;
 	}
 
 	if (*used > 0)
@@ -406,5 +360,150 @@ int main(int argc, char **argv)
 						cert_sym.address);
 	info("Used %d bytes out of %d bytes reserved.\n", *used,
 						 cert_sym.size);
-	exit(EXIT_SUCCESS);
+	return EXIT_SUCCESS;
+}
+
+static int insert_cmdline(Elf_Ehdr *hdr)
+{
+	struct sym cmdline_prepend_sym, cmdline_append_sym;
+	Elf_Shdr *symtab = NULL;
+	FILE *system_map;
+
+	symtab = get_symbol_table(hdr);
+	if (!symtab) {
+		warn("Could not find the symbol table.\n");
+		if (!system_map_file) {
+			err("Please provide a System.map file.\n");
+			print_usage(cli_name);
+			return EXIT_FAILURE;
+		}
+
+		system_map = fopen(system_map_file, "r");
+		if (!system_map) {
+			perror(system_map_file);
+			return EXIT_FAILURE;
+		}
+		get_symbol_from_map(hdr, system_map, CMDLINE_PREPEND, &cmdline_prepend_sym);
+		get_symbol_from_map(hdr, system_map, CMDLINE_APPEND, &cmdline_append_sym);
+	} else {
+		info("Symbol table found.\n");
+		if (system_map_file)
+			warn("System.map is ignored.\n");
+		get_symbol_from_table(hdr, symtab, CMDLINE_PREPEND, &cmdline_prepend_sym);
+		get_symbol_from_table(hdr, symtab, CMDLINE_APPEND, &cmdline_append_sym);
+	}
+
+	print_sym(hdr, &cmdline_prepend_sym);
+	print_sym(hdr, &cmdline_append_sym);
+
+
+	if (cmdline_prepend) {
+		if ((strlen(cmdline_prepend) + 1) > cmdline_prepend_sym.size) {
+			err("cmdline prepend is larger than the reserved area!\n");
+			return EXIT_FAILURE;
+		}
+
+		memcpy(cmdline_prepend_sym.content, cmdline_prepend, strlen(cmdline_prepend) + 1);
+		if ((strlen(cmdline_prepend) + 1) < cmdline_prepend_sym.size)
+			memset(cmdline_prepend_sym.content + strlen(cmdline_prepend) + 1,
+				0, cmdline_prepend_sym.size - (strlen(cmdline_prepend) + 1));
+
+		info("Inserted cmdline prepend of \"%s\" into vmlinux.\n", cmdline_prepend);
+
+	}
+	if (cmdline_append) {
+		if ((strlen(cmdline_append) + 1) > cmdline_append_sym.size) {
+			err("cmdline append is larger than the reserved area!\n");
+			return EXIT_FAILURE;
+		}
+
+		memcpy(cmdline_append_sym.content, cmdline_append, strlen(cmdline_append) + 1);
+		if ((strlen(cmdline_append) + 1) < cmdline_append_sym.size)
+			memset(cmdline_append_sym.content + strlen(cmdline_append) + 1,
+				0, cmdline_append_sym.size - (strlen(cmdline_append) + 1));
+
+		info("Inserted cmdline append of \"%s\" into vmlinux.\n", cmdline_append);
+
+	}
+	return EXIT_SUCCESS;
+}
+
+int main(int argc, char **argv)
+{
+	char *vmlinux_file = NULL;
+	int vmlinux_size;
+	Elf_Ehdr *hdr;
+	int opt;
+	int ret = EXIT_SUCCESS;
+
+	while ((opt = getopt(argc, argv, "b:c:s:p:a:")) != -1) {
+		switch (opt) {
+		case 's':
+			system_map_file = optarg;
+			break;
+		case 'b':
+			vmlinux_file = optarg;
+			break;
+		case 'c':
+			cert_file = optarg;
+			break;
+		case 'p':
+			cmdline_prepend = optarg;
+			break;
+		case 'a':
+			cmdline_append = optarg;
+			break;
+		default:
+			break;
+		}
+	}
+
+	cli_name = argv[0];
+
+	if (!vmlinux_file) {
+		print_usage(cli_name);
+		exit(EXIT_FAILURE);
+	}
+
+	hdr = map_file(vmlinux_file, &vmlinux_size);
+	if (!hdr)
+		exit(EXIT_FAILURE);
+
+	if (vmlinux_size < sizeof(*hdr)) {
+		err("Invalid ELF file.\n");
+		exit(EXIT_FAILURE);
+	}
+
+	if ((hdr->e_ident[EI_MAG0] != ELFMAG0) ||
+	    (hdr->e_ident[EI_MAG1] != ELFMAG1) ||
+	    (hdr->e_ident[EI_MAG2] != ELFMAG2) ||
+	    (hdr->e_ident[EI_MAG3] != ELFMAG3)) {
+		err("Invalid ELF magic.\n");
+		exit(EXIT_FAILURE);
+	}
+
+	if (hdr->e_ident[EI_CLASS] != CURRENT_ELFCLASS) {
+		err("ELF class mismatch.\n");
+		exit(EXIT_FAILURE);
+	}
+
+	if (hdr->e_ident[EI_DATA] != endianness()) {
+		err("ELF endian mismatch.\n");
+		exit(EXIT_FAILURE);
+	}
+
+	if (hdr->e_shoff > vmlinux_size) {
+		err("Could not find section header.\n");
+		exit(EXIT_FAILURE);
+	}
+
+	if (cert_file) {
+		ret = insert_certificate(hdr);
+		printf("%s\n", cert_file);
+	}
+
+	if (cmdline_append || cmdline_prepend)
+		ret = insert_cmdline(hdr);
+
+	exit(ret);
 }
-- 
2.25.1

