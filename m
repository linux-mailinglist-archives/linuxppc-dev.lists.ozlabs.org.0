Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B7A357EB0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 11:05:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGFhn5cXHz3bsH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 19:05:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TD9BlQ4K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=TD9BlQ4K; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGFhK1zztz30Bp
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 19:04:48 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FGFhD5T9Vz9sTD;
 Thu,  8 Apr 2021 19:04:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1617872685;
 bh=jJ23Uv9SuBdoUFRUHJtj+BuKUQNdlwNakAp8NjqmDMU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=TD9BlQ4KYg5syukVLShso+Dh9bk24ifvZOHrJ0B6YtACfSG174R/JDwoh6Rxm665c
 JNRSlwrK3Z5TEorR3QCdNiV2lb5Kml5xspx976Ht/+dBGBbFFZf2UjvRHc1hleRL9l
 9JJgKxGYUu0qQdbP1KCeqLvdNMuFwnJ7zG8RvDRPGKGC5X/8hmlM5nVgHPvTatDJv9
 K4yLpl6wN3YcBEuhC54UTwTeqfVbx3sigoKsLxUUXcLZ6+ll8H01r23Xq3aqUxhqh2
 sgOkouqbH7+MtzUaYzHaUouO8bDKwzRFZ9ZEehbWV3w+hyJrA7NvOrz8SpyAL4rTle
 pFbn17y12WZ6g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Leonardo Bras
 <leobras.c@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, brking@linux.vnet.ibm.com
Subject: Re: [PATCH v2 1/1] powerpc/iommu: Enable remaining IOMMU Pagesizes
 present in LoPAR
In-Reply-To: <8e1ce7e9-415b-92ea-0437-a4331ed3c7f9@ozlabs.ru>
References: <20210407195613.131140-1-leobras.c@gmail.com>
 <87im4xe3pk.fsf@mpe.ellerman.id.au>
 <8e1ce7e9-415b-92ea-0437-a4331ed3c7f9@ozlabs.ru>
Date: Thu, 08 Apr 2021 19:04:43 +1000
Message-ID: <87ft01du50.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> On 08/04/2021 15:37, Michael Ellerman wrote:
>> Leonardo Bras <leobras.c@gmail.com> writes:
>>> According to LoPAR, ibm,query-pe-dma-window output named "IO Page Sizes"
>>> will let the OS know all possible pagesizes that can be used for creating a
>>> new DDW.
>>>
>>> Currently Linux will only try using 3 of the 8 available options:
>>> 4K, 64K and 16M. According to LoPAR, Hypervisor may also offer 32M, 64M,
>>> 128M, 256M and 16G.
>> 
>> Do we know of any hardware & hypervisor combination that will actually
>> give us bigger pages?
>
>
> On P8 16MB host pages and 16MB hardware iommu pages worked.
>
> On P9, VM's 16MB IOMMU pages worked on top of 2MB host pages + 2MB 
> hardware IOMMU pages.

The current code already tries 16MB though.

I'm wondering if we're going to ask for larger sizes that have never
been tested and possibly expose bugs. But it sounds like this is mainly
targeted at future platforms.


>>> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
>>> index 9fc5217f0c8e..6cda1c92597d 100644
>>> --- a/arch/powerpc/platforms/pseries/iommu.c
>>> +++ b/arch/powerpc/platforms/pseries/iommu.c
>>> @@ -53,6 +53,20 @@ enum {
>>>   	DDW_EXT_QUERY_OUT_SIZE = 2
>>>   };
>> 
>> A comment saying where the values come from would be good.
>> 
>>> +#define QUERY_DDW_PGSIZE_4K	0x01
>>> +#define QUERY_DDW_PGSIZE_64K	0x02
>>> +#define QUERY_DDW_PGSIZE_16M	0x04
>>> +#define QUERY_DDW_PGSIZE_32M	0x08
>>> +#define QUERY_DDW_PGSIZE_64M	0x10
>>> +#define QUERY_DDW_PGSIZE_128M	0x20
>>> +#define QUERY_DDW_PGSIZE_256M	0x40
>>> +#define QUERY_DDW_PGSIZE_16G	0x80
>> 
>> I'm not sure the #defines really gain us much vs just putting the
>> literal values in the array below?
>
> Then someone says "uuuuu magic values" :) I do not mind either way. Thanks,

Yeah that's true. But #defining them doesn't make them less magic, if
you only use them in one place :)

cheers
