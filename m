Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC1190F0A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2024 16:32:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BFrTmS1n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W45gd1JKjz3cgP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 00:32:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BFrTmS1n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W45fw278Hz3cXH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 00:32:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 01B50CE1EFE;
	Wed, 19 Jun 2024 14:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE1BC2BBFC;
	Wed, 19 Jun 2024 14:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718807525;
	bh=5P4+U94Sj+hrx7FTYMGgX4hD00hQheT4KmraZdUEYZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BFrTmS1nAs54AIbQRFZWX6lLQQAx8iDngpm6hPCbqM/x2FF0WG8GEifv6OBwWMy63
	 QLX8gIuxc4F8/AU2zqq+8lzI+csN2fj+rExfrSaQHK0Thz7r2G9rP5EhglR4a4LIgN
	 GICcPGSZlt6gXYBe5uUZSaY0XCDFRbE581EkN8dytKB4p8c106gwdijV3OrZq3vFHD
	 bLfpJyZHsZN8XqgAFkZpyBmQV0TCNPbTTRPCKjXP0J2lgso5AF/PVbWVPfVVKItnnx
	 WXCH97MarRhZvHnHtNODnhxQBFoYbPN4RqrARkKyvsVdn84Z6qNBPl58dO2gLlSMqC
	 2vynCwPOKRd1A==
Date: Wed, 19 Jun 2024 10:32:03 -0400
From: Sasha Levin <sashal@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH AUTOSEL 6.9 18/23] powerpc: make fadump resilient with
 memory add/remove events
Message-ID: <ZnLr4_0RX-c7m7Zo@sashalap>
References: <20240527155123.3863983-1-sashal@kernel.org>
 <20240527155123.3863983-18-sashal@kernel.org>
 <944f47df-96f0-40e8-a8e2-750fb9fa358e@linux.ibm.com>
 <ZnFQQEBeFfO8vOnl@duo.ucw.cz>
 <87a5jhe94t.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87a5jhe94t.fsf@mail.lhotse>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: bhe@redhat.com, Pavel Machek <pavel@denx.de>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, aneesh.kumar@kernel.org, Sourabh Jain <sourabhjain@linux.ibm.com>, Naveen N Rao <naveen@kernel.org>, bhelgaas@google.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 19, 2024 at 04:31:30PM +1000, Michael Ellerman wrote:
>Pavel Machek <pavel@denx.de> writes:
>>> Hello Sasha,
>>>
>>> Thank you for considering this patch for the stable tree 6.9, 6.8, 6.6, and
>>> 6.1.
>>>
>>> This patch does two things:
>>> 1. Fixes a potential memory corruption issue mentioned as the third point in
>>> the commit message
>>> 2. Enables the kernel to avoid unnecessary fadump re-registration on memory
>>> add/remove events
>>
>> Actually, I'd suggest dropping this one, as it fixes two things and is
>> over 200 lines long, as per stable kernel rules.
>
>Yeah I agree, best to drop this one. It's a bit big and involved, and
>has other dependencies.

I'll drop it, thanks!

-- 
Thanks,
Sasha
