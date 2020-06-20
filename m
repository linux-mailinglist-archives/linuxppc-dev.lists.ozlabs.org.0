Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1807B2021F4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 08:37:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pmDl43KZzDrWN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 16:37:11 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pmC639GmzDr1D
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jun 2020 16:35:45 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id D6CC268CEC; Sat, 20 Jun 2020 08:35:38 +0200 (CEST)
Date: Sat, 20 Jun 2020 08:35:38 +0200
From: Christoph Hellwig <hch@lst.de>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH 6/6] kernel: add a kernel_wait helper
Message-ID: <20200620063538.GA2408@lst.de>
References: <20200618144627.114057-1-hch@lst.de>
 <20200618144627.114057-7-hch@lst.de>
 <20200619211700.GS11244@42.do-not-panic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200619211700.GS11244@42.do-not-panic.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, x86@kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Brian Gerst <brgerst@gmail.com>, sparclinux@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 19, 2020 at 09:17:00PM +0000, Luis Chamberlain wrote:
> On Thu, Jun 18, 2020 at 04:46:27PM +0200, Christoph Hellwig wrote:
> > --- a/kernel/exit.c
> > +++ b/kernel/exit.c
> > @@ -1626,6 +1626,22 @@ long kernel_wait4(pid_t upid, int __user *stat_addr, int options,
> >  	return ret;
> >  }
> >  
> > +int kernel_wait(pid_t pid, int *stat)
> > +{
> > +	struct wait_opts wo = {
> > +		.wo_type	= PIDTYPE_PID,
> > +		.wo_pid		= find_get_pid(pid),
> > +		.wo_flags	= WEXITED,
> > +	};
> > +	int ret;
> > +
> > +	ret = do_wait(&wo);
> > +	if (ret > 0 && wo.wo_stat)
> > +		*stat = wo.wo_stat;
> 
> Since all we care about is WEXITED, that could be simplified
> to something like this:
> 
> if (ret > 0 && KWIFEXITED(wo.wo_stat)
>  	*stat = KWEXITSTATUS(wo.wo_stat)
> 
> Otherwise callers have to use W*() wrappers.
> 
> > +	put_pid(wo.wo_pid);
> > +	return ret;
> > +}
> 
> Then we don't get *any* in-kernel code dealing with the W*() crap.
> I just unwrapped this for the umh [0], given that otherwise we'd
> have to use KW*() callers elsewhere. Doing it upshot one level
> further would be even better.
> 
> [0] https://lkml.kernel.org/r/20200610154923.27510-1-mcgrof@kernel.org              
Do you just want to pick this patch up, add your suggested bits and
add it to the beginning of your series?  That should clean the whole
thing up a bit.  Nothing else in this series depends on the patch.
