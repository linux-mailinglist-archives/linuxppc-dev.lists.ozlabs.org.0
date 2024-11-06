Return-Path: <linuxppc-dev+bounces-2939-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4509BF83B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 21:52:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkHT22syNz2xG6;
	Thu,  7 Nov 2024 07:52:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.177
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730926342;
	cv=none; b=MMQmxNK6DMgf0i5BBz9C9rTmWmpjEYK/16AO8dhkVxcn4zPVZdiqsD3FxrtDIXtuYmYDVeLc9zOj1ZK7p+cv8IYqcDArcDKuLDRjgzjLg3W+CrKWHVQIwku9IBQpcFWStxrUo/tgf8NhDg9NcNBVmR9n3qeZQSe4PO6yhfC08lImlHKwHK9jXE1F8IgeYJvkOVr9JMeIHa70GdrZk2Ofs+J3L64uPW1pWzSMPzXensqiOGfd5X5CdNCrFIQeJiiS5KPVliyLlbgBSqA8vqaLB18jXcAoWaLkYgmbgHzVSnOEw0UzNXnZz2zZKt2Ch/nDnye4BvyyVKx2DzPG0SOxBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730926342; c=relaxed/relaxed;
	bh=iTbQ6DPhP6MjHwSaDILXhZVjYXEH8BwsiSbm61YVqgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4VK4Ylf46hng6tkEOcFB7WbBREQv7vL6fcKS8bZJeKPnmpX6ObLP9BGndKT36wgFAVtXxp7BW1Bl6he6Ed5lRBUgJNahshVf9tUPiV372RS5vp8XQmOcakFG1P5D2imd9+obs/UKif/wLeBA1LOfuU2PQiFejrVL1lBhV6bB0bnsFSvZuBqmHFvf/jzsTdaV/dAwsm14sxqO7W/LWyanGaSO/aLY3H8G80u0N48323lULnz+Nsl3Ow/xTpX4sd/lOZz3KI8AO625tTrCPXl5VLV4iqHs+Kl5LbCIw5Cf2N44HI6YdZ/gSsYsGSDepKfjwLYbLkulr5oftVvohVTow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Bw/NSx1j; dkim-atps=neutral; spf=pass (client-ip=91.218.175.177; helo=out-177.mta0.migadu.com; envelope-from=oliver.upton@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Bw/NSx1j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.177; helo=out-177.mta0.migadu.com; envelope-from=oliver.upton@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 2975 seconds by postgrey-1.37 at boromir; Thu, 07 Nov 2024 07:52:18 AEDT
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkHSy6ds6z2x9g
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 07:52:17 +1100 (AEDT)
Date: Wed, 6 Nov 2024 12:51:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730926316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iTbQ6DPhP6MjHwSaDILXhZVjYXEH8BwsiSbm61YVqgE=;
	b=Bw/NSx1j2z8iH74+2uUPsORZOF/lHwjDSE1XgPO3bR7hc3VDGRgJjxxqihTFVbyt2Vu2w8
	raQ7DhoPXKD5HHKOAaOJujYj6vS582FOQLBKtpnd3xvd1RSxRYMmmhyO+1CxVOE0maifyR
	a4U5OreS2n4YhRCs77wj4S8lLE19n7c=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: "Liang, Kan" <kan.liang@linux.intel.com>
Cc: Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org,
	Sean Christopherson <seanjc@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v6 4/5] x86: perf: Refactor misc flag assignments
Message-ID: <ZyvW3FxcezmYyOMa@linux.dev>
References: <20241105195603.2317483-1-coltonlewis@google.com>
 <20241105195603.2317483-5-coltonlewis@google.com>
 <65675ed8-e569-47f8-b1eb-40c853751bfb@linux.intel.com>
 <ZyvLOjy8Vfvai5cG@linux.dev>
 <597dbcf6-8169-4084-881c-8942ed363189@linux.intel.com>
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
In-Reply-To: <597dbcf6-8169-4084-881c-8942ed363189@linux.intel.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Nov 06, 2024 at 03:33:30PM -0500, Liang, Kan wrote:
> On 2024-11-06 3:02 p.m., Oliver Upton wrote:
> > On Wed, Nov 06, 2024 at 11:03:10AM -0500, Liang, Kan wrote:
> >>> +static unsigned long common_misc_flags(struct pt_regs *regs)
> >>> +{
> >>> +	if (regs->flags & PERF_EFLAGS_EXACT)
> >>> +		return PERF_RECORD_MISC_EXACT_IP;
> >>> +
> >>> +	return 0;
> >>> +}
> >>> +
> >>> +unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
> >>> +{
> >>> +	unsigned long guest_state = perf_guest_state();
> >>> +	unsigned long flags = common_misc_flags(regs);
> >>> +
> >>> +	if (guest_state & PERF_GUEST_USER)
> >>> +		flags |= PERF_RECORD_MISC_GUEST_USER;
> >>> +	else if (guest_state & PERF_GUEST_ACTIVE)
> >>> +		flags |= PERF_RECORD_MISC_GUEST_KERNEL;
> >>> +
> >>
> >> The logic of setting the GUEST_KERNEL flag is implicitly changed here.
> >>
> >> For the current code, the GUEST_KERNEL flag is set for !PERF_GUEST_USER,
> >> which include both guest_in_kernel and guest_in_NMI.
> > 
> > Where is the "guest_in_NMI" state coming from? KVM only reports user v.
> > kernel mode.
> 
> I may understand the kvm_arch_pmi_in_guest() wrong.

kvm_arch_pmi_in_guest() is trying to *guess* whether or not an overflow
interrupt caused the most recent VM-exit, implying a counter overflowed
while in the VM. It has no idea what events are loaded on the PMU and
which contexts they're intended to sample in.

It only makes sense to check kvm_arch_pmi_in_guest() if you're dealing with
an event that counts in both host and guest modes and you need to decide who
to sample.

> However, the kvm_guest_state() at least return 3 states.
> 0
> PERF_GUEST_ACTIVE
> PERF_GUEST_ACTIVE | PERF_GUEST_USER
> 
> The existing code indeed assumes two modes. If it's not user mode, it
> must be kernel mode.
> However, the proposed code behave differently, or at least implies there
> are more modes.
> If it's not user mode and sets PERF_GUEST_ACTIVE, it's kernel mode.

A precondition of the call to perf_arch_guest_misc_flags() is that guest
state is nonzero, meaning a vCPU is loaded presently on this CPU.

-- 
Thanks,
Oliver

