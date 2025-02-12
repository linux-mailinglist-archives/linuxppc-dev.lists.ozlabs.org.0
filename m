Return-Path: <linuxppc-dev+bounces-6131-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E26A32BC2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2025 17:35:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtP7K3PZlz30TC;
	Thu, 13 Feb 2025 03:35:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739378125;
	cv=none; b=dj7dQW0hrvj7sQ0BQWYTTYHMPtZB1InK9fE8YpqXxJDi9yMSrDsuTVjcLppV5U1Xt2mtX5PXP/f547YJt7pOHdVj/yI6VgcM0+Uk/cfFKhPVkPvojMN1hctTreCj7CE9/Tup82VqF7jQGJN0PVhKb6MkNRljYQdZY69nS0PJ/2rMyH+/RgnkcH4x6L0IZEeQWJDy0n6f9h/J6qgBq3vg9y6MRR7O6dGCayydEqfO4yo4okcXSgGLM/p4TOFgK3yxcRxLGUTeFWEHefwgKcZYABVDYJpZXOgECqxeVLdcLage2xsHw+DkxDhXfEMLjMy95YT3kHLX3LeJaeH7XeywRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739378125; c=relaxed/relaxed;
	bh=YnoXN61zEkJu9iGNErD3gIl2lvwc6Pd68igxswos3/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6KoZOlEIS2QaMN80loLt7KcABiERJThMWmUSJG39l3v2YCy3ujUbv27b91jmLQCDw1hJYl9/rWeEAhHG7pEEeCvBn/GWRmA+EMSJEfzce0i57Hk9v8+04qP705cudXBDeWkfkl0IDt2CyBtftKOntH1YR3qGuJbIIsd7lmk6nkOhwKbMs0Ha89cr9dofnAfjlh3dJA+jlcGgziHHuZnjbEtjth2xXwsUmNf0NFAiTD97WI9C8OltNdJ5GoIOyMEB/Ximf2Lb2UMjOWMULWYRPsorqOKZF0f7xiNx3jwsR8Hy4P9VWGpulcef+ZjS653mzr8hujQhvYRU8Y9zbwm1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtP7J2jrVz2yh2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2025 03:35:22 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC21912FC;
	Wed, 12 Feb 2025 08:35:10 -0800 (PST)
Received: from arm.com (e134078.arm.com [10.1.26.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7C1F3F6A8;
	Wed, 12 Feb 2025 08:34:46 -0800 (PST)
Date: Wed, 12 Feb 2025 16:34:44 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
	david@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org,
	oliver.upton@linux.dev, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joey.gouly@arm.com, andre.przywara@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 15/18] Add kvmtool_params to test
 specification
Message-ID: <Z6zNpF6mi5GgeDFE@arm.com>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-16-alexandru.elisei@arm.com>
 <20250123-bbd289cfd7abfd93e9b67eef@orel>
 <Z6tmrX8/+wzeFL1P@arm.com>
 <20250212-77a312138f8b5931553ece38@orel>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-77a312138f8b5931553ece38@orel>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Drew,

On Wed, Feb 12, 2025 at 04:56:42PM +0100, Andrew Jones wrote:
> On Tue, Feb 11, 2025 at 03:03:09PM +0000, Alexandru Elisei wrote:
> > Hi Drew,
> > 
> > On Thu, Jan 23, 2025 at 04:53:29PM +0100, Andrew Jones wrote:
> > > On Mon, Jan 20, 2025 at 04:43:13PM +0000, Alexandru Elisei wrote:
> > > > arm/arm64 supports running tests under kvmtool, but kvmtool's syntax for
> > > > running a virtual machine is different than qemu's. To run tests using the
> > > > automated test infrastructure, add a new test parameter, kvmtool_params.
> > > > The parameter serves the exact purpose as qemu_params/extra_params, but using
> > > > kvmtool's syntax.
> > > 
> > > The need for qemu_params and kvmtool_params makes more sense to me now
> > > that I see the use in unittests.cfg (I wonder if we can't rearrange this
> > > series to help understand these things up front?). There's a lot of
> > 
> > Certainly, I'll move it closer to the beginning of the series.
> > 
> > > duplication, though, with having two sets of params since the test-
> > > specific inputs always have to be duplicated. To avoid the duplication
> > > I think we can use extra_params for '-append' and '--params' by
> > > parametrizing the option name for "params" (-append / --params) and then
> > > create qemu_opts and kvmtool_opts for extra options like --pmu, --mem,
> > > and irqchip.
> > 
> > How about something like this (I am using selftest-setup as an example, all the
> > other test definitions would be similarly modified):
> > 
> > diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> > index 2bdad67d5693..3009305ba2d3 100644
> > --- a/arm/unittests.cfg
> > +++ b/arm/unittests.cfg
> > @@ -15,7 +15,9 @@
> >  [selftest-setup]
> >  file = selftest.flat
> >  smp = 2
> > -extra_params = -m 256 -append 'setup smp=2 mem=256'
> > +test_args = setup smp=2 mem=256
> > +qemu_params = -m 256
> > +kvmtool_params = --mem 256
> >  groups = selftest
> > 
> > I was thinking about using 'test_args' instead of 'extra_params' to avoid any
> > confusion between the two, and to match how they are passed to a test
> > - they are in the argv main's argument.
> 
> Yes, this looks good and test_args is better than my suggestion in the
> other mail of 'cmdline_options' since "cmdline" would be ambiguous with
> the test's cmdline and the vmm's cmdline.
> 
> > 
> > Also, should I change the test definitions for all the other architectures?
> > It's not going to be possible for me to test all the changes.
> 
> We should be safe with an s/extra_params/qemu_params/ change for all
> architectures and CI is pretty good, so we'd have good confidence
> if it passes, but, I think we should keep extra_params as a qemu_params
> alias anyway since it's possible that people have wrapped kvm-unit-tests
> in test harnesses which generate unittests.cfg files.

Sounds good, split extra_params into test_args and qemu_params in all
unittests.cfg files, and keep extra_params as an alias for qemu_params.

I was thinking that maybe I should send that as a separate patch, to make
sure it gets the visibility it deserves from the other maintainers, instead
of it being buried in a 18 patch series. What do you think?

Thanks,
Alex

