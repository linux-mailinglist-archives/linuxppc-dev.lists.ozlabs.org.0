Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40164842182
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 11:38:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPM8v0thcz3vvh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 21:38:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPM6W2Cnxz3cV2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 21:36:51 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4TPM6B2Rk2z9t5l;
	Tue, 30 Jan 2024 11:36:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bWlRn__eVLko; Tue, 30 Jan 2024 11:36:34 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4TPM4b0x0Nz9sbF;
	Tue, 30 Jan 2024 11:35:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 16E428B763;
	Tue, 30 Jan 2024 11:35:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id W3NGrQMVAtQf; Tue, 30 Jan 2024 11:35:11 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.134])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D00E8B76C;
	Tue, 30 Jan 2024 11:35:09 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <keescook@chromium.org>
Subject: [PATCH v2 5/5] mm: ptdump: add check_wx_pages debugfs attribute
Date: Tue, 30 Jan 2024 11:34:36 +0100
Message-ID: <e947fb1a9f3f5466344823e532d343ff194ae03d.1706610398.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706610398.git.christophe.leroy@csgroup.eu>
References: <cover.1706610398.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706610876; l=1389; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=joW5f5HSLrWZ5GQmf1rXby/U2dLAlVL7zEy3NPVkAVA=; b=sNgiUjWR0Fhosv8enaHSXqsDx5ggf6VAZ13c2rbebUX4KZyQTgf7zPLtHsJdwuYc6lV39bCGn 7Ww4MoEZLHXBCZISIB9MHxmZP08gTQfzYa0f+uOXeeMWzGpYGg6D3St
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: mark.rutland@arm.com, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Phong Tran <tranmanphong@gmail.com>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, steven.price@arm.com, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, Greg KH <greg@kroah.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linu
 x-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a readable attribute in debugfs to trigger a
W^X pages check at any time.

To trigger the test, just read /sys/kernel/debug/check_wx_pages
It will report FAILED if the test failed, SUCCESS otherwise.

Detailed result is provided into dmesg.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Make it a read attribute which reports SUCCESS/FAILED instead of only relying on kernel message log.
---
 mm/ptdump.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/mm/ptdump.c b/mm/ptdump.c
index 03c1bdae4a43..106e1d66e9f9 100644
--- a/mm/ptdump.c
+++ b/mm/ptdump.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/pagewalk.h>
+#include <linux/debugfs.h>
 #include <linux/ptdump.h>
 #include <linux/kasan.h>
 
@@ -163,3 +164,24 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
 	/* Flush out the last page */
 	st->note_page(st, 0, -1, 0);
 }
+
+static int check_wx_show(struct seq_file *m, void *v)
+{
+	if (ptdump_check_wx())
+		seq_puts(m, "SUCCESS\n");
+	else
+		seq_puts(m, "FAILED\n");
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(check_wx);
+
+static int ptdump_debugfs_init(void)
+{
+	debugfs_create_file("check_wx_pages", 0400, NULL, NULL, &check_wx_fops);
+
+	return 0;
+}
+
+device_initcall(ptdump_debugfs_init);
-- 
2.43.0

