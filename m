Return-Path: <linuxppc-dev+bounces-711-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D53A296346A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 00:09:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvJV15wxyz2yj3;
	Thu, 29 Aug 2024 08:09:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4601:e00::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724879748;
	cv=none; b=keLaMZ/IgzJIeKQBnyH3kY89fXgakm8bn4uc6pNcxg3x4EGYutchQ/tB8vC3IvgatxcwHetWNOmeGT+m5E/86R2Xjlru7cJFndbwshZ1+L5L2eshgETEVAEsNy+UX8S3z70qKroVsh64r8YKod7mTnC+DgfT2uGtWuc9TOOH0MJ/IHoyZQJOQl+jT5+sFZ+9LAhMk0CgI1jyjywhSWp5f74Vj05uabHIyoC/L6sIyooZgHnEgUOSD0PKNcyROv8Zh5ER6hceuUQXUIwOVCBCPLAuTV9Oo7vju9uHrgm0XTqi8ewrpp7PQ5LpN5uJUW8fNC1gqyHRqHRdsyBrE5qHbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724879748; c=relaxed/relaxed;
	bh=HfpBneikX9RJyFQo32o5GIseA53Lif0bJqEeHzkvaKo=;
	h=X-Greylist:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To; b=WvyOFcCtI1dQk8BW2xsS7YklnI7hCgvalLEA5qITggY+mNQzATSplnNce53ELC9+ao1YghUNpa3F264RE0Q2GEmWtt0NhQe4Hw4gKwUPAELYVB8tNp12o+WI51xPXohp9ZuMtrc3OX48bf8iP1tZYvexZ0qij+1urapLX1G1XnpUuqZjeHpeggFB2BCk8xju2FEc14Tcey0fbebelL4Ajz87hWcPBHdvJtydRCQ0TJyEJCs6yxLyMBaDNHtGDh5haqAK5SUKxftixr8YLpu83duBsBPX5Fc3bkeVXahfurELVDksQHAZU5E4TlbSOSsKjHdRYEt8+0MAYTQOZldTPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gkHXU4/m; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gkHXU4/m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 305 seconds by postgrey-1.37 at boromir; Thu, 29 Aug 2024 07:15:48 AEST
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvHJN25Ygz2yGD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 07:15:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B230AAE3859;
	Wed, 28 Aug 2024 21:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09130C4CEC0;
	Wed, 28 Aug 2024 21:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724879440;
	bh=p7pNbtxW2a8q0ayOQwRd9oMMXqnYD6TO03sBwc1nZZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gkHXU4/mnxuurnnJUmhRyiORY5Y1BXSiiThdeFODqa0j3U8tXayOWR/Dd8Zg4LzIs
	 h/3sdJTz+aEnpOjJVrgVa9QQah8AWEDkxhnuEX06k8j+52JOo/db0F5nEhKPtSTC3q
	 wdmN/Os93DR1l2iZdZm0XUvO7XfO3pPhTITZu6WZasod90h25eyZa1SLHL9IK7XL3W
	 c17flJA+uNhxgRKynmiHKUKnFGKKqJqhPwjQbt7VhI8S+WHUQPrGtNJMzAGVJqQx1p
	 hNiq7w8IXHjHD+SqkuT3oIGcnd1wR6PhUXYUc9Vvwb5XYvz8gS7uiTG5f/EnBU/Jey
	 gYsocIaLu1giQ==
Date: Wed, 28 Aug 2024 18:10:37 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Kajol Jain <kjain@linux.ibm.com>, namhyung@kernel.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	atrajeev@linux.vnet.ibm.com, hbathini@linux.ibm.com,
	disgoel@linux.vnet.ibm.com
Subject: Re: [PATCH 1/3] perf vendor events power10: Update JSON/events
Message-ID: <Zs-STZ3mQLjfBcjT@x1>
References: <20240827053206.538814-1-kjain@linux.ibm.com>
 <CAP-5=fWBjt3pypEwEsbKsuNTqX+ZA7v9WbNJCUgc09xxF=pt1A@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fWBjt3pypEwEsbKsuNTqX+ZA7v9WbNJCUgc09xxF=pt1A@mail.gmail.com>

On Tue, Aug 27, 2024 at 08:30:09AM -0700, Ian Rogers wrote:
> On Mon, Aug 26, 2024 at 10:33 PM Kajol Jain <kjain@linux.ibm.com> wrote:
> >
> > Update JSON/events for power10 platform with additional events.
> >
> > Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> 
> For the series:
> Reviewed-by: Ian Rogers <irogers@google.com>

Thanks, applied to perf-tools-next,

- Arnaldo

