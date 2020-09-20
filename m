Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ABC271763
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 21:13:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BvcfK3C5tzDqY3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 05:12:57 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bvcbp54BhzDqY3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Sep 2020 05:10:44 +1000 (AEST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kK4jH-002dC7-8S; Sun, 20 Sep 2020 19:10:31 +0000
Date: Sun, 20 Sep 2020 20:10:31 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 1/9] kernel: add a PF_FORCE_COMPAT flag
Message-ID: <20200920191031.GQ3421308@ZenIV.linux.org.uk>
References: <20200918124533.3487701-1-hch@lst.de>
 <20200918124533.3487701-2-hch@lst.de>
 <20200920151510.GS32101@casper.infradead.org>
 <20200920180742.GN3421308@ZenIV.linux.org.uk>
 <20200920190159.GT32101@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200920190159.GT32101@casper.infradead.org>
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
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-block@vger.kernel.org,
 io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jens Axboe <axboe@kernel.dk>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Sep 20, 2020 at 08:01:59PM +0100, Matthew Wilcox wrote:
> On Sun, Sep 20, 2020 at 07:07:42PM +0100, Al Viro wrote:
> > 	2) a few drivers are really fucked in head.  They use different
> > *DATA* layouts for reads/writes, depending upon the calling process.
> > IOW, if you fork/exec a 32bit binary and your stdin is one of those,
> > reads from stdin in parent and child will yield different data layouts.
> > On the same struct file.
> > 	That's what Christoph worries about (/dev/sg he'd mentioned is
> > one of those).
> > 
> > 	IMO we should simply have that dozen or so of pathological files
> > marked with FMODE_SHITTY_ABI; it's not about how they'd been opened -
> > it describes the userland ABI provided by those.  And it's cast in stone.
> > 
> > 	Any in_compat_syscall() in ->read()/->write() instances is an ABI
> > bug, plain and simple.  Some are unfixable for compatibility reasons, but
> > any new caller like that should be a big red flag.
> 
> So an IOCB_COMPAT flag would let us know whether the caller is expecting
> a 32-bit or 64-bit layout?  And io_uring could set it based on the
> ctx->compat flag.

So you want to convert all that crap to a form that would see iocb
(IOW, ->read_iter()/->write_iter())?  And, since quite a few are sysfs
attributes, propagate that through sysfs, changing the method signatures
to match that and either modifying fuckloads of instances or introducing
new special methods for the ones that are sensitive to that crap?

IMO it's much saner to mark those and refuse to touch them from io_uring...
