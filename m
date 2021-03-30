Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A748434F515
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 01:32:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F95MH52PWz3c5x
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 10:32:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=AHjsZv0R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.142.88; helo=alln-iport-1.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=AHjsZv0R; dkim-atps=neutral
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F95Lr1q4Bz2xxp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 10:31:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=2587; q=dns/txt; s=iport;
 t=1617147108; x=1618356708;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=20ZZL5t0OMdFzBeC8QVdex+kSd6hhKRqsatjmyKFFgA=;
 b=AHjsZv0ReDC94u2N9Ef+7zqWNKjnWTPyHHqBDoxcZNTg7EDmWsStYayr
 +XYMUV1wAWzO9BYvWj5ww0y7JIBnIdWvipawJfgZgAnvWtSnaWkAvtVbm
 QZpk/tSW+EOi1Cl1x2ZUoB1ZONXOqM3KsMFNFg+QMai49dnFsC7rOC38I I=;
X-IPAS-Result: =?us-ascii?q?A0AUAABmtGNgmJxdJa1aGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAUCBPgQBAQELAYN2ATkxlhEDkAgWikUUgWgLAQEBDQEBNAQBAYRQAoF6A?=
 =?us-ascii?q?iU2Bw4CAwEBAQMCAwEBAQEBBQEBAQIBBgQUAQEBAQEBAQGGQ4ZFAQU6PxALE?=
 =?us-ascii?q?gYVGTwNDgYTgnCDCKsVdYE0iQuBRBQOgRcBjUkmHIFJQoQuPoN5gQaDDIIJI?=
 =?us-ascii?q?gSBZVsGgRBagSpYFAItkH2CQIpMmw6BFIMRgSObNjEQgziKb5YbuBICBAYFA?=
 =?us-ascii?q?haBWwongVszGggbFYMkUBkNjjiOTyEDLzgCBgoBAQMJjnkBAQ?=
IronPort-HdrOrdr: A9a23:0OR3jKkQkEUngZc1jpNFK2fPV1rpDfN3imdD5ilNYBxZY6Wkvu
 ql9c516TbfjjENVHY83f2BIrCHW3PA9ZhziLNhWIuKdg/gpWeuMcVe/ZLvqgeQeRHW2+ZB2c
 5bGZRWJ8b3CTFB4PrSwA79KNo4xcnCzabAv5a7815IbSVHL55t9B14DAHzKDwUeCBjCYAiHJ
 SRouprzgDARV0tYs62BmYIUoH4zrWhqLvcbRELHBIh4gWV5AnJ1JfBDxOa0h0COgkg/Z4e9w
 H+/zDR1+GKr+y8jiTRzXbU6I5b3OH808JZCNaX4/JlTQnEu0KPeJlrXaGEsXQTpuyigWxa6e
 XkklMHI9l57W/XcyWOhSbVnyPk0Doo9hbZuDmlvUc=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.81,291,1610409600"; d="scan'208";a="668463184"
Received: from rcdn-core-5.cisco.com ([173.37.93.156])
 by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 30 Mar 2021 23:31:40 +0000
Received: from zorba ([10.24.9.230])
 by rcdn-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id 12UNVcQt021992
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 30 Mar 2021 23:31:39 GMT
Date: Tue, 30 Mar 2021 16:31:37 -0700
From: Daniel Walker <danielwa@cisco.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/7] powerpc: convert config files to generic cmdline
Message-ID: <20210330233137.GB2469518@zorba>
References: <20210309000247.2989531-4-danielwa@cisco.com>
 <5f865584-09c9-d21f-ffb7-23cf07cf058e@csgroup.eu>
 <20210309212944.GR109100@zorba>
 <e4899874-1684-fa1b-443e-f4e478e05e31@csgroup.eu>
 <CAL_JsqKm76jRQYDcu3rGyUWKPLspoO=EZW_WFy=zAK+m_JYCTg@mail.gmail.com>
 <20fd7d44-8c39-48bc-25c3-990be9d9d911@csgroup.eu>
 <20210325195956.GM109100@zorba>
 <CAL_Jsq+10nucQSRkrTKe9BD5wBScqEb7-Rdg=9TsPiKuiuPG7w@mail.gmail.com>
 <20210330173254.GS109100@zorba>
 <CAL_JsqJKBeAgaHQJwOL9G2qLbQSh32L5LtN+cSUgn5sV_P8How@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqJKBeAgaHQJwOL9G2qLbQSh32L5LtN+cSUgn5sV_P8How@mail.gmail.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.9.230, [10.24.9.230]
X-Outbound-Node: rcdn-core-5.cisco.com
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
Cc: Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, X86 ML <x86@kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, xe-linux-external@cisco.com,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 30, 2021 at 03:13:04PM -0500, Rob Herring wrote:
> On Tue, Mar 30, 2021 at 12:33 PM Daniel Walker <danielwa@cisco.com> wrote:
> >
> > On Thu, Mar 25, 2021 at 05:29:44PM -0600, Rob Herring wrote:
> > > On Thu, Mar 25, 2021 at 2:00 PM Daniel Walker <danielwa@cisco.com> wrote:
> > > >
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
> > > Can you please outline what those needs are which aren't met?
> >
> > append AND prepend at the same time on all architectures. Christophe doesn't
> > understand the need, and hence tries to minimize the feature set which is
> > incompatible with Cisco needs and all the other out of tree users.
> 
> Okay, but that's never been a feature in upstream. For upstream, we
> refactor first and add features 2nd. In this case, the difference is
> largely the kconfig and it would be better to not change the options
> twice, but that's not a blocker for taking the refactoring. You won't
> find a maintainer that's going to take adding a feature over cleanups
> and unification.

It kind of is a feature in upstream, it's a matter of opinion. Some platform
used append and some use prepend, and it's likely because the maintainers needed
one or the other for development.

I'm not sure why you think I can't add the features in one go. It would be
horrid to take Christophe's changes, then have to do basically all the same work
a second time which is what Christophe's changes would force me to do.

Say for example I implement this change only on one architecture. In that case
the maintainer would be accepting a feature enhancement , but there would be no
stopping it. I shouldn't have to go two strokes on one architecture, but each
change I'm making is essentially a single architecture. They can go in all
together or one at a time.

Daniel
