Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D684E7CDD2A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 15:25:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r0ojUtnL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9WnJ5R29z3cD7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 00:25:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r0ojUtnL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=tasmiya@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9WmP2vWlz3bVS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 00:24:52 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39IDA3xL002615;
	Wed, 18 Oct 2023 13:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : from : subject : to : cc : content-type :
 content-transfer-encoding; s=pp1;
 bh=i3pHYtqA1EYBkCpSAhwtuUNXDm3rtYnLznI8d1up1b0=;
 b=r0ojUtnLEJo7Vipyy+xl8OXohvmvDyu1PpN4mKcaOF/x+4gvx80NY717qP2SKtUqOxvN
 GIJxTpXaodjcd8lXa5XOYDbPxLvMuvayWnuQ3z04SzabjkF7qItHDWEatu/pci/kUPEC
 LWFfhb9jCAmFDn1CeXzqQ5j7iD1tU/ZIo4nMORse9Qi1rqAtL+XB/OhuHMlhAXojaS9L
 qvto34CBqUSih0g7J//b9vGYmCLPIEXvfwQSy3BrzBB6JPdCOdPKjkJccT31iLVgKUsI
 HgQIEeKnf26ZxfHsH1InZaGUMX3sL1tOede6GC96L6bH8wYeBh+O3+GPU9W04TGQB+YB rg== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ttg0pgjat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 13:24:43 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39ICSFQL012949;
	Wed, 18 Oct 2023 13:21:24 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tr5pygtnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 13:21:24 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39IDLNWJ28705484
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Oct 2023 13:21:24 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ACC5758055;
	Wed, 18 Oct 2023 13:21:23 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED2CD58043;
	Wed, 18 Oct 2023 13:21:18 +0000 (GMT)
Received: from [9.171.57.96] (unknown [9.171.57.96])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Oct 2023 13:21:18 +0000 (GMT)
Message-ID: <24a8559c-cd35-4828-9d1b-458d82e4f3ec@linux.vnet.ibm.com>
Date: Wed, 18 Oct 2023 18:51:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>
Subject: [Bisected] [efeda3bf912f] OOPS crash while performing Block device
 module parameter test [qla2xxx / FC]
To: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-block@vger.kernel.org,
        linux-next@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6KZW5X3-n2EYs9gdinBJ9K_PWKOk4oh8
X-Proofpoint-ORIG-GUID: 6KZW5X3-n2EYs9gdinBJ9K_PWKOk4oh8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-18_12,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 clxscore=1011
 mlxscore=0 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310180111
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
Cc: martin.petersen@oracle.com, abdhalee@linux.vnet.ibm.com, mputtash@linux.vnet.com, jejb@linux.ibm.com, himanshu.madhani@oracle.com, sachinp@linux.vnet.com, GR-QLogic-Storage-Upstream@marvell.com, njavali@marvell.com, qutran@marvell.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greetings,

OOPs Kernel crash while performing Block device module parameter test 
[qla2xxx / FC] on linux-next 6.6.0-rc5-next-20231010

--- Traces ---

