Return-Path: <linuxppc-dev+bounces-4476-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7839FC8E4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Dec 2024 07:16:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YJdfj06fZz2yh2;
	Thu, 26 Dec 2024 17:15:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=43.155.80.173
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735188345;
	cv=none; b=Y0Zsjwmnlu06HplWfMTU6z8STncnr4bZ6VbUHzjxiWRVaYfDcOeui78A0DMFmXOGrvc+kU3ciS7FHRkDFbEC/PCADlHX15ZKuH4OaTth4iKESXCMeVeTkmnLIRhwEdiIGYHY3sE/A5m4+oDTyavP7PnCq+JcEvfVTtIQHsXw1uLbuAi/OteYqpbfaUP25CKeDFr5+dddWoKj+ZYERF2d8FurkWnUXRBcfccps0pMJ5BHT/WcRavtLSptl8IvdnI9SrWJaUmqhYv7aWgnZNR7RDWEKmf4DfWKRITGJH3ZM4crajfyD+hnsGLoBv4TAH2QGk9pB0qmtjThPTZAmJB3iA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735188345; c=relaxed/relaxed;
	bh=jiZb7IpE41fCYnP6oF9fb5mZcXz5+H6sNQxK5lDZYw0=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=FJSvUAxwPv9uapTd0YNviiQYCloHDnE3kepZ+GJDE0lWOZBKhT03EImPb50XguofVGsrgrQVhTuGMyUVQI4o7cen1zIaKcJBbUImU4hjY3vAb8cfKv9OTqYQGX0g1GwjD2C2Q5C9vN6G5mM/OMyCA0QjO6oRlP8Sr09y6pr8Udtkg/VpKvwaWNC36pCMl80R3j0JwdLB3H7bUTgE6n8oL6cxBz9lf50yJm9RKCbK13rMAarF4riQor8NAKeebRde0AqzvnXg0B5DDTVZrVG/faF0PxP3wX28boekIWKtgfbynyZ2wpPhAOM2+sKQUY4PXU1+FT8thE9Dj3qDfGdtYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn; dkim=pass (1024-bit key; unprotected) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.a=rsa-sha256 header.s=sorc2401 header.b=XpHYtviz; dkim-atps=neutral; spf=pass (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=huk23@m.fudan.edu.cn; receiver=lists.ozlabs.org) smtp.mailfrom=m.fudan.edu.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.a=rsa-sha256 header.s=sorc2401 header.b=XpHYtviz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=m.fudan.edu.cn (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=huk23@m.fudan.edu.cn; receiver=lists.ozlabs.org)
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YJbfX5VHZz2xsd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Dec 2024 15:45:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=m.fudan.edu.cn;
	s=sorc2401; t=1735188237;
	bh=jiZb7IpE41fCYnP6oF9fb5mZcXz5+H6sNQxK5lDZYw0=;
	h=From:Mime-Version:Subject:Message-Id:Date:To;
	b=XpHYtvizDpBLguQvHmtCtwe0x/+7WM4FO0fZ9gJHiWo13phSej3rU9h1H5GGC4Qpc
	 GZHj78YGRbfTrFdYS+IZ9XtIaAjMHGWGsG/rD5TjxBlM+CA3GQTUNIgrKZt//3f7lv
	 w+pTvUsVeBo775ViaD53xaJXxCBLv/4fS8avSGvM=
