Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DD019F698
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 15:15:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wrcf5MJ4zDqbw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 23:15:14 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wrN54GGJzDr6v
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 23:04:20 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7904768BEB; Mon,  6 Apr 2020 15:04:16 +0200 (CEST)
Date: Mon, 6 Apr 2020 15:04:16 +0200
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/6] binfmt_elf: open code copy_siginfo_to_user to
 kernelspace buffer
Message-ID: <20200406130416.GB16479@lst.de>
References: <20200406120312.1150405-1-hch@lst.de>
 <20200406120312.1150405-3-hch@lst.de>
 <CAK8P3a02LQNOehukgaCj81wg1D2XhW1=_mQZ72cT6nQdO=mhOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a02LQNOehukgaCj81wg1D2XhW1=_mQZ72cT6nQdO=mhOw@mail.gmail.com>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jeremy Kerr <jk@ozlabs.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 06, 2020 at 03:01:24PM +0200, Arnd Bergmann wrote:
> >  static void fill_siginfo_note(struct memelfnote *note, user_siginfo_t *csigdata,
> >                 const kernel_siginfo_t *siginfo)
> >  {
> > -       mm_segment_t old_fs = get_fs();
> > -       set_fs(KERNEL_DS);
> > -       copy_siginfo_to_user((user_siginfo_t __user *) csigdata, siginfo);
> > -       set_fs(old_fs);
> > +       memcpy(csigdata, siginfo, sizeof(struct kernel_siginfo));
> > +       memset((char *)csigdata + sizeof(struct kernel_siginfo), 0,
> > +               SI_EXPANSION_SIZE);
> >         fill_note(note, "CORE", NT_SIGINFO, sizeof(*csigdata), csigdata);
> >  }
> 
> I think this breaks compat binfmt-elf mode, which relies on this trick:
> 
> fs/compat_binfmt_elf.c:#define copy_siginfo_to_user     copy_siginfo_to_user32
> fs/compat_binfmt_elf.c#include "binfmt_elf.c"
> 
> At least we seem to only have one remaining implementation of
> __copy_siginfo_to_user32(), so fixing this won't require touching all
> architectures, but I don't see an obvious way to do it right. Maybe
> compat-binfmt-elf.c should just override fill_siginfo_note() itself
> rather than overriding copy_siginfo_to_user().

Ooops.  Yes, this will need some manual handling.
