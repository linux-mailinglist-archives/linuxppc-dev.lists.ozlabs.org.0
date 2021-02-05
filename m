Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BF2310813
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 10:42:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DX9Sb2lQPzDvW1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 20:42:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=zlang@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ZgKWgkxl; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZgKWgkxl; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DX9R301BpzDvXp
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 20:41:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612518076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8QrhxMe/aR0VYkc/IHfZ3fbJw4aE7h35UEB4Yheg9u8=;
 b=ZgKWgkxl3++PRUYYlPrhVr98Z9tUUbOgiHVGpYnV6ES/YtVt5AZOGBdl9iqHvpnFkCNHeW
 mEBmT9/8YRxSB9a3xaBc+mz9jkHfBOlumYfjpbGGIHvp8UqbC3rXzv+s9Nh1RSsgLJrt08
 jk13Ey7Be6mhdUfeMCs1xdmz1KXZ3vc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612518076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8QrhxMe/aR0VYkc/IHfZ3fbJw4aE7h35UEB4Yheg9u8=;
 b=ZgKWgkxl3++PRUYYlPrhVr98Z9tUUbOgiHVGpYnV6ES/YtVt5AZOGBdl9iqHvpnFkCNHeW
 mEBmT9/8YRxSB9a3xaBc+mz9jkHfBOlumYfjpbGGIHvp8UqbC3rXzv+s9Nh1RSsgLJrt08
 jk13Ey7Be6mhdUfeMCs1xdmz1KXZ3vc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-2zD192IzPCaj7e6tkbzt0g-1; Fri, 05 Feb 2021 04:41:12 -0500
X-MC-Unique: 2zD192IzPCaj7e6tkbzt0g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34C4C8710E2;
 Fri,  5 Feb 2021 09:41:10 +0000 (UTC)
