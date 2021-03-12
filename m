Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8752B338F3E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 14:58:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxnV14Fx9z3dtB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Mar 2021 00:58:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.255.19; helo=2.mo51.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 1484 seconds by postgrey-1.36 at boromir;
 Sat, 13 Mar 2021 00:58:31 AEDT
Received: from 2.mo51.mail-out.ovh.net (2.mo51.mail-out.ovh.net
 [178.33.255.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxnTg2lsMz30MT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Mar 2021 00:58:29 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.180])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 4340A26B8C7;
 Fri, 12 Mar 2021 14:33:41 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 12 Mar
 2021 14:33:40 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004b7259aef-f689-42a7-b071-f92d816709c3,
 795EE61F3CDF5270877287A62BE336BF03444C93) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.201.91.229
Subject: Re: [PATCH] powerpc: define the variable 'uaccess_flush' as static
To: He Ying <heying24@huawei.com>, <mpe@ellerman.id.au>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <dja@axtens.net>, <akpm@linux-foundation.org>, <rppt@kernel.org>,
 <aneesh.kumar@linux.ibm.com>
References: <20210312110638.178974-1-heying24@huawei.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a06a0dc8-c717-da4c-c5ad-eaf56bbbd896@kaod.org>
Date: Fri, 12 Mar 2021 14:33:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210312110638.178974-1-heying24@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 1ace6534-db93-4101-b025-eb5d269ce8cc
X-Ovh-Tracer-Id: 7905224723001674744
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddvvddgheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgedvieejfedvhfduhfffueevheeludffhfdvkeehleegtddttdfhieegveeghfffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehhvgihihhnghdvgeeshhhurgifvghirdgtohhm
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
Cc: johnny.chenyi@huawei.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/12/21 12:06 PM, He Ying wrote:
> The variable 'uaccess_fulsh' is not referenced outside the file. Perhaps we
> should define it as static to avoid the warning as follows:
> 
> arch/powerpc/kernel/setup_64.c:953:6: warning: symbol 'uaccess_flush'
> was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: He Ying <heying24@huawei.com>
> ---
>  arch/powerpc/kernel/setup_64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index 560ed8b975e7..22aca271496b 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -950,7 +950,7 @@ static bool no_entry_flush;
>  static bool no_uaccess_flush;
>  bool rfi_flush;
>  bool entry_flush;

I think this is the case also for entry_flush. compiling with W=1 will tell you more.

Thanks,

C. 

> -bool uaccess_flush;
> +static bool uaccess_flush;
>  DEFINE_STATIC_KEY_FALSE(uaccess_flush_key);
>  EXPORT_SYMBOL(uaccess_flush_key);
>  
> 

