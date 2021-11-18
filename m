Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCA64560CD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 17:42:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hw5F90RnSz3c8j
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 03:42:37 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hw5Dd48kGz2xtf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 03:42:07 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.28])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 79D1221456;
 Thu, 18 Nov 2021 15:22:33 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 18 Nov
 2021 16:22:33 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0053d51c76f-c2b5-46f2-b5bb-867c92dd42f2,
 4A6ABDF66DC85A3D00A6C17CB73E494911F6EB6E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.55.24.82
Message-ID: <4169b692-97f0-aef6-363c-98d7356415da@kaod.org>
Date: Thu, 18 Nov 2021 16:22:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 04/11] powerpc/xive: Introduce xive_core_debugfs_create()
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>
References: <20211105102636.1016378-1-clg@kaod.org>
 <20211105102636.1016378-5-clg@kaod.org> <87v90plsza.fsf@mpe.ellerman.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87v90plsza.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: aeb9a612-f408-4e32-9409-b7cc9d5d4c4b
X-Ovh-Tracer-Id: 8050465812721994650
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeigdejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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

On 11/18/21 10:21, Michael Ellerman wrote:
> Cédric Le Goater <clg@kaod.org> writes:
> 
>> and fix some compile issues when !CONFIG_DEBUG_FS.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   arch/powerpc/sysdev/xive/common.c | 17 ++++++++++++++---
>>   1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
>> index 3d558cad1f19..b71cc1020296 100644
>> --- a/arch/powerpc/sysdev/xive/common.c
>> +++ b/arch/powerpc/sysdev/xive/common.c
> ...
>> @@ -1779,10 +1782,18 @@ static int xive_core_debug_show(struct seq_file *m, void *private)
>>   }
>>   DEFINE_SHOW_ATTRIBUTE(xive_core_debug);
>>   
>> +static void xive_core_debugfs_create(void)
>> +{
>> +	debugfs_create_file("xive", 0400, arch_debugfs_dir,
>> +			    NULL, &xive_core_debug_fops);
>> +}
>> +
>> +#endif /* CONFIG_DEBUG_FS */
>> +
>>   int xive_core_debug_init(void)
>>   {
>> -	if (xive_enabled())
>> -		debugfs_create_file("xive", 0400, arch_debugfs_dir,
>> -				    NULL, &xive_core_debug_fops);
>> +	if (xive_enabled() && IS_ENABLED(CONFIG_DEBUG_FS))
>> +		xive_core_debugfs_create();
>> +
>>   	return 0;
>>   }
> 
> For skiroot_defconfig this gives me:
> 
>    arch/powerpc/sysdev/xive/common.c: In function ‘xive_core_init’:
>    arch/powerpc/sysdev/xive/common.c:1676:2: error: implicit declaration of function ‘xive_core_debugfs_create’; did you mean ‘xive_core_debug_init’? [-Werror=implicit-function-declaration]
>     1676 |  xive_core_debugfs_create();
>          |  ^~~~~~~~~~~~~~~~~~~~~~~~
>          |  xive_core_debug_init
>    cc1: all warnings being treated as errors
> 
> 
> We need an empty inline stub of xive_core_debugfs_create() for the
> CONFIG_DEBUG_FS=n case.

I thought IS_ENABLED(CONFIG_DEBUG_FS)) was protecting compile from
that issue. Do you want a v2 for the whole ?

Or, I can send a replacement for patch 4 only.

> I'm wondering though why do we have xive_core_debug_init() at all, why
> don't we just initialise the debugfs files in xive_core_init()?

I think I tried that and there was an ordering issue.

Thanks,

C.
