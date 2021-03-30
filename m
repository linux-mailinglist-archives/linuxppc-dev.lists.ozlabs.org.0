Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC1034EFAF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 19:35:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8xS82KM6z3c1R
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 04:35:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=Wg8jsGpr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.142.88; helo=alln-iport-1.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=Wg8jsGpr; dkim-atps=neutral
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8xRk4BMxz2yRZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 04:35:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=1151; q=dns/txt; s=iport;
 t=1617125730; x=1618335330;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0ijngtCeHVdaxTwLB1CJ9gXZHFg+3Ll7FC+tYt3/onQ=;
 b=Wg8jsGpreN635QrT9FnEk6LCY458kCJuqkJ22mS6FpN1vZGk1hhfLTdE
 f90QOrnUPZqD2pY53Tt1ZPiZ8mkN2oPR7M2MVr3sOWKd5Cmqcxun2kMS9
 BLARw026nUp5c7tzTJkc+XnMZYScXNZLb39w6eJ6FOEebv7lJZwZAfq6H 8=;
X-IPAS-Result: =?us-ascii?q?A0AYAAAUYGNgmJldJa1aGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAUCBPgQBAQELAYN2ATmWQQOQCBaKRRSBaAsBAQENAQE0BAEBhFACgXoCJ?=
 =?us-ascii?q?TYHDgIDAQEBAwIDAQEBAQEFAQEBAgEGBBQBAQEBAQEBAYZDhkUBAgM6PxALG?=
 =?us-ascii?q?BUZPBsGgwODCKsndYE0iQuBRBQOgRcBjUkmHIFJQoESgxw+g3mBBoUVIgSBZ?=
 =?us-ascii?q?WGBEIIEOR8UkSyCQIpMnCKDEYEjmzYxEIM4im+WG7gSAgQGBQIWgVoBMYFbM?=
 =?us-ascii?q?xoIGxWDJU8ZDY44jk8hA2cCBgoBAQMJiR8BAQ?=
IronPort-HdrOrdr: A9a23:L439FKp7WPX8plUepRxP7I0aV5twL9V00zAX/kB9WHVpW+aT/v
 rAoN0w0xjohDENHFwhg8mHIqmcQXXanKQFhLU5F7GkQQXgpS+UPJhvhLGSoQHINiXi+odmv5
 tIXLN5DLTLYGRSrcG/2wWgFsZl/d/vytHNuc7771NACT5ncLth6QARMHf5LmRTSBNdDZQ0UL
 qwj/AnmxOadX4abtu2CxA+NoCpm/TxmJ3rehIADRI8gTPvsRqT9LX4HxKEty1xbxpzx94ZnV
 TtokjQ+rik98q20Abb0HXeq65LgcL7xsFYbfb87fQ9G3HLlhuiYphnVvmkuj04ydvfkWoCoZ
 3rvwoqOdh15jfqWlyN5THp2wXmzV8Vmhnf9WM=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.81,291,1610409600"; d="scan'208";a="668294645"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
 by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 30 Mar 2021 17:35:26 +0000
Received: from zorba ([10.24.8.123])
 by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 12UHZMBO032401
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 30 Mar 2021 17:35:24 GMT
Date: Tue, 30 Mar 2021 10:35:21 -0700
From: Daniel Walker <danielwa@cisco.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 3/7] powerpc: convert config files to generic cmdline
Message-ID: <20210330173521.GT109100@zorba>
References: <20210309000247.2989531-4-danielwa@cisco.com>
 <5f865584-09c9-d21f-ffb7-23cf07cf058e@csgroup.eu>
 <20210309212944.GR109100@zorba>
 <e4899874-1684-fa1b-443e-f4e478e05e31@csgroup.eu>
 <CAL_JsqKm76jRQYDcu3rGyUWKPLspoO=EZW_WFy=zAK+m_JYCTg@mail.gmail.com>
 <20fd7d44-8c39-48bc-25c3-990be9d9d911@csgroup.eu>
 <20210325195956.GM109100@zorba>
 <20210329100750.GB3207@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210329100750.GB3207@willie-the-truck>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.8.123, [10.24.8.123]
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

On Mon, Mar 29, 2021 at 11:07:51AM +0100, Will Deacon wrote:
> On Thu, Mar 25, 2021 at 12:59:56PM -0700, Daniel Walker wrote:
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
> FWIW, they're useful for arm64 and I will gladly review the updated series.
> 
> I don't think asking people to stop submitting patches is ever the right
> answer. Please don't do that.

Why ? It's me nacking his series, is that not allowed anymore ?

Daniel
