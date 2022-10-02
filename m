Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E3C5F2221
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Oct 2022 10:52:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MgHmR3DHRz3c9W
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Oct 2022 19:52:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E06zv8L0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E06zv8L0;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MgHlh6lrBz30B1
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Oct 2022 19:52:16 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 292543rX017170;
	Sun, 2 Oct 2022 08:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=SwR1oUr1WgHnWvjW43WdBeu3u2LJMgFnQxvS3yb0Fu8=;
 b=E06zv8L0aEkjFvQZtYZEf6yurrIav6HUK0E7h0m+jDYsdnxlmLk7yQXKqfR7D9Xh6hJl
 MRI9Kv+HechrGl0Ku8GGgw/bk7Hwa/MB4uHVQPbon+J6LRYl4zNiJc+peFq6fsSKuycF
 /uWqet++iP614vKiQY5IaK0AcEhDt4g54NiobuvpjBItoIn2MRLXuaBWSFBAIXKFH+RW
 xKOeCEqsc5PEPmbhB82guT8/KNihD4Eedq5Oi92deLgOIzfYGJcjWZcI0nnaPj2cRD8A
 AkSRIJmE3V7Hcn8C2XKFyrSr23EXb48Wxq3uNlPWoreUcpqhNr2W/uBQnzwvcNWEnkoe /g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jxxvb03db-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Oct 2022 08:52:07 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2928q6DR013035;
	Sun, 2 Oct 2022 08:52:06 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jxxvb03cq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Oct 2022 08:52:06 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2928o33c010389;
	Sun, 2 Oct 2022 08:52:04 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma03ams.nl.ibm.com with ESMTP id 3jxd6917yt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Oct 2022 08:52:04 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2928q2Yf36241886
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Oct 2022 08:52:02 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 427F2A4053;
	Sun,  2 Oct 2022 08:52:02 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C4791A4040;
	Sun,  2 Oct 2022 08:52:00 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.11.7])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Sun,  2 Oct 2022 08:52:00 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: [6.0.0-rc7-next-20220930] kernel BUG at
 arch/powerpc/kernel/exceptions-64s.S:2831!
Message-Id: <85478710-25C6-42DB-9680-92ABD83C662C@linux.ibm.com>
Date: Sun, 2 Oct 2022 14:21:59 +0530
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9lY1iiZ5fpfq4nDO-nqGlf_RxHiaBHB0
X-Proofpoint-ORIG-GUID: GK6Z_g_-Tg2dUz_B0cEtyQv6hBv6PHUg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-01_15,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 clxscore=1011 mlxlogscore=769 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210020054
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With recent versions of linux-next I am observing kernel crashes on =
Power server.
I saw this crash once just after boot. I also saw similar crash while =
compiling a
Kernel or during a git clone of kernel source. Seem to occur at random =
times.

