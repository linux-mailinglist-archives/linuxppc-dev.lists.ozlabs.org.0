Return-Path: <linuxppc-dev+bounces-12366-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E59B84BC3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 15:05:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSG892f3yz2yGM;
	Thu, 18 Sep 2025 23:05:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758200713;
	cv=none; b=U9hZWwj+mSkmE9NWU4WqG4rsqW0DCLUamUpN0LAajAOyxwfxnhtClVcV6W97u30+qHuBFL7vXpIBNkg1hS2SkL+CQbTZJB46bLnl6GjFzyfUROD2q11FMz6HzKbkHmOaJlvKFs8m0ordeX1ZeBrISltLS8iIFEJToPH1uDDkPCmOEwGDZrSQjyMg6rWbASKSXuOIrRTdm0safTAVmYAECz7D4/LHJKGVM113MMqholMnG6a0nCfFV7Fskpe+1tgFzNhmgdOG+vMUGhoil9B2jfnxfjM4OPWfCz5YVgGtjRJi358Iffz9nZBo1/BG0oGKrNka7olBPfw0cl2R3NcgiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758200713; c=relaxed/relaxed;
	bh=0U0u80LKajVcAKqgmV4bYnanD/Ag8diZpMFds2C0B5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ed091X922vKL0uX9DOVzKCMREI2XdpDaXw3ENBCvmwBIFVDFJkTK6EbEMmVvO38Xni5ZDIUBNQnJFoU2nYJPfw1oAIevhb7PHjlEXwhwvfMw8l3WXfn+Fhdok86fk0SfGPmL0QFQso94yzJvl27EjaagG9ytvGYywrKfLQB1SFYX5h+MdRTqJSc5jOsOjyD3EXJiug9rRX5nwbhslUuUxc1GsPbOCr8o56nKSFPzLUy4LMk5r2+injU2CarU9Y5eg6cR3JAyh8ftX+Rs8KA5etEu8oSzYXbLLhWqgLHgV5tcs7sk15G2favDyHKKvNK1MO0hSoF2DJ/+Ct/AOmovlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=GjSF54pb; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=GjSF54pb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSG870mSLz2xlR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 23:05:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3ED544016E;
	Thu, 18 Sep 2025 13:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD974C4CEE7;
	Thu, 18 Sep 2025 13:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1758200708;
	bh=n9YPfj9P4aYPSLrs9Gb2i5F8zO9fOT4n9a2QRuxeumM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GjSF54pb7zs43JFMubXDCyHJVz3MMalpmHt5+ukNZOkGFxBBPEsHtQCj4XPf0ViUA
	 J2+Ez48FjD6uWSjvPm7j9njbyM2Vl+6HTsxURKMlAhTEqIJO3zopHa3yeWKCr2/E4u
	 X2PnaCC0Iak7PbqYid9jjCgvf6FNOqE3hYejyibo=
Date: Thu, 18 Sep 2025 15:05:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: Geoff Levand <geoff@infradead.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arch: powerpc: ps3: Make ps3_system_bus_type const
Message-ID: <2025091855-anvil-trickily-5eab@gregkh>
References: <20250918114840.53581-1-abarnas@google.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250918114840.53581-1-abarnas@google.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Sep 18, 2025 at 11:48:40AM +0000, Adrian Barnaś wrote:
> Because driver core can properly handle constant struct bus_type,
> move the ps3_system_bus_type to be a constant structure as well,
> placing it into read-only memory which can not be modified at runtime.
> 
> Signed-off-by: Adrian Barnaś <abarnas@google.com>
> ---
>  arch/powerpc/platforms/ps3/system-bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

