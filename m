Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 439DB5EE0C4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 17:45:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Md15s17PXz3c6s
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 01:45:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e59s1+yd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e59s1+yd;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Md15F4T2qz3bhy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 01:44:33 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 55C4E61F07;
	Wed, 28 Sep 2022 15:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF11C433C1;
	Wed, 28 Sep 2022 15:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664379869;
	bh=WJ9VZ+JE/9UbAAbyu5q+enZmSRYXTWcBGhmijWm6LmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e59s1+ydJlVyCUQekYx5ZLUbpj0mkrT8eSzmcJ0e89ft/L1nQBnRfu2JNNwcOa/wc
	 J4kxZ8UP5P5HNj/++9jSpNJ0V/U2U0IdXqc3qBXfYsjfxDBfZh1LHMclw6GAU3yKC3
	 cPQf2Bn4+470eq1G6fd21QIrK28ZnkgqBQjDygFAThwQwIIjR0S/lzyOFpf0Mh7ii/
	 3C/7c03o53W19IheKrFYWl7FMvAriTZLZiPsRgKqXHjnCn8Kom2Z/nozx2AaoWN9Qt
	 JsgXZljkwZ5YYv2MQZ1FMqH5+aYUg0u/653m7V+ci2/oicKYpZDHTMIZ+HyXQqk6Kk
	 r5DG8GTwy4oQw==
Date: Wed, 28 Sep 2022 08:44:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <yujie.liu@intel.com>
Subject: Re: [objtool] ca5e2b42c0: kernel_BUG_at_arch/x86/kernel/jump_label.c
Message-ID: <YzRr23Bn6qFDC7j0@dev-arch.thelio-3990X>
References: <20220912082020.226755-12-sv@linux.ibm.com>
 <202209280801.2d5eebb5-yujie.liu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202209280801.2d5eebb5-yujie.liu@intel.com>
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
Cc: lkp@intel.com, aik@ozlabs.ru, linux-kbuild@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, chenzhongjin@huawei.com, llvm@lists.linux.dev, npiggin@gmail.com, linux-kernel@vger.kernel.org, lkp@lists.01.org, mingo@redhat.com, Sathvika Vasireddy <sv@linux.ibm.com>, rostedt@goodmis.org, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

