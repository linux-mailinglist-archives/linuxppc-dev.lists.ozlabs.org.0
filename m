Return-Path: <linuxppc-dev+bounces-2935-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD289BF7C1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 21:04:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkGPG1qs5z3bfj;
	Thu,  7 Nov 2024 07:04:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730923442;
	cv=none; b=IXzFi9w2zNTw7QSDW4LZpxh8ZLOKVny0UhTOniuCnsl2v7yx75HH3ir6H0wkqhkVl2FsXjWj3Hz5FMYC7LLwfhnqy7H4OnImi+0bgu5r9glhA4DPSJhnqgVaSN86qzMYZgohZlWpPAJnENuAh28EV+7ei3TTzSDm8ded2I8eqpCAs416tmDdMjSfv1Llnj4yXMIm5scox+suXZS1hb9OxrqyIAWebR+OZ9uR0j2CdohhHUpsxd/HU7DQeBbDm+qoq/XvNJuHU2R5ClljhQIoZMm8Iyb6M7csBlJrV8BEt593yWhZiSTpmX7iCcwQV5pXPwZhO4Xv705YU2iUEj7yDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730923442; c=relaxed/relaxed;
	bh=SOBsyQjKR+aopD9T4x3Q0P1OVO7qyX9T6pAaFYsEySE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VAoj2Ey8r9i+1sdvBHqo/szI1pn0t0cR0yydeW7ppNZwRl5a5uccivdcrlFIBWV3sbALd0Dxi44VysDBvOQMS4EZa5huo2kErhOYtmjwrUE6ZEESmkoemGxv9fGVTeRaOzyTbPESACngLwzr0grWh/u/qRcdvdYSaHXi5hvpYY+AMhjka6dsxZEHWY3kOByWwJcYhazSWsI18ZlSVIu9DGmriNYEESNIUrHjjVrR91w1GwtFeB5TxgEzZ1sh69scyaKWIxDIKaJ5pZLoL1VFUEqmcXwbCPfgkkAXWdb7kpxIU7ljlckHD3I7WpmAOISU/m80a5uUSKkGBHDCaCVfJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ev2IHzSQ; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::b0; helo=out-176.mta0.migadu.com; envelope-from=oliver.upton@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ev2IHzSQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b0; helo=out-176.mta0.migadu.com; envelope-from=oliver.upton@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 83 seconds by postgrey-1.37 at boromir; Thu, 07 Nov 2024 07:04:00 AEDT
Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkGPD6zNRz3bd2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 07:03:58 +1100 (AEDT)
Date: Wed, 6 Nov 2024 12:02:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730923334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SOBsyQjKR+aopD9T4x3Q0P1OVO7qyX9T6pAaFYsEySE=;
	b=Ev2IHzSQp/e4ZHbWSktOjEbNH4Qrutu7t3FQZgZAUdjLZ2w0IRzdDpE0H0/CbqWzpKlYQ9
	YoBodBX6TP/KL8N4d4CPCs7LoHILZ6KO7RZoORayqY7Bdtm+n+C1UqxpuBYqJothRojsuy
	YXhRfwcYbNxEKBIQGEpmwmMsXoiL+Q4=
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
Message-ID: <ZyvLOjy8Vfvai5cG@linux.dev>
References: <20241105195603.2317483-1-coltonlewis@google.com>
 <20241105195603.2317483-5-coltonlewis@google.com>
 <65675ed8-e569-47f8-b1eb-40c853751bfb@linux.intel.com>
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
In-Reply-To: <65675ed8-e569-47f8-b1eb-40c853751bfb@linux.intel.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Nov 06, 2024 at 11:03:10AM -0500, Liang, Kan wrote:
> > +static unsigned long common_misc_flags(struct pt_regs *regs)
> > +{
> > +	if (regs->flags & PERF_EFLAGS_EXACT)
> > +		return PERF_RECORD_MISC_EXACT_IP;
> > +
> > +	return 0;
> > +}
> > +
> > +unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
> > +{
> > +	unsigned long guest_state = perf_guest_state();
> > +	unsigned long flags = common_misc_flags(regs);
> > +
> > +	if (guest_state & PERF_GUEST_USER)
> > +		flags |= PERF_RECORD_MISC_GUEST_USER;
> > +	else if (guest_state & PERF_GUEST_ACTIVE)
> > +		flags |= PERF_RECORD_MISC_GUEST_KERNEL;
> > +
> 
> The logic of setting the GUEST_KERNEL flag is implicitly changed here.
> 
> For the current code, the GUEST_KERNEL flag is set for !PERF_GUEST_USER,
> which include both guest_in_kernel and guest_in_NMI.

Where is the "guest_in_NMI" state coming from? KVM only reports user v.
kernel mode.

-- 
Thanks
Oliver

