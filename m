Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 629863BD805
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 15:50:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GK3qL1v57z30D6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 23:50:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jJMn8lEX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::830;
 helo=mail-qt1-x830.google.com; envelope-from=radu.rendec@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jJMn8lEX; dkim-atps=neutral
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GK3pn0sG0z3002
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jul 2021 23:50:24 +1000 (AEST)
Received: by mail-qt1-x830.google.com with SMTP id y9so14428371qtx.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jul 2021 06:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=yu5o9YTYZXLzC1LWiDTAEUAO+ApDTYmSdNnlbfkzzKo=;
 b=jJMn8lEXQHxN4O3D6mbiADFdTL3VgXzXOh6jTt8ohVJjdrAkRcHRmmhoYok4/bDByY
 1sSu1WHcRE+8vCX8AQqFAmlMw2umOx5uhdvCYUJReaUDQKS+Lb92aIisI83VStoofZZb
 LEnW4D0ZM+kSq9JH/4D+jCmOOJspGrrKSSwY3selqp+kPwqsZglUinfAzAeFOH02GPT6
 AYuF9ASBpJm3B9QcCdh6mZ8k6jO/PkNLBUGr50FRSKd68c8bZ/2c7cj9vHXwjhmpeQvj
 GgwezGyXDOms+GPUMlSH7lm/T0goGR1G1dNP11KN+5aBAcpsgb2jn6PdT0QuHhVWbRJI
 ddsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=yu5o9YTYZXLzC1LWiDTAEUAO+ApDTYmSdNnlbfkzzKo=;
 b=NhIMWOulhn22gZEApMEQYUJhcbqS/2EIzEK7pIYJGNC2NZpFWeUaetDPURvMgkLTCm
 CKXCAtOk5Pk/EhfD3Nq6IsnGt4FYspGl/HxOABdGFTsMYNBN0S8vzfUhQK0r/LQCTOjv
 1mQSpzfN0ZK/k15Mx8Z3WYyaVI1TTdjK+mtT36admyqP4L6togaqrSb+V/1Vm6iZZq8l
 QHX/Dfm7HiTMMqsdqFiEVA1nr//W+KYw5orTN7eqkooZ9V9r6sVsxlm7JjUHYy9Yv5Nb
 ElPEu5x+s6Lv5E7A2KcSrfaLGUi085LsqVugqTGip02AaAV+7RezU4hd4IcuHLc/XgXZ
 5CkQ==
X-Gm-Message-State: AOAM5337+1fr153R/6zulufzPOl7pi3ITcZV/EM+CRLCFGnKHKSuV6jF
 QFSiXXhqVwxy3d8DFuoDZ0I=
X-Google-Smtp-Source: ABdhPJxL/D598E2m4Paf1TbFVSmecptiu/1iO4sFh67SbHqVLafOybykaWXE1OvUiwj1ROufF/3N1Q==
X-Received: by 2002:a05:622a:149:: with SMTP id
 v9mr17660272qtw.144.1625579420537; 
 Tue, 06 Jul 2021 06:50:20 -0700 (PDT)
Received: from bat.mindbit.ro (cpe00fc8d79db03-cm00fc8d79db00.cpe.net.fido.ca.
 [72.137.118.157])
 by smtp.gmail.com with ESMTPSA id d21sm5523754qtw.43.2021.07.06.06.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 06:50:20 -0700 (PDT)
Message-ID: <159a8bf58c9f8838bf38e495a3a376aaae14eaa6.camel@gmail.com>
Subject: Re: Hitting BUG_ON in do_notify_resume() with gdb and SIGTRAP
From: Radu Rendec <radu.rendec@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Date: Tue, 06 Jul 2021 09:50:19 -0400
In-Reply-To: <200445ae-c3fc-ccc8-f77d-aebce2b09046@csgroup.eu>
References: <6b5327e32549860c1e6c73e5b669528bfb383df2.camel@gmail.com>
 <d02fca74-933b-4586-496b-65511e435628@csgroup.eu>
 <786399a77d82890a391172fee269272e12c52489.camel@gmail.com>
 <200445ae-c3fc-ccc8-f77d-aebce2b09046@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2021-07-06 at 15:16 +0200, Christophe Leroy wrote:
