Return-Path: <linuxppc-dev+bounces-6152-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E53A34111
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2025 14:59:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtxdK17dCz2yNP;
	Fri, 14 Feb 2025 00:59:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b9"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739455189;
	cv=none; b=MxstmYF2CYejk47p5rzRSn+uWOsxwkNKocCODKDte7G/1RwZADuhE2qyTBMG5mlmfg8FKLXsHepkawn9ni/w07/GXe8lJ5ewCkqE1nXIu3+/cmUqxGcRB/vsnF9bgWR18rOHmh80luKPsj67gLmVaa1MhGP63KIEadTyu+h/CV/RZdQMxiVFnashJyYaUEBlKvPtzmsH5WsfZrt/IZttlLcYmMUS8RCyLsIZSWP5TgF5wQfBONbcpYJb9Mq0vAxaR/xAkcuJ2obRnIpdTPTYCovc1xoMsbD8JrxBOin2agvwgoy4WwSXFlbcPxxK4pYvpmaswAQiWy5fkGiqJBYcfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739455189; c=relaxed/relaxed;
	bh=quCNt3rENXxq12lVNZV7KFjjQFYvI9uo2HoGXNuB/os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kj5WseYP/tY/YQoFENgjPcTdO3gMyiUePenk5mVSPI5VbbH5VXYwCfzas5F+HwmzBqvqyUO2HYuUlxhtEQ2OrP3VeGC6sBHBpnnvg3TJKCPCC+k4fBpTFLVGRBI7MkArUKxHKt95AV2+5vJ3j2DEZyphxXCZlim55aEozH/3Wj7UBYaPO+u8L4jfyoYm9VGLqLTrpX+Th+L5Dk1uI26gFIF0uhzOIrh8Y5JO9/m+wEB7LsNGvvUQMMbhe8Ax3sL+TQFnClFlKuU/wJdPKALqOjJLGNYoRPVlljL/6UwSySCcpVLD2s0/772LkbzM9W3N+zjWer+8YpZ3Y5kR++FZ4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oxL4AOv2; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::b9; helo=out-185.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oxL4AOv2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b9; helo=out-185.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YtxdG3LhLz2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 00:59:44 +1100 (AEDT)
Date: Thu, 13 Feb 2025 14:59:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739455163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=quCNt3rENXxq12lVNZV7KFjjQFYvI9uo2HoGXNuB/os=;
	b=oxL4AOv2PByqQJRmy2LV/aaLcm7zlaNJBU3a6mZ4KiT1XwSVG9tf4Z3GzbapebfxcHiqJx
	A7DPMUZTuDaWda9Ms+5FMzarxZGNtmgIgBHFlsikf73RqRVlrke009F2yKj0xwukbdTbKX
	kTUfgGhAYWnCki1zK3SlWOvzxZvLrdU=
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
Message-ID: <20250213-a6741ec8fd32c34500327176@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-16-alexandru.elisei@arm.com>
 <20250123-bbd289cfd7abfd93e9b67eef@orel>
 <Z6tmrX8/+wzeFL1P@arm.com>
 <20250212-77a312138f8b5931553ece38@orel>
 <Z6zNpF6mi5GgeDFE@arm.com>
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
In-Reply-To: <Z6zNpF6mi5GgeDFE@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Feb 12, 2025 at 04:34:44PM +0000, Alexandru Elisei wrote:
> Hi Drew,
> 
> On Wed, Feb 12, 2025 at 04:56:42PM +0100, Andrew Jones wrote:
> > On Tue, Feb 11, 2025 at 03:03:09PM +0000, Alexandru Elisei wrote:
> > > Hi Drew,
> > > 
> > > On Thu, Jan 23, 2025 at 04:53:29PM +0100, Andrew Jones wrote:
> > > > On Mon, Jan 20, 2025 at 04:43:13PM +0000, Alexandru Elisei wrote:
> > > > > arm/arm64 supports running tests under kvmtool, but kvmtool's syntax for
> > > > > running a virtual machine is different than qemu's. To run tests using the
> > > > > automated test infrastructure, add a new test parameter, kvmtool_params.
> > > > > The parameter serves the exact purpose as qemu_params/extra_params, but using
> > > > > kvmtool's syntax.
> > > > 
> > > > The need for qemu_params and kvmtool_params makes more sense to me now
> > > > that I see the use in unittests.cfg (I wonder if we can't rearrange this
> > > > series to help understand these things up front?). There's a lot of
> > > 
> > > Certainly, I'll move it closer to the beginning of the series.
> > > 
> > > > duplication, though, with having two sets of params since the test-
> > > > specific inputs always have to be duplicated. To avoid the duplication
> > > > I think we can use extra_params for '-append' and '--params' by
> > > > parametrizing the option name for "params" (-append / --params) and then
> > > > create qemu_opts and kvmtool_opts for extra options like --pmu, --mem,
> > > > and irqchip.
> > > 
> > > How about something like this (I am using selftest-setup as an example, all the
> > > other test definitions would be similarly modified):
> > > 
> > > diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> > > index 2bdad67d5693..3009305ba2d3 100644
> > > --- a/arm/unittests.cfg
> > > +++ b/arm/unittests.cfg
> > > @@ -15,7 +15,9 @@
> > >  [selftest-setup]
> > >  file = selftest.flat
> > >  smp = 2
> > > -extra_params = -m 256 -append 'setup smp=2 mem=256'
> > > +test_args = setup smp=2 mem=256
> > > +qemu_params = -m 256
> > > +kvmtool_params = --mem 256
> > >  groups = selftest
> > > 
> > > I was thinking about using 'test_args' instead of 'extra_params' to avoid any
> > > confusion between the two, and to match how they are passed to a test
> > > - they are in the argv main's argument.
> > 
> > Yes, this looks good and test_args is better than my suggestion in the
> > other mail of 'cmdline_options' since "cmdline" would be ambiguous with
> > the test's cmdline and the vmm's cmdline.
> > 
> > > 
> > > Also, should I change the test definitions for all the other architectures?
> > > It's not going to be possible for me to test all the changes.
> > 
> > We should be safe with an s/extra_params/qemu_params/ change for all
> > architectures and CI is pretty good, so we'd have good confidence
> > if it passes, but, I think we should keep extra_params as a qemu_params
> > alias anyway since it's possible that people have wrapped kvm-unit-tests
> > in test harnesses which generate unittests.cfg files.
> 
> Sounds good, split extra_params into test_args and qemu_params in all
> unittests.cfg files, and keep extra_params as an alias for qemu_params.
> 
> I was thinking that maybe I should send that as a separate patch, to make
> sure it gets the visibility it deserves from the other maintainers, instead
> of it being buried in a 18 patch series. What do you think?

Sounds good.

Thanks,
drew

