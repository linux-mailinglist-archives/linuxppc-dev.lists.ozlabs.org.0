Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F0739CF36
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 14:59:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fyc5V0Fmvz3bTX
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 22:59:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ekd2g+EM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ekd2g+EM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fyc4y1YZJz2yxS
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jun 2021 22:58:41 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 156CXsHW120146; Sun, 6 Jun 2021 08:58:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : content-type :
 subject : message-id : date : cc : to : content-transfer-encoding :
 mime-version; s=pp1; bh=YaItj7tFm7WJhxoBPqUU0TF/tFGrjN2tvV7KV5nSnJI=;
 b=ekd2g+EMEhebGIdOfQH54BhuioCEcJNkh1AveqrRZmxvsnA0nIe73GIYvTaNCgtXhrGV
 sCcg8UU2ymNVTOHC/sPEFXRhAjEi48PIY8l12BDEplwM6kASmdqaU7ZHngDnHVuZ1IRv
 xWMcbozd9tYMKrjb4yrDG6OskO8Mcuo5hFNmzKwTboDzRjrv29bAyKLnYe3S27QQF75S
 nHb2IWf8XjHmykvByI/nnXR1Ur09OpqqAJHuOcbszayOrw+VHharW700hvVtiNl8KLpN
 sOE9wTDAYdgnNVd3cLjyiko9vykhbFxl7ya+dxehMBVjRUfj5HgQ3DDjndBrATNdoHx3 pA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 390vhasys3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 06 Jun 2021 08:58:28 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 156CswNC002232;
 Sun, 6 Jun 2021 12:58:26 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3900w8gecc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 06 Jun 2021 12:58:26 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 156CvhA134406700
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 6 Jun 2021 12:57:43 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88E454C040;
 Sun,  6 Jun 2021 12:58:24 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C02B24C044;
 Sun,  6 Jun 2021 12:58:23 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.77.193.230])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun,  6 Jun 2021 12:58:23 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Subject: [powerpc]next-20210604 - Kernel crash while running pmem tests
Message-Id: <DFB75BA8-603F-4A35-880B-C5B23EF8FA7D@linux.vnet.ibm.com>
Date: Sun, 6 Jun 2021 18:28:22 +0530
To: nvdimm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
X-Mailer: Apple Mail (2.3654.80.0.2.43)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SnG6ZVVsi88SWAAzjsJi2xuoua4pbk7S
X-Proofpoint-GUID: SnG6ZVVsi88SWAAzjsJi2xuoua4pbk7S
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-06_07:2021-06-04,
 2021-06-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106060104
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
Cc: linux-next@vger.kernel.org, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Running pmem tests [1] against latest next tree booted on powerpc
results into following crash

