Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C2A316984
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 15:55:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbN9c42XCzDwfc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 01:55:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbKfZ6GT9zDqdW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 00:02:14 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DbKfM31Pyz9sVv; Thu, 11 Feb 2021 00:02:02 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
In-Reply-To: <20210206025634.521979-1-aneesh.kumar@linux.ibm.com>
References: <20210206025634.521979-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/kuap: Allow kernel thread to access userspace
 after kthread_use_mm
Message-Id: <161296210040.3183074.5691827311091872470.b4-ty@ellerman.id.au>
Date: Thu, 11 Feb 2021 00:02:02 +1100 (AEDT)
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
Cc: Jens Axboe <axboe@kernel.dk>, Zorro Lang <zlang@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 6 Feb 2021 08:26:34 +0530, Aneesh Kumar K.V wrote:
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
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/kuap: Allow kernel thread to access userspace after kthread_use_mm
      https://git.kernel.org/powerpc/c/8c511eff1827239f24ded212b1bcda7ca5b16203

cheers
