Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D122B77EE1B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 02:12:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RR56Z5nszz3cSK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 10:12:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RR56136fqz2yGW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 10:11:53 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RR55z4RDCz4wy3;
	Thu, 17 Aug 2023 10:11:51 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Kees Cook <keescook@chromium.org>, Nathan Lynch <nathanl@linux.ibm.com>
In-Reply-To: <20230810-rtas-flash-vs-hardened-usercopy-v2-1-dcf63793a938@linux.ibm.com>
References: <20230810-rtas-flash-vs-hardened-usercopy-v2-1-dcf63793a938@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/rtas_flash: allow user copy to flash block cache objects
Message-Id: <169223107895.375104.3687617958725578000.b4-ty@ellerman.id.au>
Date: Thu, 17 Aug 2023 10:11:18 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 10 Aug 2023 22:37:55 -0500, Nathan Lynch wrote:
> With hardened usercopy enabled (CONFIG_HARDENED_USERCOPY=y), using the
> /proc/powerpc/rtas/firmware_update interface to prepare a system
> firmware update yields a BUG():
> 
> kernel BUG at mm/usercopy.c:102!
> Oops: Exception in kernel mode, sig: 5 [#1]
> LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> Modules linked in:
> CPU: 0 PID: 2232 Comm: dd Not tainted 6.5.0-rc3+ #2
> Hardware name: IBM,8408-E8E POWER8E (raw) 0x4b0201 0xf000004 of:IBM,FW860.50 (SV860_146) hv:phyp pSeries
> NIP:  c0000000005991d0 LR: c0000000005991cc CTR: 0000000000000000
> REGS: c0000000148c76a0 TRAP: 0700   Not tainted  (6.5.0-rc3+)
> MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24002242  XER: 0000000c
> CFAR: c0000000001fbd34 IRQMASK: 0
> [ ... GPRs omitted ... ]
> NIP [c0000000005991d0] usercopy_abort+0xa0/0xb0
> LR [c0000000005991cc] usercopy_abort+0x9c/0xb0
> Call Trace:
> [c0000000148c7940] [c0000000005991cc] usercopy_abort+0x9c/0xb0 (unreliable)
> [c0000000148c79b0] [c000000000536814] __check_heap_object+0x1b4/0x1d0
> [c0000000148c79f0] [c000000000599080] __check_object_size+0x2d0/0x380
> [c0000000148c7a30] [c000000000045ed4] rtas_flash_write+0xe4/0x250
> [c0000000148c7a80] [c00000000068a0fc] proc_reg_write+0xfc/0x160
> [c0000000148c7ab0] [c0000000005a381c] vfs_write+0xfc/0x4e0
> [c0000000148c7b70] [c0000000005a3e10] ksys_write+0x90/0x160
> [c0000000148c7bc0] [c00000000002f2c8] system_call_exception+0x178/0x320
> [c0000000148c7e50] [c00000000000d520] system_call_common+0x160/0x2c4
> --- interrupt: c00 at 0x7fff9f17e5e4
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/rtas_flash: allow user copy to flash block cache objects
      https://git.kernel.org/powerpc/c/4f3175979e62de3b929bfa54a0db4b87d36257a7

cheers
