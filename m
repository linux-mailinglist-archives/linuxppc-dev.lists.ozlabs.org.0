Return-Path: <linuxppc-dev+bounces-5758-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BA0A241EA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2025 18:32:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yl2yg1zGxz30Vj;
	Sat,  1 Feb 2025 04:32:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738344747;
	cv=none; b=gHUYPeDbVLWeNZwEzUpdfjVXgGZKCkwZeVf9N311NuamrNYBKkY8qDkQaOZ99CipdayaC3qEgoxbx36UKzvEW+reJXoXa75tXQ7TODePcnaq30dpoqC6CJg6wQeS2OohMbqTvA2Mm5h3+WuBvBfNa0SvaIQ42maB4Dw84vikNHBC8PS08DXwIGjhNLNelfjmItY6z3kLLIg1uONTkKdwKKCwHYZ/0dMBbYlQLbYhjyg7hgBFMViVzyBY4/niMu1wZqF63FqD6DybQaLtPlvlNIJsxEd/shmXFkuJO8vTDH2lIAb/2mNbhZvel8Foe6lWHtwjQNkC/zSrwV2kiewP5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738344747; c=relaxed/relaxed;
	bh=uAxEjBuvNsnNijA8VRtmJbP9jn1jCLSeL5wxij3Sxh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNkE/wEN9kauuxZSvaMv8f64DEOaA3RD0VgkPwr3+I29bCULTb2+rw9k0leowI+Meuo4awAx1rLprb7wwbVipHkB+A0UgYgO/k4O4QON/dbrInyD9Defd4RNE7jhrMPvfUIsQcpGqKtY13erDajeDkb8bcOHJvGOGh42Xe8nEScRC4Qz89t5h2MEEyfm26nZS4ZbQc31eeRMJLXRnNWjGZcwdNqCAp4FTpq8FIuKQSyUa0jJwuhCHrbQ8ESC5fI1WrN8uPdmhnLI8M01mYjIy323JfWsOabXY6n9y7+h/aC7E6N6sSYHhEkddxSl6QbpSpl12bruGqyA6SQ+D3W4qQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yl2yf2vJYz2yGk
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Feb 2025 04:32:26 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 50VHUNTc031340;
	Fri, 31 Jan 2025 11:30:23 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 50VHUN6I031339;
	Fri, 31 Jan 2025 11:30:23 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 31 Jan 2025 11:30:23 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Paul Mackerras <paulus@ozlabs.org>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 4/5] powerpc: Define config option for processors without broadcast TLBIE
Message-ID: <20250131173023.GG20626@gate.crashing.org>
References: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org> <Z5lf-OrrbRe5Q0O-@thinks.paulus.ozlabs.org> <D7EC3ZZ2E3YY.5ALSOA646CK4@gmail.com> <Z5nUc54yZDqGqr0P@thinks.paulus.ozlabs.org>
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
In-Reply-To: <Z5nUc54yZDqGqr0P@thinks.paulus.ozlabs.org>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 29, 2025 at 06:10:43PM +1100, Paul Mackerras wrote:
> > Hate to bikeshed, but would it be annoying to make this an affirmative
> > option?
> 
> I guess we'd have to make all the platforms that do have broadcast
> tlbie (and a book3s-64 MMU with radix) select that option.  Which
> would be powernv and pseries, I would think.  If that's correct then
> it's probably not too annoying.  Should I do that in v2?

Such an option would mean "this platform implements the Power
architecture correctly".  Interesting :-)


Segher

