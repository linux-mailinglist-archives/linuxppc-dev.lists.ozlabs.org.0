Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB522CEC51
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 11:38:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnTgn00PhzDr31
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 21:38:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnTcy2PPQzDr2K
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 21:35:43 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CnTcp2bvVz9v9kB;
 Fri,  4 Dec 2020 11:35:38 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id yFNFjPTzBE2g; Fri,  4 Dec 2020 11:35:38 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CnTcp1XRKz9v9k9;
 Fri,  4 Dec 2020 11:35:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 639DF8B800;
 Fri,  4 Dec 2020 11:35:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6ASh_IQLGVmY; Fri,  4 Dec 2020 11:35:39 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0BF1A8B7FE;
 Fri,  4 Dec 2020 11:35:39 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id DA1EA66914; Fri,  4 Dec 2020 10:35:38 +0000 (UTC)
Message-Id: <c8a6ec704416ecd5ff2bd26213c9bc026bdd19de.1607077340.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/xmon: Change printk() to pr_cont()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri,  4 Dec 2020 10:35:38 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since some time now, printk() adds carriage return, leading to
unusable xmon output:

[   54.288722] sysrq: Entering xmon
[   54.292209] Vector: 0  at [cace3d2c]
[   54.292274]     pc:
[   54.292331] c0023650
[   54.292468] : xmon+0x28/0x58
[   54.292519]
[   54.292574]     lr:
[   54.292630] c0023724
[   54.292749] : sysrq_handle_xmon+0xa4/0xfc
[   54.292801]
[   54.292867]     sp: cace3de8
[   54.292931]    msr: 9032
[   54.292999]   current = 0xc28d0000
[   54.293072]     pid   = 377, comm = sh
[   54.293157] Linux version 5.10.0-rc6-s3k-dev-01364-gedf13f0ccd76-dirty (root@po17688vm.idsi0.si.c-s.fr) (powerpc64-linux-gcc (GCC) 10.1.0, GNU ld (GNU Binutils) 2.34) #4211 PREEMPT Fri Dec 4 09:32:11 UTC 2020
[   54.293287] enter ? for help
[   54.293470] [cace3de8]
[   54.293532] c0023724
[   54.293654]  sysrq_handle_xmon+0xa4/0xfc
[   54.293711]  (unreliable)
[   54.293859] [cace3e18]
[   54.293918] c03885a8
[   54.294056]  __handle_sysrq+0xe4/0x1d4
[   54.294108]
[   54.294255] [cace3e48]
[   54.294314] c0388704
[   54.294441]  write_sysrq_trigger+0x34/0x74
[   54.294493]
[   54.294641] [cace3e68]
[   54.294700] c01f65d0
[   54.294822]  proc_reg_write+0xac/0x11c
[   54.294875]
[   54.295023] [cace3e88]
[   54.295082] c0179910
[   54.295198]  vfs_write+0x134/0x46c
[   54.295250]
[   54.295396] [cace3f08]
[   54.295455] c0179de8
[   54.295567]  ksys_write+0x78/0x11c
[   54.295619]
[   54.295766] [cace3f38]
[   54.295825] c00110d0
[   54.295951]  ret_from_syscall+0x0/0x34
[   54.296002]
[   54.296159] --- Exception: c01 (System Call) at
[   54.296217] 0fd4e784
[   54.296303]
[   54.296375] SP (7fca6ff0) is in userspace
[   54.296431] mon>
[   54.296484]  <no input ...>

Use pr_cont() instead.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Fixes: 4bcc595ccd80 ("printk: reinstate KERN_CONT for printing continuation lines")
Cc: stable@vger.kernel.org
---
 arch/powerpc/xmon/nonstdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/xmon/nonstdio.c b/arch/powerpc/xmon/nonstdio.c
index 5c1a50912229..9b0d85bff021 100644
--- a/arch/powerpc/xmon/nonstdio.c
+++ b/arch/powerpc/xmon/nonstdio.c
@@ -178,7 +178,7 @@ void xmon_printf(const char *format, ...)
 
 	if (n && rc == 0) {
 		/* No udbg hooks, fallback to printk() - dangerous */
-		printk("%s", xmon_outbuf);
+		pr_cont("%s", xmon_outbuf);
 	}
 }
 
-- 
2.25.0

