Return-Path: <linuxppc-dev+bounces-1118-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AEB96F3CC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 13:57:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0ZRt3FPkz3bqZ;
	Fri,  6 Sep 2024 21:55:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725623738;
	cv=none; b=orNu+VS0WMDBBd/tnbASWKitnCjLNb4+4KaiQ7w34081hSmnT9s4IlqUMBIonfI04sus1oeiMw0h48JemCJKWtJox4Fz7FbtR7RzMblIdW7tc/FOb+UbWbfdTlBxM2f0nt4/hJf9N/12nmTGz9gtzfE76/8+jDFRA5+NC0lUMl3vBltGgw4TJuALgmKX1iWCePd8PIxuHy0f+hG1GBSyaEpo51l6mFMapkWs4l2hnXuQ/gHIzu6SW+YL2fvvKWIJ7SMZSKUbK7ena9Y8TU8u9MuMIIRFvb8UaiBOXFNUOn6vIF0HV3WKujaluXroPXJA6kEGQ2HUW/TmrDT5lms5BA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725623738; c=relaxed/relaxed;
	bh=Rzo7RFbc4TaZiC37kmAt1VCchcLRCzUJZUAi5oMiGUA=;
	h=DKIM-Signature:From:To:In-Reply-To:References:Subject:Message-Id:
	 Date:MIME-Version:Content-Type; b=byTL5K3cLZU1CODKHdBE4Mzqxi4WyIFFB4faIlmvBWg5ZqLXalAlnNC0+RTD5vAhkKqyc+3+3criz6UHXTq47LiCYDzX/yKzi1S2Ylhb2xdVXP8SlNPurxeNtzjU9JW6RMIOAcfY2BnsI5Ho2hScWn1QqvvXqAqWCzMip8pVmcI54BlcvVbt0GEBvhrdJrALEg2wNPlieR5VsAiflJXloBEkwKBf9dD2gAjEvLwXicrzBVmzVKbBiRU1ekhT0HiFo9LwHKFaoBptQju2mVO+2PGpYhcdYYlMKbfbma49tVuK/MNpx5hixGEKGmXC4OFKfG6qd5sle/+Ysl3OAus8pA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Ji0gLWv6; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Ji0gLWv6;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0ZRt33xVz30Np
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 21:55:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725623738;
	bh=Rzo7RFbc4TaZiC37kmAt1VCchcLRCzUJZUAi5oMiGUA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Ji0gLWv6JcqpVdy1k9EXvva+R8byZZLernyKgsvugaUDco7kYyAxbzujLv/u2QL+v
	 8a4MYjKIDJzssyvZ6H8eksRRyd8e/1ddi1T7ADpmvQXzC+V7yQpbVFhqk2NL3umn12
	 2Z5igLcf/tnM2W8zRK7t6Linzyn6OGKNsecpCtWsusHmGKNXF63GPxJX06UBP+UgHh
	 JCOxkoIaNB3uF/bqgE8pP2mrMLg20lNO95ZX2IBsBxrnVk19YEmc0L8XliZdyEHH6k
	 gWRmpJCmAIygXN6UkZx7ChMHqhq1WXrHINpGJGY1MswmeNCzh9m3+jJX13PDfasGwY
	 LOb+GdgCr6RHQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0ZRt2Jk4z4xPf;
	Fri,  6 Sep 2024 21:55:38 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, linuxppc-dev@lists.ozlabs.org, Zhang Zekun <zhangzekun11@huawei.com>
In-Reply-To: <20240822085430.25753-1-zhangzekun11@huawei.com>
References: <20240822085430.25753-1-zhangzekun11@huawei.com>
Subject: Re: [PATCH 0/2] Use helper function for_each_child_of_node()
Message-Id: <172562357191.467568.5413580947356525182.b4-ty@ellerman.id.au>
Date: Fri, 06 Sep 2024 21:52:51 +1000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Thu, 22 Aug 2024 16:54:28 +0800, Zhang Zekun wrote:
> Use for_each_child_of_node() to iterate through the device_node, this
> can make code more simple.
> 
> Zhang Zekun (2):
>   powerpc/powermac/pfunc_base: Use helper function
>     for_each_child_of_node()
>   powerpc/pseries/dlpar: Use helper function for_each_child_of_node()
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/powermac/pfunc_base: Use helper function for_each_child_of_node()
      https://git.kernel.org/powerpc/c/197116e2dec8d23888ce76044fe673480afceff0
[2/2] powerpc/pseries/dlpar: Use helper function for_each_child_of_node()
      https://git.kernel.org/powerpc/c/46f4bbb8aac2b876355cdefdacd1971b65f8b631

cheers

