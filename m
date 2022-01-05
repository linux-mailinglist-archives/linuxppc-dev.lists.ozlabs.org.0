Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD7B4854C2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jan 2022 15:40:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTXFm3XTTz2x9G
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 01:40:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.49.213;
 helo=5.mo548.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 5.mo548.mail-out.ovh.net (5.mo548.mail-out.ovh.net
 [188.165.49.213])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTXFG6SVcz2xtQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jan 2022 01:39:44 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.219])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id A7C79211CB;
 Wed,  5 Jan 2022 14:39:38 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 5 Jan
 2022 15:39:37 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00338867c92-edd2-45e1-8b1b-fa4ddd811942,
 4E25ECD23303FA48A052C8093983CE1E6FD1FC38) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c28f88f4-c2f8-fc91-2a0f-eb9b96889274@kaod.org>
Date: Wed, 5 Jan 2022 15:39:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH]powerpc/xmon: Dump XIVE information for online-only
 processors.
Content-Language: en-US
To: Sachin Sant <sachinp@linux.vnet.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
References: <164139226833.12930.272224382183014664.sendpatchset@MacBook-Pro.local>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <164139226833.12930.272224382183014664.sendpatchset@MacBook-Pro.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4690d77b-44c4-45cc-9ce5-b81b8b2e4be7
X-Ovh-Tracer-Id: 12513814516316212122
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudefiedgfeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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

On 1/5/22 15:17, Sachin Sant wrote:
> dxa command in XMON debugger iterates through all possible processors.
> As a result, empty lines are printed even for processors which are not
> online.
> 
> CPU 47:pp=00 CPPR=ff IPI=0x0040002f PQ=-- EQ idx=699 T=0 00000000 00000000
> CPU 48:
> CPU 49:
> 
> Restrict XIVE information(dxa) to be displayed for online processors only.
> 
> Signed-off-by: Sachin Sant <sachinp@linux.vnet.ibm.com>

Looks good to me. We should do the same for :

   /sys/kernel/debug/powerpc/xive/ipis

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
> diff -Naurp a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> --- a/arch/powerpc/xmon/xmon.c	2022-01-05 08:52:59.480118166 -0500
> +++ b/arch/powerpc/xmon/xmon.c	2022-01-05 08:56:18.469589555 -0500
> @@ -2817,12 +2817,12 @@ static void dump_all_xives(void)
>   {
>   	int cpu;
>   
> -	if (num_possible_cpus() == 0) {
> +	if (num_online_cpus() == 0) {
>   		printf("No possible cpus, use 'dx #' to dump individual cpus\n");
>   		return;
>   	}
>   
> -	for_each_possible_cpu(cpu)
> +	for_each_online_cpu(cpu)
>   		dump_one_xive(cpu);
>   }
>   
> 

