Return-Path: <linuxppc-dev+bounces-2934-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 457199BF7B6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 21:01:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkGLp62yZz3bd4;
	Thu,  7 Nov 2024 07:01:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.180
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730923314;
	cv=none; b=Nz11Mglb0vvU55fCBRhn1hMIZBTuF1472z4OqaXext3shtCfuRxFf55NeprrEqij6BCFWxr2PcJ+Fo6mdtx2M8xfMG4zGH8CW2VQpqeXnAlEVUkUxA5fs9BuvQ/2APkTKMfgJ/QdMF+tetruMegLjJi++rLbTKKBlm+CRs5w1UC9geGhOU9tSuFj68gdj7+Y4tcU9X2Id/PO9BSX5TxG3rw7Qqvo5HRlxw8WBKy/SyPqhwHG+t2NZ71Qwb0epfS/hFocZtvBTypyIInig/TzFQt4t08aoSUjV4BTPartKcmixQJ7SSjGzcMo0yNi3iu6xwlJCRGYyKRcaewpSL8vRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730923314; c=relaxed/relaxed;
	bh=uIYHrYeDhg7kNxYUdjNDrUK44gnqtUzRYj+2b/H+nmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbzAF/Of48y/pvgX4ZSJ0wts+7Jhs5ADLv74CVps0wJLvJwaQ5JUgFwIQWHDNRMvZrOcTC2wm3c2+ESGjiIkvyYQrhEQcj+gqLnsHc4Y3shguWflrstKQoLjbsuDODOhp4w+GgNq9mdwA7QA42atBxcb7YX2NHkJS+N0PQfZoS+YinvwuBoWJN90tLA/ibECfLEeS4Z0qVOIGIyp/L0w5ebDArAbUhjWoBW69h9T2a3hodW38Mfu49DDkEyvUqK/7wh2GRzyQZzUs1OuWBXV+xQQ+0i4E5QEGk1iZr5RpIbGTKvDYcmqmG4M+jWP4P90DFQQ/DngdC5HYXVHvScJPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=azPQPKMc; dkim-atps=neutral; spf=pass (client-ip=95.215.58.180; helo=out-180.mta1.migadu.com; envelope-from=oliver.upton@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=azPQPKMc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.180; helo=out-180.mta1.migadu.com; envelope-from=oliver.upton@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 470 seconds by postgrey-1.37 at boromir; Thu, 07 Nov 2024 07:01:50 AEDT
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkGLk4bfWz3bd2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 07:01:50 +1100 (AEDT)
Date: Wed, 6 Nov 2024 11:53:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730922800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uIYHrYeDhg7kNxYUdjNDrUK44gnqtUzRYj+2b/H+nmQ=;
	b=azPQPKMcRZ7n0haevtf+gW2LUqUgNTZ0txSbzF62ESJFFuZ5O81yldkwxJtbt9eMJ9rYhP
	N+C8TyY7NMWCBJoFUX2fQEo2lLIcOBBEbEAiDRA7VK/RvAEm4WY0TpFGNaZYNkz2wLfxEo
	3CDxbqePxlmasgDPRU9wm5HtPnrmBuo=
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
Subject: Re: [PATCH v6 5/5] perf: Correct perf sampling with guest VMs
Message-ID: <ZyvJIx-UHXawnUYs@linux.dev>
References: <20241105195603.2317483-1-coltonlewis@google.com>
 <20241105195603.2317483-6-coltonlewis@google.com>
 <007cfed1-111d-45aa-b873-24cca9d4af01@linux.intel.com>
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
In-Reply-To: <007cfed1-111d-45aa-b873-24cca9d4af01@linux.intel.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Nov 06, 2024 at 11:07:53AM -0500, Liang, Kan wrote:
> > +#ifndef perf_arch_guest_misc_flags
> > +static inline unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
> > +{
> > +	unsigned long guest_state = perf_guest_state();
> > +
> > +	if (guest_state & PERF_GUEST_USER)
> > +		return PERF_RECORD_MISC_GUEST_USER;
> > +
> > +	if (guest_state & PERF_GUEST_ACTIVE)
> > +		return PERF_RECORD_MISC_GUEST_KERNEL;
> 
> Is there by any chance to add a PERF_GUEST_KERNEL flag in KVM?

Why do we need another flag? As it stands today, the vCPU is either in
user mode or kernel mode.

> The PERF_GUEST_ACTIVE flag check looks really confusing.

Perhaps instead:

static inline unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
{
	unsigned long guest_state = perf_guest_state();

	if (!(guest_state & PERF_GUEST_ACTIVE))
		return 0;

	return (guest_state & PERF_GUEST_USER) ? PERF_RECORD_MISC_GUEST_USER :
						 PERF_RECORD_MISC_GUEST_KERNEL;
}

-- 
Thanks,
Oliver

