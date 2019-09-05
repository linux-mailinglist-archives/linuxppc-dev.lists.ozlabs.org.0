Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB036AAE92
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 00:34:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Pb9B6tc9zDqQ1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 08:34:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=ftp.linux.org.uk
 (client-ip=195.92.253.2; helo=zeniv.linux.org.uk;
 envelope-from=viro@ftp.linux.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=zeniv.linux.org.uk
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [195.92.253.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Pb6Y3JlMzDr6W
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2019 08:32:32 +1000 (AEST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.1 #3 (Red Hat
 Linux)) id 1i60I9-0001pN-0U; Thu, 05 Sep 2019 22:31:49 +0000
Date: Thu, 5 Sep 2019 23:31:48 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Aleksa Sarai <cyphar@cyphar.com>
Subject: Re: [PATCH v12 01/12] lib: introduce copy_struct_{to,from}_user
 helpers
Message-ID: <20190905223148.GS1131@ZenIV.linux.org.uk>
References: <20190904201933.10736-1-cyphar@cyphar.com>
 <20190904201933.10736-2-cyphar@cyphar.com>
 <20190905180750.GQ1131@ZenIV.linux.org.uk>
 <20190905182303.7f6bxpa2enbgcegv@wittgenstein>
 <20190905182801.GR1131@ZenIV.linux.org.uk>
 <20190905195618.pwzgvuzadkfpznfz@yavin.dot.cyphar.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190905195618.pwzgvuzadkfpznfz@yavin.dot.cyphar.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
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
 sparclinux@vger.kernel.org, Christian Brauner <christian.brauner@ubuntu.com>,
 Shuah Khan <shuah@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Tycho Andersen <tycho@tycho.ws>,
 Aleksa Sarai <asarai@suse.de>, Jiri Olsa <jolsa@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Jann Horn <jannh@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-m68k@lists.linux-m68k.org, Andy Lutomirski <luto@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Namhyung Kim <namhyung@kernel.org>,
 David Drysdale <drysdale@google.com>, Christian Brauner <christian@brauner.io>,
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

On Fri, Sep 06, 2019 at 05:56:18AM +1000, Aleksa Sarai wrote:
> On 2019-09-05, Al Viro <viro@zeniv.linux.org.uk> wrote:
> > On Thu, Sep 05, 2019 at 08:23:03PM +0200, Christian Brauner wrote:
> > 
> > > Because every caller of that function right now has that limit set
> > > anyway iirc. So we can either remove it from here and place it back for
> > > the individual callers or leave it in the helper.
> > > Also, I'm really asking, why not? Is it unreasonable to have an upper
> > > bound on the size (for a long time probably) or are you disagreeing with
> > > PAGE_SIZE being used? PAGE_SIZE limit is currently used by sched, perf,
> > > bpf, and clone3 and in a few other places.
> > 
> > For a primitive that can be safely used with any size (OK, any within
> > the usual 2Gb limit)?  Why push the random policy into the place where
> > it doesn't belong?
> > 
> > Seriously, what's the point?  If they want to have a large chunk of
> > userland memory zeroed or checked for non-zeroes - why would that
> > be a problem?
> 
> Thinking about it some more, there isn't really any r/w amplification --
> so there isn't much to gain by passing giant structs. Though, if we are
> going to permit 2GB buffers, isn't that also an argument to use
> memchr_inv()? :P

I'm not sure I understand the last bit.  If you look at what copy_from_user()
does on misaligned source/destination, especially on architectures that
really, really do not like unaligned access...

Case in point: alpha (and it's not unusual in that respect).  What it boils
down to is
	copy bytes until the destination is aligned
	if source and destination are both aligned
		copy word by word
	else
		read word by word, storing the mix of two adjacent words
	copy the rest byte by byte

The unpleasant case (to and from having different remainders modulo 8) is
basically

	if (count >= 8) {
		u64 *aligned = (u64 *)(from & ~7);
		u64 *dest = (u64 *)to;
		int bitshift = (from & 7) * 8;
		u64 prev, next;

		prev = aligned[0];
		do {   
			next = aligned[1];
			prev <<= bitshift;
			prev |= next >> (64 - bitshift);
			*dest++ = prev;
			aligned++;  
			prev = next;
			from += 8;
			to += 8;
			count -= 8;
		} while (count >= 8);
	}

Now, mix that with "... and do memchr_inv() on the copy to find if we'd
copied any non-zeroes, nevermind where" and it starts looking really
ridiculous.

We should just read the fscking source, aligned down to word boundary
and check each word being read.  The first and the last ones - masked.
All there is to it.  On almost all architectures that'll work well
enough; s390 might want something more elaborate (there even word-by-word
copies are costly, but I'd suggest talking to them for details).

Something like bool all_zeroes_user(const void __user *p, size_t count)
would probably be a sane API...