Received: from localhost (unknown [10.66.61.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C1A160C15;
 Fri,  5 Feb 2021 09:41:08 +0000 (UTC)
Date: Fri, 5 Feb 2021 17:58:20 +0800
From: Zorro Lang <zlang@redhat.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/kuap: Allow kernel thread to access userspace
 after kthread_use_mm
Message-ID: <20210205095820.GI14354@localhost.localdomain>
References: <20210205030426.430331-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20210205030426.430331-1-aneesh.kumar@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=zlang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Jens Axboe <axboe@kernel.dk>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 05, 2021 at 08:34:26AM +0530, Aneesh Kumar K.V wrote:
> This fix the bad fault reported by KUAP when io_wqe_worker access userspace.
> 
>  Bug: Read fault blocked by KUAP!
>  WARNING: CPU: 1 PID: 101841 at arch/powerpc/mm/fault.c:229 __do_page_fault+0x6b4/0xcd0
>  NIP [c00000000009e7e4] __do_page_fault+0x6b4/0xcd0
>  LR [c00000000009e7e0] __do_page_fault+0x6b0/0xcd0
> ..........
>  Call Trace:
>  [c000000016367330] [c00000000009e7e0] __do_page_fault+0x6b0/0xcd0 (unreliable)
>  [c0000000163673e0] [c00000000009ee3c] do_page_fault+0x3c/0x120
>  [c000000016367430] [c00000000000c848] handle_page_fault+0x10/0x2c
>  --- interrupt: 300 at iov_iter_fault_in_readable+0x148/0x6f0
> ..........
>  NIP [c0000000008e8228] iov_iter_fault_in_readable+0x148/0x6f0
>  LR [c0000000008e834c] iov_iter_fault_in_readable+0x26c/0x6f0
>  interrupt: 300
>  [c0000000163677e0] [c0000000007154a0] iomap_write_actor+0xc0/0x280
>  [c000000016367880] [c00000000070fc94] iomap_apply+0x1c4/0x780
>  [c000000016367990] [c000000000710330] iomap_file_buffered_write+0xa0/0x120
>  [c0000000163679e0] [c00800000040791c] xfs_file_buffered_aio_write+0x314/0x5e0 [xfs]
>  [c000000016367a90] [c0000000006d74bc] io_write+0x10c/0x460
>  [c000000016367bb0] [c0000000006d80e4] io_issue_sqe+0x8d4/0x1200
>  [c000000016367c70] [c0000000006d8ad0] io_wq_submit_work+0xc0/0x250
>  [c000000016367cb0] [c0000000006e2578] io_worker_handle_work+0x498/0x800
>  [c000000016367d40] [c0000000006e2cdc] io_wqe_worker+0x3fc/0x4f0
>  [c000000016367da0] [c0000000001cb0a4] kthread+0x1c4/0x1d0
>  [c000000016367e10] [c00000000000dbf0] ret_from_kernel_thread+0x5c/0x6c
> 
> The kernel consider thread AMR value for kernel thread to be
> AMR_KUAP_BLOCKED. Hence access to userspace is denied. This
> of course not correct and we should allow userspace access after
> kthread_use_mm(). To be precise, kthread_use_mm() should inherit the
> AMR value of the operating address space. But, the AMR value is
> thread-specific and we inherit the address space and not thread
> access restrictions. Because of this ignore AMR value when accessing
> userspace via kernel thread.
> 
> Cc: Zorro Lang <zlang@redhat.com>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---

Hi,

Simply test on ppc64le with latest 5.11.0-rc6+.

1) Reproduced this bug at first:
# ./check generic/013
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/ppc64le ibm-p9z-xxx-xxx 5.11.0-rc6+ #2 SMP Fri Feb 5 01:40:25 EST 2021
MKFS_OPTIONS  -- -f -m crc=1,finobt=1,rmapbt=1,reflink=1,inobtcount=1,bigtime=1 /dev/sda3
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/sda3 /mnt/xfstests/scratch

generic/013 49s ... _check_dmesg: something found in dmesg (see /var/lib/xfstests/results//generic/013.dmesg)

Ran: generic/013
Failures: generic/013
Failed 1 of 1 tests

# cat results//generic/013.dmesg
...
[ 4261.095623] Kernel attempted to read user page (1003a0648b0) - exploit attempt? (uid: 0) 
[ 4261.095640] ------------[ cut here ]------------ 
[ 4261.095643] Bug: Read fault blocked by KUAP! 
[ 4261.095647] WARNING: CPU: 7 PID: 287137 at arch/powerpc/mm/fault.c:229 bad_kernel_fault+0x180/0x310 
...
...

2) Test passed on the kernel with this patch:
# ./check generic/013 generic/051
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/ppc64le ibm-p9z-xx-xxx 5.11.0-rc6+ #3 SMP Fri Feb 5 02:44:31 EST 2021
MKFS_OPTIONS  -- -f -m crc=1,finobt=1,rmapbt=1,reflink=1,inobtcount=1,bigtime=1 /dev/sda3
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/sda3 /mnt/xfstests/scratch

generic/013 49s ...  42s
generic/051      87s
Ran: generic/013 generic/051
Passed all 2 tests

3) But when I just gave it a little more test, a test case hang and trigger a kernel BUG as below.
I thought it's a regression issue from this patch.
https://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git/tree/tests/generic/617

# ./check generic/616 generic/617
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/ppc64le ibm-p9z-xx-xxx 5.11.0-rc6+ #3 SMP Fri Feb 5 02:44:31 EST 2021
MKFS_OPTIONS  -- -f -m crc=1,finobt=1,rmapbt=1,reflink=1,inobtcount=1,bigtime=1 /dev/sda3
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/sda3 /mnt/xfstests/scratch

generic/616      170s
generic/617     ^C^C^C^C

