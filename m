Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F04D1B225
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 10:57:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452ZTS4V39zDqG0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 18:57:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="Z9kL3Iw0"; dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452ZS91WxszDqB5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 18:56:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YsWNQAn/oXqj/AAmCsiyvkrAsiJ6jruPNR4u9yvPwDQ=; b=Z9kL3Iw0vUjQQn2xL9rrd+TEG
 UivW7zGI7nKs6s+saOWgsrnSo+VOowZFiJ3B8AIlWQ3ZuuW6ORWQmW7q4Ae/J4efNP53Nf8V++pHO
 yJeV/ARJRj20SC+7fOqXNkBBEyFb9oUaeRrhohjVNG2ncC4VsetmBKoO3fYQqV0uuv2wdsO85gvuO
 bS5lrlhzqlYfBbTIClLxdC1PGYvxWbIafW9xORDDd6jrXXp7Vg2APxbQho5bGx3u1uRPTGqbYVeC3
 UGNepzW35AtTfwF4XubSUYGbfNLqKs53Po0s64MIKmywMarc4RkHDd6gsGiINbxKcm6HJvGsbGM5A
 4S15F4lxQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=hirez.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQ6kx-0005ao-8Y; Mon, 13 May 2019 08:56:24 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 95CBD2029F877; Mon, 13 May 2019 10:56:20 +0200 (CEST)
Date: Mon, 13 May 2019 10:56:20 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH 1/2] perf ioctl: Add check for the sample_period value
Message-ID: <20190513085620.GN2650@hirez.programming.kicks-ass.net>
References: <20190511024217.4013-1-ravi.bangoria@linux.ibm.com>
 <20190513074213.GH2623@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190513074213.GH2623@hirez.programming.kicks-ass.net>
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, acme@kernel.org, jolsa@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 13, 2019 at 09:42:13AM +0200, Peter Zijlstra wrote:
> On Sat, May 11, 2019 at 08:12:16AM +0530, Ravi Bangoria wrote:
> > Add a check for sample_period value sent from userspace. Negative
> > value does not make sense. And in powerpc arch code this could cause
> > a recursive PMI leading to a hang (reported when running perf-fuzzer).
> > 
> > Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> > ---
> >  kernel/events/core.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > index abbd4b3b96c2..e44c90378940 100644
> > --- a/kernel/events/core.c
> > +++ b/kernel/events/core.c
> > @@ -5005,6 +5005,9 @@ static int perf_event_period(struct perf_event *event, u64 __user *arg)
> >  	if (perf_event_check_period(event, value))
> >  		return -EINVAL;
> >  
> > +	if (!event->attr.freq && (value & (1ULL << 63)))
> > +		return -EINVAL;
> 
> Well, perf_event_attr::sample_period is __u64. Would not be the site
> using it as signed be the one in error?

You forgot to mention commit: 0819b2e30ccb9, so I guess this just makes
it consistent and is fine.
