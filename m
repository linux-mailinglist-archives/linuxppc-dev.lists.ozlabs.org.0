Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBD4A6482
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 10:57:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N16k1njnzDqgD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 18:57:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=abdhalee@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N14S5hBNzDqJt
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 18:55:20 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x838q4iE092234; Tue, 3 Sep 2019 04:55:12 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2usmcc1njb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Sep 2019 04:55:11 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x838pn2k017636;
 Tue, 3 Sep 2019 08:55:10 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 2uqgh6wn5c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Sep 2019 08:55:10 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x838t95R54460892
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Sep 2019 08:55:09 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8464AC059;
 Tue,  3 Sep 2019 08:55:09 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32736AC05B;
 Tue,  3 Sep 2019 08:55:07 +0000 (GMT)
Received: from [9.124.31.200] (unknown [9.124.31.200])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  3 Sep 2019 08:55:06 +0000 (GMT)
Message-ID: <1567500907.5082.12.camel@abdul>
Subject: [mainline][BUG][PPC][btrfs][bisected 00801a] kernel BUG at
 fs/btrfs/locking.c:71!
From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Date: Tue, 03 Sep 2019 14:25:07 +0530
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-03_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909030094
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
Cc: sachinp <sachinp@linux.vnet.ibm.com>, nborisov@suse.com,
 linux-kernel <linux-kernel@vger.kernel.org>, josef@toxicpanda.com,
 Brian King <brking@linux.vnet.ibm.com>, chandan <chandan@linux.vnet.ibm.com>,
 dsterba@suse.com, linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greeting's

Mainline kernel panics with LTP/fs_fill-dir tests for btrfs file system on my P9 box running mainline kernel 5.3.0-rc5

BUG_ON was first introduced by below commit

commit 00801ae4bb2be5f5af46502ef239ac5f4b536094
Author: David Sterba <dsterba@suse.com>
Date:   Thu May 2 16:53:47 2019 +0200

    btrfs: switch extent_buffer write_locks from atomic to int
    
    The write_locks is either 0 or 1 and always updated under the lock,
    so we don't need the atomic_t semantics.
    
    Reviewed-by: Nikolay Borisov <nborisov@suse.com>
    Signed-off-by: David Sterba <dsterba@suse.com>

diff --git a/fs/btrfs/locking.c b/fs/btrfs/locking.c
index 2706676279..98fccce420 100644
--- a/fs/btrfs/locking.c
+++ b/fs/btrfs/locking.c
@@ -58,17 +58,17 @@ static void btrfs_assert_tree_read_locked(struct
extent_buffer *eb)
 
 static void btrfs_assert_tree_write_locks_get(struct extent_buffer *eb)
 {
-       atomic_inc(&eb->write_locks);
+       eb->write_locks++;
 }
 
 static void btrfs_assert_tree_write_locks_put(struct extent_buffer *eb)
 {
-       atomic_dec(&eb->write_locks);
+       eb->write_locks--;
 }
 
 void btrfs_assert_tree_locked(struct extent_buffer *eb)
 {
-       BUG_ON(!atomic_read(&eb->write_locks));
+       BUG_ON(!eb->write_locks);
 }
 

