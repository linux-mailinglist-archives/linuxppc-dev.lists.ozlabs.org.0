Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A5F333C57
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 13:14:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwWGD4Jl5z3cLk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 23:14:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.49.222; helo=6.mo52.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 6.mo52.mail-out.ovh.net (6.mo52.mail-out.ovh.net
 [188.165.49.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwWFv3vvFz2xxp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 23:13:54 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.53])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 6778A23CE18;
 Wed, 10 Mar 2021 12:18:51 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 10 Mar
 2021 12:18:50 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001ec6da1e9-b4b1-4b66-8e8a-1f3004fd19b8,
 DA160024BEE8362F46BAC18ABAE7D936D1F8982C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH] powerpc/xmon: Check cpu id in commands "c#", "dp#" and
 "dx#"
To: Greg Kurz <groug@kaod.org>, <linuxppc-dev@lists.ozlabs.org>
References: <161531347060.252863.10490063933688958044.stgit@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f65a4c85-ac5a-9ef1-c1a9-cc7e92b95fd5@kaod.org>
Date: Wed, 10 Mar 2021 12:18:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <161531347060.252863.10490063933688958044.stgit@bahia.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a3310bfd-f24f-4ebf-ae6c-95a27d209d1d
X-Ovh-Tracer-Id: 12329166930291624925
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddukedgvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
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

On 3/9/21 7:11 PM, Greg Kurz wrote:
> All these commands end up peeking into the PACA using the user originated
> cpu id as an index. Check the cpu id is valid in order to prevent xmon to
> crash. Instead of printing an error, this follows the same behavior as the
> "lp s #" command : ignore the buggy cpu id parameter and fall back to the
> #-less version of the command.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>


> ---
>  arch/powerpc/xmon/xmon.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index 80fbf8968f77..d3d6e044228e 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -1248,7 +1248,7 @@ static int cpu_cmd(void)
>  	unsigned long cpu, first_cpu, last_cpu;
>  	int timeout;
>  
> -	if (!scanhex(&cpu)) {
> +	if (!scanhex(&cpu) || cpu >= num_possible_cpus()) {
>  		/* print cpus waiting or in xmon */
>  		printf("cpus stopped:");
>  		last_cpu = first_cpu = NR_CPUS;
> @@ -2678,7 +2678,7 @@ static void dump_pacas(void)
>  
>  	termch = c;	/* Put c back, it wasn't 'a' */
>  
> -	if (scanhex(&num))
> +	if (scanhex(&num) && num < num_possible_cpus())
>  		dump_one_paca(num);
>  	else
>  		dump_one_paca(xmon_owner);
> @@ -2751,7 +2751,7 @@ static void dump_xives(void)
>  
>  	termch = c;	/* Put c back, it wasn't 'a' */
>  
> -	if (scanhex(&num))
> +	if (scanhex(&num) && num < num_possible_cpus())
>  		dump_one_xive(num);
>  	else
>  		dump_one_xive(xmon_owner);
> 
> 

