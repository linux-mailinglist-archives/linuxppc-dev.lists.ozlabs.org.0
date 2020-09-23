Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9143275B0B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 17:02:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxLxT3PcvzDqWb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 01:02:05 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxLt967zvzDq8v
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 00:59:13 +1000 (AEST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kL6EX-004bOc-Io; Wed, 23 Sep 2020 14:59:01 +0000
Date: Wed, 23 Sep 2020 15:59:01 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 5/9] fs: remove various compat readv/writev helpers
Message-ID: <20200923145901.GN3421308@ZenIV.linux.org.uk>
References: <20200923060547.16903-1-hch@lst.de>
 <20200923060547.16903-6-hch@lst.de>
 <20200923142549.GK3421308@ZenIV.linux.org.uk>
 <20200923143251.GA14062@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923143251.GA14062@lst.de>
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

On Wed, Sep 23, 2020 at 04:32:51PM +0200, Christoph Hellwig wrote:
> On Wed, Sep 23, 2020 at 03:25:49PM +0100, Al Viro wrote:
> > On Wed, Sep 23, 2020 at 08:05:43AM +0200, Christoph Hellwig wrote:
> > >  COMPAT_SYSCALL_DEFINE3(readv, compat_ulong_t, fd,
> > > -		const struct compat_iovec __user *,vec,
> > > +		const struct iovec __user *, vec,
> > 
> > Um...  Will it even compile?
> > 
> > >  #ifdef __ARCH_WANT_COMPAT_SYS_PREADV64
> > >  COMPAT_SYSCALL_DEFINE4(preadv64, unsigned long, fd,
> > > -		const struct compat_iovec __user *,vec,
> > > +		const struct iovec __user *, vec,
> > 
> > Ditto.  Look into include/linux/compat.h and you'll see
> > 
> > asmlinkage long compat_sys_preadv64(unsigned long fd,
> >                 const struct compat_iovec __user *vec,
> >                 unsigned long vlen, loff_t pos);
> > 
> > How does that manage to avoid the compiler screaming bloody
> > murder?
> 
> That's a very good question.  But it does not just compile but actually
> works.  Probably because all the syscall wrappers mean that we don't
> actually generate the normal names.  I just tried this:
> 
> --- a/include/linux/syscalls.h
> +++ b/include/linux/syscalls.h
> @@ -468,7 +468,7 @@ asmlinkage long sys_lseek(unsigned int fd, off_t offset,
>  asmlinkage long sys_read(unsigned int fd, char __user *buf, size_t count);
>  asmlinkage long sys_write(unsigned int fd, const char __user *buf,
>                             size_t count);
> -asmlinkage long sys_readv(unsigned long fd,
> +asmlinkage long sys_readv(void *fd,
> 
> for fun, and the compiler doesn't care either..

Try to build it for sparc or ppc...
