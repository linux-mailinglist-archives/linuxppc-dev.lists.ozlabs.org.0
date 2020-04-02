Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 310C119CC3B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 23:13:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tbPp1SKWzDrdm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 08:13:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=muriloo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tPxl0Lf4zDqWZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 01:06:28 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 032E5GSm148955; Thu, 2 Apr 2020 10:06:16 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 302071hnen-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Apr 2020 10:06:15 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 032E5KDf008421;
 Thu, 2 Apr 2020 14:06:15 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 301x76hd8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Apr 2020 14:06:15 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 032E6ETG62718338
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Apr 2020 14:06:14 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA79BBE053;
 Thu,  2 Apr 2020 14:06:13 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B266CBE04F;
 Thu,  2 Apr 2020 14:06:12 +0000 (GMT)
Received: from localhost (unknown [9.85.199.165])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu,  2 Apr 2020 14:06:12 +0000 (GMT)
From: Murilo Opsfelder =?ISO-8859-1?Q?Ara=FAjo?= <muriloo@linux.ibm.com>
To: syzbot <syzbot+67e4f16db666b1c8253c@syzkaller.appspotmail.com>
Subject: Re: WARNING in ext4_da_update_reserve_space
Date: Thu, 02 Apr 2020 11:06:10 -0300
Message-ID: <2094673.WoIe4zePQG@kermit.br.ibm.com>
Organization: IBM
In-Reply-To: <0000000000008c5a4605a24cbb16@google.com>
References: <0000000000008c5a4605a24cbb16@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-02_05:2020-03-31,
 2020-04-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004020124
X-Mailman-Approved-At: Fri, 03 Apr 2020 08:11:45 +1100
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
Cc: tytso@mit.edu, mareklindner@neomailbox.ch, sw@simonwunderlich.de,
 b.a.t.m.a.n@lists.open-mesh.org, a@unstable.cc, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, netdev@vger.kernel.org,
 adilger.kernel@dilger.ca, paulus@samba.org, linux-ext4@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thursday, April 2, 2020 8:02:11 AM -03 syzbot wrote:
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    1a147b74 Merge branch 'DSA-mtu'
> git tree:       net-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=14237713e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=46ee14d4915944bc
> dashboard link: https://syzkaller.appspot.com/bug?extid=67e4f16db666b1c8253c
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12237713e00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10ec7c97e00000
>
> The bug was bisected to:
>
> commit 658b0f92bc7003bc734471f61bf7cd56339eb8c3
> Author: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> Date:   Wed Aug 1 21:33:15 2018 +0000
>
>     powerpc/traps: Print unhandled signals in a separate function

This commit is specific to powerpc and the crash is from an x86_64 system.

There is a bunch of scp errors in the logs:

scp: ./syz-executor998635077: No space left on device

Is it possible that these errors might be misleading the syzbot?

>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15979f5be00000
> final crash:    https://syzkaller.appspot.com/x/report.txt?x=17979f5be00000
> console output: https://syzkaller.appspot.com/x/log.txt?x=13979f5be00000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+67e4f16db666b1c8253c@syzkaller.appspotmail.com
> Fixes: 658b0f92bc70 ("powerpc/traps: Print unhandled signals in a separate
> function")
>
> EXT4-fs warning (device sda1): ext4_da_update_reserve_space:344:
> ext4_da_update_reserve_space: ino 15722, used 1 with only 0 reserved data
> blocks ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 359 at fs/ext4/inode.c:348
> ext4_da_update_reserve_space+0x622/0x7d0 fs/ext4/inode.c:344 Kernel panic -
> not syncing: panic_on_warn set ...
> CPU: 1 PID: 359 Comm: kworker/u4:5 Not tainted 5.6.0-rc7-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011 Workqueue: writeback wb_workfn (flush-8:0)
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x188/0x20d lib/dump_stack.c:118
>  panic+0x2e3/0x75c kernel/panic.c:221
>  __warn.cold+0x2f/0x35 kernel/panic.c:582
>  report_bug+0x27b/0x2f0 lib/bug.c:195
>  fixup_bug arch/x86/kernel/traps.c:174 [inline]
>  fixup_bug arch/x86/kernel/traps.c:169 [inline]
>  do_error_trap+0x12b/0x220 arch/x86/kernel/traps.c:267
>  do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:286
>  invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1027
> RIP: 0010:ext4_da_update_reserve_space+0x622/0x7d0 fs/ext4/inode.c:348
> Code: 02 00 0f 85 94 01 00 00 48 8b 7d 28 49 c7 c0 20 72 3c 88 41 56 48 c7
> c1 80 60 3c 88 53 ba 58 01 00 00 4c 89 c6 e8 1e 6d 0d 00 <0f> 0b 48 b8 00
> 00 00 00 00 fc ff df 4c 89 ea 48 c1 ea 03 0f b6 04 RSP:
> 0018:ffffc90002197288 EFLAGS: 00010296
> RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: ffffffff820bf066 RDI: fffff52000432e21
> RBP: ffff888086b744c8 R08: 0000000000000091 R09: ffffed1015ce6659
> R10: ffffed1015ce6658 R11: ffff8880ae7332c7 R12: 0000000000000001
> R13: ffff888086b74990 R14: 0000000000000000 R15: ffff888086b74a40
>  ext4_ext_map_blocks+0x24aa/0x37d0 fs/ext4/extents.c:4500
>  ext4_map_blocks+0x4cb/0x1650 fs/ext4/inode.c:622
>  mpage_map_one_extent fs/ext4/inode.c:2365 [inline]
>  mpage_map_and_submit_extent fs/ext4/inode.c:2418 [inline]
>  ext4_writepages+0x19eb/0x3080 fs/ext4/inode.c:2772
>  do_writepages+0xfa/0x2a0 mm/page-writeback.c:2344
>  __writeback_single_inode+0x12a/0x1410 fs/fs-writeback.c:1452
>  writeback_sb_inodes+0x515/0xdd0 fs/fs-writeback.c:1716
>  wb_writeback+0x2a5/0xd90 fs/fs-writeback.c:1892
>  wb_do_writeback fs/fs-writeback.c:2037 [inline]
>  wb_workfn+0x339/0x11c0 fs/fs-writeback.c:2078
>  process_one_work+0x94b/0x1690 kernel/workqueue.c:2266
>  worker_thread+0x96/0xe20 kernel/workqueue.c:2412
>  kthread+0x357/0x430 kernel/kthread.c:255
>  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> Kernel Offset: disabled
> Rebooting in 86400 seconds..
>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> syzbot can test patches for this bug, for details see:
> https://goo.gl/tpsmEJ#testing-patches

--
Murilo
