Return-Path: <linuxppc-dev+bounces-5750-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D52C4A24021
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2025 17:14:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yl1F71GNSz30Gq;
	Sat,  1 Feb 2025 03:14:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738340091;
	cv=none; b=IW9hh5zKkpQzWKsB3UX1fHLcX5j6gUMSR5oOVe59nt0nHyrVIX9Taz4UamYvL4r0Su+GYUed1GyoqShCU3VYLXHmn6HhiyUIu3FLawocCvf9mdNWfWv8xkZROdchZTMIub8DQWwdmCLlk29MAWkkT59lCHMeaq1fnUcqTW/n7iv45icCSihEP0fAe57h8aFcYoRYUV3cnQEoUjpbIvvOZE9WOuRnGbnkB3L34Tj9Zene2rdz/FCzo5Zvv1ZO0RWCGsl5oS7SgZe8N7uxqRw9XlaHX8GpGkogUCUIh3Q5Sm88Xxba3hTaA+jz+7WgPQga+kSdgpsMehyrI68XJ7VO+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738340091; c=relaxed/relaxed;
	bh=WiCy0qUsc6oXsCsP9IHNd1HnEiXvHR7unsNDOhelq4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxlS9wBd9vNYENSvS+xj7pWM8GItY25ZrrNLN6jJys1GM/Q4CBKt5JrMOsrfXBS/Tqw+C+GGhQdhxEoacESRHrDOc0Pkfztyyy7/lGnOewGySazAChzRuY5P78pWqp5Wjj8fYr7u2tIYFZSz/CGXkiOLRThIpP6F8JLCwBFzIhw1ThSbMx2KFUtvpwCqYy4PVjwcVIE3F2PGyWMkglazfa/FQRtK1RtAQa8ZMzLCJseiJrg1XTn8CubzIlolSrGuOEJhyGF1zerf/WJRwOcHpJQj0rBFXbwJIWBALTptG62qvPaytj48vE08vyzLkU8NMpr2hu0cFwoldNLXxNsl+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yl1F56fRxz2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Feb 2025 03:14:47 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 50VGDhal025541;
	Fri, 31 Jan 2025 10:13:44 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 50VGDhbs025540;
	Fri, 31 Jan 2025 10:13:43 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 31 Jan 2025 10:13:43 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Paul Mackerras <paulus@ozlabs.org>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 0/5] Microwatt updates
Message-ID: <20250131161343.GY20626@gate.crashing.org>
References: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org>
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
In-Reply-To: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi!

On Wed, Jan 29, 2025 at 09:49:49AM +1100, Paul Mackerras wrote:
> This patch series updates the kernel support for the Microwatt
> soft-core and its implementation on FPGA systems, particularly the
> Digilent Arty A7-100 FPGA development board.
> 
> Microwatt now supports almost all of the features of the SFFS (Scalar
> Fixed-poin and Floating-point Subset) compliancy subset of Power ISA
> version 3.1C, including prefixed instructions and the fixed-point hash
> (ROP mitigation) instructions.  It is also now SMP-capable, and a
> dual-core system will fit on the Arty A7-100 board.

Congratulations!

> Microwatt does not have broadcast TLB invalidations in SMP systems;

So it isn't *really* SMP.  Compare 603 vs. 604.  With enough software
(OS) trickery you can make some things work, but :-)  (There have been
many 603 multiprocessor systems as well, to draw the analogy further
than wanted :-) )

> the kernel already has code to deal with this.  One of the patches in
> this series provides a config option to allow platforms to select
> unconditionally the behaviour where cross-CPU TLB invalidations are
> handled using inter-processor interrupts.

Are there plans to broadcast the (SMP cache invalidation) messages?
Will uwatt support some real bus protocol, for example?

Again, congrats on this great milestone!  Does this floating point
support do square roots as well (aka "gpopt"; does it do "gfxopt" for
that matter, fsel?)  fsqrt is kinda tricky to get to work fully
correctly :-)


Segher

