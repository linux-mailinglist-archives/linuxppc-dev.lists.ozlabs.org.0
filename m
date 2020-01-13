Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B510E139288
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 14:54:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xFSt4r1szDqHw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 00:54:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.72.238; helo=9.mo177.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 599 seconds by postgrey-1.36 at bilbo;
 Tue, 14 Jan 2020 00:48:42 AEDT
Received: from 9.mo177.mail-out.ovh.net (9.mo177.mail-out.ovh.net
 [46.105.72.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xFL25cg2zDqDD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 00:48:39 +1100 (AEDT)
Received: from player776.ha.ovh.net (unknown [10.108.57.141])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 7060611E28F
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2020 14:31:11 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player776.ha.ovh.net (Postfix) with ESMTPSA id 492D1E34B8E9;
 Mon, 13 Jan 2020 13:31:05 +0000 (UTC)
Subject: Re: [PATCH] powerpc/xive: discard ESB load value when interrupt is
 invalid
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20200113130118.27969-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <76f76082-81ee-4957-c45b-151f0cd6e6b6@kaod.org>
Date: Mon, 13 Jan 2020 14:31:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200113130118.27969-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8151233854402563003
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdejtddghedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Greg Kurz <groug@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/13/20 2:01 PM, Cédric Le Goater wrote:
> From: Frederic Barrat <fbarrat@linux.ibm.com>
> 
> A load on an ESB page returning all 1's means that the underlying
> device has invalidated the access to the PQ state of the interrupt
> through mmio. It may happen, for example when querying a PHB interrupt
> while the PHB is in an error state.
> 
> In that case, we should consider the interrupt to be invalid when
> checking its state in the irq_get_irqchip_state() handler.


and we need also these tags :

Fixes: da15c03b047d ("powerpc/xive: Implement get_irqchip_state method for XIVE to fix shutdown race")
Cc: stable@vger.kernel.org # v5.3+



> Cc: Paul Mackerras <paulus@ozlabs.org>
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> [ clg: - wrote a commit log
>        - introduced XIVE_ESB_INVALID ]
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  arch/powerpc/include/asm/xive-regs.h |  1 +
>  arch/powerpc/sysdev/xive/common.c    | 15 ++++++++++++---
>  2 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/xive-regs.h b/arch/powerpc/include/asm/xive-regs.h
> index f2dfcd50a2d3..33aee7490cbb 100644
> --- a/arch/powerpc/include/asm/xive-regs.h
> +++ b/arch/powerpc/include/asm/xive-regs.h
> @@ -39,6 +39,7 @@
>  
>  #define XIVE_ESB_VAL_P		0x2
>  #define XIVE_ESB_VAL_Q		0x1
> +#define XIVE_ESB_INVALID	0xFF
>  
>  /*
>   * Thread Management (aka "TM") registers
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
> index f5fadbd2533a..9651ca061828 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -972,12 +972,21 @@ static int xive_get_irqchip_state(struct irq_data *data,
>  				  enum irqchip_irq_state which, bool *state)
>  {
>  	struct xive_irq_data *xd = irq_data_get_irq_handler_data(data);
> +	u8 pq;
>  
>  	switch (which) {
>  	case IRQCHIP_STATE_ACTIVE:
> -		*state = !xd->stale_p &&
> -			 (xd->saved_p ||
> -			  !!(xive_esb_read(xd, XIVE_ESB_GET) & XIVE_ESB_VAL_P));
> +		pq = xive_esb_read(xd, XIVE_ESB_GET);
> +
> +		/*
> +		 * The esb value being all 1's means we couldn't get
> +		 * the PQ state of the interrupt through mmio. It may
> +		 * happen, for example when querying a PHB interrupt
> +		 * while the PHB is in an error state. We consider the
> +		 * interrupt to be inactive in that case.
> +		 */
> +		*state = (pq != XIVE_ESB_INVALID) && !xd->stale_p &&
> +			(xd->saved_p || !!(pq & XIVE_ESB_VAL_P));
>  		return 0;
>  	default:
>  		return -EINVAL;
> 

