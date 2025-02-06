Return-Path: <linuxppc-dev+bounces-5891-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4F5A2A1D6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2025 08:12:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YpSwn2vDLz307C;
	Thu,  6 Feb 2025 18:12:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.32
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738825961;
	cv=none; b=AulOjo6w8ZCHVX8Y5iAwf04x4T0ohKzO/CNr+nqc/ZXlD96M9g7K42qvxkkyvSjyVGjvw9fn1Ca5wpUdh0Qk3p06b7Mtt/k0HmX1nLrVQ/tCQUQITWSV0p5KcRw3vCJ2ieCbx8BGA2fwYgktUmBlKQxcOnSVSUSpTuDOUJ75t6QM990QCiYXnW4Gl9hDxt5RoEwqc9qausSggOb76l1KX4sFsVQlrC96+OfenHlKJcQnBra6o1Y3fTlvgO12W39nV8k6irb5ad0WYeBj7qclc2MrqPLsX6z9ccGr1n9nzQWb0L4RhpoeX8U7fD8EbLvBXC88vP3NvbvwayxSsqETKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738825961; c=relaxed/relaxed;
	bh=4FPiaV/AIUZHCtLa3mlPbRoRixrmOxkrNATzr+dJnnU=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=VzH62D8fyVBetlpjy4OzkIvGap5QBK8+JB6+TimCZnDUYLZPcTZHXQ2TdW+eyCBR2LtjWan/o+lWsvxR5D4+eAw7v44y8JX8AXeEm6cmiStki/D5iBmI/sXUKzcFHj4z4CA7mvg5lYuiceywXu22100gFuNyynihlRQbXNH/A4d/efmUz09m2MrZ+7aiEw9EvXLCQ+bNcpYTt3Sc5sAGaISvlb5dsn/g0CKhjYLWYL0SVsqO3P5kvyY2EU6HCiV/eJO4jxged4JfymNNa6miw+EHLxmw+3/2N1+jRzByDfz72yWb1mA6DCWGNXg3Oqn6Vhh0p9WhVc9SwBRBw44cLg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.32; helo=szxga06-in.huawei.com; envelope-from=linmiaohe@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=szxga06-in.huawei.com; envelope-from=linmiaohe@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YpSwl3Qm1z306x
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2025 18:12:37 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4YpSx60426z20pmN;
	Thu,  6 Feb 2025 15:12:58 +0800 (CST)
Received: from kwepemd200019.china.huawei.com (unknown [7.221.188.193])
	by mail.maildlp.com (Postfix) with ESMTPS id C1B9B140391;
	Thu,  6 Feb 2025 15:12:29 +0800 (CST)
