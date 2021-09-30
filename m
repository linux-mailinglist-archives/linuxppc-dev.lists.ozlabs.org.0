Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3728F41D8BC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 13:26:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKrYC0ryFz3cBy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 21:26:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKrXK0tPTz2ypL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 21:25:52 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HKrX61cK6z9sX8;
 Thu, 30 Sep 2021 13:25:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F5X513tfRdMv; Thu, 30 Sep 2021 13:25:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HKrX55Q1dz9sX3;
 Thu, 30 Sep 2021 13:25:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A2DDC8B773;
 Thu, 30 Sep 2021 13:25:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id SqMd7MWu2jJd; Thu, 30 Sep 2021 13:25:41 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.149])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5E1DE8B763;
 Thu, 30 Sep 2021 13:25:41 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 18UBO8dO1558818
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 13:24:09 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 18UBO7dr1558816;
 Thu, 30 Sep 2021 13:24:07 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>, arnd@arndb.de
Subject: [PATCH v3 1/4] mm: Create a new system state and fix
 core_kernel_text()
Date: Thu, 30 Sep 2021 13:23:43 +0200
Message-Id: <9ecfdee7dd4d741d172cb93ff1d87f1c58127c9a.1633001016.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

core_kernel_text() considers that until system_state in at least
SYSTEM_RUNNING, init memory is valid.

But init memory is freed a few lines before setting SYSTEM_RUNNING,
so we have a small period of time when core_kernel_text() is wrong.

Create an intermediate system state called SYSTEM_FREEING_INIT that
is set before starting freeing init memory, and use it in
core_kernel_text() to report init memory invalid earlier.

Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3: No change
v2: New
---
 include/linux/kernel.h | 1 +
 init/main.c            | 2 ++
 kernel/extable.c       | 2 +-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 2776423a587e..471bc0593679 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -248,6 +248,7 @@ extern bool early_boot_irqs_disabled;
 extern enum system_states {
 	SYSTEM_BOOTING,
 	SYSTEM_SCHEDULING,
+	SYSTEM_FREEING_INITMEM,
 	SYSTEM_RUNNING,
 	SYSTEM_HALT,
 	SYSTEM_POWER_OFF,
diff --git a/init/main.c b/init/main.c
index 3f7216934441..c457d393fdd4 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1505,6 +1505,8 @@ static int __ref kernel_init(void *unused)
 	kernel_init_freeable();
 	/* need to finish all async __init code before freeing the memory */
 	async_synchronize_full();
+
+	system_state = SYSTEM_FREEING_INITMEM;
 	kprobe_free_init_mem();
 	ftrace_free_init_mem();
 	kgdb_free_init_mem();
diff --git a/kernel/extable.c b/kernel/extable.c
index b0ea5eb0c3b4..290661f68e6b 100644
--- a/kernel/extable.c
+++ b/kernel/extable.c
@@ -76,7 +76,7 @@ int notrace core_kernel_text(unsigned long addr)
 	    addr < (unsigned long)_etext)
 		return 1;
 
-	if (system_state < SYSTEM_RUNNING &&
+	if (system_state < SYSTEM_FREEING_INITMEM &&
 	    init_kernel_text(addr))
 		return 1;
 	return 0;
-- 
2.31.1

