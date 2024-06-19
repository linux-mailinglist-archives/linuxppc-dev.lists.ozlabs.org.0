Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7203E90F08B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2024 16:31:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CiyQRlp9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W45dp18tBz3cyY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 00:31:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CiyQRlp9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W45d52K8Hz3cYS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 00:30:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AD86ACE1E81;
	Wed, 19 Jun 2024 14:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9479EC2BBFC;
	Wed, 19 Jun 2024 14:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718807427;
	bh=5P4+U94Sj+hrx7FTYMGgX4hD00hQheT4KmraZdUEYZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CiyQRlp9GSAIxk7ym3Xfl08V9zmLHG9z9EicTuHhXcckzp4MxAB/Vjqs5Jyq59MJi
	 jkk5XZzmEZEWMpQABr6UjiQuHmWAlahX8ch3QJacJi9vpLkZ18NdBv+MUHfGmK0wEQ
	 h+irmSwp3MA/fiG8VDUMzci2gh0bsGk3RtMAj21zPxOEsBHZ1pu3I6xWyioQkIyuku
	 hv40ls0BfUgw7oYiRvbJO7aayLt6Kt+a3AT/yRuxDkkLecs1seXObPB8MTn7wtS94+
	 5hUDuYYbfPODY0eGMuRMlLghxl7c4JCx3fpE+JVZZ6HFpW4QjeIZ86iMMVUOJdjGYd
	 uehKS7xw1tt5Q==
Date: Wed, 19 Jun 2024 10:30:25 -0400
From: Sasha Levin <sashal@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH AUTOSEL 6.9 18/23] powerpc: make fadump resilient with
 memory add/remove events
Message-ID: <ZnLrgSFIdWAcTQp3@sashalap>
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
