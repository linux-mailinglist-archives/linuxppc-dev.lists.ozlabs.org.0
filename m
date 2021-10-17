Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D7F430911
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Oct 2021 14:45:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXKTk5LZ2z3fJC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Oct 2021 23:44:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXKNB6dStz3ckD
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Oct 2021 23:40:10 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HXKMD1Tc9z9sSq;
 Sun, 17 Oct 2021 14:39:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nlwBg3321UPU; Sun, 17 Oct 2021 14:39:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HXKM03Bw2z9sS8;
 Sun, 17 Oct 2021 14:39:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 560D78B763;
 Sun, 17 Oct 2021 14:39:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id coCs4OD-_eZ8; Sun, 17 Oct 2021 14:39:08 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.38])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DF1228B78B;
 Sun, 17 Oct 2021 14:39:06 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19HCcuNA2946773
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sun, 17 Oct 2021 14:38:56 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19HCcuEt2946772;
 Sun, 17 Oct 2021 14:38:56 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>,
 Kees Cook <keescook@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 11/12] lkdtm: Fix execute_[user]_location()
Date: Sun, 17 Oct 2021 14:38:24 +0200
Message-Id: <d4688c2af08dda706d3b6786ae5ec5a74e6171f1.1634457599.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1634457599.git.christophe.leroy@csgroup.eu>
References: <cover.1634457599.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634474303; l=3309; s=20211009;
 h=from:subject:message-id; bh=sfbflkA2bmAlwjw54HOBXpCt422Ocrx9KRquDGa0AKo=;
 b=Jd107R/KDsGnmwf94jDv7xR779WrLBRdkmpLX1ePk3u4m4wQ8a2tNxepz/wLysCe0wlQ/G3ZZzRV
 XevFB2saCO3lkMRJj3XLILNll/5AYwMJVssgYsiqtOM74eFojPRy
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

execute_location() and execute_user_location() intent
to copy do_nothing() text and execute it at a new location.
However, at the time being it doesn't copy do_nothing() function
but do_nothing() function descriptor which still points to the
original text. So at the end it still executes do_nothing() at
its original location allthough using a copied function descriptor.

So, fix that by really copying do_nothing() text and build a new
function descriptor by copying do_nothing() function descriptor and
updating the target address with the new location.

Also fix the displayed addresses by dereferencing do_nothing()
function descriptor.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/misc/lkdtm/perms.c | 37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
index 035fcca441f0..1cf24c4a79e9 100644
--- a/drivers/misc/lkdtm/perms.c
+++ b/drivers/misc/lkdtm/perms.c
@@ -44,19 +44,34 @@ static noinline void do_overwritten(void)
 	return;
 }
 
+static void *setup_function_descriptor(func_desc_t *fdesc, void *dst)
+{
+	if (!have_function_descriptors())
+		return dst;
+
+	memcpy(fdesc, do_nothing, sizeof(*fdesc));
+	fdesc->addr = (unsigned long)dst;
+	barrier();
+
+	return fdesc;
+}
+
 static noinline void execute_location(void *dst, bool write)
 {
-	void (*func)(void) = dst;
+	void (*func)(void);
+	func_desc_t fdesc;
+	void *do_nothing_text = dereference_function_descriptor(do_nothing);
 
-	pr_info("attempting ok execution at %px\n", do_nothing);
+	pr_info("attempting ok execution at %px\n", do_nothing_text);
 	do_nothing();
 
 	if (write == CODE_WRITE) {
-		memcpy(dst, do_nothing, EXEC_SIZE);
+		memcpy(dst, do_nothing_text, EXEC_SIZE);
 		flush_icache_range((unsigned long)dst,
 				   (unsigned long)dst + EXEC_SIZE);
 	}
-	pr_info("attempting bad execution at %px\n", func);
+	pr_info("attempting bad execution at %px\n", dst);
+	func = setup_function_descriptor(&fdesc, dst);
 	func();
 	pr_err("FAIL: func returned\n");
 }
@@ -66,16 +81,19 @@ static void execute_user_location(void *dst)
 	int copied;
 
 	/* Intentionally crossing kernel/user memory boundary. */
-	void (*func)(void) = dst;
+	void (*func)(void);
+	func_desc_t fdesc;
+	void *do_nothing_text = dereference_function_descriptor(do_nothing);
 
-	pr_info("attempting ok execution at %px\n", do_nothing);
+	pr_info("attempting ok execution at %px\n", do_nothing_text);
 	do_nothing();
 
-	copied = access_process_vm(current, (unsigned long)dst, do_nothing,
+	copied = access_process_vm(current, (unsigned long)dst, do_nothing_text,
 				   EXEC_SIZE, FOLL_WRITE);
 	if (copied < EXEC_SIZE)
 		return;
-	pr_info("attempting bad execution at %px\n", func);
+	pr_info("attempting bad execution at %px\n", dst);
+	func = setup_function_descriptor(&fdesc, dst);
 	func();
 	pr_err("FAIL: func returned\n");
 }
@@ -153,7 +171,8 @@ void lkdtm_EXEC_VMALLOC(void)
 
 void lkdtm_EXEC_RODATA(void)
 {
-	execute_location(lkdtm_rodata_do_nothing, CODE_AS_IS);
+	execute_location(dereference_function_descriptor(lkdtm_rodata_do_nothing),
+			 CODE_AS_IS);
 }
 
 void lkdtm_EXEC_USERSPACE(void)
-- 
2.31.1

