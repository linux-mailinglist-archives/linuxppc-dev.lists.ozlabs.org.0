Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47428275A38
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 16:35:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxLLX3Kj4zDq9Z
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 00:35:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxLHs6DG6zDqTj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 00:32:56 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0E0AE6736F; Wed, 23 Sep 2020 16:32:52 +0200 (CEST)
Date: Wed, 23 Sep 2020 16:32:51 +0200
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 5/9] fs: remove various compat readv/writev helpers
Message-ID: <20200923143251.GA14062@lst.de>
References: <20200923060547.16903-1-hch@lst.de>
 <20200923060547.16903-6-hch@lst.de>
 <20200923142549.GK3421308@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923142549.GK3421308@ZenIV.linux.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-block@vger.kernel.org,
 io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jens Axboe <axboe@kernel.dk>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, David Laight <David.Laight@aculab.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 23, 2020 at 03:25:49PM +0100, Al Viro wrote:
> On Wed, Sep 23, 2020 at 08:05:43AM +0200, Christoph Hellwig wrote:
> >  COMPAT_SYSCALL_DEFINE3(readv, compat_ulong_t, fd,
> > -		const struct compat_iovec __user *,vec,
> > +		const struct iovec __user *, vec,
> 
> Um...  Will it even compile?
> 
> >  #ifdef __ARCH_WANT_COMPAT_SYS_PREADV64
> >  COMPAT_SYSCALL_DEFINE4(preadv64, unsigned long, fd,
> > -		const struct compat_iovec __user *,vec,
> > +		const struct iovec __user *, vec,
> 
> Ditto.  Look into include/linux/compat.h and you'll see
> 
> asmlinkage long compat_sys_preadv64(unsigned long fd,
>                 const struct compat_iovec __user *vec,
>                 unsigned long vlen, loff_t pos);
> 
> How does that manage to avoid the compiler screaming bloody
> murder?

That's a very good question.  But it does not just compile but actually
works.  Probably because all the syscall wrappers mean that we don't
actually generate the normal names.  I just tried this:

--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -468,7 +468,7 @@ asmlinkage long sys_lseek(unsigned int fd, off_t offset,
 asmlinkage long sys_read(unsigned int fd, char __user *buf, size_t count);
 asmlinkage long sys_write(unsigned int fd, const char __user *buf,
                            size_t count);
-asmlinkage long sys_readv(unsigned long fd,
+asmlinkage long sys_readv(void *fd,

for fun, and the compiler doesn't care either..
