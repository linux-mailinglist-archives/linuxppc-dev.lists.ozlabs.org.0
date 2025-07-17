Return-Path: <linuxppc-dev+bounces-10288-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA642B08C97
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 14:11:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjWxf29Kmz2yPd;
	Thu, 17 Jul 2025 22:11:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752754310;
	cv=none; b=DDsdg+Tx4TlpIkS56koau5OzzvhDfJWvBk9VWSlrTQ1D71HAP47hCjkUuIQM2sUr5bP0+8JiqDoNryyCOLkJ3WE3nUUWj5Ft9MV7I6zohktPbMbITYPOnBOWy+QQl49+DGYsAOdCH/1dU/xwYm+2kBSTOXSY598M49gaEbITH7KWq/ZSdZVucys1v35CMY2w4hrAPe7Kxyr/u6geDFPRTjBrUDIP2rRzTHbaMVIYywnRrK+CAnUxmmh0FB6+STkPy7BjJmODOO7XDV1d0Vg2oWmdYJ00tZ13bf+g/grQyXaRqCCyiNTNhM5mN5RBflBQbby0q6d00VZcyV0z7hAHZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752754310; c=relaxed/relaxed;
	bh=lwvMFzYwUfeNWt6ikDRmW5Er6TMqCf8g6T8QKpTn0UE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIWNfJrp4yNfPeUoy2oag2HVwwtf69nTQsGvfi+hUiwOwzlawTOU7mkkoYuyXhh1WguKWG3BTKpuaSeCTV6ZcJrGiYOGCXQi9Yw95wC3uPvgKoh7dKkVIypoJOyCuPGi0lQguFe8FuTN7e5WhV3IqPpZUCv+0ZWQJtj1tupD7Asgc46Pozw458HUH/G4UMe19gsWDfA9StsiQwfadft3ldQPFT/UNZgGGZqVQRjy8YzAx6Vfakq/bjFkvzjjQl6alL+aFmm3tFq4a3aXX6xt8GVBsgbTQvZC7Y49OznsphJWBOawatXv2Lv+K/JMkp4t4WNsfrKH52W37t2ZMxstDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=2Qt6Z4X1; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=2Qt6Z4X1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjWxc6MMrz2yMt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 22:11:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F613601F7;
	Thu, 17 Jul 2025 12:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 663D5C4CEEB;
	Thu, 17 Jul 2025 12:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752754305;
	bh=u7SEQClQAB7gDVI1zZ2Aqc9od3vbr6CRMh/fPM8fFwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2Qt6Z4X11YhogWwmPVhJNTezRMtYrXrmvZKzpaNeXXzrRKVkm27yaCiy5/7CxAvjd
	 YkN/PYtnuacWtPoixP/hG2zdXON89AXUdXcpob0TSY8888tb0EIehkEW0RBPkmwf/I
	 5rwizpj+UPQM+PsLiZ95EScAmEzGwG7w2hBjdInI=
Date: Thu, 17 Jul 2025 14:11:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] syscore: Pass context data to callbacks
Message-ID: <2025071716-phoney-object-1648@gregkh>
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
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
In-Reply-To: <20250717103241.2806798-1-thierry.reding@gmail.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jul 17, 2025 at 12:32:34PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Hi,
> 
> Something that's been bugging me over the years is how some drivers have
> had to adopt file-scoped variables to pass data into something like the
> syscore operations. This is often harmless, but usually leads to drivers
> not being able to deal with multiple instances, or additional frameworks
> or data structures needing to be created to handle multiple instances.
> 
> This series proposes to "objectify" struct syscore_ops by passing a
> pointer to struct syscore_ops to the syscore callbacks. Implementations
> of these callbacks can then make use of container_of() to get access to
> contextual data that struct syscore_ops was embedded in. This elegantly
> avoids the need for file-scoped, singleton variables, by tying syscore
> to individual instances.
> 
> Patch 1 contains the bulk of these changes. It's fairly intrusive
> because it does the conversion of the function signature all in one
> patch. An alternative would've been to introduce new callbacks such that
> these changes could be staged in. However, the amount of changes here
> are not quite numerous enough to justify that, in my opinion, and
> syscore isn't very frequently used, so the risk of another user getting
> added while this is merged is rather small. All in all I think merging
> this in one go is the simplest way.

All at once is good, I like the idea, but:

> Patches 2-7 are conversions of some existing drivers to take advantage
> of this new parameter and tie the code to per-instance data.

That's great, but none of these conversions actually get rid of the
global structure, so what actually was helped here other than the churn
of this "potentially" allowing the global data variables from being
removed in the future?

So how does this actually help?

Also, small nit, make the function pointers const please :)

thanks,

greg k-h

