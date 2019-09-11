Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE033AFEBB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 16:28:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T45L6j5wzF395
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 00:28:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T42d20w3zF33Q
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:26:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="NVoQxm/Q"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46T42b1Yf2z9s4Y;
 Thu, 12 Sep 2019 00:26:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1568211976;
 bh=FwvxfqH3g3FLezSauT+DVJLwHdBUTERn647l2G3HzSQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=NVoQxm/QaOV1g2QRT4A+EhYW7N/ZEu9pyvv0JHDCi0rB+UJCITUHhdkK6NefYH2jN
 S/a45IvVdkPS5nFIMT2qkN9yqkjXGPAtBimAvKCRvkwk22SGrLDDH0G5lLaZuUEEny
 15Q+LbcjTJ0a5Ik0FixryVLxyW9m4I4o0CAQMblfBrN56VHf+UG8hcudd0cPY3UBYo
 assaiGcomf5JwfbGUO51+4ubCPRBbpKVM4wvv0HSTr7UYcCrQPxWgsMbTn0P5XGNcB
 TAtsMfzxCy7peYEl95NpvKFN29ya5p2no5KG4tnFXPuEWsiUFfEYoxfteRgpjXyBk9
 f+RHmnxXHlOzA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] powerpc/xive: Fix bogus error code returned by OPAL
In-Reply-To: <156812362556.1866243.7399893138425681517.stgit@bahia.tls.ibm.com>
References: <156812362556.1866243.7399893138425681517.stgit@bahia.tls.ibm.com>
Date: Thu, 12 Sep 2019 00:26:19 +1000
Message-ID: <87k1aezz78.fsf@mpe.ellerman.id.au>
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
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Greg,

Couple of comments ...

Greg Kurz <groug@kaod.org> writes:
> There's a bug in skiboot that causes the OPAL_XIVE_ALLOCATE_IRQ call
> to return the 32-bit value 0xffffffff when OPAL has run out of IRQs.
> Unfortunatelty, OPAL return values are signed 64-bit entities and
> errors are supposed to be negative. If that happens, the linux code
> confusingly treats 0xffffffff as a valid IRQ number and panics at some
> point.
>
> A fix was recently merged in skiboot:
>
> e97391ae2bb5 ("xive: fix return value of opal_xive_allocate_irq()")
>
> but we need a workaround anyway to support older skiboots already
> on the field.
  ^
  in
 
>
> Internally convert 0xffffffff to OPAL_RESOURCE which is the usual error
> returned upon resource exhaustion.

This should go to stable, any idea what versions it should go back to?
Probably whenever the xive code was introduced?

> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  arch/powerpc/sysdev/xive/native.c |   13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
> index 37987c815913..c35583f84f9f 100644
> --- a/arch/powerpc/sysdev/xive/native.c
> +++ b/arch/powerpc/sysdev/xive/native.c
> @@ -231,6 +231,15 @@ static bool xive_native_match(struct device_node *node)
>  	return of_device_is_compatible(node, "ibm,opal-xive-vc");
>  }
>  
> +static int64_t opal_xive_allocate_irq_fixup(uint32_t chip_id)
          ^                                    ^
          Can you use s64 here and u32 here ....

Instead of calling this opal_xive_allocate_irq_fixup() and relying on
all callers to call the fixup, can we rename the opal wrapper and leave
this function's name unchanged, eg:

-OPAL_CALL(opal_xive_allocate_irq,              OPAL_XIVE_ALLOCATE_IRQ);
+OPAL_CALL(opal_xive_allocate_irq_raw,          OPAL_XIVE_ALLOCATE_IRQ);


> +{
> +	s64 irq = opal_xive_allocate_irq(chip_id);
> +
> +#define XIVE_ALLOC_NO_SPACE	0xffffffff /* No possible space */
> +	return
> +		irq == XIVE_ALLOC_NO_SPACE ? OPAL_RESOURCE : irq;
> +}

I don't really like the #define and the weird indenting and so on, can
we instead do it like:

	/*
         * Old versions of skiboot can incorrectly return 0xffffffff to
         * indicate no space, fix it up here.
         */
	return irq == 0xffffffff ? OPAL_RESOURCE : irq;

cheers