Received: from [10.173.127.72] (10.173.127.72) by
 kwepemd200019.china.huawei.com (7.221.188.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 6 Feb 2025 15:12:28 +0800
Subject: Re: kismet: WARNING: unmet direct dependencies detected for HUGETLBFS
 when selected by PPC_8xx
To: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran
	<fazilyildiran@gmail.com>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, kernel test
 robot <lkp@intel.com>
References: <202501240611.LDmD2nkj-lkp@intel.com>
 <29cf621d-db67-6c5c-0dc5-ebe79edc6cc6@huawei.com>
 <08a51873-7510-4552-9bb1-3ea7ef9fbc2d@csgroup.eu>
 <0c0c6af5-7766-6cc0-d141-d725b84bef09@huawei.com>
 <5528c76d-d8f1-41be-a742-8bafa74c24f9@csgroup.eu>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <d6c06a9c-4d43-4528-c5d1-019f91087f30@huawei.com>
Date: Thu, 6 Feb 2025 15:12:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
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
In-Reply-To: <5528c76d-d8f1-41be-a742-8bafa74c24f9@csgroup.eu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.173.127.72]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd200019.china.huawei.com (7.221.188.193)
X-Spam-Status: No, score=-4.9 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025/2/6 14:30, Christophe Leroy wrote:
> 
> 
> Le 06/02/2025 à 03:08, Miaohe Lin a écrit :
>> On 2025/2/6 0:35, Christophe Leroy wrote:
>>>
>>>
>>> Le 05/02/2025 à 03:39, Miaohe Lin a écrit :
>>>> On 2025/1/24 6:24, kernel test robot wrote:
>>>>> tree:   https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C97f4bcfeef7147c5a46408dd465329e6%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638744045189449604%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=x37VZjFG%2BB1zYyoDGgz4jIyUbSWx%2FCklH%2FgsDLGCW%2F4%3D&reserved=0 master
>>>>> head:   d0d106a2bd21499901299160744e5fe9f4c83ddb
>>>>> commit: f8142cf94d4737ea0c3baffb3b9bad8addcb9b6b hugetlb: make hugetlb depends on SYSFS or SYSCTL
>>>>> date:   2 years, 4 months ago
>>>>> config: powerpc-kismet-CONFIG_HUGETLBFS-CONFIG_PPC_8xx-0-0 (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20250124%2F202501240611.LDmD2nkj-lkp%40intel.com%2Fconfig&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C97f4bcfeef7147c5a46408dd465329e6%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638744045189465052%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=QSCbgVZFsu%2BQN1b7xDiPsikJR93kWobuPsa%2BtqG3dZA%3D&reserved=0)
>>>>> reproduce: (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20250124%2F202501240611.LDmD2nkj-lkp%40intel.com%2Freproduce&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C97f4bcfeef7147c5a46408dd465329e6%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638744045189472672%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=nT4smogT5pTgqIh7%2FCPD%2FpQsCqaBrxfN%2BtEER7l%2FyLY%3D&reserved=0)
>>>>>
>>>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>>>> the same patch/commit), kindly add following tags
>>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>>> | Closes: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Foe-kbuild-all%2F202501240611.LDmD2nkj-lkp%40intel.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C97f4bcfeef7147c5a46408dd465329e6%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638744045189480482%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=7yBcNLgmgW6BUZ55nHh%2F8fZqHGShaqGDKdotvIQ2Tl8%3D&reserved=0
>>>>
>>>> Thanks for report. Sorry for late respond. I was on my Spring Festival vacation.
>>>>
>>>>>
>>>>> kismet warnings: (new ones prefixed by >>)
>>>>>>> kismet: WARNING: unmet direct dependencies detected for HUGETLBFS when selected by PPC_8xx
>>>>>      WARNING: unmet direct dependencies detected for HUGETLBFS
>>>>>        Depends on [n]: (X86 || IA64 || SPARC64 || ARCH_SUPPORTS_HUGETLBFS [=y] || BROKEN [=n]) && (SYSFS [=n] || SYSCTL [=n])
>>>>>        Selected by [y]:
>>>>>        - PPC_8xx [=y] && <choice>
>>>>
>>>> I am a bit confused. HUGETLBFS depends on SYSFS or SYSCTL. How can it be selected while SYSFS [=n] || SYSCTL [=n]?
>>>> Or am I miss something?
>>>
>>> CONFIG_HUGETLBFS is selected by CONFIG_PPC_8xx, see commit 34536d780683 ("powerpc/8xx: Add a function to early map kernel via huge pages")
>>
>> Thanks for your providing. But I'm saying that since HUGETLBFS depends on (SYSFS or SYSCTL), how CONFIG_PPC_8xx succeeds to select it while
>> SYSFS and SYSCTL are disabled? I'm not really familiar with Kconfig but I assume Kconfig will confirm that the dependencies are satisfied
>> before HUGETLBFS is enabled. Or am I miss something?
> 
> I suggest you read https://docs.kernel.org/kbuild/kconfig-language.html

Thanks.

> 
> Extract:
> 
> Note:
>     select should be used with care. select will force a symbol to a value without visiting the dependencies. By abusing select you are able to select a symbol FOO even if FOO depends on BAR that is not set.

IMHO, it seems it's the use of "select" breaks the dependencies and leads to the kismet warnings. So it might be better to fix the PPC_8xx side.

Thanks.
.


