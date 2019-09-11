Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD65AF764
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 10:02:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SvWc1cgMzF26v
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 18:02:20 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SvTX6BcgzF20K
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 18:00:32 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8B7vV2Q044782; Wed, 11 Sep 2019 04:00:26 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uxc00d8mv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Sep 2019 04:00:25 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8B7saxg007677;
 Wed, 11 Sep 2019 08:00:14 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 2uv468ht5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Sep 2019 08:00:13 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8B80CP334865604
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 08:00:12 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA2C46E05D;
 Wed, 11 Sep 2019 08:00:11 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D57F96E07D;
 Wed, 11 Sep 2019 08:00:08 +0000 (GMT)
Received: from [9.124.31.108] (unknown [9.124.31.108])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 11 Sep 2019 08:00:08 +0000 (GMT)
Message-ID: <1568188807.30609.6.camel@abdul.in.ibm.com>
Subject: Re: [mainline][BUG][PPC][btrfs][bisected 00801a] kernel BUG at
 fs/btrfs/locking.c:71!
From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
To: Nikolay Borisov <nborisov@suse.com>
Date: Wed, 11 Sep 2019 13:30:07 +0530
In-Reply-To: <7139ac07-db63-b984-c416-d1c94337c9bf@suse.com>
References: <1567500907.5082.12.camel@abdul>
 <7139ac07-db63-b984-c416-d1c94337c9bf@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-11_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909110074
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
Cc: sachinp <sachinp@linux.vnet.ibm.com>, josef@toxicpanda.com,
 linux-kernel <linux-kernel@vger.kernel.org>, David Sterba <dsterba@suse.com>,
 chandan <chandan@linux.vnet.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-09-03 at 13:39 +0300, Nikolay Borisov wrote:
