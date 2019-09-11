Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A929EB01B9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 18:38:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T6yk1LWlzF3nr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 02:38:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.33.251.175; helo=3.mo179.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 3.mo179.mail-out.ovh.net (3.mo179.mail-out.ovh.net
 [178.33.251.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T69Y5jnJzF3b9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 02:02:22 +1000 (AEST)
Received: from player761.ha.ovh.net (unknown [10.108.54.217])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 75A08141E96
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 18:02:17 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player761.ha.ovh.net (Postfix) with ESMTPSA id 50A7F9B791FC;
 Wed, 11 Sep 2019 16:02:11 +0000 (UTC)
Subject: Re: [PATCH v2] powerpc/xive: Fix bogus error code returned by OPAL
To: Greg Kurz <groug@kaod.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <156821713818.1985334.14123187368108582810.stgit@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a15c02b2-ac3a-21a7-db56-242cb864f79e@kaod.org>
Date: Wed, 11 Sep 2019 18:02:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <156821713818.1985334.14123187368108582810.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1911778042506414871
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrtdefgdejtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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

On 11/09/2019 17:52, Greg Kurz wrote:
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
> in the field.
> 
> Internally convert 0xffffffff to OPAL_RESOURCE which is the usual error
> returned upon resource exhaustion.
> 
> Cc: stable@vger.kernel.org # v4.12+
> Signed-off-by: Greg Kurz <groug@kaod.org>



Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
> v2: - fix syntax error in changelog
>     - Cc stable
>     - rename original OPAL wrapper
>     - rewrite fixup wrapper (style, use s64 and u32)
> ---
>  arch/powerpc/include/asm/opal.h            |    2 +-
>  arch/powerpc/platforms/powernv/opal-call.c |    2 +-
>  arch/powerpc/sysdev/xive/native.c          |   11 +++++++++++
>  3 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
> index 57bd029c715e..d5a0807d21db 100644
> --- a/arch/powerpc/include/asm/opal.h
> +++ b/arch/powerpc/include/asm/opal.h
> @@ -272,7 +272,7 @@ int64_t opal_xive_get_vp_info(uint64_t vp,
>  int64_t opal_xive_set_vp_info(uint64_t vp,
>  			      uint64_t flags,
>  			      uint64_t report_cl_pair);
> -int64_t opal_xive_allocate_irq(uint32_t chip_id);
> +int64_t opal_xive_allocate_irq_raw(uint32_t chip_id);
>  int64_t opal_xive_free_irq(uint32_t girq);
>  int64_t opal_xive_sync(uint32_t type, uint32_t id);
>  int64_t opal_xive_dump(uint32_t type, uint32_t id);
> diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
> index 29ca523c1c79..dccdc9df5213 100644
> --- a/arch/powerpc/platforms/powernv/opal-call.c
> +++ b/arch/powerpc/platforms/powernv/opal-call.c
> @@ -257,7 +257,7 @@ OPAL_CALL(opal_xive_set_queue_info,		OPAL_XIVE_SET_QUEUE_INFO);
>  OPAL_CALL(opal_xive_donate_page,		OPAL_XIVE_DONATE_PAGE);
>  OPAL_CALL(opal_xive_alloc_vp_block,		OPAL_XIVE_ALLOCATE_VP_BLOCK);
>  OPAL_CALL(opal_xive_free_vp_block,		OPAL_XIVE_FREE_VP_BLOCK);
> -OPAL_CALL(opal_xive_allocate_irq,		OPAL_XIVE_ALLOCATE_IRQ);
> +OPAL_CALL(opal_xive_allocate_irq_raw,		OPAL_XIVE_ALLOCATE_IRQ);
>  OPAL_CALL(opal_xive_free_irq,			OPAL_XIVE_FREE_IRQ);
>  OPAL_CALL(opal_xive_get_vp_info,		OPAL_XIVE_GET_VP_INFO);
>  OPAL_CALL(opal_xive_set_vp_info,		OPAL_XIVE_SET_VP_INFO);
> diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
> index 37987c815913..ad8ee7dd7f57 100644
> --- a/arch/powerpc/sysdev/xive/native.c
> +++ b/arch/powerpc/sysdev/xive/native.c
> @@ -231,6 +231,17 @@ static bool xive_native_match(struct device_node *node)
>  	return of_device_is_compatible(node, "ibm,opal-xive-vc");
>  }
>  
> +static s64 opal_xive_allocate_irq(u32 chip_id)
> +{
> +	s64 irq = opal_xive_allocate_irq_raw(chip_id);
> +
> +	/*
> +	 * Old versions of skiboot can incorrectly return 0xffffffff to
> +	 * indicate no space, fix it up here.
> +	 */
> +	return irq == 0xffffffff ? OPAL_RESOURCE : irq;
> +}
> +
>  #ifdef CONFIG_SMP
>  static int xive_native_get_ipi(unsigned int cpu, struct xive_cpu *xc)
>  {
> 

