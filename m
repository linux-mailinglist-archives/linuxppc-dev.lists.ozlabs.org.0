Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A0619055F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 06:57:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mgWL0VMQzDqty
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 16:57:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mgTN5vCjzDqT6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 16:55:36 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02O5WRwj011053
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 01:55:33 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ywf2gjp48-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 01:55:33 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Tue, 24 Mar 2020 05:55:29 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 24 Mar 2020 05:55:27 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02O5tQ0D39059534
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Mar 2020 05:55:26 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB800A4054;
 Tue, 24 Mar 2020 05:55:26 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D39F0A405B;
 Tue, 24 Mar 2020 05:55:25 +0000 (GMT)
Received: from [9.199.50.248] (unknown [9.199.50.248])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 24 Mar 2020 05:55:25 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: [5.6.0-rc7] Kernel crash while running ndctl tests
Date: Tue, 24 Mar 2020 11:25:24 +0530
To: LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 20032405-0028-0000-0000-000003EA5D76
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032405-0029-0000-0000-000024AFC5E6
Message-Id: <CF20E440-4DCB-4EFD-88B6-0AB98DC7FBD4@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-23_10:2020-03-23,
 2020-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 mlxlogscore=930 clxscore=1015 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003240025
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
Cc: Baoquan He <bhe@redhat.com>, linux-nvdimm@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While running ndctl[1] tests against 5.6.0-rc7 following crash is =
encountered.

Bisect leads me to  commit d41e2f3bd546=20
mm/hotplug: fix hot remove failure in SPARSEMEM|!VMEMMAP case

Reverting this commit helps and the tests complete without any crash.

pmem0: detected capacity change from 0 to 10720641024
BUG: Kernel NULL pointer dereference on read at 0x00000000
Faulting instruction address: 0xc000000000c3447c
Oops: Kernel access of bad area, sig: 11 [#1]
LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA pSeries
Dumping ftrace buffer:
   (ftrace buffer empty)
Modules linked in: dm_mod nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 =
libcrc32c ip6_tables nft_compat ip_set rfkill nf_tables nfnetlink sunrpc =
sg pseries_rng papr_scm uio_pdrv_genirq uio sch_fq_codel ip_tables =
sd_mod t10_pi ibmvscsi scsi_transport_srp ibmveth
CPU: 11 PID: 7519 Comm: lt-ndctl Not tainted 5.6.0-rc7-autotest #1
NIP:  c000000000c3447c LR: c000000000088354 CTR: c00000000018e990
REGS: c0000006223fb630 TRAP: 0300   Not tainted  (5.6.0-rc7-autotest)
MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24048888  =
XER: 00000000
CFAR: c00000000000dec4 DAR: 0000000000000000 DSISR: 40000000 IRQMASK: 0=20=

GPR00: c0000000003c5820 c0000006223fb8c0 c000000001684900 =
0000000004000000=20
GPR04: c00c000101000000 0000000007ffffff c00000067ff20900 =
c00c000000000000=20
GPR08: 0000000000000000 c00c000100000000 0000000000000000 =
c000000003f00000=20
GPR12: 0000000000008000 c00000001ec70200 00007fffc102f9e8 =
000000001002e088=20
GPR16: 0000000000000000 0000000010050d88 000000001002f778 =
000000001002f770=20
GPR20: 0000000000000000 0000000000000100 0000000000000001 =
0000000000001000=20
GPR24: 0000000000000008 0000000000000000 0000000004000000 =
c00c000100004000=20
GPR28: c000000003101aa0 c00c000100000000 0000000001000000 =
0000000004000100=20
NIP [c000000000c3447c] vmemmap_populated+0x98/0xc0
LR [c000000000088354] vmemmap_free+0x144/0x320
Call Trace:
[c0000006223fb8c0] [c0000006223fb960] 0xc0000006223fb960 (unreliable)
[c0000006223fb980] [c0000000003c5820] section_deactivate+0x220/0x240
[c0000006223fba30] [c0000000003dc1d8] __remove_pages+0x118/0x170
[c0000006223fba80] [c000000000086e5c] arch_remove_memory+0x3c/0x150
[c0000006223fbb00] [c00000000041a3bc] memunmap_pages+0x1cc/0x2f0
[c0000006223fbb80] [c0000000007d6d00] devm_action_release+0x30/0x50
[c0000006223fbba0] [c0000000007d7de8] release_nodes+0x2f8/0x3e0
[c0000006223fbc50] [c0000000007d0b38] =
device_release_driver_internal+0x168/0x270
[c0000006223fbc90] [c0000000007ccf50] unbind_store+0x130/0x170
[c0000006223fbcd0] [c0000000007cc0b4] drv_attr_store+0x44/0x60
[c0000006223fbcf0] [c00000000051fdb8] sysfs_kf_write+0x68/0x80
[c0000006223fbd10] [c00000000051f200] kernfs_fop_write+0x100/0x290
[c0000006223fbd60] [c00000000042037c] __vfs_write+0x3c/0x70
[c0000006223fbd80] [c00000000042404c] vfs_write+0xcc/0x240
[c0000006223fbdd0] [c00000000042442c] ksys_write+0x7c/0x140
[c0000006223fbe20] [c00000000000b278] system_call+0x5c/0x68
Instruction dump:
2ea80000 4196003c 794a2428 7d685215 41820030 7d48502a 71480002 41820024=20=

714a0008 4082002c e90b0008 786adf62 <e8680000> 7c635436 70630001 =
4c820020=20
---[ end trace 579b48162da1b890 ]=E2=80=94

Thanks
-Sachin

[1] =
https://github.com/avocado-framework-tests/avocado-misc-tests/blob/master/=
memory/ndctl.py=

