Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF683085E7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 07:37:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRnhH5nWpzDqRC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 17:37:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=zlang@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=enhNVCq5; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=enhNVCq5; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRnf10Z37zDrvG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jan 2021 17:35:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611902131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Vng7G3bBwDMQSPUkW5HsTZN/BB7r+0RH/jTQUEwwIM=;
 b=enhNVCq5pP4OymuR5aHkouNMX9WjhJLDeP1uIgDJcHZmCiNRez64Hx5/ZGNaHOVbL2Iya2
 At91S0xOyTRvk9SmEn7KUu21JulzUgNxqXy+piNeaexQULd2dC5qYxli/lQp9p0GCwlzKo
 I7qSXVdnzncn1TpMyjagfjRrkHV68hk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611902131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Vng7G3bBwDMQSPUkW5HsTZN/BB7r+0RH/jTQUEwwIM=;
 b=enhNVCq5pP4OymuR5aHkouNMX9WjhJLDeP1uIgDJcHZmCiNRez64Hx5/ZGNaHOVbL2Iya2
 At91S0xOyTRvk9SmEn7KUu21JulzUgNxqXy+piNeaexQULd2dC5qYxli/lQp9p0GCwlzKo
 I7qSXVdnzncn1TpMyjagfjRrkHV68hk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-bkglttZrMHCz6GJmrBJNZw-1; Fri, 29 Jan 2021 01:35:26 -0500
X-MC-Unique: bkglttZrMHCz6GJmrBJNZw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3426110054FF;
 Fri, 29 Jan 2021 06:35:25 +0000 (UTC)
