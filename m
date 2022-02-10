Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B9C4B0E64
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 14:28:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jvcxt10QZz3bbS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 00:28:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qwXj/bx3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qwXj/bx3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jvcx94xpJz306m
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 00:27:25 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21ABLGUK029442; 
 Thu, 10 Feb 2022 13:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=MpquXG01pKd7omTq3qNXoLn6LnLc4RxtWmzRRBWGlPM=;
 b=qwXj/bx3bPbkN0vFXsaXS4v74FH14fcj62ZM4en++nzkFmDX2m5J8G7Ly8lP/rAGI0h+
 j1o/ZrSyX1Pa4SeYgMiuKpOAnbZ6j6Wse91UE7X2y5ata/Ue6+eNP/YyoA/GQfJpx0ob
 k46pKZ1didFFcLKXzvACu4BlykyvgDfsOEdlS5xCTywVJtRcbmOqOtDjBLpPKJe5Ejz8
 95Xos44ONHE7/g+8YgiyeCLOGjm1CB9kNGvvfrKy1HHskMvuUk92+4DJt7DLcJxnxYmN
 dhpM+Zxa3yoVT4cEVpcrivN0OOAUc78u0UZHm0dViE90ISXfGxEpwExrmwQNvbF9+ibB 0A== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e4m98asdd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:27:18 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21ADDPUk003680;
 Thu, 10 Feb 2022 13:27:16 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3e1gv9xc07-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:27:16 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21ADREPO47317436
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 13:27:14 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 366FA52054;
 Thu, 10 Feb 2022 13:27:14 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.79.191.145])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 3945F52051;
 Thu, 10 Feb 2022 13:27:13 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: [powerpc] Warning mm/slub.c:3246 during boot (next-20220210) w/ext4
Message-Id: <6CB9EFBC-1FD6-4486-8C64-8C47EE2A71D4@linux.ibm.com>
Date: Thu, 10 Feb 2022 18:57:12 +0530
To: Ext4 Developers List <linux-ext4@vger.kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1UAzQR4b2Xnabo-OaHMzfblNtWGJcXfz
X-Proofpoint-GUID: 1UAzQR4b2Xnabo-OaHMzfblNtWGJcXfz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_05,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 spamscore=0 suspectscore=0 adultscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=950 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202100072
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
Cc: riteshh@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 "Paul E. McKenney" <paulmck@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While booting 5.17.0-rc3-next-20220210 on Power following warning
is seen:

[   32.626501] EXT4-fs (sda2): re-mounted. Quota mode: none.
[   32.627225] ------------[ cut here ]------------
[   32.627236] WARNING: CPU: 27 PID: 1084 at mm/slub.c:3246 =
kmem_cache_alloc+0x3b0/0x680
[   32.627250] Modules linked in: ext4 mbcache jbd2 sd_mod t10_pi sg ipr =
tg3 libata ptp pps_core fuse
[   32.627273] CPU: 27 PID: 1084 Comm: kworker/u161:0 Not tainted =
5.17.0-rc3-next-20220210 #17
[   32.627283] NIP:  c000000000444df0 LR: c008000007fe6b44 CTR: =
c000000000444a40
[   32.627291] REGS: c000000052393480 TRAP: 0700   Not tainted  =
(5.17.0-rc3-next-20220210)
[   32.627298] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: =
44002822  XER: 20000000
[   32.627316] CFAR: c000000000444a6c IRQMASK: 0
[   32.627316] GPR00: c008000007fe6b44 c000000052393720 c000000002a06b00 =
c000000059660200
[   32.627316] GPR04: 0000000000000d40 0000000000000000 c00000004f735000 =
c000000050760618
[   32.627316] GPR08: 0000000000000001 0000000000080000 0000000000000038 =
c008000007fe7a70
[   32.627316] GPR12: c000000000444a40 c0000007fffe1a80 c00000000017a6b8 =
0000000000000000
[   32.627316] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
[   32.627316] GPR20: 0000000000000041 c000000052393b78 c000000052393a88 =
0000000000000338
[   32.627316] GPR24: c0080000089706d8 c0080000089706d8 c00000004f735000 =
c008000008014a98
[   32.627316] GPR28: 0000000000008d40 0000000000000000 0000000000400000 =
0000000000000100
[   32.627398] NIP [c000000000444df0] kmem_cache_alloc+0x3b0/0x680
[   32.627406] LR [c008000007fe6b44] =
jbd2_journal_add_journal_head+0x13c/0x2b8 [jbd2]
[   32.627430] Call Trace:
[   32.627433] [c000000052393720] [c008000007fd0e18] =
start_this_handle+0x530/0x6b0 [jbd2] (unreliable)
[   32.627454] [c000000052393790] [0000000000000d40] 0xd40
[   32.627462] [c000000052393820] [c008000007fd36d8] =
jbd2_journal_get_write_access+0x80/0x110 [jbd2]
[   32.627482] [c000000052393860] [c0080000088c5640] =
__ext4_journal_get_write_access+0xb8/0x2d0 [ext4]
[   32.627528] [c000000052393910] [c0080000088d69b8] =
ext4_file_open+0x2e0/0x430 [ext4]
[   32.627571] [c0000000523939e0] [c000000000488cf0] =
do_dentry_open+0x170/0x4e0
[   32.627582] [c000000052393a30] [c0000000004aabfc] =
path_openat+0xedc/0x1560
[   32.627593] [c000000052393b30] [c0000000004ac634] =
do_filp_open+0xa4/0x130
[   32.627602] [c000000052393c70] [c000000000499c8c] =
do_open_execat+0x9c/0x2f0
[   32.627611] [c000000052393cc0] [c00000000049ad44] =
bprm_execve+0x184/0x7f0
[   32.627620] [c000000052393d80] [c00000000049c6d8] =
kernel_execve+0x1a8/0x240
[   32.627630] [c000000052393dd0] [c00000000017a838] =
call_usermodehelper_exec_async+0x188/0x2c0
[   32.627642] [c000000052393e10] [c00000000000ce64] =
ret_from_kernel_thread+0x5c/0x64
[   32.627652] Instruction dump:
[   32.627657] e90d0030 7d49402a 394affff 7d49412a 4bbd1f79 60000000 =
eae10028 eb610048
[   32.627672] 4bfffd80 60000000 60000000 60000000 <0fe00000> 7c0802a6 =
f8410018 fae10028
[   32.627686] ---[ end trace 0000000000000000 ]=E2=80=94

This WARN_ONCE was introduced by following commit:

commit 120aa5e574796c9a3ef5f22cdb391747da997a26
    mm: Check for SLAB_TYPESAFE_BY_RCU and __GFP_ZERO slab allocation

The system has ext4 file system.

Thanks
-Sachin=
