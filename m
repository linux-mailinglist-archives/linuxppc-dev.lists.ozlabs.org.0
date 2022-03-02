Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 717294C9EDF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 09:05:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7mrh3fhQz3by8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 19:05:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hYSTiYAm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=abdhalee@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hYSTiYAm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7mqv3d1Dz2ybD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 19:04:58 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2227cQhd012056; 
 Wed, 2 Mar 2022 08:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : to : from : subject : cc : content-type :
 content-transfer-encoding; s=pp1;
 bh=mNKrNnfcjIOG7tiLS+y7yt4cKOhNyjFGkuN26+hJWIQ=;
 b=hYSTiYAmg31UySPasfqSoBgvbBmzhnQ0BBstqSLj1ysmVBanKJ4pj+T1dCB06Tlcgegl
 mYaygtxTFZF8EQeAp7rh1/YkLIYuidUmqRQJs/3aquMo24fclqtwMOiPUzJ/6/GCCdm+
 ESu+AlvQv+/fAdkak5O0PI3oFbLQbiH7zinYtt9NSm2p4A+t4YUvmEwFABwkou1bG3dY
 3YvEpdqbqXKo9X3emNeX/VQpeZaPa+i6wUxQTzPapSruYl5gx/aGRfHeIQH384EDP+O6
 ebkEzTn/SxE87X/raK236ksrw+7N9gbLR/5uNJHMCMCRbKLgfOVbQ1wAypZXWFDEs1eP og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej1e3v2f9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 08:04:50 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2227kWba029259;
 Wed, 2 Mar 2022 08:04:49 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej1e3v2ey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 08:04:49 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22282xYk031801;
 Wed, 2 Mar 2022 08:04:48 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02wdc.us.ibm.com with ESMTP id 3efbua2se2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 08:04:48 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22284lUx23331120
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 08:04:47 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35796C6055;
 Wed,  2 Mar 2022 08:04:47 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17C7EC605B;
 Wed,  2 Mar 2022 08:04:42 +0000 (GMT)
Received: from [9.43.6.233] (unknown [9.43.6.233])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  2 Mar 2022 08:04:41 +0000 (GMT)
Message-ID: <d583adf0-2d98-60b6-620c-722912c05852@linux.vnet.ibm.com>
Date: Wed, 2 Mar 2022 13:31:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: linux-scsi <linux-scsi@vger.kernel.org>
From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: [next-20220225][Oops][ppc] lvm snapshot merge results kernel panics
 (throtl_pending_timer_fn)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Jb0_nJv9ibAHtLbMzcw11Z9yHYXz0xWX
X-Proofpoint-ORIG-GUID: rhEucWJoA4J6_qcX1q9MrXPo-bR4qaML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 clxscore=1011 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2203020033
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
Cc: axboe@kernel.dk, linux-kernel <linux-kernel@vger.kernel.org>,
 ming.lei@redhat.com, linux-block@vger.kernel.org,
 linux-next <linux-next@vger.kernel.org>, yukuai3@huawei.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greeting's

Linux next kernel 5.17.0-rc5-next-20220225 crashed on my power 10 LPAR 
when merge lvm snapshot on nvme disk

console logs
------------

fdisk -l /dev/nvme1n1

Disk /dev/nvme1n1: 372.6 GiB, 400088457216 bytes, 97677846 sectors
Units: sectors of 1 * 4096 = 4096 bytes
Sector size (logical/physical): 4096 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
vgcreate avocado_vg /dev/nvme1n1
   Volume group "avocado_vg" successfully created

lvcreate --name avocado_lv --size 18432.0 avocado_vg -y
   Wiping ext2 signature on /dev/avocado_vg/avocado_lv.
   Logical volume "avocado_lv" created.

lvdisplay avocado_vg
   --- Logical volume ---
   LV Path                /dev/avocado_vg/avocado_lv
   LV Name                avocado_lv
   VG Name                avocado_vg
   LV UUID nkhkFh-Oofl-GKH1-1055-3B47-0gup-yQtI1s
   LV Write Access        read/write
   LV Creation host, time ltc-zz1b-lp4.aus.stglabs.ibm.com, 2022-03-02 
01:32:19 -0600
   LV Status              available
   # open                 0
   LV Size                18.00 GiB
   Current LE             4608
   Segments               1
   Allocation             inherit
   Read ahead sectors     auto
   - currently set to     8192
   Block device           253:0

mkfs.ext2 /dev/avocado_vg/avocado_lv

mke2fs 1.44.6 (5-Mar-2019)
Creating filesystem with 4718592 4k blocks and 1179648 inodes
Filesystem UUID: 5ed3c335-bac2-4b64-a827-222d287af0b2
Superblock backups stored on blocks:
     32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 
2654208,
     4096000

