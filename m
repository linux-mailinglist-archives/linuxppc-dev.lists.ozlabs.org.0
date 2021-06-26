Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 601823B4ED5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 15:52:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBwLB1nksz3bsN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 23:52:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rIDn4K2a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rIDn4K2a; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBwKf0kl1z303X
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jun 2021 23:52:21 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15QDi0m2172701; Sat, 26 Jun 2021 09:52:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=tmxHQ6PpNZWXaUInAYJGdCTsPlyKGP7qLHmrP+x7H1w=;
 b=rIDn4K2aKgW0AQJHyYRa3vDUNi19AJD2s69/C/p8kwd7rwZTGBFvvynmqrRfD5ixDhwv
 XIN2St9pA8tYaz2iV1zbZhRlueXVHfHnWGmlIuLO/DljGzXluqBmQNJZJtgwbpDSqDoj
 i5x0Idei52tLD3CGe3iC9KvJQBuZh+T6GSDBVKB7o3kU8tWOFYkMwIETuRK1VLbOWpfU
 lx70u2SQMT9OTviQfgH9H66cNploQLbBEep6+6NdugvFLsACzdM2h/GUTYeGfl1E9s+A
 oT747glsgCIDlcp2wrcWR/tOgjdZ3+Iezg08jmMGSxLPsqTDKxq4fFiPPFufQYhdKTDD dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39e5cn86vv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 26 Jun 2021 09:52:11 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15QDj2Bl177124;
 Sat, 26 Jun 2021 09:52:11 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39e5cn86vg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 26 Jun 2021 09:52:11 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15QDq96q017907;
 Sat, 26 Jun 2021 13:52:09 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 39duv8g2ft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 26 Jun 2021 13:52:09 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15QDq7L927656572
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 26 Jun 2021 13:52:07 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0DFCD5204E;
 Sat, 26 Jun 2021 13:52:07 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.77.195.154])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 3532F52050;
 Sat, 26 Jun 2021 13:52:06 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: [powerpc][next-20210625] Kernel
 warning(arch/powerpc/kernel/interrupt.c:518) during boot
Message-Id: <478A3DE4-159E-4FF8-92B4-6550F72951E6@linux.vnet.ibm.com>
Date: Sat, 26 Jun 2021 19:22:04 +0530
To: linuxppc-dev@lists.ozlabs.org
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JhoLI97ykvnzhOrJ3Au71JbRg6bZL9jf
X-Proofpoint-ORIG-GUID: oZqqY1tT-2JLRW3_5c3-CPISYfgCoeUV
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-26_08:2021-06-25,
 2021-06-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106260089
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
Cc: linux-next@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Following kernel warning is seen while booting 5.13.0-rc7-next-20210625
on POWER9 LPAR.

[   40.573592] ------------[ cut here ]------------
[   40.573604] WARNING: CPU: 6 PID: 4743 at =
arch/powerpc/kernel/interrupt.c:518 =
interrupt_exit_kernel_prepare+0x280/0x2a0
[   40.573614] Modules linked in: dm_mod bonding nft_ct nf_conntrack =
nf_defrag_ipv6 nf_defrag_ipv4 ip_set rfkill nf_tables libcrc32c =
nfnetlink sunrpc pseries_rng xts uio_pdrv_genirq uio vmx_crypto =
sch_fq_codel ip_tables ext4 mbcache jbd2 sd_mod t10_pi sg ibmvscsi =
ibmveth scsi_transport_srp fuse
[   40.573649] CPU: 6 PID: 4743 Comm: dracut-install Not tainted =
5.13.0-rc7-next-20210625 #1
[   40.573655] NIP:  c000000000032990 LR: c00000000000c958 CTR: =
000000000048dd1c
[   40.573660] REGS: c0000000414db640 TRAP: 0700   Not tainted  =
(5.13.0-rc7-next-20210625)
[   40.573664] MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 28044288  =
XER: 00000000
[   40.573674] CFAR: c0000000000327a4 IRQMASK: 1=20
               GPR00: c00000000000c958 c0000000414db8e0 c0000000029bbd00 =
c0000000414db9a0=20
               GPR04: 8000000000001033 0000000000000093 0000000000000048 =
ffffffffffffffbf=20
               GPR08: 0000000000000008 0000000000000000 0000000000000003 =
0000000000000010=20
               GPR12: 0000000000004000 c000000005587a00 0000000101dc15a8 =
0000000101dc1590=20
               GPR16: 0000000101dc05a8 00007fffc7abe353 00007fffb7926740 =
0000000000000000=20
               GPR20: 00007fffc7ab7ae0 fffffffffffff000 0000000000000006 =
c000000043cbbc00=20
               GPR24: 0000000000000000 000001003da495d0 0000000000000000 =
0000000000000000=20
               GPR28: 0000000000000000 fcffffffffffffff 0000000000000000 =
