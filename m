Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBA3A66C9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 12:52:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N3gM6m10zDqRp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 20:52:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.com
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=nborisov@suse.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.com
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N3PM0rmQzDqTV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 20:40:05 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A71E6AD46;
 Tue,  3 Sep 2019 10:40:00 +0000 (UTC)
Subject: Re: [mainline][BUG][PPC][btrfs][bisected 00801a] kernel BUG at
 fs/btrfs/locking.c:71!
To: Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <1567500907.5082.12.camel@abdul>
From: Nikolay Borisov <nborisov@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=nborisov@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <7139ac07-db63-b984-c416-d1c94337c9bf@suse.com>
Date: Tue, 3 Sep 2019 13:39:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567500907.5082.12.camel@abdul>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
 linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3.09.19 г. 11:55 ч., Abdul Haleem wrote:
> Greeting's
> 
> Mainline kernel panics with LTP/fs_fill-dir tests for btrfs file system on my P9 box running mainline kernel 5.3.0-rc5
> 
> BUG_ON was first introduced by below commit
> 
> commit 00801ae4bb2be5f5af46502ef239ac5f4b536094
> Author: David Sterba <dsterba@suse.com>
> Date:   Thu May 2 16:53:47 2019 +0200
> 
>     btrfs: switch extent_buffer write_locks from atomic to int
>     
>     The write_locks is either 0 or 1 and always updated under the lock,
>     so we don't need the atomic_t semantics.
>     
>     Reviewed-by: Nikolay Borisov <nborisov@suse.com>
>     Signed-off-by: David Sterba <dsterba@suse.com>
> 
> diff --git a/fs/btrfs/locking.c b/fs/btrfs/locking.c
> index 2706676279..98fccce420 100644
> --- a/fs/btrfs/locking.c
> +++ b/fs/btrfs/locking.c
> @@ -58,17 +58,17 @@ static void btrfs_assert_tree_read_locked(struct
> extent_buffer *eb)
>  
>  static void btrfs_assert_tree_write_locks_get(struct extent_buffer *eb)
>  {
> -       atomic_inc(&eb->write_locks);
> +       eb->write_locks++;
>  }
>  
>  static void btrfs_assert_tree_write_locks_put(struct extent_buffer *eb)
>  {
> -       atomic_dec(&eb->write_locks);
> +       eb->write_locks--;
>  }
>  
>  void btrfs_assert_tree_locked(struct extent_buffer *eb)
>  {
> -       BUG_ON(!atomic_read(&eb->write_locks));
> +       BUG_ON(!eb->write_locks);
>  }
>  
> 
> tests logs:
> avocado-misc-tests/io/disk/ltp_fs.py:LtpFs.test_fs_run;fs_fill-dir-ext3-61cd:  [ 3376.022096] EXT4-fs (nvme0n1): mounting ext3 file system using the ext4 subsystem
> EXT4-fs (nvme0n1): mounted filesystem with ordered data mode. Opts: (null)
> EXT4-fs (loop1): mounting ext2 file system using the ext4 subsystem
> EXT4-fs (loop1): mounted filesystem without journal. Opts: (null)
> EXT4-fs (loop1): mounting ext3 file system using the ext4 subsystem
> EXT4-fs (loop1): mounted filesystem with ordered data mode. Opts: (null)
> EXT4-fs (loop1): mounted filesystem with ordered data mode. Opts: (null)
> XFS (loop1): Mounting V5 Filesystem
> XFS (loop1): Ending clean mount
> XFS (loop1): Unmounting Filesystem
> BTRFS: device fsid 7c08f81b-6642-4a06-9182-2884e80d56ee devid 1 transid 5 /dev/loop1
> BTRFS info (device loop1): disk space caching is enabled
> BTRFS info (device loop1): has skinny extents
> BTRFS info (device loop1): enabling ssd optimizations
> BTRFS info (device loop1): creating UUID tree
> ------------[ cut here ]------------
> kernel BUG at fs/btrfs/locking.c:71!
> Oops: Exception in kernel mode, sig: 5 [#1]
> LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> Dumping ftrace buffer:
>    (ftrace buffer empty)
> Modules linked in: fuse(E) vfat(E) fat(E) btrfs(E) xor(E)
> zstd_decompress(E) zstd_compress(E) raid6_pq(E) xfs(E) raid0(E)
> linear(E) dm_round_robin(E) dm_queue_length(E) dm_service_time(E)
> dm_multipath(E) loop(E) rpadlpar_io(E) rpaphp(E) lpfc(E) bnx2x(E)
> xt_CHECKSUM(E) xt_MASQUERADE(E) tun(E) bridge(E) stp(E) llc(E) kvm_pr(E)
> kvm(E) tcp_diag(E) udp_diag(E) inet_diag(E) unix_diag(E)
> af_packet_diag(E) netlink_diag(E) ip6t_rpfilter(E) ipt_REJECT(E)
> nf_reject_ipv4(E) ip6t_REJECT(E) nf_reject_ipv6(E) xt_conntrack(E)
> ip_set(E) nfnetlink(E) ebtable_nat(E) ebtable_broute(E) ip6table_nat(E)
> ip6table_mangle(E) ip6table_security(E) ip6table_raw(E) iptable_nat(E)
> nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E)
> iptable_mangle(E) iptable_security(E) iptable_raw(E) ebtable_filter(E)
> ebtables(E) ip6table_filter(E) ip6_tables(E) iptable_filter(E) sunrpc(E)
> raid10(E) xts(E) pseries_rng(E) vmx_crypto(E) sg(E) uio_pdrv_genirq(E)
> uio(E) binfmt_misc(E) sch_fq_codel(E) ip_tables(E)
>  ext4(E) mbcache(E) jbd2(E) sr_mod(E) cdrom(E) sd_mod(E) ibmvscsi(E)
> scsi_transport_srp(E) ibmveth(E) nvmet_fc(E) nvmet(E) nvme_fc(E)
> nvme_fabrics(E) scsi_transport_fc(E) mdio(E) libcrc32c(E) ptp(E)
> pps_core(E) nvme(E) nvme_core(E) dm_mirror(E) dm_region_hash(E)
> dm_log(E) dm_mod(E) [last unloaded: lpfc]
> CPU: 14 PID: 1803 Comm: kworker/u32:8 Tainted: G            E     5.3.0-rc5-autotest-autotest #1
> Workqueue: btrfs-endio-write btrfs_endio_write_helper [btrfs]
> NIP:  c00800000164dd70 LR: c00800000164df00 CTR: c000000000a817a0
> REGS: c00000000260b5d0 TRAP: 0700   Tainted: G            E      (5.3.0-rc5-autotest-autotest)
> MSR:  8000000102029033 <SF,VEC,EE,ME,IR,DR,RI,LE,TM[E]>  CR: 22444082  XER: 00000000
> CFAR: c00800000164defc IRQMASK: 0
> GPR00: c0080000015c55f4 c00000000260b860 c008000001703b00 c000000267a29af0
> GPR04: 0000000000000000 0000000000000001 0000000000000000 0000000000000000
> GPR08: 0000000000000000 0000000000000001 0000000000000000 0000000000000004
> GPR12: 0000000000004000 c00000001ec58e00 0000000000000000 0000000000000000
> GPR16: 0000000000010000 0000000000000004 0000000000000001 0000000000000001
> GPR20: 0000000000000000 0000000000000001 000000003e0f83e1 c00000025a7cbef0
> GPR24: c00000000260ba26 0000000040000000 c0000000014a26e8 0000000000000003
> GPR28: 0000000000000004 c00000025f2010a0 c000000267a29af0 0000000000000000
> NIP [c00800000164dd70] btrfs_assert_tree_locked+0x10/0x20 [btrfs]
> LR [c00800000164df00] btrfs_set_lock_blocking_write+0x60/0x100 [btrfs]
> Call Trace:
> [c00000000260b860] [c00000000260b8e0] 0xc00000000260b8e0 (unreliable)
> [c00000000260b890] [c0080000015c55f4] btrfs_set_path_blocking+0xb4/0xc0 [btrfs]
> [c00000000260b8e0] [c0080000015cb808] btrfs_search_slot+0x8e8/0xb80 [btrfs]

Can you provide the line numbers btrfs_search_slot+0x8e8/0xb80
corresponds to?

