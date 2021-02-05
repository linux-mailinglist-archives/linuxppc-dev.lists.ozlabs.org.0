Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D30310D75
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 16:56:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXKmD2YKLzDwlc
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 02:56:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=zlang@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=JDaD0R+c; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=JDaD0R+c; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXKkS46T4zDwkC
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Feb 2021 02:55:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612540509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2O9l3nGaR6zrQwfWPCKSlDbJGmyytt64HwlM4xQfCNo=;
 b=JDaD0R+ckjAwzozn+15GpFcMEsRfX+v0/U72xaBMx7RVKKA2jQDNCn5CiIu/oU2r7odBHu
 w5aaDjZn2b4TCeN7ssP3/jXi9vviGJ3sXZ+kDMsjpF06VasptR1rn/H3fpLixckB/w0Run
 0kibnYjHW28OXNvDDuROSZmZqtThROI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612540509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2O9l3nGaR6zrQwfWPCKSlDbJGmyytt64HwlM4xQfCNo=;
 b=JDaD0R+ckjAwzozn+15GpFcMEsRfX+v0/U72xaBMx7RVKKA2jQDNCn5CiIu/oU2r7odBHu
 w5aaDjZn2b4TCeN7ssP3/jXi9vviGJ3sXZ+kDMsjpF06VasptR1rn/H3fpLixckB/w0Run
 0kibnYjHW28OXNvDDuROSZmZqtThROI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-W3S2N8YkPHaKBkg7wnwbiQ-1; Fri, 05 Feb 2021 10:55:07 -0500
X-MC-Unique: W3S2N8YkPHaKBkg7wnwbiQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 473DD801975;
 Fri,  5 Feb 2021 15:55:06 +0000 (UTC)
Received: from localhost (unknown [10.66.61.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1B3760BF1;
 Fri,  5 Feb 2021 15:55:05 +0000 (UTC)
Date: Sat, 6 Feb 2021 00:12:18 +0800
From: Zorro Lang <zlang@redhat.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/kuap: Allow kernel thread to access userspace
 after kthread_use_mm
Message-ID: <20210205161218.GJ14354@localhost.localdomain>
References: <20210205030426.430331-1-aneesh.kumar@linux.ibm.com>
 <20210205095820.GI14354@localhost.localdomain>
 <871rdur5e7.fsf@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <871rdur5e7.fsf@linux.ibm.com>
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

On Fri, Feb 05, 2021 at 07:19:36PM +0530, Aneesh Kumar K.V wrote:
> Zorro Lang <zlang@redhat.com> writes:
> 
> ....
> 
> > ...
> > [  530.180466] run fstests generic/617 at 2021-02-05 03:41:10
> > [  530.707969] ------------[ cut here ]------------
> > [  530.708006] kernel BUG at arch/powerpc/include/asm/book3s/64/kup.h:207!
> > [  530.708013] Oops: Exception in kernel mode, sig: 5 [#1]
> > [  530.708018] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> > [  530.708022] Modules linked in: bonding rfkill sunrpc uio_pdrv_genirq pseries_rng uio drm fuse drm_panel_orientation_quirks ip_tables xfs libcrc32c sd_mod t10_pi ibmvscsi ibmveth scsi_trans
> > port_srp xts vmx_crypto
> > [  530.708049] CPU: 13 PID: 5587 Comm: io_wqe_worker-0 Not tainted 5.11.0-r
> 
> ok so we call current_thread_amr() with kthread.
> 
> commit ae33fb7b069ebb41e32f55ae397c887031e47472
> Author: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Date:   Fri Feb 5 19:11:49 2021 +0530
> 
>     
>     The other stack that matters is
>     ...
>     [  530.710838] CPU: 13 PID: 5587 Comm: io_wqe_worker-0 Tainted: G      D           5.11.0-rc6+ #3
>     ....
>     
>      NIP [c0000000000aa0c8] pkey_access_permitted+0x28/0x90
>      LR [c0000000004b9278] gup_pte_range+0x188/0x420
>      --- interrupt: 700
>      [c00000001c4ef3f0] [0000000000000000] 0x0 (unreliable)
>      [c00000001c4ef490] [c0000000004bd39c] gup_pgd_range+0x3ac/0xa20
>      [c00000001c4ef5a0] [c0000000004bdd44] internal_get_user_pages_fast+0x334/0x410
>      [c00000001c4ef620] [c000000000852028] iov_iter_get_pages+0xf8/0x5c0
>      [c00000001c4ef6a0] [c0000000007da44c] bio_iov_iter_get_pages+0xec/0x700
>      [c00000001c4ef770] [c0000000006a325c] iomap_dio_bio_actor+0x2ac/0x4f0
>      [c00000001c4ef810] [c00000000069cd94] iomap_apply+0x2b4/0x740
>      [c00000001c4ef920] [c0000000006a38b8] __iomap_dio_rw+0x238/0x5c0
>      [c00000001c4ef9d0] [c0000000006a3c60] iomap_dio_rw+0x20/0x80
>      [c00000001c4ef9f0] [c008000001927a30] xfs_file_dio_aio_write+0x1f8/0x650 [xfs]
>      [c00000001c4efa60] [c0080000019284dc] xfs_file_write_iter+0xc4/0x130 [xfs]
>      [c00000001c4efa90] [c000000000669984] io_write+0x104/0x4b0
>      [c00000001c4efbb0] [c00000000066cea4] io_issue_sqe+0x3d4/0xf50
>      [c00000001c4efc60] [c000000000670200] io_wq_submit_work+0xb0/0x2f0
>      [c00000001c4efcb0] [c000000000674268] io_worker_handle_work+0x248/0x4a0
>      [c00000001c4efd30] [c0000000006746e8] io_wqe_worker+0x228/0x2a0
>      [c00000001c4efda0] [c00000000019d994] kthread+0x1b4/0x1c0
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
> index 2064621ae7b6..21e59c1f0d67 100644
> --- a/arch/powerpc/include/asm/book3s/64/kup.h
> +++ b/arch/powerpc/include/asm/book3s/64/kup.h
> @@ -204,14 +204,16 @@ DECLARE_STATIC_KEY_FALSE(uaccess_flush_key);
>  
>  static inline u64 current_thread_amr(void)
>  {
> -	VM_BUG_ON(!current->thread.regs);
> -	return current->thread.regs->amr;
> +	if (current->thread.regs)
> +		return current->thread.regs->amr;
> +	return 0;
>  }
>  
>  static inline u64 current_thread_iamr(void)
>  {
> -	VM_BUG_ON(!current->thread.regs);
> -	return current->thread.regs->iamr;
> +	if (current->thread.regs)
> +		return current->thread.regs->iamr;
> +	return 0;
>  }
>  #endif /* CONFIG_PPC_PKEY */

This change can help to avoid above regression issue:

# ./check generic/013 generic/616 generic/617
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/ppc64le ibm-p9z-xx-xxx 5.11.0-rc6+ #4 SMP Fri Feb 5 10:22:14 EST 2021
MKFS_OPTIONS  -- -f -m crc=1,finobt=1,rmapbt=1,reflink=1,inobtcount=1,bigtime=1 /dev/sda3
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/sda3 /mnt/xfstests/scratch

generic/013 37s ...  42s
generic/616      166s
generic/617 16s ...  20s
Ran: generic/013 generic/616 generic/617
Passed all 3 tests

>  
> 

