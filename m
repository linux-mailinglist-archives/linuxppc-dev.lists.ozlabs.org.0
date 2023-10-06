Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E88EC7BB2AC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 09:51:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ma6iwX/G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S20xW58Y2z3vXB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 18:51:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ma6iwX/G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=tasmiya@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S20wZ6pXqz30f8
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Oct 2023 18:50:54 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3967i5Tt000861;
	Fri, 6 Oct 2023 07:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=pp1;
 bh=9BB2cu1N6Jk+79F9w3sV0qQ+sVNDUW3RyPD71PeD5/Q=;
 b=ma6iwX/GxRNBz0ZBmYkElN3tIsuDzP3l7vw4fsobRB/HKdwx8PAPJoeHmy7MrjkmiG1o
 zqyZajkGAVIU9PwYQNA3JjDHey7vx1Y6LVNSOQLrCn+35fY+7Pd/JCfc9T/jLKJbz8Fe
 BJC5c9V3/Q13bkMIR4GWaWeYKjTMtlWVfqvQLBqcgXxy5nlL43zuyXSHMl7mgd3wyDXg
 5dXv0HhzGi/i8wHDI1Tw8gZXqUrqR6pMfRHkSwbl703GLyw7RowQhAq5WFAdJUMQAmD9
 e/wdKNr4ILvOoGYOJgq33+r+b50p3mBxxaTUdni7f8NjInkTEXtCAY4ZQeoXI0yF58Je Xg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tje3wr87n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 07:50:28 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3967iaAe004141;
	Fri, 6 Oct 2023 07:50:27 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tje3wr87d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 07:50:27 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3967O43U025205;
	Fri, 6 Oct 2023 07:50:26 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3texd0dvv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 07:50:26 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3967oQYu6750816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Oct 2023 07:50:26 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC61F58061;
	Fri,  6 Oct 2023 07:50:25 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C19358058;
	Fri,  6 Oct 2023 07:50:19 +0000 (GMT)
Received: from [9.171.85.112] (unknown [9.171.85.112])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Oct 2023 07:50:19 +0000 (GMT)
Message-ID: <92db426f-4a31-9c2c-e23a-85a8d353fbae@linux.vnet.ibm.com>
Date: Fri, 6 Oct 2023 13:20:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-block@vger.kernel.org
From: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>
Subject: [Bisected] [commit 2ad56efa80db] [Hotplug] WARNING while performing
 hotplug operation on 6.6-rc3-next
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: h2h2se0pExF98aSMXOYalMC-tQGyi0qH
X-Proofpoint-ORIG-GUID: T2rYUk5LfCGsEyQlXCp0qrtuQ2PiMAsq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-06_04,2023-10-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 adultscore=0 mlxlogscore=740 clxscore=1011
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310060054
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
Cc: jroedel@suse.de, abdhalee@linux.vnet.ibm.com, mputtash@linux.vnet.com, joro@8bytes.org, jsnitsel@redhat.com, sachinp@linux.vnet.com, jgg@ziepe.ca, iommu@lists.linux.dev, Jason Gunthorpe <jgg@nvidia.com>, will@kernel.org, baolu.lu@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greetings,

[linux-next] [6.6.0-rc3-next-20230929] WARNING: CPU: 5 PID: 185612 at 
drivers/iommu/iommu.c:3049 iommu_setup_default_domain+0x410/0x680

--- Traces ---

