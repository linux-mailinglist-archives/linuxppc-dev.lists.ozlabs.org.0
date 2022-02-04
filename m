Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 349264A9442
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 08:04:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jqmjn6BDjz3cBH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 18:04:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J0VMFgpu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=J0VMFgpu; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jqmj20yqPz2yPV
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Feb 2022 18:03:33 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21436OhC017326
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 4 Feb 2022 07:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : content-type :
 subject : message-id : date : cc : to : content-transfer-encoding :
 mime-version; s=pp1; bh=ofUCs5NpEEv286PmHRuhnpmYeLbQ/rz0lmUodXWT/Dk=;
 b=J0VMFgpu/qv8/TxFWCpCZGQnLR9twlsnFXOOEJMjCBEMohR4RGxCXsUhg2As3qDKEoI6
 zqz09f2BCQpfN/LRaxbyVouKc6KeWV1N+kPnmobL1vYWVnxotSM084iRaQ1AqvYin/IX
 E3AiL0YQwUglFnUAmyC9pWYAc1V3DQY1ytKlvSHRwGQKOUFZr3MdJgqlr/KUk69ulbzS
 NoS+6kQ4FReyJYNMKadulsJm4ATVrGmjQ4lZfaalhsgKVEMyVbogW1KY2hvdiBf1CDHY
 5aRQMoLgDG7t/ItAWZ1vAtnW/LNJ+t3cUdtx/rl+aNeh2o67K6oEfbIccRl9yUhtpyfA ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0qx8y3ya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Feb 2022 07:03:30 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21470Gvw004940
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 4 Feb 2022 07:03:30 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0qx8y3xa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 07:03:30 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21472rwG014579;
 Fri, 4 Feb 2022 07:03:28 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3e0r0n1w77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 07:03:28 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21473QKl27984172
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Feb 2022 07:03:26 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6BC642042;
 Fri,  4 Feb 2022 07:03:25 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E06D442054;
 Fri,  4 Feb 2022 07:03:24 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.195.44.254])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  4 Feb 2022 07:03:24 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Subject: [powerpc/perf] WARN_ONCE arch/powerpc/include/asm/interrupt.h:365
 with perf tests
Message-Id: <19CAFB8D-6D28-48F0-A23B-1D2744F85544@linux.ibm.com>
Date: Fri, 4 Feb 2022 12:33:23 +0530
To: linuxppc-dev@lists.ozlabs.org
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SmcndyunUhQvESaVu2xYWQ9-i6L-2u0O
X-Proofpoint-ORIG-GUID: exzy5QHE9TLX4JiAERiQDcCY2_yQrPaM
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_02,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202040035
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While running perftool [1] test against 5.17-rc2 booted on Power 9 LPAR
following warning is seen:

[  442.002150] ------------[ cut here ]------------
[  442.002164] WARNING: CPU: 7 PID: 76 at arch/powerpc/include/asm/interrup=
t.h:365 interrupt_nmi_exit_prepare+0x150/0x160
[  442.002175] Modules linked in: dm_mod nft_compat nft_ct nf_conntrack nf_=
defrag_ipv6 nf_defrag_ipv4 ip_set rfkill nf_tables nfnetlink pseries_rng ui=
o_pdrv_genirq uio nfsd auth_rpcgss nfs_acl lockd drm grace sunrpc sch_fq_co=
del drm_panel_orientation_quirks i2c_core xfs libcrc32c sr_mod sd_mod cdrom=
 t10_pi xts ibmvscsi ibmveth scsi_transport_srp vmx_crypto fuse
