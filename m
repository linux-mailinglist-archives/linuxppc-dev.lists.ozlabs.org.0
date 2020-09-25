Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00259277FD4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Sep 2020 07:16:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ByKrb6tcVzDq8M
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Sep 2020 15:16:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=79.137.123.220;
 helo=smtpout1.mo804.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo804.mail-out.ovh.net
 (smtpout1.mo804.mail-out.ovh.net [79.137.123.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ByKVM06YBzDqpq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Sep 2020 15:00:23 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.56])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id BC02765481B8;
 Fri, 25 Sep 2020 07:00:17 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 25 Sep
 2020 07:00:16 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00180b51549-7903-4142-94fa-38c9debec93b,
 9FEABA9465DDD0BD54BA607D821A18C8532B37F7) smtp.auth=clg@kaod.org
Subject: Re: [PATCH v3] powerpc/pci: unmap legacy INTx interrupts when a PHB
 is removed
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20200923074058.203393-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <921d6cf0-7ef6-ab50-bba2-1c85336c4c73@kaod.org>
Date: Fri, 25 Sep 2020 07:00:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200923074058.203393-1-clg@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 995423e7-dc7e-45aa-9840-5449c6fc360e
X-Ovh-Tracer-Id: 8746271954988403680
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudelgdekiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruh
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/23/20 9:40 AM, Cédric Le Goater wrote:
> When a passthrough IO adapter is removed from a pseries machine using
> hash MMU and the XIVE interrupt mode, the POWER hypervisor expects the
> guest OS to clear all page table entries related to the adapter. If
> some are still present, the RTAS call which isolates the PCI slot
> returns error 9001 "valid outstanding translations" and the removal of
> the IO adapter fails. This is because when the PHBs are scanned, Linux
> maps automatically the INTx interrupts in the Linux interrupt number
> space but these are never removed.
> 
> To solve this problem, we introduce a PPC platform specific
> pcibios_remove_bus() routine which clears all interrupt mappings when
> the bus is removed. This also clears the associated page table entries
> of the ESB pages when using XIVE.
> 
> For this purpose, we record the logical interrupt numbers of the
> mapped interrupt under the PHB structure and let pcibios_remove_bus()
> do the clean up.
> 
> Since some PCI adapters, like GPUs, use the "interrupt-map" property
> to describe interrupt mappings other than the legacy INTx interrupts,
> we can not restrict the size of the mapping array to PCI_NUM_INTX. The
> number of interrupt mappings is computed from the "interrupt-map"
> property and the mapping array is allocated accordingly.
> 
> Cc: "Oliver O'Halloran" <oohall@gmail.com>
> Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> 
>  Changes in v3 :
> 
>  - NULLified 'irq_map' in pci_irq_map_dispose()


Forge that. I am going to move the kfree() in the routine freeing the 
PCI controller structure.

Thanks,

C. 
