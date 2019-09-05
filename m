Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CCAAC565
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Sep 2019 10:56:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46QSw81qTczDr10
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Sep 2019 18:56:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=ubuntu.com
 (client-ip=91.189.89.112; helo=youngberry.canonical.com;
 envelope-from=christian.brauner@ubuntu.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ubuntu.com
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PHRF6PbRzDqNv
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 20:46:01 +1000 (AEST)
Received: from [213.220.153.21] (helo=wittgenstein)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <christian.brauner@ubuntu.com>)
 id 1i5pGI-0007WW-Cl; Thu, 05 Sep 2019 10:45:10 +0000
Date: Thu, 5 Sep 2019 12:45:08 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Aleksa Sarai <cyphar@cyphar.com>
Subject: Re: [PATCH v12 01/12] lib: introduce copy_struct_{to,from}_user
 helpers
Message-ID: <20190905104507.glbhzeke4p3cg3ti@wittgenstein>
References: <20190904201933.10736-1-cyphar@cyphar.com>
 <20190904201933.10736-2-cyphar@cyphar.com>
 <57ba3752-c4a6-d2a4-1a4d-a0e13bccd473@rasmusvillemoes.dk>
 <20190905095026.gjemg2gqua2vufxb@yavin.dot.cyphar.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190905095026.gjemg2gqua2vufxb@yavin.dot.cyphar.com>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Sat, 07 Sep 2019 18:55:12 +1000
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, Aleksa Sarai <asarai@suse.de>,
 Jiri Olsa <jolsa@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Jann Horn <jannh@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-m68k@lists.linux-m68k.org, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Namhyung Kim <namhyung@kernel.org>, David Drysdale <drysdale@google.com>,
 Christian Brauner <christian@brauner.io>,
 "J. Bruce Fields" <bfields@fieldses.org>, linux-parisc@vger.kernel.org,
 linux-api@vger.kernel.org, Chanho Min <chanho.min@lge.com>,
 Jeff Layton <jlayton@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 containers@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 05, 2019 at 07:50:26PM +1000, Aleksa Sarai wrote:
