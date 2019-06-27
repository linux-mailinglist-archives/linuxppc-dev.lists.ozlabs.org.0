Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6341F57BAC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 07:57:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Z8Lb36hhzDqcM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 15:57:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Z8Jj2J9szDq77
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 15:55:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45Z8Jh17Szz9s4Y;
 Thu, 27 Jun 2019 15:55:48 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] recordmcount: Fix spurious mcount entries on powerpc
In-Reply-To: <20190626183801.31247-1-naveen.n.rao@linux.vnet.ibm.com>
References: <20190626183801.31247-1-naveen.n.rao@linux.vnet.ibm.com>
Date: Thu, 27 Jun 2019 15:55:47 +1000
Message-ID: <8736jvtvvg.fsf@concordia.ellerman.id.au>
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

"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
> The recent change enabling HAVE_C_RECORDMCOUNT on powerpc started
> showing the following issue:
>
>   # modprobe kprobe_example
>    ftrace-powerpc: Not expected bl: opcode is 3c4c0001
>    WARNING: CPU: 0 PID: 227 at kernel/trace/ftrace.c:2001 ftrace_bug+0x90/0x318
>    Modules linked in:
>    CPU: 0 PID: 227 Comm: modprobe Not tainted 5.2.0-rc6-00678-g1c329100b942 #2
>    NIP:  c000000000264318 LR: c00000000025d694 CTR: c000000000f5cd30
>    REGS: c000000001f2b7b0 TRAP: 0700   Not tainted  (5.2.0-rc6-00678-g1c329100b942)
>    MSR:  900000010282b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE,TM[E]>  CR: 28228222  XER: 00000000
>    CFAR: c0000000002642fc IRQMASK: 0
>    <snip>
>    NIP [c000000000264318] ftrace_bug+0x90/0x318
>    LR [c00000000025d694] ftrace_process_locs+0x4f4/0x5e0
>    Call Trace:
>    [c000000001f2ba40] [0000000000000004] 0x4 (unreliable)
>    [c000000001f2bad0] [c00000000025d694] ftrace_process_locs+0x4f4/0x5e0
>    [c000000001f2bb90] [c00000000020ff10] load_module+0x25b0/0x30c0
>    [c000000001f2bd00] [c000000000210cb0] sys_finit_module+0xc0/0x130
>    [c000000001f2be20] [c00000000000bda4] system_call+0x5c/0x70
>    Instruction dump:
>    419e0018 2f83ffff 419e00bc 2f83ffea 409e00cc 4800001c 0fe00000 3c62ff96
>    39000001 39400000 386386d0 480000c4 <0fe00000> 3ce20003 39000001 3c62ff96
>    ---[ end trace 4c438d5cebf78381 ]---
>    ftrace failed to modify
>    [<c0080000012a0008>] 0xc0080000012a0008
>     actual:   01:00:4c:3c
>    Initializing ftrace call sites
>    ftrace record flags: 2000000
>     (0)
>     expected tramp: c00000000006af4c

Aha, thanks. I saw that on one of my text boxes but hadn't pinned it
down to this commit.

> Fixes: c7d64b560ce80 ("powerpc/ftrace: Enable C Version of recordmcount")

That commit is the tip of my next, so I'll drop it for now and merge
them in the other order so there's breakage.

Steve are you OK if I merge this via the powerpc tree? I'll reword the
commit message so that it makes sense coming prior to the commit
mentioned above.

cheers

> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  scripts/recordmcount.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/recordmcount.h b/scripts/recordmcount.h
> index 13c5e6c8829c..47fca2c69a73 100644
> --- a/scripts/recordmcount.h
> +++ b/scripts/recordmcount.h
> @@ -325,7 +325,8 @@ static uint_t *sift_rel_mcount(uint_t *mlocp,
>  		if (!mcountsym)
>  			mcountsym = get_mcountsym(sym0, relp, str0);
>  
> -		if (mcountsym == Elf_r_sym(relp) && !is_fake_mcount(relp)) {
> +		if (mcountsym && mcountsym == Elf_r_sym(relp) &&
> +				!is_fake_mcount(relp)) {
>  			uint_t const addend =
>  				_w(_w(relp->r_offset) - recval + mcount_adjust);
>  			mrelp->r_offset = _w(offbase
> -- 
> 2.22.0
