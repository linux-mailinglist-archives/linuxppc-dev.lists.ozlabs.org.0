Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5287AC571
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Sep 2019 11:03:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46QT3j4Db8zDqjy
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Sep 2019 19:03:13 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PJfd6j9pzDr3M
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 21:40:57 +1000 (AEST)
Received: from [213.220.153.21] (helo=wittgenstein)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <christian.brauner@ubuntu.com>)
 id 1i5q7j-0003X6-1p; Thu, 05 Sep 2019 11:40:23 +0000
Date: Thu, 5 Sep 2019 13:40:21 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Aleksa Sarai <cyphar@cyphar.com>
Subject: Re: [PATCH v12 01/12] lib: introduce copy_struct_{to,from}_user
 helpers
Message-ID: <20190905114020.52xaqqgp43wdctbl@wittgenstein>
References: <20190904201933.10736-1-cyphar@cyphar.com>
 <20190904201933.10736-2-cyphar@cyphar.com>
 <20190905110915.4vvhicg4ldmpi5u6@wittgenstein>
 <20190905112718.ojg3znly6x3m4mjq@yavin.dot.cyphar.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190905112718.ojg3znly6x3m4mjq@yavin.dot.cyphar.com>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Sat, 07 Sep 2019 18:55:13 +1000
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

On Thu, Sep 05, 2019 at 09:27:18PM +1000, Aleksa Sarai wrote:
> On 2019-09-05, Christian Brauner <christian.brauner@ubuntu.com> wrote:
> > On Thu, Sep 05, 2019 at 06:19:22AM +1000, Aleksa Sarai wrote:
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
> > 
> > I would probably split this out into a separate patchset. It can very
> > well go in before openat2(). Thoughts?
> 
> Yeah, I'll split this and the related patches out -- though I will admit
> I'm not sure how you're supposed to deal with multiple independent
> patchsets that depend on each other. How will folks reviewing openat2(2)
> know to include the lib/struct_user.c changes?

The way I usually deal with this is to make two branches. One with the
changes the other depends on and then merge this branch into the other
and put the changes on top. Then you can provide a complete branch that
people can test when you send the patchset out by just linking to it in
the cover letter.
(But if it's too much hazzle just leave it.)

> 
> Also, whose tree should it go through?

If people think splitting it out makes sense and we can settle the
technical details I can take it and let it stew in linux-next at least
for a little while.
I have changes to clone3() in there that touch
copy_clone_args_from_user() anyway and there are tests for clone3()
struct copying so we'd catch regressions (for clone3() at least) pretty
quickly.
If we don't see any major issues in the next two weeks it might even be
ok to send for 5.4.

Christian
