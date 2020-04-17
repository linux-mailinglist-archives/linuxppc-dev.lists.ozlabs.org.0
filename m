Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9051ADE62
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 15:33:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493cVK2jNqzDqmj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 23:33:13 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 493cMc0sd5zDrgX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 23:27:21 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2566768BFE; Fri, 17 Apr 2020 15:27:15 +0200 (CEST)
Date: Fri, 17 Apr 2020 15:27:14 +0200
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 4/8] binfmt_elf: open code copy_siginfo_to_user to
 kernelspace buffer
Message-ID: <20200417132714.GA6401@lst.de>
References: <20200414070142.288696-1-hch@lst.de>
 <20200414070142.288696-5-hch@lst.de>
 <CAK8P3a3HvbPKTkwfWr6PbZ96koO_NrJP1qgk8H1mgk=qUScGkQ@mail.gmail.com>
 <20200415074514.GA1393@lst.de>
 <CAK8P3a0QGQX85LaqKC1UuTERk6Bpr5TW6aWF+jxi2cOpa4L_AA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0QGQX85LaqKC1UuTERk6Bpr5TW6aWF+jxi2cOpa4L_AA@mail.gmail.com>
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
Cc: x86@kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jeremy Kerr <jk@ozlabs.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 "Eric W . Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On Wed, Apr 15, 2020 at 10:20:11AM +0200, Arnd Bergmann wrote:
> > I'd rather keep it out of this series and to
> > an interested party.  Then again x32 doesn't seem to have a whole lot
> > of interested parties..
> 
> Fine with me. It's on my mental list of things that we want to kill off
> eventually as soon as the remaining users stop replying to questions
> about it.
> 
> In fact I should really turn that into a properly maintained list in
> Documentation/... that contains any options that someone has
> asked about removing in the past, along with the reasons for keeping
> it around and a time at which we should ask about it again.

To the newly added x86 maintainers:  Arnd brought up the point that
elf_core_dump writes the ABI siginfo format into the core dump. That
format differs for i386 vs x32.  Is there any good way to find out
which is the right format when are not in a syscall?

As far a I can tell x32 vs i386 just seems to be based around what
syscall table was used for the current syscall, but core dumps aren't
always in syscall context.
