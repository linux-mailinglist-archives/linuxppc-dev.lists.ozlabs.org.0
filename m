Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7FD1A0A9F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 11:59:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xNDg674fzDqQC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 19:59:47 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xNBl4lWTzDqjQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 19:58:07 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 51A19AC44;
 Tue,  7 Apr 2020 09:58:01 +0000 (UTC)
Date: Tue, 7 Apr 2020 11:57:58 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v12 5/8] powerpc/64: make buildable without CONFIG_COMPAT
Message-ID: <20200407095758.GF25468@kitsune.suse.cz>
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <cover.1584699455.git.msuchanek@suse.de>
 <e5619617020ef3a1f54f0c076e7d74cb9ec9f3bf.1584699455.git.msuchanek@suse.de>
 <b420b304-05e9-df58-7149-31169b0b01e2@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b420b304-05e9-df58-7149-31169b0b01e2@c-s.fr>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Gustavo Luiz Duarte <gustavold@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Jiri Olsa <jolsa@redhat.com>, Rob Herring <robh@kernel.org>,
 Michael Neuling <mikey@neuling.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jordan Niethe <jniethe5@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicholas Piggin <npiggin@gmail.com>, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Eric Richter <erichte@linux.ibm.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 07, 2020 at 07:50:30AM +0200, Christophe Leroy wrote:
> 
> 
> Le 20/03/2020 à 11:20, Michal Suchanek a écrit :
> > There are numerous references to 32bit functions in generic and 64bit
> > code so ifdef them out.
> > 
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > ---
> > v2:
> > - fix 32bit ifdef condition in signal.c
> > - simplify the compat ifdef condition in vdso.c - 64bit is redundant
> > - simplify the compat ifdef condition in callchain.c - 64bit is redundant
> > v3:
> > - use IS_ENABLED and maybe_unused where possible
> > - do not ifdef declarations
> > - clean up Makefile
> > v4:
> > - further makefile cleanup
> > - simplify is_32bit_task conditions
> > - avoid ifdef in condition by using return
> > v5:
> > - avoid unreachable code on 32bit
> > - make is_current_64bit constant on !COMPAT
> > - add stub perf_callchain_user_32 to avoid some ifdefs
> > v6:
> > - consolidate current_is_64bit
> > v7:
> > - remove leftover perf_callchain_user_32 stub from previous series version
> > v8:
> > - fix build again - too trigger-happy with stub removal
> > - remove a vdso.c hunk that causes warning according to kbuild test robot
> > v9:
> > - removed current_is_64bit in previous patch
> > v10:
> > - rebase on top of 70ed86f4de5bd
> > ---
> >   arch/powerpc/include/asm/thread_info.h | 4 ++--
> >   arch/powerpc/kernel/Makefile           | 6 +++---
> >   arch/powerpc/kernel/entry_64.S         | 2 ++
> >   arch/powerpc/kernel/signal.c           | 3 +--
> >   arch/powerpc/kernel/syscall_64.c       | 6 ++----
> >   arch/powerpc/kernel/vdso.c             | 3 ++-
> >   arch/powerpc/perf/callchain.c          | 8 +++++++-
> >   7 files changed, 19 insertions(+), 13 deletions(-)
> > 
> 
> [...]
> 
> > diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
> > index 87d95b455b83..2dcbfe38f5ac 100644
> > --- a/arch/powerpc/kernel/syscall_64.c
> > +++ b/arch/powerpc/kernel/syscall_64.c
> > @@ -24,7 +24,6 @@ notrace long system_call_exception(long r3, long r4, long r5,
> >   				   long r6, long r7, long r8,
> >   				   unsigned long r0, struct pt_regs *regs)
> >   {
> > -	unsigned long ti_flags;
> >   	syscall_fn f;
> >   	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
> > @@ -68,8 +67,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
> >   	local_irq_enable();
> > -	ti_flags = current_thread_info()->flags;
> > -	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
> > +	if (unlikely(current_thread_info()->flags & _TIF_SYSCALL_DOTRACE)) {
> >   		/*
> >   		 * We use the return value of do_syscall_trace_enter() as the
> >   		 * syscall number. If the syscall was rejected for any reason
> > @@ -94,7 +92,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
> >   	/* May be faster to do array_index_nospec? */
> >   	barrier_nospec();
> > -	if (unlikely(ti_flags & _TIF_32BIT)) {
> > +	if (unlikely(is_32bit_task())) {
> 
> is_compat() should be used here instead, because we dont want to use
is_compat_task()
> compat_sys_call_table() on PPC32.
> 
> >   		f = (void *)compat_sys_call_table[r0];
> >   		r3 &= 0x00000000ffffffffULL;
> 
That only applies once you use this for 32bit as well. Right now it's
64bit only so the two are the same.

Thanks

Michal
