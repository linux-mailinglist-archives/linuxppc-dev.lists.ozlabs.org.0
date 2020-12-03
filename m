Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 835192CD505
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 12:59:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmvXM1kT9zDqtK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 22:59:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmvRd6DlNzDr1X
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 22:55:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=O5uBCrwF; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CmvRd42wQz9ryj;
 Thu,  3 Dec 2020 22:55:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606996541;
 bh=LVO4s9uIVveCgBubOjnui+gjJXlUQnDqrs3xghQjPUM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=O5uBCrwFrtUjkNJP7Q8upqCfsLkZ3j11YiRaq284cVEQNcphSRlneehNq3Jlh1Cf2
 6wrPIF25Fp9o2+u6PK83mudOUq5ZybC7X6j+MX60saikZFjPzSA5xeK4XtoQbBQEEt
 TUTgTF4u/uqu1XaEQ8PbIVnGFplvfmz6sveMdpQs1Y0yht0TBZy0ZP8V29KzxYu5hd
 IwkdO+U/XHs7kslQYBSqPg77l8Rn/Vly+Z8RusvNDKw4UAgUZ04JOzTRzT2SEDzZ51
 pGFbmbgLXBaq5Qp4OL68NR4sP/RHaBXwIzFIjq/Awk0ASXlXbOhwioKBf6gjJRP6Wq
 +hQbSSxPOPk8A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/mm: Don't see NULL pointer dereference as a KUAP
 fault
In-Reply-To: <8b865b93d25c15c8e6d41e71c368bfc28da4489d.1606816701.git.christophe.leroy@csgroup.eu>
References: <8b865b93d25c15c8e6d41e71c368bfc28da4489d.1606816701.git.christophe.leroy@csgroup.eu>
Date: Thu, 03 Dec 2020 22:55:40 +1100
Message-ID: <87mtyvumrn.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Sometimes, NULL pointer dereferences are expected. Even when they
> are accidental they are unlikely an exploit attempt because the
> first page is never mapped.

The first page can be mapped if mmap_min_addr is 0.

Blocking all faults to the first page would potentially break any
program that does that.

Also if there is something mapped at 0 it's a good chance it is an
exploit attempt :)

cheers


