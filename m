Return-Path: <linuxppc-dev+bounces-5058-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D29DCA09FE4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 02:16:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVLG16q7pz3cjL;
	Sat, 11 Jan 2025 12:16:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736558201;
	cv=none; b=L1fxHhL/NJmVejGBRx16quVYcQKW9GJSQTzhH4GXPhzcLO6giOblC6Ob5jT9X3zeHSW6yVq3PFs5tFpK3WJmgqE/lGYdaE7Xmp7+kMeOuFhZovxsfOX/s2DfaSXR9UmbIB8Bx122U+s/84q1D9v9Qse/3pAxBIb1gvFT2+1ljCZpivkKYtiMSXAt17XaHuH43VgJBMlX/nFOWnBUxVUXWmjYUCwDvTzOFihE/7PJRjbZoUbo02Sn2yIadzMzJ516XU1hl9IgmvRHe1SXwaSwoEK1rfxhr6olvfvVVAaYAAN2/+LDdWYLb/VjWERnkla/FeZRxjKYSryVBjiRZ4tKeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736558201; c=relaxed/relaxed;
	bh=OGaUIIECp53nz7ZUChA/HGseFYhZkADFgRs/+WkgOTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBTwZ9UUW4aOibgJ4WTFc+4NpD3KPtEbL8UaQenxEL1s9nQfS5BMzswo165N7IMKVzJDhLMRubVVLwQzeBQDzUE7bOD+rvIqWUL88wsQCPCXLFEPJJgmMZ+jWGWJb+f4MAzXtZC6LfJZu3Hg9ZSJhTKwvHpgmGAm/t2N2fm11pGPkwqgEA4s/2MeX4/fEwkNJ6HtKLOepH8UYB5EJsJFXUsV5hWZmMkEcb4lT109cFO2Inzdq8wyKUgnz4v9eU9MZjlvB26V3nMVHdaBVlMKqSBv5AWfpqKyJFqWt3NZaxqOa8V0t3DFEfsJt4rt8wXfa2vcR3d7cNJrQWv1Y0ui6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVLG03sggz3cdm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 12:16:38 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 3D21472C8FB;
	Sat, 11 Jan 2025 04:16:32 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 2736C7CCB3A; Sat, 11 Jan 2025 03:16:32 +0200 (IST)
Date: Sat, 11 Jan 2025 03:16:32 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Sven Schnelle <svens@linux.ibm.com>
Cc: Oleg Nesterov <oleg@redhat.com>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Brian Cain <bcain@quicinc.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH 3/6] syscall.h: introduce syscall_set_nr()
Message-ID: <20250111011632.GA1724@strace.io>
References: <20250107230438.GC30633@strace.io>
 <yt9dzfjz6rw5.fsf@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yt9dzfjz6rw5.fsf@linux.ibm.com>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 10, 2025 at 08:37:46AM +0100, Sven Schnelle wrote:
> "Dmitry V. Levin" <ldv@strace.io> writes:
> 
> > Similar to syscall_set_arguments() that complements
> > syscall_get_arguments(), introduce syscall_set_nr()
> > that complements syscall_get_nr().
> >
> > syscall_set_nr() is going to be needed along with
> > syscall_set_arguments() on all HAVE_ARCH_TRACEHOOK
> > architectures to implement PTRACE_SET_SYSCALL_INFO API.
[...]
> > diff --git a/arch/s390/include/asm/syscall.h b/arch/s390/include/asm/syscall.h
> > index b3dd883699e7..1c0e349fd5c9 100644
> > --- a/arch/s390/include/asm/syscall.h
> > +++ b/arch/s390/include/asm/syscall.h
> > @@ -24,6 +24,13 @@ static inline long syscall_get_nr(struct task_struct *task,
> >  		(regs->int_code & 0xffff) : -1;
> >  }
> >  
> > +static inline void syscall_set_nr(struct task_struct *task,
> > +				  struct pt_regs *regs,
> > +				  int nr)
> > +{
> 
> I think there should be a
> 
> 	if (!test_pt_regs_flags(regs, PIF_SYSCALL))
> 		return;
> 
> before the modification so a user can't accidentally change int_code
> when ptrace stopped in a non-syscall path.

The reason why syscall_get_nr() has this check on s390 (and similar checks
on arc, powerpc, and sparc) is that syscall_get_nr() can be called while
the target task is not in syscall.

Unlike syscall_get_nr(), syscall_set_nr() can be called only when the
target task is stopped for tracing on entering syscall: the description in
include/asm-generic/syscall.h explicitly states that, and the follow-up
patch that introduces PTRACE_SET_SYSCALL_INFO adds a syscall_set_nr() call
when the tracee is stopped on entering syscall in either
PTRACE_SYSCALL_INFO_ENTRY or PTRACE_SYSCALL_INFO_SECCOMP state.

I don't mind adding a check, but syscall_set_nr() invocation while the
target task is not in syscall wouldn't be a result of user actions but
a kernel programing error, and in that case WARN_ON_ONCE() would be more
appropriate.

If calling syscall_set_nr() while the target task is not in syscall was
legal, then syscall_set_nr() would have been designed to return a value
indicating the status of operation.

Anyway, I'll add an explanatory comment to syscall_set_nr() on all
architectures where syscall_get_nr() has a check.


-- 
ldv

