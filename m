Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D65BAF089
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 19:37:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SXKP0BYczF1R7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 03:37:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=188.165.44.50; helo=5.mo4.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 10798 seconds by postgrey-1.36 at bilbo;
 Wed, 11 Sep 2019 03:35:28 AEST
Received: from 5.mo4.mail-out.ovh.net (5.mo4.mail-out.ovh.net [188.165.44.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SXHN2rc1zF1Ph
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 03:35:23 +1000 (AEST)
Received: from player750.ha.ovh.net (unknown [10.108.54.230])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 8001D2046ED
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 15:59:45 +0200 (CEST)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: clg@kaod.org)
 by player750.ha.ovh.net (Postfix) with ESMTPSA id 0B10D9BCF29D;
 Tue, 10 Sep 2019 13:59:37 +0000 (UTC)
Subject: Re: [PATCH] powerpc/xive: Fix bogus error code returned by OPAL
To: Greg Kurz <groug@kaod.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <156812362556.1866243.7399893138425681517.stgit@bahia.tls.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b8c656c8-296c-2bc3-0758-ca513e76a19f@kaod.org>
Date: Tue, 10 Sep 2019 15:59:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <156812362556.1866243.7399893138425681517.stgit@bahia.tls.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12416705648356002583
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrtddtgdegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/09/2019 15:53, Greg Kurz wrote:
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
> 
> Internally convert 0xffffffff to OPAL_RESOURCE which is the usual error
> returned upon resource exhaustion.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>



Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

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
> +{
> +	s64 irq = opal_xive_allocate_irq(chip_id);
> +
> +#define XIVE_ALLOC_NO_SPACE	0xffffffff /* No possible space */
> +	return
> +		irq == XIVE_ALLOC_NO_SPACE ? OPAL_RESOURCE : irq;
> +}
> +
>  #ifdef CONFIG_SMP
>  static int xive_native_get_ipi(unsigned int cpu, struct xive_cpu *xc)
>  {
> @@ -238,7 +247,7 @@ static int xive_native_get_ipi(unsigned int cpu, struct xive_cpu *xc)
>  
>  	/* Allocate an IPI and populate info about it */
>  	for (;;) {
> -		irq = opal_xive_allocate_irq(xc->chip_id);
> +		irq = opal_xive_allocate_irq_fixup(xc->chip_id);
>  		if (irq == OPAL_BUSY) {
>  			msleep(OPAL_BUSY_DELAY_MS);
>  			continue;
> @@ -259,7 +268,7 @@ u32 xive_native_alloc_irq(void)
>  	s64 rc;
>  
>  	for (;;) {
> -		rc = opal_xive_allocate_irq(OPAL_XIVE_ANY_CHIP);
> +		rc = opal_xive_allocate_irq_fixup(OPAL_XIVE_ANY_CHIP);
>  		if (rc != OPAL_BUSY)
>  			break;
>  		msleep(OPAL_BUSY_DELAY_MS);
> 

