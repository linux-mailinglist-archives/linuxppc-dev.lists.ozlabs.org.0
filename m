Return-Path: <linuxppc-dev+bounces-11155-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6870B2CF7A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Aug 2025 00:43:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c64P74QbGz2xS9;
	Wed, 20 Aug 2025 08:43:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.51
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755596161;
	cv=none; b=TmXEbrp3tULtakGD1bZ+qsmBhqbZrQ1HhVvEINEhCW+S0OySoGfOYK1n4w0poOw38719oG9OahTRfN4Qm42nHM116hlaT4vWB9LoSb0+VUqLShkjl4c9ljReZPlb2mDb2tjrrq/LoStFMou+Yk+bxxcD/IILNBBtjByTJXHF/KiE7+gQ2JYnj0CCE29y0aQpUQNKii58xcaVQf0qUUkNTQ32i8iK9bdu6Gy1SkZbnUX7fW6mYiZMUlSnjq94++vvSlMtns8YDNrEfUeb9nqfW3TV2xJhvdBoL9riPCe+2qiOJf7OibBf92Vd2wPKGg3P+QPhvBW4P+xTAH3ZxYS+Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755596161; c=relaxed/relaxed;
	bh=1rWi7Tu9FGMklDsIpIM4C6ciawGEuop1drC1TXBxEuY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IDmLN6Onel8pz2Yb19dWrH5l+dibZzG4SLDrKtE0HUA0BJG8bePp0/wHZqm4TrvU+Wrgf3wiEsqLoCjMEjjJk5rBnRahIJS+kVmmeB6yHhbjoABASthf2KbmK58xG8e8CHrL7ns6jhZ6kdSKVrLqLj9FS8OK1Gnki3vXSMHuNr8tgaYXzX6UqN+yRP1oq1GcJT5522N3nLL9FklHOmKbleoG0B7qNpGzaMvG0Cu5MAYEzdvM2nutqolWKPSaLS27Up/DmESE1lPZneogR282ynERaKFSNQQL0Xe9YQgTV0F8+/XnVDxC33ln5cDUL0nceBRb0sCr/0uLYM9NfJ6MAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass (client-ip=45.249.212.51; helo=dggsgout11.his.huawei.com; envelope-from=leo.lilong@huaweicloud.com; receiver=lists.ozlabs.org) smtp.mailfrom=huaweicloud.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huaweicloud.com (client-ip=45.249.212.51; helo=dggsgout11.his.huawei.com; envelope-from=leo.lilong@huaweicloud.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 975 seconds by postgrey-1.37 at boromir; Tue, 19 Aug 2025 19:35:59 AEST
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5kwb6XVqz3cp1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 19:35:57 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4c5kYl3jBZzYQvHq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 17:19:39 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 1B9D51A1955
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 17:19:38 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP4 (Coremail) with SMTP id gCh0CgDnrxClQaRoj5_LEA--.41057S4;
	Tue, 19 Aug 2025 17:19:34 +0800 (CST)
From: leo.lilong@huaweicloud.com
To: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: leo.lilong@huawei.com,
	yi.zhang@huawei.com,
	yangerkun@huawei.com,
	lonuxli.64@gmail.com
Subject: [PATCH] macintosh/mac_hid: fix race condition in mac_hid_toggle_emumouse
Date: Tue, 19 Aug 2025 17:10:35 +0800
Message-Id: <20250819091035.2263329-1-leo.lilong@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgDnrxClQaRoj5_LEA--.41057S4
X-Coremail-Antispam: 1UD129KBjvJXoWxGrW5WF1Duw15CFWDZF45GFg_yoW5tw4xpa
	43Wry7KrWkGr1DXF4UAF43tr1UAr4UAay7XrnrWr18XF15Cr12qF48t34rtF98Gr97Jryf
	t3Z8Jw4qyF4DAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUklb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4kE6xkIj40Ew7xC0wCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1oGQ3UUUU
	U==
X-CM-SenderInfo: hohrhzxlor0w46kxt4xhlfz01xgou0bp/
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Long Li <leo.lilong@huawei.com>

The following warning appears when running syzkaller, and this issue also
exists in the mainline code.

 ------------[ cut here ]------------
 list_add double add: new=ffffffffa57eee28, prev=ffffffffa57eee28, next=ffffffffa5e63100.
 WARNING: CPU: 0 PID: 1491 at lib/list_debug.c:35 __list_add_valid_or_report+0xf7/0x130
 Modules linked in:
 CPU: 0 PID: 1491 Comm: syz.1.28 Not tainted 6.6.0+ #3
 Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
 RIP: 0010:__list_add_valid_or_report+0xf7/0x130
 RSP: 0018:ff1100010dfb7b78 EFLAGS: 00010282
 RAX: 0000000000000000 RBX: ffffffffa57eee18 RCX: ffffffff97fc9817
 RDX: 0000000000040000 RSI: ffa0000002383000 RDI: 0000000000000001
 RBP: ffffffffa57eee28 R08: 0000000000000001 R09: ffe21c0021bf6f2c
 R10: 0000000000000001 R11: 6464615f7473696c R12: ffffffffa5e63100
 R13: ffffffffa57eee28 R14: ffffffffa57eee28 R15: ff1100010dfb7d48
 FS:  00007fb14398b640(0000) GS:ff11000119600000(0000) knlGS:0000000000000000
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: 0000000000000000 CR3: 000000010d096005 CR4: 0000000000773ef0
 DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
 DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
 PKRU: 80000000
 Call Trace:
  <TASK>
  input_register_handler+0xb3/0x210
  mac_hid_start_emulation+0x1c5/0x290
  mac_hid_toggle_emumouse+0x20a/0x240
  proc_sys_call_handler+0x4c2/0x6e0
  new_sync_write+0x1b1/0x2d0
  vfs_write+0x709/0x950
  ksys_write+0x12a/0x250
  do_syscall_64+0x5a/0x110
  entry_SYSCALL_64_after_hwframe+0x78/0xe2

The WARNING occurs when two processes concurrently write to the mac-hid
emulation sysctl, causing a race condition in mac_hid_toggle_emumouse().
Both processes read old_val=0, then both try to register the input handler,
leading to a double list_add of the same handler.

  CPU0                             CPU1
  -------------------------        -------------------------
  vfs_write() //write 1            vfs_write()  //write 1
    proc_sys_write()                 proc_sys_write()
      mac_hid_toggle_emumouse()          mac_hid_toggle_emumouse()
        old_val = *valp // old_val=0
                                           old_val = *valp // old_val=0
                                           mutex_lock_killable()
                                           proc_dointvec() // *valp=1
                                           mac_hid_start_emulation()
                                             input_register_handler()
                                           mutex_unlock()
        mutex_lock_killable()
        proc_dointvec()
        mac_hid_start_emulation()
          input_register_handler() //Trigger Warning
        mutex_unlock()

Fix this by moving the old_val read inside the mutex lock region.

Fixes: 99b089c3c38a ("Input: Mac button emulation - implement as an input filter")
Signed-off-by: Long Li <leo.lilong@huawei.com>
---
 drivers/macintosh/mac_hid.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/macintosh/mac_hid.c b/drivers/macintosh/mac_hid.c
index 369d72f59b3c..06fd910b3fd1 100644
--- a/drivers/macintosh/mac_hid.c
+++ b/drivers/macintosh/mac_hid.c
@@ -187,13 +187,14 @@ static int mac_hid_toggle_emumouse(const struct ctl_table *table, int write,
 				   void *buffer, size_t *lenp, loff_t *ppos)
 {
 	int *valp = table->data;
-	int old_val = *valp;
+	int old_val;
 	int rc;
 
 	rc = mutex_lock_killable(&mac_hid_emumouse_mutex);
 	if (rc)
 		return rc;
 
+	old_val = *valp;
 	rc = proc_dointvec(table, write, buffer, lenp, ppos);
 
 	if (rc == 0 && write && *valp != old_val) {
-- 
2.39.2