X-QQ-mid: bizesmtpip3t1735188235t6jo2bu
X-QQ-Originating-IP: WZpoOor03qHPWQbVxBe0aAfnTtCpoWXv4JhYmMtkWYA=
Received: from smtpclient.apple ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 26 Dec 2024 12:43:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5617390984070268677
From: Kun Hu <huk23@m.fudan.edu.cn>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: BUG: soft lockup in kcov_ioctl
Message-Id: <1E7C6DD5-A850-41F8-BB7A-B949CECB04AA@m.fudan.edu.cn>
Date: Thu, 26 Dec 2024 12:43:43 +0800
Cc: linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 "jjtan24@m.fudan.edu.cn" <jjtan24@m.fudan.edu.cn>
To: mpe@ellerman.id.au,
 npiggin@gmail.com,
 christophe.leroy@csgroup.eu,
 naveen@kernel.org,
 maddy@linux.ibm.com,
 nysal@linux.ibm.com
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:m.fudan.edu.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MuKSsuOOvnd3UR2dF8crzt/AtOGdlF4laqHwbLD6UaZHvs7CI31rRKIF
	xXpqanYqlD1jyypLlGZMsyPuFuBCSFkpbLBeTCrUf5bgoAc48DenUpEhF1I9MzVHcAIG2PM
	YtUjAKOBBHeLhUEZEt7Q4o7cyKZ+2Melq38UCrPkhHOqvzwCxLzrnXR6xqne1wNeOvvrnVb
	umzX+KGUSP2gyvYBIIy5uV1uO9wttaZ1wl5eKUVzS/1hBTE3Q2IFXX2YRe4moZnHeRY0HbY
	PnLUYxXWBJhPmoFqMV2N1aMfJJjDdyWhh4zL6vbhj08qCo26VQ+biw3ZVhtTKtmnxP/EWhY
	8PJIlxNG22T4obI/9enjahI7FZY9rdF1CNTynzHDgS0aScBUcYud2fPo4N+90acz2fwWJEB
	AJiQK7d+Nveb2jFFNlW1l2uXPtnRDSGQp3ZsrNj+p95WzQJeRRTM2+XNn9U5y3aKl9dj98T
	aynvL1ceHXErYsYEcEpVQm9mIghsT8jQSjOAEPDT0BK0tEO06uY5VFl69dH4tr5z3V6bEdd
	pBGiNySZr61PLMEdRb9vwk1Tb+uXJlK+L2qjLBdFxkHmpUTztSW5/P7LYLWDC5DJ6Pm8li2
	VHN1Hyh+UWFvzE2QRbYkHAsLrBaBVegMLC/aaYaAW/iEzVizGOrJGgwRHcpcB5mxoK1Or2p
	q/azdvUNg2uaopR/byA+0ESeZwqqMLF0fioaOwpgwdyWh4j0hi6TOPlZ4WVgd+pMpDCy7T8
	avfHdkpve2/JcYCLMTKUPYEnC5WA1B0tlLNzOk/xyKaW1Oog6+L6JknsG80Yt/5f2tZvKxE
	GZrJ35O3s/ZF3QTjK7rmQR35DXxa8qJEOJO6ZNUvi5n5jFIswffNJ09Mi8u1rQmmdqUA6Zg
	/xOKgiTUVLr8v2HXpijBAgio7VBgZby28Q4mGDZ+OFAPKJlJxdo/z+URLEP2wieLsGdyKtf
	X88OGmRpD6rlbiA==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello,

When using fuzzer tool to fuzz the latest Linux kernel, the following =
crash
was triggered.

HEAD commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
git tree: upstream
Console output: =
https://drive.google.com/file/d/1hHx0XqzeOIA6IZ-_nC_XviXb1nlt0bxI/view?usp=
=3Dsharing
Kernel config: =
https://drive.google.com/file/d/1RhT5dFTs6Vx1U71PbpenN7TPtnPoa3NI/view?usp=
=3Dsharing
C reproducer: /
Syzlang reproducer: /

Unfortunately, we're getting a stable reproduction of the program. If =
you fix this issue, please add the following tag to the commit:
Reported-by: Kun Hu <huk23@m.fudan.edu.cn>

