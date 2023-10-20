Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDD67D0F4C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 14:00:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBjnZ1kpkz3vZS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 23:00:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBjn44jD6z3cBx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 22:59:36 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SBjmz6gv0z4xM1;
	Fri, 20 Oct 2023 22:59:31 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20231017121527.1574104-1-mpe@ellerman.id.au>
References: <20231017121527.1574104-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64s/radix: Don't warn on copros in radix__tlb_flush()
Message-Id: <169780308354.633686.2018190523652991400.b4-ty@ellerman.id.au>
Date: Fri, 20 Oct 2023 22:58:03 +1100
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
Cc: npiggin@gmail.com, sachinp@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 17 Oct 2023 23:15:27 +1100, Michael Ellerman wrote:
> Sachin reported a warning when running the inject-ra-err selftest:
> 
>   # selftests: powerpc/mce: inject-ra-err
>   Disabling lock debugging due to kernel taint
>   MCE: CPU19: machine check (Severe)  Real address Load/Store (foreign/control memory) [Not recovered]
>   MCE: CPU19: PID: 5254 Comm: inject-ra-err NIP: [0000000010000e48]
>   MCE: CPU19: Initiator CPU
>   MCE: CPU19: Unknown
>   ------------[ cut here ]------------
>   WARNING: CPU: 19 PID: 5254 at arch/powerpc/mm/book3s64/radix_tlb.c:1221 radix__tlb_flush+0x160/0x180
>   CPU: 19 PID: 5254 Comm: inject-ra-err Kdump: loaded Tainted: G   M        E      6.6.0-rc3-00055-g9ed22ae6be81 #4
>   Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1030.20 (NH1030_058) hv:phyp pSeries
>   ...
>   NIP radix__tlb_flush+0x160/0x180
>   LR  radix__tlb_flush+0x104/0x180
>   Call Trace:
>     radix__tlb_flush+0xf4/0x180 (unreliable)
>     tlb_finish_mmu+0x15c/0x1e0
>     exit_mmap+0x1a0/0x510
>     __mmput+0x60/0x1e0
>     exit_mm+0xdc/0x170
>     do_exit+0x2bc/0x5a0
>     do_group_exit+0x4c/0xc0
>     sys_exit_group+0x28/0x30
>     system_call_exception+0x138/0x330
>     system_call_vectored_common+0x15c/0x2ec
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64s/radix: Don't warn on copros in radix__tlb_flush()
      https://git.kernel.org/powerpc/c/20045f0155ab79f8beb840022ea86bff46167f79

cheers
