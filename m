Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2BF296658
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 23:01:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHKXp2msJzDqkD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 08:01:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ebiggers@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=zdUyA37A; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHKVf5J1mzDqhS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct 2020 07:59:38 +1100 (AEDT)
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D47120874;
 Thu, 22 Oct 2020 20:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603400375;
 bh=Xexx6LzGU5CEQ5pUb/Rnl3sbc1IKJSCv776XJ3IiUZY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zdUyA37A1L47KHgoyE+FT2EuXbQ76eLgYxDhD0pRsQ/vZP9VSxvex63p/S7m2wh2S
 LPo1qkQ3neXSHmpGEcAArmow8IRVH9ABGEBSoWdWkIGldhGddb2MyLlCZgza1+BxJr
 XSVfJ1lZvRBFbHtiVn91WdB+7mhw78zhWJSY/86E=
Date: Thu, 22 Oct 2020 13:59:32 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: Buggy commit tracked to: "Re: [PATCH 2/9] iov_iter: move
 rw_copy_check_uvector() into lib/iov_iter.c"
Message-ID: <20201022205932.GB3613750@gmail.com>
References: <df2e0758-b8ed-5aec-6adc-a18f499c0179@redhat.com>
 <20201022090155.GA1483166@kroah.com>
 <e04d0c5d-e834-a15b-7844-44dcc82785cc@redhat.com>
 <a1533569-948a-1d5b-e231-5531aa988047@redhat.com>
 <bc0a091865f34700b9df332c6e9dcdfd@AcuMS.aculab.com>
 <5fd6003b-55a6-2c3c-9a28-8fd3a575ca78@redhat.com>
 <20201022132342.GB8781@lst.de>
 <8f1fff0c358b4b669d51cc80098dbba1@AcuMS.aculab.com>
 <20201022164040.GV20115@casper.infradead.org>
 <CAKwvOdnq-yYLcF_coo=jMV-RH-SkuNp_kMB+KCBF5cz3PwiB8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdnq-yYLcF_coo=jMV-RH-SkuNp_kMB+KCBF5cz3PwiB8g@mail.gmail.com>
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
Cc: "linux-aio@kvack.org" <linux-aio@kvack.org>,
 David Hildenbrand <david@redhat.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 "kernel-team@android.com" <kernel-team@android.com>,
 Arnd Bergmann <arnd@arndb.de>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 David Laight <David.Laight@aculab.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 22, 2020 at 10:00:44AM -0700, Nick Desaulniers wrote:
> On Thu, Oct 22, 2020 at 9:40 AM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Thu, Oct 22, 2020 at 04:35:17PM +0000, David Laight wrote:
> > > Wait...
> > > readv(2) defines:
> > >       ssize_t readv(int fd, const struct iovec *iov, int iovcnt);
> >
> > It doesn't really matter what the manpage says.  What does the AOSP
> > libc header say?
> 
> Same: https://android.googlesource.com/platform/bionic/+/refs/heads/master/libc/include/sys/uio.h#38
> 
> Theoretically someone could bypass libc to make a system call, right?
> 
> >
> > > But the syscall is defined as:
> > >
> > > SYSCALL_DEFINE3(readv, unsigned long, fd, const struct iovec __user *, vec,
> > >                 unsigned long, vlen)
> > > {
> > >         return do_readv(fd, vec, vlen, 0);
> > > }
> >
> 

FWIW, glibc makes the readv() syscall assuming that fd and vlen are 'int' as
well.  So this problem isn't specific to Android's libc.

From objdump -d /lib/x86_64-linux-gnu/libc.so.6:

	00000000000f4db0 <readv@@GLIBC_2.2.5>:
	   f4db0:       64 8b 04 25 18 00 00    mov    %fs:0x18,%eax
	   f4db7:       00
	   f4db8:       85 c0                   test   %eax,%eax
	   f4dba:       75 14                   jne    f4dd0 <readv@@GLIBC_2.2.5+0x20>
	   f4dbc:       b8 13 00 00 00          mov    $0x13,%eax
	   f4dc1:       0f 05                   syscall
	   ...

There's some code for pthread cancellation, but no zeroing of the upper half of
the fd and vlen arguments, which are in %edi and %edx respectively.  But the
glibc function prototype uses 'int' for them, not 'unsigned long'
'ssize_t readv(int fd, const struct iovec *iov, int iovcnt);'.

So the high halves of the fd and iovcnt registers can contain garbage.  Or at
least that's what gcc (9.3.0) and clang (9.0.1) assume; they both compile the
following

void g(unsigned int x);

void f(unsigned long x)
{
        g(x);
}

into f() making a tail call to g(), without zeroing the top half of %rdi.

Also note the following program succeeds on Linux 5.9 on x86_64.  On kernels
that have this bug, it should fail.  (I couldn't get it to actually fail, so it
must depend on the compiler and/or the kernel config...)

	#include <fcntl.h>
	#include <stdio.h>
	#include <sys/syscall.h>
	#include <sys/uio.h>
	#include <unistd.h>

	int main()
	{
		int fd = open("/dev/zero", O_RDONLY);
		char buf[1000];
		struct iovec iov = { .iov_base = buf, .iov_len = sizeof(buf) };
		long ret;

		ret = syscall(__NR_readv, fd, &iov, 0x100000001);
		if (ret < 0)
			perror("readv failed");
		else
			printf("read %ld bytes\n", ret);
	}

I think the right fix is to change the readv() (and writev(), etc.) syscalls to
take 'unsigned int' rather than 'unsigned long', as that is what the users are
assuming...

- Eric
