Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B59A51E9AE8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jun 2020 02:17:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Zwj86dVqzDqGY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jun 2020 10:17:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=telegraphics.com.au (client-ip=98.124.60.144;
 helo=kvm5.telegraphics.com.au; envelope-from=fthain@telegraphics.com.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=telegraphics.com.au
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by lists.ozlabs.org (Postfix) with ESMTP id 49ZwfY73KhzDqT7
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jun 2020 10:15:01 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 8048828F67;
 Sun, 31 May 2020 20:14:56 -0400 (EDT)
Date: Mon, 1 Jun 2020 10:14:56 +1000 (AEST)
From: Finn Thain <fthain@telegraphics.com.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 8/8] macintosh/adb-iop: Implement SRQ autopolling
In-Reply-To: <CAMuHMdUjrFDob01EWC4e04tAkj5JTm_2Ei5WsPqN1eGDz=x3+Q@mail.gmail.com>
Message-ID: <alpine.LNX.2.22.394.2006011006080.8@nippy.intranet>
References: <cover.1590880623.git.fthain@telegraphics.com.au>
 <0fb7fdcd99d7820bb27faf1f27f7f6f1923914ef.1590880623.git.fthain@telegraphics.com.au>
 <CAMuHMdUjrFDob01EWC4e04tAkj5JTm_2Ei5WsPqN1eGDz=x3+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 31 May 2020, Geert Uytterhoeven wrote:

> Hi Finn,
> 
> On Sun, May 31, 2020 at 1:20 AM Finn Thain <fthain@telegraphics.com.au> wrote:
> > The adb_driver.autopoll method is needed during ADB bus scan and device
> > address assignment. Implement this method so that the IOP's list of
> > device addresses can be updated. When the list is empty, disable SRQ
> > autopolling.
> >
> > Cc: Joshua Thompson <funaho@jurai.org>
> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > Tested-by: Stan Johnson <userm57@yahoo.com>
> > Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
> 
> Thanks for your patch!
> 
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 

Thanks for your tag.

> >  arch/m68k/include/asm/adb_iop.h |  1 +
> >  drivers/macintosh/adb-iop.c     | 32 ++++++++++++++++++++++++++------
> 
> As this header file is used by a single source file only, perhaps it 
> should just be absorbed by the latter?

Sure, it could be absorbed by both asm/mac_iop.h and 
drivers/macintosh/adb-iop.c but I don't see the point...

> Then you no longer need my Acked-by for future changes ;-)
> 

But you shouldn't need to ack this kind of change in the first place.

IMHO, the arch/m68k/mac maintainer should be the one to ack changes to 
both arch/m68k/include/asm/adb_iop.h and drivers/macintosh/adb-iop.c.

Not that I'm complaining (thanks again for your ack!)