Allocating group tables: done
Writing inode tables: done
Writing superblocks and filesystem accounting information: done

mount /dev/avocado_vg/avocado_lv /mnt

[ 1053.517019] EXT4-fs (dm-0): mounting ext2 file system using the ext4 
subsystem
[ 1053.518270] EXT4-fs (dm-0): mounted filesystem without journal. Quota 
mode: none.

umount /dev/avocado_vg/avocado_lv

lvdisplay avocado_vg
   --- Logical volume ---
   LV Path                /dev/avocado_vg/avocado_lv
   LV Name                avocado_lv
   VG Name                avocado_vg
   LV UUID nkhkFh-Oofl-GKH1-1055-3B47-0gup-yQtI1s
   LV Write Access        read/write
   LV Creation host, time ltc-zz1b-lp4.aus.stglabs.ibm.com, 2022-03-02 
01:32:19 -0600
   LV Status              available
   # open                 0
   LV Size                18.00 GiB
   Current LE             4608
   Segments               1
   Allocation             inherit
   Read ahead sectors     auto
   - currently set to     8192
   Block device           253:0

lvcreate --snapshot --name avocado_sn /dev/avocado_vg/avocado_lv 
--ignoreactivationskip --size 18432.0

   Logical volume "avocado_sn" created.

vgdisplay avocado_vg

   --- Volume group ---
   VG Name               avocado_vg
   System ID
   Format                lvm2
   Metadata Areas        1
   Metadata Sequence No  4
   VG Access             read/write
   VG Status             resizable
   MAX LV                0
   Cur LV                2
   Open LV               0
   Max PV                0
   Cur PV                1
   Act PV                1
   VG Size               <372.61 GiB
   PE Size               4.00 MiB
   Total PE              95388
   Alloc PE / Size       9216 / 36.00 GiB
   Free  PE / Size       86172 / <336.61 GiB
   VG UUID               jobi1f-kHw4-2ovw-nR3E-Eml5-tFYR-mJc3WT

lvdisplay avocado_vg
   --- Logical volume ---
   LV Path                /dev/avocado_vg/avocado_lv
   LV Name                avocado_lv
   VG Name                avocado_vg
   LV UUID nkhkFh-Oofl-GKH1-1055-3B47-0gup-yQtI1s
   LV Write Access        read/write
   LV Creation host, time ltc-zz1b-lp4.aus.stglabs.ibm.com, 2022-03-02 
01:32:19 -0600
   LV snapshot status     source of
                          avocado_sn [active]
   LV Status              available
   # open                 0
   LV Size                18.00 GiB
   Current LE             4608
   Segments               1
   Allocation             inherit
   Read ahead sectors     auto
   - currently set to     256
   Block device           253:0

   --- Logical volume ---
   LV Path                /dev/avocado_vg/avocado_sn
   LV Name                avocado_sn
   VG Name                avocado_vg
   LV UUID QL14R9-aVa9-nD8z-DTyg-87qL-b2yY-O30G5P
   LV Write Access        read/write
   LV Creation host, time ltc-zz1b-lp4.aus.stglabs.ibm.com, 2022-03-02 
01:32:20 -0600
   LV snapshot status     active destination for avocado_lv
   LV Status              available
   # open                 0
   LV Size                18.00 GiB
   Current LE             4608
   COW-table size         18.00 GiB
   COW-table LE           4608
   Allocated to snapshot  0.00%
   Snapshot chunk size    4.00 KiB
   Segments               1
   Allocation             inherit
   Read ahead sectors     auto
   - currently set to     8192
   Block device           253:3

lvconvert --merge --interval 1 /dev/avocado_vg/avocado_sn
   Merging of volume avocado_vg/avocado_sn started.
   avocado_vg/avocado_lv: Merged: 100.00%
