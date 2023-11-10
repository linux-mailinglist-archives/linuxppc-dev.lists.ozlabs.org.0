Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5207E76C0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 02:43:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=bef2+W+C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRM6W6G1Wz3dSg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 12:43:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=bef2+W+C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cisco.com (client-ip=173.37.86.72; helo=rcdn-iport-1.cisco.com; envelope-from=danielwa@cisco.com; receiver=lists.ozlabs.org)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRM1w1yzmz3cHF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Nov 2023 12:39:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=8964; q=dns/txt; s=iport;
  t=1699580372; x=1700789972;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ph2cgjZ6gaQSUAykW430HJcmt2goGg2TB7Xn0db8Fr8=;
  b=bef2+W+Ce0da/NtqtbsVoKwATjLNxLZ/yQlATplb/8ixjVypNuTBpL6n
   WAB3NSL9OAo2peiIST1k5OJUJ+w0FwdA5gFYP64v+fedwg8aYermtxLYI
   I8Yb+3r1FXMk1/lLO2XY69wEIiuzppiaSO1Nm7hBRE0Md9wdwDGLOBmhW
   g=;
X-CSE-ConnectionGUID: zhrdqHU/QkuzLT/zKJjFkQ==
X-CSE-MsgGUID: G+b1gXNoRHWSvsGOy/K6pw==
X-IPAS-Result: =?us-ascii?q?A0AHAADbh01lmJtdJa1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBgX4CAQEBAQsBhAdASJYxgRaeEANWDwEBAQ9EBAEBhQYChyYCJ?=
 =?us-ascii?q?jcGDgECBAEBAQEDAgMBAQEBAQEBAgEBBQEBAQIBBwQUAQEBAQEBAQEeGQUQD?=
 =?us-ascii?q?ieFdYZNAwMnCwFGEFFXBgESgn6CXwOtV4F5M4EBsyiBaBiBMAGMQ4EehDUnG?=
 =?us-ascii?q?4FJRIEVgnJ2iwYEiSUHMoIigj6BFI1Lf0daFh0DBwNWKRArBwQtIgYJFC0jB?=
 =?us-ascii?q?lEEFxEkCRMSPgSBY4FRCn8/Dw4Rgj8iAj02GUiCWxVABEZ2ECoEFBeBEm4bF?=
 =?us-ascii?q?R43ERIXDQMIdB0CESM8AwUDBDMKEg0LIQUUQgNCBkkLAwIaBQMDBIE2BQ0eA?=
 =?us-ascii?q?hAtJwMDE00CEBQDOwMDBgMLMQMwVUQMUQNvHxocCTwPDB8CGx4NJygCNUMDE?=
 =?us-ascii?q?QUSAhYDJBkERQMJAwcFSUADCxgNSBEsNQYOGwY/cwegY2sFAQF7E0OBQ2WTB?=
 =?us-ascii?q?o8ugh2gR4QXgV+fKhozhAGMc5kPmD8goyKFD4F5JIFbMxoIGxWDIlIZD44pA?=
 =?us-ascii?q?w0JkxIBXSMyOwIHCwEBAwmLSgEB?=
