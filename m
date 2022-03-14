Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 573B24D85E3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Mar 2022 14:28:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHHRP1NX0z3bgG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 00:28:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 1012 seconds by postgrey-1.36 at boromir;
 Tue, 15 Mar 2022 00:27:51 AEDT
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHHQv3TNKz2ymt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 00:27:48 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.17])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id A7E22E9B8208;
 Mon, 14 Mar 2022 14:10:50 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 14 Mar
 2022 14:10:49 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006b55fbfc1-720d-4166-a93a-bb4c771d602f,
 00B622A560025FB732B9BA5E5C4E2A2293E53F9D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0abcf7a0-cca1-b9c2-2a36-4d1da6031cc6@kaod.org>
Date: Mon, 14 Mar 2022 14:10:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] powerpc/xive: fix return value of __setup handler
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, <linuxppc-dev@lists.ozlabs.org>
References: <20220313065936.4363-1-rdunlap@infradead.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220313065936.4363-1-rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c7fa02fd-d0bd-4650-891f-fc5ca3cfc75a
X-Ovh-Tracer-Id: 4528932376781228838
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddvkedggeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekvdfgudevkeefkeeltdejteekvdegffegudetgeettdffjeefheekfeelffdtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehprghulhhushesshgrmhgsrgdrohhrgh
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
Cc: Paul Mackerras <paulus@samba.org>, patches@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/13/22 07:59, Randy Dunlap wrote:
> __setup() handlers should return 1 to obsolete_checksetup() in
> init/main.c to indicate that the boot option has been handled.
> A return of 0 causes the boot option/value to be listed as an Unknown
> kernel parameter and added to init's (limited) argument or environment
> strings. Also, error return codes don't mean anything to
> obsolete_checksetup() -- only non-zero (usually 1) or zero.
> So return 1 from xive_off() and xive_store_eoi_cmdline().
> 
> Fixes: 243e25112d06 ("powerpc/xive: Native exploitation of the XIVE interrupt controller")
> Fixes: c21ee04f11ae ("powerpc/xive: Add a kernel parameter for StoreEOI")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> From: Igor Zhbanov <i.zhbanov@omprussia.ru>
> Link: lore.kernel.org/r/64644a2f-4a20-bab3-1e15-3b2cdd0defe3@omprussia.ru
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: Paul Mackerras <paulus@samba.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>


Thanks,

C.


> ---
>   arch/powerpc/sysdev/xive/common.c |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> --- linux-next-20220310.orig/arch/powerpc/sysdev/xive/common.c
> +++ linux-next-20220310/arch/powerpc/sysdev/xive/common.c
> @@ -1708,20 +1708,20 @@ __be32 *xive_queue_page_alloc(unsigned i
>   static int __init xive_off(char *arg)
>   {
>   	xive_cmdline_disabled = true;
> -	return 0;
> +	return 1;
>   }
>   __setup("xive=off", xive_off);
>   
>   static int __init xive_store_eoi_cmdline(char *arg)
>   {
>   	if (!arg)
> -		return -EINVAL;
> +		return 1;
>   
>   	if (strncmp(arg, "off", 3) == 0) {
>   		pr_info("StoreEOI disabled on kernel command line\n");
>   		xive_store_eoi = false;
>   	}
> -	return 0;
> +	return 1;
>   }
>   __setup("xive.store-eoi=", xive_store_eoi_cmdline);
>   

