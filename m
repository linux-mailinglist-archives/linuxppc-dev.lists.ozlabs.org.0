Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FAD1AD3B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 May 2019 19:02:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4529Gl0CDrzDqMT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 03:02:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sachinp@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4529FT2DcnzDqHZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 03:01:01 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4CGuur5078314
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 May 2019 13:00:56 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2seb7t1uf3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 May 2019 13:00:56 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Sun, 12 May 2019 18:00:54 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sun, 12 May 2019 18:00:52 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4CH0ptJ52756554
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 12 May 2019 17:00:51 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7684511C04C;
 Sun, 12 May 2019 17:00:51 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A334111C066;
 Sun, 12 May 2019 17:00:49 +0000 (GMT)
Received: from [9.85.70.16] (unknown [9.85.70.16])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 12 May 2019 17:00:48 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: [powerpc] Kernel OOPS running kselftest (sigfuz)
Date: Sun, 12 May 2019 22:30:42 +0530
To: linuxppc-dev@lists.ozlabs.org
X-Mailer: Apple Mail (2.3445.104.8)
X-TM-AS-GCONF: 00
x-cbid: 19051217-0020-0000-0000-0000033BD702
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051217-0021-0000-0000-0000218E884F
Message-Id: <3997E073-B4AD-40E8-8485-A11AFA2E8BF7@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-12_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=763 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905120128
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While running kselftests(sigfuz) against 5.1.0 kernel (sha: 1fb3b526df)
ran into following OOPS.

Last good run was against Commit 8823880561. This is PowerNV =
environment.

(15/17) avocado-misc-tests/kernel/kselftest.py:kselftest.test: =20
[  732.811553] sigfuz[28111]: illegal instruction (4) at 10001884 nip =
10001884 lr 10001854 code 1 in sigfuz[10000000+10000]
[  732.811590] sigfuz[28111]: code: e8410018 3d206666 61296667 7d234896 =
7c6afe70 7d291e70 7d2a4850 552a103a=20
[  732.811599] sigfuz[28111]: code: 55292036 7d2a4a14 7f834800 409e0008 =
<7c00055d> 38210020 e8010010 7c0803a6=20
[  732.811676] Bad kernel stack pointer 7fffb949e670 at c000000000071e7c
[  732.811688] Oops: Bad kernel stack pointer, sig: 6 [#1]
[  732.811695] LE PAGE_SIZE=3D64K MMU=3DRadix MMU=3DHash SMP =
NR_CPUS=3D2048 NUMA PowerNV
[  732.811746] Dumping ftrace buffer:
[  732.811925]    (ftrace buffer empty)
[  732.811934] Modules linked in: xt_CHECKSUM xt_MASQUERADE tun bridge =
stp llc ip6t_rpfilter ipt_REJECT nf_reject_ipv4 ip6t_REJECT =
nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute =
ip6table_nat ip6table_mangle ip6table_security ip6table_raw iptable_nat =
nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c =
iptable_mangle iptable_security iptable_raw ebtable_filter ebtables =
ip6table_filter ip6_tables iptable_filter kvm_hv kvm i2c_dev sunrpc =
dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas =
sg ipmi_powernv ipmi_devintf ipmi_msghandler uio_pdrv_genirq =
leds_powernv uio ibmpowernv opal_prd powernv_op_panel ip_tables ext4 =
mbcache jbd2 sd_mod ipr libata tg3 ptp pps_core [last unloaded: =
kretprobe_example]
[  732.812035] CPU: 118 PID: 28112 Comm: sigfuz Tainted: G           O   =
   5.1.0-autotest-autotest #1
[  732.812040] Bad kernel stack pointer 7fffbacce670 at c000000000071e7c
[  732.812043] NIP:  c000000000071e7c LR: 0000000024c8028d CTR: =
000000001b01d9b1
[  732.812046] REGS: c0002007ff283d30 TRAP: 1500   Tainted: G           =
O       (5.1.0-autotest-autotest)
[  732.812063] MSR:  9000000100001031 <SF,HV,ME,IR,DR,LE,TM[E]>  CR: =
52a9219f  XER: 4003a27e
[  732.812076] CFAR: c000000000071b70 IRQMASK: c000200710e42f00=20
[  732.812076] GPR00: 00000000000000fa 00007fffb949e670 00007fffbaef7f00 =
0000000000000000=20
[  732.812076] GPR04: 0000000000006dd0 000000000000000a 00000000fa7ecd56 =
00007fffbaeb00e4=20
[  732.812076] GPR08: 0000000000006dd0 0000000000000000 0000000000000000 =
0000000000000000=20
[  732.812076] GPR12: 0000000000000000 00007fffb94a6900 0000000000000000 =
0000000000000000=20
[  732.812076] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[  732.812076] GPR20: 0000000000000000 0000000010003408 00000000100033f0 =
00000000100033e0=20
[  732.812076] GPR24: 00000000100033b8 0000000010003390 0000000010003370 =
0000000010020164=20
[  732.812076] GPR28: 00007fffbaef4428 00000000003d0f00 0000000010020164 =
000000005cd5df78=20
[  732.812124] sigfuz[28118]: illegal instruction (4) at 100018a0 nip =
100018a0 lr 10001828 code 1 in sigfuz[10000000+10000]
[  732.812132] NIP [c000000000071e7c] restore_gprs+0x100/0x198
[  732.812136] sigfuz[28118]: code: 552a103a 55292036 7d2a4a14 7f834800 =
409e0008 7c00055d 38210020 e8010010=20
[  732.812141] LR [0000000024c8028d] 0x24c8028d
[  732.812142] Call Trace:
[  732.812150] sigfuz[28118]: code: 7c0803a6 4e800020 60000000 60420000 =
<7c00051d> 41820008 4bfff679 e8410018=20
[  732.812153] Instruction dump:
[  732.812168] e8c700a0 e8a70098 f8a1fff8 e8a70078 f8a1fff0 e8e700a8 =
38a00000 7ca10164=20
[  732.812178] 7c314ba6 e8a1fff8 e821fff0 7c0007dd <7c421378> 7db04aa6 =
7c314aa6 38800002=20
[  732.812189] ---[ end trace 34d7d6321d88e03e ]---
[  732.812311] sigfuz[28119]: illegal instruction (4) at 100018a0 nip =
100018a0 lr 10001828 code 1 in sigfuz[10000000+10000]
[  732.812325] sigfuz[28119]: code: 552a103a 55292036 7d2a4a14 7f834800 =
409e0008 7c00055d 38210020 e8010010=20
[  732.812335] sigfuz[28119]: code: 7c0803a6 4e800020 60000000 60420000 =
<7c00051d> 41820008 4bfff679 e8410018=20
[  732.812492]=20
[  732.812496] Oops: Bad kernel stack pointer, sig: 6 [#2]
[  732.812503] LE PAGE_SIZE=3D64K MMU=3DRadix MMU=3DHash SMP =
NR_CPUS=3D2048 NUMA PowerNV
[  732.812522] Dumping ftrace buffer:
[  732.812560]    (ftrace buffer empty)

Thanks
-Sachin=