[  175.165592] ------------[ cut here ]------------
[  175.165618] kernel BUG at arch/powerpc/kernel/exceptions-64s.S:2831!
[  175.165637] Oops: Exception in kernel mode, sig: 5 [#1]
[  175.165647] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA =
pSeries
[  175.165657] Modules linked in: dm_mod(E) nft_fib_inet(E) =
nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) =
nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E) =
nft_chain_nat(E) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) =
nf_defrag_ipv4(E) bonding(E) rfkill(E) tls(E) ip_set(E) nf_tables(E) =
libcrc32c(E) nfnetlink(E) sunrpc(E) pseries_rng(E) vmx_crypto(E) ext4(E) =
mbcache(E) jbd2(E) sd_mod(E) t10_pi(E) crc64_rocksoft(E) crc64(E) sg(E) =
ibmvscsi(E) scsi_transport_srp(E) ibmveth(E) ipmi_devintf(E) =
ipmi_msghandler(E) fuse(E)
[  175.165805] CPU: 6 PID: 11059 Comm: sed Tainted: G            E      =
6.0.0-rc7-next-20220930 #1
[  175.165820] Hardware name: IBM,8375-42A POWER9 (raw) 0x4e0202 =
0xf000005 of:IBM,FW950.50 (VL950_105) hv:phyp pSeries
[  175.165832] NIP:  c00000000000be38 LR: c00000000001cdfc CTR: =
c000000000008ed0
[  175.165844] REGS: c00000002840b5b0 TRAP: 0700   Tainted: G            =
E       (6.0.0-rc7-next-20220930)
[  175.165856] MSR:  8000000000021031 <SF,ME,IR,DR,LE>  CR: 44828844  =
XER: 00000000
[  175.165881] CFAR: c000000000008f74 IRQMASK: 1=20
[  175.165881] GPR00: c00000000001df08 c00000002840b850 c00000000135e800 =
0000000002802000=20
[  175.165881] GPR04: c000000003717e80 0000000000000000 0000000000000166 =
c000000002a3aa80=20
[  175.165881] GPR08: 800000000280b033 0000000000000005 0000000000000004 =
c00000000001c864=20
[  175.165881] GPR12: 800000000280b033 c00000001ec58b00 0000000000000000 =
c00000002840bbd8=20
[  175.165881] GPR16: c000000002988b70 0000000000000009 61c8864680b583eb =
0000000000000002=20
[  175.165881] GPR20: c000000002aa3e00 c00000002840bac8 0000000000000001 =
c000000201eb9f40=20
[  175.165881] GPR24: c000000201eba420 c000000003718ca0 000000063a4a0000 =
c000000002160db0=20
[  175.165881] GPR28: c000000002160db0 c000000201eb9600 800000004280f033 =
c000000201eb9600=20
[  175.166058] NIP [c00000000000be38] masked_interrupt+0xc/0xe4
[  175.166076] LR [c00000000001cdfc] giveup_all+0x6c/0x130
[  175.166088] Call Trace:
[  175.166094] [c00000002840b850] [c00000002840b8e0] 0xc00000002840b8e0 =
(unreliable)
[  175.166113] [c00000002840b880] [c00000000001df08] =
__switch_to+0x108/0x4b0
[  175.166131] [c00000002840b8e0] [c000000000ed07c0] =
__schedule+0x2b0/0x9e0
[  175.166147] [c00000002840b9b0] [c000000000ed0f68] schedule+0x78/0x140
[  175.166163] [c00000002840ba20] [c000000000ed169c] =
io_schedule+0x2c/0x50
[  175.166182] [c00000002840ba50] [c000000000419fb4] =
filemap_fault+0xc74/0x1240
[  175.166199] [c00000002840bb70] [c00000000047a484] =
__do_fault+0x64/0x240
[  175.166215] [c00000002840bbb0] [c00000000047e598] =
__handle_mm_fault+0x1078/0x16f0
[  175.166232] [c00000002840bcb0] [c00000000047ed38] =
handle_mm_fault+0x128/0x320
[  175.166247] [c00000002840bd00] [c000000000092054] =
___do_page_fault+0x2f4/0xb50
[  175.166265] [c00000002840bdb0] [c000000000092ac0] =
hash__do_page_fault+0x30/0x70
[  175.166281] [c00000002840bde0] [c00000000009b918] =
do_hash_fault+0x278/0x470
[  175.166304] [c00000002840be10] [c000000000008ce8] =
instruction_access_common_virt+0x198/0x1a0
[  175.166325] Instruction dump:
[  175.166337] e96a0110 e96a0198 e96a0220 e96a02a8 e96a0330 e96a03b8 =
394a0400 4200ffdc=20
[  175.166368] 4e800020 912d00b4 892d0933 71290025 <0b090000> 892d0933 =
7d295378 992d0933=20
[  175.166401] ---[ end trace 0000000000000000 ]---
[  175.173284] =20

Another instance of this crash:

