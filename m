Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C14193E5AAD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Aug 2021 15:05:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkY8w4KDLz3cJW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Aug 2021 23:05:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=87.98.187.244; helo=10.mo52.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 1201 seconds by postgrey-1.36 at boromir;
 Tue, 10 Aug 2021 23:05:07 AEST
Received: from 10.mo52.mail-out.ovh.net (10.mo52.mail-out.ovh.net
 [87.98.187.244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GkY8M3ZnZz2yXW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Aug 2021 23:05:05 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.98])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 762FF28E0AD;
 Tue, 10 Aug 2021 14:29:24 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 10 Aug
 2021 14:29:23 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002fbe691c1-0908-429f-92dd-d22aaa425cef,
 8F36BE46FB8773C29BD4C9A30C998E4B5B7B2B54) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH v2] powerpc/xive: Do not skip CPU-less nodes when creating
 the IPIs
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: <linuxppc-dev@lists.ozlabs.org>
References: <20210807072057.184698-1-clg@kaod.org>
 <dbcf71dc-2e5e-a6bc-9b55-f4e2f023dfd5@kaod.org>
Message-ID: <6c72a812-c0e9-27c3-06bb-5db7bd7680eb@kaod.org>
Date: Tue, 10 Aug 2021 14:29:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <dbcf71dc-2e5e-a6bc-9b55-f4e2f023dfd5@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 03d7914e-046e-4507-bb90-a0c02437d3f6
X-Ovh-Tracer-Id: 8152641226076752803
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrjeelgdehgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuhffvfhfkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelkeefveffvefgfffhgfehveeukeekteekteeitdejteetleffgffhtdetffetudenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

 
> I forgot to add that this version does break irqbalance anymore, since
                                        
                                ... does not break ...

Sorry for the noise,

> Linux is not mapping interrupts of CPU-less nodes.
> 
> Anyhow, irqbalance is now fixed : 
> 
>   https://github.com/Irqbalance/irqbalance/commit/a7f81483a95a94d6a62ca7fb999a090e01c0de9b
> 
> So v1 (plus irqbalance patch above) or v2 are safe to use. I do prefer 
> v2.
> 
> Thanks to Laurent and Srikar for the extra tests,
> 
> C.
