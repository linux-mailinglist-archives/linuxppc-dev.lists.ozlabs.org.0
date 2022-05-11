Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D148522F5D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 11:27:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyqLr6wdyz3cK7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 19:27:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=okcwQBeX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=okcwQBeX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyqLB2xS3z3bXn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 19:26:57 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24B8sLRQ011942;
 Wed, 11 May 2022 09:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=h6D/715FoTuIOtdOWwwB0cshDdJlyZCiWMOsErTmOlM=;
 b=okcwQBeX0tTae/stVpjrbA9M+g8sCXnU4zeOGzKi53ph8XKNsNREvZqXos4Z4LmReium
 oEUg/O8MmdpvoCfHYUmDya4ipPCTxuR7tdZ7SJDxQ2wK0Mbey4LXjEybTxslKXB+I5fm
 0am24qxfAqxdhPtMiObO+QusqG+Fmm1WjyKWOIrL0XgTFj9tFNAIFOiAJm+77QY9+L3H
 CQstJG0u2/xvGJu6zjc8dHcECUIFH+LQFqg120QQr6HVvGNHRE1aKcKWRtTHwomSCp40
 p44P+QsV/kfSr1K5IxzZ7HNp85Uopx8sXEFpIgV+bdXan7dKp0kBkQuR3G/Q+QuWKOeL fg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g03c0y5pp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 09:26:55 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24B9MqpQ017116;
 Wed, 11 May 2022 09:26:52 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3fwgd8w7x1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 09:26:52 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24B9QoQY45416732
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 May 2022 09:26:50 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7415EAE04D;
 Wed, 11 May 2022 09:26:50 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FB82AE051;
 Wed, 11 May 2022 09:26:49 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.199.197.180])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 May 2022 09:26:49 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: [powerpc] Kernel oops while running xfstests w/ext4
 (5.18-rc6-next-20220510)
Message-Id: <849697D9-0BF2-435F-B4F0-BC971269A9AA@linux.ibm.com>
Date: Wed, 11 May 2022 14:56:47 +0530
To: Ext4 Developers List <linux-ext4@vger.kernel.org>,
 linux-next@vger.kernel.org
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wxJg7GrpsJhuRq9rYSv4iomMNym5Kp2a
X-Proofpoint-ORIG-GUID: wxJg7GrpsJhuRq9rYSv4iomMNym5Kp2a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_03,2022-05-10_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 clxscore=1011 mlxlogscore=999 spamscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205110040
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
Cc: riteshh@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While running xfstests (specifically ext4/032) w/ext4 on a POWER9 LPAR =
running
linux-next version 5.18.0-rc6-next-20220510 following crash is seen:

[  472.486440] EXT4-fs (loop0): resized filesystem to 41943040
[  472.760888] BUG: Kernel NULL pointer dereference at 0x0000002c
[  472.760891] Faulting instruction address: 0xc0000000007729f4
[  472.760894] Oops: Kernel access of bad area, sig: 11 [#1]
[  472.760913] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA =
pSeries
[  472.760921] Modules linked in: loop(E) dm_mod(E) nft_fib_inet(E) =
nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) =
nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E) =
nft_chain_nat(E) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) =
nf_defrag_ipv4(E) ip_set(E) bonding(E) rfkill(E) tls(E) nf_tables(E) =
libcrc32c(E) nfnetlink(E) sunrpc(E) pseries_rng(E) vmx_crypto(E) ext4(E) =
mbcache(E) jbd2(E) sr_mod(E) cdrom(E) sd_mod(E) sg(E) lpfc(E) =
nvmet_fc(E) nvmet(E) ibmvscsi(E) scsi_transport_srp(E) ibmveth(E) =
nvme_fc(E) nvme(E) nvme_fabrics(E) nvme_core(E) t10_pi(E) =
scsi_transport_fc(E) crc64_rocksoft(E) crc64(E) tg3(E) ipmi_devintf(E) =
ipmi_msghandler(E) fuse(E)
[  472.761006] CPU: 8 PID: 5139 Comm: kworker/u193:0 Tainted: G          =
  E     5.18.0-rc6-next-20220510 #2
