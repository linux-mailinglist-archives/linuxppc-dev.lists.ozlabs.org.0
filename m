Return-Path: <linuxppc-dev+bounces-5757-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10678A241E1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2025 18:27:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yl2s96frHz30Vk;
	Sat,  1 Feb 2025 04:27:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738344461;
	cv=none; b=A05j6jG3Szb5pkurURxFGo1e308ubvDz1dlERaCb+0QFe4cVnixB2BE89sVeSyD6IrJjOUdLBpWRsGStOqfghP3yzgm8uW98j1vUywGrTfaOGwQXg5efnhC6rAq9Ob4GWvmw+mv6Hp7vlJbVIxzfKv1qqpyaZ7Irbpff/VmMb+t8EGZUZxDNnC+PA3Y8NsM8Wxrxtkw1dKTWuubt0X6rMBIsEpF3XbbndrR7V2RpEe6t+ywmFDCGovtpSbbKmxAo2D3l+TetmV+DtV5LKEUFZwdTuA2WNnhz6SXVp9avFIQXrLtahgYnekPwafaPsvcAI+qiz/2x1rhx9rWvDnJGjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738344461; c=relaxed/relaxed;
	bh=7/DAB1ks3lKI8Bq5mn4V2TLaEnA63Y1GxoZAeug6U5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RCjA7XJ2bQkrqqFtQzdGokaaqArbOcoqLpswBb1vFJQk5M+FWgy8QhBbDs4vD7J9KBMB9WQy0FQqrMRNTII73F8KQ6NeedIEw5jh7a/ZCL+CZfYLD/3wQWUPNvkUqQ8SdRTDH6Y53nMxr0u8YqEkrh4SwECYiLq6h9Q03YRIWT+Ba1/l/PVD9Wx58xOMIppSoHfvjdHL3MiaIHPGJAHVon3fBqXjiPSToljyf5lLNLydZIu23kR8mDHWHMV6tVJLBh7LgAolukUZ0Fvb5M50uEwrVc1EvZauNK7UoDWmd58Q0h9U9kqWjbFa7DuRR6QVINgkYpxp59QF7bk1LDq9qA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yl2s80FqTz30Vj
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Feb 2025 04:27:39 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 50VHQbYS031080;
	Fri, 31 Jan 2025 11:26:37 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 50VHQaqp031078;
	Fri, 31 Jan 2025 11:26:36 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 31 Jan 2025 11:26:36 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Paul Mackerras <paulus@ozlabs.org>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 4/5] powerpc: Define config option for processors without broadcast TLBIE
Message-ID: <20250131172636.GF20626@gate.crashing.org>
References: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org> <Z5lf-OrrbRe5Q0O-@thinks.paulus.ozlabs.org>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5lf-OrrbRe5Q0O-@thinks.paulus.ozlabs.org>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 29, 2025 at 09:53:44AM +1100, Paul Mackerras wrote:
> Power ISA v3.1 implementations in the Linux Compliancy Subset and
> lower are not required to implement broadcast TLBIE, and in fact
> Microwatt doesn't.

But this pretty much means that such systems cannot be SMP systems at
all.  Implementing the necessary synchronisation using some
cobbled-together rickety jury-rigged contraption is not anyone's goal.

Interesting that you did not see any performance loss, btw!  Well you
didn't try it on anything bigger than a simple dual CPU :-)


Segher