[ 1307.124289] Kernel attempted to read user page (330) - exploit attempt? =
(uid: 0)
[ 1307.124319] BUG: Kernel NULL pointer dereference on read at 0x00000330
[ 1307.124328] Faulting instruction address: 0xc000000000906344
[ 1307.124336] Oops: Kernel access of bad area, sig: 11 [#1]
[ 1307.124343] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA pSeri=
es
[ 1307.124353] Modules linked in: rpadlpar_io rpaphp dm_mod bonding rfkill =
sunrpc pseries_rng papr_scm uio_pdrv_genirq uio sch_fq_codel ip_tables sd_m=
od t10_pi sg ibmvscsi scsi_transport_srp ibmveth fuse
[ 1307.124392] CPU: 14 PID: 23553 Comm: lt-ndctl Not tainted 5.13.0-rc4-nex=
t-20210604 #1
[ 1307.124403] NIP:  c000000000906344 LR: c0000000004701d4 CTR: c0000000009=
06320
[ 1307.124411] REGS: c000000022cbb720 TRAP: 0300   Not tainted  (5.13.0-rc4=
-next-20210604)
[ 1307.124420] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR=
: 48048288  XER: 20040000
[ 1307.124441] CFAR: c0000000004701d0 DAR: 0000000000000330 DSISR: 40000000=
 IRQMASK: 0=20
[ 1307.124441] GPR00: c0000000004701d4 c000000022cbb9c0 c000000001b39100 c0=
000000220e16a0=20
[ 1307.124441] GPR04: c00000009483a300 c00000009483a300 0000000028048282 c0=
0000000001dd30=20
[ 1307.124441] GPR08: 0000000000000001 0000000000000000 0000000000000001 c0=
00000001b7e060=20
[ 1307.124441] GPR12: c000000000906320 c00000167fa21a80 fffffffffffffffa 00=
00000010050f6c=20
[ 1307.124441] GPR16: 0000000010050e88 00007fffc289f87b 00007fffc289a850 00=
007fffc289a6b8=20
[ 1307.124441] GPR20: 0000000000000003 0000000010033600 0000000010050f6a 00=
00000000000000=20
[ 1307.124441] GPR24: 0000000000000000 c0000000268cf810 c00000000bcb2660 c0=
000000220e1728=20
[ 1307.124441] GPR28: 0000000000000001 c000000001bf1978 c0000000220e16a0 00=
000000040f1000=20
[ 1307.124537] NIP [c000000000906344] pmem_pagemap_cleanup+0x24/0x40
[ 1307.124550] LR [c0000000004701d4] memunmap_pages+0x1b4/0x4b0
[ 1307.124560] Call Trace:
[ 1307.124564] [c000000022cbb9c0] [c0000000009063c8] pmem_pagemap_kill+0x28=
/0x40 (unreliable)
[ 1307.124576] [c000000022cbb9e0] [c0000000004701d4] memunmap_pages+0x1b4/0=
x4b0
[ 1307.124586] [c000000022cbba90] [c0000000008b28a0] devm_action_release+0x=
30/0x50
[ 1307.124597] [c000000022cbbab0] [c0000000008b39c8] release_nodes+0x2f8/0x=
3e0
[ 1307.124607] [c000000022cbbb60] [c0000000008ac440] device_release_driver_=
internal+0x190/0x2b0
[ 1307.124619] [c000000022cbbba0] [c0000000008a8450] unbind_store+0x130/0x1=
70
[ 1307.124629] [c000000022cbbbe0] [c0000000008a75b4] drv_attr_store+0x44/0x=
60
[ 1307.124638] [c000000022cbbc00] [c000000000594a08] sysfs_kf_write+0x68/0x=
80
[ 1307.124648] [c000000022cbbc20] [c0000000005930e0] kernfs_fop_write_iter+=
0x1a0/0x290
[ 1307.124657] [c000000022cbbc70] [c00000000047830c] new_sync_write+0x14c/0=
x1d0
[ 1307.124666] [c000000022cbbd10] [c00000000047b8d4] vfs_write+0x224/0x330
[ 1307.124675] [c000000022cbbd60] [c00000000047bbbc] ksys_write+0x7c/0x140
[ 1307.124683] [c000000022cbbdb0] [c00000000002ecd0] system_call_exception+=
0x150/0x2d0
[ 1307.124694] [c000000022cbbe10] [c00000000000d45c] system_call_common+0xe=
c/0x278
[ 1307.124703] --- interrupt: c00 at 0x7fffa26cbd74
[ 1307.124710] NIP:  00007fffa26cbd74 LR: 00007fffa28bb6bc CTR: 00000000000=
00000
[ 1307.124717] REGS: c000000022cbbe80 TRAP: 0c00   Not tainted  (5.13.0-rc4=
-next-20210604)
[ 1307.124726] MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE> =
 CR: 24048402  XER: 00000000
[ 1307.124746] IRQMASK: 0=20
[ 1307.124746] GPR00: 0000000000000004 00007fffc289a180 00007fffa27c7100 00=
00000000000004=20
[ 1307.124746] GPR04: 0000000047d24c4c 0000000000000007 0000000000000000 00=
007fffa28dd1d8=20
[ 1307.124746] GPR08: 0000000000000000 0000000000000000 0000000000000000 00=
00000000000000=20
[ 1307.124746] GPR12: 0000000000000000 00007fffa29a2560 fffffffffffffffa 00=
00000010050f6c=20
[ 1307.124746] GPR16: 0000000010050e88 00007fffc289f87b 00007fffc289a850 00=
007fffc289a6b8=20
[ 1307.124746] GPR20: 0000000000000003 0000000010033600 0000000010050f6a 00=
00000000000000=20
[ 1307.124746] GPR24: 0000000010050e60 0000000047d28340 00000000100314e8 00=
00000000000000=20
[ 1307.124746] GPR28: 00007fffa299b5c8 0000000000000004 0000000000000007 00=
00000047d24c4c=20
[ 1307.124831] NIP [00007fffa26cbd74] 0x7fffa26cbd74
[ 1307.124838] LR [00007fffa28bb6bc] 0x7fffa28bb6bc
[ 1307.124844] --- interrupt: c00
[ 1307.124848] Instruction dump:
[ 1307.124854] 7c0803a6 4e800020 60000000 3c4c0123 38422de0 7c0802a6 600000=
00 7c0802a6=20
[ 1307.124870] f8010010 f821ffe1 e9230030 e9290088 <e8690330> 4bddbb01 6000=
0000 38210020=20
[ 1307.124886] ---[ end trace 9881d6f8c705bac2 ]=E2=80=94

next-20210601 was good.=20

The code in question pmem_pagemap_cleanup was last changed by
commit 87eb73b2ca7
nvdimm-pmem: convert to blk_alloc_disk/blk_cleanup_disk

static void pmem_pagemap_cleanup(struct dev_pagemap *pgmap)
{
        struct request_queue *q =3D
                container_of(pgmap->ref, struct request_queue, q_usage_coun=
ter);

        blk_cleanup_disk(queue_to_disk(q));  <<=3D=3D=3D=3D
}

Thanks
-Sachin

[1] https://github.com/avocado-framework-tests/avocado-misc-tests/blob/mast=
er/memory/ndctl.py

