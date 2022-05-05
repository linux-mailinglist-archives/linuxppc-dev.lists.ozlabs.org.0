Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF3451B8C2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 09:26:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kv4xg0vNtz3c8g
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 17:26:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=2JXJtDn1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.79;
 helo=conuserg-12.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=2JXJtDn1; 
 dkim-atps=neutral
Received: from conuserg-12.nifty.com (conuserg-12.nifty.com [210.131.2.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kv4wQ1lNRz2xnT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 17:25:09 +1000 (AEST)
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp
 [133.32.177.133]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id 2457Nenl019426;
 Thu, 5 May 2022 16:23:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 2457Nenl019426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1651735424;
 bh=BFUO29caSUfobdcXOazaV3japZmLNF4oOw4tiPaDpqU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2JXJtDn1hClMMIl6bpROdtphb7/17freo+cExsk4J/TqIDUdWrhKpo1o6NUNh/N58
 FaQ70f+YJJ/kk9WFVGWJQMNfNKKFdcY7vy9JQ/HwvMf+QX4rNCKE/9yjvXt2bJVWD9
 r0eq6EECwY2wndn8OtvSRs1egxovqi5mhxtmPEH/cPOmeO5GAS0dn0ZWWlg7sRmPrX
 /KYZPW/9dnYmKW7DZ6CjoCWT7lt/0TjPi8l9YfWL58ZV5uYLpGBHsPfOm3TwxkZyF+
 ZEuHzSYuVCHMH0vnqyY0K9YjNqU10nv7KZdtgpeGsMJgiYMLtRTDfqWfAtONJsNwrl
 w3JB3Ca53DTeQ==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH v3 03/15] modpost: merge add_{intree_flag, retpoline,
 staging_flag} to add_header
Date: Thu,  5 May 2022 16:22:32 +0900
Message-Id: <20220505072244.1155033-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505072244.1155033-1-masahiroy@kernel.org>
References: <20220505072244.1155033-1-masahiroy@kernel.org>
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
Cc: linux-s390@vger.kernel.org, Nicolas Schier a <nicolas@fjasle.eu>,
 Peter Zijlstra <peterz@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>,
 Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

add_intree_flag(), add_retpoline(), and add_staging_flag() are small
enough to be merged into add_header().

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v3:
  - New patch

 scripts/mod/modpost.c | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index ebd80c77fa03..ae8e4a4dcfd2 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2200,25 +2200,17 @@ static void add_header(struct buffer *b, struct module *mod)
 			      "#endif\n");
 	buf_printf(b, "\t.arch = MODULE_ARCH_INIT,\n");
 	buf_printf(b, "};\n");
-}
 
-static void add_intree_flag(struct buffer *b, int is_intree)
-{
-	if (is_intree)
+	if (!external_module)
 		buf_printf(b, "\nMODULE_INFO(intree, \"Y\");\n");
-}
 
-/* Cannot check for assembler */
-static void add_retpoline(struct buffer *b)
-{
-	buf_printf(b, "\n#ifdef CONFIG_RETPOLINE\n");
-	buf_printf(b, "MODULE_INFO(retpoline, \"Y\");\n");
-	buf_printf(b, "#endif\n");
-}
+	buf_printf(b,
+		   "\n"
+		   "#ifdef CONFIG_RETPOLINE\n"
+		   "MODULE_INFO(retpoline, \"Y\");\n"
+		   "#endif\n");
 
-static void add_staging_flag(struct buffer *b, const char *name)
-{
-	if (strstarts(name, "drivers/staging"))
+	if (strstarts(mod->name, "drivers/staging"))
 		buf_printf(b, "\nMODULE_INFO(staging, \"Y\");\n");
 }
 
@@ -2544,9 +2536,6 @@ int main(int argc, char **argv)
 		check_exports(mod);
 
 		add_header(&buf, mod);
-		add_intree_flag(&buf, !external_module);
-		add_retpoline(&buf);
-		add_staging_flag(&buf, mod->name);
 		add_versions(&buf, mod);
 		add_depends(&buf, mod);
 		add_moddevtable(&buf, mod);
-- 
2.32.0

