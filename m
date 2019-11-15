Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBEDFD699
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 07:54:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Dpx66YD3zF7gP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 17:54:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Dnsk5Dt6zDrP9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 17:06:11 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAF5xMNb040837
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 01:06:07 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w9nux1dn1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 01:06:07 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Fri, 15 Nov 2019 06:06:05 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 15 Nov 2019 06:06:03 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAF661AF46137486
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Nov 2019 06:06:01 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB088AE051;
 Fri, 15 Nov 2019 06:06:01 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AAA8AE053;
 Fri, 15 Nov 2019 06:06:01 +0000 (GMT)
Received: from [9.199.197.198] (unknown [9.199.197.198])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 15 Nov 2019 06:06:00 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: [-merge] BUG followed by oops running ndctl tests
Date: Fri, 15 Nov 2019 11:36:00 +0530
To: linuxppc-dev@lists.ozlabs.org
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 19111506-4275-0000-0000-0000037DE4E8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111506-4276-0000-0000-000038914D41
Message-Id: <B0EBF64C-3B57-4716-BAAF-CBC4CBDF5FBC@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-14_07:2019-11-14,2019-11-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 phishscore=0 mlxscore=0 malwarescore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=650 impostorscore=0 suspectscore=1
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911150054
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
Cc: harish@linux.ibm.com, "Aneesh Kumar K. V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Following Oops is seen on latest (commit 3b4852888d) powerpc merge =
branch
code while running ndctl (test_namespace) tests

85c5b0984e was good.

 (06/12) avocado-misc-tests/memory/ndctl.py:NdctlTest.test_namespace:  [ =
 213.570536] memmap_init_zone_device initialised 1636608 pages in 10ms
[  213.570835] pmem0: detected capacity change from 0 to 107256741888
[  216.488983] BUG: Unable to handle kernel data access at =
0xc000043900000000
[  216.488996] Faulting instruction address: 0xc000000000087510
[  216.489002] Oops: Kernel access of bad area, sig: 11 [#1]
[  216.489007] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA =
pSeries
[  216.489019] Dumping ftrace buffer:
[  216.489029]    (ftrace buffer empty)
[  216.489033] Modules linked in: dm_mod nf_conntrack nf_defrag_ipv6 =
nf_defrag_ipv4 libcrc32c ip6_tables nft_compat ip_set nf_tables =
nfnetlink sunrpc sg pseries_rng papr_scm uio_pdrv_genirq uio =
sch_fq_codel ip_tables sd_mod ibmvscsi ibmveth scsi_transport_srp
[  216.489059] CPU: 8 PID: 17523 Comm: lt-ndctl Not tainted =
5.4.0-rc7-autotest #1
[  216.489065] NIP:  c000000000087510 LR: c00000000008752c CTR: =
01ffffffce800000
[  216.489071] REGS: c000007ca84a37d0 TRAP: 0300   Not tainted  =
(5.4.0-rc7-autotest)
[  216.489076] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 42048224  XER: 00000000
[  216.489086] CFAR: c000000000087518 DAR: c000043900000000 DSISR: =
40000000 IRQMASK: 0=20
[  216.489086] GPR00: c00000000008752c c000007ca84a3a60 c00000000159bb00 =
0000000000000000=20
[  216.489086] GPR04: 40066bdea7010e15 0000605530000194 0000000000000000 =
0000000000000080=20
[  216.489086] GPR08: c000043900000000 ffffffffc000007f 01ffffffff800000 =
0000000000000000=20
[  216.489086] GPR12: 0000000000008000 c00000001ec5d200 00007ffff897f9e9 =
000000001002e088=20
[  216.489086] GPR16: 0000000000000000 0000000010050d88 000000001002f778 =
000000001002f770=20
[  216.489086] GPR20: 0000000000000000 000000001002e048 0000000010050e3d =
0000000010050e40=20
[  216.489086] GPR24: 0000000000000000 c000007c8d0a6c10 c000007cced28a20 =
c000000001463048=20
[  216.489086] GPR28: c000042080000000 c000042040000000 c000043900000000 =
c000042000000000=20
[  216.489137] NIP [c000000000087510] arch_remove_memory+0x100/0x1b0
[  216.489143] LR [c00000000008752c] arch_remove_memory+0x11c/0x1b0
[  216.489148] Call Trace:
[  216.489151] [c000007ca84a3a60] [c00000000008752c] =
arch_remove_memory+0x11c/0x1b0 (unreliable)
[  216.489159] [c000007ca84a3b00] [c000000000407258] =
memunmap_pages+0x188/0x2c0
[  216.489167] [c000007ca84a3b80] [c0000000007b0810] =
devm_action_release+0x30/0x50
[  216.489174] [c000007ca84a3ba0] [c0000000007b18f8] =
release_nodes+0x2f8/0x3e0
[  216.489180] [c000007ca84a3c50] [c0000000007aa698] =
device_release_driver_internal+0x168/0x270
[  216.489187] [c000007ca84a3c90] [c0000000007a6ad0] =
unbind_store+0x130/0x170
[  216.489193] [c000007ca84a3cd0] [c0000000007a5c34] =
drv_attr_store+0x44/0x60
[  216.489200] [c000007ca84a3cf0] [c0000000004fa0d8] =
sysfs_kf_write+0x68/0x80
[  216.489205] [c000007ca84a3d10] [c0000000004f9530] =
kernfs_fop_write+0xf0/0x270
[  216.489212] [c000007ca84a3d60] [c00000000040cbdc] =
__vfs_write+0x3c/0x70
[  216.489217] [c000007ca84a3d80] [c00000000041052c] =
vfs_write+0xcc/0x240
[  216.489223] [c000007ca84a3dd0] [c00000000041090c] =
ksys_write+0x7c/0x140
[  216.489229] [c000007ca84a3e20] [c00000000000b278] =
system_call+0x5c/0x68
[  216.489233] Instruction dump:
[  216.489238] 80fb0008 815b000c 7d0700d0 7d08e038 7c0004ac 4c00012c =
3927ffff 7d29ea14=20
[  216.489245] 7d284850 7d2a5437 41820014 7d4903a6 <7c0040ac> 7d083a14 =
4200fff8 7c0004ac=20
[  216.489254] ---[ end trace d9a4dfc9e158858a ]=E2=80=94

Thanks
-Sachin=

