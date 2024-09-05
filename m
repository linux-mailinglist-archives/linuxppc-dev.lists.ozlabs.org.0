Return-Path: <linuxppc-dev+bounces-1049-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C67696D679
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 12:55:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzx9M37Ysz2yn2;
	Thu,  5 Sep 2024 20:55:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725533751;
	cv=none; b=FJohvJF0GZ9MTxlo30qY8chKQSQo2ri+YRf3/OqljsU8nlajCPzdGSDQOfndKEhhB/jlw1gbO1wZ9KOI3zL4neoOtfvBAz9380t9QqjRh8sXJxmJv8OCIouj1B1jGk97skkXVmc2ZD4RUvh2zfgHqzIB8ZRxkXtK8Cqh7M0lssEL8R5J/zaSb0L4kxvhelPmY1/oUzNUsSPFxA10BXu7gfgUSYZWIHj3k7gF6c1dANSF89WwmctDPzdfJvaU80k9isTqS/44232Q0dCb/2QSPy9lI3yLv+FM7HL3I3tFbRjpMuK0BNESJ35UE0aSqxACOfcw9xij3tIC+n6xj3OYmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725533751; c=relaxed/relaxed;
	bh=0I+vYz8UkJxcnFtcjyD4u+rUxXugQFGuDfHrR5zjsYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6F6MkEo0yvE35YihQaFztdCHNf3ANadx++kYsY+8fO8/7yvQfNYjWGXvNpxle+JbRBpyUtxJp1dCYo5CEuoyyP0+XAJ0/8TuTPzOsyCNj0F/738f9NI3aLh8/0SjIqGwSjWmopDRfzIC6jiBu9ps3THFsDBTGXvPeFRB3dgnpPTHtDpPbt3GbCuGALQoWfs4kMvO/6VeyzHMH4Wswg1lxUz/7s2qt6EwfV2WuNUYnPIn0zhK0ug69Cb8HSDV3rZ1U59osD8kgXtRP0eE2ir1qDpMCAfW54/PpTEUuwJ7gfL6aighgBGZ62frwJM5Q870j7FzYgNU8FQtMiSC5RgLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzx9M1blgz2xY6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 20:55:50 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53A49FEC;
	Thu,  5 Sep 2024 03:55:46 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C85F3F66E;
	Thu,  5 Sep 2024 03:55:14 -0700 (PDT)
Date: Thu, 5 Sep 2024 11:55:12 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>,
	Sean Christopherson <seanjc@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
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
Subject: Re: [PATCH 5/5] perf: Correct perf sampling with guest VMs
Message-ID: <ZtmOENs5qveMH920@J2N7QTR9R3>
References: <20240904204133.1442132-1-coltonlewis@google.com>
 <20240904204133.1442132-6-coltonlewis@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904204133.1442132-6-coltonlewis@google.com>

On Wed, Sep 04, 2024 at 08:41:33PM +0000, Colton Lewis wrote:
> Previously any PMU overflow interrupt that fired while a VCPU was
> loaded was recorded as a guest event whether it truly was or not. This
> resulted in nonsense perf recordings that did not honor
> perf_event_attr.exclude_guest and recorded guest IPs where it should
> have recorded host IPs.
> 
> Reorganize that plumbing to record perf events correctly even when
> VCPUs are loaded.

It'd be good if we could make that last bit a little more explicit,
e.g.

  Rework the sampling logic to only record guest samples for events with
  exclude_guest clear. This way any host-only events with exclude_guest
  set will never see unexpected guest samples. The behaviour of events
  with exclude_guest clear is unchanged.

[...]

> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 4384f6c49930..e1a66c9c3773 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -6915,13 +6915,26 @@ void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
>  EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
>  #endif
>  
> -unsigned long perf_misc_flags(unsigned long pt_regs *regs)
> +static bool is_guest_event(struct perf_event *event)
>  {
> +	return !event->attr.exclude_guest && perf_guest_state();
> +}

Could we name this something like "should_sample_guest()"? Calling this
"is_guest_event()" makes it should like it's checking a static property
of the event (and not other conditions like perf_guest_state()).

Otherwise this all looks reasonable to me, modulo Ingo's comments. I'll
happily test a v2 once those have been addressed.

Mark.

