Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D8E25C5B7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 17:50:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bj4xz3ZNtzDr3S
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 01:49:59 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bj39w2ycnzDr3p
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 00:30:11 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A8FCA67357; Thu,  3 Sep 2020 16:30:04 +0200 (CEST)
Date: Thu, 3 Sep 2020 16:30:03 +0200
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: remove the last set_fs() in common code, and remove it for x86
 and powerpc v3
Message-ID: <20200903143003.GA17260@lst.de>
References: <20200903142242.925828-1-hch@lst.de>
 <20200903142803.GM1236603@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903142803.GM1236603@ZenIV.linux.org.uk>
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
 linux-kernel@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>, linux-fsdevel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 03, 2020 at 03:28:03PM +0100, Al Viro wrote:
> On Thu, Sep 03, 2020 at 04:22:28PM +0200, Christoph Hellwig wrote:
> 
> > Besides x86 and powerpc I plan to eventually convert all other
> > architectures, although this will be a slow process, starting with the
> > easier ones once the infrastructure is merged.  The process to convert
> > architectures is roughtly:
> > 
> >  (1) ensure there is no set_fs(KERNEL_DS) left in arch specific code
> >  (2) implement __get_kernel_nofault and __put_kernel_nofault
> >  (3) remove the arch specific address limitation functionality
> 
> The one to really watch out for is sparc; I have something in that
> direction, will resurrect as soon as I'm done with eventpoll analysis...
> 
> I can live with this series; do you want that in vfs.git#for-next?

Either that or a separate tree is fine with me.  It would be good to
eventually have a non-rebased stable tree so that other arch trees
can work from it, though.
