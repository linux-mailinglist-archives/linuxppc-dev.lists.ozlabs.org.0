Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0DFAC572
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Sep 2019 11:04:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46QT5Y4NYzzDr4Y
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Sep 2019 19:04:49 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PTbT5tchzDr0w
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2019 04:23:49 +1000 (AEST)
Received: from [213.220.153.21] (helo=wittgenstein)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <christian.brauner@ubuntu.com>)
 id 1i5wPR-00053t-Nn; Thu, 05 Sep 2019 18:23:05 +0000
Date: Thu, 5 Sep 2019 20:23:03 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v12 01/12] lib: introduce copy_struct_{to,from}_user
 helpers
Message-ID: <20190905182303.7f6bxpa2enbgcegv@wittgenstein>
References: <20190904201933.10736-1-cyphar@cyphar.com>
 <20190904201933.10736-2-cyphar@cyphar.com>
 <20190905180750.GQ1131@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190905180750.GQ1131@ZenIV.linux.org.uk>
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
 Aleksa Sarai <cyphar@cyphar.com>, Andy Lutomirski <luto@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Namhyung Kim <namhyung@kernel.org>,
 David Drysdale <drysdale@google.com>, Christian Brauner <christian@brauner.io>,
 "J. Bruce Fields" <bfields@fieldses.org>, linux-parisc@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-api@vger.kernel.org,
 Chanho Min <chanho.min@lge.com>, Jeff Layton <jlayton@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>,
 linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 containers@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 05, 2019 at 07:07:50PM +0100, Al Viro wrote:
> On Thu, Sep 05, 2019 at 06:19:22AM +1000, Aleksa Sarai wrote:
> > +/*
> > + * "memset(p, 0, size)" but for user space buffers. Caller must have already
> > + * checked access_ok(p, size).
> > + */
> > +static int __memzero_user(void __user *p, size_t s)
> > +{
> > +	const char zeros[BUFFER_SIZE] = {};
> > +	while (s > 0) {
> > +		size_t n = min(s, sizeof(zeros));
> > +
> > +		if (__copy_to_user(p, zeros, n))
> > +			return -EFAULT;
> > +
> > +		p += n;
> > +		s -= n;
> > +	}
> > +	return 0;
> > +}
> 
> That's called clear_user().
> 
> > +int copy_struct_to_user(void __user *dst, size_t usize,
> > +			const void *src, size_t ksize)
> > +{
> > +	size_t size = min(ksize, usize);
> > +	size_t rest = abs(ksize - usize);
> > +
> > +	if (unlikely(usize > PAGE_SIZE))
> > +		return -EFAULT;
> 
> Why?

Because every caller of that function right now has that limit set
anyway iirc. So we can either remove it from here and place it back for
the individual callers or leave it in the helper.
Also, I'm really asking, why not? Is it unreasonable to have an upper
bound on the size (for a long time probably) or are you disagreeing with
PAGE_SIZE being used? PAGE_SIZE limit is currently used by sched, perf,
bpf, and clone3 and in a few other places.