[30876.431678] Kernel attempted to read user page (30) - exploit 
attempt? (uid: 0)
[30876.431687] BUG: Kernel NULL pointer dereference on read at 0x00000030
[30876.431692] Faulting instruction address: 0xc0080000018e3180
[30876.431697] Oops: Kernel access of bad area, sig: 11 [#1]
[30876.431700] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=8192 NUMA pSeries
[30876.431705] Modules linked in: qla2xxx(+) nvme_fc nvme_fabrics 
nvme_core dm_round_robin dm_queue_length exfat vfat fat btrfs 
blake2b_generic zstd_compress loop raid10 raid456 async_raid6_recov 
async_memcpy async_pq async_xor async_tx xor raid6_pq raid1 linear xfs 
libcrc32c raid0 nvram rpadlpar_io rpaphp xsk_diag bonding tls rfkill 
vmx_crypto pseries_rng binfmt_misc ext4 mbcache jbd2 dm_service_time 
sd_mod sg ibmvfc ibmveth t10_pi crc64_rocksoft crc64 scsi_transport_fc 
dm_multipath dm_mirror dm_region_hash dm_log dm_mod fuse [last unloaded: 
nvme_core]
[30876.431767] CPU: 0 PID: 1289400 Comm: kworker/0:2 Kdump: loaded Not 
tainted 6.6.0-rc5-next-20231010-auto #1
[30876.431773] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 
0xf000006 of:IBM,FW1030.30 (NH1030_062) hv:phyp pSeries
[30876.431779] Workqueue: events work_for_cpu_fn
[30876.431788] NIP:  c0080000018e3180 LR: c0080000018e3128 CTR: 
c000000000513f80
[30876.431792] REGS: c000000062a8b930 TRAP: 0300   Not tainted 
(6.6.0-rc5-next-20231010-auto)
[30876.431797] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  
CR: 28000482  XER: 2004000f
[30876.431811] CFAR: c0080000018e3138 DAR: 0000000000000030 DSISR: 
40000000 IRQMASK: 0
[30876.431811] GPR00: c0080000018e3128 c000000062a8bbd0 c008000000eb8300 
0000000000000000
[30876.431811] GPR04: 0000000000000000 0000000000000000 0000000000000000 
000000000017bbac
[30876.431811] GPR08: 0000000000000000 0000000000000030 0000000000000000 
c0080000019a6d68
[30876.431811] GPR12: 0000000000000000 c000000002ff0000 c00000000019cb98 
c000000082a97980
[30876.431811] GPR16: 0000000000000000 0000000000000000 0000000000000000 
c000000003071ab0
[30876.431811] GPR20: c000000003491c0d c000000063bb9a00 c000000063bb30c0 
c0000001d8b52928
[30876.431811] GPR24: c008000000eb63a8 ffffffffffffffed c0000001d8b52000 
0000000000000102
[30876.431811] GPR28: c008000000ebaf00 c0000001d8b52890 0000000000000000 
c0000001d8b58000
[30876.431856] NIP [c0080000018e3180] qla2x00_mem_free+0x298/0x6b0 [qla2xxx]
[30876.431876] LR [c0080000018e3128] qla2x00_mem_free+0x240/0x6b0 [qla2xxx]
[30876.431895] Call Trace:
[30876.431897] [c000000062a8bbd0] [c0080000018e2f1c] 
qla2x00_mem_free+0x34/0x6b0 [qla2xxx] (unreliable)
[30876.431917] [c000000062a8bc20] [c0080000018eed30] 
qla2x00_probe_one+0x16d8/0x2640 [qla2xxx]
[30876.431937] [c000000062a8bd90] [c0000000008c589c] 
local_pci_probe+0x6c/0x110
[30876.431943] [c000000062a8be10] [c000000000189ba8] 
work_for_cpu_fn+0x38/0x60
[30876.431948] [c000000062a8be40] [c00000000018d0d0] 
process_scheduled_works+0x230/0x4f0
[30876.431952] [c000000062a8bf10] [c00000000018fe14] 
worker_thread+0x1e4/0x500
[30876.431955] [c000000062a8bf90] [c00000000019ccc8] kthread+0x138/0x140
[30876.431960] [c000000062a8bfe0] [c00000000000df98] 
start_kernel_thread+0x14/0x18
[30876.431965] Code: 4082000c a09f0198 78841b68 e8df0278 38e00000 
480c3b8d e8410018 39200000 e91f0178 f93f0280 f93f0278 39280030 
<e9480030> 7fa95040 419e00b8 ebc80030
[30876.431977] ---[ end trace 0000000000000000 ]---
[30876.480385] pstore: backend (nvram) writing error (-1)


Git bisect points to below commit. Reverting this commit fixes the problem.
commit efeda3bf912f269bcae16816683f432f58d68075
     scsi: qla2xxx: Move resource to allow code reuse

-- 
Regards,
Tasmiya Nalatwad
IBM Linux Technology Center