IronPort-Data: A9a23:MGYXh6qHWLr9tLqmxckn06t/cYFeBmI2YhIvgKrLsJaIsI4StFCzt
 garIBmGaKuNY2f9Ktx/adi0p0IHscTcnNYySlRlrS0wEysb9+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7wdOCn9T8ljf3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYATNNwJcaDpOsPva8Us35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum1hK6b5Ofbi1q/UTe5EqU2M00Mi+7gx3R9zx4J
 U4kWZaYEW/FNYWU8AgRvoUx/yxWZcV7FLH7zXeXo8yJw1TmTjzVwOh8KH1xL646+Mh0ODQbn
 RAYAGhlghGrnem6xvewTfNhw5hlJ8jwN4RZsXZlpd3bJa95GtaYHOObvpkBgWpYasNmRZ4yY
 +IVYDxuYRDfajVEO0wcD9Q1m+LAanzXKmYE+ALI/fFti4TV5CMy2uHiAPzSQPy1fttOsWGJ4
 UGY53usV3n2M/TGmWbarRpAnNTnmSL9RZJXF7Ci8PNuqEOcy3ZVCxAMU1a/5/6jhSaWX9NZN
 lwM4iFroaUs3EiqVcXmGRqqpHeOpVgbQdU4O+k77hydj6/V+x2xGGcJVHhCZcYguctwQiYlv
 neZz43BBjF1trCRD3WH+d+8tj67P24cK2MPfzQDSyMe7tLk5oo0i3rnUtFmGbXzi8D5Ayz2w
 Dmioy03hrFVhskOv42i4FHMtCqmvJHJSwcd/xjWVWOj5UVyY4vNT4Wr8V3z6fdGMZbcQF6cu
 nQNh8mZ6qYJF57lvCCERuQAGJmm5vOdPTnRn19kH986/jLo9WSqe4tR+zp5YkxgdNsfERfzZ
 0XTkQBc/pleOD2td6AfS4mxEcUx0a/4FdmjUv3OactmaYN+bgia5GdjeCa4wGHplGAvnLs5N
 JPddtyjZUv2Eox9xzawAuway7JummY1xHjYQtbwyBHPPaeiiGC9W7cfPEKuU6cA776WhDmS4
 fV9NeWJ8kAKOAHhWRX//YkWJFEMCHE0A5HqtsBaHtJvxCI7RgnN7NeMnNscl5xZc7d9zbiXo
 ynsMqNM4B+u2i2dcFTihmVLMeu3Bf5CQWQH0TvA1GtENlA5aoqpqawYbZZyIf8s9fdoyrh/S
 PxtlyS87hZnFGivF9c1NMSVQGlemPKD2V7m082NPGBXQnKYb1aVkuIIhyO2nMX0MgK5tNElv
 5qr3R7BTJwISmxKVZiHOa/ykw3t7SNCxIqeunckxPENIS0AF6A0c0TMYgMff6ng1D2anGLBj
 lbKafvmjbOR+dFdHCb1aVCs9tf1TLQW8rtyFGjA5rH+LjjB4mem2ud9vBWgI1jguJfP0Pz6P
 419lqikWNVexQYim9QnSd5Dk/lhj+YDUpcHlGyI6l2RMQTyYl6hS1HbtfRyWlpln+QJ4VfmB
 RLTqrG3+9yhYavYLbLYHyJ9Bszr6B3esmC6ASgdSKki2BJKwQ==
IronPort-HdrOrdr: A9a23:ZyeMI6AvpK+VkRDlHemX55DYdb4zR+YMi2TDGXocdfUzSL39qy
 nAppomPHPP4gr5HUtQ+uxoW5PwJE80i6QV3WB5B97LNzUO+lHYTr2KhrGM/9SPIUDDH8dmpM
 BdmtBFaOEZyTNB/L/HCM7SKadH/OW6
X-Talos-CUID: 9a23:wWqg4GzSMUYp0AaECXDiBgUGGtopa13gi07TPl2cNSF7a5+XZ1yprfY=
X-Talos-MUID: 9a23:VBkX/gm8UdLSI3zTlkKadnpNd80x7JSID3otrq4YoOajJGtTZS+C2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.03,291,1694736000"; 
   d="scan'208";a="134885032"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 01:38:22 +0000
Received: from goliath.lan ([10.25.128.169])
	by rcdn-core-4.cisco.com (8.15.2/8.15.2) with ESMTP id 3AA1cHVI011466;
	Fri, 10 Nov 2023 01:38:21 GMT
From: Daniel Walker <danielwa@cisco.com>
To: Will Deacon <will@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Rob Herring <robh@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>,
        Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Tomas Mudrunka <tomas.mudrunka@gmail.com>,
        Sean Anderson <sean.anderson@seco.com>, x86@kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/8] scripts: insert-sys-cert: add command line insert capability
Date: Thu,  9 Nov 2023 17:38:06 -0800
Message-Id: <20231110013817.2378507-3-danielwa@cisco.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231110013817.2378507-1-danielwa@cisco.com>
References: <20231110013817.2378507-1-danielwa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.25.128.169, [10.25.128.169]
X-Outbound-Node: rcdn-core-4.cisco.com
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
2.39.2

