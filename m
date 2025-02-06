Return-Path: <linuxppc-dev+bounces-5890-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9797A2A17B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2025 07:50:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YpSQl0L7sz306d;
	Thu,  6 Feb 2025 17:50:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738824606;
	cv=none; b=XiczT9dYBl2teAgv1pp85WJGHi5SvSVO9sYEh0ue6tvOw5cI7SFQADKYyv0gXCH4jRWQ9ihf/pYgOG1C8j4qwC4WUfbukmEOj8b9MLPD+5/mFVsMJ0sve6wm5TuggUTFmONv2QtsvPyZpFRrNhgTMsSN71YCnBJMU9B9+5sw9YGweQAgfMYma1T5E/TC8yBF3i7u4b+UysNQzZ0k0v8YwxzUbZIScCiFHlutgUBb5bEvzB4370z0rMs7iOBEVhkEpuf39XxGc3wQVqICigxhKMQzgN/p8MivRwmGjm799nEFoF5wQ/rE29KcBXjuLwmY+56ZCOaQr4qbfR0VXgrJXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738824606; c=relaxed/relaxed;
	bh=4iXOE+qqNrAMlaX2Hb8fqfBPJ+P465HiLkkNpiJgQ90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hZfHFcjDMkDxtWBuYhoaPOUl8OFrHu21JHO37FOE85/OHI2h7OvV8RCWHRdvhL8VMNmmNt0Yjp1bYYZAH61XjRg2OIq/bogCICAVi/flXN9Kc/Os8/SuBZI8ctAFYBc8qE587yM80IaEPsD3CL/cWK7UzOY726zpN50vYCUvHf84yK7Vjn20PDxYSBOVfU64+0UuZx3lbOHt6QL6z8rMUW2ydlQURM5qgjHe/hFZNDINm1yhbfiI2vnMBpd/48TTn5y1+J3AIp0unrq28/QrL5Dgz0T1INfA1p+6T8g1uqTEPbjQvDJzLTl9ds+4kDPiB+edoQk5HwFsmGFpy9YaUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YpSQk0K6Yz3064
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2025 17:50:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YpRzj6B4wz9sPd;
	Thu,  6 Feb 2025 07:30:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id neUGsg27D0lw; Thu,  6 Feb 2025 07:30:09 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YpRzj5CFcz9rvV;
	Thu,  6 Feb 2025 07:30:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A716A8B76E;
	Thu,  6 Feb 2025 07:30:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id rWUP8yv4uFvM; Thu,  6 Feb 2025 07:30:09 +0100 (CET)
Received: from [192.168.202.221] (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E10648B763;
	Thu,  6 Feb 2025 07:30:08 +0100 (CET)
Message-ID: <5528c76d-d8f1-41be-a742-8bafa74c24f9@csgroup.eu>
Date: Thu, 6 Feb 2025 07:30:06 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kismet: WARNING: unmet direct dependencies detected for HUGETLBFS
 when selected by PPC_8xx
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 kernel test robot <lkp@intel.com>
References: <202501240611.LDmD2nkj-lkp@intel.com>
 <29cf621d-db67-6c5c-0dc5-ebe79edc6cc6@huawei.com>
 <08a51873-7510-4552-9bb1-3ea7ef9fbc2d@csgroup.eu>
 <0c0c6af5-7766-6cc0-d141-d725b84bef09@huawei.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <0c0c6af5-7766-6cc0-d141-d725b84bef09@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 06/02/2025 à 03:08, Miaohe Lin a écrit :
> On 2025/2/6 0:35, Christophe Leroy wrote:
>>
>>
>> Le 05/02/2025 à 03:39, Miaohe Lin a écrit :
>>> On 2025/1/24 6:24, kernel test robot wrote:
>>>> tree:   https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C97f4bcfeef7147c5a46408dd465329e6%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638744045189449604%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=x37VZjFG%2BB1zYyoDGgz4jIyUbSWx%2FCklH%2FgsDLGCW%2F4%3D&reserved=0 master
>>>> head:   d0d106a2bd21499901299160744e5fe9f4c83ddb
>>>> commit: f8142cf94d4737ea0c3baffb3b9bad8addcb9b6b hugetlb: make hugetlb depends on SYSFS or SYSCTL
>>>> date:   2 years, 4 months ago
>>>> config: powerpc-kismet-CONFIG_HUGETLBFS-CONFIG_PPC_8xx-0-0 (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20250124%2F202501240611.LDmD2nkj-lkp%40intel.com%2Fconfig&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C97f4bcfeef7147c5a46408dd465329e6%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638744045189465052%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=QSCbgVZFsu%2BQN1b7xDiPsikJR93kWobuPsa%2BtqG3dZA%3D&reserved=0)
>>>> reproduce: (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20250124%2F202501240611.LDmD2nkj-lkp%40intel.com%2Freproduce&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C97f4bcfeef7147c5a46408dd465329e6%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638744045189472672%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=nT4smogT5pTgqIh7%2FCPD%2FpQsCqaBrxfN%2BtEER7l%2FyLY%3D&reserved=0)
>>>>
>>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>>> the same patch/commit), kindly add following tags
>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>> | Closes: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Foe-kbuild-all%2F202501240611.LDmD2nkj-lkp%40intel.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C97f4bcfeef7147c5a46408dd465329e6%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638744045189480482%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=7yBcNLgmgW6BUZ55nHh%2F8fZqHGShaqGDKdotvIQ2Tl8%3D&reserved=0
>>>
>>> Thanks for report. Sorry for late respond. I was on my Spring Festival vacation.
>>>
>>>>
>>>> kismet warnings: (new ones prefixed by >>)
>>>>>> kismet: WARNING: unmet direct dependencies detected for HUGETLBFS when selected by PPC_8xx
>>>>      WARNING: unmet direct dependencies detected for HUGETLBFS
>>>>        Depends on [n]: (X86 || IA64 || SPARC64 || ARCH_SUPPORTS_HUGETLBFS [=y] || BROKEN [=n]) && (SYSFS [=n] || SYSCTL [=n])
>>>>        Selected by [y]:
>>>>        - PPC_8xx [=y] && <choice>
>>>
>>> I am a bit confused. HUGETLBFS depends on SYSFS or SYSCTL. How can it be selected while SYSFS [=n] || SYSCTL [=n]?
>>> Or am I miss something?
>>
>> CONFIG_HUGETLBFS is selected by CONFIG_PPC_8xx, see commit 34536d780683 ("powerpc/8xx: Add a function to early map kernel via huge pages")
> 
> Thanks for your providing. But I'm saying that since HUGETLBFS depends on (SYSFS or SYSCTL), how CONFIG_PPC_8xx succeeds to select it while
> SYSFS and SYSCTL are disabled? I'm not really familiar with Kconfig but I assume Kconfig will confirm that the dependencies are satisfied
> before HUGETLBFS is enabled. Or am I miss something?

I suggest you read https://docs.kernel.org/kbuild/kconfig-language.html

Extract:

Note:
     select should be used with care. select will force a symbol to a 
value without visiting the dependencies. By abusing select you are able 
to select a symbol FOO even if FOO depends on BAR that is not set.

Christophe

