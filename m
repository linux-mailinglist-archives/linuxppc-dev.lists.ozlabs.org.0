Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4808159ADA5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 13:52:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8xn41jfmz3chy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 21:52:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iFY0nygd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iFY0nygd;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8xmQ179pz3bmW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Aug 2022 21:51:34 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D29FFB80B92;
	Sat, 20 Aug 2022 11:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D6AC433D6;
	Sat, 20 Aug 2022 11:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660996288;
	bh=Vj6nj5sawIYuwYfgAEZmjkahlR/5Zp1Ma3yQSqvSWjs=;
	h=From:To:Cc:Subject:Date:From;
	b=iFY0nygdd6IAogWPWqKWP5XoqHCJ5azIpvjhO+zIuIQuLJVxXV3+Xo5GvNceWRjtf
	 rU4k4V1JSwG677uBGHnLtI1rFPjw+dIH6rk3/7RZEgciXvCJP9/3P38M5iy420Kn13
	 15lu9c3h/at5oPvOmG3Qwr22zNDd/4CFqpfI0VMDTMLOooYHVBYHwKYxISPCPRgrm/
	 oJr1Btx10CaTL8bzRpjQkkmvf5ybGr9FHtBZLnrvwMOTYgybcqsEI0JpUYVDRfl0xA
	 H7oxMGuSgRwjwjiORdzM+7RAO48Mg8a5c7EZF7zGTgdoJSITwE5a6Xh7zuqYmO0AUT
	 o5V/b3Q0xEs+g==
Received: by pali.im (Postfix)
	id 7040E5D0; Sat, 20 Aug 2022 13:51:25 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>
Subject: [PATCH] powerpc/pci: Enable PCI domains in /proc when PCI bus numbers are not unique
Date: Sat, 20 Aug 2022 13:51:13 +0200
Message-Id: <20220820115113.30581-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 32-bit powerpc systems with more PCIe controllers and more PCI domains,
where on more PCI domains are same PCI numbers, when kernel is compiled
with CONFIG_PROC_FS=y and CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT=y
options, kernel prints "proc_dir_entry 'pci/01' already registered" error
message.

  [    1.708861] ------------[ cut here ]------------
  [    1.713429] proc_dir_entry 'pci/01' already registered
  [    1.718595] WARNING: CPU: 0 PID: 1 at fs/proc/generic.c:377 proc_register+0x1a8/0x1ac
  [    1.726361] Modules linked in:
  [    1.729404] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W         5.19.0-rc5-0caacb197b677410bdac81bc34f05235+ #109
  [    1.740183] NIP:  c02846e8 LR: c02846e8 CTR: c0015154
  [    1.745225] REGS: c146fc90 TRAP: 0700   Tainted: G        W          (5.19.0-rc5-0caacb197b677410bdac81bc34f05235+)
  [    1.755657] MSR:  00029000 <CE,EE,ME>  CR: 28000822  XER: 00000000
  [    1.761829]
  [    1.761829] GPR00: c02846e8 c146fd80 c14a8000 0000002a 3fffefff c146fc40 c146fc38 00000000
  [    1.761829] GPR08: 3fffefff 00000000 00000000 c10ac04c 24000824 00000000 c0004548 00000000
  [    1.761829] GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000007
  [    1.761829] GPR24: c10000d0 c167da54 c167da00 c1120000 c167dd6c c10b4abc c167dc58 c167dd00
  [    1.796707] NIP [c02846e8] proc_register+0x1a8/0x1ac
  [    1.801663] LR [c02846e8] proc_register+0x1a8/0x1ac
  [    1.806532] Call Trace:
  [    1.808966] [c146fd80] [c02846e8] proc_register+0x1a8/0x1ac (unreliable)
  [    1.815659] [c146fdb0] [c028481c] _proc_mkdir+0x78/0xa4
  [    1.820875] [c146fdd0] [c05a92e4] pci_proc_attach_device+0x11c/0x168
  [    1.827221] [c146fe10] [c101f7a4] pci_proc_init+0x80/0x98
  [    1.832611] [c146fe30] [c0004150] do_one_initcall+0x80/0x284
  [    1.838262] [c146fea0] [c10011a8] kernel_init_freeable+0x1f4/0x2a0
  [    1.844434] [c146fee0] [c000456c] kernel_init+0x24/0x150
  [    1.849737] [c146ff00] [c001326c] ret_from_kernel_thread+0x5c/0x64
  [    1.855910] Instruction dump:
  [    1.858866] 83810020 83a10024 83c10028 83e1002c 38210030 4e800020 809a0064 3c60c0a8
  [    1.866602] 7f85e378 3863af28 4cc63182 4bdb8155 <0fe00000> 9421ffe0 39200000 7c0802a6
  [    1.874513] ---[ end trace 0000000000000000 ]---

This regression started appearing after commit 566356813082 ("powerpc/pci:
Add config option for using all 256 PCI buses") in case in each mPCIe slot
is connected PCIe card and therefore PCI bus 1 is populated in for every
PCIe controller / PCI domain.

The reason is that PCI procfs code expects that when PCI bus numbers are
not unique across all PCI domains, function pci_proc_domain() returns true
for domain dependent buses.

Fix this issue by setting PCI_ENABLE_PROC_DOMAINS and PCI_COMPAT_DOMAIN_0
flags for 32-bit powerpc code when CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT
is enabled. Same approach is already implemented for 64-bit powerpc code
(where PCI bus numbers are always domain dependent).

Fixes: 566356813082 ("powerpc/pci: Add config option for using all 256 PCI buses")
Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/kernel/pci_32.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/kernel/pci_32.c b/arch/powerpc/kernel/pci_32.c
index ffc4e1928c80..8acbc9592ebb 100644
--- a/arch/powerpc/kernel/pci_32.c
+++ b/arch/powerpc/kernel/pci_32.c
@@ -249,6 +249,15 @@ static int __init pcibios_init(void)
 
 	printk(KERN_INFO "PCI: Probing PCI hardware\n");
 
+#ifdef CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT
+	/*
+	 * Enable PCI domains in /proc when PCI bus numbers are not unique
+	 * across all PCI domains to prevent conflicts. And keep PCI domain 0
+	 * backward compatible in /proc for video cards.
+	 */
+	pci_add_flags(PCI_ENABLE_PROC_DOMAINS | PCI_COMPAT_DOMAIN_0);
+#endif
+
 	if (pci_has_flag(PCI_REASSIGN_ALL_BUS))
 		pci_assign_all_buses = 1;
 
-- 
2.20.1

