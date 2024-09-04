Return-Path: <linuxppc-dev+bounces-993-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F228996C3DA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 18:18:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzSMl69Cgz2xfR;
	Thu,  5 Sep 2024 02:18:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725466691;
	cv=none; b=dKFU+J+7R96OxBByDVjeRJ6b6JrGd8lCIpSzC6ZLg1zglI/mE0cHslCi7HG2humrYKtlEosjNKea/q0O//3Kw/ycMgdKgJ5P/Da8wYgtGEX3XVEuSM3WyeFTO4yGQVdZT+1vudfi6jwKzyam2iQWUBZz6OWm/j/PxF5F53ZgkUO3yFTGMz2+JbQTPoudcZf4eWOWsOMaRlG2CKHB/cfgnbq3uGFfzaZjX3oC9mT4S1nvSizudv5KKLHnI86on5eWIhs5Izl4rnQN9mBbJoO3T5UQRZqBD49XQu/Rg2KafVxcuD3P0DeLptyJBY+JpdbzwgDy4K2z7mnzNvPwtz66kg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725466691; c=relaxed/relaxed;
	bh=/oHidZWO9xt9WoOr2i5rj/lmBgUiAqWA/fQYKy8dLcs=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=nYAqv5eQSzhFOG/M2rH2vluul2GD/P7K16R2NIw2CJ2jv5X+LrWtbikt5U1gR0z87MJDHC4CmPLaY07vwBMz5l9Otm0nbhOW2RnEqVCkY4nTYI70UFxlavE6oaetrIkJlQZGuPOorZ7B7acbH/oiSqrZ7VqPi2THTq2VHKz1qyEHWN5WZvepAf2Bm3j32sb55Xn/JTtTUU0/hIhwx5NbYWJDjTeb9nEbTsctztvq5fbWtFy68Mj7/wm9cTgERsnF3CHhRi91ZqzrlutR4RWGwK0tnJUuNcv2mioNKkBfNwOurNbH+SQHQ6zaWJXQ0k6FFdGcJ7un7ycXgmXFdNPfQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AKFvAnS4; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AKFvAnS4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzSMl4KCbz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 02:18:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 04647A42694;
	Wed,  4 Sep 2024 16:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12FC5C4CEC5;
	Wed,  4 Sep 2024 16:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725466686;
	bh=DWcEOGL96hUD6X+485HhnxfMINMh+YmkfVOIwpbbpYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AKFvAnS4VzVPVcU0kTh73wMC4toZ01I4tyglrkwgCzoFCMyaU94FmsNPifaeDTq/e
	 /S9R4xJgHIzXEVb0dN86Z3aQS7irvg749YZlYq8JOFAF/GznaVa5Q3h8zP0BjAWTb+
	 S/dKvplcQ1CIJZbyFNY3IwgngrcKjH8xrR8+HzIRsr2gxTsDWGKLGAmXxZXHY9i47J
	 ugMn7HhA4o5dtzevsYYMhsnKNl/qLFMhf6V9y8FdJUr6Tyd6V/udO1l07rxZuaRtcg
	 SBRjqfWbZWJL4fgF6Pi4WYENijZrH6NFX7AGuT0PeGN9VILf5Xpdb5kRDldsz2EOGt
	 y4578KvQYJzFA==
Date: Wed, 4 Sep 2024 17:17:58 +0100
From: Will Deacon <will@kernel.org>
To: Joey Gouly <joey.gouly@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, nd@arm.com,
	akpm@linux-foundation.org, aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de,
	broonie@kernel.org, christophe.leroy@csgroup.eu,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, mingo@redhat.com,
	mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com, npiggin@gmail.com,
	oliver.upton@linux.dev, shuah@kernel.org, skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com, tglx@linutronix.de, x86@kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 06/30] arm64: context switch POR_EL0 register
Message-ID: <20240904161758.GA14323@willie-the-truck>
References: <Zsi7ovLOfuFdfuuz@arm.com>
 <20240823170835.GA1181@willie-the-truck>
 <ZsjXtE7Kg0LQwNAL@arm.com>
 <20240827113803.GB4318@willie-the-truck>
 <ZtYNGBrcE-j35fpw@arm.com>
 <20240903145413.GB3669886@e124191.cambridge.arm.com>
 <20240904102254.GA13280@willie-the-truck>
 <20240904113221.GA3891700@e124191.cambridge.arm.com>
 <20240904114301.GA13550@willie-the-truck>
 <20240904125503.GA3901671@e124191.cambridge.arm.com>
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
In-Reply-To: <20240904125503.GA3901671@e124191.cambridge.arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Sep 04, 2024 at 01:55:03PM +0100, Joey Gouly wrote:
> On Wed, Sep 04, 2024 at 12:43:02PM +0100, Will Deacon wrote:
> > Right, there's quite a lot I need to do:
> > 
> > - Uncorrupt your patches
> > - Fix the conflict in the kvm selftests
> > - Drop the unnecessary ISBs
> > - Fix the ESR checking
> > - Fix the el2_setup labels
> > - Reorder the patches
> > - Drop the patch that is already in kvmarm
> > 
> > Working on it...
> 
> Sorry! I'm happy to rebase onto some arm64 branch if that will help, just let me know.

Please have a look at for-next/poe (also merged into for-next/core and
for-kernelci) and let me know what I got wrong!

For Marc: I reordered the series so the KVM bits (and deps) are all the
beginning, should you need them. The branch is based on a merge of the
shared branch you created previously.

Cheers,

Will

