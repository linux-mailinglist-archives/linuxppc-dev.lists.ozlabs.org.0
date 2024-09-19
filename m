Return-Path: <linuxppc-dev+bounces-1476-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BE797CFAA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2024 02:29:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8tZB1WXyz2y92;
	Fri, 20 Sep 2024 10:29:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.176
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726741463;
	cv=none; b=m552lAsIbkaOw+7dT8GgFUUf32oTTpdWQw0R1GZkAZmY1cnlLV8MjInxJprJ+Z9jIEjtWXBXVgcamDl4C3VDv0v6KQXr3u+Adai3zQFwBDs/+tZ4EDvTLAAkcZMKQc25UaXo40UdkND56TGIPbuLA4Lw1jpXDs8APTLoDSnMGWVpWsUI6olEMhkajqhyuo2IJK2v69aTIDk7qz2x9T+QzvPm9scI12sVZK1Ipxb6yi5yKwDuWYbpIvPqMUbQsBNG4+s7bpVF+9WQG5kLDAAF4mLelGvohKl5Nkp9+2UmpnMf6eR0PrmpjPOxoQUFuX36fVscez699sdCfz8u78+y4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726741463; c=relaxed/relaxed;
	bh=I1mckTS2FV38bbZ879rd+/BowKPTlDKekDspILq4S7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6yyORoKRpJJiXlXp18aIRfpPdQA/Vhv6EYrYqqH3XPlHW59vMNTl3XucLfYROY2FB2J+An7wYdPLQQmMuBI9cXXF2MZtfw4iRq2BxyVD89pyiIcPdREcMdKtulttM3kurjE91xjSNtmp02MM2Yu+1HvzG5rYAGef5zjy2xRmx1xfC6nzgugSIHacWPjfi9yKSI1cMm7yAF27kba05jqeGHbOXqK0N/uusGQ7f/ts0+YdzSiZ6u35EUPPxQ8ohVu28v62T8PZfcCThwj53hj9GzOCvelC/flv5XQ/dVNnLAIIv6P6q04CK1o2r68CzXN9xZS0jdQ/+5/dJoF8SUxrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=D6x6BKht; dkim-atps=neutral; spf=pass (client-ip=91.218.175.176; helo=out-176.mta0.migadu.com; envelope-from=oliver.upton@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=D6x6BKht;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.176; helo=out-176.mta0.migadu.com; envelope-from=oliver.upton@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 361 seconds by postgrey-1.37 at boromir; Thu, 19 Sep 2024 20:24:20 AEST
Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8WpX4jNxz2xtp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 20:24:20 +1000 (AEST)
Date: Thu, 19 Sep 2024 03:17:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1726741064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I1mckTS2FV38bbZ879rd+/BowKPTlDKekDspILq4S7U=;
	b=D6x6BKhtU1AsDKi/4KqvcONlUrTfddheLB6mjS/liWOZikXBBbl320OPz8mgGIKM4WllXD
	+wY9aYHdLlkmHh4egDXFCzDa+mmurZ3C2W/5Yn9b7oeoiOBTG25PlxVj4C73Kx3idnOFp+
	Vxq68Xs1nMkSJWGZkP3uhgfHcFJ6DPg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
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
Subject: Re: [PATCH v3 0/5] Correct perf sampling with Guest VMs
Message-ID: <Zuv6QveQAHZ9H0HP@linux.dev>
References: <20240912205133.4171576-1-coltonlewis@google.com>
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
In-Reply-To: <20240912205133.4171576-1-coltonlewis@google.com>
X-Migadu-Flow: FLOW_OUT

On Thu, Sep 12, 2024 at 08:51:28PM +0000, Colton Lewis wrote:
> v3:
>   * Clarify final commit message further
>   * Remove an unused variable in perf_arch_misc_flags()
> 
> v2:
> https://lore.kernel.org/kvm/20240911222433.3415301-1-coltonlewis@google.com/
> 
> v1:
> https://lore.kernel.org/kvm/20240904204133.1442132-1-coltonlewis@google.com/
> 
> This series cleans up perf recording around guest events and improves
> the accuracy of the resulting perf reports.

Please fix the intermediate build issue, and also test that each patch
in the series compiles. With that corrected, for the series:

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

A nice follow-up on the arm64 side would be to further constrain
kvm_arch_pmi_in_guest() to return true iff we exited the guest due to an
IRQ.

-- 
Thanks,
Oliver

