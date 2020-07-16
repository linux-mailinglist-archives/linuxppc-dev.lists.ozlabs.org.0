Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E72D7222806
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 18:09:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6zjZ1K8czDr7L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 02:09:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6zgH1RvBzDqC3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 02:07:42 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4015EAB89;
 Thu, 16 Jul 2020 16:07:42 +0000 (UTC)
Date: Thu, 16 Jul 2020 18:07:37 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Thomas Falcon <tlfalcon@linux.ibm.com>
Subject: Re: [PATCH net-next] ibmvnic: Increase driver logging
Message-ID: <20200716160736.GI32107@kitsune.suse.cz>
References: <1594857115-22380-1-git-send-email-tlfalcon@linux.ibm.com>
 <20200715170632.11f0bf19@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20200715.182956.490791427431304861.davem@davemloft.net>
 <9c9d6e46-240b-8513-08e4-e1c7556cb3c8@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c9d6e46-240b-8513-08e4-e1c7556cb3c8@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: drt@linux.ibm.com, kuba@kernel.org, linuxppc-dev@lists.ozlabs.org,
 David Miller <davem@davemloft.net>, netdev@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 16, 2020 at 10:59:58AM -0500, Thomas Falcon wrote:
> 
> On 7/15/20 8:29 PM, David Miller wrote:
> > From: Jakub Kicinski <kuba@kernel.org>
> > Date: Wed, 15 Jul 2020 17:06:32 -0700
> > 
> > > On Wed, 15 Jul 2020 18:51:55 -0500 Thomas Falcon wrote:
> > > >   	free_netdev(netdev);
> > > >   	dev_set_drvdata(&dev->dev, NULL);
> > > > +	netdev_info(netdev, "VNIC client device has been successfully removed.\n");
> > > A step too far, perhaps.
> > > 
> > > In general this patch looks a little questionable IMHO, this amount of
> > > logging output is not commonly seen in drivers. All the the info
> > > messages are just static text, not even carrying any extra information.
> > > In an era of ftrace, and bpftrace, do we really need this?
> > Agreed, this is too much.  This is debugging, and thus suitable for tracing
> > facilities, at best.
> 
> Thanks for your feedback. I see now that I was overly aggressive with this
> patch to be sure, but it would help with narrowing down problems at a first
> glance, should they arise. The driver in its current state logs very little
> of what is it doing without the use of additional debugging or tracing
> facilities. Would it be worth it to pursue a less aggressive version or
> would that be dead on arrival? What are acceptable driver operations to log
> at this level?

Also would it be advisable to add the messages as pr_dbg to be enabled on demand?

Thanks

Michal
