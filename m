Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5507202583
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 19:04:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49q28K1ZkYzDr0d
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Jun 2020 03:04:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.194;
 helo=mail-pf1-f194.google.com; envelope-from=mcgrof@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49q26B4ZJXzDqxg
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Jun 2020 03:02:26 +1000 (AEST)
Received: by mail-pf1-f194.google.com with SMTP id j1so6090120pfe.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jun 2020 10:02:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hkYGXZYFNkz40ca5bdh2l8rwBQsGz5Dfq7lbQQ/ZMb4=;
 b=AVaciy0cnXDbZqstqha7jiOqeFtkRDaooWKfU1hwYom4R+leMn+ZjCXdkSnR5HeGIo
 Wx9JJ13XUzC9XM09758dXILyF/hGSrXOxa7gctfkVkMWvkURdUwWYnOvJQbcbKdk8wFU
 OcYLm8a1Yz8tNzwjHV7tjdh1qjstrRcDrIHPZ7aTs+GZkKQodyH3gdcVne5Qrf67yunO
 BSBlt8RR+C6RrxbzQ9p+Uj/Kv40lQ6+dTnUkPiQeEe12G8FojC1qAVAPwHVIIpzZoDM/
 ATt8vXkR0RnvV3TJV58dbZI7U1wJK+zEfCXYoTWR6wPs3JV/dRLBiTyWCwnOrzckaJEl
 tbHA==
X-Gm-Message-State: AOAM5322V6TLEQxzxWJUIuYPFs/OZnB0PfN+Pkf4EyyHNSYhl8S5gS8C
 5l/BfySEpSPrGubxFK+7C4w=
X-Google-Smtp-Source: ABdhPJw4cY69dDBjGxi+dEmU+lne2Jaj+Kt7j3+OOL+ZesgQbK+T06ayny/Nuk+eU5cbc92qa9tynQ==
X-Received: by 2002:a63:7c5e:: with SMTP id l30mr7050243pgn.276.1592672542711; 
 Sat, 20 Jun 2020 10:02:22 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id x18sm9195784pfr.106.2020.06.20.10.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2020 10:02:20 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id B439940430; Sat, 20 Jun 2020 17:02:19 +0000 (UTC)
Date: Sat, 20 Jun 2020 17:02:19 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 6/6] kernel: add a kernel_wait helper
Message-ID: <20200620170219.GT11244@42.do-not-panic.com>
References: <20200618144627.114057-1-hch@lst.de>
 <20200618144627.114057-7-hch@lst.de>
 <20200619211700.GS11244@42.do-not-panic.com>
 <20200620063538.GA2408@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200620063538.GA2408@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 20, 2020 at 08:35:38AM +0200, Christoph Hellwig wrote:
> On Fri, Jun 19, 2020 at 09:17:00PM +0000, Luis Chamberlain wrote:
> > On Thu, Jun 18, 2020 at 04:46:27PM +0200, Christoph Hellwig wrote:
> > > --- a/kernel/exit.c
> > > +++ b/kernel/exit.c
> > > @@ -1626,6 +1626,22 @@ long kernel_wait4(pid_t upid, int __user *stat_addr, int options,
> > >  	return ret;
> > >  }
> > >  
> > > +int kernel_wait(pid_t pid, int *stat)
> > > +{
> > > +	struct wait_opts wo = {
> > > +		.wo_type	= PIDTYPE_PID,
> > > +		.wo_pid		= find_get_pid(pid),
> > > +		.wo_flags	= WEXITED,
> > > +	};
> > > +	int ret;
> > > +
> > > +	ret = do_wait(&wo);
> > > +	if (ret > 0 && wo.wo_stat)
> > > +		*stat = wo.wo_stat;
> > 
> > Since all we care about is WEXITED, that could be simplified
> > to something like this:
> > 
> > if (ret > 0 && KWIFEXITED(wo.wo_stat)
> >  	*stat = KWEXITSTATUS(wo.wo_stat)
> > 
> > Otherwise callers have to use W*() wrappers.
> > 
> > > +	put_pid(wo.wo_pid);
> > > +	return ret;
> > > +}
> > 
> > Then we don't get *any* in-kernel code dealing with the W*() crap.
> > I just unwrapped this for the umh [0], given that otherwise we'd
> > have to use KW*() callers elsewhere. Doing it upshot one level
> > further would be even better.
> > 
> > [0] https://lkml.kernel.org/r/20200610154923.27510-1-mcgrof@kernel.org              
> Do you just want to pick this patch up, add your suggested bits and
> add it to the beginning of your series?  That should clean the whole
> thing up a bit.  Nothing else in this series depends on the patch.

Sure but let's wait to hear from the NFS folks.

I'm waiting to hear from NFS folks if the one place where the UMH is
fixed for the error code (on fs/nfsd/nfs4recover.c we never were
disabling the upcall as the error code of -ENOENT or -EACCES was *never*
properly checked for) to see how critical that was. If it can help
stable kernels the fix can go in as I proposed, followed by this patch
to further take the KWEXITSTATUS() up further, and ensure we *never*
deal with this in-kernel. If its not a fix stable kernels should care
for what you suggest of taking this patch first would be best and I'd be
happy to do that.

  Luis
