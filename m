Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4BF49327F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 02:51:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JdpWn6kRwz3bVf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 12:51:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com;
 envelope-from=heying24@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JdpWM1YYMz2yLg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jan 2022 12:50:34 +1100 (AEDT)
Received: from dggeme758-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JdpTj2VZnzccVb;
 Wed, 19 Jan 2022 09:49:13 +0800 (CST)
Received: from huawei.com (10.67.174.47) by dggeme758-chm.china.huawei.com
 (10.3.19.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.21; Wed, 19
 Jan 2022 09:49:57 +0800
From: He Ying <heying24@huawei.com>
To: <catalin.marinas@arm.com>, <mpe@ellerman.id.au>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <christophe.leroy@csgroup.eu>, <sxwjean@gmail.com>, <peterz@infradead.org>,
 <keescook@chromium.org>
Subject: [PATCH] powerpc/process,
 kasan: Silence KASAN warnings in __get_wchan()
Date: Tue, 18 Jan 2022 20:50:25 -0500
Message-ID: <20220119015025.136902-1-heying24@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.47]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggeme758-chm.china.huawei.com (10.3.19.104)
X-CFilter-Loop: Reflected
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 heying24@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The following KASAN warning was reported in our kernel.

  BUG: KASAN: stack-out-of-bounds in get_wchan+0x188/0x250
  Read of size 4 at addr d216f958 by task ps/14437

  CPU: 3 PID: 14437 Comm: ps Tainted: G           O      5.10.0 #1
  Call Trace:
  [daa63858] [c0654348] dump_stack+0x9c/0xe4 (unreliable)
  [daa63888] [c035cf0c] print_address_description.constprop.3+0x8c/0x570
  [daa63908] [c035d6bc] kasan_report+0x1ac/0x218
  [daa63948] [c00496e8] get_wchan+0x188/0x250
  [daa63978] [c0461ec8] do_task_stat+0xce8/0xe60
  [daa63b98] [c0455ac8] proc_single_show+0x98/0x170
  [daa63bc8] [c03cab8c] seq_read_iter+0x1ec/0x900
  [daa63c38] [c03cb47c] seq_read+0x1dc/0x290
  [daa63d68] [c037fc94] vfs_read+0x164/0x510
  [daa63ea8] [c03808e4] ksys_read+0x144/0x1d0
  [daa63f38] [c005b1dc] ret_from_syscall+0x0/0x38
  --- interrupt: c00 at 0x8fa8f4
      LR = 0x8fa8cc

  The buggy address belongs to the page:
  page:98ebcdd2 refcount:0 mapcount:0 mapping:00000000 index:0x2 pfn:0x1216f
  flags: 0x0()
  raw: 00000000 00000000 01010122 00000000 00000002 00000000 ffffffff 00000000
  raw: 00000000
  page dumped because: kasan: bad access detected

  Memory state around the buggy address:
   d216f800: 00 00 00 00 00 f1 f1 f1 f1 00 00 00 00 00 00 00
   d216f880: f2 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  >d216f900: 00 00 00 00 00 00 00 00 00 00 00 f1 f1 f1 f1 00
                                            ^
   d216f980: f2 f2 f2 f2 f2 f2 f2 00 00 00 00 00 00 00 00 00
   d216fa00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

After looking into this issue, I find the buggy address belongs
to the task stack region. It seems KASAN has something wrong.
I look into the code of __get_wchan in x86 architecture and
find the same issue has been resolved by the commit
f7d27c35ddff ("x86/mm, kasan: Silence KASAN warnings in get_wchan()").
The solution could be applied to powerpc architecture too.

As Andrey Ryabinin said, get_wchan() is racy by design, it may
access volatile stack of running task, thus it may access
redzone in a stack frame and cause KASAN to warn about this.

Use READ_ONCE_NOCHECK() to silence these warnings.

Signed-off-by: He Ying <heying24@huawei.com>
---
 arch/powerpc/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 984813a4d5dc..a75d20f23dac 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -2160,12 +2160,12 @@ static unsigned long ___get_wchan(struct task_struct *p)
 		return 0;
 
 	do {
-		sp = *(unsigned long *)sp;
+		sp = READ_ONCE_NOCHECK(*(unsigned long *)sp);
 		if (!validate_sp(sp, p, STACK_FRAME_OVERHEAD) ||
 		    task_is_running(p))
 			return 0;
 		if (count > 0) {
-			ip = ((unsigned long *)sp)[STACK_FRAME_LR_SAVE];
+			ip = READ_ONCE_NOCHECK(((unsigned long *)sp)[STACK_FRAME_LR_SAVE]);
 			if (!in_sched_functions(ip))
 				return ip;
 		}
-- 
2.17.1

