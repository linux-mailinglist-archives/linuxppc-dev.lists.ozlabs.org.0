Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D59CB25A779
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 10:12:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhGrw6dN5zDqVl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 18:12:48 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhGmt04W6zDqTv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 18:09:17 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E8A9467373; Wed,  2 Sep 2020 10:09:11 +0200 (CEST)
Date: Wed, 2 Sep 2020 10:09:11 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 05/10] lkdtm: disable set_fs-based tests for !CONFIG_SET_FS
Message-ID: <20200902080911.GA26677@lst.de>
References: <20200827150030.282762-1-hch@lst.de>
 <20200827150030.282762-6-hch@lst.de>
 <CAHk-=wipbWD66sU7etETXwDW5NRsU2vnbDpXXQ5i94hiTcawyw@mail.gmail.com>
 <20200829092406.GB8833@lst.de> <202009011156.0F49882@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202009011156.0F49882@keescook>
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 01, 2020 at 11:57:37AM -0700, Kees Cook wrote:
> On Sat, Aug 29, 2020 at 11:24:06AM +0200, Christoph Hellwig wrote:
> > On Thu, Aug 27, 2020 at 11:06:28AM -0700, Linus Torvalds wrote:
> > > On Thu, Aug 27, 2020 at 8:00 AM Christoph Hellwig <hch@lst.de> wrote:
> > > >
> > > > Once we can't manipulate the address limit, we also can't test what
> > > > happens when the manipulation is abused.
> > > 
> > > Just remove these tests entirely.
> > > 
> > > Once set_fs() doesn't exist on x86, the tests no longer make any sense
> > > what-so-ever, because test coverage will be basically zero.
> > > 
> > > So don't make the code uglier just to maintain a fiction that
> > > something is tested when it isn't really.
> > 
> > Sure fine with me unless Kees screams.
> 
> To clarify: if any of x86, arm64, arm, powerpc, riscv, and s390 are
> using set_fs(), I want to keep this test. "ugly" is fine in lkdtm. :)

And Linus wants them gone entirely, so I'll need a stage fight between
the two of you.  At least for this merge window I'm only planning on
x86 and power, plus maybe riscv if I get the work done in time.  Although
helper from the maintainers would be welcome.  s390 has a driver that
still uses set_fs that will need some surgery, although it shouldn't
be too bad, but arm will be a piece of work.  Unless I get help it will
take a while.
