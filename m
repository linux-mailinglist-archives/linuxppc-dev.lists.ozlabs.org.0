Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD46268B69
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 14:48:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BqmPt11QkzDqSp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 22:48:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqmLy69StzDqR7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Sep 2020 22:46:18 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 586A5AC79;
 Mon, 14 Sep 2020 12:46:30 +0000 (UTC)
Date: Mon, 14 Sep 2020 14:46:12 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/traps: fix recoverability of machine check
 handling on book3s/32
Message-ID: <20200914124612.GC29778@kitsune.suse.cz>
References: <1c804764d38fb084b420b12ca13e8c1b2dea075e.1548166189.git.christophe.leroy@c-s.fr>
 <20200911091542.GE29521@kitsune.suse.cz>
 <87pn6sqweq.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pn6sqweq.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 11, 2020 at 11:23:57PM +1000, Michael Ellerman wrote:
> Michal Suchánek <msuchanek@suse.de> writes:
> > Hello,
> >
> > does this logic apply to "Unrecoverable System Reset" as well?
> 
> Which logic do you mean?
> 
> We do call die() before checking MSR_RI in system_reset_exception():
> 
>   	/*
>   	 * No debugger or crash dump registered, print logs then
>   	 * panic.
>   	 */
>   	die("System Reset", regs, SIGABRT);
>   
>   	mdelay(2*MSEC_PER_SEC); /* Wait a little while for others to print */
>   	add_taint(TAINT_DIE, LOCKDEP_NOW_UNRELIABLE);
>   	nmi_panic(regs, "System Reset");
>   
>   out:
>   #ifdef CONFIG_PPC_BOOK3S_64
>   	BUG_ON(get_paca()->in_nmi == 0);
>   	if (get_paca()->in_nmi > 1)
>   		die("Unrecoverable nested System Reset", regs, SIGABRT);
>   #endif
>   	/* Must die if the interrupt is not recoverable */
>   	if (!(regs->msr & MSR_RI))
>   		die("Unrecoverable System Reset", regs, SIGABRT);
> 
> 
> So you should see the output from die("System Reset", ...) even if
> MSR[RI] was clear when you took the system reset.

Indeed, replied to the wrong patch. I was looking at daf00ae71dad
("powerpc/traps: restore recoverability of machine_check interrupts")
which has very similar commit message.

Sorry about the confusion.

Thanks

Michal

> 
> cheers
> 
> > On Tue, Jan 22, 2019 at 02:11:24PM +0000, Christophe Leroy wrote:
> >> Looks like book3s/32 doesn't set RI on machine check, so
> >> checking RI before calling die() will always be fatal
> >> allthought this is not an issue in most cases.
> >> 
> >> Fixes: b96672dd840f ("powerpc: Machine check interrupt is a non-maskable interrupt")
> >> Fixes: daf00ae71dad ("powerpc/traps: restore recoverability of machine_check interrupts")
> >> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> >> Cc: stable@vger.kernel.org
> >> ---
> >>  arch/powerpc/kernel/traps.c | 8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >> 
> >> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> >> index 64936b60d521..c740f8bfccc9 100644
> >> --- a/arch/powerpc/kernel/traps.c
> >> +++ b/arch/powerpc/kernel/traps.c
> >> @@ -763,15 +763,15 @@ void machine_check_exception(struct pt_regs *regs)
> >>  	if (check_io_access(regs))
> >>  		goto bail;
> >>  
> >> -	/* Must die if the interrupt is not recoverable */
> >> -	if (!(regs->msr & MSR_RI))
> >> -		nmi_panic(regs, "Unrecoverable Machine check");
> >> -
> >>  	if (!nested)
> >>  		nmi_exit();
> >>  
> >>  	die("Machine check", regs, SIGBUS);
> >>  
> >> +	/* Must die if the interrupt is not recoverable */
> >> +	if (!(regs->msr & MSR_RI))
> >> +		nmi_panic(regs, "Unrecoverable Machine check");
> >> +
> >>  	return;
> >>  
> >>  bail:
> >> -- 
> >> 2.13.3
> >> 
