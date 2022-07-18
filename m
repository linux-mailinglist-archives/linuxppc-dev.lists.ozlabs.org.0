Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEA9577B07
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 08:32:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmXFj4CLZz3c8C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 16:32:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H+RJJ1gc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H+RJJ1gc;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmXF12RkXz3bYs
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 16:32:04 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26I6Acia000589;
	Mon, 18 Jul 2022 06:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=oEt6P7kgZU3gS6ineuvwDWbZqtMJLDA/qb4+m+JsWMw=;
 b=H+RJJ1gcGxscIali4HXiPlP5AqZBbVJ00c/JxnoyMUuj4I17esRQaTlTZ6Auy7pX7Y73
 HGxBVtHEmxfIeI70kNkckQgAcL7FQjsWPRRuvTrk8avUMnXfZAWFQbAiBgLNzrxE7tno
 eNCQROG4XR27XPZSN9tW4fMz/KlYgsgE3IYEtXDN9KPomlLWRqCbdO7NVtjy9ajkTgC1
 XY6lhL5svlgS6MhUDLKZCSM5ZRsyQ8GVLErnpCF/JsU5k1DYYz0JDhZx8cZzXyfj3/AG
 PKdHsrV2HisZQNJMvm7EToKA38YWUEh17ZUZ7Xu2NQibq2HyIf2PHJ4UH92GXzDDJxHd Fg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hd1ae157g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Jul 2022 06:32:01 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26I6I2Ua028282;
	Mon, 18 Jul 2022 06:32:00 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hd1ae156y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Jul 2022 06:32:00 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26I6KR3M002926;
	Mon, 18 Jul 2022 06:31:58 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma04ams.nl.ibm.com with ESMTP id 3hbmy8t527-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Jul 2022 06:31:58 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26I6UFR520578590
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 Jul 2022 06:30:15 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 531D7A4051;
	Mon, 18 Jul 2022 06:31:56 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDFAAA404D;
	Mon, 18 Jul 2022 06:31:54 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.52.91])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 18 Jul 2022 06:31:54 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: BUG xfs_buf while running tests/xfs/435 (next-20220715)
Message-Id: <C6CAF8E3-0447-465D-9C83-F55910739BE2@linux.ibm.com>
Date: Mon, 18 Jul 2022 12:01:53 +0530
To: dchinner@redhat.com, linux-xfs@vger.kernel.org
X-Mailer: Apple Mail (2.3696.100.31)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kTRFIFK9mbw76vaz6_qKH7LasvuqzKbY
X-Proofpoint-ORIG-GUID: zrty2KdiOCGIEtVteZUV0bQkEy3A2r50
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_04,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1011 mlxlogscore=999 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207180025
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
Cc: linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, riteshh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While running xfstests (specifically xfs/435) on a IBM Power server =
booted with
5.19.0-rc6-next-20220715 following warnings are seen:


[  110.954136] XFS (sdb2): Unmounting Filesystem
[  110.968860] XFS (sdb1): Unmounting Filesystem
[  111.115807] =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
[  111.115817] BUG xfs_buf (Tainted: G            E     ): Objects =
remaining in xfs_buf on __kmem_cache_shutdown()
[  111.115824] =
--------------------------------------------------------------------------=
---
[  111.115824]=20
[  111.115828] Slab 0x0000000074cdc09a objects=3D170 used=3D1 =
fp=3D0x000000005f24a5e1 =
flags=3D0x13ffff800000200(slab|node=3D1|zone=3D0|lastcpupid=3D0x7ffff)
[  111.115840] CPU: 26 PID: 4704 Comm: modprobe Tainted: G            E  =
    5.19.0-rc6-next-20220715 #3
