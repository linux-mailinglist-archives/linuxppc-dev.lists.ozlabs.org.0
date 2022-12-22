Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F69654514
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Dec 2022 17:26:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NdG0d03D6z3c4f
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Dec 2022 03:26:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aBvV5hjg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aBvV5hjg;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NdFzg4WSxz30RT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Dec 2022 03:25:51 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9AEC7B81EB5;
	Thu, 22 Dec 2022 16:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61422C433EF;
	Thu, 22 Dec 2022 16:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671726345;
	bh=I1QQ3wj0EZ2LVmZ8RlrxP6BvTX3HOQCzJhPb1JK3S5Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aBvV5hjgmYtdnsRh/a6xDn8u4JdX5WJaAgikE/hwoGibLaiBICdjG89ctJI1/f8bi
	 ep42tSDdAVcnj6ahLM8Kpf9reEuhobVNB2PxBNIqGbrVZRa+GSAKcZOU4jygQL9m4x
	 XKaFPvG/r7anSl75C0i8wWTg6CvZSJyFfdK5AoTKDh70xsZjc2wh/ZvY30x2QxklEI
	 8bbmSrhXUa2KMOUDOdIKHPjxk4byrn1GiOx22dhx6kDKOxEl8q2jbpJHppy5VDYF4j
	 lCD/S2QHGr9+Ih7rzONuTUaGO7KYxYCWsd3TeJgcFaV2yJTK6wT62N8lpgH4JR5r/o
	 YclT7GIzx1o0g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH 3/5] kbuild: do not print extra logs for V=2
Date: Fri, 23 Dec 2022 01:25:33 +0900
Message-Id: <20221222162535.1578462-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221222162535.1578462-1-masahiroy@kernel.org>
References: <20221222162535.1578462-1-masahiroy@kernel.org>
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
Cc: Zeng Heng <zengheng4@huawei.com>, linuxppc-dev@lists.ozlabs.org, Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>, linux-doc@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org, Liam Howlett <liam.howlett@oracle.com>, David Woodhouse <dwmw2@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some scripts increase the verbose level when V=1, but others when
not V=0.

I think the former is correct because V=2 is not a log level but
a switch to print the reason for rebuilding.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/Makefile                 | 2 +-
 arch/powerpc/kernel/prom_init_check.sh | 9 ++++-----
 certs/extract-cert.c                   | 9 ++++++---
 scripts/asn1_compiler.c                | 4 ++--
 scripts/kernel-doc                     | 4 ++--
 5 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index bb73dcb5ed05..023fa658a0a8 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -28,7 +28,7 @@ BUILDDIR      = $(obj)/output
 PDFLATEX      = xelatex
 LATEXOPTS     = -interaction=batchmode -no-shell-escape
 
-ifeq ($(KBUILD_VERBOSE),0)
+ifeq ($(findstring 1, $(KBUILD_VERBOSE)),)
 SPHINXOPTS    += "-q"
 endif
 
diff --git a/arch/powerpc/kernel/prom_init_check.sh b/arch/powerpc/kernel/prom_init_check.sh
index 311890d71c4c..5a319863f289 100644
--- a/arch/powerpc/kernel/prom_init_check.sh
+++ b/arch/powerpc/kernel/prom_init_check.sh
@@ -51,11 +51,10 @@ do
 	# a leading . on the name, so strip it off here.
 	UNDEF="${UNDEF#.}"
 
-	if [ $KBUILD_VERBOSE ]; then
-		if [ $KBUILD_VERBOSE -ne 0 ]; then
-			echo "Checking prom_init.o symbol '$UNDEF'"
-		fi
-	fi
+	case "$KBUILD_VERBOSE" in
+	*1*)
+		echo "Checking prom_init.o symbol '$UNDEF'" ;;
+	esac
 
 	OK=0
 	for WHITE in $WHITELIST
diff --git a/certs/extract-cert.c b/certs/extract-cert.c
index 8c1fb9a70d66..d3a0ff2867c0 100644
--- a/certs/extract-cert.c
+++ b/certs/extract-cert.c
@@ -78,7 +78,7 @@ static void drain_openssl_errors(void)
 static const char *key_pass;
 static BIO *wb;
 static char *cert_dst;
-static int kbuild_verbose;
+static bool verbose;
 
 static void write_cert(X509 *x509)
 {
@@ -90,19 +90,22 @@ static void write_cert(X509 *x509)
 	}
 	X509_NAME_oneline(X509_get_subject_name(x509), buf, sizeof(buf));
 	ERR(!i2d_X509_bio(wb, x509), "%s", cert_dst);
-	if (kbuild_verbose)
+	if (verbose)
 		fprintf(stderr, "Extracted cert: %s\n", buf);
 }
 
 int main(int argc, char **argv)
 {
 	char *cert_src;
+	char *kbuild_verbose;
 
 	OpenSSL_add_all_algorithms();
 	ERR_load_crypto_strings();
 	ERR_clear_error();
 
-	kbuild_verbose = atoi(getenv("KBUILD_VERBOSE")?:"0");
+	kbuild_verbose = getenv("KBUILD_VERBOSE");
+	if (kbuild_verbose && strchr(kbuild_verbose, '1'))
+		verbose = true;
 
         key_pass = getenv("KBUILD_SIGN_PIN");
 
diff --git a/scripts/asn1_compiler.c b/scripts/asn1_compiler.c
index 71d4a7c87900..7b6756a8c15d 100644
--- a/scripts/asn1_compiler.c
+++ b/scripts/asn1_compiler.c
@@ -567,8 +567,8 @@ int main(int argc, char **argv)
 	int fd;
 
 	kbuild_verbose = getenv("KBUILD_VERBOSE");
-	if (kbuild_verbose)
-		verbose_opt = atoi(kbuild_verbose);
+	if (kbuild_verbose && strchr(kbuild_verbose, '1'))
+		verbose_opt = true;
 
 	while (argc > 4) {
 		if (strcmp(argv[1], "-v") == 0)
diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 54b0893cae66..8ad0a7d68d9a 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -175,8 +175,8 @@ my $declaration_start_line;
 my ($type, $declaration_name, $return_type);
 my ($newsection, $newcontents, $prototype, $brcount, %source_map);
 
-if (defined($ENV{'KBUILD_VERBOSE'})) {
-	$verbose = "$ENV{'KBUILD_VERBOSE'}";
+if (defined($ENV{'KBUILD_VERBOSE'}) && $ENV{'KBUILD_VERBOSE'} =~ '1') {
+	$verbose = 1;
 }
 
 if (defined($ENV{'KCFLAGS'})) {
-- 
2.34.1

