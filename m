Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E613F9A49
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 15:34:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx10Y0BNvz3gb9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 23:34:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx0qQ1Mdcz3f0w
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 23:26:42 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gx0qP4h8pz9sVq;
 Fri, 27 Aug 2021 23:26:41 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20210818120518.3603172-1-mpe@ellerman.id.au>
References: <20210818120518.3603172-1-mpe@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/mm: Fix set_memory_*() against concurrent
 accesses
Message-Id: <163007070103.56462.5039469174148470199.b4-ty@ellerman.id.au>
Date: Fri, 27 Aug 2021 23:25:01 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: lvivier@redhat.com, jniethe5@gmail.com, aneesh.kumar@linux.ibm.com,
 npiggin@gmail.com, farosas@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 18 Aug 2021 22:05:18 +1000, Michael Ellerman wrote:
> Laurent reported that STRICT_MODULE_RWX was causing intermittent crashes
> on one of his systems:
> 
>   kernel tried to execute exec-protected page (c008000004073278) - exploit attempt? (uid: 0)
>   BUG: Unable to handle kernel instruction fetch
>   Faulting instruction address: 0xc008000004073278
>   Oops: Kernel access of bad area, sig: 11 [#1]
>   LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
>   Modules linked in: drm virtio_console fuse drm_panel_orientation_quirks ...
>   CPU: 3 PID: 44 Comm: kworker/3:1 Not tainted 5.14.0-rc4+ #12
>   Workqueue: events control_work_handler [virtio_console]
>   NIP:  c008000004073278 LR: c008000004073278 CTR: c0000000001e9de0
>   REGS: c00000002e4ef7e0 TRAP: 0400   Not tainted  (5.14.0-rc4+)
>   MSR:  800000004280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24002822 XER: 200400cf
>   ...
>   NIP fill_queue+0xf0/0x210 [virtio_console]
>   LR  fill_queue+0xf0/0x210 [virtio_console]
>   Call Trace:
>     fill_queue+0xb4/0x210 [virtio_console] (unreliable)
>     add_port+0x1a8/0x470 [virtio_console]
>     control_work_handler+0xbc/0x1e8 [virtio_console]
>     process_one_work+0x290/0x590
>     worker_thread+0x88/0x620
>     kthread+0x194/0x1a0
>     ret_from_kernel_thread+0x5c/0x64
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/mm: Fix set_memory_*() against concurrent accesses
      https://git.kernel.org/powerpc/c/9f7853d7609d59172eecfc5e7ccf503bc1b690bd

cheers
