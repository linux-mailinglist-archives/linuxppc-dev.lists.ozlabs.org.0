Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 937DE8563E6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 14:02:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbFbK3vQ3z3w0P
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 00:02:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbFX62z6Fz3dWX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 23:59:50 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TbFX55cp9z4wyy;
	Thu, 15 Feb 2024 23:59:49 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Naveen N Rao <naveen@kernel.org>
In-Reply-To: <20240213175410.1091313-1-naveen@kernel.org>
References: <20240213175410.1091313-1-naveen@kernel.org>
Subject: Re: [PATCH v2] powerpc/ftrace: Ignore ftrace locations in exit text sections
Message-Id: <170800185785.599237.6664077857220704079.b4-ty@ellerman.id.au>
Date: Thu, 15 Feb 2024 23:57:37 +1100
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
Cc: Steven Rostedt <rostedt@goodmis.org>, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 13 Feb 2024 23:24:10 +0530, Naveen N Rao wrote:
> Michael reported that we are seeing ftrace bug on bootup when KASAN is
> enabled, and if we are using -fpatchable-function-entry:
> 
>     ftrace: allocating 47780 entries in 18 pages
>     ftrace-powerpc: 0xc0000000020b3d5c: No module provided for non-kernel address
>     ------------[ ftrace bug ]------------
>     ftrace faulted on modifying
>     [<c0000000020b3d5c>] 0xc0000000020b3d5c
>     Initializing ftrace call sites
>     ftrace record flags: 0
>      (0)
>      expected tramp: c00000000008cef4
>     ------------[ cut here ]------------
>     WARNING: CPU: 0 PID: 0 at kernel/trace/ftrace.c:2180 ftrace_bug+0x3c0/0x424
>     Modules linked in:
>     CPU: 0 PID: 0 Comm: swapper Not tainted 6.5.0-rc3-00120-g0f71dcfb4aef #860
>     Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1202 0xf000005 of:SLOF,HEAD hv:linux,kvm pSeries
>     NIP:  c0000000003aa81c LR: c0000000003aa818 CTR: 0000000000000000
>     REGS: c0000000033cfab0 TRAP: 0700   Not tainted  (6.5.0-rc3-00120-g0f71dcfb4aef)
>     MSR:  8000000002021033 <SF,VEC,ME,IR,DR,RI,LE>  CR: 28028240  XER: 00000000
>     CFAR: c0000000002781a8 IRQMASK: 3
>     ...
>     NIP [c0000000003aa81c] ftrace_bug+0x3c0/0x424
>     LR [c0000000003aa818] ftrace_bug+0x3bc/0x424
>     Call Trace:
>      ftrace_bug+0x3bc/0x424 (unreliable)
>      ftrace_process_locs+0x5f4/0x8a0
>      ftrace_init+0xc0/0x1d0
>      start_kernel+0x1d8/0x484
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/ftrace: Ignore ftrace locations in exit text sections
      https://git.kernel.org/powerpc/c/ea73179e64131bcd29ba6defd33732abdf8ca14b

cheers
