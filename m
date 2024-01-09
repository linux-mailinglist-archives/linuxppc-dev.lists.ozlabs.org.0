Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BBF8285ED
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 13:17:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8VLB4Mnpz3dBx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 23:17:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8VHq23xhz3bX5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jan 2024 23:15:19 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4T8VHY0sNRz9v7N;
	Tue,  9 Jan 2024 13:15:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ozAHoRKaJAh; Tue,  9 Jan 2024 13:15:05 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4T8VHY02Bvz9v2V;
	Tue,  9 Jan 2024 13:15:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id ECE6E8B774;
	Tue,  9 Jan 2024 13:15:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id FZoHIGzf4vrQ; Tue,  9 Jan 2024 13:15:04 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.126])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 313958B77D;
	Tue,  9 Jan 2024 13:15:03 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: linux-hardening@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <keescook@chromium.org>
Subject: [PATCH 4/4] ptdump: add check_wx_pages debugfs attribute
Date: Tue,  9 Jan 2024 13:14:38 +0100
Message-ID: <2e8806da45a4b00249d5c449130b5f9ce78b3403.1704800524.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1704800524.git.christophe.leroy@csgroup.eu>
References: <cover.1704800524.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704802474; l=1205; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=GHXEAlv0k5WPsTIzSlwSomj0miEDu7ks2lV9a6+wMCY=; b=ibzm/cyPs51Q7IIlWinvVhCDJTVa2O93PdiVEWCD+bsWH/ncfG8IK1blTnxut+3ypcbloBgn2 fQjuoG4nNpPArnos+jqQxEly3FXt6Jg7j8Ye6GzOwyRghOCV7gDmUAh
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
Cc: mark.rutland@arm.com, linux-s390@vger.kernel.org, Phong Tran <tranmanphong@gmail.com>, Greg KH <greg@kroah.com>, linux-kernel@vger.kernel.org, steven.price@arm.com, linux-mm@kvack.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a writable attribute in debugfs to trigger a
W^X pages check at any time.

To trigger the test, just echo any numeric value into
/sys/kernel/debug/check_wx_pages

The result is provided into dmesg.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 mm/ptdump.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/mm/ptdump.c b/mm/ptdump.c
index 03c1bdae4a43..e154099c2584 100644
--- a/mm/ptdump.c
+++ b/mm/ptdump.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/pagewalk.h>
+#include <linux/debugfs.h>
 #include <linux/ptdump.h>
 #include <linux/kasan.h>
 
@@ -163,3 +164,21 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
 	/* Flush out the last page */
 	st->note_page(st, 0, -1, 0);
 }
+
+static int check_wx_debugfs_set(void *data, u64 val)
+{
+	ptdump_check_wx();
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(check_wx_fops, NULL, check_wx_debugfs_set, "%llu\n");
+
+static int ptdump_debugfs_init(void)
+{
+	debugfs_create_file("check_wx_pages", 0200, NULL, NULL, &check_wx_fops);
+
+	return 0;
+}
+
+device_initcall(ptdump_debugfs_init);
-- 
2.41.0

