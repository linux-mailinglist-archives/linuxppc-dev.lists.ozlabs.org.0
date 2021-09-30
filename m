Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FBE41DA56
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 14:56:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKtXk1Jbhz3bP6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 22:56:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.58.48; helo=6.mo548.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 1800 seconds by postgrey-1.36 at boromir;
 Thu, 30 Sep 2021 22:55:57 AEST
Received: from 6.mo548.mail-out.ovh.net (6.mo548.mail-out.ovh.net
 [188.165.58.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKtXF5h6Pz2yJN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 22:55:55 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.62])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0DC5C2037A;
 Thu, 30 Sep 2021 12:17:55 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 30 Sep
 2021 14:17:55 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002b469504d-1c6f-4f57-82d9-483c1b8cbcf5,
 0A481A1303AC30E75EABA285C798D9966300174A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9e322894-1854-fd7f-51e6-82b08ed8f6d7@kaod.org>
Date: Thu, 30 Sep 2021 14:17:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] powerpc/pseries/msi: Add an empty irq_write_msi_msg()
 handler
Content-Language: en-US
To: <linuxppc-dev@lists.ozlabs.org>
References: <20210930102535.1047230-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20210930102535.1047230-1-clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fac97daa-0872-4320-9c11-e850089edcbd
X-Ovh-Tracer-Id: 12318189407916231587
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudekgedggeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekvdfgudevkeefkeeltdejteekvdegffegudetgeettdffjeefheekfeelffdtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegsrhhkihhngheslhhinhhugidrvhhnvghtrdhisghmrdgtohhm
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
Cc: Brian King <brking@linux.vnet.ibm.com>,
 Wen Xiong <wenxiong@linux.vnet.ibm.com>,
 Douglas Miller <dougmill@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/30/21 12:25, Cédric Le Goater wrote:
> The IPR drivers tests for MSI support at probe time with MSI vector 0
> and when done, frees the IRQ with free_irq(). This test was introduced
> by 95fecd90397e ("ipr: add test for MSI interrupt support") as an
> improvement of commit 5a9ef25b14d3 ("[SCSI] ipr: add MSI support")
> because a boot failure was reported on a Bimini PowerPC system :
> 
>    https://x-lore.kernel.org/all/1242926159.3007.5.camel@localhost.localdomain/
> 
> It was finally decided to remove MSI support on Bimini systems in
> 6eb0ac03899a ("powerpc/maple: Add a quirk to disable MSI for IPR on
> Bimini").
> 
> Linux 5.15-rc1 added MSI domain support to the pseries machine and
> when free_irq is called() in the driver, msi_domain_deactivate() also
> is. This resets the MSI table entry of the associate vector by calling
> __pci_write_msi_msg() with an empty message and breaks any further
> activation of the same vector. In the case of the IPR driver, it
> breaks the initialization sequence of the IOA.
> 
> Introduce an empty irq_write_msi_msg() handler in the MSI domain of
> the pseries machine to avoid clearing the MSI vector entry. Updating
> the entry is not strictly necessary since it is initialized by the
> underlying hypervisor, PowerVM or QEMU/KVM.
> 
> Cc: Wen Xiong <wenxiong@linux.vnet.ibm.com>
> Cc: Douglas Miller <dougmill@linux.vnet.ibm.com>
> Cc: Brian King <brking@linux.vnet.ibm.com>
> Fixes: a5f3d2c17b07 ("powerpc/pseries/pci: Add MSI domains")
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

This is missing :

Reported-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>

Thanks,

C.

> ---
> 
>   We could also revert commit 95fecd90397e ("ipr: add test for MSI
>   interrupt support") which doesn't seem very useful nowdays. Or
>   rewrite the test to improve how MSI vectors are used.
> 
>   Please advise !
> 
>   Thanks,
> 
> 
>   arch/powerpc/platforms/pseries/msi.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
> index 1b305e411862..37eb35f5194d 100644
> --- a/arch/powerpc/platforms/pseries/msi.c
> +++ b/arch/powerpc/platforms/pseries/msi.c
> @@ -507,12 +507,27 @@ static void pseries_msi_unmask(struct irq_data *d)
>   	irq_chip_unmask_parent(d);
>   }
>   
> +static void pseries_msi_write_msg(struct irq_data *data, struct msi_msg *msg)
> +{
> +	struct msi_desc *entry = irq_data_get_msi_desc(data);
> +
> +	/* Do not update the MSIx vector table. This is not strictly
> +	 * necessary since the table is initialized by the underlying
> +	 * hypervisor, PowerVM or QEMU/KVM. However, if the MSIx
> +	 * vector entry is cleared, any further activation will fail.
> +	 * This can happen in some drivers (IPR) which deactivate the
> +	 * IRQ used for testing MSI support.
> +	 */
> +	entry->msg = *msg;
> +}
> +
>   static struct irq_chip pseries_pci_msi_irq_chip = {
>   	.name		= "pSeries-PCI-MSI",
>   	.irq_shutdown	= pseries_msi_shutdown,
>   	.irq_mask	= pseries_msi_mask,
>   	.irq_unmask	= pseries_msi_unmask,
>   	.irq_eoi	= irq_chip_eoi_parent,
> +	.irq_write_msi_msg	= pseries_msi_write_msg,
>   };
>   
>   static struct msi_domain_info pseries_msi_domain_info = {
> 

