Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCC92D1712
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 18:04:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqV646KXfzDqT2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 04:04:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqV4J1SMTzDqSm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 04:02:55 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CqV464Yh0z9txln;
 Mon,  7 Dec 2020 18:02:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id hia-XaxYLM7o; Mon,  7 Dec 2020 18:02:46 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CqV463HzZz9txll;
 Mon,  7 Dec 2020 18:02:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 435B08B7AA;
 Mon,  7 Dec 2020 18:02:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id eVlC-uRPYUOZ; Mon,  7 Dec 2020 18:02:50 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 63CCF8B7A1;
 Mon,  7 Dec 2020 18:02:43 +0100 (CET)
Subject: Re: [PATCH] powerpc/mm: Fix KUAP warning by providing
 copy_from_kernel_nofault_allowed()
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, hch@lst.de, viro@zeniv.linux.org.uk,
 akpm@linux-foundation.org
References: <e559e60c43f679195bfe4c7b0a301431c6f02c7a.1607157766.git.christophe.leroy@csgroup.eu>
 <87ft4itqdw.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <edac4edc-2d2d-cc80-c5fb-a82d7d73a913@csgroup.eu>
Date: Mon, 7 Dec 2020 18:02:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <87ft4itqdw.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/12/2020 à 01:24, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Since commit c33165253492 ("powerpc: use non-set_fs based maccess
>> routines"), userspace access is not granted anymore when using
>> copy_from_kernel_nofault()
>>
>> However, kthread_probe_data() uses copy_from_kernel_nofault()
>> to check validity of pointers. When the pointer is NULL,
>> it points to userspace, leading to a KUAP fault and triggering
>> the following big hammer warning many times when you request
>> a sysrq "show task":
>>
>> [ 1117.202054] ------------[ cut here ]------------
>> [ 1117.202102] Bug: fault blocked by AP register !
>> [ 1117.202261] WARNING: CPU: 0 PID: 377 at arch/powerpc/include/asm/nohash/32/kup-8xx.h:66 do_page_fault+0x4a8/0x5ec
>> [ 1117.202310] Modules linked in:
>> [ 1117.202428] CPU: 0 PID: 377 Comm: sh Tainted: G        W         5.10.0-rc5-01340-g83f53be2de31-dirty #4175
>> [ 1117.202499] NIP:  c0012048 LR: c0012048 CTR: 00000000
>> [ 1117.202573] REGS: cacdbb88 TRAP: 0700   Tainted: G        W          (5.10.0-rc5-01340-g83f53be2de31-dirty)
>> [ 1117.202625] MSR:  00021032 <ME,IR,DR,RI>  CR: 24082222  XER: 20000000
>> [ 1117.202899]
>> [ 1117.202899] GPR00: c0012048 cacdbc40 c2929290 00000023 c092e554 00000001 c09865e8 c092e640
>> [ 1117.202899] GPR08: 00001032 00000000 00000000 00014efc 28082224 100d166a 100a0920 00000000
>> [ 1117.202899] GPR16: 100cac0c 100b0000 1080c3fc 1080d685 100d0000 100d0000 00000000 100a0900
>> [ 1117.202899] GPR24: 100d0000 c07892ec 00000000 c0921510 c21f4440 0000005c c0000000 cacdbc80
>> [ 1117.204362] NIP [c0012048] do_page_fault+0x4a8/0x5ec
>> [ 1117.204461] LR [c0012048] do_page_fault+0x4a8/0x5ec
>> [ 1117.204509] Call Trace:
>> [ 1117.204609] [cacdbc40] [c0012048] do_page_fault+0x4a8/0x5ec (unreliable)
>> [ 1117.204771] [cacdbc70] [c00112f0] handle_page_fault+0x8/0x34
>> [ 1117.204911] --- interrupt: 301 at copy_from_kernel_nofault+0x70/0x1c0
>> [ 1117.204979] NIP:  c010dbec LR: c010dbac CTR: 00000001
>> [ 1117.205053] REGS: cacdbc80 TRAP: 0301   Tainted: G        W          (5.10.0-rc5-01340-g83f53be2de31-dirty)
>> [ 1117.205104] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 28082224  XER: 00000000
>> [ 1117.205416] DAR: 0000005c DSISR: c0000000
>> [ 1117.205416] GPR00: c0045948 cacdbd38 c2929290 00000001 00000017 00000017 00000027 0000000f
>> [ 1117.205416] GPR08: c09926ec 00000000 00000000 3ffff000 24082224
>> [ 1117.206106] NIP [c010dbec] copy_from_kernel_nofault+0x70/0x1c0
>> [ 1117.206202] LR [c010dbac] copy_from_kernel_nofault+0x30/0x1c0
>> [ 1117.206258] --- interrupt: 301
>> [ 1117.206372] [cacdbd38] [c004bbb0] kthread_probe_data+0x44/0x70 (unreliable)
>> [ 1117.206561] [cacdbd58] [c0045948] print_worker_info+0xe0/0x194
>> [ 1117.206717] [cacdbdb8] [c00548ac] sched_show_task+0x134/0x168
>> [ 1117.206851] [cacdbdd8] [c005a268] show_state_filter+0x70/0x100
>> [ 1117.206989] [cacdbe08] [c039baa0] sysrq_handle_showstate+0x14/0x24
>> [ 1117.207122] [cacdbe18] [c039bf18] __handle_sysrq+0xac/0x1d0
>> [ 1117.207257] [cacdbe48] [c039c0c0] write_sysrq_trigger+0x4c/0x74
>> [ 1117.207407] [cacdbe68] [c01fba48] proc_reg_write+0xb4/0x114
>> [ 1117.207550] [cacdbe88] [c0179968] vfs_write+0x12c/0x478
>> [ 1117.207686] [cacdbf08] [c0179e60] ksys_write+0x78/0x128
>> [ 1117.207826] [cacdbf38] [c00110d0] ret_from_syscall+0x0/0x34
>> [ 1117.207938] --- interrupt: c01 at 0xfd4e784
>> [ 1117.208008] NIP:  0fd4e784 LR: 0fe0f244 CTR: 10048d38
>> [ 1117.208083] REGS: cacdbf48 TRAP: 0c01   Tainted: G        W          (5.10.0-rc5-01340-g83f53be2de31-dirty)
>> [ 1117.208134] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 44002222  XER: 00000000
>> [ 1117.208470]
>> [ 1117.208470] GPR00: 00000004 7fc34090 77bfb4e0 00000001 1080fa40 00000002 7400000f fefefeff
>> [ 1117.208470] GPR08: 7f7f7f7f 10048d38 1080c414 7fc343c0 00000000
>> [ 1117.209104] NIP [0fd4e784] 0xfd4e784
>> [ 1117.209180] LR [0fe0f244] 0xfe0f244
>> [ 1117.209236] --- interrupt: c01
>> [ 1117.209274] Instruction dump:
>> [ 1117.209353] 714a4000 418200f0 73ca0001 40820084 73ca0032 408200f8 73c90040 4082ff60
>> [ 1117.209727] 0fe00000 3c60c082 386399f4 48013b65 <0fe00000> 80010034 3860000b 7c0803a6
>> [ 1117.210102] ---[ end trace 1927c0323393af3e ]---
>>
>> To avoid that, copy_from_kernel_nofault_allowed() is used to check
>> whether the address is a valid kernel address. But the default
>> version of it returns true for any address.
>>
>> Provide a powerpc version of copy_from_kernel_nofault_allowed()
>> that returns false when the address is below TASK_USER_MAX,
>> so that copy_from_kernel_nofault() will return -ERANGE.
>>
>> Reported-by: Qian Cai <qcai@redhat.com>
>> Fixes: c33165253492 ("powerpc: use non-set_fs based maccess routines")
>> Cc: Christoph Hellwig <hch@lst.de>
>> Cc: Al Viro <viro@zeniv.linux.org.uk>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>> This issue was introduced in 5.10. I didn't mark it for stable, hopping it will go into 5.10-rc7
>> ---
>>   arch/powerpc/mm/Makefile  | 2 +-
>>   arch/powerpc/mm/maccess.c | 9 +++++++++
>>   2 files changed, 10 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/powerpc/mm/maccess.c
>>
>> diff --git a/arch/powerpc/mm/maccess.c b/arch/powerpc/mm/maccess.c
>> new file mode 100644
>> index 000000000000..56e97c0fb233
>> --- /dev/null
>> +++ b/arch/powerpc/mm/maccess.c
>> @@ -0,0 +1,9 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +#include <linux/uaccess.h>
>> +#include <linux/kernel.h>
>> +
>> +bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
>> +{
>> +	return (unsigned long)unsafe_src >= TASK_SIZE_MAX;
>> +}
> 
> Is there a reason we're using TASK_SIZE_MAX?

No special reason, that's just copied from x86.

> 
> It's copy from *kernel* (nofault) allowed, so shouldn't we be checking
> that the address plausibly points at kernel memory? Not at no-man's land
> above TASK_SIZE_MAX but below the start of kernel memory?

Yes, on PPC64 that's right. On PPC32 the kernel memory starts where the userland stops.

> 
> We have is_kernel_addr() which already encapsulates some platform quirks
> around that logic, it seems like it would be a better fit?

Yes probably, I send v2. For PPC32 that's a comparison with TASK_SIZE thought.

> 
> ie:
> 
> bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
> {
> 	return is_kernel_addr((unsigned long)unsafe_src);
> }
> 
> cheers
> 

Christophe
