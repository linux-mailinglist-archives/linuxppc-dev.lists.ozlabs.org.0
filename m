Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8ED3AE111
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 01:03:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7Sqn6NJrz3byN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 09:03:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-watchdog.org (client-ip=185.87.125.42;
 helo=www.linux-watchdog.org; envelope-from=gituser@linux-watchdog.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 378 seconds by postgrey-1.36 at boromir;
 Mon, 21 Jun 2021 00:54:02 AEST
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
 by lists.ozlabs.org (Postfix) with ESMTP id 4G7FzZ1vLGz2yhF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 00:54:01 +1000 (AEST)
Received: by www.linux-watchdog.org (Postfix, from userid 502)
 id 6C971409DF; Sun, 20 Jun 2021 15:30:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 6C971409DF
Date: Sun, 20 Jun 2021 15:30:36 +0200
From: gituser@www.linux-watchdog.org
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] watchdog: Remove MV64x60 watchdog driver
Message-ID: <20210620133036.GA18128@www.linux-watchdog.org>
References: <9c2952bcfaec3b1789909eaa36bbce2afbfab7ab.1616085654.git.christophe.leroy@csgroup.eu>
 <31d702e5-22d1-1766-76dd-e24860e5b1a4@roeck-us.net>
 <87im3hk3t2.fsf@mpe.ellerman.id.au>
 <e2a33fc1-f519-653d-9230-b06506b961c5@roeck-us.net>
 <87czsyfo01.fsf@mpe.ellerman.id.au>
 <20210607112950.GB314533@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607112950.GB314533@roeck-us.net>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Mailman-Approved-At: Mon, 21 Jun 2021 09:02:45 +1000
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
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linuxppc-dev@lists.ozlabs.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All,

On Mon, Jun 07, 2021 at 04:29:50AM -0700, Guenter Roeck wrote:
> On Mon, Jun 07, 2021 at 11:43:26AM +1000, Michael Ellerman wrote:
> > Guenter Roeck <linux@roeck-us.net> writes:
> > > On 5/17/21 4:17 AM, Michael Ellerman wrote:
> > >> Guenter Roeck <linux@roeck-us.net> writes:
> > >>> On 3/18/21 10:25 AM, Christophe Leroy wrote:
> > >>>> Commit 92c8c16f3457 ("powerpc/embedded6xx: Remove C2K board support")
> > >>>> removed the last selector of CONFIG_MV64X60.
> > >>>>
> > >>>> Therefore CONFIG_MV64X60_WDT cannot be selected anymore and
> > >>>> can be removed.
> > >>>>
> > >>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > >>>
> > >>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > >>>
> > >>>> ---
> > >>>>   drivers/watchdog/Kconfig       |   4 -
> > >>>>   drivers/watchdog/Makefile      |   1 -
> > >>>>   drivers/watchdog/mv64x60_wdt.c | 324 ---------------------------------
> > >>>>   include/linux/mv643xx.h        |   8 -
> > >>>>   4 files changed, 337 deletions(-)
> > >>>>   delete mode 100644 drivers/watchdog/mv64x60_wdt.c
> > >> 
> > >> I assumed this would go via the watchdog tree, but seems like I
> > >> misinterpreted.
> > >> 
> > >
> > > Wim didn't send a pull request this time around.
> > >
> > > Guenter
> > >
> > >> Should I take this via the powerpc tree for v5.14 ?
> > 
> > I still don't see this in the watchdog tree, should I take it?
> > 
> It is in my personal watchdog-next tree, but afaics Wim hasn't picked any
> of it up yet. Wim ?

Picking it up right now.

Kind regards,
Wim.

