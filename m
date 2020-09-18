Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9753D26FF74
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 16:03:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtFtb6Xq5zDqv1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 00:03:51 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtFmT18hDzDqtr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 23:58:33 +1000 (AEST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kJGu6-0014uQ-9R; Fri, 18 Sep 2020 13:58:22 +0000
Date: Fri, 18 Sep 2020 14:58:22 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/9] kernel: add a PF_FORCE_COMPAT flag
Message-ID: <20200918135822.GZ3421308@ZenIV.linux.org.uk>
References: <20200918124533.3487701-1-hch@lst.de>
 <20200918124533.3487701-2-hch@lst.de>
 <20200918134012.GY3421308@ZenIV.linux.org.uk>
 <20200918134406.GA17064@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200918134406.GA17064@lst.de>
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
 linux-scsi@vger.kernel.org, x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 18, 2020 at 03:44:06PM +0200, Christoph Hellwig wrote:
> On Fri, Sep 18, 2020 at 02:40:12PM +0100, Al Viro wrote:
> > >  	/* Vector 0x110 is LINUX_32BIT_SYSCALL_TRAP */
> > > -	return pt_regs_trap_type(current_pt_regs()) == 0x110;
> > > +	return pt_regs_trap_type(current_pt_regs()) == 0x110 ||
> > > +		(current->flags & PF_FORCE_COMPAT);
> > 
> > Can't say I like that approach ;-/  Reasoning about the behaviour is much
> > harder when it's controlled like that - witness set_fs() shite...
> 
> I don't particularly like it either.  But do you have a better idea
> how to deal with io_uring vs compat tasks?

<wry> git rm fs/io_uring.c would make a good starting point </wry>
Yes, I know it's not going to happen, but one can dream...

Said that, why not provide a variant that would take an explicit
"is it compat" argument and use it there?  And have the normal
one pass in_compat_syscall() to that...
