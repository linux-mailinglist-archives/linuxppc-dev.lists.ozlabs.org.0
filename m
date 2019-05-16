Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 338692097C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 16:25:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454Ybs3X5nzDqcN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 00:25:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sraithal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454YMd0z17zDqYb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 00:14:33 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4GE3Irp041344
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 10:14:30 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sh8hrtqhd-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 10:14:30 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sraithal@linux.vnet.ibm.com>;
 Thu, 16 May 2019 15:14:28 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 16 May 2019 15:14:25 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4GEEOnS58196156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 May 2019 14:14:24 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E6A511C04A;
 Thu, 16 May 2019 14:14:24 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2497E11C050;
 Thu, 16 May 2019 14:14:22 +0000 (GMT)
Received: from bssrikanth.in.ibm.com (unknown [9.85.163.55])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 16 May 2019 14:14:21 +0000 (GMT)
To: linuxppc-dev@lists.ozlabs.org
From: srikanth <sraithal@linux.vnet.ibm.com>
Subject: PROBLEM: Power9: kernel oops on memory hotunplug from ppc64le guest
Date: Thu, 16 May 2019 19:44:20 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19051614-0012-0000-0000-0000031C5F48
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051614-0013-0000-0000-000021550108
Message-Id: <16a7a635-c592-27e2-75b4-d02071833278@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-16_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905160092
X-Mailman-Approved-At: Fri, 17 May 2019 00:23:56 +1000
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
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
 bharata@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On power9 host, performing memory hotunplug from ppc64le guest results 
in kernel oops.

Kernel used : https://github.com/torvalds/linux/tree/v5.1 built using 
ppc64le_defconfig for host and ppc64le_guest_defconfig for guest.

Recreation steps:

1. Boot a guest with below mem configuration:
   <maxMemory slots='32' unit='KiB'>33554432</maxMemory>
   <memory unit='KiB'>8388608</memory>
   <currentMemory unit='KiB'>4194304</currentMemory>
   <cpu>
     <numa>
       <cell id='0' cpus='0-31' memory='8388608' unit='KiB'/>
     </numa>
   </cpu>

2. From host hotplug 8G memory -> verify memory hotadded succesfully -> 
now reboot guest -> once guest comes back try to unplug 8G memory

mem.xml used:
<memory model='dimm'>
<target>
<size unit='GiB'>8</size>
<node>0</node>
</target>
</memory>

Memory attach and detach commands used:
     virsh attach-device vm1 ./mem.xml --live
     virsh detach-device vm1 ./mem.xml --live

Trace seen inside guest after unplug, guest just hangs there forever:

[   21.962986] kernel BUG at arch/powerpc/mm/pgtable-frag.c:113!
[   21.963064] Oops: Exception in kernel mode, sig: 5 [#1]
[   21.963090] LE PAGE_SIZE=64K MMU=Radix MMU=Hash SMP NR_CPUS=2048 NUMA 
pSeries
[   21.963131] Modules linked in: xt_tcpudp iptable_filter squashfs fuse 
vmx_crypto ib_iser rdma_cm iw_cm ib_cm ib_core libiscsi 
scsi_transport_iscsi ip_tables x_tables autofs4 btrfs zstd_decompress 
zstd_compress lzo_compress raid10 raid456 async_raid6_recov async_memcpy 
async_pq async_xor async_tx xor raid6_pq multipath crc32c_vpmsum
[   21.963281] CPU: 11 PID: 316 Comm: kworker/u64:5 Kdump: loaded Not 
tainted 5.1.0-dirty #2
[   21.963323] Workqueue: pseries hotplug workque pseries_hp_work_fn
[   21.963355] NIP:  c000000000079e18 LR: c000000000c79308 CTR: 
0000000000008000
[   21.963392] REGS: c0000003f88034f0 TRAP: 0700   Not tainted (5.1.0-dirty)
[   21.963422] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  
CR: 28002884  XER: 20040000
[   21.963470] CFAR: c000000000c79304 IRQMASK: 0
[   21.963470] GPR00: c000000000c79308 c0000003f8803780 c000000001521000 
0000000000fff8c0
[   21.963470] GPR04: 0000000000000001 00000000ffe30005 0000000000000005 
0000000000000020
[   21.963470] GPR08: 0000000000000000 0000000000000001 c00a000000fff8e0 
c0000000016d21a0
[   21.963470] GPR12: c0000000016e7b90 c000000007ff2700 c00a000000a00000 
c0000003ffe30100
[   21.963470] GPR16: c0000003ffe30000 c0000000014aa4de c00a0000009f0000 
c0000000016d21b0
[   21.963470] GPR20: c0000000014de588 0000000000000001 c0000000016d21b8 
c00a000000a00000
[   21.963470] GPR24: 0000000000000000 ffffffffffffffff c00a000000a00000 
c0000003ffe96000
[   21.963470] GPR28: c00a000000a00000 c00a000000a00000 c0000003fffec000 
c00a000000fff8c0
[   21.963802] NIP [c000000000079e18] pte_fragment_free+0x48/0xd0
[   21.963838] LR [c000000000c79308] remove_pagetable+0x49c/0x5b4
[   21.963873] Call Trace:
[   21.963890] [c0000003f8803780] [c0000003ffe997f0] 0xc0000003ffe997f0 
(unreliable)
[   21.963933] [c0000003f88037b0] [0000000000000000] (null)
[   21.963969] [c0000003f88038c0] [c00000000006f038] 
vmemmap_free+0x218/0x2e0
[   21.964006] [c0000003f8803940] [c00000000036f100] 
sparse_remove_one_section+0xd0/0x138
[   21.964050] [c0000003f8803980] [c000000000383a50] 
__remove_pages+0x410/0x560
[   21.964093] [c0000003f8803a90] [c000000000c784d8] 
arch_remove_memory+0x68/0xdc
[   21.964136] [c0000003f8803ad0] [c000000000385d74] 
__remove_memory+0xc4/0x110
[   21.964180] [c0000003f8803b10] [c0000000000d44e4] 
dlpar_remove_lmb+0x94/0x140
[   21.964223] [c0000003f8803b50] [c0000000000d52b4] 
dlpar_memory+0x464/0xd00
[   21.964259] [c0000003f8803be0] [c0000000000cd5c0] 
handle_dlpar_errorlog+0xc0/0x190
[   21.964303] [c0000003f8803c50] [c0000000000cd6bc] 
pseries_hp_work_fn+0x2c/0x60
[   21.964346] [c0000003f8803c80] [c00000000013a4a0] 
process_one_work+0x2b0/0x5a0
[   21.964388] [c0000003f8803d10] [c00000000013a818] 
worker_thread+0x88/0x610
[   21.964434] [c0000003f8803db0] [c000000000143884] kthread+0x1a4/0x1b0
[   21.964468] [c0000003f8803e20] [c00000000000bdc4] 
ret_from_kernel_thread+0x5c/0x78
[   21.964506] Instruction dump:
[   21.964527] fbe1fff8 f821ffd1 78638502 78633664 ebe90000 7fff1a14 
395f0020 813f0020
[   21.964569] 7d2907b4 7d2900d0 79290fe0 69290001 <0b090000> 7c0004ac 
7d205028 3129ffff
[   21.964613] ---[ end trace aaa571aa1636fee6 ]---
[   21.966349]
[   21.966383] Sending IPI to other CPUs
[   21.978335] IPI complete
[   21.981354] kexec: Starting switchover sequence.
I'm in purgatory

