Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A912DB96E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 03:50:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwfkM46hRzDqMG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 13:50:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cwfht4xgczDqBm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Dec 2020 13:49:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Lks9h17O; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cwfht3VrWz9sRR;
 Wed, 16 Dec 2020 13:49:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1608086942;
 bh=mxqVu9RrcjWhIRq9aGVq7hXZvWKdP4GoOIWTNnE05Cw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Lks9h17Oxy5tXsQ4wlNH2deHB/eGxJQl7ZpvUn4ahy3YhsdkTYgSOos7RmUYQFeN7
 rlqSJ1lDNNkIeuYxFIUU0KPaR3XC6v2y26e3c1C/vTPc6F0Y2XoucLmXlR3k5z4+4R
 n7hdvk0s0WdtzhTiSycNySy+WutzTuvBQR4AMgZySVvz92uPUPqAd00WpCzl+jTfq9
 GaBUgc8DqQrYYe+OaOJNy654OyGjpC0+x0hBIkHUePV3VDHoKpFwtDro476VRGZDw5
 I5q3QRkGRCJk2qhBho1Y8GHIYwpat2Yzipd1WXQXkBHc0tAWOa+ANKxQy1yqrrpP9H
 0yp6m/cxcdzrA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 07/13] powerpc: Increase NR_IRQS range to support more
 KVM guests
In-Reply-To: <9fca102b-b1b2-84b0-085f-96965f126e58@kaod.org>
References: <20201210171450.1933725-1-clg@kaod.org>
 <20201210171450.1933725-8-clg@kaod.org> <87czzhrzhk.fsf@mpe.ellerman.id.au>
 <9fca102b-b1b2-84b0-085f-96965f126e58@kaod.org>
Date: Wed, 16 Dec 2020 13:49:01 +1100
Message-ID: <87wnxixy76.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Greg Kurz <groug@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:
> On 12/11/20 12:51 AM, Michael Ellerman wrote:
>> C=C3=A9dric Le Goater <clg@kaod.org> writes:
>>> PowerNV systems can handle up to 4K guests and 1M interrupt numbers
>>> per chip. Increase the range of allowed interrupts to support a larger
>>> number of guests.
>>>
>>> Reviewed-by: Greg Kurz <groug@kaod.org>
>>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>>> ---
>>>  arch/powerpc/Kconfig | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>> index 5181872f9452..c250fbd430d1 100644
>>> --- a/arch/powerpc/Kconfig
>>> +++ b/arch/powerpc/Kconfig
>>> @@ -66,7 +66,7 @@ config NEED_PER_CPU_PAGE_FIRST_CHUNK
>>>=20=20
>>>  config NR_IRQS
>>>  	int "Number of virtual interrupt numbers"
>>> -	range 32 32768
>>> +	range 32 1048576
>>>  	default "512"
>>>  	help
>>>  	  This defines the number of virtual interrupt numbers the kernel
>>=20
>> We should really do what other arches do, and size this appropriately
>> based on the config, rather than asking users to guess what size they
>> need.
>>=20
>> But I guess I'll take this for now, and we can do something fancier
>> later.
>
> I was thinking on adding a property to OPAL to size the HW interrupt=20
> number space. Is that it ?

That's a separate issue. NR_IRQS is about the maximum number of Linux
interrupts, and it's a compile time limit.

In the old days there was an array of irq_desc[NR_IRQS] in .data, so you
didn't want NR_IRQS to be too big. These days we don't do that, because
of the sparse IRQ support, but I don't know if it's completely free to
make NR_IRQS arbitrarily large at build time.

> That would be good because it's increasing from 20bits on P9 to 24bits
> on P10.

That's probably still helpful, it might mean we can shrink some
structures at runtime.

> I am checking other arches.

Thanks.

cheers
