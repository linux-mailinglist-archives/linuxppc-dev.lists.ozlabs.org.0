Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DAE2CF926
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 04:13:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cnvlt192kzDqCl
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 14:13:14 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 4CnvhV4wjwzDqwy
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 14:10:18 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 7137B2B617;
 Fri,  4 Dec 2020 22:10:15 -0500 (EST)
Date: Sat, 5 Dec 2020 14:10:21 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] macintosh/adb-iop: Send correct poll command
In-Reply-To: <CAMuHMdVYf83+y1aUR6HqCgr-CLfWYvbuynpfogLrt3cXA-9_aA@mail.gmail.com>
Message-ID: <alpine.LNX.2.23.453.2012051340490.6@nippy.intranet>
References: <58bba4310da4c29b068345a4b36af8a531397ff7.1605847196.git.fthain@telegraphics.com.au>
 <CAMuHMdVYf83+y1aUR6HqCgr-CLfWYvbuynpfogLrt3cXA-9_aA@mail.gmail.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 4 Dec 2020, Geert Uytterhoeven wrote:

> Hi Finn,
> 
> On Fri, Nov 20, 2020 at 5:54 AM Finn Thain <fthain@telegraphics.com.au> wrote:
> > The behaviour of the IOP firmware is not well documented but we do know
> > that IOP message reply data can be used to issue new ADB commands.
> > Use the message reply to better control autopoll behaviour by sending
> > a Talk Register 0 command after every ADB response, not unlike the
> > algorithm in the via-macii driver. This poll command is addressed to
> > that device which last received a Talk command (explicit or otherwise).
> >
> > Cc: Joshua Thompson <funaho@jurai.org>
> > Fixes: fa3b5a9929fc ("macintosh/adb-iop: Implement idle -> sending state transition")
> 
> WARNING: Unknown commit id 'fa3b5a9929fc', maybe rebased or not pulled?
> 
> 32226e817043?
> 

Yes, that's the one. I accidentally gave a commit id from one of my 
backport branches.

> > Tested-by: Stan Johnson <userm57@yahoo.com>
> > Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
> 
> Thanks, will queue in the m68k for-v5.11 branch.
> 

Thanks.

> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> 