[  442.002216] CPU: 7 PID: 76 Comm: kworker/7:1 Kdump: loaded Not tainted 5=
.17.0-rc2-00167-gdcb85f85fa6f #1
[  442.002222] Workqueue: events perf_sched_delayed
[  442.002228] NIP:  c00000000002b840 LR: c00000000002b818 CTR: c0000000003=
43240
[  442.002232] REGS: c00000002c08f460 TRAP: 0700   Not tainted  (5.17.0-rc2=
-00167-gdcb85f85fa6f)
[  442.002237] MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 88002484  XE=
R: 000000cf
[  442.002247] CFAR: c00000000002b7ac IRQMASK: 3
[  442.002247] GPR00: c00000000002b818 c00000002c08f700 c000000002a1fe00 00=
00000000000000
[  442.002247] GPR04: c00000002c08f758 0000000000000008 00000003fdcc0000 00=
000003fdcc0000
[  442.002247] GPR08: 0000000000000001 c000000007fc6280 0000000000000021 00=
0000003b9aca00
[  442.002247] GPR12: 0000000000002000 c000000007fc6280 c0000000001925f8 c0=
00000028ce0100
[  442.002247] GPR16: 0000000000000000 0000000000000000 0000000000000000 00=
00000000000000
[  442.002247] GPR20: 0000000000000000 c000000002a53a00 c000000002b0a8a0 00=
00000000000000
[  442.002247] GPR24: c000000002550de0 0000000000000001 c000000001059d60 00=
00000000000000
[  442.002247] GPR28: 0000000060000000 c008000000100000 c00000002c08f810 c0=
0000002c08f758
[  442.002299] NIP [c00000000002b840] interrupt_nmi_exit_prepare+0x150/0x160
[  442.002305] LR [c00000000002b818] interrupt_nmi_exit_prepare+0x128/0x160
[  442.002310] Call Trace:
[  442.002312] [c00000002c08f700] [c00000000013bcac] perf_event_interrupt+0=
x3c/0x70 (unreliable)
[  442.002320] [c00000002c08f730] [c00000000002b8c4] performance_monitor_ex=
ception_nmi+0x74/0xb0
[  442.002327] [c00000002c08f780] [c00000000002bd44] performance_monitor_ex=
ception+0x44/0x60
[  442.002332] [c00000002c08f7a0] [c00000000000af28] performance_monitor_co=
mmon_virt+0x208/0x210
[  442.002339] --- interrupt: f00 at __patch_instruction+0x10/0x60
[  442.002344] NIP:  c0000000000b0bc0 LR: c0000000000b1080 CTR: 00000000000=
0ae84
[  442.002348] REGS: c00000002c08f810 TRAP: 0f00   Not tainted  (5.17.0-rc2=
-00167-gdcb85f85fa6f)
[  442.002352] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR=
: 44002484  XER: 000000cf
[  442.002365] CFAR: 0000000000000000 IRQMASK: 1
[  442.002365] GPR00: c0000000000b1114 c00000002c08fab0 c000000002a1fe00 c0=
000000001a59f8
[  442.002365] GPR04: 0000000060000000 c0080000001059f8 8e011a00000000c0 ff=
ffffffffffffff
[  442.002365] GPR08: c0000000001a018e 0000000060000000 00000000000000c0 00=
00000000000040
[  442.002365] GPR12: 0000000084002484 c000000007fc6280 c0000000001925f8 c0=
00000028ce0100
[  442.002365] GPR16: 0000000000000000 0000000000000000 0000000000000000 00=
00000000000000
[  442.002365] GPR20: 0000000000000000 c000000002a53a00 c000000002b0a8a0 00=
00000000000000
[  442.002365] GPR24: c000000002550de0 0000000000000001 c000000001059d60 00=
00000000000000
[  442.002365] GPR28: 0000000060000000 c008000000100000 0000000000000000 c0=
000000001a59f8
[  442.002414] NIP [c0000000000b0bc0] __patch_instruction+0x10/0x60
[  442.002419] LR [c0000000000b1080] patch_instruction+0xf0/0x1c0
[  442.002423] --- interrupt: f00
[  442.002426] [c00000002c08fab0] [c0000000000b1114] patch_instruction+0x18=
4/0x1c0 (unreliable)
[  442.002432] [c00000002c08fb00] [c00000000005dc48] arch_jump_label_transf=
orm+0x38/0x78
[  442.002438] [c00000002c08fb20] [c00000000036a948] __jump_label_update+0x=
148/0x180
[  442.002444] [c00000002c08fbc0] [c00000000036afd8] static_key_disable_cpu=
slocked+0xe8/0x130
[  442.002450] [c00000002c08fc30] [c00000000036b050] static_key_disable+0x3=
0/0x50
[  442.002454] [c00000002c08fc60] [c000000000343978] perf_sched_delayed+0x9=
8/0xc0
[  442.002460] [c00000002c08fc90] [c0000000001849dc] process_one_work+0x27c=
/0x550
[  442.002466] [c00000002c08fd30] [c000000000184d58] worker_thread+0xa8/0x6=
20
[  442.002472] [c00000002c08fdc0] [c000000000192710] kthread+0x120/0x130
[  442.002477] [c00000002c08fe10] [c00000000000ce64] ret_from_kernel_thread=
+0x5c/0x64
[  442.002482] Instruction dump:
[  442.002486] e87e0100 480893a5 60000000 2c230000 4182ff58 39400000 f87e01=
00 b14d0930
[  442.002494] 4bffff48 60000000 60000000 60420000 <0fe00000> 60000000 6000=
0000 60420000
[  442.002503] ---[ end trace 0000000000000000 ]---
[  442.002511] Can't find PMC that caused IRQ

Since this warning is printed only once I can=E2=80=99t recreate it easily.=
 I have seen this only
on P9 (hash MMU) and only with 5.17-rc1 onwards.

- Sachin

[1] - https://github.com/sacsant/avocado-misc-tests/blob/ci/perf/perftool.p=
y=
