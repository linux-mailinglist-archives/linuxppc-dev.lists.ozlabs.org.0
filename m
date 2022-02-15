Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3F14B6C8C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 13:44:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jygln1qs0z3f2w
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 23:44:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyghW42K6z3cVd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 23:42:03 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Jyggw2JLkz9sT7;
 Tue, 15 Feb 2022 13:41:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SRpNZ_o7l7nY; Tue, 15 Feb 2022 13:41:32 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Jyggn4tztz9sSm;
 Tue, 15 Feb 2022 13:41:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 916668B77A;
 Tue, 15 Feb 2022 13:41:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id N2TMBdkgVMz3; Tue, 15 Feb 2022 13:41:25 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.6.174])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 96E508B786;
 Tue, 15 Feb 2022 13:41:24 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 21FCfIXI080657
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 13:41:18 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 21FCfHUW080656;
 Tue, 15 Feb 2022 13:41:17 +0100
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
Subject: [PATCH v4 13/13] lkdtm: Add a test for function descriptors protection
Date: Tue, 15 Feb 2022 13:41:08 +0100
Message-Id: <7eeba50d16a35e9d799820e43304150225f20197.1644928018.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1644928018.git.christophe.leroy@csgroup.eu>
References: <cover.1644928018.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1644928861; l=3305; s=20211009;
 h=from:subject:message-id; bh=7pxIz3r53UiI2i88RT0ONtGzhkJvXG7XjRb8xVmF5zM=;
 b=ERtgdYkFhBYCi2IAjLAfew4SVUaaYDpeMuhg/snPDyUuo9ai1hJvII99U4C2FXCF0t7eEeToN8Qz
 NR7oLIMCD3hpyXRHmVC/Ht2czXUyYwuEjSvm2TQPUSrrtghXPhNi
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

Add WRITE_OPD to check that you can't modify function
descriptors.

Gives the following result when function descriptors are
not protected:

	lkdtm: Performing direct entry WRITE_OPD
	lkdtm: attempting bad 16 bytes write at c00000000269b358
	lkdtm: FAIL: survived bad write
	lkdtm: do_nothing was hijacked!

Looks like a standard compiler barrier() is not enough to force
GCC to use the modified function descriptor. Had to add a fake empty
inline assembly to force GCC to reload the function descriptor.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Acked-by: Kees Cook <keescook@chromium.org>
---
 drivers/misc/lkdtm/core.c               |  1 +
 drivers/misc/lkdtm/lkdtm.h              |  1 +
 drivers/misc/lkdtm/perms.c              | 22 ++++++++++++++++++++++
 tools/testing/selftests/lkdtm/tests.txt |  1 +
 4 files changed, 25 insertions(+)

diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
index f69b964b9952..e2228b6fc09b 100644
--- a/drivers/misc/lkdtm/core.c
+++ b/drivers/misc/lkdtm/core.c
@@ -149,6 +149,7 @@ static const struct crashtype crashtypes[] = {
 	CRASHTYPE(WRITE_RO),
 	CRASHTYPE(WRITE_RO_AFTER_INIT),
 	CRASHTYPE(WRITE_KERN),
+	CRASHTYPE(WRITE_OPD),
 	CRASHTYPE(REFCOUNT_INC_OVERFLOW),
 	CRASHTYPE(REFCOUNT_ADD_OVERFLOW),
 	CRASHTYPE(REFCOUNT_INC_NOT_ZERO_OVERFLOW),
diff --git a/drivers/misc/lkdtm/lkdtm.h b/drivers/misc/lkdtm/lkdtm.h
index d6137c70ebbe..305fc2ec3f25 100644
--- a/drivers/misc/lkdtm/lkdtm.h
+++ b/drivers/misc/lkdtm/lkdtm.h
@@ -106,6 +106,7 @@ void __init lkdtm_perms_init(void);
 void lkdtm_WRITE_RO(void);
 void lkdtm_WRITE_RO_AFTER_INIT(void);
 void lkdtm_WRITE_KERN(void);
+void lkdtm_WRITE_OPD(void);
 void lkdtm_EXEC_DATA(void);
 void lkdtm_EXEC_STACK(void);
 void lkdtm_EXEC_KMALLOC(void);
diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
index 1cf24c4a79e9..2c6aba3ff32b 100644
--- a/drivers/misc/lkdtm/perms.c
+++ b/drivers/misc/lkdtm/perms.c
@@ -44,6 +44,11 @@ static noinline void do_overwritten(void)
 	return;
 }
 
+static noinline void do_almost_nothing(void)
+{
+	pr_info("do_nothing was hijacked!\n");
+}
+
 static void *setup_function_descriptor(func_desc_t *fdesc, void *dst)
 {
 	if (!have_function_descriptors())
@@ -144,6 +149,23 @@ void lkdtm_WRITE_KERN(void)
 	do_overwritten();
 }
 
+void lkdtm_WRITE_OPD(void)
+{
+	size_t size = sizeof(func_desc_t);
+	void (*func)(void) = do_nothing;
+
+	if (!have_function_descriptors()) {
+		pr_info("XFAIL: Platform doesn't use function descriptors.\n");
+		return;
+	}
+	pr_info("attempting bad %zu bytes write at %px\n", size, do_nothing);
+	memcpy(do_nothing, do_almost_nothing, size);
+	pr_err("FAIL: survived bad write\n");
+
+	asm("" : "=m"(func));
+	func();
+}
+
 void lkdtm_EXEC_DATA(void)
 {
 	execute_location(data_area, CODE_WRITE);
diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
index 6b36b7f5dcf9..243c781f0780 100644
--- a/tools/testing/selftests/lkdtm/tests.txt
+++ b/tools/testing/selftests/lkdtm/tests.txt
@@ -44,6 +44,7 @@ ACCESS_NULL
 WRITE_RO
 WRITE_RO_AFTER_INIT
 WRITE_KERN
+WRITE_OPD
 REFCOUNT_INC_OVERFLOW
 REFCOUNT_ADD_OVERFLOW
 REFCOUNT_INC_NOT_ZERO_OVERFLOW
-- 
2.34.1