>Le 06/07/2021 à 13:56, Radu Rendec a écrit :
>> On Tue, 2021-07-06 at 12:43 +0200, Christophe Leroy wrote:
>>> Le 04/07/2021 à 23:38, Radu Rendec a écrit :
>>>> I'm trying to set up my (virtual) environment to test an old bug in the
>>>> PPC32 ptrace() code. I came across a completely different problem,
>>>> which seems to make gdb pretty much unusable on PPC32. I'm not sure if
>>>> this is a real kernel bug or maybe something wrong with my
>>>> configuration.
>>>>
>>>> I'm running kernel 5.13 in a qemu VM with one e500mc CPU. I am running
>>>> native gdb (inside the VM) and setting a breakpoint in main() in a test
>>>> "hello world" program. Upon running the test program, I am hitting the
>>>> BUG_ON in do_notify_resume() on line 292. The kernel bug log snippet is
>>>> included below at the end of the email.
>>>>
>>>> FWIW, gdb says:
>>>> Program terminated with signal SIGTRAP, Trace/breakpoint trap.
>>>> The program no longer exists.
>>>>
>>>> I also added a pr_info() to do_notify_resume() just to see how much
>>>> different 'regs' and 'current->thread.regs' are. Surprisingly, they are
>>>> just 0x30 apart: regs=c7955f10 cur=c7955f40. Also, 'current' seems to
>>>> be OK (pid and comm are consistent with the test program).
>>>
>>> The TRAP = 0x7d8 is obviously wrong.
>>>
>>> Need to know which 'TRAP' it is exactly.
>>> Could you try to dump what we have at the correct regs ?
>>> Something like 'show_regs(current->thread.regs)' should do it.
>> 
>> Sure, please see the output below. It looks to me like the "correct"
>> regs are just garbage. Either they are overwritten or current->thread.regs
>> is wrong. But in any case, r1 = 0 doesn't look good.
>
>Yes indeed. I think I identified the problem. For Critical interrupts like DEBUG interrupt, struct 
>exception_regs is added, therefore the frame has 12x4 (0x30) more bytes. That's what you see.
>
>Commit 
>https://github.com/linuxppc/linux/commit/db297c3b07af7856fb7c666fbc9792d8e37556be#diff-dd6b952a3980da19df4facccdb4f3dddeb8cef56ee384c7f03d02b23b0c6cb26
>
>Need to find the best solution now to fix that.

Awesome, happy to see you figured it out so quickly.

I'm not sure if it makes any sense, but one thing that comes to mind is
to put struct exception_regs before struct pt_regs when the frame is
saved. Unless of course other parts of the code expect the opposite.

