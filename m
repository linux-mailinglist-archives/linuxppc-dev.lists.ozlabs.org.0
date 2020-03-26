Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B86A4193B45
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 09:47:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nzC02qKjzDqcY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 19:47:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.111.220;
 helo=1.mo179.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 1.mo179.mail-out.ovh.net (1.mo179.mail-out.ovh.net
 [178.33.111.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nz9J5JfRzDqN6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 19:46:10 +1100 (AEDT)
Received: from player691.ha.ovh.net (unknown [10.110.115.111])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id BCF811605CB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 09:46:05 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id 439AE10E299E8;
 Thu, 26 Mar 2020 08:45:53 +0000 (UTC)
Subject: Re: [PATCH v2] powerpc/XIVE: SVM: share the event-queue page with the
 Hypervisor.
To: Ram Pai <linuxram@us.ibm.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <1585211927-784-1-git-send-email-linuxram@us.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9d597905-ca7f-0daf-abaf-93ed88846c70@kaod.org>
Date: Thu, 26 Mar 2020 09:45:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1585211927-784-1-git-send-email-linuxram@us.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 7767864933461887974
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudehhedguddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheiledurdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: aik@ozlabs.ru, andmike@linux.ibm.com, groug@kaod.org,
 sukadev@linux.vnet.ibm.com, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/26/20 9:38 AM, Ram Pai wrote:
> XIVE interrupt controller use an Event Queue (EQ) to enqueue event

The XIVE interrupt controller uses ... (my bad)

> notifications when an exception occurs. The EQ is a single memory page
> provided by the O/S defining a circular buffer, one per server and
> priority couple.
> 
> On baremetal, the EQ page is configured with an OPAL call. On pseries,
> an extra hop is necessary and the guest OS uses the hcall
> H_INT_SET_QUEUE_CONFIG to configure the XIVE interrupt controller.
> 
> The XIVE controller being Hypervisor privileged, it will not be allowed
> to enqueue event notifications for a Secure VM unless the EQ pages are
> shared by the Secure VM.
> 
> Hypervisor/Ultravisor still requires support for the TIMA and ESB page
> fault handlers. Until this is complete, QEMU can use the emulated XIVE
> device for Secure VMs, option "kernel_irqchip=off" on the QEMU pseries
> machine.
> 
> Cc: kvm-ppc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> Cc: Michael Anderson <andmike@linux.ibm.com>
> Cc: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
> Cc: Paul Mackerras <paulus@ozlabs.org>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Cedric Le Goater <clg@fr.ibm.com>

clg@fr.ibm.com is insecure. Please use clg@kaod.org.

> Cc: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>

Reviewed-by: Cedric Le Goater <clg@kaod.org>

Thanks,

C.

> 
> v2: better description of the patch from Cedric.
> ---
>  arch/powerpc/sysdev/xive/spapr.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
> index 55dc61c..608b52f 100644
> --- a/arch/powerpc/sysdev/xive/spapr.c
> +++ b/arch/powerpc/sysdev/xive/spapr.c
> @@ -26,6 +26,8 @@
>  #include <asm/xive.h>
>  #include <asm/xive-regs.h>
>  #include <asm/hvcall.h>
> +#include <asm/svm.h>
> +#include <asm/ultravisor.h>
> 
>  #include "xive-internal.h"
> 
> @@ -501,6 +503,9 @@ static int xive_spapr_configure_queue(u32 target, struct xive_q *q, u8 prio,
>  		rc = -EIO;
>  	} else {
>  		q->qpage = qpage;
> +		if (is_secure_guest())
> +			uv_share_page(PHYS_PFN(qpage_phys),
> +					1 << xive_alloc_order(order));
>  	}
>  fail:
>  	return rc;
> @@ -534,6 +539,8 @@ static void xive_spapr_cleanup_queue(unsigned int cpu, struct xive_cpu *xc,
>  		       hw_cpu, prio);
> 
>  	alloc_order = xive_alloc_order(xive_queue_shift);
> +	if (is_secure_guest())
> +		uv_unshare_page(PHYS_PFN(__pa(q->qpage)), 1 << alloc_order);
>  	free_pages((unsigned long)q->qpage, alloc_order);
>  	q->qpage = NULL;
>  }
> 

