Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00654103F8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 04:27:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44v2ND2HSQzDqT7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 12:27:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux-mips.org
 (client-ip=148.251.95.138; helo=cvs.linux-mips.org;
 envelope-from=macro@linux-mips.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-mips.org
X-Greylist: delayed 305 seconds by postgrey-1.36 at bilbo;
 Wed, 01 May 2019 12:25:51 AEST
Received: from cvs.linux-mips.org (eddie.linux-mips.org [148.251.95.138])
 by lists.ozlabs.org (Postfix) with ESMTP id 44v2Ll0FvnzDqSC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 12:25:50 +1000 (AEST)
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
 with ESMTP id S23990394AbfEACUhiM2bj (ORCPT
 <rfc822;linuxppc-dev@lists.ozlabs.org>);
 Wed, 1 May 2019 04:20:37 +0200
Date: Wed, 1 May 2019 03:20:37 +0100 (BST)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 01/41] drivers: tty: serial: dz: use dev_err() instead
 of printk()
In-Reply-To: <20190429131224.GA27385@kroah.com>
Message-ID: <alpine.LFD.2.21.1905010255070.30973@eddie.linux-mips.org>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-2-git-send-email-info@metux.net>
 <20190427133117.GC11368@kroah.com>
 <bae3f23b-8823-f089-c40e-024ba225555f@metux.net>
 <20190429131224.GA27385@kroah.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
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
Cc: linux-ia64@vger.kernel.org, lorenzo.pieralisi@arm.com,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, andrew@aj.id.au,
 khilman@baylibre.com, sudeep.holla@arm.com, liviu.dudau@arm.com,
 linux-kernel@vger.kernel.org, vz@mleia.com, linux@prisktech.co.nz,
 linuxppc-dev@lists.ozlabs.org, "Enrico Weigelt,
 metux IT consult" <lkml@metux.net>, linux-serial@vger.kernel.org,
 slemieux.tyco@gmail.com, matthias.bgg@gmail.com, jacmet@sunsite.dk,
 linux-amlogic@lists.infradead.org, andriy.shevchenko@linux.intel.com,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 29 Apr 2019, Greg KH wrote:

> > >>  drivers/tty/serial/dz.c | 8 ++++----
> > > 
> > > Do you have this hardware to test any of these changes with?
> > 
> > Unfortunately not :(
> 
> Then I can take the "basic" types of patches for the driver (like this
> one), but not any others, sorry.

 I can verify changes to dz.c, sb1250-duart.c and zs.c with real hardware, 
but regrettably not right away: the hardware is in a remote location and 
while I have it wired for remote operation unfortunately its connectivity 
has been cut off by an unfriendly ISP.

 I'm not sure if all the changes make sense though: if there is a compiler 
warning or a usability issue, then a patch is surely welcome, otherwise: 
"If it ain't broke, don't fix it".

  Maciej
