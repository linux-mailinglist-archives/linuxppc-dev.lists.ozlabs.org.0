Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B381F6F27
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 23:07:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jbzH1fh5zDqv4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 07:07:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=libc.org
 (client-ip=216.12.86.13; helo=brightrain.aerifal.cx;
 envelope-from=dalias@libc.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=libc.org
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [216.12.86.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jVxN2r66zDqpK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 03:20:39 +1000 (AEST)
Date: Thu, 11 Jun 2020 13:20:28 -0400
From: Rich Felker <dalias@libc.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: [PATCH v2] All arch: remove system call sys_sysctl
Message-ID: <20200611172028.GO1079@brightrain.aerifal.cx>
References: <1591847640-124894-1-git-send-email-nixiaoming@huawei.com>
 <87ftb1u8u3.fsf@x220.int.ebiederm.org>
 <20200611163902.GN1079@brightrain.aerifal.cx>
 <87ftb1sfjc.fsf@x220.int.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ftb1sfjc.fsf@x220.int.ebiederm.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Fri, 12 Jun 2020 07:04:24 +1000
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
Cc: linux-sh@vger.kernel.org, catalin.marinas@arm.com, paulus@samba.org,
 ak@linux.intel.com, paulburton@kernel.org, geert@linux-m68k.org,
 mattst88@gmail.com, brgerst@gmail.com, acme@kernel.org, cyphar@cyphar.com,
 viro@zeniv.linux.org.uk, luto@kernel.org, tglx@linutronix.de,
 surenb@google.com, rth@twiddle.net, young.liuyang@huawei.com,
 linux-parisc@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mcgrof@kernel.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, mark.rutland@arm.com, linux-ia64@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, jongk@linux-m68k.org,
 linux@dominikbrodowski.net, James.Bottomley@HansenPartnership.com,
 jcmvbkbc@gmail.com, linux-s390@vger.kernel.org, ysato@users.sourceforge.jp,
 deller@gmx.de, yzaikin@google.com, Xiaoming Ni <nixiaoming@huawei.com>,
 mszeredi@redhat.com, gor@linux.ibm.com, linux-alpha@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-arm-kernel@lists.infradead.org,
 chris@zankel.net, tony.luck@intel.com, linux-api@vger.kernel.org,
 zhouyanjie@wanyeetech.com, minchan@kernel.org, sargun@sargun.me,
 alexander.shishkin@linux.intel.com, heiko.carstens@de.ibm.com,
 alex.huangjianhui@huawei.com, will@kernel.org, krzk@kernel.org,
 borntraeger@de.ibm.com, vbabka@suse.cz, samitolvanen@google.com,
 flameeyes@flameeyes.com, ravi.bangoria@linux.ibm.com, elver@google.com,
 keescook@chromium.org, arnd@arndb.de, bp@alien8.de, christian@brauner.io,
 tsbogend@alpha.franken.de, jiri@mellanox.com, martin.petersen@oracle.com,
 yamada.masahiro@socionext.com, oleg@redhat.com, sudeep.holla@arm.com,
 olof@lixom.net, shawnguo@kernel.org, davem@davemloft.net,
 bauerman@linux.ibm.com, fenghua.yu@intel.com, peterz@infradead.org,
 dhowells@redhat.com, hpa@zytor.com, sparclinux@vger.kernel.org,
 jolsa@redhat.com, svens@stackframe.org, x86@kernel.org, linux@armlinux.org.uk,
 mingo@redhat.com, naveen.n.rao@linux.vnet.ibm.com, paulmck@kernel.org,
 sfr@canb.auug.org.au, npiggin@gmail.com, namhyung@kernel.org,
 dvyukov@google.com, axboe@kernel.dk, monstr@monstr.eu, haolee.swjtu@gmail.com,
 linux-mips@vger.kernel.org, ink@jurassic.park.msu.ru,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 11, 2020 at 12:01:11PM -0500, Eric W. Biederman wrote:
> Rich Felker <dalias@libc.org> writes:
> 
> > On Thu, Jun 11, 2020 at 06:43:00AM -0500, Eric W. Biederman wrote:
> >> Xiaoming Ni <nixiaoming@huawei.com> writes:
> >> 
> >> > Since the commit 61a47c1ad3a4dc ("sysctl: Remove the sysctl system call"),
> >> > sys_sysctl is actually unavailable: any input can only return an error.
> >> >
> >> > We have been warning about people using the sysctl system call for years
> >> > and believe there are no more users.  Even if there are users of this
> >> > interface if they have not complained or fixed their code by now they
> >> > probably are not going to, so there is no point in warning them any
> >> > longer.
> >> >
> >> > So completely remove sys_sysctl on all architectures.
> >> 
> >> 
> >> 
> >> >
> >> > Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
> >> >
> >> > changes in v2:
> >> >   According to Kees Cook's suggestion, completely remove sys_sysctl on all arch
> >> >   According to Eric W. Biederman's suggestion, update the commit log
> >> >
> >> > V1: https://lore.kernel.org/lkml/1591683605-8585-1-git-send-email-nixiaoming@huawei.com/
> >> >   Delete the code of sys_sysctl and return -ENOSYS directly at the function entry
> >> > ---
> >> >  include/uapi/linux/sysctl.h                        |  15 --
> >> [snip]
> >> 
> >> > diff --git a/include/uapi/linux/sysctl.h b/include/uapi/linux/sysctl.h
> >> > index 27c1ed2..84b44c3 100644
> >> > --- a/include/uapi/linux/sysctl.h
> >> > +++ b/include/uapi/linux/sysctl.h
> >> > @@ -27,21 +27,6 @@
> >> >  #include <linux/types.h>
> >> >  #include <linux/compiler.h>
> >> >  
> >> > -#define CTL_MAXNAME 10		/* how many path components do we allow in a
> >> > -				   call to sysctl?   In other words, what is
> >> > -				   the largest acceptable value for the nlen
> >> > -				   member of a struct __sysctl_args to have? */
> >> > -
> >> > -struct __sysctl_args {
> >> > -	int __user *name;
> >> > -	int nlen;
> >> > -	void __user *oldval;
> >> > -	size_t __user *oldlenp;
> >> > -	void __user *newval;
> >> > -	size_t newlen;
> >> > -	unsigned long __unused[4];
> >> > -};
> >> > -
> >> >  /* Define sysctl names first */
> >> >  
> >> >  /* Top-level names: */
> >> [snip]
> >> 
> >> The uapi header change does not make sense.  The entire point of the
> >> header is to allow userspace programs to be able to call sys_sysctl.
> >> It either needs to all stay or all go.
> >> 
> >> As the concern with the uapi header is about userspace programs being
> >> able to compile please leave the header for now.
> >> 
> >> We should leave auditing userspace and seeing if userspace code will
> >> still compile if we remove this header for a separate patch.  The
> >> concerns and justifications for the uapi header are completely different
> >> then for the removing the sys_sysctl implementation.
> >> 
> >> Otherwise
> >> Acked-by: "Eric W. Biederman" <ebiederm@xmission.com>
> >
> > The UAPI header should be kept because it's defining an API not just
> > for the kernel the headers are supplied with, but for all past
> > kernels. In particular programs needing a failsafe CSPRNG source that
> > works on old kernels may (do) use this as a fallback only if modern
> > syscalls are missing. Removing the syscall is no problem since it
> > won't be used, but if you remove the types/macros from the UAPI
> > headers, they'll have to copy that into their own sources.
> 
> May we assume you know of a least one piece of userspace that will fail
> to compile if this header file is removed?

I know at least one piece of software is using SYS_sysctl for a
fallback CSPRNG source. I'm not 100% sure that they're using the
kernel headers; they might have copied it already. I'm also not sure
how many there are.

Regardless, I think the principle stands. There's no need to remove
definitions that are essentially maintenance-free now that the
interface is no longer available in new kernels, and doing so
contributes to the myth that you're supposed to use kernel headers
matching runtime kernel rather than it always being safe to use latest
headers.

Rich