tests logs:
avocado-misc-tests/io/disk/ltp_fs.py:LtpFs.test_fs_run;fs_fill-dir-ext3-61cd:  [ 3376.022096] EXT4-fs (nvme0n1): mounting ext3 file system using the ext4 subsystem
EXT4-fs (nvme0n1): mounted filesystem with ordered data mode. Opts: (null)
EXT4-fs (loop1): mounting ext2 file system using the ext4 subsystem
EXT4-fs (loop1): mounted filesystem without journal. Opts: (null)
EXT4-fs (loop1): mounting ext3 file system using the ext4 subsystem
EXT4-fs (loop1): mounted filesystem with ordered data mode. Opts: (null)
EXT4-fs (loop1): mounted filesystem with ordered data mode. Opts: (null)
XFS (loop1): Mounting V5 Filesystem
XFS (loop1): Ending clean mount
XFS (loop1): Unmounting Filesystem
BTRFS: device fsid 7c08f81b-6642-4a06-9182-2884e80d56ee devid 1 transid 5 /dev/loop1
BTRFS info (device loop1): disk space caching is enabled
BTRFS info (device loop1): has skinny extents
BTRFS info (device loop1): enabling ssd optimizations
BTRFS info (device loop1): creating UUID tree
------------[ cut here ]------------
kernel BUG at fs/btrfs/locking.c:71!
Oops: Exception in kernel mode, sig: 5 [#1]
LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
Dumping ftrace buffer:
   (ftrace buffer empty)
Modules linked in: fuse(E) vfat(E) fat(E) btrfs(E) xor(E)
zstd_decompress(E) zstd_compress(E) raid6_pq(E) xfs(E) raid0(E)
linear(E) dm_round_robin(E) dm_queue_length(E) dm_service_time(E)
dm_multipath(E) loop(E) rpadlpar_io(E) rpaphp(E) lpfc(E) bnx2x(E)
xt_CHECKSUM(E) xt_MASQUERADE(E) tun(E) bridge(E) stp(E) llc(E) kvm_pr(E)
kvm(E) tcp_diag(E) udp_diag(E) inet_diag(E) unix_diag(E)
af_packet_diag(E) netlink_diag(E) ip6t_rpfilter(E) ipt_REJECT(E)
nf_reject_ipv4(E) ip6t_REJECT(E) nf_reject_ipv6(E) xt_conntrack(E)
ip_set(E) nfnetlink(E) ebtable_nat(E) ebtable_broute(E) ip6table_nat(E)
ip6table_mangle(E) ip6table_security(E) ip6table_raw(E) iptable_nat(E)
nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E)
iptable_mangle(E) iptable_security(E) iptable_raw(E) ebtable_filter(E)
ebtables(E) ip6table_filter(E) ip6_tables(E) iptable_filter(E) sunrpc(E)
raid10(E) xts(E) pseries_rng(E) vmx_crypto(E) sg(E) uio_pdrv_genirq(E)
uio(E) binfmt_misc(E) sch_fq_codel(E) ip_tables(E)
 ext4(E) mbcache(E) jbd2(E) sr_mod(E) cdrom(E) sd_mod(E) ibmvscsi(E)
