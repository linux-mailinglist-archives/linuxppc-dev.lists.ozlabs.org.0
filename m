Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81205276160
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 21:49:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxTKN0flZzDqfr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 05:49:44 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxTHk0M3rzDq8M
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 05:48:15 +1000 (AEST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kLAk7-004l0B-Ms; Wed, 23 Sep 2020 19:47:55 +0000
Date: Wed, 23 Sep 2020 20:47:55 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 5/9] fs: remove various compat readv/writev helpers
Message-ID: <20200923194755.GR3421308@ZenIV.linux.org.uk>
References: <20200923060547.16903-1-hch@lst.de>
 <20200923060547.16903-6-hch@lst.de>
 <20200923142549.GK3421308@ZenIV.linux.org.uk>
 <20200923143251.GA14062@lst.de>
 <20200923145901.GN3421308@ZenIV.linux.org.uk>
 <20200923163831.GO3421308@ZenIV.linux.org.uk>
 <CAK8P3a3nkLUOkR+jwz2_2LcYTUTqdVf8JOtZqKWbtEDotNhFZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3nkLUOkR+jwz2_2LcYTUTqdVf8JOtZqKWbtEDotNhFZA@mail.gmail.com>
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
Cc: linux-aio <linux-aio@kvack.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Linux-MM <linux-mm@kvack.org>,
 keyrings@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 linux-block <linux-block@vger.kernel.org>, io-uring@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Jens Axboe <axboe@kernel.dk>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Networking <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 LSM List <linux-security-module@vger.kernel.org>,
 David Laight <David.Laight@aculab.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 23, 2020 at 08:45:51PM +0200, Arnd Bergmann wrote:
> On Wed, Sep 23, 2020 at 6:38 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> > I wonder if we should do something like
> >
> > SYSCALL_DECLARE3(readv, unsigned long, fd, const struct iovec __user *, vec,
> >                  unsigned long, vlen);
> > in syscalls.h instead, and not under that ifdef.
> >
> > Let it expand to declaration of sys_...() in generic case and, on x86, into
> > __do_sys_...() and __ia32_sys_...()/__x64_sys_...(), with types matching
> > what SYSCALL_DEFINE ends up using.
> >
> > Similar macro would cover compat_sys_...() declarations.  That would
> > restore mismatch checking for x86 and friends.  AFAICS, the cost wouldn't
> > be terribly high - cpp would have more to chew through in syscalls.h,
> > but it shouldn't be all that costly.  Famous last words, of course...
> >
> > Does anybody see fundamental problems with that?
> 
> I've had some ideas along those lines in the past and I think it should work.
> 
> As a variation of this, the SYSCALL_DEFINEx() macros could go away
> entirely, leaving only the macro instantiations from the header to
> require that syntax. It would require first changing the remaining
> architectures to build the syscall table from C code instead of
> assembler though.
> 
> Regardless of that, another advantage of having the SYSCALL_DECLAREx()
> would be the ability to include that header file from elsewhere with a different
> macro definition to create a machine-readable version of the interface when
> combined with the syscall.tbl files. This could be used to create a user
> space stub for calling into the low-level syscall regardless of the
> libc interfaces,
> or for synchronizing the interfaces with strace, qemu-user, or anything that
> needs to deal with the low-level interface.

FWIW, after playing with that for a while...  Do we really want the
compat_sys_...() declarations to live in linux/compat.h?  Most of
the users of that file don't want those; why not move them to
linux/syscalls.h?

Reason: there's a lot more users of linux/compat.h than those of
linux/syscalls.h - it's pulled by everything in the networking stack,
for starters...
