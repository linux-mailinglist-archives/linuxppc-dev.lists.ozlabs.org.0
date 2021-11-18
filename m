Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3B44557F3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 10:25:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvvXf5ptKz2ywW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 20:25:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jGkAQEyc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvvX12yCgz2x9W
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Nov 2021 20:24:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=jGkAQEyc; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HvvX10X6Wz4xdM;
 Thu, 18 Nov 2021 20:24:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1637227489;
 bh=TLTbM1CZSGXr7PCxRv9ZbnFUvxI0Acxhccq3yFrx4Jc=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=jGkAQEycG1qV3SxLYpFIYMnu/hpC3gGBNrkDe/5CS5aVZ770h+NHr9bga5+FZvGY4
 FTV2hJDrdQfwI4L15Ha7v5VK+GuLITKacPEXHq8ZWkqnmHdacJIY5+yEQnW2l6G8aE
 7GN7rVpOUikkgL6eVYC0YSef6Ngj9cRyj4V3d6mh5j9mNHZ2XT7lZAm9Bqq4xnQp/N
 X+b3RRx7yl/kY12Itgy0Wla3BkJGKmT6bVEMdoIQCxa1/09B2Nrz8q7hiXDVzPpSm/
 dXEKB1cWc5Ogc0SM5kPQ8+ceDl/FTzgrcB1GpJIOotnqUDLsFVhcp/qy2zWM6r37BH
 e7mGTEZ/1mHtQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 11/11] powerpc/smp: Add a doorbell=off kernel parameter
In-Reply-To: <7341ab0d-c12b-6d5f-76d3-5927a2734f02@kaod.org>
References: <20211105102636.1016378-1-clg@kaod.org>
 <20211105102636.1016378-12-clg@kaod.org>
 <87fss3m0sp.fsf@mpe.ellerman.id.au>
 <7341ab0d-c12b-6d5f-76d3-5927a2734f02@kaod.org>
Date: Thu, 18 Nov 2021 20:24:48 +1100
Message-ID: <87sfvtlstb.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:
> On 11/11/21 11:41, Michael Ellerman wrote:
>> C=C3=A9dric Le Goater <clg@kaod.org> writes:
>>> On processors with a XIVE interrupt controller (POWER9 and above), the
>>> kernel can use either doorbells or XIVE to generate CPU IPIs. Sending
>>> doorbell is generally preferred to using the XIVE IC because it is
>>> faster. There are cases where we want to avoid doorbells and use XIVE
>>> only, for debug or performance. Only useful on POWER9 and above.
>>=20
>> How much do we want this?
>
> Yes. Thanks for asking. It is a recent need.
>
> Here is some background I should have added in the first place. May be
> for a v2.
>
> We have different ways of doing IPIs on POWER9 and above processors,
> depending on the platform and the underlying hypervisor.
>
> - PowerNV uses global doorbells
>
> - pSeries/KVM uses XIVE only because local doorbells are not
>    efficient, as there are emulated in the KVM hypervisor
>
> - pSeries/PowerVM uses XIVE for remote cores and local doorbells for
>    threads on same core (SMT4 or 8)
>
> This recent commit 5b06d1679f2f ("powerpc/pseries: Use doorbells even
> if XIVE is available") introduced the optimization for PowerVM and
> commit 107c55005fbd ("powerpc/pseries: Add KVM guest doorbell
> restrictions") restricted the optimization.
>
> We would like a way to turn off the optimization.

Just for test/debug though?

>> Kernel command line args are a bit of a pain, they tend to be poorly
>> tested, because someone has to explicitly enable them at boot time,
>> and then reboot to test the other case.
>
> True. The "xive=3Doff" parameter was poorly tested initially.
>
>> When would we want to enable this?
>
> For bring-up, for debug, for tests. I have been using a similar switch
> to compare the XIVE interrupt controller performance with doorbells on
> POWER9 and P0WER10.
>
> A new need arises with PowerVM, some configurations will behave as KVM
> (local doorbell are unsupported) and the doorbell=3Doff parameter is a
> simple way to handle this case today.

That's the first I've heard of that, what PowerVM configurations have
non-working doorbells?

>> Can we make the kernel smarter about when to use doorbells and make
>> it automated?
>
> I don't think we want to probe all IPI methods to detect how well
> local doorbells are supported on the platform. Do we ?

We don't *want to*, but sounds like we might have to if they are not
working in some configurations as you mentioned above.

cheers