scsi_transport_srp(E) ibmveth(E) nvmet_fc(E) nvmet(E) nvme_fc(E)
nvme_fabrics(E) scsi_transport_fc(E) mdio(E) libcrc32c(E) ptp(E)
pps_core(E) nvme(E) nvme_core(E) dm_mirror(E) dm_region_hash(E)
dm_log(E) dm_mod(E) [last unloaded: lpfc]
CPU: 14 PID: 1803 Comm: kworker/u32:8 Tainted: G            E     5.3.0-rc5-autotest-autotest #1
Workqueue: btrfs-endio-write btrfs_endio_write_helper [btrfs]
NIP:  c00800000164dd70 LR: c00800000164df00 CTR: c000000000a817a0
REGS: c00000000260b5d0 TRAP: 0700   Tainted: G            E      (5.3.0-rc5-autotest-autotest)
MSR:  8000000102029033 <SF,VEC,EE,ME,IR,DR,RI,LE,TM[E]>  CR: 22444082  XER: 00000000
CFAR: c00800000164defc IRQMASK: 0
GPR00: c0080000015c55f4 c00000000260b860 c008000001703b00 c000000267a29af0
GPR04: 0000000000000000 0000000000000001 0000000000000000 0000000000000000
GPR08: 0000000000000000 0000000000000001 0000000000000000 0000000000000004
GPR12: 0000000000004000 c00000001ec58e00 0000000000000000 0000000000000000
GPR16: 0000000000010000 0000000000000004 0000000000000001 0000000000000001
GPR20: 0000000000000000 0000000000000001 000000003e0f83e1 c00000025a7cbef0
GPR24: c00000000260ba26 0000000040000000 c0000000014a26e8 0000000000000003
GPR28: 0000000000000004 c00000025f2010a0 c000000267a29af0 0000000000000000
NIP [c00800000164dd70] btrfs_assert_tree_locked+0x10/0x20 [btrfs]
LR [c00800000164df00] btrfs_set_lock_blocking_write+0x60/0x100 [btrfs]
Call Trace:
[c00000000260b860] [c00000000260b8e0] 0xc00000000260b8e0 (unreliable)
[c00000000260b890] [c0080000015c55f4] btrfs_set_path_blocking+0xb4/0xc0 [btrfs]
[c00000000260b8e0] [c0080000015cb808] btrfs_search_slot+0x8e8/0xb80 [btrfs]
[c00000000260ba00] [c0080000015eb348] btrfs_csum_file_blocks+0x518/0x6e0 [btrfs]
[c00000000260bad0] [c0080000015fd34c] add_pending_csums+0x8c/0x100 [btrfs]
[c00000000260bb20] [c0080000016093b0] btrfs_finish_ordered_io+0x550/0xe00 [btrfs]
[c00000000260bc10] [c008000001641aa4] normal_work_helper+0xf4/0x5a0 [btrfs]
[c00000000260bc80] [c00000000013c8a0] process_one_work+0x1c0/0x490
[c00000000260bd20] [c00000000013cbf8] worker_thread+0x88/0x570
[c00000000260bdb0] [c0000000001444d8] kthread+0x158/0x1a0
[c00000000260be20] [c00000000000b760] ret_from_kernel_thread+0x5c/0x7c
Instruction dump:
81430108 7d490034 5529d97e 69290001 0b090000 394a0001 91430108 4e800020
81230114 7d290034 5529d97e 79290020 <0b090000> 4e800020 60000000 60420000
---[ end trace 7890aa8e373f5bfa ]---

Kernel panic - not syncing: Fatal exception
Dumping ftrace buffer:
   (ftrace buffer empty)
------------[ cut here ]------------
WARNING: CPU: 14 PID: 1803 at drivers/tty/vt/vt.c:4256 do_unblank_screen+0x1ec/0x260
Modules linked in: fuse(E) vfat(E) fat(E) btrfs(E) xor(E)
zstd_decompress(E) zstd_compress(E) raid6_pq(E) xfs(E) raid0(E)
linear(E) dm_round_robin(E) dm_queue_length(E) dm_service_time(E)
dm_multipath(E) loop(E) rpadlpar_io(E) rpaphp(E) lpfc(E) bnx2x(E)
xt_CHECKSUM(E) xt_MASQUERADE(E) tun(E) bridge(E) stp(E) llc(E) kvm_pr(E)
kvm(E) tcp_diag(E) udp_diag(E) inet_diag(E) unix_diag(E)
af_packet_diag(E) netlink_diag(E) ip6t_rpfilter(E) ipt_REJECT(E)
nf_reject_ipv4(E) ip6t_REJECT(E) nf_reject_ipv6(E) xt_conntrack(E)
ip_set(E) nfnetlink(E) ebtable_nat(E) ebtable_broute(E) ip6table_nat(E)
ip6table_mangle(E) ip6table_security(E) ip6table_raw(E) iptable_nat(E)
nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E)
iptable_mangle(E) iptable_security(E) iptable_raw(E) ebtable_filter(E)
ebtables(E) ip6table_filter(E) ip6_tables(E) iptable_filter(E) sunrpc(E)
raid10(E) xts(E) pseries_rng(E) vmx_crypto(E) sg(E) uio_pdrv_genirq(E)
uio(E) binfmt_misc(E) sch_fq_codel(E) ip_tables(E)
 ext4(E) mbcache(E) jbd2(E) sr_mod(E) cdrom(E) sd_mod(E) ibmvscsi(E)
