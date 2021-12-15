Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B89EB4756DF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 11:50:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDX7x4XrDz3cNC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 21:50:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gjEG0v/v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gjEG0v/v; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDX775Twvz2xtL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 21:49:23 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BF9jkFn027608
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 10:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=e7jjjCVYI0gsV8juYi+tXORibbAEMTJD8vuZ34Yxyzg=;
 b=gjEG0v/v+fKp3lhi7OScycJn69BY9MOb+vaGjDHt0+sVQwTJlI9ttvkbmCWNGSJxZC9S
 rLYj64c23WiBzZVZGniixF00oUe+ObaI24G48ByOdkpEHsMJYq/u1KkwdwH+8ZJJJyZO
 x4rBhLUTi8TqHB5IC3xAVBjZUxgCe7FaqLQ1sQZfjySb6Um5/zvqKAq/J/+OmKSMFLje
 Trc0CKH/smsJXrlipvZi2ClA5/yJfMtKSTDUrOSkG6XBhc0pCU3Gv83YOtLki6azlQXy
 4I/nlbn8JUcWoiDypCGMmLzPZ7LVp9HAy0SkZ1g6+BJerOYpFCcWia8bOiarukLFLYbd 8w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cye1196q2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 10:49:19 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BFAZrvX014799
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 10:49:19 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cye1196pe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 10:49:19 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFAfpI1018135;
 Wed, 15 Dec 2021 10:49:17 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 3cy78h3sgd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 10:49:17 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFAnFtE41157082
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 10:49:15 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F4614203F;
 Wed, 15 Dec 2021 10:49:15 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E1A442057;
 Wed, 15 Dec 2021 10:49:14 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.195.37.35])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 15 Dec 2021 10:49:13 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [RFC PATCH] powerpc/signal: sanitise PT_NIP and sa_handler low
 bits
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <20211130072933.2004389-1-npiggin@gmail.com>
Date: Wed, 15 Dec 2021 16:19:13 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <BE11B400-C0DF-4478-9728-327C9232B75E@linux.vnet.ibm.com>
References: <20211130072933.2004389-1-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bvMymufmHth-DKaYCr1z4GUELRtcqCLY
X-Proofpoint-ORIG-GUID: x1Eed1U5BV7i3-rfs7_CfSEwohPC0xor
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_07,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150058
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> I'm not entirely sure about the 32-bit / compat part. Or the 64-bit =
for
> that matter except that it does seem to fix the bug caused by the test
> program.
>=20
> Thanks,
> Nick
>=20
> arch/powerpc/kernel/signal_32.c | 23 ++++++++++++++++-------
> arch/powerpc/kernel/signal_64.c | 17 ++++++++++++-----
> 2 files changed, 28 insertions(+), 12 deletions(-)

Sorry for the delayed feedback. I was observing confusing test results
so had to be sure.=20

Test results are against  5.16.0-rc5-03218-g798527287598 (powerpc/merge)

I ran some extended set of kernel self tests (from powerpc/signal and
powerpc/security) on POWER8, POWER9 and POWER10 configs.

On POWER8 & POWER10 LPAR with this fix tests ran successfully.

on POWER9 PowerNV with the fix and following set of configs

CONFIG_PPC_IRQ_SOFT_MASK_DEBUG=3Dy
CONFIG_PPC_RFI_SRR_DEBUG=3Dy

the tests ran successfully.

But with the fix and following set of configs

CONFIG_PPC_IRQ_SOFT_MASK_DEBUG=3Dy
CONFIG_PPC_RFI_SRR_DEBUG=3Dn

I still a warning and then a crash:

