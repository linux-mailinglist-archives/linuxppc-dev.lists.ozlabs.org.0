Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F93B396A97
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jun 2021 03:24:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FvDvl73fsz308N
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jun 2021 11:24:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XAngQqEN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=XAngQqEN; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FvDvH1Vxvz2xfw
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jun 2021 11:23:38 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FvDvB5vQHz9sVb;
 Tue,  1 Jun 2021 11:23:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1622510617;
 bh=pRW/jGU2MfZwXhr2szA7EkQGeL/LqltGtcDOl8mYV8c=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=XAngQqEN84y/ezp5GjnkOpMkSzNKKjuxvPBu/VWduor4RXWQbo2N3nd3Y1j+c6Lhg
 QWXKbCK3hDiQGUi2xJFKxNujsoQCr8D6skBZKqPAy4L2QdlJTEeURPOYydElphtJyZ
 27JaV6mGj4mXMc4PxFkAvhb7FF+zQ2B9U6WrRwVbJ8Y5kzKcBnFarSv7wu/s71qsou
 jwERYeble6iqKGsAiKJf3IzdL8lohGo5EQYemdr5ZOiwL/Ch7uR0YN+Mcs1PkQUDNh
 GCer1Lz5q5TGWBfyHBKhT9xUraHAAlg7xO2ycv4HLP5nB4ZHr20mT1w3VyVb+iNRUa
 lvCcCgCD9D8wQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Frederic Barrat <fbarrat@linux.ibm.com>, Alexey Kardashevskiy
 <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] Revert "powerpc/kernel/iommu: Align size for
 IOMMU_PAGE_SIZE() to save TCEs"
In-Reply-To: <bd48e061-775e-9ee9-395f-743c730c540b@linux.ibm.com>
References: <20210526144540.117795-1-fbarrat@linux.ibm.com>
 <82c308d5-7ef4-b756-35dc-eeb029b79601@ozlabs.ru>
 <bd48e061-775e-9ee9-395f-743c730c540b@linux.ibm.com>
Date: Tue, 01 Jun 2021 11:23:27 +1000
Message-ID: <87mtsagyy8.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: zdai@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Frederic Barrat <fbarrat@linux.ibm.com> writes:
> On 27/05/2021 04:13, Alexey Kardashevskiy wrote:
>> On 27/05/2021 00:45, Frederic Barrat wrote:
>>> This reverts commit 3c0468d4451eb6b4f6604370639f163f9637a479.
>>>
>>> That commit was breaking alignment guarantees for the DMA address when
>>> allocating coherent mappings, as described in
>>> Documentation/core-api/dma-api-howto.rst
>>>
>>> It was also noticed by Mellanox' driver:
>>> [ 1515.763621] mlx5_core c002:01:00.0: 
>>> mlx5_frag_buf_alloc_node:146:(pid 13402): unexpected map alignment: 
>>> 0x0800000000c61000, page_shift=16
>>> [ 1515.763635] mlx5_core c002:01:00.0: mlx5_cqwq_create:181:(pid
>>> 13402): mlx5_frag_buf_alloc_node() failed, -12
>>>
>>> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
>> 
>> Should it be
>> 
>> Fixes: 3c0468d4451e ("powerpc/kernel/iommu: Align size for 
>> IOMMU_PAGE_SIZE() to save TCEs")
>> 
>> ?
>
>
> I had been wondering the same... I can see many revert commits with and 
> without a "Fixes:" line. Since here the offending commit was merged in 
> the latest merge window, I was thinking Fixes doesn't really bring 
> anything, it will all stay internal to v5.13 development.

It is still valuable, even if the fix lands in the same release as the
original commit.

The original commit could have been backported elsewhere, so the Fixes
tag is still useful in that case.

> I'd be happy to hear of the expected way of handling it. I'm guessing
> a big part of the answer is whether the tooling looking for a "Fixes"
> line is also looking for reverts.

Tooling should look for both Fixes and reverts, because not everyone is
going to remember to add Fixes tags to a revert.

But I think it's still helpful to include the Fixes tag, I sometimes
grep the commit log for "Fixes: <sha>" and I'm sure others do too.

I've added it to this commit, no need to resend.

cheers