watchdog: BUG: soft lockup - CPU#3 stuck for 23s! [syz-executor:1847]
Modules linked in:
irq event stamp: 176368
hardirqs last  enabled at (176367): [<ffffffff9dace9fb>] =
irqentry_exit+0x3b/0x90 kernel/entry/common.c:357
hardirqs last disabled at (176368): [<ffffffff9daccfcf>] =
sysvec_apic_timer_interrupt+0xf/0xb0 arch/x86/kernel/apic/apic.c:1049
softirqs last  enabled at (176360): [<ffffffff95b0f4d4>] =
softirq_handle_end kernel/softirq.c:407 [inline]
softirqs last  enabled at (176360): [<ffffffff95b0f4d4>] =
handle_softirqs+0x544/0x870 kernel/softirq.c:589
softirqs last disabled at (176351): [<ffffffff95b1117e>] __do_softirq =
kernel/softirq.c:595 [inline]
softirqs last disabled at (176351): [<ffffffff95b1117e>] invoke_softirq =
kernel/softirq.c:435 [inline]
softirqs last disabled at (176351): [<ffffffff95b1117e>] __irq_exit_rcu =
kernel/softirq.c:662 [inline]
softirqs last disabled at (176351): [<ffffffff95b1117e>] =
irq_exit_rcu+0xee/0x140 kernel/softirq.c:678
CPU: 3 UID: 0 PID: 1847 Comm: syz-executor Not tainted 6.13.0-rc3 #8
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
1.13.0-1ubuntu1.1 04/01/2014
RIP: 0010:virt_spin_lock arch/x86/include/asm/qspinlock.h:102 [inline]
RIP: 0010:queued_spin_lock_slowpath+0xcb/0xc60 =
kernel/locking/qspinlock.c:324
Code: 00 00 00 49 01 c6 41 83 c5 03 be 04 00 00 00 48 89 df e8 98 61 76 =
f8 41 0f b6 06 41 38 c5 7c 08 84 c0 0f 85 f8 09 00 00 8b 03 <89> 44 24 =
48 85 c0 0f 85 6f 01 00 00 48 89 df be 04 00 00 00 e8 9c
RSP: 0018:ffa000002f0a7748 EFLAGS: 00000246
RAX: 0000000000000001 RBX: ff1100006a241cc0 RCX: ffffffff9daf9078
RDX: 0000000000000000 RSI: 0000000000000004 RDI: ff1100006a241cc0
RBP: ffa000002f0a7790 R08: fff3fc0005e14f08 R09: ffe21c000d448399
R10: ffe21c000d448398 R11: ff1100006a241cc3 R12: 0000000000000001
R13: 0000000000000003 R14: ffe21c000d448398 R15: 1ffffffff3f91377
FS:  0000555575f4fa00(0000) GS:ff1100006a380000(0000) =
knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fdfa8d3f000 CR3: 0000000038ad2003 CR4: 0000000000771ef0
PKRU: 80000000
Call Trace:
 <IRQ>
 </IRQ>
 <TASK>
 queued_spin_lock include/asm-generic/qspinlock.h:114 [inline]
 do_raw_spin_lock+0x1de/0x290 kernel/locking/spinlock_debug.c:116
 spin_lock include/linux/spinlock.h:351 [inline]
 drain_pages_zone+0xa3/0x160 mm/page_alloc.c:2394
 drain_pages+0x58/0x80 mm/page_alloc.c:2415
 __drain_all_pages+0x291/0x3b0 mm/page_alloc.c:2504
 drain_all_pages mm/page_alloc.c:2517 [inline]
 __alloc_pages_direct_reclaim mm/page_alloc.c:3963 [inline]
 __alloc_pages_slowpath.constprop.0+0x624/0x2170 mm/page_alloc.c:4380
 __alloc_pages_noprof+0x564/0x660 mm/page_alloc.c:4764
 alloc_pages_mpol_noprof+0xf2/0x400 mm/mempolicy.c:2269
 vm_area_alloc_pages mm/vmalloc.c:3589 [inline]
 __vmalloc_area_node mm/vmalloc.c:3667 [inline]
 __vmalloc_node_range_noprof+0x9c0/0x12c0 mm/vmalloc.c:3844
 vmalloc_user_noprof+0x9e/0xe0 mm/vmalloc.c:3998
 kcov_ioctl+0x4c/0x500 kernel/kcov.c:716
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __x64_sys_ioctl+0x19e/0x210 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xc3/0x1d0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f6a97aa732b
Code: 0f 92 c0 84 c0 75 b0 49 8d 3c 1c e8 1f 3f 03 00 85 c0 78 b1 48 83 =
c4 08 4c 89 e0 5b 41 5c c3 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 =
f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd707a66e8 EFLAGS: 00000207 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000040000 RCX: 00007f6a97aa732b
RDX: 0000000000040000 RSI: ffffffff80086301 RDI: 00000000000000e0
RBP: 0000000000000003 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000207 R12: 00007f6a97c6a6d8
R13: 0000000000000003 R14: 0000000000000002 R15: 00007ffd707a676c
 </TASK>
