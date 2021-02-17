Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C35BB31E11C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Feb 2021 22:16:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DgrJ260Wmz3clV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Feb 2021 08:16:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=sO30w73r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=korg header.b=sO30w73r; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DgrHd33Tsz3cPm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 08:16:27 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 960BF64E4B;
 Wed, 17 Feb 2021 21:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1613596584;
 bh=DBaMrQR3F5JOtPbp0XVz9+wx0qFmfjBV/goU8RfjcNA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sO30w73rQ5z7kJkSNMJn07P8kHSLkdpJxMS9VRCXafBQGAzaSaqdTYzSfsxFfV4qv
 imggOSesENdOrOzDMCL4zBY3ysSoLMlGhD9PVyBbq6htSlb5Z0BvghVLnl0iQBV5UD
 QFpN3gvdv7jOr4GyUyLO488wBClo7Tm64QzMe0j4=
Date: Wed, 17 Feb 2021 13:16:23 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>
Subject: Re: [PATCH 1/4] add generic builtin command line
Message-Id: <20210217131623.cb19ac2f8a143ba33e7623f1@linux-foundation.org>
In-Reply-To: <1613417521.3853.5.camel@chimera>
References: <20190319232448.45964-2-danielwa@cisco.com>
 <20190320155319.2cd3c0f73ef3cdefb65d5d1e@linux-foundation.org>
 <20190320232328.3bijcxek2yg43a25@zorba>
 <20190320201433.6c5c4782f4432d280c0e8361@linux-foundation.org>
 <20190321151308.yt6uc3mxgppm5zko@zorba>
 <20190321151519.1f4479d92228c8a8738e02cf@linux-foundation.org>
 <1613417521.3853.5.camel@chimera>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Maksym Kokhan <maksym.kokhan@globallogic.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 xe-linux-external@cisco.com, Daniel Walker <dwalker@fifo99.com>,
 linuxppc-dev@lists.ozlabs.org, Daniel Walker <danielwa@cisco.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 15 Feb 2021 11:32:01 -0800 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us> wrote:

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

Seems that I didn't bring them back after the confict with the powerpc
tree resolved itself.

Please resend everything for -rc1 and let's await the reviewer
feedback,

