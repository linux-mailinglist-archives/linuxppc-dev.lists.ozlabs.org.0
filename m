Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA0191F6A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 10:56:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Bnpk1wYVzDqjb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 18:56:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=rjwysocki.net
 (client-ip=79.96.170.134; helo=cloudserver094114.home.pl;
 envelope-from=rjw@rjwysocki.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=rjwysocki.net
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl
 [79.96.170.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Bnmp6xg6zDqhT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 18:54:49 +1000 (AEST)
Received: from 79.184.254.79.ipv4.supernova.orange.pl (79.184.254.79) (HELO
 kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.275)
 id dd98f88ef098e161; Mon, 19 Aug 2019 10:54:44 +0200
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Ran Wang <ran.wang_1@nxp.com>
Subject: Re: [PATCH v5 1/3] PM: wakeup: Add routine to help fetch wakeup
 source object.
Date: Mon, 19 Aug 2019 10:54:43 +0200
Message-ID: <2529818.3AUhDYJ4cv@kreacher>
In-Reply-To: <DB8PR04MB6826475ACA623AE6D63617D7F1A80@DB8PR04MB6826.eurprd04.prod.outlook.com>
References: <20190724074722.12270-1-ran.wang_1@nxp.com>
 <CAJZ5v0i58p-GsswzMGEsgD5OXDqJ_G5zXDYf8jq8JJbWxZv+nQ@mail.gmail.com>
 <DB8PR04MB6826475ACA623AE6D63617D7F1A80@DB8PR04MB6826.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Mark Rutland <mark.rutland@arm.com>, Biwen Li <biwen.li@nxp.com>,
 Len Brown <len.brown@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday, August 19, 2019 10:33:25 AM CEST Ran Wang wrote:
> Hi Rafael,
> 
> On Monday, August 19, 2019 16:20, Rafael J. Wysocki wrote:
> > 
> > On Mon, Aug 19, 2019 at 10:15 AM Ran Wang <ran.wang_1@nxp.com> wrote:
> > >
> > > Hi Rafael,
> > >
> > > On Monday, August 05, 2019 17:59, Rafael J. Wysocki wrote:
> > > >
> > > > On Wednesday, July 24, 2019 9:47:20 AM CEST Ran Wang wrote:
> > > > > Some user might want to go through all registered wakeup sources
> > > > > and doing things accordingly. For example, SoC PM driver might
> > > > > need to do HW programming to prevent powering down specific IP
> > > > > which wakeup source depending on. So add this API to help walk
> > > > > through all registered wakeup source objects on that list and return them
> > one by one.
> > > > >
> > > > > Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> > > > > ---
> > > > > Change in v5:
> > > > >     - Update commit message, add decription of walk through all wakeup
> > > > >     source objects.
> > > > >     - Add SCU protection in function wakeup_source_get_next().
> > > > >     - Rename wakeup_source member 'attached_dev' to 'dev' and move
> > > > > it
> > > > up
> > > > >     (before wakeirq).
> > > > >
> > > > > Change in v4:
> > > > >     - None.
> > > > >
> > > > > Change in v3:
> > > > >     - Adjust indentation of *attached_dev;.
> > > > >
> > > > > Change in v2:
> > > > >     - None.
> > > > >
> > > > >  drivers/base/power/wakeup.c | 24 ++++++++++++++++++++++++
> > > > >  include/linux/pm_wakeup.h   |  3 +++
> > > > >  2 files changed, 27 insertions(+)
> > > > >
> > > > > diff --git a/drivers/base/power/wakeup.c
> > > > > b/drivers/base/power/wakeup.c index ee31d4f..2fba891 100644
> > > > > --- a/drivers/base/power/wakeup.c
> > > > > +++ b/drivers/base/power/wakeup.c
> > > > > @@ -14,6 +14,7 @@
> > > > >  #include <linux/suspend.h>
> > > > >  #include <linux/seq_file.h>
> > > > >  #include <linux/debugfs.h>
> > > > > +#include <linux/of_device.h>
> > > > >  #include <linux/pm_wakeirq.h>
> > > > >  #include <trace/events/power.h>
> > > > >
> > > > > @@ -226,6 +227,28 @@ void wakeup_source_unregister(struct
> > > > wakeup_source *ws)
> > > > >     }
> > > > >  }
> > > > >  EXPORT_SYMBOL_GPL(wakeup_source_unregister);
> > > > > +/**
> > > > > + * wakeup_source_get_next - Get next wakeup source from the list
> > > > > + * @ws: Previous wakeup source object, null means caller want first one.
> > > > > + */
> > > > > +struct wakeup_source *wakeup_source_get_next(struct wakeup_source
> > > > > +*ws) {
> > > > > +   struct list_head *ws_head = &wakeup_sources;
> > > > > +   struct wakeup_source *next_ws = NULL;
> > > > > +   int idx;
> > > > > +
> > > > > +   idx = srcu_read_lock(&wakeup_srcu);
> > > > > +   if (ws)
> > > > > +           next_ws = list_next_or_null_rcu(ws_head, &ws->entry,
> > > > > +                           struct wakeup_source, entry);
> > > > > +   else
> > > > > +           next_ws = list_entry_rcu(ws_head->next,
> > > > > +                           struct wakeup_source, entry);
> > > > > +   srcu_read_unlock(&wakeup_srcu, idx);
> > > > > +
> > > >
> > > > This is incorrect.
> > > >
> > > > The SRCU cannot be unlocked until the caller of this is done with
> > > > the object returned by it, or that object can be freed while it is still being
> > accessed.
> > >
> > > Thanks for the comment. Looks like I was not fully understanding your
> > > point on
> > > v4 discussion. So I will implement 3 APIs by referring
> > > wakeup_sources_stats_seq_start/next/stop()
> > >
> > > > Besides, this patch conflicts with some general wakeup sources
> > > > changes in the works, so it needs to be deferred and rebased on top of those
> > changes.
> > >
> > > Could you please tell me which is the right code base I should developing on?
> > > I just tried applying v5 patch on latest
> > > git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git branch master
> > (d1abaeb Linux 5.3-rc5) and no conflict encountered.
> > 
> > It is better to use the most recent -rc from Linus (5.3-rc5 as of
> > today) as the base unless your patches depend on some changes that are not in
> > there.
> 
> OK, So I need to implement on latest git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git branch master, am I right?
> 
> However, I just checked v5.3-rc5 code and found it has the same HEAD (d1abaeb Linux 5.3-rc5
> on which I did not observe v5 patch apply conflict, did I miss something? Thanks.

The conflict I mentioned earlier was with another patch series in the works
which is not in 5.3-rc5.  However, there are problems with that series and it
is not linux-next now even, so please just base your series on top of -rc5.




