Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F757350547
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 19:14:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9XxF2k8Zz2yys
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 04:14:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=dixvG7wx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.86.75; helo=rcdn-iport-4.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=dixvG7wx; dkim-atps=neutral
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9Xwp35dLz2yxN
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 04:14:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=2143; q=dns/txt; s=iport;
 t=1617210858; x=1618420458;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XBXiV/KZU9RAJFyY2sfCpxX3SMZ3qudvdd8J5wHAY+k=;
 b=dixvG7wxzaPyBmnFKJOZ7RrWY9iPHV89ozi/TQraf58Fujs9ciuCfOok
 thK1N3dMpQA8V/BBr+ujsEz4mc+aqMtWHdboooz0MpJwrrMBYLeudqLIK
 6AoR3kKv2U9dhAa5c6yPoveAQq0HmcLM410BUdU9l+0TH7bursuk5zmNr k=;
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AtSp+ZKM2+fmgyMBcT5r155DYdL4zR+YMi2?=
 =?us-ascii?q?QD/UoZc3NoW+afkN2jm+le+B/vkTAKWGwhn9foAtjkfVr385lp7Y4NeYqzRQ?=
 =?us-ascii?q?WOghrLEKhO5ZbvqgeLJwTQ7ehYvJ0MT4FfD5nKAUF+nYLG5mCDYrId6f2m1I?=
 =?us-ascii?q?ztuuvE1XdqSmhRGsJdxiN0EBySHEEzZCQuP/sEPaGR7MZGuDasEE5/Bq+GL0?=
 =?us-ascii?q?IIUOTZq9rAmIiOW347LiQ64wqDhy7A0tDHOiWfty1zbxp/hZ8/7G6AqADi/6?=
 =?us-ascii?q?Olqf3+8APEznTe9Y4+oqqH9vJzQOqRl8MSNjLgziGvaYgJYcz6gBkF5Mey9V?=
 =?us-ascii?q?0tjN7A5y0FAv02wXbQcmapyCGdvTXd7A=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DUAgB8rWRg/5ldJa1aGwEBAQEBAQE?=
 =?us-ascii?q?BBQEBARIBAQEDAwEBAUCBUIIrgUgEATmWRQOQCBaKWYFoCwEBAQ0BATQEAQG?=
 =?us-ascii?q?EUAKBewIlOBMCAwEBDAEBBQEBAQIBBgRxhW6GRQEFOj8QCxgVGTwbBoYMqnV?=
 =?us-ascii?q?1gTSJDoFEFA6BF41KJhyBSUKBEoMcPoN5gQaDDIIJIgSBZWEuYoIEOR8UL5E?=
 =?us-ascii?q?BgkCKUJwjgxGBI5s5MRCDOIpwliC4GwIEBgUCFoFrI4FZMxoIGxWDJU8ZDZ0?=
 =?us-ascii?q?IIQNnAgYKAQEDCY8JAQE?=
X-IronPort-AV: E=Sophos;i="5.81,293,1610409600"; d="scan'208";a="855046290"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
 by rcdn-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 31 Mar 2021 17:14:11 +0000
Received: from zorba ([10.24.8.227])
 by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 12VHE8Ja029161
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 31 Mar 2021 17:14:10 GMT
Date: Wed, 31 Mar 2021 10:14:08 -0700
From: Daniel Walker <danielwa@cisco.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 3/7] powerpc: convert config files to generic cmdline
Message-ID: <20210331171408.GC2469518@zorba>
References: <20210309000247.2989531-4-danielwa@cisco.com>
 <5f865584-09c9-d21f-ffb7-23cf07cf058e@csgroup.eu>
 <20210309212944.GR109100@zorba>
 <e4899874-1684-fa1b-443e-f4e478e05e31@csgroup.eu>
 <CAL_JsqKm76jRQYDcu3rGyUWKPLspoO=EZW_WFy=zAK+m_JYCTg@mail.gmail.com>
 <20fd7d44-8c39-48bc-25c3-990be9d9d911@csgroup.eu>
 <20210325195956.GM109100@zorba>
 <20210329100750.GB3207@willie-the-truck>
 <20210330173521.GT109100@zorba>
 <20210331115218.GB7626@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210331115218.GB7626@willie-the-truck>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.8.227, [10.24.8.227]
X-Outbound-Node: rcdn-core-2.cisco.com
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
Cc: Rob Herring <robh@kernel.org>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 X86 ML <x86@kernel.org>, "open list:MIPS" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, xe-linux-external@cisco.com,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 31, 2021 at 12:52:19PM +0100, Will Deacon wrote:
> On Tue, Mar 30, 2021 at 10:35:21AM -0700, Daniel Walker wrote:
> > On Mon, Mar 29, 2021 at 11:07:51AM +0100, Will Deacon wrote:
> > > On Thu, Mar 25, 2021 at 12:59:56PM -0700, Daniel Walker wrote:
> > > > On Thu, Mar 25, 2021 at 01:03:55PM +0100, Christophe Leroy wrote:
> > > > > 
> > > > > Ok, so you agree we don't need to provide two CMDLINE, one to be appended and one to be prepended.
> > > > > 
> > > > > Let's only provide once CMDLINE as of today, and ask the user to select
> > > > > whether he wants it appended or prepended or replacee. Then no need to
> > > > > change all existing config to rename CONFIG_CMDLINE into either of the new
> > > > > ones.
> > > > > 
> > > > > That's the main difference between my series and Daniel's series. So I'll
> > > > > finish taking Will's comment into account and we'll send out a v3 soon.
> > > > 
> > > > It doesn't solve the needs of Cisco, I've stated many times your changes have
> > > > little value. Please stop submitting them.
> > > 
> > > FWIW, they're useful for arm64 and I will gladly review the updated series.
> > > 
> > > I don't think asking people to stop submitting patches is ever the right
> > > answer. Please don't do that.
> > 
> > Why ? It's me nacking his series, is that not allowed anymore ?
> 
> If you're that way inclined then you can "nack" whatever you want, but
> please allow the rest of us to continue reviewing the patches. You don't
> have any basis on which to veto other people's contributions and so
> demanding that somebody stops posting code is neither constructive nor
> meaningful.

I understand , but that's not what's happening. I've dealt with Christophe on
these changes repeatedly, and he's demonstrated he doesn't understand the feature set or
the motivation of the changes. I've tried to work with him in the past, but it
doesn't work unless he's giving me comments on my changes.

His changes don't solve Cisco problems, and likely never will regardless of
feedback. Maybe that could change, but I don't see that happening.

Daniel
