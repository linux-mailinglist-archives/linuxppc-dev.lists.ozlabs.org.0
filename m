Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A78362A417A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 11:17:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQQgj6NhFzDqW6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 21:17:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=RqyOPtG4; dkim-atps=neutral
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CQQdg1W3lzDqMV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 21:15:18 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1604398517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to; 
 bh=gxl6UrgUka1LZn4LDJZ1QkMxr+7IymDRgsTPhk9KCpI=;
 b=RqyOPtG4XInzVOUVFzRB9rYeH3W811AgkRMHbhzpOqmNQin+m+1J7SY1mwScla2INQGUKF
 KXrtJLfXVAG8SZpxXVoNeD4CLQ11HZeV2Rmiv2aSpqH4d+8gvPjk5qH6dg11ZTzZy/z0xf
 mxVE/AApY2HSVeHSab/nWf3gQspDn6c=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 18532ABCC;
 Tue,  3 Nov 2020 10:15:17 +0000 (UTC)
Date: Tue, 3 Nov 2020 11:15:16 +0100
From: Petr Mladek <pmladek@suse.com>
To: Santosh Sivaraj <santosh@fossix.org>
Subject: Re: [RESEND PATCH] kernel/watchdog: Fix watchdog_allowed_mask not
 used warning
Message-ID: <20201103101516.GM20201@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <214be993-96ec-82b0-b841-c80f7e7faefb@csgroup.eu>
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
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, bala24@linux.ibm.com,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 2020-11-03 10:55:11, Christophe Leroy wrote:
> 
> 
> Le 03/11/2020 à 10:32, Santosh Sivaraj a écrit :
> > Define watchdog_allowed_mask only when SOFTLOCKUP_DETECTOR is enabled.
> > 
> > Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
> 
> I think maybe you should add a Fixes: tag (Towards https://github.com/linuxppc/linux/commit/7feeb9cd ?)
> 
> And copy Thomas (tglx)

And also Andrew that usually take patches in this area.

Finally, you should add my Reviewed-by that I provided for the first
resend. Sigh, I have missed that the important people were not in CC.

Best Regards,
Petr

> Christophe
> 
> > ---
> > 
> > Original patch is here:
> > https://lore.kernel.org/lkml/20190807014417.9418-1-santosh@fossix.org/
> > 
> > A similar patch was also sent by Balamuruhan and reviewed by Petr.
> > https://lkml.org/lkml/2020/8/20/1030
> > 
> >   kernel/watchdog.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> > index 5abb5b22ad13..71109065bd8e 100644
> > --- a/kernel/watchdog.c
> > +++ b/kernel/watchdog.c
> > @@ -44,8 +44,6 @@ int __read_mostly soft_watchdog_user_enabled = 1;
> >   int __read_mostly watchdog_thresh = 10;
> >   static int __read_mostly nmi_watchdog_available;
> > -static struct cpumask watchdog_allowed_mask __read_mostly;
> > -
> >   struct cpumask watchdog_cpumask __read_mostly;
> >   unsigned long *watchdog_cpumask_bits = cpumask_bits(&watchdog_cpumask);
> > @@ -162,6 +160,8 @@ static void lockup_detector_update_enable(void)
> >   int __read_mostly sysctl_softlockup_all_cpu_backtrace;
> >   #endif
> > +static struct cpumask watchdog_allowed_mask __read_mostly;
> > +
> >   /* Global variables, exported for sysctl */
> >   unsigned int __read_mostly softlockup_panic =
> >   			CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE;
> > 
