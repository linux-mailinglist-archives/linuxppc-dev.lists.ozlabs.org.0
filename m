Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C28A34868ED
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 18:43:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVDGt50psz30NZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 04:43:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=87.98.187.244;
 helo=10.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from 10.mo552.mail-out.ovh.net (10.mo552.mail-out.ovh.net
 [87.98.187.244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVDGN4MlDz2ynD
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 04:43:08 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.56])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 0C9F022A81;
 Thu,  6 Jan 2022 17:36:27 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 6 Jan
 2022 18:36:26 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00650ad3545-7dfc-4c95-bd5b-db5206860aa1,
 021048AAC49377EB75D2DE2E73CB44671C288654) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <1ea0edd7-8450-fb09-32d2-7e7c00c4aa4b@kaod.org>
Date: Thu, 6 Jan 2022 18:36:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH]powerpc/xive: Export XIVE IPI information for online-only
 processors.
Content-Language: en-US
To: Sachin Sant <sachinp@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
References: <164146703333.19039.10920919226094771665.sendpatchset@MacBook-Pro.local>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <164146703333.19039.10920919226094771665.sendpatchset@MacBook-Pro.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2eecad77-72a4-4d6e-b27b-a8b1c92ee88a
X-Ovh-Tracer-Id: 2925650909621488538
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudefledguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/6/22 12:03, Sachin Sant wrote:
> Cédric pointed out that XIVE IPI information exported via sysfs
> (debug/powerpc/xive) display empty lines for processors which are
> not online.
> 
> Switch to using for_each_online_cpu() so that information is
> displayed for online-only processors.
> 
> Reported-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Sachin Sant <sachinp@linux.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
> diff -Naurp a/arch/p werpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
> --- a/arch/powerpc/sysdev/xive/common.c	2022-01-05 08:52:59.460118219 -0500
> +++ b/arch/powerpc/sysdev/xive/common.c	2022-01-06 02:34:20.994513145 -0500
> @@ -1791,7 +1791,7 @@ static int xive_ipi_debug_show(struct se
>   	if (xive_ops->debug_show)
>   		xive_ops->debug_show(m, private);
>   
> -	for_each_possible_cpu(cpu)
> +	for_each_online_cpu(cpu)
>   		xive_debug_show_ipi(m, cpu);
>   	return 0;
>   }
> 