> On 2019-09-05, Rasmus Villemoes <linux@rasmusvillemoes.dk> wrote:
> > On 04/09/2019 22.19, Aleksa Sarai wrote:
> > > A common pattern for syscall extensions is increasing the size of a
> > > struct passed from userspace, such that the zero-value of the new fields
> > > result in the old kernel behaviour (allowing for a mix of userspace and
> > > kernel vintages to operate on one another in most cases). This is done
> > > in both directions -- hence two helpers -- though it's more common to
> > > have to copy user space structs into kernel space.
> > > 
> > > Previously there was no common lib/ function that implemented
> > > the necessary extension-checking semantics (and different syscalls
> > > implemented them slightly differently or incompletely[1]). A future
> > > patch replaces all of the common uses of this pattern to use the new
> > > copy_struct_{to,from}_user() helpers.
> > > 
> > > [1]: For instance {sched_setattr,perf_event_open,clone3}(2) all do do
> > >      similar checks to copy_struct_from_user() while rt_sigprocmask(2)
> > >      always rejects differently-sized struct arguments.
> > > 
> > > Suggested-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> > > Signed-off-by: Aleksa Sarai <cyphar@cyphar.com>
> > > ---
> > > diff --git a/lib/struct_user.c b/lib/struct_user.c
> > > new file mode 100644
> > > index 000000000000..7301ab1bbe98
> > > --- /dev/null
> > > +++ b/lib/struct_user.c
> > > @@ -0,0 +1,182 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * Copyright (C) 2019 SUSE LLC
> > > + * Copyright (C) 2019 Aleksa Sarai <cyphar@cyphar.com>
> > > + */
> > > +
> > > +#include <linux/types.h>
> > > +#include <linux/export.h>
> > > +#include <linux/uaccess.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/string.h>
> > > +
> > > +#define BUFFER_SIZE 64
> > > +
> > > +/*
> > > + * "memset(p, 0, size)" but for user space buffers. Caller must have already
> > > + * checked access_ok(p, size).
> > > + */
> > 
> > Isn't this __clear_user() exactly (perhaps except for the return value)?
> > Perhaps not every arch has that?
> 
> I didn't know about clear_user() -- I will switch to it.
> 
> > > +static int __memzero_user(void __user *p, size_t s)
> > > +{
> > > +	const char zeros[BUFFER_SIZE] = {};
> > > +	while (s > 0) {
> > > +		size_t n = min(s, sizeof(zeros));
> > > +
> > > +		if (__copy_to_user(p, zeros, n))
> > > +			return -EFAULT;
> > > +
> > > +		p += n;
> > > +		s -= n;
> > > +	}
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * copy_struct_to_user: copy a struct to user space
> > > + * @dst:   Destination address, in user space.
> > > + * @usize: Size of @dst struct.
> > > + * @src:   Source address, in kernel space.
> > > + * @ksize: Size of @src struct.
> > > + *
> > > + * Returns (in all cases, some data may have been copied):
> > > + *  * -EFBIG:  (@usize < @ksize) and there are non-zero trailing bytes in @src.
> > > + *  * -EFAULT: access to user space failed.
> > > + */
> > > +int copy_struct_to_user(void __user *dst, size_t usize,
> > > +			const void *src, size_t ksize)
> > > +{
> > > +	size_t size = min(ksize, usize);
> > > +	size_t rest = abs(ksize - usize);
> > 
> > Eh, I'd avoid abs() here due to the funkiness of the implicit type
> > conversions - ksize-usize has type size_t, then that's coerced to an int
> > (or a long maybe?), the abs is applied which return an int/long (or
> > unsigned versions?). Something like "rest = max(ksize, usize) - size;"
> > is more obviously correct and doesn't fall into any
> > narrowing/widening/sign extending traps.
> 
> Yeah, I originally used "max(ksize, usize) - size" for that reason but
> was worried it looked too funky (and some quick tests showed that abs()
> gives the right results in most cases -- though I just realised it would
> probably not give the right results around SIZE_MAX). I'll switch back.
> 
> > > +	if (unlikely(usize > PAGE_SIZE))
> > > +		return -EFAULT;
> > 
> > Please don't. That is a restriction on all future extensions - once a
> > kernel is shipped with a syscall using this helper with that arbitrary
> > restriction in place, that syscall is forever prevented from extending
> > its arg struct beyond PAGE_SIZE (which is arch-dependent anyway). Sure,
> > it's hard to imagine, but who'd have thought 32 O_* or CLONE_* bits
> > weren't enough for everybody?
> >
> > This is only for future compatibility, and if someone runs an app
> > compiled against 7.3 headers on a 5.4 kernel, they probably don't care
> > about performance, but they would like their app to run.
> 
> I'm not sure I agree that the limit is in place *forever* -- it's
> generally not a break in compatibility to convert an error into a
> success (though, there are counterexamples such as mknod(2) -- but that
> was a very specific case).
> 
> You're right that it would mean that some very new code won't run on
> very ancient kernels (assuming we ever pass around structs that
> massive), but there should be a reasonable trade-off here IMHO.

Passing a struct larger than a PAGE_SIZE right now (at least for all
those calls that would make use of this helper at the moment) is to be
considered a bug.
The PAGE_SIZE check is a reasonable heuristic. It's an assumption that
is pretty common in the kernel in other places as well. Plus the
possibility of DoS.

> 
> If we allow very large sizes, a program could probably DoS the kernel by
> allocating a moderately-large block of memory and then spawning a bunch
> of threads that all cause the kernel to re-check that the same 1GB block
> of memory is zeroed. I haven't tried, but it seems like it's best to
> avoid the possibility altogether.
> 
> > > +	}
> > > +	/* Copy the interoperable parts of the struct. */
> > > +	if (__copy_to_user(dst, src, size))
> > > +		return -EFAULT;
> > 
> > I think I understand why you put this last instead of handling the
> > buffer in the "natural" order. However,
> > I'm wondering whether we should actually do this copy before checking
> > that the extra kernel bytes are 0 - the user will still be told that
> > there was some extra information via the -EFBIG/-E2BIG return, but maybe
> > in some cases the part he understands is good enough. But I also guess
> > we have to look to existing users to see whether that would prevent them
> > from being converted to using this helper.
> > 
> > linux-api folks, WDYT?
> 
> Regarding the order, I just copied what sched and perf already do. I
> wouldn't mind doing it the other way around -- though I am a little
> cautious about implicitly making guarantees like that. The syscall that
> uses copy_struct_to_user() might not want to make that guarantee (it
> might not make sense for them), and there are some -E2BIG returns that
> won't result in data being copied (usize > PAGE_SIZE).
> 
> As for feedback, this is syscall-dependent at the moment. The sched and
> perf users explicitly return the size of the kernel structure (by
> overwriting uattr->size if -E2BIG is returned) for copies in either
> direction. So users arguably already have some kind of feedback about
> size issues. clone3() on the other hand doesn't do that (though it
> doesn't copy anything to user-space so this isn't relevant to this
> particular question).
> 
> Effectively, I'd like to see someone argue that this is something that
> they would personally want (before we do it).

I think the order you have right now is fine. I don't see the point of
doing work first before we have verified that things are sane.
