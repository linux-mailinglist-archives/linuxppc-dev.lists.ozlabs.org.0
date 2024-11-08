Return-Path: <linuxppc-dev+bounces-3063-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EE89C2594
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 20:32:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlTbj4PlYz3bsJ;
	Sat,  9 Nov 2024 06:32:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731094337;
	cv=none; b=F4G4Vk/Cx+EvBH8ZdEB3fyS5pAeiSWQDzlvy3+AWLRmYDAqPUI6+O2T9Uxqw9g/1Yh45d7eLKRKo6HklbLV94DAA5lV5NcM3yhX4iG4q3yIAtStr/ablI1/k3IGHV5PY3eoT0zgSrNQK8IxjsO7PqqsW5VTfzkwz2oP6azDWVfvFZOY0F7As5ahyPlBAg3qzgNRRA1vQdk6BwszCck6b7tzg8x4GrQ96qcPExELgez5cnHE6i1etglJVc4sKYjYn6LOGjWGq4NTim9ISPPUfd86aqSaSqJ29HgXJ1mKMTPRreseCbv7XFu7ucOlnApSseSFsQeGZnk43oTfg1D3fEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731094337; c=relaxed/relaxed;
	bh=qFRzNI5DfFiu+JYAcGStf7GLEGzYk/QY4lQcntQCySg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODPPaywFz31nySb4QEv9Q4wPpk5sBQODmgIPRIn2/91dHCkO95SwNsI76Bbw3j37KBI46eFKIOkiJCav7+EGhz2HnvKgny3gQG78u04YCAyTVG1lbBmQ2LwyWu1m5m+giX5LIj8cPyGzwd1pvL/bYmvSEyhtzaMwvuseOwadTqyCClxvt+YEz+gfwSKPaZon4xGCDKtt4Oi0/V+bL3bVaBSAVKQ2VbUeg8t7C6AnmC7c4zsciKdINHm5p+vcEQqg5y7tK9FHzO/rHiRMhFRay0YFYnnFLYA3lr+dCrWO7m1/QMKqgJ4Jk4DKWwYV1PTwAQ+Ze0Ywoidi1TlPsOm4dQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=lGL3ULaR; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=lGL3ULaR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XlTbh3ygmz3brZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2024 06:32:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qFRzNI5DfFiu+JYAcGStf7GLEGzYk/QY4lQcntQCySg=; b=lGL3ULaRWdu2Akw/Y19it6Q3jM
	KWv9cmjXIpe6/WiQu6YsBZMXv1uaS0zwkhcynAZrHTwSFJOVBPXXo4c1X29Xy6tueMv5xE/uyvVqz
	UUSk1AybdlMyGzga//U4/q11RBKsGYyVkcwtgTxpd2ugk+q6M/ObL7CiLXI9GFqWJcBf8KpUFVOor
	JJisCsf4ptpseER9AR99Dkmj1EgzlqpFgyC0qMHZ4omO+cZsK9k4iXYv0egBdueiNadO6BtpC9Aej
	W6Gz7heyDXFtfAz87U4uAKFlERlD81b6510jyZ8GCPYKZtiq96hg42aJgYQILimrMa8cGlF8yhANA
	J3K6+ybA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t9UiC-00000009EL1-1dYM;
	Fri, 08 Nov 2024 19:32:05 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9556130049D; Fri,  8 Nov 2024 20:32:04 +0100 (CET)
Date: Fri, 8 Nov 2024 20:32:04 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, oliver.upton@linux.dev, seanjc@google.com,
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, will@kernel.org, linux@armlinux.org.uk,
	catalin.marinas@arm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, naveen@kernel.org, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com, tglx@linutronix.de,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v7 4/5] x86: perf: Refactor misc flag assignments
Message-ID: <20241108193204.GC38972@noisy.programming.kicks-ass.net>
References: <20241108153411.GF38786@noisy.programming.kicks-ass.net>
 <gsntbjypft37.fsf@coltonlewis-kvm.c.googlers.com>
 <20241108192043.GA22801@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20241108192043.GA22801@noisy.programming.kicks-ass.net>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Nov 08, 2024 at 08:20:44PM +0100, Peter Zijlstra wrote:

> Isn't the below more or less what you want?
> 
> static unsigned long misc_flags(struct pt_regs *regs)
> {
> 	unsigned long flags = 0;
> 
> 	if (regs->flags & PERF_EFLAGS_EXACT)
> 		flags |= PERF_RECORD_MISC_EXACT_IP;
> 
> 	return flags;
> }
> 
> static unsigned long native_flags(struct pt_regs *regs)
> {
> 	unsigned long flags = 0;
> 
> 	if (user_mode(regs))
> 		flags |= PERF_RECORD_MISC_USER;
> 	else
> 		flags |= PERF_RECORD_MISC_KERNEL;
> 
> 	return flags;
> }
> 
> static unsigned long guest_flags(struct pt_regs *regs)
> {
> 	unsigned long guest_state = perf_guest_state();
> 	unsigned long flags = 0;
> 
> 	if (guest_state & PERF_GUEST_ACTIVE) {
> 		if (guest_state & PERF_GUEST_USER)
> 			flags |= PERF_RECORD_MISC_GUEST_USER;
> 		else
> 			flags |= PERF_RECORD_MISC_GUEST_KERNEL;
> 	}
> 
> 	return flags;
> }
> 
> unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
> {
> 	unsigned long flags;
> 
> 	flags = misc_flags(regs);
> 	flags |= guest_flags(regs);
> 
> 	return flags;
> }
> 
> unsigned long perf_arch_misc_flags(struct pt_regs *regs)
> {
> 	unsigned long flags;
> 	unsigned long guest;
> 
> 	flags = misc_flags(regs);
> 	guest = guest_flags(regs);
> 	if (guest)
> 		flags |= guest;
> 	else
> 		flags |= native_flags(regs);
> 
> 	return flags;
> }

This last can be written more concise:

unsigned long perf_arch_misc_flags(struct pt_regs *regs)
{
	unsigned long flags;

	flags = guest_flags(regs);
	if (!flags)
		flags |= native_flags(regs);

	flgs |= misc_flags(regs);

	return flags;
}