c0000000414db9a0=20
[   40.573725] NIP [c000000000032990] =
interrupt_exit_kernel_prepare+0x280/0x2a0
[   40.573730] LR [c00000000000c958] =
interrupt_return_srr_user_restart+0x34/0x118
[   40.573736] Call Trace:
[   40.573738] [c0000000414db8e0] [c000000043cbbc00] 0xc000000043cbbc00 =
(unreliable)
[   40.573744] [c0000000414db930] [c00000000000c958] =
interrupt_return_srr_user_restart+0x34/0x118
[   40.573751] --- interrupt: 300 at strnlen_user+0x74/0x240
[   40.573756] NIP:  c00000000070ccf4 LR: c00000000048a460 CTR: =
000000000003fffe
[   40.573760] REGS: c0000000414db9a0 TRAP: 0300   Not tainted  =
(5.13.0-rc7-next-20210625)
[   40.573764] MSR:  8000000000001033 <SF,ME,IR,DR,RI,LE>  CR: 48044228  =
XER: 20040000
[   40.573774] CFAR: c00000000048a45c DAR: 000001003da495d0 DSISR: =
40000000 IRQMASK: 0=20
               GPR00: c00000000048a44c c0000000414dbc40 c0000000029bbd00 =
0000000000000000=20
               GPR04: 0000000000200000 0000000000000030 c000000043cbbc00 =
000001003da495d0=20
               GPR08: a8aaaaaaaaaaaaaa bcffffffffffffff 000001003da495d0 =
0000000000000000=20
               GPR12: 0000000000004000 c000000005587a00 0000000101dc15a8 =
0000000101dc1590=20
               GPR16: 0000000101dc05a8 00007fffc7abe353 00007fffb7926740 =
0000000000000000=20
               GPR20: 00007fffc7ab7ae0 fffffffffffff000 0000000000000006 =
c000000043cbbc00=20
               GPR24: 0000000000000000 000001003da495d0 0000000000000000 =
0000000000000000=20
               GPR28: 0000000000000000 c000000043b6a000 c000000043cbbc00 =
0000000000000000=20
[   40.573826] NIP [c00000000070ccf4] strnlen_user+0x74/0x240
[   40.573830] LR [c00000000048a460] copy_strings.isra.42+0xb0/0x350
[   40.573835] --- interrupt: 300
[   40.573838] [c0000000414dbc40] [c00000007d7c0000] 0xc00000007d7c0000 =
(unreliable)
[   40.573843] [c0000000414dbc70] [c00000000048a44c] =
copy_strings.isra.42+0x9c/0x350
[   40.573849] [c0000000414dbd10] [c00000000048b60c] =
do_execveat_common.isra.44+0x1fc/0x240
[   40.573855] [c0000000414dbd80] [c00000000048b6a4] =
sys_execve+0x54/0x70
[   40.573860] [c0000000414dbdb0] [c0000000000322c0] =
system_call_exception+0x150/0x2d0
[   40.573865] [c0000000414dbe10] [c00000000000c464] =
system_call_common+0xf4/0x258
[   40.573871] --- interrupt: c00 at 0x7fffb76db8a8
[   40.573875] NIP:  00007fffb76db8a8 LR: 00007fffb76dc488 CTR: =
0000000000000000
[   40.573878] REGS: c0000000414dbe80 TRAP: 0c00   Not tainted  =
(5.13.0-rc7-next-20210625)
[   40.573883] MSR:  800000000280f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 28044283  XER: 00000000
[   40.573895] IRQMASK: 0=20
               GPR00: 000000000000000b 00007fffc7ab7a00 00007fffb77f7300 =
00007fffc7ab7a20=20
               GPR04: 00007fffc7ab7ae0 00007fffc7ab8b50 0000000000007063 =
0000000000000000=20
               GPR08: ffff800038540059 0000000000000000 0000000000000000 =
0000000000000000=20
               GPR12: 0000000000000000 00007fffb792d720 0000000101dc15a8 =
0000000101dc1590=20
               GPR16: 0000000101dc05a8 00007fffc7abe353 00007fffb7926740 =
00007fffc7ab7a20=20
               GPR20: 00007fffb7926740 000000000000002f 0000000000000000 =
0000000000000013=20
               GPR24: 0000000000000003 00007fffc7abffa7 0000000000000001 =
00007fffc7ab8b50=20
               GPR28: 00007fffc7ab7ae0 00007fffc7abffb0 0000000101dc1378 =
00007fffc7ab7a20=20
[   40.573943] NIP [00007fffb76db8a8] 0x7fffb76db8a8
[   40.573947] LR [00007fffb76dc488] 0x7fffb76dc488
[   40.573950] --- interrupt: c00
[   40.573952] Instruction dump:
[   40.573955] 71290001 892d0933 61290001 992d0933 4082000c 392d0918 =
7c20492a 4bfe36dd=20
[   40.573964] 60000000 4bfffe34 60000000 60000000 <0fe00000> 4bfffe14 =
60000000 60000000=20
[   40.573973] ---[ end trace 604b708523af26f5 ]=E2=80=94

I cannot consistently recreate this problem.=20

next-20210624 was good.=20

Last patch that touched this code was 6eaaf9de3599.

Thanks
-Sachin=
