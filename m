Return-Path: <linuxppc-dev+bounces-1285-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C61F9766ED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 12:50:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4Djz0fvSz2yPq;
	Thu, 12 Sep 2024 20:50:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726138231;
	cv=none; b=CNYKhbVFFpxsKR6A2gJ1eidpNEks/E+nU7n0Ju1kZUV7qtOWsdC0vqHQo0Nkf2VJ4bcwIEu+U1lygzpln9JLfBDjNQLmGuJfI5K3NVzPXuhNVGcJAPFkd5tevFnj0RfAlEfu3mYUpmfhJgPgZSsczHU731qEcKAXbIfQy7ymumb4l3WWFobNWcu4dcX6xKMZ/MNe3V9dLITbw7DOE026Di//7Bk4+Q6ee4picNmEiMXVg0fC0WtnJCH+IIgGBXsY8Z2hp6sYroBhY8PAgs70dMeEQVSX6/gDplOSchjYUQGjmYhcmQAzAplz9pZ/i3H4E8lK6xV8RQjmudhgtABWeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726138231; c=relaxed/relaxed;
	bh=ucU8Q63oewK+tuS4kUnV8XmPvKsCRMTocoVPaCv29qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oobtsf1m7aYC6b/R80wzoj/ikGuI9R0EXe1T7w6e3Xs2l/xdGsaiLMpUKUnxE5LOo5S3acSsARn1QgA48d8i03XKeypoCHPe8Hc3cdxTjmRNa3jaEwvSvRt4wOGfWsloTlVNxEfMeUN2uIliDgec5UiTsM1zcHegvnd0uZZjmAInHNey/Kv1UdOlP8bn57rdNUxo7Gph+QKtTTuTvQpztLCBZgsRKQloUteFp/o9FyVs6/3fiD7rTklDR0+/rO6XmVmfiiszSZvm3biZKSpn0vQ7pbaEtBmYtBj7l6edh3kT+KDoUlTpzrSgeiyFRdCpLNOoONglPNwqeJmDEIyMLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JTtjO0Cf; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JTtjO0Cf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4Djy4Pk4z2yHs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 20:50:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6DACBA43DB1;
	Thu, 12 Sep 2024 10:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F63C4CEC3;
	Thu, 12 Sep 2024 10:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726138226;
	bh=qZoGoOh6X8sZEkgedzpNuHuqZxsxfBCZB2KTDdNYKss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JTtjO0Cfd7tkU1BMgFiga+fsrzZ9RZLla49qSZtD6IB+wb//kcv1pcCBoGV6o4I4m
	 G1wXKo0/D/uODveW0Dj266lXbV6cEBbn8DzNEx7nGus4bUNZK5XKZHYZE/cxZmjguq
	 h9sjj8h+uq8aq6VA2If3DNsj8fEoZ/PZYgilsV1hwIpsBp5q7mQ597FhFm9pCzPsmV
	 WhFLRH7P9gQzrwbFzg4HfakU6ZdPiILkcPais1me+xmBZfigLQXauBvJZx0GqSMgHK
	 M80cWMxsBzCWfU/+AfeLZt9ASKvx0eEt/Pjpfh74bKbs6F0WFUlIRAy7BMaYsMh8C/
	 HJW6qTM5+QJSg==
Date: Thu, 12 Sep 2024 11:50:18 +0100
From: Will Deacon <will@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, Joey Gouly <joey.gouly@arm.com>,
	linux-arm-kernel@lists.infradead.org, nd@arm.com,
	akpm@linux-foundation.org, aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de,
	broonie@kernel.org, catalin.marinas@arm.com,
	christophe.leroy@csgroup.eu, dave.hansen@linux.intel.com,
	hpa@zytor.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, mingo@redhat.com,
	mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com, npiggin@gmail.com,
	oliver.upton@linux.dev, shuah@kernel.org, skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com, tglx@linutronix.de, x86@kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 06/30] arm64: context switch POR_EL0 register
Message-ID: <20240912105017.GA22788@willie-the-truck>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-7-joey.gouly@arm.com>
 <425b8f8c-b6b5-422a-b5f4-41dd2d1ae3bb@arm.com>
 <6c8ad091-a56b-41ba-b403-2e3c2e578100@intel.com>
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
In-Reply-To: <6c8ad091-a56b-41ba-b403-2e3c2e578100@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Dave,

On Wed, Sep 11, 2024 at 08:33:54AM -0700, Dave Hansen wrote:
> On 9/11/24 08:01, Kevin Brodsky wrote:
> > On 22/08/2024 17:10, Joey Gouly wrote:
> >> @@ -371,6 +382,9 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
> >>  		if (system_supports_tpidr2())
> >>  			p->thread.tpidr2_el0 = read_sysreg_s(SYS_TPIDR2_EL0);
> >>  
> >> +		if (system_supports_poe())
> >> +			p->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
> > Here we are only reloading POR_EL0's value if the target is a user
> > thread. However, as this series stands, POR_EL0 is also relevant to
> > kthreads, because any uaccess or GUP done from a kthread will also be
> > checked against POR_EL0. This is especially important in cases like the
> > io_uring kthread, which accesses the memory of the user process that
> > spawned it. To prevent such a kthread from inheriting a stale value of
> > POR_EL0, it seems that we should reload POR_EL0's value in all cases
> > (user and kernel thread).
> 
> The problem with this is trying to figure out which POR_EL0 to use.  The
> kthread could have been spawned ages ago and might not have a POR_EL0
> which is very different from the current value of any of the threads in
> the process right now.
> 
> There's also no great way for a kthread to reach out and grab an updated
> value.  It's all completely inherently racy.
> 
> > Other approaches could also be considered (e.g. resetting POR_EL0 to
> > unrestricted when creating a kthread), see my reply on v4 [1].
> 
> I kinda think this is the only way to go.  It's the only sensible,
> predictable way.  I _think_ it's what x86 will end up doing with PKRU,
> but there's been enough churn there that I'd need to go double check
> what happens in practice.

I agree.

> Either way, it would be nice to get an io_uring test in here that
> actually spawns kthreads:
> 
> 	tools/testing/selftests/mm/protection_keys.c

It would be good to update Documentation/core-api/protection-keys.rst
as well, since the example with read() raises more questions than it
answers!

Kevin, Joey -- I've got this series queued in arm64 as-is, so perhaps
you could send some patches on top so we can iron this out in time for
6.12? I'll also be at LPC next week if you're about.

Cheers,

Will

