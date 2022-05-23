Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D37665309C2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 09:04:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L67c359zWz3bm4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 17:04:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HyMI8hIi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HyMI8hIi; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L67bK64nDz2ypf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 May 2022 17:03:41 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24N5An6J006309;
 Mon, 23 May 2022 07:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=fN5rcwKHMYcD1hSROG4JlEnSkuUCq2AX83oEc7dz2nM=;
 b=HyMI8hIiErnWupGnFmkl82wuXVi6RkgTxjWkKHwF6NO+MeUkqGxF5ShuqJ6aBdpWQu0v
 7gyWqYk1rPvkQ/uUo5zCFjIRv10wlY6bcYp9mB4S/3+49P4++8+ZPolr7eYDwssz2yBJ
 ZNXeoTYSAAJbIhcYSzb6IRwVLNNcTkirqYoqmzRvYSI3RgWFXTVYcj/lAKEeXByqENIF
 dggVpYeX4KV2qzU+5T4/IbMevGEa3T8dHZ40UJeK8xGmOxU9AETeNaA3Twx6sNt42W3a
 bMKHVpuhj0JaFWhweuJSD0MEnj5uBOTnhCF+Lb1pNzHDi7u//fMQBSDGGuHCC3mK9Tsv QA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g79rgwp3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 07:03:38 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24N6cFQZ010017;
 Mon, 23 May 2022 07:03:36 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 3g6qq8tkgr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 07:03:36 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24N73XUK34144718
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 May 2022 07:03:33 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69F764203F;
 Mon, 23 May 2022 07:03:33 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 917B042042;
 Mon, 23 May 2022 07:03:32 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.16.118])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 23 May 2022 07:03:32 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: [powerpc] linux-next 20220520 boot failure (drc_pmem_query_stats)
Message-Id: <6B3A522A-6A5F-4CC9-B268-0C63AA6E07D3@linux.ibm.com>
Date: Mon, 23 May 2022 12:33:31 +0530
To: linuxppc-dev@lists.ozlabs.org
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: C2G17f9uc5TNmcTgDjloczBiYg46O1rh
X-Proofpoint-GUID: C2G17f9uc5TNmcTgDjloczBiYg46O1rh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-23_02,2022-05-20_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 mlxlogscore=495 malwarescore=0 impostorscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205230037
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
Cc: vaibhav@linux.ibm.com, linux-next@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While booting linux-next (5.18.0-rc7-next-20220520) on a Power10 LPAR
configure with pmem following oops is seen. The LPAR fails to boot to
login prompt.