[  111.115849] Call Trace:
[  111.115852] [c00000002985b9a0] [c000000000830bec] =
dump_stack_lvl+0x70/0xa4 (unreliable)
[  111.115867] [c00000002985b9e0] [c0000000004ef6f8] slab_err+0xd8/0xf0
[  111.115877] [c00000002985bad0] [c0000000004f6cbc] =
__kmem_cache_shutdown+0x1fc/0x560
[  111.115884] [c00000002985bbf0] [c0000000004534c8] =
kmem_cache_destroy+0xa8/0x1f0
[  111.115893] [c00000002985bc80] [c00800000ccf30e4] =
xfs_buf_terminate+0x2c/0x48 [xfs]
[  111.115977] [c00000002985bca0] [c00800000cd6f55c] =
exit_xfs_fs+0x90/0x20b34 [xfs]
[  111.116045] [c00000002985bcd0] [c00000000023b7e0] =
sys_delete_module+0x1e0/0x3c0
[  111.116053] [c00000002985bdb0] [c00000000003302c] =
system_call_exception+0x17c/0x350
[  111.116062] [c00000002985be10] [c00000000000c53c] =
system_call_common+0xec/0x270
[  111.116070] --- interrupt: c00 at 0x7fff8c158b88
[  111.116075] NIP:  00007fff8c158b88 LR: 000000013adb0398 CTR: =
0000000000000000
[  111.116080] REGS: c00000002985be80 TRAP: 0c00   Tainted: G            =
E       (5.19.0-rc6-next-20220715)
[  111.116086] MSR:  800000000280f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 24008282  XER: 00000000
[  111.116103] IRQMASK: 0=20
[  111.116103] GPR00: 0000000000000081 00007ffffe17dff0 00007fff8c227300 =
000001003f2f0c18=20
[  111.116103] GPR04: 0000000000000800 000000000000000a 1999999999999999 =
0000000000000000=20
[  111.116103] GPR08: 00007fff8c1b7830 0000000000000000 0000000000000000 =
0000000000000000=20
[  111.116103] GPR12: 0000000000000000 00007fff8c72ca50 000000013adba650 =
000000013adba648=20
[  111.116103] GPR16: 0000000000000000 0000000000000001 0000000000000000 =
000000013adba428=20
[  111.116103] GPR20: 000000013ade0068 0000000000000000 00007ffffe17f948 =
000001003f2f02a0=20
[  111.116103] GPR24: 0000000000000000 00007ffffe17f948 000001003f2f0c18 =
0000000000000000=20
[  111.116103] GPR28: 0000000000000000 000001003f2f0bb0 000001003f2f0c18 =
000001003f2f0bb0=20
[  111.116162] NIP [00007fff8c158b88] 0x7fff8c158b88
[  111.116166] LR [000000013adb0398] 0x13adb0398
[  111.116170] --- interrupt: c00
[  111.116173] Disabling lock debugging due to kernel taint
[  111.116184] Object 0x000000007e079655 @offset=3D18816
[  111.116189] =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
[  111.116193] BUG xfs_buf (Tainted: G    B       E     ): Objects =
remaining in xfs_buf on __kmem_cache_shutdown()
[  111.116198] =
--------------------------------------------------------------------------=
---
[  111.116198]=20
[  111.116202] Slab 0x000000008186f78a objects=3D170 used=3D12 =
fp=3D0x000000008233ac7d =
flags=3D0x13ffff800000200(slab|node=3D1|zone=3D0|lastcpupid=3D0x7ffff)
[  111.116210] CPU: 26 PID: 4704 Comm: modprobe Tainted: G    B       E  =
    5.19.0-rc6-next-20220715 #3
