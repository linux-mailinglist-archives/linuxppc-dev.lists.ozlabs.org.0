Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2576B2D205F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 02:55:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqjtF2hbKzDqbp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 12:55:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqjrV2pnmzDqRf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 12:53:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=TbTBlvrF; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CqjrT6Pf8z9sVq;
 Tue,  8 Dec 2020 12:53:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1607392410;
 bh=/8fzuBFuhiqxQcy7MGCMXjTyb3lmQJxFfjSeU8VC/pA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=TbTBlvrFV1uDoRlxjjTB6rncl1ont6GikRxWloW5MkJ4LA56t31A+3YqDJyBh5EVO
 MstQR1u4StQ5q5AAtE6LWmhSIJBMiry1eDhW1hY/Jpno/6v6UdVlVJwxIPc0n3gagF
 vxMoMa+Wdi0MerT5GXRzwlTXpTcIJjo5PI2xcrV1UBEZgtmuCe8DuMnTsP7Qk4hf+A
 i0lJRVxBy2EaYvlHrZwN8w/HGalp69rGaSbWZipVT4/K2Sy8hNe2FrSyLUkdnaIsps
 4JtqcD9Zl+nHN3UphMmV+mZyyCLvMJ+fAkkzEvwuXOnQ7cO78Fumt4X1Vd1nkm78KB
 CqLChmOxyzwyA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, hch@lst.de, viro@zeniv.linux.org.uk,
 akpm@linux-foundation.org
Subject: Re: [PATCH] powerpc/mm: Fix KUAP warning by providing
 copy_from_kernel_nofault_allowed()
In-Reply-To: <edac4edc-2d2d-cc80-c5fb-a82d7d73a913@csgroup.eu>
References: <e559e60c43f679195bfe4c7b0a301431c6f02c7a.1607157766.git.christophe.leroy@csgroup.eu>
 <87ft4itqdw.fsf@mpe.ellerman.id.au>
 <edac4edc-2d2d-cc80-c5fb-a82d7d73a913@csgroup.eu>
