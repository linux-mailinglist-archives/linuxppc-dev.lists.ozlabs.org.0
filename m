Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1C794B9C3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 11:37:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfhlQ1ndQz2yXd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 19:37:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wfhl23bLrz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 19:36:45 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wfhkx58QNz9sPd;
	Thu,  8 Aug 2024 11:36:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WhyHdBxXIhK6; Thu,  8 Aug 2024 11:36:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wfhkx4Kt2z9rvV;
	Thu,  8 Aug 2024 11:36:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 820478B76C;
	Thu,  8 Aug 2024 11:36:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id okyHh3OtlL_d; Thu,  8 Aug 2024 11:36:41 +0200 (CEST)
Received: from [192.168.234.168] (unknown [192.168.234.168])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 17AC38B763;
	Thu,  8 Aug 2024 11:36:41 +0200 (CEST)
Message-ID: <17eed040-969e-4d2c-b20b-ecfd93450901@csgroup.eu>
Date: Thu, 8 Aug 2024 11:36:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 16/23] powerpc/e500: Switch to 64 bits PGD on 85xx (32
 bits)
To: Guenter Roeck <linux@roeck-us.net>
References: <cover.1719928057.git.christophe.leroy@csgroup.eu>
 <ca85397df02564e5edc3a3c27b55cf43af3e4ef3.1719928057.git.christophe.leroy@csgroup.eu>
 <2c7adbc9-609d-41a9-8a3b-a63d59e21a1f@roeck-us.net>
 <AM0PR07MB496234BE973D5458C53517F29BB12@AM0PR07MB4962.eurprd07.prod.outlook.com>
 <4f46d614-0fbb-452b-a778-b7b3a7f6da8b@roeck-us.net>
 <b73e991e-5f66-455e-a271-e10511ebeaef@csgroup.eu>
 <5cc43ed9-b4f8-49f5-99ee-b411bb144085@roeck-us.net>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <5cc43ed9-b4f8-49f5-99ee-b411bb144085@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Nicholas Piggin <npiggin@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/08/2024 à 16:51, Guenter Roeck a écrit :
> On 8/7/24 03:11, Christophe Leroy wrote:
>> Hi,
>>
>> Le 31/07/2024 à 18:35, Guenter Roeck a écrit :
>>> On 7/31/24 08:36, LEROY Christophe wrote:
>>>>
>>>> Hi Guenter,
>>>> Thanks for this report. I'm afk this week, i"ll have a look at it in 
>>>> more détails next week.
>>>> But to be sûre, does that Oops match the bisected commit ? Because 
>>>> pmd_leaf()  for e500 doesn't exist yet so pmd_write() shouldnt be 
>>>> called.
>>>> I did validate all my changes with mpc8544 on qemu when i 
>>>> implemented this séries, using map_hugetlb mm selftest. What test 
>>>> tool are you using ?
>>>
>>> Nothing special; it is just a qemu boot test with various module test 
>>> and debug options enabled,
>>> using a root file system generated with buildroot.
>>
>> I still don't get anything with mpc85xx_defconfig.
>>
>> Can you tell with debug options you use and which module tests ?
>>
> 
> Please see 
> https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fserver.roeck-us.net%2Fqemu%2Fppc-v6.11-rc2%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cfd337af1375448bcda1508dcb6f06644%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638586390853555531%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=7kihrxw5%2FrCI6TzmxGM56tEmghc1Bj7b1czXuM0%2BVrk%3D&reserved=0.
> 

Thanks,

CONFIG_SLUB_DEBUG_ON is what exhibits the problem.

I sent out a patch: 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/1cdaacb391cbd3e0240f0e0faf691202874e9422.1723109462.git.christophe.leroy@csgroup.eu/

With that patch I can successfully boot your config.

Can you give it a test ?

Thanks
Christophe