Sending NMI from CPU 3 to CPUs 0-2:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 24 Comm: ksoftirqd/1 Not tainted 6.13.0-rc3 #8
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
1.13.0-1ubuntu1.1 04/01/2014
RIP: 0010:tasklet_action_common+0x7f/0x810 kernel/softirq.c:827
Code: 00 00 00 00 00 fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 a8 06 00 00 =
48 89 6d 08 e8 ac ac 40 00 fb 48 bb 00 00 00 00 00 fc ff df <4c> 8b 6c =
24 10 49 c1 ed 03 49 8d 44 1d 00 48 89 04 24 4d 85 ff 75
RSP: 0018:ffa00000001bfdc0 EFLAGS: 00000206
RAX: 000000001b406ed8 RBX: dffffc0000000000 RCX: 1ffffffff4437279
RDX: 0000000000000000 RSI: 0000000000000100 RDI: 0000000000000000
RBP: ff1100006a2a87a0 R08: 0000000000000001 R09: 0000000000000001
R10: fffffbfff44379c2 R11: ffffffffa21bce17 R12: 000000000003b18c
R13: 0000000000000006 R14: 0000000000000006 R15: ff11000041ba15e8
FS:  0000000000000000(0000) GS:ff1100006a280000(0000) =
knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd8127e0090 CR3: 00000000350f0005 CR4: 0000000000771ef0
PKRU: 55555554
Call Trace:
 <NMI>
 </NMI>
 <TASK>
 handle_softirqs+0x1ad/0x870 kernel/softirq.c:561
 run_ksoftirqd kernel/softirq.c:950 [inline]
 run_ksoftirqd+0x3a/0x60 kernel/softirq.c:942
 smpboot_thread_fn+0x669/0xa80 kernel/smpboot.c:164
 kthread+0x345/0x450 kernel/kthread.c:389
 ret_from_fork+0x48/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
