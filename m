Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 050042C411F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 14:28:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch1tm4ktTzDqfV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 00:28:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=79.137.123.220;
 helo=smtpout1.mo804.mail-out.ovh.net; envelope-from=groug@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo804.mail-out.ovh.net
 (smtpout1.mo804.mail-out.ovh.net [79.137.123.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch1483d3HzDqW8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 23:51:51 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.90])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id B96687545376;
 Wed, 25 Nov 2020 13:51:47 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 25 Nov
 2020 13:51:46 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003f5f17775-3d78-4887-bece-db38842b427c,
 13817E1CA0648EB9EE095497159C33290D197662) smtp.auth=groug@kaod.org
Date: Wed, 25 Nov 2020 13:51:45 +0100
From: Greg Kurz <groug@kaod.org>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2 2/2] powerpc/pseries: pass MSI affinity to
 irq_create_mapping()
Message-ID: <20201125135145.64a51c4e@bahia.lan>
In-Reply-To: <20201125111657.1141295-3-lvivier@redhat.com>
References: <20201125111657.1141295-1-lvivier@redhat.com>
 <20201125111657.1141295-3-lvivier@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: f9887add-59a7-4ca7-a478-288848d6728e
X-Ovh-Tracer-Id: 6008646329849649656
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudehtddggeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedvfefgtdegleduudejjeelfffghfehtdeigefggfduvdfgkeevgfeftedtjeehveenucffohhmrghinheprhgvughhrghtrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruh
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, Paul
 Mackerras <paulus@samba.org>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 25 Nov 2020 12:16:57 +0100
Laurent Vivier <lvivier@redhat.com> wrote:

> With virtio multiqueue, normally each queue IRQ is mapped to a CPU.
> 
> But since commit 0d9f0a52c8b9f ("virtio_scsi: use virtio IRQ affinity")
> this is broken on pseries.
> 
> The affinity is correctly computed in msi_desc but this is not applied
> to the system IRQs.
> 
> It appears the affinity is correctly passed to rtas_setup_msi_irqs() but
> lost at this point and never passed to irq_domain_alloc_descs()
> (see commit 06ee6d571f0e ("genirq: Add affinity hint to irq allocation"))
> because irq_create_mapping() doesn't take an affinity parameter.
> 
> As the previous patch has added the affinity parameter to
> irq_create_mapping() we can forward the affinity from rtas_setup_msi_irqs()
> to irq_domain_alloc_descs().
> 
> With this change, the virtqueues are correctly dispatched between the CPUs
> on pseries.
> 

Since it is public, maybe add:

BugId: https://bugzilla.redhat.com/show_bug.cgi?id=1702939

?

> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---

Anyway,

Reviewed-by: Greg Kurz <groug@kaod.org>

>  arch/powerpc/platforms/pseries/msi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
> index 133f6adcb39c..b3ac2455faad 100644
> --- a/arch/powerpc/platforms/pseries/msi.c
> +++ b/arch/powerpc/platforms/pseries/msi.c
> @@ -458,7 +458,8 @@ static int rtas_setup_msi_irqs(struct pci_dev *pdev, int nvec_in, int type)
>  			return hwirq;
>  		}
>  
> -		virq = irq_create_mapping(NULL, hwirq);
> +		virq = irq_create_mapping_affinity(NULL, hwirq,
> +						   entry->affinity);
>  
>  		if (!virq) {
>  			pr_debug("rtas_msi: Failed mapping hwirq %d\n", hwirq);

