Return-Path: <linuxppc-dev+bounces-5536-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3266A1AD55
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2025 00:43:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YfHZQ1KFzz2ynj;
	Fri, 24 Jan 2025 10:43:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737675806;
	cv=none; b=ffbUb253ivjozEQix9t9t5riuCEyQlhHdfNWp2T9/9BBP2JRkyIO8niLgVYayveVgzgAx9/osQDKNoqsadFB+WSU1CTyJ8AdWETZg4oTvyFWui8IbMTXZ5C2w4S+0JRgTCYWrlgJ3Ibyvb4932kVxGymua3smNxZ8P5QA84TUL9fbTWeO7qrFnPc7OHjI6vbSdA29El6JUL1IPLjf1ownxqxJCx/6W/KodmCg7gCSgNCLL15MiviTX6X9yN2WUSQn296dihH3lrCE+U5Jx0zZ51sheSAZJ/KaLyVTpibNwOzos/W4cU3SoTc9k4jveveWnNU5jjlhg0pFs0yJgg9Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737675806; c=relaxed/relaxed;
	bh=hHABM21sXVImFIPkcnBEGI87bXoHCJGDVaErbT5cLh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RzqG1ZhmOjSTAhHJILTLrsUsRHB/7jsK6UZA7RB2Ab22SKAlj1qqAU7u0yQUWfs0dY6xTzKd1mKtr/42CZ4WJon1UhvLM4UFNV339MQQlZH7I4lc0hi4MQ98PKBT6Qdxci09QGCpT/NzGUtRGKBUu42re3p5V7V/EOz4UPyzWZ/6CCaFw/j5kZSkY7OleZmc8V/pFtGvl7SmrD3ndo0LAsZnpLeqQI+M1PLp8nOwFTRZngmaSQqbz4MrjD9l5+twTSHfy6yoU/fm+PJYsU4DUWpukFObdv95uo60hb+Ttd55a2v8KvFhSoWYMNkXF4Cg542Ux6MK+IgEamFFICFfsA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YfHZN60wlz2yLr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 10:43:24 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 2DB2072C8CC;
	Fri, 24 Jan 2025 02:43:22 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 1ABC77CCB3A; Fri, 24 Jan 2025 01:43:22 +0200 (IST)
Date: Fri, 24 Jan 2025 01:43:22 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Alexey Gladkov <legion@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] powerpc: properly negate error in
 syscall_set_return_value()
Message-ID: <20250123234321.GA23582@strace.io>
References: <20250113171054.GA589@strace.io>
 <6558110c-c2cb-4aa3-9472-b3496f71ebb8@csgroup.eu>
 <20250114170400.GB11820@strace.io>
 <d249e9e2-511a-46af-bd6e-397812b67058@csgroup.eu>
 <20250123182815.GA20994@strace.io>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250123182815.GA20994@strace.io>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 23, 2025 at 08:28:15PM +0200, Dmitry V. Levin wrote:
