Return-Path: <linuxppc-dev+bounces-468-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8F695D40D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 19:08:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wr63h21Ftz300M;
	Sat, 24 Aug 2024 03:08:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724432928;
	cv=none; b=ibZIOE1Fjd9n2tChFGY/zEMKx9Ky85oCHnUfA4/zlXec6WEf50kn6M//YRn/+dt3WmzdWFMU9c7zMs/eJgG4xENbUPsbIvECt1Zyz7dnB08CP3NR6Ao+J4uTFsJsUuNHlrQvr4AeLHP8S4zr5O/O2epd5AizoPufQGGG8m9BoA2iFBXA9PCaYmz6/pRbM5N5v3xR6Tnoh7aPSZehl7n0GL1XJlmob6yiINuSQX7fgKD3CHXsj8DH9Zyi1wXJVZ5jZw634NZeCQQpOQudJDxG3x3Kjv40yhPBCQKM8Mo6M/v8iMQ8g8bUmMFGp/9847KPRZK0y57E5m5PLIVw0YdLlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724432928; c=relaxed/relaxed;
	bh=ln8zCAp2BKtK4D9ABYeu9MpiwqvQQYwtrKiCWQN+Q4w=;
	h=Received:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent; b=SMhRfsLNyx5QvEeTid+Y5SV8INbu8oFtNKRByaKE2lSgkoEj9a1UjZU3RjzxbWqrhvBlroEQC41sLBiyb4iTeovVlYdDh1OSHU9K86/x2Yge40Sradz17oY8Gyu8B9vKMZFyqRNp7Uq70Bgw2JjrrV/o3IYt4u3QVrbTTkyu/fHbSzXe8yizL+SiDwXGyBjAxPtbLz17t+eoCo1rRj+74qKz/So+nR3y3Jsly/7YrBN1yQ2uokbknuCi1UM6JT9tCayTXvnN0eV2hXk8gS/Yer9zg6hSaWefUWvCofLkPGSX3xeTYjbQvpAp00LZtVfWRGA4FKfMzeV+/TChYh+6Iw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fMDDMyCO; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fMDDMyCO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wr63g6b8Zz2yx5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2024 03:08:47 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7646860B54;
	Fri, 23 Aug 2024 17:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D713C32786;
	Fri, 23 Aug 2024 17:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724432924;
	bh=RihPOGh9p93UyuuiwT2FCbCPYyy1oUyaWOUKpt8j+K4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fMDDMyCOPVaR0lNY9h3NbsHg2Bdt69cwbY79/e6UXmXBU5kM9OfPR8wvBL7llF20P
	 4DAQH9IlKKaP662nLGdhQeBT15sTV8EuWxAkbewdCzRnX7moXjhl60oy28w6PIN1up
	 M7u16xXP7PxQzHcK6CmgYx/mbU0XxD2Rr9ABpZeQk193rmnHV78uERlqK0Pf1QkoFl
	 9rgDnGWcKdC7M8DMgdfRQxN/+zEZ6xOhtnKDPlPHghDbwwXH6FqIsjlhqeTEBYFNKC
	 WIyQSGTSRuHjVeYzUziQ0SMR09W61Qn6ZfAQfwsVYOzqdgMYpfHJLnU3hc/S0GKZCX
	 AgsBhEuIYFm/A==
Date: Fri, 23 Aug 2024 18:08:36 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org,
	nd@arm.com, akpm@linux-foundation.org, aneesh.kumar@kernel.org,
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
Message-ID: <20240823170835.GA1181@willie-the-truck>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-7-joey.gouly@arm.com>
 <20240823144531.GH32156@willie-the-truck>
 <Zsi7ovLOfuFdfuuz@arm.com>
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
In-Reply-To: <Zsi7ovLOfuFdfuuz@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Aug 23, 2024 at 05:41:06PM +0100, Catalin Marinas wrote:
> On Fri, Aug 23, 2024 at 03:45:32PM +0100, Will Deacon wrote:
> > On Thu, Aug 22, 2024 at 04:10:49PM +0100, Joey Gouly wrote:
> > > +static void permission_overlay_switch(struct task_struct *next)
> > > +{
> > > +	if (!system_supports_poe())
> > > +		return;
> > > +
> > > +	current->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
> > > +	if (current->thread.por_el0 != next->thread.por_el0) {
> > > +		write_sysreg_s(next->thread.por_el0, SYS_POR_EL0);
> > > +		/* ISB required for kernel uaccess routines when chaning POR_EL0 */
> > 
> > nit: typo "chaning".
> > 
> > But more substantially, is this just to prevent spurious faults in the
> > context of a new thread using a stale value for POR_EL0?
> 
> Not just prevent faults but enforce the permissions from the new
> thread's POR_EL0. The kernel may continue with a uaccess routine from
> here, we can't tell.

Hmm, I wondered if that was the case. It's a bit weird though, because:

  - There's a window between switch_mm() and switch_to() where you might
    reasonably expect to be able to execute uaccess routines

  - kthread_use_mm() doesn't/can't look at this at all

  - GUP obviously doesn't care

So what do we actually gain by having the uaccess routines honour this?

Will