[  472.761013] Workqueue: loop0 loop_rootcg_workfn [loop]
[  472.761027] NIP:  c0000000007729f4 LR: c00000000077331c CTR: =
c0000000009e9ac0
[  472.761032] REGS: c00000002d95b3a0 TRAP: 0380   Tainted: G            =
E      (5.18.0-rc6-next-20220510)
[  472.761038] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 24008822  XER: 00000000
[  472.761057] CFAR: c000000000772b80 IRQMASK: 0=20
[  472.761057] GPR00: c00000000077331c c00000002d95b640 c000000002a7cf00 =
c00000002d95b8e0=20
[  472.761057] GPR04: c00000006fd58200 0000000000000001 0000000000000010 =
0000000000000040=20
[  472.761057] GPR08: 0000000000000020 0000000000000000 0000000000010000 =
c0080000089570f8=20
[  472.761057] GPR12: 0000000000008000 c00000001ec46300 0000000000000000 =
c000000054e32200=20
[  472.761057] GPR16: 5deadbeef0000100 0000000000000000 0000000000000000 =
0000000000000000=20
[  472.761057] GPR20: 000000007fffffff c009fffffc817a00 c00000002d95b748 =
c00000002d95b8e0=20
[  472.761057] GPR24: 0000000000000001 0000000000000000 c0000000842b1c00 =
0000000000000000=20
[  472.761057] GPR28: 0000000000000000 0000000000000000 c00000006fd58200 =
c00000002d95b8e0=20
[  472.761126] NIP [c0000000007729f4] blk_add_rq_to_plug+0x74/0x1d0
[  472.761135] LR [c00000000077331c] =
blk_mq_try_issue_list_directly+0x18c/0x1d0
[  472.761141] Call Trace:
[  472.761144] [c00000002d95b640] [c0000000842b1c00] 0xc0000000842b1c00 =
(unreliable)
[  472.761153] [c00000002d95b680] [c000000000773244] =
blk_mq_try_issue_list_directly+0xb4/0x1d0
[  472.761160] [c00000002d95b6d0] [c00000000077b38c] =
blk_mq_sched_insert_requests+0x13c/0x240
[  472.761168] [c00000002d95b720] [c000000000772658] =
blk_mq_flush_plug_list+0x118/0x440
[  472.761175] [c00000002d95b7c0] [c00000000075ecbc] =
__blk_flush_plug+0x17c/0x200
[  472.761183] [c00000002d95b840] [c00000000075efe0] =
blk_finish_plug+0x50/0x70
[  472.761190] [c00000002d95b870] [c00000000061a2a4] =
__iomap_dio_rw+0x444/0x960
[  472.761200] [c00000002d95ba60] [c00000000061a7e0] =
iomap_dio_rw+0x20/0x90
[  472.761208] [c00000002d95ba80] [c008000008c56424] =
ext4_file_read_iter+0x17c/0x2d0 [ext4]
[  472.761237] [c00000002d95bac0] [c008000009822aa8] =
lo_rw_aio.isra.36+0x260/0x320 [loop]
[  472.761245] [c00000002d95bb40] [c008000009824030] =
loop_process_work+0x448/0xb70 [loop]
[  472.761253] [c00000002d95bc90] [c000000000183744] =
process_one_work+0x2b4/0x5b0
[  472.761262] [c00000002d95bd30] [c000000000183ab8] =
worker_thread+0x78/0x600
[  472.761269] [c00000002d95bdc0] [c0000000001901d4] kthread+0x124/0x130
[  472.761276] [c00000002d95be10] [c00000000000ce04] =
ret_from_kernel_thread+0x5c/0x64
[  472.761284] Instruction dump:
[  472.761288] 893f0014 38e00040 39000020 2fa90000 7d283f9e 7e8a4840 =
409400b4 e93e0000=20
[  472.761300] e9290068 71290008 40820024 3d400001 <813d002c> 614affff =
7e895040 41950090=20
[  472.761314] ---[ end trace 0000000000000000 ]---
[  472.769088]=20
[  473.769091] Kernel panic - not syncing: Fatal exception

5.18.0-rc6-next-20220509 build did not exhibit this problem.
Will try git bisect and report back with results.

- Sachin

