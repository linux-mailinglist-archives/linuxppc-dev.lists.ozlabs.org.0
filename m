Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 831EE32A780
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 18:14:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqkJL1BLLz3cLS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 04:14:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=DewgHEw9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.86.74; helo=rcdn-iport-3.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=DewgHEw9; dkim-atps=neutral
X-Greylist: delayed 63 seconds by postgrey-1.36 at boromir;
 Wed, 03 Mar 2021 04:14:03 AEDT
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqkHv3K8Zz2y07
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 04:14:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=1625; q=dns/txt; s=iport;
 t=1614705243; x=1615914843;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ImvxV88MVdFuksRY57yHoR9ifNWa1nbpC7IuceuHtdI=;
 b=DewgHEw9NnZMJ0nIdls7nLvW2kG/hKPga9abvEycaEXNpmOM0UnCJRl3
 5CHSeiRpz3Rvl8tzP8TZWuMj/3iKzGj7uL0+MBOyOj49W0ilwPGerKsec
 lYqyJeN4kaYMQCGNfHZgGIq8bP0dQkUpwHKCO3gPNZPWLppSvkIaK+sef M=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BKAwC9cD5g/5RdJa1iHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQFAgU+CK3ZWATkxA5Yaj3oWilOBaAsBAQENAQEqCgQBAYRNAoF?=
 =?us-ascii?q?6AiU4EwIDAQELAQEFAQEBAgEGBHGFYQ2GRQEFOjQLEAsYLjwKEQYTgnGDBw+?=
 =?us-ascii?q?sa3SBNIRAAYRigT4GIoEWjUMmHIFJQoQrPoQJARIBg2uCKwSEAYIxQ5MVAYo?=
 =?us-ascii?q?tm3uDBoEfiCCSUjEQgyeQSo9VLZYxiTSWYAIEBgUCFoFrI2dwMxoIGxU7gmk?=
 =?us-ascii?q?TPRkNjisWiGGFZiADLwI2AgYKAQEDCYwTAQE?=
X-IronPort-AV: E=Sophos;i="5.81,217,1610409600"; d="scan'208";a="842559803"
Received: from rcdn-core-12.cisco.com ([173.37.93.148])
 by rcdn-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 02 Mar 2021 17:12:53 +0000
Received: from zorba ([10.24.9.198])
 by rcdn-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 122HCpOe014626
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 2 Mar 2021 17:12:52 GMT
Date: Tue, 2 Mar 2021 09:12:51 -0800
From: Daniel Walker <danielwa@cisco.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 0/2] Fix CMDLINE_EXTEND handling for FDT "bootargs"
Message-ID: <20210302171251.GB109100@zorba>
References: <20210225125921.13147-1-will@kernel.org>
 <CAL_JsqJX=TCCs7=gg486r9TN4NYscMTCLNfqJF9crskKPq-bTg@mail.gmail.com>
 <20210301144153.GA16716@willie-the-truck>
 <CAL_JsqJ11D-7a3pwLTVd+rHjqDGBb=b8OU_a6h3Co-at+2qMtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ11D-7a3pwLTVd+rHjqDGBb=b8OU_a6h3Co-at+2qMtQ@mail.gmail.com>
X-Outbound-SMTP-Client: 10.24.9.198, [10.24.9.198]
X-Outbound-Node: rcdn-core-12.cisco.com
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
Cc: Tyler Hicks <tyhicks@linux.microsoft.com>, devicetree@vger.kernel.org,
 Android Kernel Team <kernel-team@android.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Frank Rowand <frowand.list@gmail.com>, Marc Zyngier <maz@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Doug Anderson <dianders@chromium.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Max Uvarov <muvarov@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 01, 2021 at 11:26:14AM -0600, Rob Herring wrote:
> +PPC folks and Daniel W
> 
> On Mon, Mar 1, 2021 at 8:42 AM Will Deacon <will@kernel.org> wrote:
> >
> > On Mon, Mar 01, 2021 at 08:19:32AM -0600, Rob Herring wrote:
> > > On Thu, Feb 25, 2021 at 6:59 AM Will Deacon <will@kernel.org> wrote:
> > > > We recently [1] enabled support for CMDLINE_EXTEND on arm64, however
> > > > when I started looking at replacing Android's out-of-tree implementation [2]
> > >
> > > Did anyone go read the common, reworked version of all this I
> > > referenced that supports prepend and append. Here it is again[1].
> > > Maybe I should have been more assertive there and said 'extend' is
> > > ambiguous.
> >
> > I tried reading that, but (a) most of the series is not in the mailing list
> > archives and (b) the patch that _is_ doesn't touch CMDLINE_EXTEND at all.
> > Right now the code in mainline does the opposite of what it's documented to
> > do.
> 
> Actually, there is a newer version I found:
> 
> https://lore.kernel.org/linuxppc-dev/1551469472-53043-1-git-send-email-danielwa@cisco.com/
> https://lore.kernel.org/linuxppc-dev/1551469472-53043-2-git-send-email-danielwa@cisco.com/
> https://lore.kernel.org/linuxppc-dev/1551469472-53043-3-git-send-email-danielwa@cisco.com/
> 
> (Once again, there's some weird threading going on)
> 

I'm happy to work with anyone to resubmit the changes. We currently use the
changes in Cisco, and we have used them for many years.

I was planning to update and resubmit since someone has recently inquired about
why it wasn't upstream.

Daniel
