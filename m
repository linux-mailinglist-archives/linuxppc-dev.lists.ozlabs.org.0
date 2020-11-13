Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3A02B1B55
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Nov 2020 13:51:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXdcf14mPzDqmb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Nov 2020 23:50:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.254.192; helo=3.mo52.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1200 seconds by postgrey-1.36 at bilbo;
 Fri, 13 Nov 2020 23:45:03 AEDT
Received: from 3.mo52.mail-out.ovh.net (3.mo52.mail-out.ovh.net
 [178.33.254.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXdTq3BcWzDr2h
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Nov 2020 23:44:58 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.48])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 1D58D204EF1;
 Fri, 13 Nov 2020 13:06:16 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 13 Nov
 2020 13:06:15 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002d415765a-705b-4da2-9b01-67ac23f9e562,
 6CF58D6617F62A349CE936A1177A29C0D3476033) smtp.auth=clg@kaod.org
Subject: Re: [RFC PATCH kernel 2/2] powerpc/pci: Remove LSI mappings on device
 teardown
To: Alexey Kardashevskiy <aik@ozlabs.ru>, <linuxppc-dev@lists.ozlabs.org>
References: <20201027090655.14118-1-aik@ozlabs.ru>
 <20201027090655.14118-3-aik@ozlabs.ru>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6c6702bd-dff2-1d34-0f93-4f8011417c64@kaod.org>
Date: Fri, 13 Nov 2020 13:06:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201027090655.14118-3-aik@ozlabs.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e67374c8-6bc1-40fc-bd7f-1a030246aa01
X-Ovh-Tracer-Id: 8554306020416981938
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedruddvhedgfeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheprghikhesohiilhgrsghsrdhruh
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
Cc: Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Qian Cai <cai@lca.pw>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/27/20 10:06 AM, Alexey Kardashevskiy wrote:
> From: Oliver O'Halloran <oohall@gmail.com>
> 
> When a passthrough IO adapter is removed from a pseries machine using hash
> MMU and the XIVE interrupt mode, the POWER hypervisor expects the guest OS
> to clear all page table entries related to the adapter. If some are still
> present, the RTAS call which isolates the PCI slot returns error 9001
> "valid outstanding translations" and the removal of the IO adapter fails.
> This is because when the PHBs are scanned, Linux maps automatically the
> INTx interrupts in the Linux interrupt number space but these are never
> removed.
> 
> This problem can be fixed by adding the corresponding unmap operation when
> the device is removed. There's no pcibios_* hook for the remove case, but
> the same effect can be achieved using a bus notifier.
> 
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks taking care of this.

C. 

> ---
>  arch/powerpc/kernel/pci-common.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
> index be108616a721..95f4e173368a 100644
> --- a/arch/powerpc/kernel/pci-common.c
> +++ b/arch/powerpc/kernel/pci-common.c
> @@ -404,6 +404,27 @@ static int pci_read_irq_line(struct pci_dev *pci_dev)
>  	return 0;
>  }
>  
> +static int ppc_pci_unmap_irq_line(struct notifier_block *nb,
> +			       unsigned long action, void *data)
> +{
> +	struct pci_dev *pdev = to_pci_dev(data);
> +
> +	if (action == BUS_NOTIFY_DEL_DEVICE)
> +		irq_dispose_mapping(pdev->irq);
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block ppc_pci_unmap_irq_notifier = {
> +	.notifier_call = ppc_pci_unmap_irq_line,
> +};
> +
> +static int ppc_pci_register_irq_notifier(void)
> +{
> +	return bus_register_notifier(&pci_bus_type, &ppc_pci_unmap_irq_notifier);
> +}
> +arch_initcall(ppc_pci_register_irq_notifier);
> +
>  /*
>   * Platform support for /proc/bus/pci/X/Y mmap()s.
>   *  -- paulus.
> 

