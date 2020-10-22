Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 725772966AA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 23:31:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHLC42xj6zDqyP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 08:31:12 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHL8J5l87zDqwV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct 2020 08:28:47 +1100 (AEDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kVi8K-006V84-LA; Thu, 22 Oct 2020 21:28:28 +0000
Date: Thu, 22 Oct 2020 22:28:28 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: Buggy commit tracked to: "Re: [PATCH 2/9] iov_iter: move
 rw_copy_check_uvector() into lib/iov_iter.c"
Message-ID: <20201022212828.GZ3576660@ZenIV.linux.org.uk>
References: <20201022090155.GA1483166@kroah.com>
 <e04d0c5d-e834-a15b-7844-44dcc82785cc@redhat.com>
 <a1533569-948a-1d5b-e231-5531aa988047@redhat.com>
 <bc0a091865f34700b9df332c6e9dcdfd@AcuMS.aculab.com>
 <5fd6003b-55a6-2c3c-9a28-8fd3a575ca78@redhat.com>
 <20201022132342.GB8781@lst.de>
 <8f1fff0c358b4b669d51cc80098dbba1@AcuMS.aculab.com>
 <20201022164040.GV20115@casper.infradead.org>
 <CAKwvOdnq-yYLcF_coo=jMV-RH-SkuNp_kMB+KCBF5cz3PwiB8g@mail.gmail.com>
 <20201022205932.GB3613750@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201022205932.GB3613750@gmail.com>
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
 Linus Torvalds <torvalds@linux-foundation.org>,
 "kernel-team@android.com" <kernel-team@android.com>,
 Arnd Bergmann <arnd@arndb.de>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
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

On Thu, Oct 22, 2020 at 01:59:32PM -0700, Eric Biggers wrote:

> Also note the following program succeeds on Linux 5.9 on x86_64.  On kernels
> that have this bug, it should fail.  (I couldn't get it to actually fail, so it
> must depend on the compiler and/or the kernel config...)

It doesn't.  See https://www.spinics.net/lists/linux-scsi/msg147836.html for
discussion of that mess.

ssize_t vfs_readv(struct file *file, const struct iovec __user *vec,
                  unsigned long vlen, loff_t *pos, rwf_t flags)
{
        struct iovec iovstack[UIO_FASTIOV];
        struct iovec *iov = iovstack;
        struct iov_iter iter;
        ssize_t ret;

        ret = import_iovec(READ, vec, vlen, ARRAY_SIZE(iovstack), &iov, &iter);
        if (ret >= 0) {
                ret = do_iter_read(file, &iter, pos, flags);
                kfree(iov);
        }

        return ret;
}

and import_iovec() takes unsigned int as the third argument, so it *will*
truncate to 32 bits, no matter what.  Has done so since 0504c074b546
"switch {compat_,}do_readv_writev() to {compat_,}import_iovec()" back in
March 2015.  Yes, it was an incompatible userland ABI change, even though
nothing that used glibc/uclibc/dietlibc would've noticed.

Better yet, up until 2.1.90pre1 passing a 64bit value as the _first_ argument
of readv(2) used to fail with -EBADF if it was too large; at that point it
started to get quietly truncated to 32bit first.  And again, no libc users
would've noticed (neither would anything except deliberate regression test
looking for that specific behaviour).

Note that we also have process_madvise(2) with size_t for vlen (huh?  It's
a number of array elements, not an object size) and process_vm_{read,write}v(2),
that have unsigned long for the same thing.  And the last two *are* using
the same unsigned long from glibc POV.