Received: from localhost (unknown [10.66.61.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F1EB10074E1;
 Fri, 29 Jan 2021 06:35:23 +0000 (UTC)
Date: Fri, 29 Jan 2021 14:52:20 +0800
From: Zorro Lang <zlang@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/fault: fix wrong KUAP fault for IO_URING
Message-ID: <20210129065220.GS14354@localhost.localdomain>
References: <20210127145648.348135-1-zlang@redhat.com>
 <cce83328-d996-defc-6c87-97cd24ec7027@csgroup.eu>
 <a8013c71-433a-96b3-c657-66ac2ba5b838@kernel.dk>
 <1611792928.nw4g8h8kj4.astroid@bobo.none>
 <20210128031355.GP14354@localhost.localdomain>
 <66061f75-c8de-c1eb-aaaf-9594a31be790@kernel.dk>
 <20210128135220.GQ14354@localhost.localdomain>
 <aedb880b-da2b-ec29-3b66-66f01733be9b@kernel.dk>
 <17ae2706-fe95-a5de-b9da-e3480800daf7@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <17ae2706-fe95-a5de-b9da-e3480800daf7@csgroup.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=zlang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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
Cc: Jens Axboe <axboe@kernel.dk>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 28, 2021 at 03:44:21PM +0100, Christophe Leroy wrote:
> 
> 
> Le 28/01/2021 à 15:42, Jens Axboe a écrit :
> > On 1/28/21 6:52 AM, Zorro Lang wrote:
> > > On Wed, Jan 27, 2021 at 08:06:37PM -0700, Jens Axboe wrote:
> > > > On 1/27/21 8:13 PM, Zorro Lang wrote:
> > > > > On Thu, Jan 28, 2021 at 10:18:07AM +1000, Nicholas Piggin wrote:
> > > > > > Excerpts from Jens Axboe's message of January 28, 2021 5:29 am:
> > > > > > > On 1/27/21 9:38 AM, Christophe Leroy wrote:
> > > > > > > > 
> > > > > > > > 
> > > > > > > > Le 27/01/2021 à 15:56, Zorro Lang a écrit :
> > > > > > > > > On powerpc, io_uring test hit below KUAP fault on __do_page_fault.
> > > > > > > > > The fail source line is:
> > > > > > > > > 
> > > > > > > > >     if (unlikely(!is_user && bad_kernel_fault(regs, error_code, address, is_write)))
> > > > > > > > >         return SIGSEGV;
> > > > > > > > > 
> > > > > > > > > The is_user() is based on user_mod(regs) only. This's not suit for
> > > > > > > > > io_uring, where the helper thread can assume the user app identity
> > > > > > > > > and could perform this fault just fine. So turn to use mm to decide
> > > > > > > > > if this is valid or not.
> > > > > > > > 
> > > > > > > > I don't understand why testing is_user would be an issue. KUAP purpose
> > > > > > > > it to block any unallowed access from kernel to user memory
> > > > > > > > (Equivalent to SMAP on x86). So it really must be based on MSR_PR bit,
> > > > > > > > that is what is_user provides.
> > > > > > > > 
> > > > > > > > If the kernel access is legitimate, kernel should have opened
> > > > > > > > userspace access then you shouldn't get this "Bug: Read fault blocked
> > > > > > > > by KUAP!".
> > > > > > > > 
> > > > > > > > As far as I understand, the fault occurs in
> > > > > > > > iov_iter_fault_in_readable() which calls fault_in_pages_readable() And
> > > > > > > > fault_in_pages_readable() uses __get_user() so it is a legitimate
> > > > > > > > access and you really should get a KUAP fault.
> > > > > > > > 
> > > > > > > > So the problem is somewhere else, I think you proposed patch just
> > > > > > > > hides the problem, it doesn't fix it.
> > > > > > > 
> > > > > > > If we do kthread_use_mm(), can we agree that the user access is valid?
> > > > > > 
> > > > > > Yeah the io uring code is fine, provided it uses the uaccess primitives
> > > > > > like any other kernel code. It's looking more like a an arch/powerpc bug.
> > > > > > 
> > > > > > > We should be able to copy to/from user space, and including faults, if
> > > > > > > that's been done and the new mm assigned. Because it really should be.
> > > > > > > If SMAP was a problem on x86, we would have seen it long ago.
> > > > > > > 
> > > > > > > I'm assuming this may be breakage related to the recent uaccess changes
> > > > > > > related to set_fs and friends? Or maybe recent changes on the powerpc
> > > > > > > side?
> > > > > > > 
> > > > > > > Zorro, did 5.10 work?
> > > > > > 
> > > > > > Would be interesting to know.
> > > > > 
> > > > > Sure Nick and Jens, which 5.10 rc? version do you want to know ? Or any git
> > > > > commit(be the HEAD) in 5.10 phase?
> > > > 
> > > > I forget which versions had what series of this, but 5.10 final - and if
> > > > that fails, then 5.9 final. IIRC, 5.9 was pre any of these changes, and
> > > > 5.10 definitely has them.
> > > 
> > > I justed built linux v5.10 with same .config file, and gave it same test.
> > > v5.10 (HEAD=2c85ebc57b Linux 5.10) can't reproduce this bug:
> > > 
> > > # ./check generic/013 generic/051
> > > FSTYP         -- xfs (non-debug)
> > > PLATFORM      -- Linux/ppc64le ibm-p9z-xxx-xxxx 5.10.0 #3 SMP Thu Jan 28 04:12:14 EST 2021
> > > MKFS_OPTIONS  -- -f -m crc=1,finobt=1,reflink=1,rmapbt=1,bigtime=1,inobtcount=1 /dev/sda3
> > > MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/sda3 /mnt/xfstests/scratch
> > > 
> > > generic/013 138s ...  77s
> > > generic/051 103s ...  143s
> > > Ran: generic/013 generic/051
> > > Passed all 2 tests
> > 
> > Thanks for testing that, so I think it's safe to conclude that there's a
> > regression in powerpc fault handling for kthreads that use
> > kthread_use_mm in this release. A bisect would definitely find it, but
> > might be pointless if Christophe or Nick already have an idea of what it
> > is.
> > 
> 
> I don't have any idea yet, but I'd be curious to see the vmlinux binary matching the reported Oops.

I just upload the vmlinux and .config file, the vmlinux it too big, I have to
upload it to my google store and share the link as below:

config file: https://drive.google.com/file/d/1pMszboxdjbMPqSNXnMH-1UCZC-vtDnI9/view?usp=sharing
vmlinux: https://drive.google.com/file/d/1s7g2eBPAFFV61aM2dO9bvVTERGQ9mLYk/view?usp=sharing

I used latest upstream mainline linux, HEAD commit is:
76c057c84d (HEAD -> master, origin/master, origin/HEAD) Merge branch 'parisc-5.11-2' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux

The test failed on this kernel as:

# dmesg
[   96.200296] ------------[ cut here ]------------
[   96.200304] Bug: Read fault blocked by KUAP!
[   96.200309] WARNING: CPU: 3 PID: 1876 at arch/powerpc/mm/fault.c:229 bad_kernel_fault+0x180/0x310
[   96.200323] Modules linked in: bonding rfkill sunrpc pseries_rng uio_pdrv_genirq uio drm fuse drm_panel_orientation_quirks ip_tables xfs libcrc32c sd_mod t10_pi xts ibmvscsi ibmveth scsi_transport_srp vmx_crypto
[   96.200372] CPU: 3 PID: 1876 Comm: io_wqe_worker-0 Tainted: G        W         5.11.0-rc5+ #5
[   96.200380] NIP:  c00000000008f8a0 LR: c00000000008f89c CTR: 0000000000000000
[   96.200386] REGS: c00000000d3aafd0 TRAP: 0700   Tainted: G        W          (5.11.0-rc5+)
[   96.200393] MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 48082204  XER: 00000005
[   96.200416] CFAR: c00000000015ddac IRQMASK: 1 
               GPR00: c00000000008f89c c00000000d3ab270 c000000002116900 0000000000000020 
               GPR04: c000000001bec250 0000000000000001 00000001fbb80000 0000000000000027 
               GPR08: 0000000000000001 0000000000000000 c000000020fbba00 0000000000000001 
               GPR12: 0000000000002000 c00000001ecaae00 c00000000019dae8 c000000008d48040 
               GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
               GPR20: c0000000012d9650 fcffffffffffffff c000000002164018 c000000001262da0 
               GPR24: 0000000000000000 0000000000000000 0000000000000300 c000000010c27b80 
               GPR28: 0000000000200000 0000000000000000 0000010007ffce60 c00000000d3ab470 
[   96.200521] NIP [c00000000008f8a0] bad_kernel_fault+0x180/0x310
[   96.200528] LR [c00000000008f89c] bad_kernel_fault+0x17c/0x310
[   96.200535] Call Trace:
[   96.200539] [c00000000d3ab270] [c00000000008f89c] bad_kernel_fault+0x17c/0x310 (unreliable)
[   96.200551] [c00000000d3ab2f0] [c000000000090494] __do_page_fault+0x5f4/0x900
[   96.200561] [c00000000d3ab3b0] [c0000000000907dc] do_page_fault+0x3c/0x120
[   96.200570] [c00000000d3ab400] [c00000000000c748] handle_page_fault+0x10/0x2c
[   96.200579] --- interrupt: 300 at fault_in_pages_readable+0x104/0x350
[   96.200579] --- interrupt: 300 at fault_in_pages_readable+0x104/0x350
[   96.200586] NIP:  c000000000849424 LR: c00000000084952c CTR: c0000000006984a0
[   96.200592] REGS: c00000000d3ab470 TRAP: 0300   Tainted: G        W          (5.11.0-rc5+)
[   96.200598] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 44082804  XER: 00000001
[   96.200628] CFAR: c000000000010330 DAR: 0000010007ffce60 DSISR: 00200000 IRQMASK: 0 
               GPR00: c00000000084952c c00000000d3ab710 c000000002116900 0000000000000000 
               GPR04: c000000010c27ce0 0000000000000001 00000001fbb80000 0000000000010000 
               GPR08: 00000000271cd0a4 0000000000000200 0000000000000200 0000000000000000 
               GPR12: 0000000000002000 c00000001ecaae00 c00000000019dae8 c000000008d48040 
               GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
               GPR20: c0000000012d9650 fcffffffffffffff c000000002164018 c000000001262da0 
               GPR24: c000000020fbba00 bfffffffffffffff 0000000000000000 a8aaaaaaaaaaaaaa 
               GPR28: 0000010008005d71 c00000000bec3e00 0000000000000000 0000010007ffce60 
[   96.200734] NIP [c000000000849424] fault_in_pages_readable+0x104/0x350
[   96.200741] LR [c00000000084952c] fault_in_pages_readable+0x20c/0x350
[   96.200747] --- interrupt: 300
[   96.200752] [c00000000d3ab7a0] [c0000000008496d0] iov_iter_fault_in_readable+0x60/0x120
[   96.200761] [c00000000d3ab7e0] [c000000000698558] iomap_write_actor+0xb8/0x270
[   96.200771] [c00000000d3ab890] [c000000000693554] iomap_apply+0x2b4/0x740
[   96.200780] [c00000000d3ab9a0] [c000000000693dc0] iomap_file_buffered_write+0xa0/0x120
[   96.200790] [c00000000d3ab9f0] [c008000001d3efec] xfs_file_buffered_aio_write+0x354/0x590 [xfs]
[   96.200870] [c00000000d3aba90] [c0000000006691e4] io_write+0x104/0x4b0
[   96.200884] [c00000000d3abbb0] [c00000000066be54] io_issue_sqe+0x3d4/0xf50
[   96.200897] [c00000000d3abc60] [c00000000066f250] io_wq_submit_work+0xb0/0x2f0
[   96.200911] [c00000000d3abcb0] [c0000000006738a8] io_worker_handle_work+0x248/0x4a0
[   96.200925] [c00000000d3abd30] [c000000000673d28] io_wqe_worker+0x228/0x2a0
[   96.200939] [c00000000d3abda0] [c00000000019dc94] kthread+0x1b4/0x1c0
[   96.200950] [c00000000d3abe10] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
[   96.200959] Instruction dump:
[   96.200965] e87f0100 4810b155 60000000 2c230000 4182ffa8 409200ac 3c82ff15 38847e38 
[   96.200987] 3c62ff15 38637ed0 480ce4ad 60000000 <0fe00000> e8010090 38210080 38600001 
[   96.201008] irq event stamp: 46
[   96.201013] hardirqs last  enabled at (45): [<c0000000005428c4>] __slab_free+0x414/0x610
[   96.201021] hardirqs last disabled at (46): [<c000000000008a04>] data_access_common_virt+0x1a4/0x1c0
[   96.201030] softirqs last  enabled at (0): [<c00000000015ae68>] copy_process+0x688/0x1600
[   96.201038] softirqs last disabled at (0): [<0000000000000000>] 0x0
[   96.201045] ---[ end trace c2373fad985a304b ]---

# ./scripts/faddr2line vmlinux bad_kernel_fault+0x180/0x310
bad_kernel_fault+0x180/0x310:
bad_kernel_fault at arch/powerpc/mm/fault.c:229 (discriminator 6)

    217         // Read/write fault blocked by KUAP is bad, it can never succeed.
    218         if (bad_kuap_fault(regs, address, is_write)) {
    219                 pr_crit_ratelimited("Kernel attempted to %s user page (%lx) - exploit attempt? (uid: %d)\n",
    220                                     is_write ? "write" : "read", address,
    221                                     from_kuid(&init_user_ns, current_uid()));
    222 
    223                 // Fault on user outside of certain regions (eg. copy_tofrom_user()) is bad
    224                 if (!search_exception_tables(regs->nip))
    225                         return true;
    226 
    227                 // Read/write fault in a valid region (the exception table search passed
    228                 // above), but blocked by KUAP is bad, it can never succeed.
    229                 return WARN(true, "Bug: %s fault blocked by KUAP!", is_write ? "Write" : "Read");

Thanks,
Zorro

> 
> Christophe
> 

