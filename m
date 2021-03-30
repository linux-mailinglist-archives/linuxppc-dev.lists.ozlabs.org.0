Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D9534EF8C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 19:33:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8xPM1QKVz3c5C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 04:33:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=ddbImwex;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.142.93; helo=alln-iport-6.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=ddbImwex; dkim-atps=neutral
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8xNw3m00z2ywy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 04:33:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=1192; q=dns/txt; s=iport;
 t=1617125584; x=1618335184;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2LZfLmeECNVtSnr3Mh+CyIjZ9xFZqjH6FwYenu/bjCA=;
 b=ddbImwexNhKwMFYVfPwfW1qCbEiBihF/mY8cgqnKBgEjEa+ro6vqOdGQ
 t6LXbSrDSXPbm+U6z/4OrwlTkiLv/QqbvqbjRd93g7tX6AsbjrEgCg5rg
 xh3c/hseqIaUwayvjJKlpmYezaZLZ2Q4Nb2aSEXtXiEKA6ntSvHIOQiHH Y=;
X-IPAS-Result: =?us-ascii?q?A0ASAAC4X2NgmJtdJa1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQIE/AgEBAQELAYN2ATkxlhEDkAgWilmBaAsBAQENAQE0BAEBh?=
 =?us-ascii?q?FACgXoCJTcGDgIDAQEBAwIDAQEBAQEFAQEBAgEGBBQBAQEBAQEBAYZDhkUBA?=
 =?us-ascii?q?gM6PxALGBUZPBsGE4JwgwirJXWBNIkLgUQUDoEXAY1JJhyBSUKELj6DeYEGh?=
 =?us-ascii?q?RUiBIFlYYEQggRYFAKRKoJAikycIoMRgSObNjEQgziKb5YbuBICBAYFAhaBa?=
 =?us-ascii?q?iKBWzMaCBsVgyRQGQ2OOI5PIQMvOAIGCgEBAwmJHwEB?=
IronPort-HdrOrdr: A9a23:DnBJjKzmbOdjEo60P+GWKrPxd+skLtp033Aq2lEZdDV+eKWj+P
 yGtvIdyBPylXI9WGs4n8qBJamHRhrnhPtIyKMWOqqvWxSjhXuwIOhZnOnf6hDpBiGWzIRg/I
 h6dawWMrDNJHh8yf33+QypV+snqeP3lJyAocf74zNTQRpxa6dmhj0JaTqzNkFtXgFJCd4YOf
 Onh/ZvnDardXQJYsnTPBBsNNTrnNHFmInrZhQLHXcciDWmty+i67LxDnGjsCs2bjUn+9sf2F
 mAuxDl4OGZv+ujzBjH2yvo841Og9f60LJ4dauxo/lQDCnwgQC1Y4kkfLuOsFkO0ZiSwWdvts
 XQqBE9OMk20VftRyWepBvg3BSI6kdJ10Pf
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.81,291,1610409600"; d="scan'208";a="711698846"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
 by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 30 Mar 2021 17:32:59 +0000
Received: from zorba ([10.24.8.123])
 by rcdn-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id 12UHWsUi019331
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 30 Mar 2021 17:32:57 GMT
Date: Tue, 30 Mar 2021 10:32:54 -0700
From: Daniel Walker <danielwa@cisco.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/7] powerpc: convert config files to generic cmdline
Message-ID: <20210330173254.GS109100@zorba>
References: <20210309000247.2989531-4-danielwa@cisco.com>
 <5f865584-09c9-d21f-ffb7-23cf07cf058e@csgroup.eu>
 <20210309212944.GR109100@zorba>
 <e4899874-1684-fa1b-443e-f4e478e05e31@csgroup.eu>
 <CAL_JsqKm76jRQYDcu3rGyUWKPLspoO=EZW_WFy=zAK+m_JYCTg@mail.gmail.com>
 <20fd7d44-8c39-48bc-25c3-990be9d9d911@csgroup.eu>
 <20210325195956.GM109100@zorba>
 <CAL_Jsq+10nucQSRkrTKe9BD5wBScqEb7-Rdg=9TsPiKuiuPG7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+10nucQSRkrTKe9BD5wBScqEb7-Rdg=9TsPiKuiuPG7w@mail.gmail.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.8.123, [10.24.8.123]
X-Outbound-Node: rcdn-core-4.cisco.com
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

On Thu, Mar 25, 2021 at 05:29:44PM -0600, Rob Herring wrote:
> On Thu, Mar 25, 2021 at 2:00 PM Daniel Walker <danielwa@cisco.com> wrote:
> >
> > On Thu, Mar 25, 2021 at 01:03:55PM +0100, Christophe Leroy wrote:
> > >
> > > Ok, so you agree we don't need to provide two CMDLINE, one to be appended and one to be prepended.
> > >
> > > Let's only provide once CMDLINE as of today, and ask the user to select
> > > whether he wants it appended or prepended or replacee. Then no need to
> > > change all existing config to rename CONFIG_CMDLINE into either of the new
> > > ones.
> > >
> > > That's the main difference between my series and Daniel's series. So I'll
> > > finish taking Will's comment into account and we'll send out a v3 soon.
> >
> > It doesn't solve the needs of Cisco, I've stated many times your changes have
> > little value. Please stop submitting them.
> 
> Can you please outline what those needs are which aren't met?

append AND prepend at the same time on all architectures. Christophe doesn't
understand the need, and hence tries to minimize the feature set which is
incompatible with Cisco needs and all the other out of tree users.

Daniel
