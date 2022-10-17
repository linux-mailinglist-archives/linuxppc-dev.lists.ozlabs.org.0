Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2042600AE3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Oct 2022 11:34:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MrWzj5zmKz3dvw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Oct 2022 20:34:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=79.137.123.220; helo=smtpout2.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 578 seconds by postgrey-1.36 at boromir; Mon, 17 Oct 2022 20:34:09 AEDT
Received: from smtpout2.mo529.mail-out.ovh.net (smtpout2.mo529.mail-out.ovh.net [79.137.123.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MrWz561Slz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Oct 2022 20:34:06 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.35])
	by mo529.mail-out.ovh.net (Postfix) with ESMTPS id D37CD132ED2F9;
	Mon, 17 Oct 2022 11:18:19 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Mon, 17 Oct
 2022 11:18:19 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-105G006581fe873-9005-4a83-b87d-4f4ed40551a6,
                    03067325AA2E056BEC2EB751A0783F460AB0E9BE) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e7757611-e648-9bec-7e29-225b92fd629a@kaod.org>
Date: Mon, 17 Oct 2022 11:18:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] powerpc/xive: add missing iounmap() in error path in
 xive_spapr_populate_irq_data()
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>, <linuxppc-dev@lists.ozlabs.org>
References: <20221017032333.1852406-1-yangyingliang@huawei.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221017032333.1852406-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: e823773e-96d6-479e-81e5-c58aa0225303
X-Ovh-Tracer-Id: 2151313250605698016
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekledgudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohephigrnhhghihinhhglhhirghngheshhhurgifvghirdgtohhmpdhlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdpsggvnhhhsehkvghrnhgvlhdrtghrrghshhhinhhgrdhorhhgpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/17/22 05:23, Yang Yingliang wrote:
> If remapping 'data->trig_page' fails, the 'data->eoi_mmio' need be unmapped
> before returning from xive_spapr_populate_irq_data().
> 
> Fixes: eac1e731b59e ("powerpc/xive: guest exploitation of the XIVE interrupt controller")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.
> ---
>   arch/powerpc/sysdev/xive/spapr.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
> index e2c8f93b535b..e45419264391 100644
> --- a/arch/powerpc/sysdev/xive/spapr.c
> +++ b/arch/powerpc/sysdev/xive/spapr.c
> @@ -439,6 +439,7 @@ static int xive_spapr_populate_irq_data(u32 hw_irq, struct xive_irq_data *data)
>   
>   	data->trig_mmio = ioremap(data->trig_page, 1u << data->esb_shift);
>   	if (!data->trig_mmio) {
> +		iounmap(data->eoi_mmio);
>   		pr_err("Failed to map trigger page for irq 0x%x\n", hw_irq);
>   		return -ENOMEM;
>   	}