>> regs=c7a0ff10 cur=c7a0ff40 pid=139 comm=test
>> CPU: 0 PID: 139 Comm: test Not tainted 5.13.0-dirty #4
>> NIP:  10000338 LR: 00030000 CTR: 00000003
>> REGS: c7a0ff40 TRAP: 670000   Not tainted  (5.13.0-dirty)
>> MSR:  1002d202 <CE,EE,PR,ME,DE>  CR: 10000004  XER: 80670100
>> 
>> GPR00: b7fc36d8 00000000 00000000 b7fe17b4 00000000 b7ffd588 b7ffe8b8 b7ffee10
>> GPR08: b7fff214 b7ffdf40 b7fff208 bffff858 bffff970 b7fff130 00000001 bffff960
>> GPR16: b7fff2b0 b7ffd5f0 b7ffe8a8 bffff850 b7fc3714 1002d002 b7fff208 00000003
>> GPR24: b7fc3714 00000000 22000284 bffff960 000007d8 10000338 08000000 bffff850
>> NIP [10000338] 0x10000338
>> LR [00030000] 0x30000
>> Call Trace:
>> [c7a0fe40] [c0008eac] show_regs+0x4c/0x1b0 (unreliable)
>> [c7a0fe80] [c000969c] do_notify_resume+0x31c/0x320
>> [c7a0fee0] [c0010b94] interrupt_exit_user_prepare+0x94/0xc0
>> [c7a0ff00] [c00151e8] interrupt_return+0x14/0x13c
>> --- interrupt: 7d8 at 0xb7fc3714
>> NIP:  b7fc3714 LR: b7fc3714 CTR: 00000003
>> REGS: c7a0ff10 TRAP: 07d8   Not tainted  (5.13.0-dirty)
>> MSR:  1002d002 <CE,EE,PR,ME>  CR: 22000284  XER: 00000000
>> 
>> GPR00: b7fc3584 bffff850 00000000 00000000 00000000 00000000 000000a0 6474e552
>> GPR08: b7fbe0d4 00000001 b7fff230 bffff850 b7fc36d8 00000000 00000000 b7fe17b4
>> GPR16: 00000000 b7ffd588 b7ffe8b8 b7ffee10 b7fff214 b7ffdf40 b7fff208 bffff858
>> GPR24: bffff970 b7fff130 00000001 bffff960 b7fff2b0 b7ffd5f0 b7ffe8a8 bffff850
>> NIP [b7fc3714] 0xb7fc3714
>> LR [b7fc3714] 0xb7fc3714
>> --- interrupt: 7d8
>> ------------[ cut here ]------------
>> kernel BUG at arch/powerpc/kernel/signal.c:298!
>> Oops: Exception in kernel mode, sig: 5 [#1]
>> BE PAGE_SIZE=4K SMP NR_CPUS=24 QEMU e500
>> Modules linked in:
>> CPU: 0 PID: 139 Comm: test Not tainted 5.13.0-dirty #4
>> NIP:  c000969c LR: c000969c CTR: c065f540
>> REGS: c7a0fdc0 TRAP: 0700   Not tainted  (5.13.0-dirty)
>> MSR:  00028002 <CE,EE>  CR: 28000282  XER: 20000000
>> 
>> GPR00: c000969c c7a0fe80 c70ef500 c70efbd8 c70ef500 00000010 c7a0fc38 00000002
>> GPR08: 00000001 00000000 00000000 00000000 28000282 00000000 00000000 b7fe17b4
>> GPR16: 00000000 b7ffd588 b7ffe8b8 b7ffee10 b7fff214 b7ffdf40 b7fff208 bffff858
>> GPR24: bffff970 b7fff130 00000001 bffff960 c7a0ff10 00000800 c70ef500 00000102
>> NIP [c000969c] do_notify_resume+0x31c/0x320
>> LR [c000969c] do_notify_resume+0x31c/0x320
>> Call Trace:
>> [c7a0fe80] [c000969c] do_notify_resume+0x31c/0x320 (unreliable)
>> [c7a0fee0] [c0010b94] interrupt_exit_user_prepare+0x94/0xc0
>> [c7a0ff00] [c00151e8] interrupt_return+0x14/0x13c
>> --- interrupt: 7d8 at 0xb7fc3714
>> NIP:  b7fc3714 LR: b7fc3714 CTR: 00000003
>> REGS: c7a0ff10 TRAP: 07d8   Not tainted  (5.13.0-dirty)
>> MSR:  1002d002 <CE,EE,PR,ME>  CR: 22000284  XER: 00000000
>> 
>> GPR00: b7fc3584 bffff850 00000000 00000000 00000000 00000000 000000a0 6474e552
>> GPR08: b7fbe0d4 00000001 b7fff230 bffff850 b7fc36d8 00000000 00000000 b7fe17b4
>> GPR16: 00000000 b7ffd588 b7ffe8b8 b7ffee10 b7fff214 b7ffdf40 b7fff208 bffff858
>> GPR24: bffff970 b7fff130 00000001 bffff960 b7fff2b0 b7ffd5f0 b7ffe8a8 bffff850
>> NIP [b7fc3714] 0xb7fc3714
>> LR [b7fc3714] 0xb7fc3714
>> --- interrupt: 7d8
>> Instruction dump:
>> 93a10054 90010064 93c10058 48b95369 80c20398 3c60c0dc 7f84e378 38e204b0
>> 3863ce30 4809d819 80620704 4bfff7c9 <0fe00000> 3d20c0ff 8129c014 2c090000
>> ---[ end trace 1cbf27cd19ae39a0 ]---
>> 
>>>> If I'm not missing something, the 'regs' pointer that is eventually
>>>> passed to do_notify_resume() is calculated in interrupt_return() by
>>>> adding STACK_FRAME_OVERHEAD (defined to 112) to the value of r1. That
>>>> means all registers are saved on the stack before entering the
>>>> interrupt handler and, upon returning, a pointer to the register
>>>> structure is calculated from the stack pointer. Either the offset
>>>> itself is wrong, or the stack pointer is off by 0x30.
>>>>
>>>> This is as far as I have gone. Hopefully this rings a bell to someone
>>>> who is familiar with that part of the code and has a better
>>>> understanding of PPC32 interrupt handling in general.
>>>>
>>>> Last but not least, my configuration is fairly standard. I'm using the
>>>> powerpc-e500mc--glibc--bleeding-edge-2020.08-1 toolchain from Bootlin
>>>> to compile everything (kernel and user-space). The qemu version is
>>>> 5.2.0 (Fedora 34) and the user-space is a small Busybox based rootfs
>>>> that I built using Buildroot 2021.05. The gdb version is 9.2.


