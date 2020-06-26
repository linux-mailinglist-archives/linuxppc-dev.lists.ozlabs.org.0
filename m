Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6049B20AD22
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 09:29:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tT5n71KSzDqSv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 17:29:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.72.44; helo=9.mo173.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 9.mo173.mail-out.ovh.net (9.mo173.mail-out.ovh.net
 [46.105.72.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tT3b6fqfzDqv8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 17:27:07 +1000 (AEST)
Received: from player734.ha.ovh.net (unknown [10.108.35.90])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 71BC6143960
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 09:27:03 +0200 (CEST)
Received: from kaod.org (lfbn-tou-1-921-245.w86-210.abo.wanadoo.fr
 [86.210.152.245]) (Authenticated sender: clg@kaod.org)
 by player734.ha.ovh.net (Postfix) with ESMTPSA id 4F79413A000E6;
 Fri, 26 Jun 2020 07:26:52 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0018ba46917-0696-40ce-8ee4-92facd6b3767,4AA08B4753365576F5C892DCFEC488B61DD07F5F)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH] powerpc/pseries: Use doorbells even if XIVE is available
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200624134724.2343007-1-npiggin@gmail.com>
 <87r1u4aqzm.fsf@mpe.ellerman.id.au>
 <af42c250-cf4b-0815-c91c-9363445383e7@kaod.org>
Message-ID: <d5aa6dea-0126-724d-2d1e-0726584a1dbd@kaod.org>
Date: Fri, 26 Jun 2020 09:26:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <af42c250-cf4b-0815-c91c-9363445383e7@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 11765372554848930790
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudeltddguddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuhffvfhfkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheevheejjefhtedvueeghfeiffduleeijeehteeuvdfgheeikeevffeghfeviefhnecukfhppedtrddtrddtrddtpdekiedrvddutddrudehvddrvdegheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejfeegrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: Anton Blanchard <anton@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[ ...  ]

>>> An option vector (or dt-cpu-ftrs) could be defined to disable msgsndp
>>> to get KVM performance back.
> 
> An option vector would require a PAPR change. Unless the architecture 
> reserves some bits for the implementation, but I don't think so. Same
> for CAS.
> 
>> Qemu/KVM populates /proc/device-tree/hypervisor, so we *could* look at
>> that. Though adding PowerVM/KVM specific hacks is obviously a very
>> slippery slope.
> 
> QEMU could advertise a property "emulated-msgsndp", or something similar, 
> which would be interpreted by Linux as a CPU feature and taken into account 
> when doing the IPIs.

This is really a PowerVM optimization. 

> The CPU setup for XIVE needs a cleanup also. There is no need to allocate
> interrupts for IPIs anymore in that case.

We need to keep these for the other cores. The XIVE layer is unchanged.
 
C. 