> On Mon, Jan 20, 2025 at 02:51:38PM +0100, Christophe Leroy wrote:
> > Le 14/01/2025 à 18:04, Dmitry V. Levin a écrit :
> > > On Mon, Jan 13, 2025 at 06:34:44PM +0100, Christophe Leroy wrote:
> > >> Le 13/01/2025 à 18:10, Dmitry V. Levin a écrit :
> > >>> Bring syscall_set_return_value() in sync with syscall_get_error(),
> > >>> and let upcoming ptrace/set_syscall_info selftest pass on powerpc.
> > >>>
> > >>> This reverts commit 1b1a3702a65c ("powerpc: Don't negate error in
> > >>> syscall_set_return_value()").
> > >>
> > >> There is a clear detailed explanation in that commit of why it needs to
> > >> be done.
> > >>
> > >> If you think that commit is wrong you have to explain why with at least
> > >> the same level of details.
> > > 
> > > OK, please have a look whether this explanation is clear and detailed enough:
> > > 
> > > =======
> > > powerpc: properly negate error in syscall_set_return_value()
> > > 
> > > When syscall_set_return_value() is used to set an error code, the caller
> > > specifies it as a negative value in -ERRORCODE form.
> > > 
> > > In !trap_is_scv case the error code is traditionally stored as follows:
> > > gpr[3] contains a positive ERRORCODE, and ccr has 0x10000000 flag set.
> > > Here are a few examples to illustrate this convention.  The first one
> > > is from syscall_get_error():
> > >          /*
> > >           * If the system call failed,
> > >           * regs->gpr[3] contains a positive ERRORCODE.
> > >           */
> > >          return (regs->ccr & 0x10000000UL) ? -regs->gpr[3] : 0;
> > > 
> > > The second example is from regs_return_value():
> > >          if (is_syscall_success(regs))
> > >                  return regs->gpr[3];
> > >          else
> > >                  return -regs->gpr[3];
> > > 
> > > The third example is from check_syscall_restart():
> > >          regs->result = -EINTR;
> > >          regs->gpr[3] = EINTR;
> > >          regs->ccr |= 0x10000000;
> > > 
> > > Compared with these examples, the failure of syscall_set_return_value()
> > > to assign a positive ERRORCODE into regs->gpr[3] is clearly visible:
> > > 	/*
> > > 	 * In the general case it's not obvious that we must deal with
> > > 	 * CCR here, as the syscall exit path will also do that for us.
> > > 	 * However there are some places, eg. the signal code, which
> > > 	 * check ccr to decide if the value in r3 is actually an error.
> > > 	 */
> > > 	if (error) {
> > > 		regs->ccr |= 0x10000000L;
> > > 		regs->gpr[3] = error;
> > > 	} else {
> > > 		regs->ccr &= ~0x10000000L;
> > > 		regs->gpr[3] = val;
> > > 	}
> > > 
> > > This fix brings syscall_set_return_value() in sync with syscall_get_error()
> > > and lets upcoming ptrace/set_syscall_info selftest pass on powerpc.
> > > 
> > > Fixes: 1b1a3702a65c ("powerpc: Don't negate error in syscall_set_return_value()").
> > > =======
> > 
> > I think there is still something going wrong.
> > 
> > do_seccomp() sets regs->gpr[3] = -ENOSYS; by default.
> > 
> > Then it calls __secure_computing() which returns what __seccomp_filter() 
> > returns.
> > 
> > In case of error, __seccomp_filter() calls syscall_set_return_value() 
> > with a negative value then returns -1
> > 
> > do_seccomp() is called by do_syscall_trace_enter() which returns -1 when 
> > do_seccomp() doesn't return 0.
> > 
> > do_syscall_trace_enter() is called by system_call_exception() and 
> > returns -1, so syscall_exception() returns regs->gpr[3]
> > 
> > In entry_32.S, transfer_to_syscall, syscall_exit_prepare() is then 
> > called with the return of syscall_exception() as first parameter, which 
> > leads to:
> > 
> > 	if (unlikely(r3 >= (unsigned long)-MAX_ERRNO) && is_not_scv) {
> > 		if (likely(!(ti_flags & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
> > 			r3 = -r3;
> > 			regs->ccr |= 0x10000000; /* Set SO bit in CR */
> > 		}
> > 	}
> > 
> > By chance, because you have already changed the sign of gpr[3], the 
> > above test fails and nothing is done to r3, and because you have also 
> > already set regs->ccr it works.
> > 
> > But all this looks inconsistent with the fact that do_seccomp sets 
> > -ENOSYS as default value
> > 
> > Also, when do_seccomp() returns 0, do_syscall_trace_enter() check the 
> > syscall number and when it is wrong it goes to skip: which sets 
> > regs->gpr[3] = -ENOSYS;
> > 
> > So really I think it is not in line with your changes to set positive 
> > value in gpr[3].
> > 
> > Maybe your change is still correct but it needs to be handled completely 
> > in that case.
> 
> Indeed, there is an inconsistency in !trap_is_scv case.
> 
> In some places such as syscall_get_error() and regs_return_value() the
> semantics is as I described earlier: gpr[3] contains a positive ERRORCODE
> and ccr has 0x10000000 flag set.  This semantics is a part of the ABI and
> therefore cannot be changed.
> 
> In some other places like do_seccomp() and do_syscall_trace_enter() the
> semantics is similar to the trap_is_scv case: gpr[3] contains a negative
> ERRORCODE and ccr is unchanged.  In addition, system_call_exception()
> returns the system call function return value when it is executed, and
> gpr[3] otherwise.  The value returned by system_call_exception() is passed
> on to syscall_exit_prepare() which performs the conversion you mentioned.
> 
> What's remarkable is that in those places that are a part of the ABI the
> traditional semantics is kept, while in other places the implementation
> follows the trap_is_scv-like semantics, while traditional semantics is
> also supported there.
> 
> The only case where I see some intersection is do_seccomp() where the
> tracer would be able to see -ENOSYS in gpr[3].  However, the seccomp stop
> is not the place where the tracer *reads* the system call exit status,
> so whatever was written in gpr[3] before __secure_computing() is not
> really relevant, consequently, selftests/seccomp/seccomp_bpf passes with
> this patch applied as well as without it.
> 
> After looking at system_call_exception() I doubt this inconsistency can be
> easily avoided, so I don't see how this patch could be enhanced further,
> and what else could I do with the patch besides dropping it and letting
> !trap_is_scv case be unsupported by PTRACE_SET_SYSCALL_INFO API, which
> would be unfortunate.

If you say this would bring some consistency, I can extend the patch with
something like this:

diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index 727ed4a14545..dda276a934fd 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -207,7 +207,7 @@ static int do_seccomp(struct pt_regs *regs)
 	 * syscall parameter. This is different to the ptrace ABI where
 	 * both r3 and orig_gpr3 contain the first syscall parameter.
 	 */
-	regs->gpr[3] = -ENOSYS;
+	syscall_set_return_value(current, regs, -ENOSYS, 0);
 
 	/*
 	 * We use the __ version here because we have already checked
@@ -225,7 +225,7 @@ static int do_seccomp(struct pt_regs *regs)
 	 * modify the first syscall parameter (in orig_gpr3) and also
 	 * allow the syscall to proceed.
 	 */
-	regs->gpr[3] = regs->orig_gpr3;
+	syscall_set_return_value(current, regs, 0, regs->orig_gpr3);
 
 	return 0;
 }
@@ -315,7 +315,7 @@ long do_syscall_trace_enter(struct pt_regs *regs)
 	 * If we are aborting explicitly, or if the syscall number is
 	 * now invalid, set the return value to -ENOSYS.
 	 */
-	regs->gpr[3] = -ENOSYS;
+	syscall_set_return_value(current, regs, -ENOSYS, 0);
 	return -1;
 }
 
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index aa17e62f3754..c921e0cb54b8 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -229,14 +229,8 @@ static void check_syscall_restart(struct pt_regs *regs, struct k_sigaction *ka,
 		regs_add_return_ip(regs, -4);
 		regs->result = 0;
 	} else {
-		if (trap_is_scv(regs)) {
-			regs->result = -EINTR;
-			regs->gpr[3] = -EINTR;
-		} else {
-			regs->result = -EINTR;
-			regs->gpr[3] = EINTR;
-			regs->ccr |= 0x10000000;
-		}
+		regs->result = -EINTR;
+		syscall_set_return_value(current, regs, -EINTR, 0);
 	}
 }
 

-- 
ldv

