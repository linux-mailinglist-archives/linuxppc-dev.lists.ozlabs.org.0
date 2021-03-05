Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D61332F2D1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 19:39:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dsc2p6wBvz3dP3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 05:39:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=87.98.187.244; helo=10.mo52.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 3599 seconds by postgrey-1.36 at boromir;
 Sat, 06 Mar 2021 05:38:56 AEDT
Received: from 10.mo52.mail-out.ovh.net (10.mo52.mail-out.ovh.net
 [87.98.187.244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dsc2S6cdcz3dF4
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 05:38:55 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.89])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 91BA2247D5E;
 Fri,  5 Mar 2021 18:22:13 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 5 Mar 2021
 18:22:12 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0028d3f4780-093e-46d9-9ca6-335c229312b5,
 A3005A4F36DF08AD97B2C2D73D5B520F0C45B7E8) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.201.91.229
Subject: Re: [PATCH] arch/powerpc/include/asm/book3s/64/: remove duplicate
 include in mmu-hash.h
To: <menglong8.dong@gmail.com>, <mpe@ellerman.id.au>
References: <20210304024251.187564-1-zhang.yunkai@zte.com.cn>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <899a2027-d7e8-334d-d7ad-36ee143cfbce@kaod.org>
Date: Fri, 5 Mar 2021 18:22:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210304024251.187564-1-zhang.yunkai@zte.com.cn>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0822bdb6-c61c-4633-ace2-03d601973089
X-Ovh-Tracer-Id: 7549440352677891061
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddtiedgledvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehmvghnghhlohhnghekrdguohhnghesghhmrghilhdrtghomh
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
Cc: rdunlap@infradead.org, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 zhang.yunkai@zte.com.cn, ganeshgr@linux.ibm.com, aneesh.kumar@linux.ibm.com,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/4/21 3:42 AM, menglong8.dong@gmail.com wrote:
> From: Zhang Yunkai <zhang.yunkai@zte.com.cn>
> 
> 'asm/bug.h' included in 'arch/powerpc/include/asm/book3s/64/mmu-hash.h'
> is duplicated.It is also included in the 12th line.
> 
> Signed-off-by: Zhang Yunkai <zhang.yunkai@zte.com.cn>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  arch/powerpc/include/asm/book3s/64/mmu-hash.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
> index f911bdb68d8b..3004f3323144 100644
> --- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
> @@ -18,7 +18,6 @@
>   * complete pgtable.h but only a portion of it.
>   */
>  #include <asm/book3s/64/pgtable.h>
> -#include <asm/bug.h>
>  #include <asm/task_size_64.h>
>  #include <asm/cpu_has_feature.h>
>  
> 