# dmesg
...
[  530.180466] run fstests generic/617 at 2021-02-05 03:41:10
[  530.707969] ------------[ cut here ]------------
[  530.708006] kernel BUG at arch/powerpc/include/asm/book3s/64/kup.h:207!
[  530.708013] Oops: Exception in kernel mode, sig: 5 [#1]
[  530.708018] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
[  530.708022] Modules linked in: bonding rfkill sunrpc uio_pdrv_genirq pseries_rng uio drm fuse drm_panel_orientation_quirks ip_tables xfs libcrc32c sd_mod t10_pi ibmvscsi ibmveth scsi_trans
port_srp xts vmx_crypto
[  530.708049] CPU: 13 PID: 5587 Comm: io_wqe_worker-0 Not tainted 5.11.0-rc6+ #3
[  530.708055] NIP:  c0000000000aa0c8 LR: c0000000004b9278 CTR: 0000000000000000
[  530.708059] REGS: c00000001c4ef150 TRAP: 0700   Not tainted  (5.11.0-rc6+)
[  530.708064] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24022804  XER: 2004000a
[  530.708079] CFAR: c0000000000aa494 IRQMASK: 1 
               GPR00: c0000000004b9278 c00000001c4ef3f0 c000000002127000 0000000000000000 
               GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000008 
               GPR08: 0000000000000000 000000000000003e 0000000000000001 ffffffffffffffff 
               GPR12: 0000000044022804 c00000001ec7d200 00301d1c00000080 c000000002201a78 
               GPR16: 00007fffa0930000 c00000001c4ef5d4 0000000000000000 0000000000000000 
               GPR20: 0000000008000000 0008000000000040 07000000000000c0 00007fffa0930000 
               GPR24: c00000002d889f80 0000000000000002 0000000000000000 c0800000460b0386 
               GPR28: 0000000000000004 00007fffa0920000 c00000001c1d3490 86030b46000080c0 
[  530.708139] NIP [c0000000000aa0c8] pkey_access_permitted+0x28/0x90
[  530.708146] LR [c0000000004b9278] gup_pte_range+0x188/0x420
[  530.708152] Call Trace:
[  530.708154] [c00000001c4ef490] [c0000000004bd39c] gup_pgd_range+0x3ac/0xa20
[  530.708160] [c00000001c4ef5a0] [c0000000004bdd44] internal_get_user_pages_fast+0x334/0x410
[  530.708167] [c00000001c4ef620] [c000000000852028] iov_iter_get_pages+0xf8/0x5c0
[  530.708173] [c00000001c4ef6a0] [c0000000007da44c] bio_iov_iter_get_pages+0xec/0x700
[  530.708180] [c00000001c4ef770] [c0000000006a325c] iomap_dio_bio_actor+0x2ac/0x4f0
[  530.708186] [c00000001c4ef810] [c00000000069cd94] iomap_apply+0x2b4/0x740
[  530.708191] [c00000001c4ef920] [c0000000006a38b8] __iomap_dio_rw+0x238/0x5c0
[  530.708197] [c00000001c4ef9d0] [c0000000006a3c60] iomap_dio_rw+0x20/0x80
[  530.708203] [c00000001c4ef9f0] [c008000001927a30] xfs_file_dio_aio_write+0x1f8/0x650 [xfs]
[  530.708273] [c00000001c4efa60] [c0080000019284dc] xfs_file_write_iter+0xc4/0x130 [xfs]
[  530.708340] [c00000001c4efa90] [c000000000669984] io_write+0x104/0x4b0
[  530.708346] [c00000001c4efbb0] [c00000000066cea4] io_issue_sqe+0x3d4/0xf50
[  530.708352] [c00000001c4efc60] [c000000000670200] io_wq_submit_work+0xb0/0x2f0
[  530.708358] [c00000001c4efcb0] [c000000000674268] io_worker_handle_work+0x248/0x4a0
[  530.708364] [c00000001c4efd30] [c0000000006746e8] io_wqe_worker+0x228/0x2a0
[  530.708369] [c00000001c4efda0] [c00000000019d994] kthread+0x1b4/0x1c0
[  530.708375] [c00000001c4efe10] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
[  530.708381] Instruction dump:
[  530.708384] 60000000 60000000 7c0802a6 60000000 e94d0968 e90a2970 2c250000 5463083c
[  530.708395] 2123003e 7d0a0074 794ad182 4082004c <0b0a0000> 2c240000 e9480168 4082001c
[  530.708407] ---[ end trace 346ddedf8bc4b5b3 ]---
[  530.710799] BUG: sleeping function called from invalid context at include/linux/percpu-rwsem.h:49                                                                                          
[  530.710803] in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 5587, name: io_wqe_worker-0                                                                                             
[  530.710808] INFO: lockdep is turned off.
[  530.710811] irq event stamp: 124
[  530.710814] hardirqs last  enabled at (123): [<c000000000fb8874>] _raw_spin_unlock_irqrestore+0x94/0xd0                                                                                    
[  530.710821] hardirqs last disabled at (124): [<c0000000004bdd28>] internal_get_user_pages_fast+0x318/0x410
[  530.710827] softirqs last  enabled at (0): [<c00000000015abc8>] copy_process+0x688/0x1600
[  530.710833] softirqs last disabled at (0): [<0000000000000000>] 0x0
[  530.710838] CPU: 13 PID: 5587 Comm: io_wqe_worker-0 Tainted: G      D           5.11.0-rc6+ #3
[  530.710844] Call Trace:
[  530.710846] [c00000001c4eee20] [c0000000008a6a14] dump_stack+0xe8/0x144 (unreliable)
[  530.710854] [c00000001c4eee70] [c0000000001b0898] ___might_sleep+0x2e8/0x300
[  530.710861] [c00000001c4eef00] [c00000000017e31c] exit_signals+0x4c/0x490
[  530.710867] [c00000001c4eef50] [c000000000168b38] do_exit+0x108/0x740
[  530.710873] [c00000001c4eefe0] [c00000000002c3dc] oops_end+0x18c/0x1c0
[  530.710880] [c00000001c4ef060] [c00000000002e7c4] program_check_exception+0x2c4/0x3c0
[  530.710886] [c00000001c4ef0e0] [c0000000000098fc] program_check_common_virt+0x30c/0x360
[  530.710893] --- interrupt: 700 at pkey_access_permitted+0x28/0x90
[  530.710898] NIP:  c0000000000aa0c8 LR: c0000000004b9278 CTR: 0000000000000000
[  530.710902] REGS: c00000001c4ef150 TRAP: 0700   Tainted: G      D            (5.11.0-rc6+)
[  530.710907] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24022804  XER: 2004000a                                                                                          
[  530.710922] CFAR: c0000000000aa494 IRQMASK: 1
               GPR00: c0000000004b9278 c00000001c4ef3f0 c000000002127000 0000000000000000
               GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000008
               GPR08: 0000000000000000 000000000000003e 0000000000000001 ffffffffffffffff
               GPR12: 0000000044022804 c00000001ec7d200 00301d1c00000080 c000000002201a78
               GPR16: 00007fffa0930000 c00000001c4ef5d4 0000000000000000 0000000000000000
               GPR20: 0000000008000000 0008000000000040 07000000000000c0 00007fffa0930000
               GPR24: c00000002d889f80 0000000000000002 0000000000000000 c0800000460b0386
               GPR28: 0000000000000004 00007fffa0920000 c00000001c1d3490 86030b46000080c0
[  530.710980] NIP [c0000000000aa0c8] pkey_access_permitted+0x28/0x90
[  530.710985] LR [c0000000004b9278] gup_pte_range+0x188/0x420
[  530.710989] --- interrupt: 700
[  530.710992] [c00000001c4ef3f0] [0000000000000000] 0x0 (unreliable)
[  530.710997] [c00000001c4ef490] [c0000000004bd39c] gup_pgd_range+0x3ac/0xa20
[  530.711003] [c00000001c4ef5a0] [c0000000004bdd44] internal_get_user_pages_fast+0x334/0x410
[  530.711009] [c00000001c4ef620] [c000000000852028] iov_iter_get_pages+0xf8/0x5c0
[  530.711016] [c00000001c4ef6a0] [c0000000007da44c] bio_iov_iter_get_pages+0xec/0x700
[  530.711021] [c00000001c4ef770] [c0000000006a325c] iomap_dio_bio_actor+0x2ac/0x4f0
[  530.711027] [c00000001c4ef810] [c00000000069cd94] iomap_apply+0x2b4/0x740
[  530.711032] [c00000001c4ef920] [c0000000006a38b8] __iomap_dio_rw+0x238/0x5c0
[  530.711038] [c00000001c4ef9d0] [c0000000006a3c60] iomap_dio_rw+0x20/0x80
[  530.711044] [c00000001c4ef9f0] [c008000001927a30] xfs_file_dio_aio_write+0x1f8/0x650 [xfs]
[  530.711115] [c00000001c4efa60] [c0080000019284dc] xfs_file_write_iter+0xc4/0x130 [xfs]
[  530.711180] [c00000001c4efa90] [c000000000669984] io_write+0x104/0x4b0
[  530.711186] [c00000001c4efbb0] [c00000000066cea4] io_issue_sqe+0x3d4/0xf50
[  530.711192] [c00000001c4efc60] [c000000000670200] io_wq_submit_work+0xb0/0x2f0
[  530.711198] [c00000001c4efcb0] [c000000000674268] io_worker_handle_work+0x248/0x4a0
[  530.711204] [c00000001c4efd30] [c0000000006746e8] io_wqe_worker+0x228/0x2a0
[  530.711210] [c00000001c4efda0] [c00000000019d994] kthread+0x1b4/0x1c0
[  530.711215] [c00000001c4efe10] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
[  530.807015] ------------[ cut here ]------------
[  530.807020] WARNING: CPU: 13 PID: 0 at kernel/kthread.c:97 free_kthread_struct+0x44/0x60
[  530.807027] Modules linked in: bonding rfkill sunrpc uio_pdrv_genirq pseries_rng uio drm fuse drm_panel_orientation_quirks ip_tables xfs libcrc32c sd_mod t10_pi ibmvscsi ibmveth scsi_transport_srp xts vmx_crypto
[  530.807051] CPU: 13 PID: 0 Comm: swapper/13 Tainted: G      D W         5.11.0-rc6+ #3
[  530.807056] NIP:  c00000000019fe04 LR: c000000000158fa8 CTR: c0000000007821a0
[  530.807060] REGS: c0000000086d3410 TRAP: 0700   Tainted: G      D W          (5.11.0-rc6+)
[  530.807065] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 82022888  XER: 20040007
[  530.807077] CFAR: c000000000158fa4 IRQMASK: 0
               GPR00: c000000000158fa8 c0000000086d36b0 c000000002127000 c000000025db6c00
               GPR04: c0000000001a1fb4 c000000021827c00 ffffffffffffffff 0000000000000000
               GPR08: 0000000000000000 c000000003815208 0000000000000000 000000000000000d
               GPR12: 0000000000002000 c00000001ec7d200 0000000000000001 000000001ef2d9a0
               GPR16: c000000002157a00 00000001000059d4 c00000000159b910 c0000000017e8480
               GPR20: c00000000025a374 c000000001fad680 0000000000000000 c00000047b159ea0
               GPR24: c00000000025a374 000000000000000a c0000000086d3760 c00000047b159e00
               GPR28: c000000002180820 c0000000021802c8 c000000021827c00 c000000021827c00
[  530.807135] NIP [c00000000019fe04] free_kthread_struct+0x44/0x60
[  530.807140] LR [c000000000158fa8] free_task+0x98/0xe0
[  530.807145] Call Trace:
[  530.807147] [c0000000086d36b0] [c00000000036e838] ftrace_graph_exit_task+0x28/0x40 (unreliable)                                                                                            
[  530.807156] [c0000000086d36d0] [c000000000158fa8] free_task+0x98/0xe0
[  530.807162] [c0000000086d3700] [c00000000016557c] delayed_put_task_struct+0x16c/0x270
[  530.807168] [c0000000086d3740] [c00000000025a3d8] rcu_do_batch+0x268/0x750
[  530.807175] [c0000000086d37e0] [c00000000025b04c] rcu_core+0x36c/0x4a0
[  530.807180] [c0000000086d3840] [c000000000fb9a30] __do_softirq+0x190/0x718
[  530.807187] [c0000000086d3950] [c00000000016b008] __irq_exit_rcu+0x218/0x260
[  530.807193] [c0000000086d3980] [c00000000016b280] irq_exit+0x20/0x50
[  530.807199] [c0000000086d39a0] [c00000000002b730] timer_interrupt+0x1a0/0x520
[  530.807206] [c0000000086d3a10] [c000000000009dd8] decrementer_common_virt+0x1d8/0x1e0
[  530.807212] --- interrupt: 900 at plpar_hcall_norets+0x1c/0x28
[  530.807218] NIP:  c0000000000fe900 LR: c000000000c05c94 CTR: 0000000000000000
[  530.807222] REGS: c0000000086d3a80 TRAP: 0900   Tainted: G      D W          (5.11.0-rc6+)
[  530.807226] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24000888  XER: 20040007
[  530.807238] CFAR: 0000000000000c00 IRQMASK: 0
               GPR00: 0000000000000000 c0000000086d3d20 c000000002127000 0000000000000000 
               GPR04: 000000000000000e 0000000000000300 0000000000000400 000000000000ffff 
               GPR08: 0000000000000000 000a000000000000 00000000000e0380 0000000000000001 
               GPR12: 00000000000dd080 c00000001ec7d200 0000000000000000 000000001ef2d9a0 
               GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
               GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000001 
               GPR24: 000000000000000d 0000000000000000 0000007b95f781fe 0000000000000001 
               GPR28: 0000000000000000 0000000000000001 c000000001596fd8 c000000001596fe0 
[  530.807296] NIP [c0000000000fe900] plpar_hcall_norets+0x1c/0x28
[  530.807301] LR [c000000000c05c94] check_and_cede_processor.part.0+0x24/0x70
[  530.807307] --- interrupt: 900
[  530.807309] [c0000000086d3d20] [0000000000000000] 0x0 (unreliable)
[  530.807315] [c0000000086d3d80] [c000000000c062b4] dedicated_cede_loop+0x164/0x210
[  530.807321] [c0000000086d3dc0] [c000000000c02cbc] cpuidle_enter_state+0x2bc/0x500
[  530.807327] [c0000000086d3e20] [c000000000c02f9c] cpuidle_enter+0x4c/0x70
[  530.807332] [c0000000086d3e60] [c0000000001c7c90] cpuidle_idle_call+0x1c0/0x2f0
[  530.807338] [c0000000086d3eb0] [c0000000001c7f34] do_idle+0x174/0x230
[  530.807344] [c0000000086d3f10] [c0000000001c83ec] cpu_startup_entry+0x3c/0x40
[  530.807351] [c0000000086d3f40] [c000000000060b38] start_secondary+0x278/0x280
[  530.807357] [c0000000086d3f90] [c00000000000cb54] start_secondary_prolog+0x10/0x14
[  530.807362] Instruction dump:
[  530.807366] f8010010 f821ffe1 81230114 6d290020 79295fe2 0b090000 e86307f8 2c230000 
[  530.807376] 41820014 e92300e0 2c290000 41820008 <0fe00000> 483a3231 60000000 38210020 
[  530.807387] irq event stamp: 1487390
[  530.807390] hardirqs last  enabled at (1487389): [<c00000000029cb84>] tick_nohz_idle_exit+0x94/0x200
[  530.807396] hardirqs last disabled at (1487390): [<c000000000fae964>] __schedule+0x344/0x8b0
[  530.807402] softirqs last  enabled at (1487378): [<c000000000fb9f48>] __do_softirq+0x6a8/0x718
[  530.807409] softirqs last disabled at (1487373): [<c00000000016b008>] __irq_exit_rcu+0x218/0x260
[  530.807414] ---[ end trace 346ddedf8bc4b5b4 ]---




>  arch/powerpc/include/asm/book3s/64/kup.h | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
> index f50f72e535aa..2064621ae7b6 100644
> --- a/arch/powerpc/include/asm/book3s/64/kup.h
> +++ b/arch/powerpc/include/asm/book3s/64/kup.h
> @@ -202,22 +202,16 @@ DECLARE_STATIC_KEY_FALSE(uaccess_flush_key);
>  #include <asm/mmu.h>
>  #include <asm/ptrace.h>
>  
> -/*
> - * For kernel thread that doesn't have thread.regs return
> - * default AMR/IAMR values.
> - */
>  static inline u64 current_thread_amr(void)
>  {
> -	if (current->thread.regs)
> -		return current->thread.regs->amr;
> -	return AMR_KUAP_BLOCKED;
> +	VM_BUG_ON(!current->thread.regs);
> +	return current->thread.regs->amr;
>  }
>  
>  static inline u64 current_thread_iamr(void)
>  {
> -	if (current->thread.regs)
> -		return current->thread.regs->iamr;
> -	return AMR_KUEP_BLOCKED;
> +	VM_BUG_ON(!current->thread.regs);
> +	return current->thread.regs->iamr;
>  }
>  #endif /* CONFIG_PPC_PKEY */
>  
> @@ -384,7 +378,14 @@ static __always_inline void allow_user_access(void __user *to, const void __user
>  	// This is written so we can resolve to a single case at build time
>  	BUILD_BUG_ON(!__builtin_constant_p(dir));
>  
> -	if (mmu_has_feature(MMU_FTR_PKEY))
> +	/*
> +	 * Kernel threads may access user mm with kthread_use_mm() but
> +	 * can't use current_thread_amr because they have thread.regs==NULL,
> +	 * but they have no pkeys.
> +	 */
> +	if (current->flags & PF_KTHREAD)
> +		thread_amr = 0;
> +	else if (mmu_has_feature(MMU_FTR_PKEY))
>  		thread_amr = current_thread_amr();
>  
>  	if (dir == KUAP_READ)
> -- 
> 2.29.2
> 

