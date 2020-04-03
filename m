Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BFA19DFDF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 22:54:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48vBxL5Y66zF0d4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 07:53:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=ftp.linux.org.uk (client-ip=2002:c35c:fd02::1;
 helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=zeniv.linux.org.uk
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48vBvk2VsszDqXV
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 07:52:34 +1100 (AEDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1jKTIL-009rSy-AY; Fri, 03 Apr 2020 20:52:05 +0000
Date: Fri, 3 Apr 2020 21:52:05 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 5/5] uaccess: Rename user_access_begin/end() to
 user_full_access_begin/end()
Message-ID: <20200403205205.GK23230@ZenIV.linux.org.uk>
References: <36e43241c7f043a24b5069e78c6a7edd11043be5.1585898438.git.christophe.leroy@c-s.fr>
 <42da416106d5c1cf92bda1e058434fe240b35f44.1585898438.git.christophe.leroy@c-s.fr>
 <CAHk-=wh_DY_dysMX0NuvJmMFr3+QDKOZPZqWKwLkkjgZTuyQ+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wh_DY_dysMX0NuvJmMFr3+QDKOZPZqWKwLkkjgZTuyQ+A@mail.gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Dave Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Peter Anvin <hpa@zytor.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 Daniel Vetter <daniel@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 03, 2020 at 11:01:10AM -0700, Linus Torvalds wrote:
> On Fri, Apr 3, 2020 at 12:21 AM Christophe Leroy
> <christophe.leroy@c-s.fr> wrote:
> >
> > Now we have user_read_access_begin() and user_write_access_begin()
> > in addition to user_access_begin().
> 
> I realize Al asked for this, but I don't think it really adds anything
> to the series.
> 
> The "full" makes the names longer, but not really any more legible.
> 
> So I like 1-4, but am unconvinced about 5 and would prefer that to be
> dropped. Sorry for the bikeshedding.
> 
> And I like this series much better without the cookie that was
> discussed, and just making the hard rule be that they can't nest.
> 
> Some architecture may obviously use a cookie internally if they have
> some nesting behavior of their own, but it doesn't look like we have
> any major reason to expose that as the actual interface.
> 
> The only other question is how to synchronize this? I'm ok with it
> going through the ppc tree, for example, and just let others build on
> that.  Maybe using a shared immutable branch with 5.6 as a base?

I can do a 5.7-rc1-based branch with that; depending upon what we end
up doing for arm and s390 we can always change the calling conventions
come next cycle ;-/

My impressions after digging through arm side of things:

1) the only instance of nesting I'd found there (so far) is a mistake.
The rule should be "no fucking nesting, TYVM".

2) I'm really unhappy about the uaccess_with_memcpy thing.  Besides
being fucking ugly, it kills any hope of lifting user_access_begin/end
out of raw_copy_to_user() - the things done in that bastard are
obviously *NOT* fit for uaccess block.  Including the wonders like
        /* the mmap semaphore is taken only if not in an atomic context */
        atomic = faulthandler_disabled();

        if (!atomic)
                down_read(&current->mm->mmap_sem);
which, IMO, deserves to be taken out and shot.  Not that pin_page_for_write()
in the same file (arch/arm/lib/uaccess_with_memcpy.c) did not deserve the
same treatment...  As far as I can tell, the whole point of that thing
is that well, memcpy() is optimized better than raw_copy_to_user()...
So what's wrong with taking the damn optimized memcpy and using it for
raw_copy_to_user() instead?

Is that the lack of STRT analogue that would store several registers?
Because AFAICS commit f441882a5229ffaef61a47bccd4518f7e2749cbc
Author: Vincent Whitchurch <vincent.whitchurch@axis.com>
Date:   Fri Nov 9 10:09:48 2018 +0100
    ARM: 8812/1: Optimise copy_{from/to}_user for !CPU_USE_DOMAINS
makes for much saner solution...  I realize that it's v6+ and this
thing is specifically for a v5 variant, but...

3) how much do we need to keep the old DACR value in a register for
uaccess_restore()?  AFAICS, if we prohibit nesting it becomes
a function of USER_DS/KERNEL_DS setting (and that - only for
CPU_USE_DOMAINS), doesn't it?  And we had to have fetched it
recently, back when access_ok() had been done, so shouldn't
it be in cache?
