Return-Path: <linuxppc-dev+bounces-9260-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D0AAD43FB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jun 2025 22:35:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bH0sv5p8Jz2xKN;
	Wed, 11 Jun 2025 06:35:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749587731;
	cv=none; b=n18IUJ1mVDm4Kl8+W/PMsPP2WI/jn1euBdEWfbT07nYXpD/ipw9dhzzYH3AML/h/B4e7LYq3VgTCT5+6dkqwp/XysisbAfowHwqQOI8BgVXInhO7eIRFSkaDpSMUwhM09lhmP+3JxElWKAF7oejQnPGi/wEhqv4cuOQ5akPTyP/m8sWmQrxW0r08xGw1jtWzqygFzzVHrL5vbHqZdSnApbcQm2nRyl5OIbpsQzslztbHQWBk1r+RY+W7Ajl/WEbymf306IzMiKeaj4o65Q+14wMFCINAYcO0rHSZ0gYsqL6lpInGGD8zP5W8QLEp7K47qKPQ6nv30UHdKOJt2UyCtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749587731; c=relaxed/relaxed;
	bh=Qx0QvJezvuySJGIsBTnteN7rFHDhZEq+cApsVCEeJBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DjAP4dEyZPMep1Vr4e+qolgN8ZSVPpLM/Mo3/fDm/1gVAr4VvPVtYk8lLjUCGZCwgLlRpGT7BY9RBq4SlKKEThe1GtEMzosQLOlexy05H01rzaZ31kCk25cVzI1nqJdXv4kujP2YASE8g4Le65PyD3x9dGziUcwqgXwsny8OiokJ8HGsMqnPBdM5nyDcQ84w4o8ZBVHFBG5vm01L/vGPOW95jt17rHY3r2B48WZBd1+vxN2OSPVteZeJluwCWpY1kRjMQFFnzj0hDdXh/k8saRFrG3st8KeWdiFIJNOU+K++RDaPU5zdC6JyrPaPWVrxj8N+Tyd17lgtD78cLsxn5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bH0st3xbmz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 06:35:30 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 55AKQZsT017078;
	Tue, 10 Jun 2025 15:26:35 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 55AKQYDg017076;
	Tue, 10 Jun 2025 15:26:34 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 10 Jun 2025 15:26:34 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Thomas Huth <thuth@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Geoff Levand <geoff@infradead.org>, Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH v2 2/2] powerpc: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
Message-ID: <20250610202634.GG30295@gate.crashing.org>
References: <20250610160128.69033-1-thuth@redhat.com> <20250610160128.69033-3-thuth@redhat.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610160128.69033-3-thuth@redhat.com>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jun 10, 2025 at 06:01:28PM +0200, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> While the GCC and Clang compilers already define __ASSEMBLER__
> automatically when compiling assembly code, __ASSEMBLY__ is a
> macro that only gets defined by the Makefiles in the kernel.

And it should not, the kernel is not allowed to define any symbol
starting with two underscores at all!  Including __ASSEMBLER__ yes.

> This can be very confusing when switching between userspace
> and kernelspace coding, or when dealing with uapi headers that
> rather should use __ASSEMBLER__ instead. So let's standardize on
> the __ASSEMBLER__ macro that is provided by the compilers now.

"Now"?  This is true since at least 2003, and probably a lot longer
already.


Segher

