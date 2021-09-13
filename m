Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE304098CF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 18:20:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7Wsd3MQcz2yZc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 02:20:05 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7WsB2jZvz2xrC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 02:19:40 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.44])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 26866BDC1B10;
 Mon, 13 Sep 2021 18:19:33 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 13 Sep
 2021 18:19:33 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005f9cd1f28-1563-4076-a263-cc79d3707ab1,
 B58C78742DCB5DC23679A7A9E2785397667D7E18) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH AUTOSEL 5.14 38/99] KVM: PPC: Book3S HV: XICS: Fix mapping
 of passthrough interrupts
To: Sasha Levin <sashal@kernel.org>
References: <20210910001558.173296-1-sashal@kernel.org>
 <20210910001558.173296-38-sashal@kernel.org>
 <27739836-bad2-6b3f-7f40-e84663fbbf24@kaod.org> <YTy+xUtEEpln2Sq4@sashalap>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <90cd638d-62d2-8c98-cce0-4c71feee8671@kaod.org>
Date: Mon, 13 Sep 2021 18:19:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTy+xUtEEpln2Sq4@sashalap>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c78f8b93-1b94-4716-88b6-cfd8e4a89938
X-Ovh-Tracer-Id: 8796937449597471526
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudegjedgleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeetfeejteefhfeuveethfduffeftdelvdeghfelhfeljeehheeuieevudeggefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepshgrshhhrghlsehkvghrnhgvlhdrohhrgh
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
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/11/21 4:35 PM, Sasha Levin wrote:
> On Fri, Sep 10, 2021 at 07:48:18AM +0200, Cédric Le Goater wrote:
>> On 9/10/21 2:14 AM, Sasha Levin wrote:
>>> From: Cédric Le Goater <clg@kaod.org>
>>>
>>> [ Upstream commit 1753081f2d445f9157550692fcc4221cd3ff0958 ]
>>>
>>> PCI MSIs now live in an MSI domain but the underlying calls, which
>>> will EOI the interrupt in real mode, need an HW IRQ number mapped in
>>> the XICS IRQ domain. Grab it there.
>>>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>>> Link: https://lore.kernel.org/r/20210701132750.1475580-31-clg@kaod.org
>>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>>
>>
>> Why are we backporting this patch in stable trees ?
>>
>> It should be fine but to compile, we need a partial backport of commit
>> 51be9e51a800 ("KVM: PPC: Book3S HV: XIVE: Fix mapping of passthrough
>> interrupts") which exports irq_get_default_host().
> 
> Or, I can drop it if it makes no sense?

Yes I would. 

It makes sense only with the full patchset, the one reworking PCI MSI 
support in the PPC pSeries and PowerNV platforms.

Thanks,

C.