[  550.568588] count-cache-flush: hardware flush enabled.
[  550.568593] link-stack-flush: software flush enabled.
[  550.569604] ------------[ cut here ]------------
[  550.569611] WARNING: CPU: 21 PID: 3784 at =
arch/powerpc/kernel/irq.c:288 arch_local_irq_restore+0x22c/0x230
[  550.569625] Modules linked in: nft_ct nf_conntrack nf_defrag_ipv6 =
nf_defrag_ipv4 ip_set nf_tables rfkill libcrc32c nfnetlink i2c_dev =
rpcrdma sunrpc ib_umad rdma_ucm ib_srpt ib_isert iscsi_target_mod =
target_core_mod ib_ipoib ib_iser rdma_cm iw_cm libiscsi ib_cm =
scsi_transport_iscsi mlx5_ib ib_uverbs dm_mod ib_core ses enclosure =
tpm_i2c_nuvoton i2c_opal ipmi_powernv xts ipmi_devintf uio_pdrv_genirq =
vmx_crypto ipmi_msghandler i2c_core opal_prd uio ibmpowernv leds_powernv =
powernv_op_panel sch_fq_codel ip_tables ext4 mbcache jbd2 mlx5_core =
sd_mod t10_pi sg mpt3sas ipr tg3 libata mlxfw psample raid_class ptp =
scsi_transport_sas pps_core fuse
[  550.569752] CPU: 21 PID: 3784 Comm: NetworkManager Kdump: loaded Not =
tainted 5.16.0-rc5-03218-g798527287598 #8
[  550.569765] NIP:  c0000000000171dc LR: c000000000033240 CTR: =
c000000000cf1260
[  550.569774] REGS: c000000ae08bbab0 TRAP: 0700   Not tainted  =
(5.16.0-rc5-03218-g798527287598)
[  550.569784] MSR:  9000000000021031 <SF,HV,ME,IR,DR,LE>  CR: 28004444  =
XER: 20040000
[  550.569802] CFAR: c00000000001704c IRQMASK: 1
[  550.569802] GPR00: c000000000033240 c000000ae08bbd50 c000000002a10600 =
0000000000000000
[  550.569802] GPR04: c000000ae08bbe80 00007fffaea1ece0 0000000000000000 =
0000000000000000
[  550.569802] GPR08: 0000000000000002 0000000000000000 0000000000000002 =
0000000001f3fb0c
[  550.569802] GPR12: 0000000000004000 c000005fff7c9080 0000000000000000 =
0000000000000000
[  550.569802] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
[  550.569802] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
[  550.569802] GPR24: 0000000000000002 0000000000000001 0000000002002000 =
0000000002802000
[  550.569802] GPR28: 0000000000000000 0000000000000800 c000000ae08bbe80 =
0000000000040080
[  550.569899] NIP [c0000000000171dc] arch_local_irq_restore+0x22c/0x230
[  550.569909] LR [c000000000033240] =
interrupt_exit_user_prepare_main+0x150/0x260
[  550.569919] Call Trace:
[  550.569925] [c000000ae08bbd80] [c000000000033240] =
interrupt_exit_user_prepare_main+0x150/0x260
[  550.569937] [c000000ae08bbde0] [c000000000033744] =
syscall_exit_prepare+0x74/0x150
[  550.569948] [c000000ae08bbe10] [c00000000000c758] =
system_call_common+0xf8/0x268
[  550.569960] --- interrupt: c00 at 0x7fffaea1ece0
[  550.569968] NIP:  00007fffaea1ece0 LR: 00007fffaea1ecc4 CTR: =
0000000000000000
[  550.569977] REGS: c000000ae08bbe80 TRAP: 0c00   Not tainted  =
(5.16.0-rc5-03218-g798527287598)
[  550.569987] MSR:  900000000280f033 =
<SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 24004448  XER: 00000000
[  550.570012] IRQMASK: 0
[  550.570012] GPR00: 00000000000000a7 00007fffeea71ce0 00007fffaeb07300 =
0000000000000001
[  550.570012] GPR04: 0000000000000007 0000000000013eed 0000000000000000 =
0000000000000002
[  550.570012] GPR08: 00007fffad6c7ea8 0000000000000000 0000000000000000 =
0000000000000000
[  550.570012] GPR12: 0000000000000000 00007fffad6cf510 0000000000000000 =
0000000000000000
[  550.570012] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
[  550.570012] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
[  550.570012] GPR24: 0000000000000000 0000000000000001 0000000000013eed =
00007fffeea71da4
[  550.570012] GPR28: 0000000000000000 0000000000000007 000000013a1ae810 =
0000000000013eed
[  550.570105] NIP [00007fffaea1ece0] 0x7fffaea1ece0
[  550.570112] LR [00007fffaea1ecc4] 0x7fffaea1ecc4
[  550.570119] --- interrupt: c00
[  550.570124] Instruction dump:
[  550.570130] f8010040 0fe00000 4bfffff0 60000000 60000000 0fe00000 =
60000000 60000000
[  550.570148] 60000000 39200002 7d210164 4bfffec4 <0fe00000> 3c4c02a0 =
38429420 7c0802a6
[  550.570165] ---[ end trace b8833ddd6f9d2d40 ]---
[  550.570174] Unrecoverable exception 700 at c000000000017050 =
(msr=3D9000000000021031)
[  550.570184] Oops: Unrecoverable exception, sig: 6 [#1]
[  550.570191] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA =
PowerNV
[  550.570200] Modules linked in: nft_ct nf_conntrack nf_defrag_ipv6 =
nf_defrag_ipv4 ip_set nf_tables rfkill libcrc32c nfnetlink i2c_dev =
rpcrdma sunrpc ib_umad rdma_ucm ib_srpt ib_isert iscsi_target_mod =
target_core_mod ib_ipoib ib_iser rdma_cm iw_cm libiscsi ib_cm =
scsi_transport_iscsi mlx5_ib ib_uverbs dm_mod ib_core ses enclosure =
tpm_i2c_nuvoton i2c_opal ipmi_powernv xts ipmi_devintf uio_pdrv_genirq =
vmx_crypto ipmi_msghandler i2c_core opal_prd uio ibmpowernv leds_powernv =
powernv_op_panel sch_fq_codel ip_tables ext4 mbcache jbd2 mlx5_core =
sd_mod t10_pi sg mpt3sas ipr tg3 libata mlxfw psample raid_class ptp =
scsi_transport_sas pps_core fuse
[  550.570313] CPU: 21 PID: 3784 Comm: NetworkManager Kdump: loaded =
Tainted: G        W         5.16.0-rc5-03218-g798527287598 #8
[  550.570326] NIP:  c000000000017050 LR: c000000000033240 CTR: =
c000000000cf1260
[  550.570335] REGS: c000000ae08bbab0 TRAP: 0700   Tainted: G        W   =
       (5.16.0-rc5-03218-g798527287598)
[  550.570346] MSR:  9000000000021031 <SF,HV,ME,IR,DR,LE>  CR: 28004444  =
XER: 20040000
[  550.570363] CFAR: c00000000001704c IRQMASK: 1
[  550.570363] GPR00: c000000000033240 c000000ae08bbd50 c000000002a10600 =
0000000000000000
[  550.570363] GPR04: c000000ae08bbe80 00007fffaea1ece0 0000000000000000 =
0000000000000000
[  550.570363] GPR08: 0000000000000002 0000000000000000 0000000000000002 =
0000000001f3fb0c
[  550.570363] GPR12: 0000000000004000 c000005fff7c9080 0000000000000000 =
0000000000000000
[  550.570363] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
[  550.570363] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
[  550.570363] GPR24: 0000000000000002 0000000000000001 0000000002002000 =
0000000002802000
[  550.570363] GPR28: 0000000000000000 0000000000000800 c000000ae08bbe80 =
0000000000040080
=E2=80=A6=E2=80=A6..

Not sure if the above problem is related to the previous one I reported
or a different one.

Thanks
-Sachin

