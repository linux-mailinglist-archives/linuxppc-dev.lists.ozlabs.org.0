Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CD822E94A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 11:41:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFZZ93snJzF0bG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 19:41:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.228; helo=12.mo6.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 12.mo6.mail-out.ovh.net (12.mo6.mail-out.ovh.net
 [178.32.125.228])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFZWD4YF3zDqBK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 19:38:48 +1000 (AEST)
Received: from player695.ha.ovh.net (unknown [10.108.35.240])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 5B5CD221141
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 11:38:40 +0200 (CEST)
Received: from kaod.org (bad36-1-78-202-132-1.fbx.proxad.net [78.202.132.1])
 (Authenticated sender: clg@kaod.org)
 by player695.ha.ovh.net (Postfix) with ESMTPSA id 8891A14979797;
 Mon, 27 Jul 2020 09:38:33 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0045a1d8947-986f-459b-a880-f86db548c305,F8FE5446E6A712E1B8ADD27A8D09714C92F8C0F3)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH] KVM: PPC: Book3S HV: increase KVMPPC_NR_LPIDS on POWER8
 and POWER9
To: Paul Mackerras <paulus@ozlabs.org>
References: <20200608115714.1139735-1-clg@kaod.org>
 <20200723062016.GE213782@thinks.paulus.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <848f132c-eb13-fa80-6637-e52f90296b99@kaod.org>
Date: Mon, 27 Jul 2020 11:38:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200723062016.GE213782@thinks.paulus.ozlabs.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11573969568935545789
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedriedtgddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeffvddtudegieefudeugffhjefgieegieegleettdehgfeiieevueeihfegfefgnecukfhppedtrddtrddtrddtpdejkedrvddtvddrudefvddrudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheileehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/23/20 8:20 AM, Paul Mackerras wrote:
> On Mon, Jun 08, 2020 at 01:57:14PM +0200, Cédric Le Goater wrote:
>> POWER8 and POWER9 have 12-bit LPIDs. Change LPID_RSVD to support up to
>> (4096 - 2) guests on these processors. POWER7 is kept the same with a
>> limitation of (1024 - 2), but it might be time to drop KVM support for
>> POWER7.
>>
>> Tested with 2048 guests * 4 vCPUs on a witherspoon system with 512G
>> RAM and a bit of swap.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Thanks, patch applied to my kvm-ppc-next branch.

We have pushed the limits further on a 1TB system and reached the limit
of 4094 guests with 16 vCPUs. 

With more vCPUs, the system starts to check-stop. We believe that the 
pages used by the interrupt controller for the backing store of the 
XIVE internal tables (END and NVT) allocated with GFP_KERNEL are 
reclaimable.

I am thinking of changing the allocation flags with :  
 
	__GFP_NORETRY | __GFP_NOWARN | __GFP_NOMEMALLOC

because XIVE should be able to fail gracefully if the system is 
low on mem. Is that correct ? 

Thanks,  

C.
