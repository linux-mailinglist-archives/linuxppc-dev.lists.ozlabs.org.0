Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D777275DA9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 18:40:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxP740MCszDqWl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 02:40:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxP5124fvzDqSp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 02:38:44 +1000 (AEST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kL7mp-004f4D-Mx; Wed, 23 Sep 2020 16:38:31 +0000
Date: Wed, 23 Sep 2020 17:38:31 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 5/9] fs: remove various compat readv/writev helpers
Message-ID: <20200923163831.GO3421308@ZenIV.linux.org.uk>
References: <20200923060547.16903-1-hch@lst.de>
 <20200923060547.16903-6-hch@lst.de>
 <20200923142549.GK3421308@ZenIV.linux.org.uk>
 <20200923143251.GA14062@lst.de>
 <20200923145901.GN3421308@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923145901.GN3421308@ZenIV.linux.org.uk>
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
Cc: linux-aio@kvack.org, linux-mips@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 keyrings@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 David Laight <David.Laight@aculab.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 23, 2020 at 03:59:01PM +0100, Al Viro wrote:

> > That's a very good question.  But it does not just compile but actually
> > works.  Probably because all the syscall wrappers mean that we don't
> > actually generate the normal names.  I just tried this:
> > 
> > --- a/include/linux/syscalls.h
> > +++ b/include/linux/syscalls.h
> > @@ -468,7 +468,7 @@ asmlinkage long sys_lseek(unsigned int fd, off_t offset,
> >  asmlinkage long sys_read(unsigned int fd, char __user *buf, size_t count);
> >  asmlinkage long sys_write(unsigned int fd, const char __user *buf,
> >                             size_t count);
> > -asmlinkage long sys_readv(unsigned long fd,
> > +asmlinkage long sys_readv(void *fd,
> > 
> > for fun, and the compiler doesn't care either..
> 
> Try to build it for sparc or ppc...

FWIW, declarations in syscalls.h used to serve 4 purposes:
	1) syscall table initializers needed symbols declared
	2) direct calls needed the same
	3) catching mismatches between the declarations and definitions
	4) centralized list of all syscalls

(2) has been (thankfully) reduced for some time; in any case, ksys_... is
used for the remaining ones.

(1) and (3) are served by syscalls.h in architectures other than x86, arm64
and s390.  On those 3 (1) is done otherwise (near the syscall table initializer)
and (3) is not done at all.

I wonder if we should do something like

SYSCALL_DECLARE3(readv, unsigned long, fd, const struct iovec __user *, vec,
		 unsigned long, vlen);
in syscalls.h instead, and not under that ifdef.

Let it expand to declaration of sys_...() in generic case and, on x86, into
__do_sys_...() and __ia32_sys_...()/__x64_sys_...(), with types matching
what SYSCALL_DEFINE ends up using.

Similar macro would cover compat_sys_...() declarations.  That would
restore mismatch checking for x86 and friends.  AFAICS, the cost wouldn't
be terribly high - cpp would have more to chew through in syscalls.h,
but it shouldn't be all that costly.  Famous last words, of course...

Does anybody see fundamental problems with that?
