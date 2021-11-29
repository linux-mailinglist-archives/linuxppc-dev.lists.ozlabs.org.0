Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECF7460F7E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 08:42:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2clJ0vnPz3bZM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 18:42:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.48.137; helo=9.mo548.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 9.mo548.mail-out.ovh.net (9.mo548.mail-out.ovh.net
 [46.105.48.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2ckm3Prvz2xXy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 18:42:24 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.7])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id D10AB2064C;
 Mon, 29 Nov 2021 07:33:34 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 29 Nov
 2021 08:33:33 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0058ffb0110-7673-40ee-a51a-c9a65a45fa89,
 3279756C2EB34864E332BB908A933B747C53BE44) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b1a6d267-c7b4-c4b9-ab0e-f5cc32bfe9bf@kaod.org>
Date: Mon, 29 Nov 2021 08:33:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [patch 05/22] genirq/msi: Fixup includes
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
References: <20211126222700.862407977@linutronix.de>
 <20211126223824.382273262@linutronix.de>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211126223824.382273262@linutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 67cb6c92-6833-4394-901b-34c8b386eb6d
X-Ovh-Tracer-Id: 9389442276353674140
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrheekgdegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
Cc: linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Marc Zygnier <maz@kernel.org>, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
 Kevin Tian <kevin.tian@intel.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Megha Dey <megha.dey@intel.com>,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/27/21 02:18, Thomas Gleixner wrote:
> Remove the kobject.h include from msi.h as it's not required and add a
> sysfs.h include to the core code instead.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>


This patch breaks compile on powerpc :

   CC      arch/powerpc/kernel/msi.o
In file included from ../arch/powerpc/kernel/msi.c:7:
../include/linux/msi.h:410:65: error: ‘struct cpumask’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
   410 | int msi_domain_set_affinity(struct irq_data *data, const struct cpumask *mask,
       |                                                                 ^~~~~~~
cc1: all warnings being treated as errors

Below is fix you can merge in patch 5.

Thanks,

C.

--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -2,6 +2,7 @@
  #ifndef LINUX_MSI_H
  #define LINUX_MSI_H
  
+#include <linux/cpumask.h>
  #include <linux/list.h>
  #include <asm/msi.h>

> ---
>   include/linux/msi.h |    1 -
>   kernel/irq/msi.c    |    1 +
>   2 files changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -2,7 +2,6 @@
>   #ifndef LINUX_MSI_H
>   #define LINUX_MSI_H
>   
> -#include <linux/kobject.h>
>   #include <linux/list.h>
>   #include <asm/msi.h>
>   
> --- a/kernel/irq/msi.c
> +++ b/kernel/irq/msi.c
> @@ -14,6 +14,7 @@
>   #include <linux/irqdomain.h>
>   #include <linux/msi.h>
>   #include <linux/slab.h>
> +#include <linux/sysfs.h>
>   #include <linux/pci.h>
>   
>   #include "internals.h"
> 

