Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7AA275ADA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 16:56:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxLqX4fK1zDqFM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 00:56:56 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxLg30tQTzDqHY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 00:49:27 +1000 (AEST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kL657-004bBq-D5; Wed, 23 Sep 2020 14:49:17 +0000
Date: Wed, 23 Sep 2020 15:49:17 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH 3/9] iov_iter: refactor rw_copy_check_uvector and
 import_iovec
Message-ID: <20200923144917.GM3421308@ZenIV.linux.org.uk>
References: <20200923060547.16903-1-hch@lst.de>
 <20200923060547.16903-4-hch@lst.de>
 <20200923141654.GJ3421308@ZenIV.linux.org.uk>
 <200cf2b9ce5e408f8838948fda7ce9a0@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200cf2b9ce5e408f8838948fda7ce9a0@AcuMS.aculab.com>
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
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 23, 2020 at 02:38:24PM +0000, David Laight wrote:
> From: Al Viro
> > Sent: 23 September 2020 15:17
> > 
> > On Wed, Sep 23, 2020 at 08:05:41AM +0200, Christoph Hellwig wrote:
> > 
> > > +struct iovec *iovec_from_user(const struct iovec __user *uvec,
> > > +		unsigned long nr_segs, unsigned long fast_segs,
> > 
> > Hmm...  For fast_segs unsigned long had always been ridiculous
> > (4G struct iovec on caller stack frame?), but that got me wondering about
> > nr_segs and I wish I'd thought of that when introducing import_iovec().
> > 
> > The thing is, import_iovec() takes unsigned int there.  Which is fine
> > (hell, the maximal value that can be accepted in 1024), except that
> > we do pass unsigned long syscall argument to it in some places.
> 
> It will make diddly-squit difference.
> The parameters end up in registers on most calling conventions.
> Plausibly you get an extra 'REX' byte on x86 for the 64bit value.
> What you want to avoid is explicit sign/zero extension and value
> masking after arithmetic.

Don't tell me what I want; your telepathic abilities are consistently sucky.

I am *NOT* talking about microoptimization here.  I have described
the behaviour change of syscall caused by commit 5 years ago.  Which is
generally considered a problem.  Then I asked whether that behaviour
change would fall under the "if nobody noticed, it's not a userland ABI
breakage" exception.

Could you show me the point where I have expressed concerns about
the quality of amd64 code generated for that thing, before or after
the change in question?
