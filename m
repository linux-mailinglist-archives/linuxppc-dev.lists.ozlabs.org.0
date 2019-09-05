Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3F9AAF63
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 01:55:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Pcxh3jvWzDr6x
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 09:55:04 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Pcvw5wW7zDr3k
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2019 09:53:31 +1000 (AEST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.1 #3 (Red Hat
 Linux)) id 1i61VY-0003aC-Me; Thu, 05 Sep 2019 23:49:44 +0000
Date: Fri, 6 Sep 2019 00:49:44 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Aleksa Sarai <cyphar@cyphar.com>
Subject: Re: [PATCH v12 01/12] lib: introduce copy_struct_{to,from}_user
 helpers
Message-ID: <20190905234944.GT1131@ZenIV.linux.org.uk>
References: <20190904201933.10736-1-cyphar@cyphar.com>
 <20190904201933.10736-2-cyphar@cyphar.com>
 <20190905180750.GQ1131@ZenIV.linux.org.uk>
 <20190905230003.bek7vqdvruzi4ybx@yavin.dot.cyphar.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190905230003.bek7vqdvruzi4ybx@yavin.dot.cyphar.com>
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
 sparclinux@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, Aleksa Sarai <asarai@suse.de>,
 Shuah Khan <shuah@kernel.org>,
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

On Fri, Sep 06, 2019 at 09:00:03AM +1000, Aleksa Sarai wrote:
> > > +			return -EFAULT;
> > > +	}
> > > +	/* Copy the interoperable parts of the struct. */
> > > +	if (__copy_to_user(dst, src, size))
> > > +		return -EFAULT;
> > 
> > Why not simply clear_user() and copy_to_user()?
> 
> I'm not sure I understand what you mean -- are you asking why we need to
> do memchr_inv(src + size, 0, rest) earlier?

I'm asking why bother with __ and separate access_ok().

> > 	if ((unsigned long)addr & 1) {
> > 		u8 v;
> > 		if (get_user(v, (__u8 __user *)addr))
> > 			return -EFAULT;
> > 		if (v)
> > 			return -E2BIG;
> > 		addr++;
> > 	}
> > 	if ((unsigned long)addr & 2) {
> > 		u16 v;
> > 		if (get_user(v, (__u16 __user *)addr))
> > 			return -EFAULT;
> > 		if (v)
> > 			return -E2BIG;
> > 		addr +=2;
> > 	}
> > 	if ((unsigned long)addr & 4) {
> > 		u32 v;
> > 		if (get_user(v, (__u32 __user *)addr))
> > 			return -EFAULT;
> > 		if (v)
> > 			return -E2BIG;
> > 	}
> > 	<read the rest like you currently do>

Actually, this is a dumb way to do it - page size on anything
is going to be a multiple of 8, so you could just as well
read 8 bytes from an address aligned down.  Then mask the
bytes you don't want to check out and see if there's anything
left.

You can have readability boundaries inside a page - it's either
the entire page (let alone a single word) being readable, or
it's EFAULT for all parts.

> > would be saner, and things like x86 could trivially add an
> > asm variant - it's not hard.  Incidentally, memchr_inv() is
> > an overkill in this case...
> 
> Why is memchr_inv() overkill?

Look at its implementation; you only care if there are
non-zeroes, you don't give a damn where in the buffer
the first one would be.  All you need is the same logics
as in "from userland" case
	if (!count)
		return true;
	offset = (unsigned long)from & 7
	p = (u64 *)(from - offset);
	v = *p++;
	if (offset) {	// unaligned
		count += offset;
		v &= ~aligned_byte_mask(offset); // see strnlen_user.c
	}
	while (count > 8) {
		if (v)
			return false;
		v = *p++;
		count -= 8;
	}
	if (count != 8)
		v &= aligned_byte_mask(count);
	return v == 0;

All there is to it...
