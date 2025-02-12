Return-Path: <linuxppc-dev+bounces-6129-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5577DA32AE0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2025 16:57:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtNH861X8z2ygY;
	Thu, 13 Feb 2025 02:57:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::b5"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739375828;
	cv=none; b=Z7osVXBurtVeYVy4C2Cu58tTXBd8N/GPTZ/FXXjJtoHriuzjOQChYlIeKWfUgcYFvLgGuynUoFchRStb5Xx0hjJmvAhh24/mNBmWK7QaggsVZ/we7TQz+dy76Q3fwErDLBQpCA4HBUAgxRSu8Dc+/aAP12DSpfQfSS8l5u7NA6Xu+XTa0iFnTM1G+Q+foTckVxObLzVA3yDtqUFP3WiOGkVLEoEDf1sWP17zAFytvT/JPZkcfD0G8gRxq7E5F3wpLvA3D/fjGrKotmHRsaKweO4OrwPiRy7YssWBwOQ6Au5jnKZChGihvpTKbGNsL7uzgWS5UKMg2X6xVHL8TYj90g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739375828; c=relaxed/relaxed;
	bh=mlJEetX65r+ey75QsnS3ny//eDRch+TvDW9jPZ82TjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/txB7LFfcsYsEeJik5YPWML/BafChEF22Zj/W+jlmf67RZoUsWPPZM2LzULl+gt/hgma+p0CsQvlO9IydZJgpt/EiWbgrcmxuTiw6wHGw0dqpWtlolyIjDLIeT/Ns6g67biCy1D/DfW/Q0ejPEC6rR3KA1XFIOejy1BElmPAjfkEQAt3Z7K8kfWnpum8Kfh/OOVXoXlcv5gkih5zL0c9ff02q59Fff+ubjjcJgKkvNALTiqureaHgzhH0qlixTzPbrgEeyKJ4pP1BoogyyK0WmiKVmBGAjpdOdA57EmpJbRjs6oL9FCu1YjkpZIsEps5In4QZFqAB72yu9IqkLObA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LE7nPK0g; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::b5; helo=out-181.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LE7nPK0g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::b5; helo=out-181.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [IPv6:2001:41d0:203:375::b5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YtNH80PZ8z2yVt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2025 02:57:07 +1100 (AEDT)
Date: Wed, 12 Feb 2025 16:56:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739375806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mlJEetX65r+ey75QsnS3ny//eDRch+TvDW9jPZ82TjI=;
	b=LE7nPK0g4OKCBn2/Nf6tUruhiM+GsVGX3Bp8bq1qmc/zeAqXvBqY/Iuy4DrEB5FnrsOTlz
	+Dj2g7jhpSoKZ9R4qtPc0/DJImOiuJNIj3rkAiu3j+LIBABXbr+S8td1zxdt5LhEVes36w
	UdkI8uNya6OfrSRsjigth+2Pjdptt9I=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 15/18] Add kvmtool_params to test
 specification
Message-ID: <20250212-77a312138f8b5931553ece38@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-16-alexandru.elisei@arm.com>
 <20250123-bbd289cfd7abfd93e9b67eef@orel>
 <Z6tmrX8/+wzeFL1P@arm.com>
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
In-Reply-To: <Z6tmrX8/+wzeFL1P@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Feb 11, 2025 at 03:03:09PM +0000, Alexandru Elisei wrote:
> Hi Drew,
> 
> On Thu, Jan 23, 2025 at 04:53:29PM +0100, Andrew Jones wrote:
> > On Mon, Jan 20, 2025 at 04:43:13PM +0000, Alexandru Elisei wrote:
> > > arm/arm64 supports running tests under kvmtool, but kvmtool's syntax for
> > > running a virtual machine is different than qemu's. To run tests using the
> > > automated test infrastructure, add a new test parameter, kvmtool_params.
> > > The parameter serves the exact purpose as qemu_params/extra_params, but using
> > > kvmtool's syntax.
> > 
> > The need for qemu_params and kvmtool_params makes more sense to me now
> > that I see the use in unittests.cfg (I wonder if we can't rearrange this
> > series to help understand these things up front?). There's a lot of
> 
> Certainly, I'll move it closer to the beginning of the series.
> 
> > duplication, though, with having two sets of params since the test-
> > specific inputs always have to be duplicated. To avoid the duplication
> > I think we can use extra_params for '-append' and '--params' by
> > parametrizing the option name for "params" (-append / --params) and then
> > create qemu_opts and kvmtool_opts for extra options like --pmu, --mem,
> > and irqchip.
> 
> How about something like this (I am using selftest-setup as an example, all the
> other test definitions would be similarly modified):
> 
> diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> index 2bdad67d5693..3009305ba2d3 100644
> --- a/arm/unittests.cfg
> +++ b/arm/unittests.cfg
> @@ -15,7 +15,9 @@
>  [selftest-setup]
>  file = selftest.flat
>  smp = 2
> -extra_params = -m 256 -append 'setup smp=2 mem=256'
> +test_args = setup smp=2 mem=256
> +qemu_params = -m 256
> +kvmtool_params = --mem 256
>  groups = selftest
> 
> I was thinking about using 'test_args' instead of 'extra_params' to avoid any
> confusion between the two, and to match how they are passed to a test
> - they are in the argv main's argument.

Yes, this looks good and test_args is better than my suggestion in the
other mail of 'cmdline_options' since "cmdline" would be ambiguous with
the test's cmdline and the vmm's cmdline.

> 
> Also, should I change the test definitions for all the other architectures?
> It's not going to be possible for me to test all the changes.

We should be safe with an s/extra_params/qemu_params/ change for all
architectures and CI is pretty good, so we'd have good confidence
if it passes, but, I think we should keep extra_params as a qemu_params
alias anyway since it's possible that people have wrapped kvm-unit-tests
in test harnesses which generate unittests.cfg files.

Thanks,
drew

