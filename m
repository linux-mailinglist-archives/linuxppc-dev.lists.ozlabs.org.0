Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82890365110
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 05:43:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPTzd3g5Cz30CS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 13:43:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nsmhuMsi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=nsmhuMsi; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPTzC3QZmz2xYn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 13:42:46 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FPTz61kNBz9vDk;
 Tue, 20 Apr 2021 13:42:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618890162;
 bh=dO9ijqum0XbZRHvNMx1Ir45bBqpQfOH8pKy6EjA/0Vs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=nsmhuMsiUqufy7si0DK/4vPCU6jhDeb6cGiOyWiVvVAkLHt4vBDYqBNB/YUMgQmXO
 3I4f+otHvFsdbT6rPWkTL+kVrKSQJu/tNs6dHhWuqIC0J36JHnEqXvrJJaUYdAH4ul
 5S11zyrfEKQiBJdNDhZiZ9uTTEaprloZmp7SCTFCY21k7THgZtXBk8qS8JHyZ4DgBn
 Sx1VbBms6uZP6qr4RmBSNnYNhAlSRVNPCdGTjv/Bg34oW9d38ttl8QBpoi2n3Edvaj
 Ws33JiRGUp6LeaG3yFJExbV7HOuREF7awx+mVrRodNEU+o3YhwQxJBD+H+/WPyDgNp
 SA1qIDbreGfwA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: Add shutdown() to vio_driver and vio_bus
In-Reply-To: <59bd8028-cb1a-fdf6-74ce-68e868e4f486@linux.ibm.com>
References: <20210402001325.939668-1-tyreld@linux.ibm.com>
 <f326def4-0db0-f924-1700-dd7be3154153@linux.ibm.com>
 <87im4ldrft.fsf@mpe.ellerman.id.au>
 <59bd8028-cb1a-fdf6-74ce-68e868e4f486@linux.ibm.com>
Date: Tue, 20 Apr 2021 13:42:37 +1000
Message-ID: <87mtttd3ki.fsf@mpe.ellerman.id.au>
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

Tyrel Datwyler <tyreld@linux.ibm.com> writes:
> On 4/17/21 5:30 AM, Michael Ellerman wrote:
>> Tyrel Datwyler <tyreld@linux.ibm.com> writes:
>>> On 4/1/21 5:13 PM, Tyrel Datwyler wrote:
>>>> Currently, neither the vio_bus or vio_driver structures provide support
>>>> for a shutdown() routine.
>>>>
>>>> Add support for shutdown() by allowing drivers to provide a
>>>> implementation via function pointer in their vio_driver struct and
>>>> provide a proper implementation in the driver template for the vio_bus
>>>> that calls a vio drivers shutdown() if defined.
>>>>
>>>> In the case that no shutdown() is defined by a vio driver and a kexec is
>>>> in progress we implement a big hammer that calls remove() to ensure no
>>>> further DMA for the devices is possible.
>>>>
>>>> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
>>>> ---
>>>
>>> Ping... any comments, problems with this approach?
>> 
>> The kexec part seems like a bit of a hack.
>> 
>> It also doesn't help for kdump, when none of the shutdown code is run.
>
> If I understand correctly for kdump we have a reserved memory space where the
> kdump kernel is loaded, but for kexec the memory region isn't reserved ahead of
> time meaning we can try and load the kernel over potential memory used for DMA
> by the current kernel.

That's correct.

>> How many drivers do we have? Can we just implement a proper shutdown for
>> them?
>
> Well that is the end goal. I just don't currently have the bandwidth to do each
> driver myself with a proper shutdown sequence, and thought this was a launching
> off point to at least introduce the shutdown callback to the VIO bus.

Fair enough.

> Off the top of my head we have 3 storage drivers, 2 network drivers, vtpm, vmc,
> pseries_rng, nx, nx842, hvcs, hvc_vio.
>
> I can drop the kexec_in_progress hammer and just have each driver call remove()
> themselves in their shutdown function. Leave it to each maintainer to decide if
> remove() is enough or if there is a more lightweight quiesce sequence they
> choose to implement.

That's OK, you've convinced me. I'll take it as-is.

Eventually it would be good for drivers to implement shutdown in the
optimal way for their device, but that can be done incrementally.

cheers
