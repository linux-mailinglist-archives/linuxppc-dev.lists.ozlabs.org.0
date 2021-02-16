Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 728A531D0BD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Feb 2021 20:11:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dg9ZG1lDCz3cWJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Feb 2021 06:11:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fifo99.com
 (client-ip=34.208.57.251; helo=ip-172-31-12-36.us-west-2.compute.internal;
 envelope-from=dwalker@fifo99.com; receiver=<UNKNOWN>)
X-Greylist: delayed 543 seconds by postgrey-1.36 at boromir;
 Wed, 17 Feb 2021 06:11:33 AEDT
Received: from ip-172-31-12-36.us-west-2.compute.internal
 (ec2-34-208-57-251.us-west-2.compute.amazonaws.com [34.208.57.251])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Dg9Yx5LhPz3cG6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Feb 2021 06:11:33 +1100 (AEDT)
Received: by ip-172-31-12-36.us-west-2.compute.internal (Postfix,
 from userid 1001)
 id 744C640638; Tue, 16 Feb 2021 11:02:26 -0800 (PST)
Date: Tue, 16 Feb 2021 11:02:26 -0800
From: Daniel Walker <dwalker@fifo99.com>
To: Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>
Subject: Re: [PATCH 1/4] add generic builtin command line
Message-ID: <20210216190226.GY22125@fifo99.com>
References: <20190319232448.45964-2-danielwa@cisco.com>
 <20190320155319.2cd3c0f73ef3cdefb65d5d1e@linux-foundation.org>
 <20190320232328.3bijcxek2yg43a25@zorba>
 <20190320201433.6c5c4782f4432d280c0e8361@linux-foundation.org>
 <20190321151308.yt6uc3mxgppm5zko@zorba>
 <20190321151519.1f4479d92228c8a8738e02cf@linux-foundation.org>
 <1613417521.3853.5.camel@chimera>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1613417521.3853.5.camel@chimera>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Maksym Kokhan <maksym.kokhan@globallogic.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 xe-linux-external@cisco.com, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Daniel Walker <danielwa@cisco.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 15, 2021 at 11:32:01AM -0800, Daniel Gimpelevich wrote:
> On Thu, 2019-03-21 at 15:15 -0700, Andrew Morton wrote:
> > On Thu, 21 Mar 2019 08:13:08 -0700 Daniel Walker <danielwa@cisco.com> wrote:
> > > On Wed, Mar 20, 2019 at 08:14:33PM -0700, Andrew Morton wrote:
> > > > The patches (or some version of them) are already in linux-next,
> > > > which messes me up.  I'll disable them for now.
> > >  
> > > Those are from my tree, but I remove them when you picked up the series. The
> > > next linux-next should not have them.
> > 
> > Yup, thanks, all looks good now.
> 
> This patchset is currently neither in mainline nor in -next. May I ask
> what happened to it? Thanks.
> 

It was dropped silently by Andrew at some point. I wasn't watching -next closely
to know when. I have no idea why he dropped it.

We still use this series extensively in Cisco, and have extended it beyond this
current series.

We can re-submit.

Daniel