On Wed, Sep 28, 2022 at 08:48:53AM +0800, kernel test robot wrote:
> Greeting,
> 
> FYI, we noticed the following commit (built with clang-14):
> 
> commit: ca5e2b42c0d4438ba93623579b6860b98f3598f3 ("[PATCH v3 11/16] objtool: Add --mnop as an option to --mcount")
> url: https://github.com/intel-lab-lkp/linux/commits/Sathvika-Vasireddy/objtool-Enable-and-implement-mcount-option-on-powerpc/20220912-163023
> base: https://git.kernel.org/cgit/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
> patch link: https://lore.kernel.org/linuxppc-dev/20220912082020.226755-12-sv@linux.ibm.com
> 
> in testcase: boot
> 
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> 
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
> 
> 
> [  152.068363][    T0] jump_label: Fatal kernel bug, unexpected op at trace_initcall_start+0xc/0x180 [ffffffff810016ec] (e9 c9 00 00 00 != 0f 1f 44 00 00)) size:5 type:1
> [  152.070368][    T0] ------------[ cut here ]------------
> [  152.071050][    T0] kernel BUG at arch/x86/kernel/jump_label.c:73!
> [  152.071825][    T0] invalid opcode: 0000 [#1] SMP KASAN PTI
> [  152.072427][    T0] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.0.0-rc2-00011-gca5e2b42c0d4 #1 96a19ca45386d518c4bccc5b3bc53f548a2dc122
> [  152.073837][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-debian-1.16.0-4 04/01/2014
> [  152.075461][    T0] RIP: 0010:__jump_label_patch+0x340/0x350
> [  152.076162][    T0] Code: 00 48 89 da e9 51 fe ff ff 48 c7 c7 00 d1 80 83 4c 89 fe 4c 89 fa 4c 89 f9 49 89 d8 45 89 e9 41 54 e8 f2 91 34 02 48 83 c4 08 <0f> 0b 0f 0b 0f 0b 0f 0b 0f 1f 84 00 00 00 00 00 48 c7 c7 00 09 69
> [  152.078374][    T0] RSP: 0000:ffffffff84607cb8 EFLAGS: 00010086
> [  152.079159][    T0] RAX: 0000000000000092 RBX: ffffffff8380f62a RCX: ffffffff84634d80
> [  152.080100][    T0] RDX: 0000000000000000 RSI: 00000000ffffffea RDI: 00000000fffffffe
> [  152.081020][    T0] RBP: ffffffff855d9f60 R08: ffffffff8124f17c R09: fffffbfff08c0f53
> [  152.081936][    T0] R10: dffff7fff08c0f54 R11: 1ffffffff08c0f52 R12: 0000000000000001
> [  152.082832][    T0] R13: 0000000000000005 R14: ffffffff8380f62a R15: ffffffff810016ec
> [  152.083744][    T0] FS:  0000000000000000(0000) GS:ffff8883aee00000(0000) knlGS:0000000000000000
> [  152.084763][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  152.085567][    T0] CR2: ffff88843ffff000 CR3: 0000000004628000 CR4: 00000000000406b0
> [  152.086472][    T0] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  152.087407][    T0] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [  152.088326][    T0] Call Trace:
> [  152.088702][    T0]  <TASK>
> [  152.089042][    T0]  ? trace_initcall_start+0xc/0x180
> [  152.089660][    T0]  ? trace_initcall_start+0x1b/0x180
> [  152.090281][    T0]  ? trace_initcall_start+0x11/0x180
> [  152.091237][    T0]  ? jump_label_transform+0x25/0xd0
> [  152.091923][    T0]  ? arch_jump_label_transform_queue+0x87/0xd0
> [  152.092651][    T0]  ? __jump_label_update+0x192/0x3b0
> [  152.093320][    T0]  ? static_key_enable_cpuslocked+0x129/0x250
> [  152.094020][    T0]  ? rcu_lock_release+0x20/0x20
> [  152.094573][    T0]  ? static_key_enable+0x16/0x20
> [  152.095167][    T0]  ? tracepoint_add_func+0x87e/0x9d0
> [  152.095822][    T0]  ? rcu_lock_release+0x20/0x20
> [  152.096394][    T0]  ? tracepoint_probe_register+0x99/0xd0
> [  152.097055][    T0]  ? rcu_lock_release+0x20/0x20
> [  152.097606][    T0]  ? initcall_debug_enable+0x21/0x6b
> [  152.098305][    T0]  ? start_kernel+0x24b/0x4e6
> [  152.098861][    T0]  ? secondary_startup_64_no_verify+0xce/0xdb
> [  152.099556][    T0]  </TASK>
> [  152.099891][    T0] Modules linked in:
> [  152.100352][    T0] ---[ end trace 0000000000000000 ]---
> [  152.100980][    T0] RIP: 0010:__jump_label_patch+0x340/0x350
> [  152.101652][    T0] Code: 00 48 89 da e9 51 fe ff ff 48 c7 c7 00 d1 80 83 4c 89 fe 4c 89 fa 4c 89 f9 49 89 d8 45 89 e9 41 54 e8 f2 91 34 02 48 83 c4 08 <0f> 0b 0f 0b 0f 0b 0f 0b 0f 1f 84 00 00 00 00 00 48 c7 c7 00 09 69
> [  152.103892][    T0] RSP: 0000:ffffffff84607cb8 EFLAGS: 00010086
> [  152.104544][    T0] RAX: 0000000000000092 RBX: ffffffff8380f62a RCX: ffffffff84634d80
> [  152.105421][    T0] RDX: 0000000000000000 RSI: 00000000ffffffea RDI: 00000000fffffffe
> [  152.106280][    T0] RBP: ffffffff855d9f60 R08: ffffffff8124f17c R09: fffffbfff08c0f53
> [  152.107182][    T0] R10: dffff7fff08c0f54 R11: 1ffffffff08c0f52 R12: 0000000000000001
> [  152.108110][    T0] R13: 0000000000000005 R14: ffffffff8380f62a R15: ffffffff810016ec
> [  152.109002][    T0] FS:  0000000000000000(0000) GS:ffff8883aee00000(0000) knlGS:0000000000000000
> [  152.109986][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  152.110796][    T0] CR2: ffff88843ffff000 CR3: 0000000004628000 CR4: 00000000000406b0
> [  152.111748][    T0] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  152.112686][    T0] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [  152.113568][    T0] Kernel panic - not syncing: Fatal exception
> 
> 
> If you fix the issue, kindly add following tag
> | Reported-by: kernel test robot <yujie.liu@intel.com>
> | Link: https://lore.kernel.org/r/202209280801.2d5eebb5-yujie.liu@intel.com

This crash appears to just be a symptom of objtool erroring throughout
the entire build, which means things like the jump label hacks do not
get applied. I see a flood of

  error: objtool: --mnop requires --mcount

throughout the build because the configuration has
CONFIG_HAVE_NOP_MCOUNT=y because CONFIG_HAVE_OBJTOOL_MCOUNT is
unconditionally enabled for x86_64 due to CONFIG_HAVE_OBJTOOL but
'--mcount' is only actually used when CONFIG_FTRACE_MCOUNT_USE_OBJTOOL
is enabled so '--mnop' gets passed in without '--mcount'. This should
obviously be fixed somehow, perhaps by moving the '--mnop' addition into
the '--mcount' if, even if that makes the line really long.

A secondary issue is that it seems like if objtool encounters a fatal
error like this, it should completely fail the build to make it obvious
that something is wrong, rather than allowing it to continue and
generate a broken kernel, especially since x86_64 requires objtool to
build a working kernel at this point.

Cheers,
Nathan