[  111.116216] Call Trace:
[  111.116218] [c00000002985b9a0] [c000000000830bec] =
dump_stack_lvl+0x70/0xa4 (unreliable)
[  111.116227] [c00000002985b9e0] [c0000000004ef6f8] slab_err+0xd8/0xf0
[  111.116234] [c00000002985bad0] [c0000000004f6cbc] =
__kmem_cache_shutdown+0x1fc/0x560
[  111.116241] [c00000002985bbf0] [c0000000004534c8] =
kmem_cache_destroy+0xa8/0x1f0
[  111.116248] [c00000002985bc80] [c00800000ccf30e4] =
xfs_buf_terminate+0x2c/0x48 [xfs]
[  111.116312] [c00000002985bca0] [c00800000cd6f55c] =
exit_xfs_fs+0x90/0x20b34 [xfs]
[  111.116379] [c00000002985bcd0] [c00000000023b7e0] =
sys_delete_module+0x1e0/0x3c0
[  111.116386] [c00000002985bdb0] [c00000000003302c] =
system_call_exception+0x17c/0x350
[  111.116392] [c00000002985be10] [c00000000000c53c] =
system_call_common+0xec/0x270
[  111.116400] --- interrupt: c00 at 0x7fff8c158b88
[  111.116404] NIP:  00007fff8c158b88 LR: 000000013adb0398 CTR: =
0000000000000000
[  111.116409] REGS: c00000002985be80 TRAP: 0c00   Tainted: G    B       =
E       (5.19.0-rc6-next-20220715)
[  111.116414] MSR:  800000000280f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 24008282  XER: 00000000
[  111.116430] IRQMASK: 0=20
[  111.116430] GPR00: 0000000000000081 00007ffffe17dff0 00007fff8c227300 =
000001003f2f0c18=20
[  111.116430] GPR04: 0000000000000800 000000000000000a 1999999999999999 =
0000000000000000=20
[  111.116430] GPR08: 00007fff8c1b7830 0000000000000000 0000000000000000 =
0000000000000000=20
[  111.116430] GPR12: 0000000000000000 00007fff8c72ca50 000000013adba650 =
000000013adba648=20
[  111.116430] GPR16: 0000000000000000 0000000000000001 0000000000000000 =
000000013adba428=20
[  111.116430] GPR20: 000000013ade0068 0000000000000000 00007ffffe17f948 =
000001003f2f02a0=20
[  111.116430] GPR24: 0000000000000000 00007ffffe17f948 000001003f2f0c18 =
0000000000000000=20
[  111.116430] GPR28: 0000000000000000 000001003f2f0bb0 000001003f2f0c18 =
000001003f2f0bb0=20
[  111.116488] NIP [00007fff8c158b88] 0x7fff8c158b88
[  111.116492] LR [000000013adb0398] 0x13adb0398
[  111.116496] --- interrupt: c00
[  111.116504] Object 0x000000002b93c535 @offset=3D5376
[  111.116508] Object 0x000000009be4058b @offset=3D16896
[  111.116511] Object 0x00000000c1d5c895 @offset=3D24960
[  111.116515] Object 0x0000000097fb6f84 @offset=3D30336
[  111.116518] Object 0x00000000213fb535 @offset=3D43008
[  111.116521] Object 0x0000000045473fa3 @offset=3D43392
[  111.116525] Object 0x000000006462ef89 @offset=3D44160
[  111.116528] Object 0x000000000c85ce0b @offset=3D44544
[  111.116531] Object 0x0000000059166af4 @offset=3D45312
[  111.116535] Object 0x00000000e7b40b45 @offset=3D46848
[  111.116538] Object 0x00000000bc6ce716 @offset=3D54528
[  111.116541] Object 0x000000005f7be1fa @offset=3D64512
[  111.116546] ------------[ cut here ]------------
[  111.116549] kmem_cache_destroy xfs_buf: Slab cache still has objects =
when called from xfs_buf_terminate+0x2c/0x48 [xfs]
[  111.116622] WARNING: CPU: 26 PID: 4704 at mm/slab_common.c:507 =
kmem_cache_destroy+0x1d8/0x1f0
[  111.116634] Modules linked in: xfs(E-) dm_mod(E) nft_fib_inet(E) =
nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) =
nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E) =
nft_chain_nat(E) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) =
nf_defrag_ipv4(E) ip_set(E) bonding(E) tls(E) nf_tables(E) rfkill(E) =
libcrc32c(E) nfnetlink(E) sunrpc(E) pseries_rng(E) vmx_crypto(E) ext4(E) =
mbcache(E) jbd2(E) sr_mod(E) sd_mod(E) cdrom(E) sg(E) lpfc(E) =
nvmet_fc(E) nvmet(E) ibmvscsi(E) ibmveth(E) scsi_transport_srp(E) =
nvme_fc(E) nvme(E) nvme_fabrics(E) nvme_core(E) t10_pi(E) =
scsi_transport_fc(E) crc64_rocksoft(E) crc64(E) tg3(E) ipmi_devintf(E) =
ipmi_msghandler(E) fuse(E) [last unloaded: xfs(E)]
[  111.116705] CPU: 26 PID: 4704 Comm: modprobe Tainted: G    B       E  =
    5.19.0-rc6-next-20220715 #3