scsi_transport_srp(E) ibmveth(E) nvmet_fc(E) nvmet(E) nvme_fc(E)
nvme_fabrics(E) scsi_transport_fc(E) mdio(E) libcrc32c(E) ptp(E)
pps_core(E) nvme(E) nvme_core(E) dm_mirror(E) dm_region_hash(E)
dm_log(E) dm_mod(E) [last unloaded: lpfc]
CPU: 14 PID: 1803 Comm: kworker/u32:8 Tainted: G      D     E     5.3.0-rc5-autotest-autotest #1
Workqueue: btrfs-endio-write btrfs_endio_write_helper [btrfs]
NIP:  c00000000064f79c LR: c00000000064f798 CTR: 000000000083cf60
REGS: c00000000260b0c0 TRAP: 0700   Tainted: G      D     E      (5.3.0-rc5-autotest-autotest)
MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 42442022  XER: 00000005
CFAR: c0000000001998f4 IRQMASK: 3
GPR00: c00000000064f798 c00000000260b350 c0000000012f2000 0000000000000024
GPR04: 0000000000000001 0000000000000000 00041dab23bc8187 00000000000000ee
GPR08: 0000000000000001 0000000000000007 0000000000000006 00000000000012cc
GPR12: 0000000000002000 c00000001ec58e00 0000000000000000 0000000000000000
GPR16: 0000000000010000 0000000000000004 0000000000000001 0000000000000001
GPR20: 0000000000000000 0000000000000001 000000003e0f83e1 c00000025a7cbef0
GPR24: c00000000260ba26 0000000040000000 c0000000011c2678 c0000000014c6720
GPR28: c0000000014c66f8 0000000000000000 c000000000c9cbc0 c0000000015d5170
NIP [c00000000064f79c] do_unblank_screen+0x1ec/0x260
LR [c00000000064f798] do_unblank_screen+0x1e8/0x260
Call Trace:
[c00000000260b350] [c00000000064f798] do_unblank_screen+0x1e8/0x260 (unreliable)
[c00000000260b3d0] [c000000000112fcc] panic+0x1d4/0x3f8
[c00000000260b460] [c00000000002a8b8] oops_end+0x1b8/0x1c0
[c00000000260b4e0] [c00000000002d26c] program_check_exception+0x2ac/0x3b0
[c00000000260b560] [c000000000008e14] program_check_common+0x134/0x140
--- interrupt: 700 at btrfs_assert_tree_locked+0x10/0x20 [btrfs]
    LR = btrfs_set_lock_blocking_write+0x60/0x100 [btrfs]
[c00000000260b860] [c00000000260b8e0] 0xc00000000260b8e0 (unreliable)
[c00000000260b890] [c0080000015c55f4] btrfs_set_path_blocking+0xb4/0xc0 [btrfs]
[c00000000260b8e0] [c0080000015cb808] btrfs_search_slot+0x8e8/0xb80 [btrfs]
[c00000000260ba00] [c0080000015eb348] btrfs_csum_file_blocks+0x518/0x6e0 [btrfs]
[c00000000260bad0] [c0080000015fd34c] add_pending_csums+0x8c/0x100 [btrfs]
[c00000000260bb20] [c0080000016093b0] btrfs_finish_ordered_io+0x550/0xe00 [btrfs]
[c00000000260bc10] [c008000001641aa4] normal_work_helper+0xf4/0x5a0 [btrfs]
[c00000000260bc80] [c00000000013c8a0] process_one_work+0x1c0/0x490
[c00000000260bd20] [c00000000013cbf8] worker_thread+0x88/0x570
[c00000000260bdb0] [c0000000001444d8] kthread+0x158/0x1a0
[c00000000260be20] [c00000000000b760] ret_from_kernel_thread+0x5c/0x7c
Instruction dump:
60420000 4bb44c49 60000000 2fa30000 409efe80 813f0000 2f890000 409efe74
3c62ff9b 38639d78 4bb4a121 60000000 <0fe00000> 4bfffe5c 60000000 60000000
---[ end trace 7890aa8e373f5bfb ]---
Rebooting in 10 seconds..

!!! 01FT700� FCode, Copyright (c) 2000-2017 Emulex !!!  Version 4.03a12


-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre



