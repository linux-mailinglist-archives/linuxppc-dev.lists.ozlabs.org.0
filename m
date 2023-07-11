Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D85774F72E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 19:24:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PZNeD789;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0nmd2qWcz3bpd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 03:24:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PZNeD789;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=legion@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0nlm60bVz3bjK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 03:23:48 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AA9226156D;
	Tue, 11 Jul 2023 17:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D7BC433C8;
	Tue, 11 Jul 2023 17:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689096226;
	bh=zRaRZODsK04vezweUZ+H0PPfgi1k3wqQi7324zxQ/28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PZNeD789rxo/FRL8fguXIaEhIdcb3NoIGN+R9irixNbC8LsCXOFUznWzq9WmhX658
	 ctLKt4COOixyfu+iv7gv3l9QC8KiJ43LdgPgDcE1w2J7wMHlQWTmN6JkCU9QtffkJi
	 ofqDiuh+IIRXiX99OJNPoCjVQaYVaBtzcSdXCqRv0PuGoSZCDfIZHVpkMCK9Y2t1GI
	 vvkbRprIdu8vTrPKKD7IRTCrO4yEdFk+gpmFbTGc26mgSAZvKXM3tPq/RUsz8NXAKQ
	 Vua2j8OnCVr7Lflg091O7i0d7MqnHEfpV0YZTlcSdv52fPNSg3ivTTA+lEvAAClYgQ
	 Rul1HsweoxsXQ==
Date: Tue, 11 Jul 2023 19:23:24 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH v4 4/5] tools headers UAPI: Sync files changed by new
 fchmodat2 syscall
Message-ID: <ZK2QDCrlB/3dyiDy@example.org>
References: <cover.1689074739.git.legion@kernel.org>
 <cover.1689092120.git.legion@kernel.org>
 <22294b3b68050a70eaaa962eff46b8672bc2f7e8.1689092120.git.legion@kernel.org>
 <CAM9d7chAqGwy0WmR67TucFjRq+Aa7zQnayvwMCqd5-meVHkP5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAM9d7chAqGwy0WmR67TucFjRq+Aa7zQnayvwMCqd5-meVHkP5g@mail.gmail.com>
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, fenghua.yu@intel.com, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com, Palmer Dabbelt <palmer@sifive.com>, x86@kernel.org, stefan@agner.ch, ldv@altlinux.org, dhowells@redhat.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, gor@linux.ibm.com, ysato@users.sourceforge.jp, deller@gmx.de, linux-sh@vger.kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, jhogan@kernel.org, mattst88@gmail.com, linux-mips@vger.kernel.org, fweimer@redhat.com, Arnd Bergmann <arnd@arndb.de>, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org, bp@alien8.de, viro@zeniv.linux.org.uk, luto@kernel.org, tglx@linutronix.de, christian@brauner.io, axboe@kernel.dk, James.Bottomley@hansenpartnership.com, monstr@monstr.eu, tony.luck@i
 ntel.com, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ralf@linux-mips.org, peterz@infradead.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, ink@jurassic.park.msu.ru, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 11, 2023 at 10:19:35AM -0700, Namhyung Kim wrote:
> Hello,
> 
> On Tue, Jul 11, 2023 at 9:18 AM Alexey Gladkov <legion@kernel.org> wrote:
> >
> > From: Palmer Dabbelt <palmer@sifive.com>
> >
> > That add support for this new syscall in tools such as 'perf trace'.
> >
> > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> > Signed-off-by: Alexey Gladkov <legion@kernel.org>
> > ---
> >  tools/include/uapi/asm-generic/unistd.h             | 5 ++++-
> >  tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl | 2 ++
> >  tools/perf/arch/powerpc/entry/syscalls/syscall.tbl  | 2 ++
> >  tools/perf/arch/s390/entry/syscalls/syscall.tbl     | 2 ++
> >  tools/perf/arch/x86/entry/syscalls/syscall_64.tbl   | 2 ++
> >  5 files changed, 12 insertions(+), 1 deletion(-)
> 
> It'd be nice if you route this patch separately through the
> perf tools tree.  We can add this after the kernel change
> is accepted.

Sure. No problem.

> >
> > diff --git a/tools/include/uapi/asm-generic/unistd.h b/tools/include/uapi/asm-generic/unistd.h
> > index dd7d8e10f16d..76b5922b0d39 100644
> > --- a/tools/include/uapi/asm-generic/unistd.h
> > +++ b/tools/include/uapi/asm-generic/unistd.h
> > @@ -817,8 +817,11 @@ __SYSCALL(__NR_futex_waitv, sys_futex_waitv)
> >  #define __NR_set_mempolicy_home_node 450
> >  __SYSCALL(__NR_set_mempolicy_home_node, sys_set_mempolicy_home_node)
> >
> > +#define __NR_fchmodat2 452
> > +__SYSCALL(__NR_fchmodat2, sys_fchmodat2)
> > +
> >  #undef __NR_syscalls
> > -#define __NR_syscalls 451
> > +#define __NR_syscalls 453
> >
> >  /*
> >   * 32 bit systems traditionally used different
> > diff --git a/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl b/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
> > index 3f1886ad9d80..434728af4eaa 100644
> > --- a/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
> > +++ b/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
> > @@ -365,3 +365,5 @@
> >  448    n64     process_mrelease                sys_process_mrelease
> >  449    n64     futex_waitv                     sys_futex_waitv
> >  450    common  set_mempolicy_home_node         sys_set_mempolicy_home_node
> > +# 451 reserved for cachestat
> > +452    n64     fchmodat2                       sys_fchmodat2
> > diff --git a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
> > index a0be127475b1..6b70b6705bd7 100644
> > --- a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
> > +++ b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
> > @@ -537,3 +537,5 @@
> >  448    common  process_mrelease                sys_process_mrelease
> >  449    common  futex_waitv                     sys_futex_waitv
> >  450    nospu   set_mempolicy_home_node         sys_set_mempolicy_home_node
> > +# 451 reserved for cachestat
> > +452    common  fchmodat2                       sys_fchmodat2
> > diff --git a/tools/perf/arch/s390/entry/syscalls/syscall.tbl b/tools/perf/arch/s390/entry/syscalls/syscall.tbl
> > index b68f47541169..0ed90c9535b0 100644
> > --- a/tools/perf/arch/s390/entry/syscalls/syscall.tbl
> > +++ b/tools/perf/arch/s390/entry/syscalls/syscall.tbl
> > @@ -453,3 +453,5 @@
> >  448  common    process_mrelease        sys_process_mrelease            sys_process_mrelease
> >  449  common    futex_waitv             sys_futex_waitv                 sys_futex_waitv
> >  450  common    set_mempolicy_home_node sys_set_mempolicy_home_node     sys_set_mempolicy_home_node
> > +# 451 reserved for cachestat
> > +452  common    fchmodat2               sys_fchmodat2                   sys_fchmodat2
> > diff --git a/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl b/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
> > index c84d12608cd2..a008724a1f48 100644
> > --- a/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
> > +++ b/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
> > @@ -372,6 +372,8 @@
> >  448    common  process_mrelease        sys_process_mrelease
> >  449    common  futex_waitv             sys_futex_waitv
> >  450    common  set_mempolicy_home_node sys_set_mempolicy_home_node
> > +# 451 reserved for cachestat
> > +452    common  fchmodat2               sys_fchmodat2
> >
> >  #
> >  # Due to a historical design error, certain syscalls are numbered differently
> > --
> > 2.33.8
> >
> 

-- 
Rgrds, legion

