Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 150A5289D59
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Oct 2020 04:05:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C7SvR0zVRzDqX6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Oct 2020 13:05:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=aviro@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=bcGCjuM1; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=bcGCjuM1; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C7Sjs3n2KzDqs2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Oct 2020 12:57:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602295022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZEq+9RUNCLcUowlY3rNV2I+fdNX5VdqF7iThjTKHAYU=;
 b=bcGCjuM1C5s4e+fYg7lqneek+idlsIEp6nuBY91dqwu9rZ/9lCaRLsfqkuy+jBsXwKpxq0
 rYqyTldTa7RLYT29YzYjArOj8Rs6/bxtJFzaMpN9ZIHQYGsC3wowI6vF9A+cXM/nGVoy3o
 ZUq4ziOvctygEyK7EnwfbugBW2T09lw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602295022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZEq+9RUNCLcUowlY3rNV2I+fdNX5VdqF7iThjTKHAYU=;
 b=bcGCjuM1C5s4e+fYg7lqneek+idlsIEp6nuBY91dqwu9rZ/9lCaRLsfqkuy+jBsXwKpxq0
 rYqyTldTa7RLYT29YzYjArOj8Rs6/bxtJFzaMpN9ZIHQYGsC3wowI6vF9A+cXM/nGVoy3o
 ZUq4ziOvctygEyK7EnwfbugBW2T09lw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-iD51xsXWOkmoDtx0CE8sLQ-1; Fri, 09 Oct 2020 21:55:27 -0400
X-MC-Unique: iD51xsXWOkmoDtx0CE8sLQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9583C1005513;
 Sat, 10 Oct 2020 01:55:25 +0000 (UTC)
Received: from shell-el7.hosts.prod.upshift.rdu2.redhat.com
 (shell-el7.hosts.prod.upshift.rdu2.redhat.com [10.0.15.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F36285D9FC;
 Sat, 10 Oct 2020 01:55:24 +0000 (UTC)
Received: by shell-el7.hosts.prod.upshift.rdu2.redhat.com (Postfix,
 from userid 2518)
 id 888946000432; Sat, 10 Oct 2020 01:55:24 +0000 (UTC)
Date: Sat, 10 Oct 2020 01:55:24 +0000
From: Alexander Viro <aviro@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 05/14] fs: don't allow kernel reads and writes without
 iter ops
Message-ID: <20201010015524.GB101464@shell-el7.hosts.prod.upshift.rdu2.redhat.com>
References: <20200903142242.925828-1-hch@lst.de>
 <20200903142242.925828-6-hch@lst.de>
 <20201001223852.GA855@sol.localdomain>
 <20201001224051.GI3421308@ZenIV.linux.org.uk>
 <CAHk-=wgj=mKeN-EfV5tKwJNeHPLG0dybq+R5ZyGuc4WeUnqcmA@mail.gmail.com>
 <20201009220633.GA1122@sol.localdomain>
 <CAHk-=whcEzYjkqdpZciHh+iAdUttvfWZYoiHiF67XuTXB1YJLw@mail.gmail.com>
 <20201010011919.GC1122@sol.localdomain>
 <CAHk-=wigvcmp-jcgoNCbx45W7j3=0jA320CfpskwuoEjefM7nQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wigvcmp-jcgoNCbx45W7j3=0jA320CfpskwuoEjefM7nQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mailman-Approved-At: Sat, 10 Oct 2020 13:03:50 +1100
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Alexander Viro <aviro@redhat.com>, the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alexey Dobriyan <adobriyan@gmail.com>, Eric Biggers <ebiggers@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 09, 2020 at 06:29:13PM -0700, Linus Torvalds wrote:
> On Fri, Oct 9, 2020 at 6:19 PM Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > Okay, that makes more sense.  So the patchset from Matthew
> > https://lkml.kernel.org/linux-fsdevel/20201003025534.21045-1-willy@infradead.org/T/#u
> > isn't what you had in mind.
> 
> No.
> 
> That first patch makes sense - it's just the "ppos can be NULL" patch.
> 
> But as mentioned, NULL isn't "shorthand for zero". It's just "pipes
> don't _have_ a pos, trying to pass in some explicit position is
> crazy".
> 
> So no, the other patches in that set are a bit odd, I think.
> 
> SOME of them look potentially fine - the bpfilter one seems to be
> valid, for example, because it's literally about reading/writing a
> pipe. And maybe the sysctl one is similarly sensible - I didn't check
> the context of that one.

FWIW, I hadn't pushed that branch out (or merged it into #for-next yet);
for one thing, uml part (mconsole) is simply broken, for another...
IMO ##5--8 are asking for kernel_pread() and if you look at binfmt_elf.c,
you'll see elf_read() being pretty much that.  acct.c, keys and usermode
parts are asking for kernel_pwrite() as well.

I've got stuck looking through the drivers/target stuff - it would've
been another kernel_pwrite() candidate, but it smells like its use of
filp_open() is really asking for trouble, starting with symlink attacks.
Not sure - I'm not familiar with the area, but...