> 
> On 3.09.19 г. 11:55 ч., Abdul Haleem wrote:
> > Greeting's
> > 
> > Mainline kernel panics with LTP/fs_fill-dir tests for btrfs file system on my P9 box running mainline kernel 5.3.0-rc5
> > 
> > BUG_ON was first introduced by below commit
> > 
> > commit 00801ae4bb2be5f5af46502ef239ac5f4b536094
> > Author: David Sterba <dsterba@suse.com>
> > Date:   Thu May 2 16:53:47 2019 +0200
> > 
> >     btrfs: switch extent_buffer write_locks from atomic to int
> >     
> >     The write_locks is either 0 or 1 and always updated under the lock,
> >     so we don't need the atomic_t semantics.
> >     
> >     Reviewed-by: Nikolay Borisov <nborisov@suse.com>
> >     Signed-off-by: David Sterba <dsterba@suse.com>
> > 
> > diff --git a/fs/btrfs/locking.c b/fs/btrfs/locking.c
> > index 2706676279..98fccce420 100644
> > --- a/fs/btrfs/locking.c
> > +++ b/fs/btrfs/locking.c
> > @@ -58,17 +58,17 @@ static void btrfs_assert_tree_read_locked(struct
> > extent_buffer *eb)
> >  
> >  static void btrfs_assert_tree_write_locks_get(struct extent_buffer *eb)
> >  {
> > -       atomic_inc(&eb->write_locks);
> > +       eb->write_locks++;
> >  }
> >  
> >  static void btrfs_assert_tree_write_locks_put(struct extent_buffer *eb)
> >  {
> > -       atomic_dec(&eb->write_locks);
> > +       eb->write_locks--;
> >  }
> >  
> >  void btrfs_assert_tree_locked(struct extent_buffer *eb)
> >  {
> > -       BUG_ON(!atomic_read(&eb->write_locks));
> > +       BUG_ON(!eb->write_locks);
> >  }
> >  
> > 
> > tests logs:
> > avocado-misc-tests/io/disk/ltp_fs.py:LtpFs.test_fs_run;fs_fill-dir-ext3-61cd:  [ 3376.022096] EXT4-fs (nvme0n1): mounting ext3 file system using the ext4 subsystem
> > EXT4-fs (nvme0n1): mounted filesystem with ordered data mode. Opts: (null)
> > EXT4-fs (loop1): mounting ext2 file system using the ext4 subsystem
> > EXT4-fs (loop1): mounted filesystem without journal. Opts: (null)
> > EXT4-fs (loop1): mounting ext3 file system using the ext4 subsystem
> > EXT4-fs (loop1): mounted filesystem with ordered data mode. Opts: (null)
> > EXT4-fs (loop1): mounted filesystem with ordered data mode. Opts: (null)
> > XFS (loop1): Mounting V5 Filesystem
> > XFS (loop1): Ending clean mount
> > XFS (loop1): Unmounting Filesystem
> > BTRFS: device fsid 7c08f81b-6642-4a06-9182-2884e80d56ee devid 1 transid 5 /dev/loop1
> > BTRFS info (device loop1): disk space caching is enabled
> > BTRFS info (device loop1): has skinny extents
> > BTRFS info (device loop1): enabling ssd optimizations
> > BTRFS info (device loop1): creating UUID tree
> > ------------[ cut here ]------------
> > kernel BUG at fs/btrfs/locking.c:71!
> > Oops: Exception in kernel mode, sig: 5 [#1]
> > LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> > Dumping ftrace buffer:
> >    (ftrace buffer empty)
> > Modules linked in: fuse(E) vfat(E) fat(E) btrfs(E) xor(E)
> > zstd_decompress(E) zstd_compress(E) raid6_pq(E) xfs(E) raid0(E)
> > linear(E) dm_round_robin(E) dm_queue_length(E) dm_service_time(E)
> > dm_multipath(E) loop(E) rpadlpar_io(E) rpaphp(E) lpfc(E) bnx2x(E)
> > xt_CHECKSUM(E) xt_MASQUERADE(E) tun(E) bridge(E) stp(E) llc(E) kvm_pr(E)
> > kvm(E) tcp_diag(E) udp_diag(E) inet_diag(E) unix_diag(E)
> > af_packet_diag(E) netlink_diag(E) ip6t_rpfilter(E) ipt_REJECT(E)
> > nf_reject_ipv4(E) ip6t_REJECT(E) nf_reject_ipv6(E) xt_conntrack(E)
> > ip_set(E) nfnetlink(E) ebtable_nat(E) ebtable_broute(E) ip6table_nat(E)
> > ip6table_mangle(E) ip6table_security(E) ip6table_raw(E) iptable_nat(E)
> > nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E)
> > iptable_mangle(E) iptable_security(E) iptable_raw(E) ebtable_filter(E)
> > ebtables(E) ip6table_filter(E) ip6_tables(E) iptable_filter(E) sunrpc(E)
> > raid10(E) xts(E) pseries_rng(E) vmx_crypto(E) sg(E) uio_pdrv_genirq(E)
> > uio(E) binfmt_misc(E) sch_fq_codel(E) ip_tables(E)
> >  ext4(E) mbcache(E) jbd2(E) sr_mod(E) cdrom(E) sd_mod(E) ibmvscsi(E)
> > scsi_transport_srp(E) ibmveth(E) nvmet_fc(E) nvmet(E) nvme_fc(E)
> > nvme_fabrics(E) scsi_transport_fc(E) mdio(E) libcrc32c(E) ptp(E)
> > pps_core(E) nvme(E) nvme_core(E) dm_mirror(E) dm_region_hash(E)
> > dm_log(E) dm_mod(E) [last unloaded: lpfc]
> > CPU: 14 PID: 1803 Comm: kworker/u32:8 Tainted: G            E     5.3.0-rc5-autotest-autotest #1
> > Workqueue: btrfs-endio-write btrfs_endio_write_helper [btrfs]
> > NIP:  c00800000164dd70 LR: c00800000164df00 CTR: c000000000a817a0
> > REGS: c00000000260b5d0 TRAP: 0700   Tainted: G            E      (5.3.0-rc5-autotest-autotest)
> > MSR:  8000000102029033 <SF,VEC,EE,ME,IR,DR,RI,LE,TM[E]>  CR: 22444082  XER: 00000000
> > CFAR: c00800000164defc IRQMASK: 0
> > GPR00: c0080000015c55f4 c00000000260b860 c008000001703b00 c000000267a29af0
> > GPR04: 0000000000000000 0000000000000001 0000000000000000 0000000000000000
> > GPR08: 0000000000000000 0000000000000001 0000000000000000 0000000000000004
> > GPR12: 0000000000004000 c00000001ec58e00 0000000000000000 0000000000000000
> > GPR16: 0000000000010000 0000000000000004 0000000000000001 0000000000000001
> > GPR20: 0000000000000000 0000000000000001 000000003e0f83e1 c00000025a7cbef0
> > GPR24: c00000000260ba26 0000000040000000 c0000000014a26e8 0000000000000003
> > GPR28: 0000000000000004 c00000025f2010a0 c000000267a29af0 0000000000000000
> > NIP [c00800000164dd70] btrfs_assert_tree_locked+0x10/0x20 [btrfs]
> > LR [c00800000164df00] btrfs_set_lock_blocking_write+0x60/0x100 [btrfs]
> > Call Trace:
> > [c00000000260b860] [c00000000260b8e0] 0xc00000000260b8e0 (unreliable)
> > [c00000000260b890] [c0080000015c55f4] btrfs_set_path_blocking+0xb4/0xc0 [btrfs]
> > [c00000000260b8e0] [c0080000015cb808] btrfs_search_slot+0x8e8/0xb80 [btrfs]
> 
> Can you provide the line numbers btrfs_search_slot+0x8e8/0xb80
> corresponds to?

btrfs_search_slot+0x8e8/0xb80 maps to fs/btrfs/ctree.c:2751
                write_lock_level = BTRFS_MAX_LEVEL;
    9a70:       08 00 40 39     li      r10,8
    9a74:       08 00 a0 3a     li      r21,8
>   9a78:       6c 00 41 91     stw     r10,108(r1)
    9a7c:       1c f8 ff 4b     b       9298 <btrfs_search_slot+0x108>
                b = btrfs_root_node(root);


and btrfs_assert_tree_locked+0x10/0x20 maps to ./fs/btrfs/locking.c:71

void btrfs_assert_tree_locked(struct extent_buffer *eb)
{
        BUG_ON(!eb->write_locks);
      80:       14 01 23 81     lwz     r9,276(r3)
      84:       34 00 29 7d     cntlzw  r9,r9
      88:       7e d9 29 55     rlwinm  r9,r9,27,5,31
      8c:       20 00 29 79     clrldi  r9,r9,32
>     90:       00 00 09 0b     tdnei   r9,0
      94:       20 00 80 4e     blr
      98:       00 00 00 60     nop
      9c:       00 00 42 60     ori     r2,r2,0

I have sent direct message attaching vmlinux and the obj dump for
ctree.c and locking.c

-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre



