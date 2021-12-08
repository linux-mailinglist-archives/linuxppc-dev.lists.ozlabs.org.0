Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 406D546D13F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 11:45:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8DMg1B51z3bY9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 21:45:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8DM84vr0z2yR8
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 21:44:50 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.35])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 4A0F4D092F09;
 Wed,  8 Dec 2021 11:44:42 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 8 Dec
 2021 11:44:40 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001f5056120-68a4-4c0a-bc06-f617410d6d7e,
 EB01F339838E5AA67C986A6C3251B49097B81903) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.201.172.254
Message-ID: <e92f2bb3-b5e1-c870-8151-3917a789a640@kaod.org>
Date: Wed, 8 Dec 2021 11:44:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [patch V2 01/23] powerpc/4xx: Remove MSI support which never
 worked
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, Michael Ellerman
 <mpe@ellerman.id.au>, LKML <linux-kernel@vger.kernel.org>
References: <20211206210147.872865823@linutronix.de>
 <20211206210223.872249537@linutronix.de>
 <8d1e9d2b-fbe9-2e15-6df6-03028902791a@kaod.org>
 <87ilw0odel.fsf@mpe.ellerman.id.au>
 <27f22e0e-8f84-a6d7-704b-d9eddc642d74@kaod.org> <8735n42lld.ffs@tglx>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <8735n42lld.ffs@tglx>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d54a9dd7-eba7-4e7f-a7a0-0dc7c43fc796
X-Ovh-Tracer-Id: 10131410315672259365
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeekgddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuveelvdejteegteefieevfeetffefvddvieekteevleefgeelgfeutedvfedvfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehhtggrsehlihhnuhigrdhisghmrdgtohhm
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
Cc: linux-hyperv@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Ashok Raj <ashok.raj@intel.com>, Marc Zygnier <maz@kernel.org>, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
 Kevin Tian <kevin.tian@intel.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kalle Valo <kvalo@codeaurora.org>, Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/7/21 21:42, Thomas Gleixner wrote:
> Cedric,
> 
> On Tue, Dec 07 2021 at 16:50, Cédric Le Goater wrote:
>> On 12/7/21 12:36, Michael Ellerman wrote:
>>>
>>> This patch should drop those selects I guess. Can you send an
>>> incremental diff for Thomas to squash in?
>>
>> Sure.
>>
>>> Removing all the tendrils in various device tree files will probably
>>> require some archaeology, and it should be perfectly safe to leave those
>>> in the tree with the driver gone. So I think we can do that as a
>>> subsequent patch, rather than in this series.
>>
>> Here are the changes. Compiled tested with ppc40x and ppc44x defconfigs.
> 
> < Lots of patch skipped />
>> @@ -141,7 +138,6 @@ config REDWOOD
>>    	select FORCE_PCI
>>    	select PPC4xx_PCI_EXPRESS
>>    	select PCI_MSI
>> -	select PPC4xx_MSI
>>    	help
>>    	  This option enables support for the AMCC PPC460SX Redwood board.
> 
> While that is incremental it certainly is worth a patch on it's
> own. Could you add a proper changelog and an SOB please?

Here you are.

  https://github.com/legoater/linux/commit/75d2764b11fe8f6d8bf50d60a3feb599ce27b16d

Thanks,

C.