[ 6296.425934] WARNING: CPU: 5 PID: 185612 at drivers/iommu/iommu.c:3049 
iommu_setup_default_domain+0x410/0x680
[ 6296.425945] Modules linked in: sit tunnel4 ip_tunnel loop dm_mod 
nft_compat nf_tables nfnetlink rpadlpar_io rpaphp tcp_diag udp_diag 
inet_diag unix_diag af_packet_diag netlink_diag bonding rfkill xfs 
libcrc32c pseries_rng xts vmx_crypto uio_pdrv_genirq uio sch_fq_codel 
binfmt_misc ext4 mbcache jbd2 sd_mod sr_mod t10_pi cdrom crc64_rocksoft 
crc64 sg tg3 ibmvscsi ibmveth scsi_transport_srp ptp pps_core fuse
[ 6296.426001] CPU: 5 PID: 185612 Comm: avocado-runner- Kdump: loaded 
Not tainted 6.6.0-rc3-next-20230929-autotest #1
[ 6296.426008] Hardware name: IBM,9009-42A POWER9 (raw) 0x4e0202 
0xf000005 of:IBM,FW950.80 (VL950_131) hv:phyp pSeries
[ 6296.426013] NIP:  c000000000889320 LR: c000000000889310 CTR: 
c000000000da3570
[ 6296.426018] REGS: c000000083517300 TRAP: 0700   Not tainted 
(6.6.0-rc3-next-20230929-autotest)
[ 6296.426024] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 
88822822  XER: 2004000a
[ 6296.426037] CFAR: c000000000887cf4 IRQMASK: 0
[ 6296.426037] GPR00: c000000000889310 c0000000835175a0 c00000000121d200 
fffffffffffffff0
[ 6296.426037] GPR04: 0000000000000000 c0000000835171a0 c000000083517198 
c000000051e14318
[ 6296.426037] GPR08: c000000051e14098 0000000000000001 0000000000000002 
c0000000029982b0
[ 6296.426037] GPR12: 0000000000002000 c00000000ffc9f00 00007fff93a3f4f0 
00007fff84ca7678
[ 6296.426037] GPR16: 00007fff93a15578 00007ffff007e118 0000000000000000 
0000000000000000
[ 6296.426037] GPR20: c00000000105eef8 0000000000000001 c000000002a50fd0 
0000000000000001
[ 6296.426037] GPR24: 0000000000000000 c0000000010f1b80 fffffffffffffff0 
0000000000000000
[ 6296.426037] GPR28: c000000051e50e00 c000000051e50e48 c0000000025c4888 
c000000051e50e48
[ 6296.426098] NIP [c000000000889320] 
iommu_setup_default_domain+0x410/0x680
[ 6296.426104] LR [c000000000889310] iommu_setup_default_domain+0x400/0x680
[ 6296.426109] Call Trace:
[ 6296.426111] [c0000000835175a0] [c000000000889310] 
iommu_setup_default_domain+0x400/0x680 (unreliable)
[ 6296.426119] [c000000083517660] [c00000000088b028] 
__iommu_probe_device+0x368/0x5e0
[ 6296.426126] [c0000000835176d0] [c00000000088b850] 
iommu_probe_device+0x30/0x90
[ 6296.426133] [c000000083517700] [c00000000088b8f0] 
iommu_bus_notifier+0x40/0x80
[ 6296.426140] [c000000083517720] [c000000000199190] 
notifier_call_chain+0xc0/0x1b0
[ 6296.426147] [c000000083517780] [c000000000199c94] 
blocking_notifier_call_chain+0x64/0xa0
[ 6296.426153] [c0000000835177c0] [c00000000089e5c0] bus_notify+0x50/0x80
[ 6296.426160] [c000000083517800] [c000000000899c34] device_add+0x754/0x9c0
[ 6296.426166] [c0000000835178c0] [c000000000795074] 
pci_device_add+0x2e4/0x860
[ 6296.426174] [c000000083517970] [c000000000080f50] 
of_create_pci_dev+0x390/0xa10
[ 6296.426182] [c000000083517a50] [c000000000081818] 
__of_scan_bus+0x248/0x320
[ 6296.426188] [c000000083517b30] [c00000000007ccfc] 
pci_hp_add_devices+0x1cc/0x200
[ 6296.426195] [c000000083517b70] [c0080000020312d0] 
enable_slot+0x108/0x180 [rpaphp]
[ 6296.426204] [c000000083517bf0] [c0000000007cdc7c] 
power_write_file+0xcc/0x180
[ 6296.426211] [c000000083517c70] [c0000000007c3384] 
pci_slot_attr_store+0x44/0x60
[ 6296.426218] [c000000083517c90] [c0000000005bcb38] 
sysfs_kf_write+0x68/0x80
[ 6296.426225] [c000000083517cb0] [c0000000005bb4ac] 
kernfs_fop_write_iter+0x1cc/0x280
[ 6296.426232] [c000000083517d00] [c0000000004c3e10] vfs_write+0x350/0x4b0
[ 6296.426238] [c000000083517dc0] [c0000000004c414c] ksys_write+0x7c/0x140
[ 6296.426244] [c000000083517e10] [c000000000035148] 
system_call_exception+0x158/0x3a0
[ 6296.426252] [c000000083517e50] [c00000000000c6d4] 
system_call_common+0xf4/0x258
[ 6296.426259] --- interrupt: c00 at 0x7fff93637eb0
[ 6296.426263] NIP:  00007fff93637eb0 LR: 00007fff93637e94 CTR: 
0000000000000000
[ 6296.426268] REGS: c000000083517e80 TRAP: 0c00   Not tainted 
(6.6.0-rc3-next-20230929-autotest)
[ 6296.426273] MSR:  800000000280f033 
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 22222288  XER: 00000000
[ 6296.426289] IRQMASK: 0
[ 6296.426289] GPR00: 0000000000000004 00007ffff007d170 00007fff93667f00 
0000000000000008
[ 6296.426289] GPR04: 0000010014e69490 0000000000000001 0000000000000001 
0000000000000002
[ 6296.426289] GPR08: 00007fff93e85ad8 0000000000000000 0000000000000000 
0000000000000000
[ 6296.426289] GPR12: 0000000000000000 00007fff93e8d140 00007fff93a3f4f0 
00007fff84ca7678
[ 6296.426289] GPR16: 00007fff93a15578 00007ffff007e118 00007fff84c96d88 
00007fff84cadb70
[ 6296.426289] GPR20: 0000010014e64ba0 0000000000000000 00007fff93a3f4c4 
00007fff84ca8eb0
[ 6296.426289] GPR24: 0000000000000000 00000100148735e0 0000010014e69490 
0000000000000008
[ 6296.426289] GPR28: 0000000000000000 0000010014e69490 0000000000000008 
0000000000000001
[ 6296.426347] NIP [00007fff93637eb0] 0x7fff93637eb0
[ 6296.426351] LR [00007fff93637e94] 0x7fff93637e94
[ 6296.426355] --- interrupt: c00
[ 6296.426358] Code: ebc1fff0 ebe1fff8 7c0803a6 4e800020 38a00001 
7fc4f378 7f83e378 4bffe83d 7c690034 7c7a1b78 5529d97e 69290001 
<0b090000> 2fa30000 419efe4c 4bffff38
[ 6296.426378] ---[ end trace 0000000000000000 ]---
[ 6296.427348] pci 0013:60:00.1: No hypervisor support for SR-IOV on 
this device, IOV BARs disabled.
[ 6296.430049] pci 0013:60:00.1: PME# supported from D0 D3hot D3cold
[ 6296.433403] pci 0013:60:00.1: Adding to iommu group 0
[ 6296.433408] iommu_tce: it_map is not empty
[ 6296.433414] ------------[ cut here ]------------


gitbisect is pointing to below commit

commit 2ad56efa80dba89162106c06ebc00b611325e584
     powerpc/iommu: Setup a default domain and remove set_platform_dma_ops

-- 
Regards,
Tasmiya Nalatwad
IBM Linux Technology Center