[   10.948211] papr_scm ibm,persistent-memory:ibm,pmemory@44104001: =
Permission denied while accessing performance stats
[   10.948536] Kernel attempted to write user page (1c) - exploit =
attempt? (uid: 0)
[   10.948539] BUG: Kernel NULL pointer dereference on write at =
0x0000001c
[   10.948540] Faulting instruction address: 0xc008000001b90844
[   10.948542] Oops: Kernel access of bad area, sig: 11 [#1]
[   10.948563] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA =
pSeries
[   10.948568] Modules linked in: papr_scm(E+) libnvdimm(E) =
vmx_crypto(E) ext4(E) mbcache(E) jbd2(E) sd_mod(E) t10_pi(E) =
crc64_rocksoft(E) crc64(E) sg(E) ibmvscsi(E) scsi_transport_srp(E) =
ibmveth(E) fuse(E)
[   10.948587] CPU: 25 PID: 796 Comm: systemd-udevd Tainted: G           =
 E     5.18.0-rc7-next-20220520 #2
[   10.948592] NIP:  c008000001b90844 LR: c008000001b92794 CTR: =
c008000001b907f8
[   10.948595] REGS: c00000003082b110 TRAP: 0300   Tainted: G            =
E      (5.18.0-rc7-next-20220520)
[   10.948600] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 44222822  XER: 00000001
[   10.948613] CFAR: c00000000007c744 DAR: 000000000000001c DSISR: =
42000000 IRQMASK: 0=20
[   10.948613] GPR00: c008000001b92794 c00000003082b3b0 c008000001bc8000 =
c00000000941bc00=20
[   10.948613] GPR04: 0000000000000010 0000000000000000 c000000016001800 =
c00000003082b420=20
[   10.948613] GPR08: 000000000000001c 0000000001000000 0000000053544154 =
c008000001b92c98=20
[   10.948613] GPR12: c008000001b907f8 c000000abfd02b00 c00000003082bd00 =
00000001372bd8b0=20
[   10.948613] GPR16: 000000000000ff20 c0080000008911b8 c008000000890000 =
00000000000011d0=20
[   10.948613] GPR20: 0000000000000001 c00000003082bbc0 c008000001bc0a88 =
0000000000000000=20
[   10.948613] GPR24: 0000000000000000 c000000002950e30 00000000ffffffff =
0000000000000010=20
[   10.948613] GPR28: c00000000941bc00 0000000000000010 0000000000000020 =
c00000000941bc00=20
[   10.948660] NIP [c008000001b90844] drc_pmem_query_stats+0x5c/0x270 =
[papr_scm]
[   10.948667] LR [c008000001b92794] papr_scm_probe+0x2ac/0x6ec =
[papr_scm]
[   10.948673] Call Trace:
[   10.948675] [c00000003082b3b0] [c00000000941bca0] 0xc00000000941bca0 =
(unreliable)
[   10.948680] [c00000003082b460] [c008000001b92794] =
papr_scm_probe+0x2ac/0x6ec [papr_scm]
[   10.948687] [c00000003082b550] [c0000000009809b8] =
platform_probe+0x98/0x150
[   10.948694] [c00000003082b5d0] [c00000000097bf2c] =
really_probe+0xfc/0x510
[   10.948699] [c00000003082b650] [c00000000097c4bc] =
__driver_probe_device+0x17c/0x230
[   10.948704] [c00000003082b6d0] [c00000000097c5c8] =
driver_probe_device+0x58/0x120
[   10.948709] [c00000003082b710] [c00000000097ce0c] =
__driver_attach+0xfc/0x230
[   10.948714] [c00000003082b790] [c000000000978458] =
bus_for_each_dev+0xa8/0x130
[   10.948718] [c00000003082b7f0] [c00000000097b2c4] =
driver_attach+0x34/0x50
[   10.948722] [c00000003082b810] [c00000000097a508] =
bus_add_driver+0x1e8/0x350
[   10.948729] [c00000003082b8a0] [c00000000097def8] =
driver_register+0x98/0x1a0
[   10.948736] [c00000003082b910] [c0000000009804a8] =
__platform_driver_register+0x38/0x50
[   10.948741] [c00000003082b930] [c008000001b92c10] =
papr_scm_init+0x3c/0x78 [papr_scm]
[   10.948747] [c00000003082b960] [c000000000011ff0] =
do_one_initcall+0x60/0x2d0
[   10.948753] [c00000003082ba30] [c00000000023627c] =
do_init_module+0x6c/0x2d0
[   10.948760] [c00000003082bab0] [c000000000239650] =
load_module+0x1e90/0x2290
[   10.948765] [c00000003082bc90] [c000000000239d9c] =
__do_sys_finit_module+0xdc/0x180
[   10.948771] [c00000003082bdb0] [c0000000000335fc] =
system_call_exception+0x17c/0x350
[   10.948777] [c00000003082be10] [c00000000000c53c] =
system_call_common+0xec/0x270
[   10.948782] --- interrupt: c00 at 0x7fffa3f2f1d4
[   10.948785] NIP:  00007fffa3f2f1d4 LR: 00007fffa456ea9c CTR: =
0000000000000000
[   10.948789] REGS: c00000003082be80 TRAP: 0c00   Tainted: G            =
E      (5.18.0-rc7-next-20220520)
[   10.948793] MSR:  800000000280f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 28222204  XER: 00000000
[   10.948805] IRQMASK: 0=20
[   10.948805] GPR00: 0000000000000161 00007fffd70550b0 00007fffa4007300 =
0000000000000011=20
[   10.948805] GPR04: 00007fffa457ad30 0000000000000000 0000000000000011 =
0000000000000000=20
[   10.948805] GPR08: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[   10.948805] GPR12: 0000000000000000 00007fffa4656580 0000000000020000 =
00000001372bd8b0=20
[   10.948805] GPR16: 0000000137300108 00000001372c5c68 0000000000000000 =
0000000000000000=20
[   10.948805] GPR20: 0000000000000000 00000001372c5ca0 000000016f049240 =
00007fffd70552d0=20
[   10.948805] GPR24: 0000000137300128 0000000000020000 0000000000000000 =
000000016f038a80=20
[   10.948805] GPR28: 00007fffa457ad30 0000000000020000 0000000000000000 =
000000016f049240=20
[   10.948849] NIP [00007fffa3f2f1d4] 0x7fffa3f2f1d4
[   10.948851] LR [00007fffa456ea9c] 0x7fffa456ea9c
[   10.948854] --- interrupt: c00
[   10.948856] Instruction dump:
[   10.948859] f8010010 f821ff51 e92d0c80 f9210088 39200000 41820118 =
3d405354 614a4154=20
[   10.948869] 2fa50000 3d200100 391d000c 3bc00020 <7ca0452c> 913d0008 =
794a07c6 654a534d=20
[   10.948878] ---[ end trace 0000000000000000 ]---
[   10.951576]=20
[   11.951579] Kernel panic - not syncing: Fatal exception

Following patch seems to be the cause for this regression.
commit 8b8fb1355917=20
    powerpc/papr_scm: Fix leaking nvdimm_events_map elements

Reverting this patch helps to boot the kernel.=20

This crash is only seen with following option disabled(profile) for the =
said LPAR
Enable Performance Information Collection

- Sachin=