[  111.116711] NIP:  c0000000004535f8 LR: c0000000004535f4 CTR: =
00000000ffffffde
[  111.116716] REGS: c00000002985b950 TRAP: 0700   Tainted: G    B       =
E       (5.19.0-rc6-next-20220715)
[  111.116722] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 48008824  XER: 20040005
[  111.116736] CFAR: c000000000154534 IRQMASK: 0=20
[  111.116736] GPR00: c0000000004535f4 c00000002985bbf0 c000000002a8f600 =
000000000000006b=20
[  111.116736] GPR04: 00000000ffff7fff c00000002985b9b0 c00000002985b9a8 =
0000000000000027=20
[  111.116736] GPR08: c000000db9a07f98 0000000000000001 0000000000000027 =
c000000002947148=20
[  111.116736] GPR12: 0000000000008000 c00000001ec20700 000000013adba650 =
000000013adba648=20
[  111.116736] GPR16: 0000000000000000 0000000000000001 0000000000000000 =
000000013adba428=20
[  111.116736] GPR20: 000000013ade0068 0000000000000000 00007ffffe17f948 =
000001003f2f02a0=20
[  111.116736] GPR24: 00007fff8c1b7830 0000000000000000 1999999999999999 =
000000000000000a=20
[  111.116736] GPR28: c000000002980228 c000000002980230 c00800000ccf30e4 =
c000000006f9f600=20
[  111.116796] NIP [c0000000004535f8] kmem_cache_destroy+0x1d8/0x1f0
[  111.116802] LR [c0000000004535f4] kmem_cache_destroy+0x1d4/0x1f0
[  111.116808] Call Trace:
[  111.116810] [c00000002985bbf0] [c0000000004535f4] =
kmem_cache_destroy+0x1d4/0x1f0 (unreliable)
[  111.116818] [c00000002985bc80] [c00800000ccf30e4] =
xfs_buf_terminate+0x2c/0x48 [xfs]
[  111.116882] [c00000002985bca0] [c00800000cd6f55c] =
exit_xfs_fs+0x90/0x20b34 [xfs]
[  111.116949] [c00000002985bcd0] [c00000000023b7e0] =
sys_delete_module+0x1e0/0x3c0
[  111.116955] [c00000002985bdb0] [c00000000003302c] =
system_call_exception+0x17c/0x350
[  111.116962] [c00000002985be10] [c00000000000c53c] =
system_call_common+0xec/0x270
[  111.116970] --- interrupt: c00 at 0x7fff8c158b88
[  111.116974] NIP:  00007fff8c158b88 LR: 000000013adb0398 CTR: =
0000000000000000
[  111.116979] REGS: c00000002985be80 TRAP: 0c00   Tainted: G    B       =
E       (5.19.0-rc6-next-20220715)
[  111.116984] MSR:  800000000280f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 24008282  XER: 00000000
[  111.116999] IRQMASK: 0=20
[  111.116999] GPR00: 0000000000000081 00007ffffe17dff0 00007fff8c227300 =
000001003f2f0c18=20
[  111.116999] GPR04: 0000000000000800 000000000000000a 1999999999999999 =
0000000000000000=20
[  111.116999] GPR08: 00007fff8c1b7830 0000000000000000 0000000000000000 =
0000000000000000=20
[  111.116999] GPR12: 0000000000000000 00007fff8c72ca50 000000013adba650 =
000000013adba648=20
[  111.116999] GPR16: 0000000000000000 0000000000000001 0000000000000000 =
000000013adba428=20
[  111.116999] GPR20: 000000013ade0068 0000000000000000 00007ffffe17f948 =
000001003f2f02a0=20
[  111.116999] GPR24: 0000000000000000 00007ffffe17f948 000001003f2f0c18 =
0000000000000000=20
[  111.116999] GPR28: 0000000000000000 000001003f2f0bb0 000001003f2f0c18 =
000001003f2f0bb0=20
[  111.117057] NIP [00007fff8c158b88] 0x7fff8c158b88
[  111.117061] LR [000000013adb0398] 0x13adb0398
[  111.117065] --- interrupt: c00
[  111.117068] Instruction dump:
[  111.117071] 7fe3fb78 480a463d 60000000 4bfffeb8 3c82fe49 3c62fe76 =
e8bf0060 7fc6f378=20
[  111.117082] 38849110 38630410 4bd00edd 60000000 <0fe00000> fb410060 =
fb610068 60000000=20
[  111.117093] ---[ end trace 0000000000000000 ]---
[  111.974215] SGI XFS with ACLs, security attributes, scrub, quota, no =
debug enabled
[  111.983722] XFS (sdb1): Mounting V5 Filesystem
[  112.008668] XFS (sdb1): Ending clean mount
[  112.010988] xfs filesystem being mounted at /mnt/test supports =
timestamps until 2038 (0x7fffffff)

Git bisect leads me to following patch:

commit 298f34224506
      xfs: lockless buffer lookup

Reverting the patch allows the test to run correctly without any =
warning.

- Sachin