Date: Tue, 08 Dec 2020 12:53:26 +1100
Message-ID: <87a6upt65l.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 07/12/2020 =C3=A0 01:24, Michael Ellerman a =C3=A9crit=C2=A0:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>> Since commit c33165253492 ("powerpc: use non-set_fs based maccess
>>> routines"), userspace access is not granted anymore when using
>>> copy_from_kernel_nofault()
>>>
>>> However, kthread_probe_data() uses copy_from_kernel_nofault()
>>> to check validity of pointers. When the pointer is NULL,
>>> it points to userspace, leading to a KUAP fault and triggering
>>> the following big hammer warning many times when you request
>>> a sysrq "show task":
>>>
>>> [ 1117.202054] ------------[ cut here ]------------
>>> [ 1117.202102] Bug: fault blocked by AP register !
>>> [ 1117.202261] WARNING: CPU: 0 PID: 377 at arch/powerpc/include/asm/noh=
ash/32/kup-8xx.h:66 do_page_fault+0x4a8/0x5ec
>>> [ 1117.202310] Modules linked in:
>>> [ 1117.202428] CPU: 0 PID: 377 Comm: sh Tainted: G        W         5.1=
0.0-rc5-01340-g83f53be2de31-dirty #4175
>>> [ 1117.202499] NIP:  c0012048 LR: c0012048 CTR: 00000000
>>> [ 1117.202573] REGS: cacdbb88 TRAP: 0700   Tainted: G        W         =
 (5.10.0-rc5-01340-g83f53be2de31-dirty)
>>> [ 1117.202625] MSR:  00021032 <ME,IR,DR,RI>  CR: 24082222  XER: 20000000
>>> [ 1117.202899]
>>> [ 1117.202899] GPR00: c0012048 cacdbc40 c2929290 00000023 c092e554 0000=
0001 c09865e8 c092e640
>>> [ 1117.202899] GPR08: 00001032 00000000 00000000 00014efc 28082224 100d=
166a 100a0920 00000000
>>> [ 1117.202899] GPR16: 100cac0c 100b0000 1080c3fc 1080d685 100d0000 100d=
0000 00000000 100a0900
>>> [ 1117.202899] GPR24: 100d0000 c07892ec 00000000 c0921510 c21f4440 0000=
005c c0000000 cacdbc80
>>> [ 1117.204362] NIP [c0012048] do_page_fault+0x4a8/0x5ec
>>> [ 1117.204461] LR [c0012048] do_page_fault+0x4a8/0x5ec
>>> [ 1117.204509] Call Trace:
>>> [ 1117.204609] [cacdbc40] [c0012048] do_page_fault+0x4a8/0x5ec (unrelia=
ble)
>>> [ 1117.204771] [cacdbc70] [c00112f0] handle_page_fault+0x8/0x34
>>> [ 1117.204911] --- interrupt: 301 at copy_from_kernel_nofault+0x70/0x1c0
>>> [ 1117.204979] NIP:  c010dbec LR: c010dbac CTR: 00000001
>>> [ 1117.205053] REGS: cacdbc80 TRAP: 0301   Tainted: G        W         =
 (5.10.0-rc5-01340-g83f53be2de31-dirty)
>>> [ 1117.205104] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 28082224  XER: 0000=
0000
>>> [ 1117.205416] DAR: 0000005c DSISR: c0000000
>>> [ 1117.205416] GPR00: c0045948 cacdbd38 c2929290 00000001 00000017 0000=
0017 00000027 0000000f
>>> [ 1117.205416] GPR08: c09926ec 00000000 00000000 3ffff000 24082224
>>> [ 1117.206106] NIP [c010dbec] copy_from_kernel_nofault+0x70/0x1c0
>>> [ 1117.206202] LR [c010dbac] copy_from_kernel_nofault+0x30/0x1c0
>>> [ 1117.206258] --- interrupt: 301
>>> [ 1117.206372] [cacdbd38] [c004bbb0] kthread_probe_data+0x44/0x70 (unre=
liable)
>>> [ 1117.206561] [cacdbd58] [c0045948] print_worker_info+0xe0/0x194
>>> [ 1117.206717] [cacdbdb8] [c00548ac] sched_show_task+0x134/0x168
>>> [ 1117.206851] [cacdbdd8] [c005a268] show_state_filter+0x70/0x100
>>> [ 1117.206989] [cacdbe08] [c039baa0] sysrq_handle_showstate+0x14/0x24
>>> [ 1117.207122] [cacdbe18] [c039bf18] __handle_sysrq+0xac/0x1d0
>>> [ 1117.207257] [cacdbe48] [c039c0c0] write_sysrq_trigger+0x4c/0x74
>>> [ 1117.207407] [cacdbe68] [c01fba48] proc_reg_write+0xb4/0x114
>>> [ 1117.207550] [cacdbe88] [c0179968] vfs_write+0x12c/0x478
>>> [ 1117.207686] [cacdbf08] [c0179e60] ksys_write+0x78/0x128
>>> [ 1117.207826] [cacdbf38] [c00110d0] ret_from_syscall+0x0/0x34
>>> [ 1117.207938] --- interrupt: c01 at 0xfd4e784
>>> [ 1117.208008] NIP:  0fd4e784 LR: 0fe0f244 CTR: 10048d38
>>> [ 1117.208083] REGS: cacdbf48 TRAP: 0c01   Tainted: G        W         =
 (5.10.0-rc5-01340-g83f53be2de31-dirty)
>>> [ 1117.208134] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 44002222  XER: 0=
0000000
>>> [ 1117.208470]
>>> [ 1117.208470] GPR00: 00000004 7fc34090 77bfb4e0 00000001 1080fa40 0000=
0002 7400000f fefefeff
>>> [ 1117.208470] GPR08: 7f7f7f7f 10048d38 1080c414 7fc343c0 00000000
>>> [ 1117.209104] NIP [0fd4e784] 0xfd4e784
>>> [ 1117.209180] LR [0fe0f244] 0xfe0f244
>>> [ 1117.209236] --- interrupt: c01
>>> [ 1117.209274] Instruction dump:
>>> [ 1117.209353] 714a4000 418200f0 73ca0001 40820084 73ca0032 408200f8 73=
c90040 4082ff60
>>> [ 1117.209727] 0fe00000 3c60c082 386399f4 48013b65 <0fe00000> 80010034 =
3860000b 7c0803a6
>>> [ 1117.210102] ---[ end trace 1927c0323393af3e ]---
>>>
>>> To avoid that, copy_from_kernel_nofault_allowed() is used to check
>>> whether the address is a valid kernel address. But the default
>>> version of it returns true for any address.
>>>
>>> Provide a powerpc version of copy_from_kernel_nofault_allowed()
>>> that returns false when the address is below TASK_USER_MAX,
>>> so that copy_from_kernel_nofault() will return -ERANGE.
>>>
>>> Reported-by: Qian Cai <qcai@redhat.com>
>>> Fixes: c33165253492 ("powerpc: use non-set_fs based maccess routines")
>>> Cc: Christoph Hellwig <hch@lst.de>
>>> Cc: Al Viro <viro@zeniv.linux.org.uk>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>> This issue was introduced in 5.10. I didn't mark it for stable, hopping=
 it will go into 5.10-rc7
>>> ---
>>>   arch/powerpc/mm/Makefile  | 2 +-
>>>   arch/powerpc/mm/maccess.c | 9 +++++++++
>>>   2 files changed, 10 insertions(+), 1 deletion(-)
>>>   create mode 100644 arch/powerpc/mm/maccess.c
>>>
>>> diff --git a/arch/powerpc/mm/maccess.c b/arch/powerpc/mm/maccess.c
>>> new file mode 100644
>>> index 000000000000..56e97c0fb233
>>> --- /dev/null
>>> +++ b/arch/powerpc/mm/maccess.c
>>> @@ -0,0 +1,9 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +
>>> +#include <linux/uaccess.h>
>>> +#include <linux/kernel.h>
>>> +
>>> +bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t s=
ize)
>>> +{
>>> +	return (unsigned long)unsafe_src >=3D TASK_SIZE_MAX;
>>> +}
>>=20
>> Is there a reason we're using TASK_SIZE_MAX?
>
> No special reason, that's just copied from x86.
>
>> It's copy from *kernel* (nofault) allowed, so shouldn't we be checking
>> that the address plausibly points at kernel memory? Not at no-man's land
>> above TASK_SIZE_MAX but below the start of kernel memory?
>
> Yes, on PPC64 that's right. On PPC32 the kernel memory starts where the u=
serland stops.

Yep sorry I was talking about 64-bit there.

>> We have is_kernel_addr() which already encapsulates some platform quirks
>> around that logic, it seems like it would be a better fit?
>
> Yes probably, I send v2. For PPC32 that's a comparison with TASK_SIZE tho=
ught.

Yeah, so it's the same test for PPC32 but I think is_kernel_addr() is
better on 64-bit.

I'll grab your v2.

cheers
