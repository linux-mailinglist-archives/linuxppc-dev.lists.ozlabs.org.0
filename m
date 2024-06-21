Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 393A0912E52
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 22:12:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5T6v6Bp5z3cyL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2024 06:12:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=libc.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aerifal.cx (client-ip=2001:19f0:5:42::1; helo=brightrain.aerifal.cx; envelope-from=dalias@aerifal.cx; receiver=lists.ozlabs.org)
X-Greylist: delayed 907 seconds by postgrey-1.37 at boromir; Sat, 22 Jun 2024 06:12:16 AEST
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [IPv6:2001:19f0:5:42::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5T6S3Rkcz3cbQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2024 06:12:15 +1000 (AEST)
Date: Fri, 21 Jun 2024 15:57:23 -0400
From: Rich Felker <dalias@libc.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [musl] Re: [PATCH 09/15] sh: rework sync_file_range ABI
Message-ID: <20240621195723.GB10433@brightrain.aerifal.cx>
References: <20240620162316.3674955-1-arnd@kernel.org>
 <20240620162316.3674955-10-arnd@kernel.org>
 <366548c1a0d9749e42c0d0c993414a353c9b0b02.camel@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <366548c1a0d9749e42c0d0c993414a353c9b0b02.camel@physik.fu-berlin.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: Andreas Larsson <andreas@gaisler.com>, linux-mips@vger.kernel.org, Guo Ren <guoren@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, linux-sh@vger.kernel.org, linux-csky@vger.kernel.org, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>, Heiko Carstens <hca@linux.ibm.com>, musl@lists.openwall.com, Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, ltp@lists.linux.it, Arnd Bergmann <arnd@kernel.org>, Christian Brauner <brauner@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, libc-alpha@sourceware.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 21, 2024 at 10:44:39AM +0200, John Paul Adrian Glaubitz wrote:
> Hi Arnd,
> 
> thanks for your patch!
> 
> On Thu, 2024-06-20 at 18:23 +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > The unusual function calling conventions on superh ended up causing
>                                               ^^^^^^
>                                        It's spelled SuperH
> 
> > sync_file_range to have the wrong argument order, with the 'flags'
> > argument getting sorted before 'nbytes' by the compiler.
> > 
> > In userspace, I found that musl, glibc, uclibc and strace all expect the
> > normal calling conventions with 'nbytes' last, so changing the kernel
> > to match them should make all of those work.
> > 
> > In order to be able to also fix libc implementations to work with existing
> > kernels, they need to be able to tell which ABI is used. An easy way
> > to do this is to add yet another system call using the sync_file_range2
> > ABI that works the same on all architectures.
> > 
> > Old user binaries can now work on new kernels, and new binaries can
> > try the new sync_file_range2() to work with new kernels or fall back
> > to the old sync_file_range() version if that doesn't exist.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 75c92acdd5b1 ("sh: Wire up new syscalls.")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  arch/sh/kernel/sys_sh32.c           | 11 +++++++++++
> >  arch/sh/kernel/syscalls/syscall.tbl |  3 ++-
> >  2 files changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/sh/kernel/sys_sh32.c b/arch/sh/kernel/sys_sh32.c
> > index 9dca568509a5..d5a4f7c697d8 100644
> > --- a/arch/sh/kernel/sys_sh32.c
> > +++ b/arch/sh/kernel/sys_sh32.c
> > @@ -59,3 +59,14 @@ asmlinkage int sys_fadvise64_64_wrapper(int fd, u32 offset0, u32 offset1,
> >  				 (u64)len0 << 32 | len1, advice);
> >  #endif
> >  }
> > +
> > +/*
> > + * swap the arguments the way that libc wants it instead of
> 
> I think "swap the arguments to the order that libc wants them" would
> be easier to understand here.
> 
> > + * moving flags ahead of the 64-bit nbytes argument
> > + */
> > +SYSCALL_DEFINE6(sh_sync_file_range6, int, fd, SC_ARG64(offset),
> > +                SC_ARG64(nbytes), unsigned int, flags)
> > +{
> > +        return ksys_sync_file_range(fd, SC_VAL64(loff_t, offset),
> > +                                    SC_VAL64(loff_t, nbytes), flags);
> > +}
> > diff --git a/arch/sh/kernel/syscalls/syscall.tbl b/arch/sh/kernel/syscalls/syscall.tbl
> > index bbf83a2db986..c55fd7696d40 100644
> > --- a/arch/sh/kernel/syscalls/syscall.tbl
> > +++ b/arch/sh/kernel/syscalls/syscall.tbl
> > @@ -321,7 +321,7 @@
> >  311	common	set_robust_list			sys_set_robust_list
> >  312	common	get_robust_list			sys_get_robust_list
> >  313	common	splice				sys_splice
> > -314	common	sync_file_range			sys_sync_file_range
> > +314	common	sync_file_range			sys_sh_sync_file_range6
>                                                                  ^^^^^^ Why the suffix 6 here?
> 
> >  315	common	tee				sys_tee
> >  316	common	vmsplice			sys_vmsplice
> >  317	common	move_pages			sys_move_pages
> > @@ -395,6 +395,7 @@
> >  385	common	pkey_alloc			sys_pkey_alloc
> >  386	common	pkey_free			sys_pkey_free
> >  387	common	rseq				sys_rseq
> > +388	common	sync_file_range2		sys_sync_file_range2
> >  # room for arch specific syscalls
> >  393	common	semget				sys_semget
> >  394	common	semctl				sys_semctl
> 
> I wonder how you discovered this bug. Did you look up the calling convention on SuperH
> and compare the argument order for the sys_sync_file_range system call documented there
> with the order in the kernel?
> 
> Did you also check what order libc uses? I would expect libc on SuperH misordering the
> arguments as well unless I am missing something. Or do we know that the code is actually
> currently broken?

No, there's no reason libc would misorder them because syscalls aren't
function calls, and aren't subject to function call ABI. We have to
explicitly bind the arguments to registers and make a syscall
instruction.

The only reason this bug happened on the kernel side is that someone
thought it would be a smart idea to save maybe 10 instructions by
treating the register state on entry as directly suitable to jump from
asm to a C function rather than explicitly marshalling the arguments
out of the user-kernel syscall ABI positions into actual arguments to
a C function call.

Rich
