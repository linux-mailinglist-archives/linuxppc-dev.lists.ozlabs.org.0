Return-Path: <linuxppc-dev+bounces-11067-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40713B28404
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Aug 2025 18:42:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3SZD12Gdz3cj2;
	Sat, 16 Aug 2025 02:42:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755276132;
	cv=none; b=fJI7KhH+ieyiq7LaoEx0PXEjJqaItj5hkYGycySSWkxfymefnCTKfjb6NEIHV33zhzHCfmQM4UExRIavPa7le9i3Nc48YG+m9Bc/IforUBt+iv2zUgHqjljkjHgNZzYrkjzJ43qGGYGErMQb9AN/UXkHiDur7+VOxmNbf6YOE5ZMwenny5oHuQSHx65uDLU4DU3lGBodwZ26qNJ52s+edmZM/E2sPkDbXBdFk4EXEGvdQRYYx7P3PTdjlwgycQnVU88lvF+GCMn3+iscAq6zyux9oYKCP7YK6rN65sOePhfft9ScjJSce37L4wkBLM3UMNILmcH9bQlnnA2acgPtMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755276132; c=relaxed/relaxed;
	bh=BquL/1ipLaX4XWyjT/uo2tA/vPb810ovEmCNimzzD3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KN802R9kRyScYth14oDzUj1W35HXPSUq47DGK0lMgrVhOW0e4VsbwORgqPmtd4sjxmhYQnpOeUSGFkB3zb2yT2dfwmRrvMn8u7JGUUl8YJuG5NV6DQ+G3kQo0k4D09d/EjK8T+mid6eQ5+yij6V5jSpvqT0FfHW42W8Lx6JVVBf/m5MIE9Y7ZA/bBaxcLh47gYuvNm5s1bgKJrePHi6D2mKi+6YuRL7qwjPygcytz+d7IVDgNcsYLGGPOk4eTTlic9vzTUQIzvOoVvPtf6hAviHppa/Y84JbFiKpaJXG4tD9aAHhXMOsBGD0ZukxhYHcs4PUHWEGCNV0KMqJYvZYpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3SZC2GM1z3chb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Aug 2025 02:42:11 +1000 (AEST)
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 57FGg0P42568454;
	Fri, 15 Aug 2025 11:42:00 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 57FGfxjE2568453;
	Fri, 15 Aug 2025 11:41:59 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 15 Aug 2025 11:41:59 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Kees Cook <kees@kernel.org>, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 05/17] powerpc: Add __attribute_const__ to ffs()-family
 implementations
Message-ID: <aJ9jV80oYG6rPN1o@gate>
References: <20250804163910.work.929-kees@kernel.org>
 <20250804164417.1612371-5-kees@kernel.org>
 <7f4f4d07-38f7-444c-adff-ec2a2387e86b@linux.ibm.com>
 <aJ9hsHj9lsHvvhcA@gate>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJ9hsHj9lsHvvhcA@gate>
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Aug 15, 2025 at 11:34:56AM -0500, Segher Boessenkool wrote:
> On Thu, Aug 07, 2025 at 03:16:35PM +0530, Madhavan Srinivasan wrote:
> > making them eligible for compiler optimization.
> 
> You can instead use GCC for this.  __builtin_ffs () exists since 2003,

Erm, 1992 actually, but stuff has moved around since then :-)

> and has this attribute built-in, as well as tens of other optimisations
> that the kernel thing misses.
> 
> Of course using existing stuff instead of cobbling together something
> half working prevents you from having a lot of fun ;-)


Segher

