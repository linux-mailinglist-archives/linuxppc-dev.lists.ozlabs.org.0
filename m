Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E760226E929
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 00:53:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bssgh3nyszDqcF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 08:53:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=canonical.com
 (client-ip=91.189.89.112; helo=youngberry.canonical.com;
 envelope-from=cascardo@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=canonical.com
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bssds2VtvzDqLC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 08:51:29 +1000 (AEST)
Received: from [179.93.159.205] (helo=mussarela)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cascardo@canonical.com>)
 id 1kJ2kJ-00013f-1k; Thu, 17 Sep 2020 22:51:21 +0000
Date: Thu, 17 Sep 2020 19:51:00 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] selftests/seccomp: fix ptrace tests on powerpc
Message-ID: <20200917225100.GG314880@mussarela>
References: <20200630164739.1268222-1-cascardo@canonical.com>
 <202009081505.D9FE52510B@keescook>
 <20200911180637.GI4002@mussarela>
 <875z8hrh2o.fsf@mpe.ellerman.id.au> <202009171536.7FACD19@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202009171536.7FACD19@keescook>
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
Cc: linuxppc-dev@lists.ozlabs.org, Shuah Khan <shuah@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 17, 2020 at 03:37:16PM -0700, Kees Cook wrote:
> On Sun, Sep 13, 2020 at 10:34:23PM +1000, Michael Ellerman wrote:
> > Thadeu Lima de Souza Cascardo <cascardo@canonical.com> writes:
> > > On Tue, Sep 08, 2020 at 04:18:17PM -0700, Kees Cook wrote:
> > >> On Tue, Jun 30, 2020 at 01:47:39PM -0300, Thadeu Lima de Souza Cascardo wrote:
> > ...
> > >> > @@ -1809,10 +1818,15 @@ void tracer_ptrace(struct __test_metadata *_metadata, pid_t tracee,
> > >> >  	EXPECT_EQ(entry ? PTRACE_EVENTMSG_SYSCALL_ENTRY
> > >> >  			: PTRACE_EVENTMSG_SYSCALL_EXIT, msg);
> > >> >  
> > >> > -	if (!entry)
> > >> > +	if (!entry && !syscall_nr)
> > >> >  		return;
> > >> >  
> > >> > -	nr = get_syscall(_metadata, tracee);
> > >> > +	if (entry)
> > >> > +		nr = get_syscall(_metadata, tracee);
> > >> > +	else
> > >> > +		nr = *syscall_nr;
> > >> 
> > >> This is weird? Shouldn't get_syscall() be modified to do the right thing
> > >> here instead of depending on the extra arg?
> > >> 
> > >
> > > R0 might be clobered. Same documentation mentions it as volatile. So, during
> > > syscall exit, we can't tell for sure that R0 will have the original syscall
> > > number. So, we need to grab it during syscall enter, save it somewhere and
> > > reuse it. I used the test context/args for that.
> > 
> > The user r0 (in regs->gpr[0]) shouldn't be clobbered.
> > 
> > But it is modified if the tracer skips the syscall, by setting the
> > syscall number to -1. Or if the tracer changes the syscall number.
> > 
> > So if you need the original syscall number in the exit path then I think
> > you do need to save it at entry.
> 
> ... the selftest code wants to test the updated syscall (-1 or
> whatever), so this sounds correct. Was this test actually failing on
> powerpc? (I'd really rather not split entry/exit if I don't have to.)
> 
> -- 
> Kees Cook

Yes, it started failing when the return code started being changed as well.
Though ptrace can change the syscall at entry (IIRC), it can't change the
return code. And that is part of the ABI. If ppc is changed so it allows
changing the return code during ptrace entry, some strace uses will break. So
that is not an option.

Cascardo.