NMI backtrace for cpu 2 skipped: idling at native_safe_halt =
arch/x86/include/asm/irqflags.h:48 [inline]
NMI backtrace for cpu 2 skipped: idling at arch_safe_halt =
arch/x86/include/asm/irqflags.h:106 [inline]
NMI backtrace for cpu 2 skipped: idling at default_idle+0x1e/0x30 =
arch/x86/kernel/process.c:742
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 1729 Comm: syz.3.13 Not tainted 6.13.0-rc3 #8
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
1.13.0-1ubuntu1.1 04/01/2014
RIP: 0010:get_current arch/x86/include/asm/current.h:49 [inline]
RIP: 0010:__rcu_read_unlock+0xc6/0x570 kernel/rcu/tree_plugin.h:440
Code: b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 0f b6 04 02 84 c0 =
74 08 3c 03 0f 8e bf 01 00 00 8b 85 00 04 00 00 85 c0 75 57 <65> 48 8b =
1d 92 ae 32 6a 48 8d bb fc 03 00 00 48 b8 00 00 00 00 00
RSP: 0018:ffa0000000007e08 EFLAGS: 00000206
RAX: 0000000000000016 RBX: ff1100006a23d240 RCX: 1ffffffff501ee6b
RDX: 0000000000000000 RSI: 0000000000000102 RDI: 0000000000000000
RBP: ffffffffa0326300 R08: 0000000000000001 R09: fffffbfff501ead5
R10: fffffbfff501ead4 R11: 0000000000000001 R12: 0000000000000001
R13: 0000000000000200 R14: ffa0000000007e00 R15: 1ff4000000000fc9
FS:  00007f4bda0d2700(0000) GS:ff1100006a200000(0000) =
knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f880e276310 CR3: 000000004167e005 CR4: 0000000000771ef0
PKRU: 80000000
Call Trace:
 <NMI>
 </NMI>
 <IRQ>
 rcu_read_unlock include/linux/rcupdate.h:882 [inline]
 ieee80211_rx_napi+0x117/0x410 net/mac80211/rx.c:5493
 ieee80211_rx include/net/mac80211.h:5166 [inline]
 ieee80211_handle_queued_frames+0xd9/0x130 net/mac80211/main.c:441
 tasklet_action_common+0x279/0x810 kernel/softirq.c:811
 handle_softirqs+0x1ad/0x870 kernel/softirq.c:561
 __do_softirq kernel/softirq.c:595 [inline]
 invoke_softirq kernel/softirq.c:435 [inline]
 __irq_exit_rcu kernel/softirq.c:662 [inline]
 irq_exit_rcu+0xee/0x140 kernel/softirq.c:678
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1049 =
[inline]
 sysvec_apic_timer_interrupt+0x94/0xb0 arch/x86/kernel/apic/apic.c:1049
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 =
arch/x86/include/asm/idtentry.h:702
RIP: 0010:lock_acquire+0x1f4/0x580 kernel/locking/lockdep.c:5817
Code: 9a 24 3b 6a 83 f8 01 0f 85 00 03 00 00 9c 58 f6 c4 02 0f 85 eb 02 =
00 00 48 83 3c 24 00 74 01 fb 48 b8 00 00 00 00 00 fc ff df <48> 01 c3 =
48 c7 03 00 00 00 00 48 c7 43 08 00 00 00 00 48 8b 84 24
RSP: 0018:ffa00000152ef590 EFLAGS: 00000206
RAX: dffffc0000000000 RBX: 1ff4000002a5deb5 RCX: 0000000000000001
RDX: 1fe22000005095af RSI: 0000000000000002 RDI: 0000000000000000
RBP: 0000000000000001 R08: 0000000000000050 R09: fffffbfff501ead5
R10: fffffbfff501ead4 R11: ffffffffa80f56a7 R12: 0000000000000000
R13: ff1100006a241cd8 R14: 0000000000000001 R15: 0000000000000000
 __raw_spin_trylock include/linux/spinlock_api_smp.h:90 [inline]
 _raw_spin_trylock+0x68/0x80 kernel/locking/spinlock.c:138
 spin_trylock include/linux/spinlock.h:361 [inline]
 rmqueue_pcplist mm/page_alloc.c:3030 [inline]
 rmqueue mm/page_alloc.c:3074 [inline]
 get_page_from_freelist+0x4de/0x3800 mm/page_alloc.c:3471
 __alloc_pages_noprof+0x2f0/0x660 mm/page_alloc.c:4751
 alloc_pages_mpol_noprof+0xf2/0x400 mm/mempolicy.c:2269
 folio_alloc_mpol_noprof+0x38/0xa0 mm/mempolicy.c:2287
 shmem_alloc_folio+0x137/0x160 mm/shmem.c:1794
 shmem_alloc_and_add_folio mm/shmem.c:1833 [inline]
 shmem_get_folio_gfp mm/shmem.c:2355 [inline]
 shmem_get_folio_gfp.isra.0+0x45e/0x13d0 mm/shmem.c:2255
 shmem_get_folio mm/shmem.c:2461 [inline]
 shmem_write_begin+0x14f/0x2f0 mm/shmem.c:3117
 generic_perform_write+0x290/0x850 mm/filemap.c:4055
 shmem_file_write_iter+0x111/0x140 mm/shmem.c:3293
 new_sync_write fs/read_write.c:586 [inline]
 vfs_write fs/read_write.c:679 [inline]
 vfs_write+0xb9b/0x10f0 fs/read_write.c:659
 ksys_write+0x122/0x240 fs/read_write.c:731
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xc3/0x1d0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4bdb3f018f
Code: 89 54 24 18 48 89 74 24 10 89 7c 24 08 e8 99 fd ff ff 48 8b 54 24 =
18 48 8b 74 24 10 41 89 c0 8b 7c 24 08 b8 01 00 00 00 0f 05 <48> 3d 00 =
f0 ff ff 77 2d 44 89 c7 48 89 44 24 08 e8 cc fd ff ff 48
RSP: 002b:00007f4bda0d1940 EFLAGS: 00000293 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000000000000009 RCX: 00007f4bdb3f018f
RDX: 0000000001000000 RSI: 00007f4bd1cb2000 RDI: 0000000000000009
RBP: 00007f4bd1cb2000 R08: 0000000000000000 R09: 00000000000046db
R10: 00000000000046db R11: 0000000000000293 R12: 0000000000000000
R13: 00007f4bda0d1a0c R14: 00007f4bda0d1a10 R15: 00000000200047c2
 </TASK>


---------------
thanks,
Kun Hu=

