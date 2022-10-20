Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD26960567F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 06:56:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtFg64Zr6z3c4K
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 15:56:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oWZtkbtG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oWZtkbtG;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtFf74RGVz2y28
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Oct 2022 15:55:26 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29K3bo8K023843
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Oct 2022 04:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=Z1+dPq7uc4Pwhyov5maktvwtiKpnVTV/SJ4cux9VGvE=;
 b=oWZtkbtGHpcmn50UC/06Gx1hYhbvVlZ4LukwFDSi5JAvuW3tWRvJW7t2L5RSXaQVzzWl
 snmLenRwOU2k9YlveMr+1PtETAzFaMg5R/WYvGiSh3nSIS/W8wt64oEVxp8PUAQphEzf
 wwZK3G+9A6BzbaEPa9F4BRYd0Jc1hyC5FWQvntWkZQ4YfI+lYBYBIhFkfqKtrg7DkM1B
 e5uYLNqXiokpjYqGpnXBkjq6m3OabOHszQq3JPXMqYerwfUGig2laKEvcfpwn4AnTjiC
 v6sfstD7m3X0Mc4osS+gwlZNqeQW4qfLflP3aXy3cqXHxm0yhEci4fSH8Prf1rHv1l65 SA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kaswqr6mr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Oct 2022 04:55:22 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29K4rnXA009493
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Oct 2022 04:55:22 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kaswqr6m7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Oct 2022 04:55:22 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29K4phPr020330;
	Thu, 20 Oct 2022 04:55:20 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma06fra.de.ibm.com with ESMTP id 3k7m4je7gw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Oct 2022 04:55:20 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29K4tIFv51511748
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Oct 2022 04:55:18 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3CB2442041;
	Thu, 20 Oct 2022 04:55:18 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A254A4203F;
	Thu, 20 Oct 2022 04:55:17 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.241.54])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 20 Oct 2022 04:55:17 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: [6.1-rc1] Warning arch/powerpc/kernel/irq_64.c:285
Message-Id: <CE857624-4CCA-480F-9FB9-FAD09285D14D@linux.ibm.com>
Date: Thu, 20 Oct 2022 10:25:16 +0530
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ODcdAftq65oEt7t-xTgXvYzLUEYVwpxO
X-Proofpoint-ORIG-GUID: RvmRDuYFW_X1iI3JfIctkiVVXhRIahe5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-20_01,2022-10-19_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 mlxlogscore=736 priorityscore=1501 phishscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210200025
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

While running powerpc kselftests (mm/stress_code_patching.sh)
on a PowerVM LPAR following warning is seen. The test passes.
I can reliably recreate it on a Power9 server, not so easily on
Power10.

# ./stress_code_patching.sh=20
Testing for spurious faults when mapping kernel memory...
[  175.289418] ------------[ cut here ]------------
[  175.289434] WARNING: CPU: 11 PID: 5436 at =
arch/powerpc/kernel/irq_64.c:285 arch_local_irq_restore+0x230/0x260
[  175.289450] Modules linked in: dm_mod(E) nft_fib_inet(E) =
nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) =
nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E) =
nft_chain_nat(E) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) =
nf_defrag_ipv4(E) bonding(E) tls(E) ip_set(E) rfkill(E) nf_tables(E) =
libcrc32c(E) nfnetlink(E) sunrpc(E) pseries_rng(E) vmx_crypto(E) ext4(E) =
mbcache(E) jbd2(E) sd_mod(E) t10_pi(E) crc64_rocksoft(E) crc64(E) sg(E) =
ibmvscsi(E) scsi_transport_srp(E) ibmveth(E) ipmi_devintf(E) =
ipmi_msghandler(E) fuse(E)
[  175.289582] CPU: 11 PID: 5436 Comm: stress_code_pat Tainted: G        =
    E      6.1.0-rc1-00025-gaae703b02f92 #1
