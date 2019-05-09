Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9562F18801
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 11:50:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4507rR4cvLzDqNj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 19:50:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4507px5S9wzDqMr
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 19:49:27 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id ECD89ABD5;
 Thu,  9 May 2019 09:49:24 +0000 (UTC)
Date: Thu, 9 May 2019 11:49:23 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: Build failure in v4.4.y.queue (ppc:allmodconfig)
Message-ID: <20190509114923.696222cb@naga>
In-Reply-To: <20190509065324.GA3864@kroah.com>
References: <20190508202642.GA28212@roeck-us.net>
 <20190509065324.GA3864@kroah.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 9 May 2019 08:53:24 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Wed, May 08, 2019 at 01:26:42PM -0700, Guenter Roeck wrote:
> > I see multiple instances of:
> > 
> > arch/powerpc/kernel/exceptions-64s.S:839: Error:
> > 	attempt to move .org backwards
> > 
> > in v4.4.y.queue (v4.4.179-143-gc4db218e9451).
> > 
> > This is due to commit 9b2d4e06d7f1 ("powerpc/64s: Add support for a store
> > forwarding barrier at kernel entry/exit"), which is part of a large patch
> > series and can not easily be reverted.
> > 
> > Guess I'll stop doing ppc:allmodconfig builds in v4.4.y ?  
> 
> Michael, I thought this patch series was supposed to fix ppc issues, not
> add to them :)
> 
> Any ideas on what to do here?

What exact code do you build?

In my source there the SLB relon handler starts just above this line and
a lot of out-ouf-line are handlers before. Moving some out-of-line
handlers below the parts with fixed location should fix the build error.

Thanks

Michal