BUG: Unable to handle kernel data access on write at 0x3335323d524f4ab1
Faulting instruction address: 0xc000000000cb3a2c
Oops: Kernel access of bad area, sig: 11 [#1]
LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
Modules linked in: dm_snapshot dm_bufio rpadlpar_io rpaphp kvm_pr kvm 
nf_tables libcrc32c
  nfnetlink tcp_diag udp_diag inet_diag unix_diag af_packet_diag 
netlink_diag rfkill dm_mod sg pseries_rn
g xts uio_pdrv_genirq vmx_crypto gf128mul uio nfsd auth_rpcgss nfs_acl 
lockd grace sunrpc binfmt_misc sc
h_fq_codel ip_tables ext4 mbcache jbd2 sd_mod ibmvscsi ibmvnic 
scsi_transport_srp ibmveth nvme nvme_core
  t10_pi
  CPU: 17 PID: 0 Comm: swapper/17 Kdump: loaded Not tainted 
5.17.0-rc5-next-20220225-autote

  NIP:  c000000000cb3a2c LR: c0000000006740b4 CTR: c000000000674030
  REGS: c0000000034ff390 TRAP: 0380   Not tainted 
(5.17.0-rc5-next-20220225-autotest)
  MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 82008228  XER: 20040000
  CFAR: c0000000006740b0 IRQMASK: 1
  GPR00: c000000000220290 c0000000034ff630 c0000000028d3200 
3335323d524f4ab1
  GPR04: c000000000674030 00000001000126d5 0000000000000200 
0000000000000000
  GPR08: 0000000000000000 0000000000000000 0000000000000001 
0000000000000001
  GPR12: 0000000022000222 c00000000ffa6680 0000000000000100 
0000000000000010
  GPR16: 0000000000000100 0000000000000002 c000000002902108 
c0000000020e7880
  GPR20: c000000000674030 5deadbeef0000122 c00000077c908668 
c0000000b4dce000
  GPR24: c0000000acb6a800 c0000000034ff7c8 3335323d524f4a41 
0000000000000100
  GPR28: c000000000674030 c0000000acb6a880 3335323d524f4ab1 
c0000000acb6a830
  NIP [c000000000cb3a2c] _raw_spin_lock_irq+0x1c/0xa0
  LR [c0000000006740b4] throtl_pending_timer_fn+0x84/0x450
  Call Trace:
  [c0000000034ff630] [c0000000034ff670] 0xc0000000034ff670 (unreliable)
  [c0000000034ff650] [c000000002903a00] jiffies+0x0/0x80
  [c0000000034ff710] [c000000000220290] call_timer_fn+0x50/0x200
  [c0000000034ff7a0] [c000000000221c30] run_timer_softirq+0x340/0x7c0
  [c0000000034ff870] [c000000000cb3cb8] __do_softirq+0x158/0x3e0
  [c0000000034ff970] [c00000000014ef78] irq_exit+0x168/0x1b0
  [c0000000034ff9a0] [c0000000000271c4] timer_interrupt+0x1a4/0x3e0
  [c0000000034ffa00] [c000000000009a08] decrementer_common_virt+0x208/0x210
  --- interrupt: 900 at plpar_hcall_norets_notrace+0x18/0x2c
  NIP:  c0000000000ece58 LR: c0000000009d58c8 CTR: 0000000000000000
  REGS: c0000000034ffa70 TRAP: 0900   Not tainted 
(5.17.0-rc5-next-20220225-autotest)
  MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 
22000224  XER: 20040000
  CFAR: 0000000000000000 IRQMASK: 0
  GPR00: 0000000000000000 c0000000034ffd10 c0000000028d3200 
0000000000000000
  GPR04: 000000000000ffff 0000000000000000 0000000000000000 
0000000000000000
  GPR08: 0000000000000000 0000000000000000 800000140fc3fc00 
ffffffffffffffff
  GPR12: 0000000000000000 c00000000ffa6680 0000000000010000 
0000000000000800
  GPR16: c0000000016a20e8 c00000077fff1678 ffffffffffffffff 
0000000000000001
  GPR20: 0000000000000001 0000000000000002 0000000000000010 
c00000000282ff88
  GPR24: 0000000000000001 000000f59a421dce 0000000000000000 
0000000000000000
  GPR28: 0000000000000001 0000000000000000 c0000000020e2098 
c0000000020e20a0
  NIP [c0000000000ece58] plpar_hcall_norets_notrace+0x18/0x2c
  LR [c0000000009d58c8] check_and_cede_processor+0x48/0x60
  --- interrupt: 900
  [c0000000034ffd10] [c0000000034ffd40] 0xc0000000034ffd40 (unreliable)
  [c0000000034ffd70] [c0000000009d5d04] dedicated_cede_loop+0x94/0x1a0
  [c0000000034ffdc0] [c0000000009d2634] cpuidle_enter_state+0x2d4/0x4e0
  [c0000000034ffe20] [c0000000009d28d8] cpuidle_enter+0x48/0x70
  [c0000000034ffe60] [c00000000019db74] call_cpuidle+0x44/0x80
  [c0000000034ffe80] [c00000000019e150] do_idle+0x340/0x390
  [c0000000034fff00] [c00000000019e3d4] cpu_startup_entry+0x34/0x40
  [c0000000034fff30] [c0000000000607e0] start_secondary+0x290/0x2b0
  [c0000000034fff90] [c00000000000d154] start_secondary_prolog+0x10/0x14
  Instruction dump:
  7c0803a6 4bffffa4 60000000 60000000 60000000 3c4c01c2 3842f7f0 f821ffe1
  39200001 992d0932 39200000 39400001 <7c801829> 7c044800 40c20010 7d40192d
  ---[ end trace 0000000000000000 ]---

-- 
Regard's

Abdul Haleem
IBM Linux Technology Center