[  175.289591] Hardware name: IBM,8375-42A POWER9 (raw) 0x4e0202 =
0xf000005 of:IBM,FW950.50 (VL950_105) hv:phyp pSeries
[  175.289599] NIP:  c00000000003e9a0 LR: c0000000000b16dc CTR: =
000000000000a6a4
[  175.289607] REGS: c0000000297b35f0 TRAP: 0700   Tainted: G            =
E       (6.1.0-rc1-00025-gaae703b02f92)
[  175.289616] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 48222224  XER: 00000000
[  175.289654] CFAR: c00000000003e7f4 IRQMASK: 1=20
[  175.289654] GPR00: c0000000000b179c c0000000297b3890 c00000000135e900 =
0000000000000000=20
[  175.289654] GPR04: 0000000000000000 0000201760241794 0000000000000000 =
4009287a77000005=20
[  175.289654] GPR08: 0000000000000000 0000000000008000 c00000000ac27d80 =
0000000000000040=20
[  175.289654] GPR12: 0000000000002000 c00000001ec52700 0000000040000000 =
0000000101239798=20
[  175.289654] GPR16: 0000000101239724 00000001011d8128 0000000101170370 =
000000010123d568=20
[  175.289654] GPR20: 000001002f8f5490 0000000000000001 00000001011eaf18 =
00007fffc1696ab4=20
[  175.289654] GPR24: 00007fffc1696ab0 0000000000000000 c008000000180000 =
000000004be3bca9=20
[  175.289654] GPR28: c000000002a590a0 0000000000000000 0000000000000000 =
c0000000035010c0=20
[  175.289787] NIP [c00000000003e9a0] arch_local_irq_restore+0x230/0x260
[  175.289796] LR [c0000000000b16dc] patch_instruction+0x26c/0x340
[  175.289805] Call Trace:
[  175.289810] [c0000000297b3890] [c000000002a590a0] init_mm+0x0/0x5c0 =
(unreliable)
[  175.289824] [c0000000297b38c0] [c0000000000b179c] =
patch_instruction+0x32c/0x340
[  175.289835] [c0000000297b3910] [c00000000007ef40] =
ftrace_make_call+0x220/0x4b0
[  175.289846] [c0000000297b39a0] [c0000000002e00a8] =
__ftrace_replace_code+0x138/0x140
[  175.289858] [c0000000297b39f0] [c0000000002e0678] =
ftrace_replace_code+0xa8/0x140
[  175.289869] [c0000000297b3a40] [c0000000002e095c] =
ftrace_modify_all_code+0x11c/0x240
[  175.289880] [c0000000297b3a70] [c00000000007f918] =
arch_ftrace_update_code+0x18/0x30
[  175.289891] [c0000000297b3a90] [c0000000002e0bc8] =
ftrace_startup_enable+0x68/0xa0
[  175.289902] [c0000000297b3ac0] [c0000000002e6618] =
ftrace_startup+0xf8/0x1c0
[  175.289913] [c0000000297b3b00] [c0000000002e672c] =
register_ftrace_function+0x4c/0xc0
[  175.289924] [c0000000297b3b30] [c00000000030c908] =
function_trace_init+0x88/0x100
[  175.289936] [c0000000297b3b60] [c00000000030079c] =
tracing_set_tracer+0x2ac/0x540
[  175.289946] [c0000000297b3c00] [c000000000300ad4] =
tracing_set_trace_write+0xa4/0x110
[  175.289957] [c0000000297b3cc0] [c000000000553a00] =
vfs_write+0x100/0x460
[  175.289968] [c0000000297b3d80] [c000000000553f3c] =
ksys_write+0x7c/0x140
[  175.289979] [c0000000297b3dd0] [c000000000035160] =
system_call_exception+0x140/0x350
[  175.289990] [c0000000297b3e10] [c00000000000c654] =
system_call_common+0xf4/0x278
[  175.290002] --- interrupt: c00 at 0x7fff83c50c34
[  175.290009] NIP:  00007fff83c50c34 LR: 00007fff83bc7c74 CTR: =
0000000000000000
[  175.290016] REGS: c0000000297b3e80 TRAP: 0c00   Tainted: G            =
E       (6.1.0-rc1-00025-gaae703b02f92)
[  175.290025] MSR:  800000000280f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 28222222  XER: 00000000
[  175.290065] IRQMASK: 0=20
[  175.290065] GPR00: 0000000000000004 00007fffc1696890 00007fff83d37300 =
0000000000000001=20
[  175.290065] GPR04: 000001002f8f2bb0 0000000000000009 0000000000000010 =
000000006e6f6974=20
[  175.290065] GPR08: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[  175.290065] GPR12: 0000000000000000 00007fff83e6ae60 0000000040000000 =
0000000101239798=20
[  175.290065] GPR16: 0000000101239724 00000001011d8128 0000000101170370 =
000000010123d568=20
[  175.290065] GPR20: 000001002f8f5490 0000000000000001 00000001011eaf18 =
00007fffc1696ab4=20
[  175.290065] GPR24: 00007fffc1696ab0 000000010123af94 0000000000000009 =
000001002f8f2bb0=20
[  175.290065] GPR28: 0000000000000009 00007fff83d31798 000001002f8f2bb0 =
0000000000000009=20
[  175.290194] NIP [00007fff83c50c34] 0x7fff83c50c34
[  175.290201] LR [00007fff83bc7c74] 0x7fff83bc7c74
[  175.290208] --- interrupt: c00
[  175.290213] Instruction dump:
[  175.290220] 0fe00000 4bfffff0 60000000 60000000 ebe10028 4bfffa95 =
4bfffed4 60000000=20
[  175.290248] 0fe00000 4bffffd0 60000000 60000000 <0fe00000> 4bffffc0 =
60000000 60000000=20
[  175.290275] ---[ end trace 0000000000000000 ]---
OK: Mapping kernel memory does not cause spurious faults

6.0.0 was good. Git bisect points to following

commit a4cb3651a174366cc85a677da9e3681fbe97fdae
Date:   Thu Oct 13 16:44:18 2022 +1000
    powerpc/64s/interrupt: Fix lost interrupts when returning to =
soft-masked context

- Sachin=
