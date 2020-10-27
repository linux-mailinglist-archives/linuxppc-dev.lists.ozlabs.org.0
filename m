Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D85B729A882
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 10:57:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CL6Yn0GDyzDq6k
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 20:57:01 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CL6WY6lMhzDq6k
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Oct 2020 20:55:01 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 98EC068AFE; Tue, 27 Oct 2020 10:54:55 +0100 (CET)
Date: Tue, 27 Oct 2020 10:54:55 +0100
From: Christoph Hellwig <hch@lst.de>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 02/10] fs: don't allow splice read/write without
 explicit ops
Message-ID: <20201027095455.GA30298@lst.de>
References: <3088368.1603790984@warthog.procyon.org.uk>
 <20200827150030.282762-3-hch@lst.de> <20200827150030.282762-1-hch@lst.de>
 <3155818.1603792294@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3155818.1603792294@warthog.procyon.org.uk>
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
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Kees Cook <keescook@chromium.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 27, 2020 at 09:51:34AM +0000, David Howells wrote:
> David Howells <dhowells@redhat.com> wrote:
> 
> > > default_file_splice_write is the last piece of generic code that uses
> > > set_fs to make the uaccess routines operate on kernel pointers.  It
> > > implements a "fallback loop" for splicing from files that do not actually
> > > provide a proper splice_read method.  The usual file systems and other
> > > high bandwith instances all provide a ->splice_read, so this just removes
> > > support for various device drivers and procfs/debugfs files.  If splice
> > > support for any of those turns out to be important it can be added back
> > > by switching them to the iter ops and using generic_file_splice_read.
> > 
> > Hmmm...  this causes the copy_file_range() syscall to fail with EINVAL in some
> > places where before it used to work.
> > 
> > For my part, it causes the generic/112 xfstest to fail with afs, but there may
> > be other places.
> > 
> > Is this a regression we need to fix in the VFS core?  Or is it something we
> > need to fix in xfstests and assume userspace will fallback to doing it itself?
> 
> That said, for afs at least, the fix seems to be just this:

And that is the correct fix, I was about to send it to you.

We can't have a "generic" splice using ->read/->write without set_fs,
in addition to the iter_file_splice_write based version being a lot
more efficient than what you had before.