[    3.109142] ------------[ cut here ]------------
[    3.109151] kernel BUG at arch/powerpc/kernel/exceptions-64s.S:2831!
[    3.109156] Oops: Exception in kernel mode, sig: 5 [#1]
[    3.109160] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA =
pSeries
[    3.109164] Modules linked in: sd_mod(E) t10_pi(E) crc64_rocksoft(E) =
crc64(E) sg(E) ibmvscsi(E) scsi_transport_srp(E) ibmveth(E) fuse(E)
[    3.109177] CPU: 14 PID: 600 Comm: fsck.ext4 Tainted: G            E  =
    6.0.0-rc7-next-20220930 #1
[    3.109182] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 =
0xf000006 of:IBM,FW1030.00 (NH1030_026) hv:phyp pSeries
[    3.109187] NIP:  c00000000000be38 LR: c00000000001d5e8 CTR: =
c000000000008ed0
[    3.109191] REGS: c0000000210b3a90 TRAP: 0700   Tainted: G            =
E       (6.0.0-rc7-next-20220930)
[    3.109195] MSR:  8000000000021031 <SF,ME,IR,DR,LE>  CR: 44042874  =
XER: 20040000
[    3.109202] CFAR: c000000000008f74 IRQMASK: 1=20
[    3.109202] GPR00: c0000000000340b4 c0000000210b3d30 c00000000135e800 =
0000000002800000=20
[    3.109202] GPR04: c0000000210b3e80 0000000000000000 0000000000000000 =
0000000000000000=20
[    3.109202] GPR08: 8000000002809033 0000000000000005 0000000000000004 =
c00000000001c864=20
[    3.109202] GPR12: 8000000002809033 c000000affd00300 000000013850b460 =
0000000138514380=20
[    3.109202] GPR16: 000000013851af10 0000000000000002 0000000138514a84 =
000000000000dd20=20
[    3.109202] GPR20: 000000012f682548 000000012f682498 00007fffcf59c7b0 =
0000000000000001=20
[    3.109202] GPR24: 0000000000b823f5 0000000000000001 0000000002002000 =
0000000002802000=20
[    3.109202] GPR28: 0000000002800000 c0000000210b3e80 0000000000800000 =
0000000002800000=20
[    3.109246] NIP [c00000000000be38] masked_interrupt+0xc/0xe4
[    3.109254] LR [c00000000001d5e8] restore_math+0xf8/0x2e0
[    3.109259] Call Trace:
[    3.109260] [c0000000210b3d30] [00000001384f8f90] 0x1384f8f90 =
(unreliable)
[    3.109266] [c0000000210b3d80] [c0000000000340b4] =
interrupt_exit_user_prepare_main+0x84/0x270
[    3.109272] [c0000000210b3de0] [c000000000034314] =
syscall_exit_prepare+0x74/0x160
[    3.109277] [c0000000210b3e10] [c00000000000c6e0] =
system_call_common+0x100/0x278
[    3.109283] --- interrupt: c00 at 0x7fffa0a1e744
[    3.109286] NIP:  00007fffa0a1e744 LR: 00007fffa0cb72b0 CTR: =
0000000000000000
[    3.109290] REGS: c0000000210b3e80 TRAP: 0c00   Tainted: G            =
E       (6.0.0-rc7-next-20220930)
[    3.109294] MSR:  800000000000f033 <SF,EE,PR,FP,ME,IR,DR,RI,LE>  CR: =
22042472  XER: 00000000
[    3.109303] IRQMASK: 0=20
[    3.109303] GPR00: 00000000000000b4 00007fffcf59c6a0 00007fffa0b07300 =
0000000000001000=20
[    3.109303] GPR04: 00000001384f8f90 0000000000001000 0000000b823f5000 =
00000001384f8f90=20
[    3.109303] GPR08: 00000001384f1608 0000000000000000 0000000000000000 =
0000000000000000=20
[    3.109303] GPR12: 0000000000000000 00007fffa0dace90 000000013850b460 =
0000000138514380=20
[    3.109303] GPR16: 000000013851af10 0000000000000002 0000000138514a84 =
000000000000dd20=20
[    3.109303] GPR20: 000000012f682548 000000012f682498 00007fffcf59c7b0 =
0000000000000001=20
[    3.109303] GPR24: 0000000000b823f5 0000000000000001 00000001384f8f90 =
00000001384f14a0=20
[    3.109303] GPR28: 0000000b823f5000 0000000000001000 00000001384f1570 =
0000000000000000=20
[    3.109344] NIP [00007fffa0a1e744] 0x7fffa0a1e744
[    3.109347] LR [00007fffa0cb72b0] 0x7fffa0cb72b0
[    3.109350] --- interrupt: c00
[    3.109352] Instruction dump:
[    3.109355] e96a0110 e96a0198 e96a0220 e96a02a8 e96a0330 e96a03b8 =
394a0400 4200ffdc=20
[    3.109362] 4e800020 912d00b4 892d0933 71290025 <0b090000> 892d0933 =
7d295378 992d0933=20
[    3.109369] ---[ end trace 0000000000000000 ]=E2=80=94

This BUG entry was added with=20
commit c39fb71a54f09977eba7584ef0eebb25047097c6
    powerpc/64s/interrupt: masked handler debug check for previous hard =
disable

CONFIG_PPC_IRQ_SOFT_MASK_DEBUG is set.

Thanks
 - Sachin=
