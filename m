Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A2B664520
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 16:44:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nrw8l6PBVz3chQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 02:44:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=Owk0ak4+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=efficios.com (client-ip=2607:5300:203:b2ee::31e5; helo=smtpout.efficios.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=Owk0ak4+;
	dkim-atps=neutral
Received: from smtpout.efficios.com (unknown [IPv6:2607:5300:203:b2ee::31e5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nrw7l46csz2xvL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 02:43:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1673365382;
	bh=9DteScviYzuGDClKOO5i/bvIpmEkTcoZ7S9CiWf5duc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Owk0ak4+dXPr7yNtet96RlZ6n0eC1KJZD5diCIy5/tXAuxDatJS3hQizmvns3O4NU
	 X1aWy7G96wa1tYGyqfoZEvSs/I6WJ9f0+20jRf967PwH1r7jnfgJpiSfwed85CIbeM
	 1CAh6LwU/fUjEMq2xJXXDdXNz4qZTjRMOeEatO/7wpIRgwywrottVKwYbjE38BNDu9
	 yPdmLw8zUvCosX0pJxcOBSh8pLl+VTOxTarkApp6ZBaA+1vAuDezZn4Fg/c+3POX3R
	 KkqftKAEtZhk/1aXj8VutGiuGOQ/UJ1cVV5MZY/vL/2QCP4GhwWwAGwSniS4D9Gp1e
	 RKi1YQIZ56SSA==
Received: from [172.16.0.101] (192-222-180-24.qc.cable.ebox.net [192.222.180.24])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4Nrw7V03tZzfyK;
	Tue, 10 Jan 2023 10:43:01 -0500 (EST)
Message-ID: <2fb8749a-2a1a-8fdc-f5ad-e0632cd53d63@efficios.com>
Date: Tue, 10 Jan 2023 10:43:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [powerpc] Boot failure kernel BUG at mm/usercopy.c:102
Content-Language: en-US
To: Sachin Sant <sachinp@linux.ibm.com>, linux-next@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
References: <8C9D7E49-5A75-41BE-ACCB-44FDD8FBE4D0@linux.ibm.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
In-Reply-To: <8C9D7E49-5A75-41BE-ACCB-44FDD8FBE4D0@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-01-10 05:42, Sachin Sant wrote:
> 6.2.0-rc3-next-20230109 fails to boot on powerpc with following:
> 
> [ 0.444834] ------------[ cut here ]------------
> [ 0.444838] kernel BUG at mm/usercopy.c:102!
> [ 0.444842] Oops: Exception in kernel mode, sig: 5 [#1]
> [ 0.444845] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
> [ 0.444849] Modules linked in:
> [ 0.444853] CPU: 23 PID: 201 Comm: modprobe Not tainted 6.2.0-rc3-next-20230109 #1
> [ 0.444858] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1030.00 (NH1030_026) hv:phyp pSeries
> [ 0.444862] NIP: c00000000055a934 LR: c00000000055a930 CTR: 0000000000725d90
> [ 0.444866] REGS: c000000007f937c0 TRAP: 0700 Not tainted (6.2.0-rc3-next-20230109)
> [ 0.444871] MSR: 8000000000029033 <SF,EE,ME,IR,DR,RI,LE> CR: 28088822 XER: 00000007
> [ 0.444879] CFAR: c0000000002012a8 IRQMASK: 0
> [ 0.444879] GPR00: c00000000055a930 c000000007f93a60 c0000000013b0800 0000000000000066
> [ 0.444879] GPR04: 00000000ffff7fff c000000007f93880 c000000007f93878 0000000000000000
> [ 0.444879] GPR08: 00000000ffff7fff 0000000000000000 c0000000025e7150 c0000000029672b8
> [ 0.444879] GPR12: 0000000048088824 c000000e87bf6300 c00000000017f458 c0000000034b8100
> [ 0.444879] GPR16: 000000012f18eac0 00007fffc5c095d0 00007fffc5c095d8 000000012f140040
> [ 0.444879] GPR20: fcffffffffffffff 00000000001fffff 5455555555555555 000ffffffffffff8
> [ 0.444879] GPR24: c00000000723a0c0 00007fffc5c09368 0000000000000000 00007fffc5c09370
> [ 0.444879] GPR28: 0000000000000250 0000000000000001 c000000003017000 c00000000723a0c0
> [ 0.444922] NIP [c00000000055a934] usercopy_abort+0xa4/0xb0
> [ 0.444928] LR [c00000000055a930] usercopy_abort+0xa0/0xb0
> [ 0.444932] Call Trace:
> [ 0.444933] [c000000007f93a60] [c00000000055a930] usercopy_abort+0xa0/0xb0 (unreliable)
> [ 0.444939] [c000000007f93ad0] [c00000000050eeb8] __check_heap_object+0x198/0x1d0
> [ 0.444945] [c000000007f93b10] [c00000000055a7e0] __check_object_size+0x290/0x340
> [ 0.444949] [c000000007f93b50] [c00000000060eba4] create_elf_tables.isra.20+0xc04/0xc90
> [ 0.444956] [c000000007f93c10] [c000000000610b2c] load_elf_binary+0xdac/0x1320
> [ 0.444962] [c000000007f93d00] [c000000000571cf0] bprm_execve+0x3d0/0x7c0
> [ 0.444966] [c000000007f93dc0] [c000000000572b9c] kernel_execve+0x1ac/0x270
> [ 0.444971] [c000000007f93e10] [c00000000017f5cc] call_usermodehelper_exec_async+0x17c/0x250
> [ 0.444978] [c000000007f93e50] [c00000000000e054] ret_from_kernel_thread+0x5c/0x64
> [ 0.444983] --- interrupt: 0 at 0x0
> [ 0.444986] NIP: 0000000000000000 LR: 0000000000000000 CTR: 0000000000000000
> [ 0.444990] REGS: c000000007f93e80 TRAP: 0000 Not tainted (6.2.0-rc3-next-20230109)
> [ 0.444994] MSR: 0000000000000000 <> CR: 00000000 XER: 00000000
> [ 0.444998] CFAR: 0000000000000000 IRQMASK: 0
> [ 0.444998] GPR00: 0000000000000000 c000000007f94000 0000000000000000 0000000000000000
> [ 0.444998] GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [ 0.444998] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [ 0.444998] GPR12: 0000000000000000 0000000000000000 c00000000017f458 c0000000034b8100
> [ 0.444998] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [ 0.444998] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [ 0.444998] GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [ 0.444998] GPR28: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [ 0.445039] NIP [0000000000000000] 0x0
> [ 0.445042] LR [0000000000000000] 0x0
> [ 0.445044] --- interrupt: 0
> [ 0.445046] Code: 392990f8 48000014 3d02ffe9 390827f0 7d074378 7d094378 7c661b78 3c62ffe7 f9610060 386319f0 4bca6935 60000000 <0fe00000> 00000000 00000000 7c0802a6
> [ 0.445061] ---[ end trace 0000000000000000 ]—
> 
> Git bisect points to following patch:
> 
> commit 317c8194e6aeb8b3b573ad139fc2a0635856498e
>       rseq: Introduce feature size and alignment ELF auxiliary vector entries
> 
> Reverting the patch helps boot the kernel.

Can you try with the following fix ?

https://lore.kernel.org/r/20230104192054.34046-1-mathieu.desnoyers@efficios.com
"rseq: Fix: Increase AT_VECTOR_SIZE_BASE to match rseq auxvec entries"

Peter, I suspect it would be good to merge that fix into tip/master though sched/core.

Thanks,

Mathieu


> 
> Thanks
> -Sachin

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

