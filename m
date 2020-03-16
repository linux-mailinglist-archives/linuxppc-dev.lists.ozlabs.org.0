Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B87418691C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 11:31:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gsyy240jzDqPw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 21:31:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.111.180;
 helo=1.mo173.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 3601 seconds by postgrey-1.36 at bilbo;
 Mon, 16 Mar 2020 21:29:12 AEDT
Received: from 1.mo173.mail-out.ovh.net (1.mo173.mail-out.ovh.net
 [178.33.111.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gswm0nZfzDqHw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 21:29:07 +1100 (AEDT)
Received: from player694.ha.ovh.net (unknown [10.110.103.168])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 1D0F1135455
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 09:34:02 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player694.ha.ovh.net (Postfix) with ESMTPSA id 35843105DF5BB;
 Mon, 16 Mar 2020 08:33:45 +0000 (UTC)
Subject: Re: [RFC PATCH v1] powerpc/XIVE: SVM: share the event-queue page with
 the Hypervisor.
To: Ram Pai <linuxram@us.ibm.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <1584311852-15471-1-git-send-email-linuxram@us.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a0f72ede-4f1b-34df-b0d3-4f71944faa25@kaod.org>
Date: Mon, 16 Mar 2020 09:33:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1584311852-15471-1-git-send-email-linuxram@us.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 4177933080325229542
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudefvddggeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieelgedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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

( Please use clg@kaod.org. I hardly use clg@fr.ibm.com.)

On 3/15/20 11:37 PM, Ram Pai wrote:
> XIVE interrupt controller maintains a Event-Queue(EQ) page. This page is
> used to communicate events with the Hypervisor/Qemu.

Here is an alternative for the above :

    XIVE interrupt controller use an Event Queue (EQ) to enqueue event 
    notifications when an exception occurs. The EQ is a single memory page 
    provided by the O/S defining a circular buffer, one per server and 
    priority couple.

    On baremetal, the EQ page is configured with an OPAL call. On pseries,
    an extra hop is necessary and the guest OS uses the hcall 
    H_INT_SET_QUEUE_CONFIG to configure the XIVE interrupt controller. 

> In Secure-VM, unless a page is shared with the Hypervisor, 
> the Hypervisor will not be able to read/write to that page.

This is a bit confusing to me as no software is involved when delivering 
the interrupt to the guest. When you are referring to the "Hypervisor", 
is it software and hardware ?  

If so, I would say:

    The XIVE controller being Hypervisor privileged, it will not be 
    allowed to enqueue event notifications for a Secure VM unless  
    the EQ pages are in the shared page pool.

> Explicitly share the EQ page with the Hypervisor, and unshare it
> during cleanup.  This enables SVM to use XIVE.

yes but KVM also needs support for the TIMA and ESB page fault handlers. 

> (NOTE: If the Hypervisor/Ultravisor is unable to target interrupts
>  directly to Secure VM, use "kernel_irqchip=off" on the qemu command
>  line).

So, I would say here :

   Hypervisor/Ultravisor still requires support for the TIMA and ESB page 
   fault handlers. Until this is complete, QEMU can use the emulated XIVE
   device for Secure VMs, option "kernel_irqchip=off" on the QEMU pseries 
   machine.

The rest looks good to me.

Thanks,

C. 

 
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
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
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