> The exemple below shows what we get when invoking the "show task"
> sysrq handler, by writing 't' in /proc/sysrq-trigger
>
> [ 1117.202054] ------------[ cut here ]------------
> [ 1117.202102] Bug: fault blocked by AP register !
> [ 1117.202261] WARNING: CPU: 0 PID: 377 at arch/powerpc/include/asm/nohash/32/kup-8xx.h:66 do_page_fault+0x4a8/0x5ec
> [ 1117.202310] Modules linked in:
> [ 1117.202428] CPU: 0 PID: 377 Comm: sh Tainted: G        W         5.10.0-rc5-s3k-dev-01340-g83f53be2de31-dirty #4175
> [ 1117.202499] NIP:  c0012048 LR: c0012048 CTR: 00000000
> [ 1117.202573] REGS: cacdbb88 TRAP: 0700   Tainted: G        W          (5.10.0-rc5-s3k-dev-01340-g83f53be2de31-dirty)
> [ 1117.202625] MSR:  00021032 <ME,IR,DR,RI>  CR: 24082222  XER: 20000000
> [ 1117.202899]
> [ 1117.202899] GPR00: c0012048 cacdbc40 c2929290 00000023 c092e554 00000001 c09865e8 c092e640
> [ 1117.202899] GPR08: 00001032 00000000 00000000 00014efc 28082224 100d166a 100a0920 00000000
> [ 1117.202899] GPR16: 100cac0c 100b0000 1080c3fc 1080d685 100d0000 100d0000 00000000 100a0900
> [ 1117.202899] GPR24: 100d0000 c07892ec 00000000 c0921510 c21f4440 0000005c c0000000 cacdbc80
> [ 1117.204362] NIP [c0012048] do_page_fault+0x4a8/0x5ec
> [ 1117.204461] LR [c0012048] do_page_fault+0x4a8/0x5ec
> [ 1117.204509] Call Trace:
> [ 1117.204609] [cacdbc40] [c0012048] do_page_fault+0x4a8/0x5ec (unreliable)
> [ 1117.204771] [cacdbc70] [c00112f0] handle_page_fault+0x8/0x34
> [ 1117.204911] --- interrupt: 301 at copy_from_kernel_nofault+0x70/0x1c0
> [ 1117.204979] NIP:  c010dbec LR: c010dbac CTR: 00000001
> [ 1117.205053] REGS: cacdbc80 TRAP: 0301   Tainted: G        W          (5.10.0-rc5-s3k-dev-01340-g83f53be2de31-dirty)
> [ 1117.205104] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 28082224  XER: 00000000
> [ 1117.205416] DAR: 0000005c DSISR: c0000000
> [ 1117.205416] GPR00: c0045948 cacdbd38 c2929290 00000001 00000017 00000017 00000027 0000000f
> [ 1117.205416] GPR08: c09926ec 00000000 00000000 3ffff000 24082224
> [ 1117.206106] NIP [c010dbec] copy_from_kernel_nofault+0x70/0x1c0
> [ 1117.206202] LR [c010dbac] copy_from_kernel_nofault+0x30/0x1c0
> [ 1117.206258] --- interrupt: 301
> [ 1117.206372] [cacdbd38] [c004bbb0] kthread_probe_data+0x44/0x70 (unreliable)
> [ 1117.206561] [cacdbd58] [c0045948] print_worker_info+0xe0/0x194
> [ 1117.206717] [cacdbdb8] [c00548ac] sched_show_task+0x134/0x168
> [ 1117.206851] [cacdbdd8] [c005a268] show_state_filter+0x70/0x100
> [ 1117.206989] [cacdbe08] [c039baa0] sysrq_handle_showstate+0x14/0x24
> [ 1117.207122] [cacdbe18] [c039bf18] __handle_sysrq+0xac/0x1d0
> [ 1117.207257] [cacdbe48] [c039c0c0] write_sysrq_trigger+0x4c/0x74
> [ 1117.207407] [cacdbe68] [c01fba48] proc_reg_write+0xb4/0x114
> [ 1117.207550] [cacdbe88] [c0179968] vfs_write+0x12c/0x478
> [ 1117.207686] [cacdbf08] [c0179e60] ksys_write+0x78/0x128
> [ 1117.207826] [cacdbf38] [c00110d0] ret_from_syscall+0x0/0x34
> [ 1117.207938] --- interrupt: c01 at 0xfd4e784
> [ 1117.208008] NIP:  0fd4e784 LR: 0fe0f244 CTR: 10048d38
> [ 1117.208083] REGS: cacdbf48 TRAP: 0c01   Tainted: G        W          (5.10.0-rc5-s3k-dev-01340-g83f53be2de31-dirty)
> [ 1117.208134] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 44002222  XER: 00000000
> [ 1117.208470]
> [ 1117.208470] GPR00: 00000004 7fc34090 77bfb4e0 00000001 1080fa40 00000002 7400000f fefefeff
> [ 1117.208470] GPR08: 7f7f7f7f 10048d38 1080c414 7fc343c0 00000000
> [ 1117.209104] NIP [0fd4e784] 0xfd4e784
> [ 1117.209180] LR [0fe0f244] 0xfe0f244
> [ 1117.209236] --- interrupt: c01
> [ 1117.209274] Instruction dump:
> [ 1117.209353] 714a4000 418200f0 73ca0001 40820084 73ca0032 408200f8 73c90040 4082ff60
> [ 1117.209727] 0fe00000 3c60c082 386399f4 48013b65 <0fe00000> 80010034 3860000b 7c0803a6
> [ 1117.210102] ---[ end trace 1927c0323393af3e ]---
>
> So, avoid the big KUAP warning by bailing out of bad_kernel_fault()
> before calling bad_kuap_fault() when address references the first
> page.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/mm/fault.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 0add963a849b..be2b4318206f 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -198,6 +198,10 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
>  {
>  	int is_exec = TRAP(regs) == 0x400;
>  
> +	// Kernel fault on first page is likely a NULL pointer dereference
> +	if (address < PAGE_SIZE)
> +		return true;
> +
>  	/* NX faults set DSISR_PROTFAULT on the 8xx, DSISR_NOEXEC_OR_G on others */
>  	if (is_exec && (error_code & (DSISR_NOEXEC_OR_G | DSISR_KEYFAULT |
>  				      DSISR_PROTFAULT))) {
> -- 
> 2.25.0
