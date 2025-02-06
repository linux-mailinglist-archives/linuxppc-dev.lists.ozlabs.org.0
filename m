Return-Path: <linuxppc-dev+bounces-5878-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FB8A29EC2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2025 03:25:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YpLYm5V0Sz2yV8;
	Thu,  6 Feb 2025 13:25:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.190
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738808748;
	cv=none; b=IbIZ6N8GBaYxQ0tT2i2tJ2MYy6cC669wN9p6QrWir04Q0iHF8insIQZ2HRO49nWly8UGcMBy2hsX239uYW3VVRc9A/ZZ+hUCNCejtFFaeab2fjshB60aopSqyCl2kdyn23gFZP5v2BtT1Dibsxr5I9XcTSeUU468hAIB80tFFcDI320t1iwU0yGEYA9YSJxKRRX9UE450Ehe/KEIzkoUeHtttjAYsIr03CnlSSWmNOOnNTEjbtox4d7ipWKqr4D+4dQQS/jTPajjfQFpliJrfOGpczpM3Zqr1VAHw4KVAu7KG+YaLCqZPDhbzzFnXADof7X1Z92sLT/ZG911vp9H3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738808748; c=relaxed/relaxed;
	bh=/P+LZKCEQ1cNi9mCWbq1YI/rcByTQvy4IoNuHUy1SYw=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=X295fmqw6yucPIrFl13bZXJAGTOfSV5ziTnwtCCZEJAD8JYg6df+oWYrsgU4vogsDJqv7nq6aJXTox1c+N70cfiLNdv0c9VEyjCDGbWQr6LCG3wiuCqQVQ6LWPOBwtd/I7zGWogwSn6gi8nTy9dab1aXbEc4Rk+uWY78QvccYNSOAaMQPoI8DfsOf0DPSV+cJI4I72W7atF7rQkUgvybcGXQhxzDpebFejUa/B2gZJvW+4U/39+aSS8Hub1e8kIxiz6BkaCY6qxnFbDVAUpHljF0NgyeB/DyonnQAXUQobxoy5ggPca5swmSGsYNPDwg1y1ljt1yLXIurPTEfrQR5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=linmiaohe@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=linmiaohe@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1026 seconds by postgrey-1.37 at boromir; Thu, 06 Feb 2025 13:25:46 AEDT
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YpLYk6Mm8z2xjd
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2025 13:25:44 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4YpL5g0xQhz2FcvK;
	Thu,  6 Feb 2025 10:04:55 +0800 (CST)
Received: from kwepemd200019.china.huawei.com (unknown [7.221.188.193])
	by mail.maildlp.com (Postfix) with ESMTPS id E036D140118;
	Thu,  6 Feb 2025 10:08:32 +0800 (CST)
Received: from [10.173.127.72] (10.173.127.72) by
 kwepemd200019.china.huawei.com (7.221.188.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 6 Feb 2025 10:08:32 +0800
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
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <0c0c6af5-7766-6cc0-d141-d725b84bef09@huawei.com>
Date: Thu, 6 Feb 2025 10:08:31 +0800
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
In-Reply-To: <08a51873-7510-4552-9bb1-3ea7ef9fbc2d@csgroup.eu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.173.127.72]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200019.china.huawei.com (7.221.188.193)
X-Spam-Status: No, score=-4.9 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025/2/6 0:35, Christophe Leroy wrote:
> 
> 
> Le 05/02/2025 à 03:39, Miaohe Lin a écrit :
>> On 2025/1/24 6:24, kernel test robot wrote:
>>> tree:   https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C9284805dd2a148bd1d7e08dd458e511f%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638743199757464439%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=LU9lidWjjJE3vf0TPBp1wIvUFpjnpPKq2zQVxu4Ru%2F0%3D&reserved=0 master
>>> head:   d0d106a2bd21499901299160744e5fe9f4c83ddb
>>> commit: f8142cf94d4737ea0c3baffb3b9bad8addcb9b6b hugetlb: make hugetlb depends on SYSFS or SYSCTL
>>> date:   2 years, 4 months ago
>>> config: powerpc-kismet-CONFIG_HUGETLBFS-CONFIG_PPC_8xx-0-0 (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20250124%2F202501240611.LDmD2nkj-lkp%40intel.com%2Fconfig&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C9284805dd2a148bd1d7e08dd458e511f%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638743199757478112%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=9%2B4B2T41tw4xvlAkYIeOEhK9PrH17GM7KrhEOyKDxMM%3D&reserved=0)
>>> reproduce: (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20250124%2F202501240611.LDmD2nkj-lkp%40intel.com%2Freproduce&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C9284805dd2a148bd1d7e08dd458e511f%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638743199757485680%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=SDjSwdEccwtqN8L4VzuYnAhq3nchpJdBi%2FaJGloeZ40%3D&reserved=0)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Foe-kbuild-all%2F202501240611.LDmD2nkj-lkp%40intel.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C9284805dd2a148bd1d7e08dd458e511f%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638743199757493154%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=DdGGMh1x6g6a%2F7hcgqmSBASk14QpA4%2F%2FmI2ztozklts%3D&reserved=0
>>
>> Thanks for report. Sorry for late respond. I was on my Spring Festival vacation.
>>
>>>
>>> kismet warnings: (new ones prefixed by >>)
>>>>> kismet: WARNING: unmet direct dependencies detected for HUGETLBFS when selected by PPC_8xx
>>>     WARNING: unmet direct dependencies detected for HUGETLBFS
>>>       Depends on [n]: (X86 || IA64 || SPARC64 || ARCH_SUPPORTS_HUGETLBFS [=y] || BROKEN [=n]) && (SYSFS [=n] || SYSCTL [=n])
>>>       Selected by [y]:
>>>       - PPC_8xx [=y] && <choice>
>>
>> I am a bit confused. HUGETLBFS depends on SYSFS or SYSCTL. How can it be selected while SYSFS [=n] || SYSCTL [=n]?
>> Or am I miss something?
> 
> CONFIG_HUGETLBFS is selected by CONFIG_PPC_8xx, see commit 34536d780683 ("powerpc/8xx: Add a function to early map kernel via huge pages")

Thanks for your providing. But I'm saying that since HUGETLBFS depends on (SYSFS or SYSCTL), how CONFIG_PPC_8xx succeeds to select it while
SYSFS and SYSCTL are disabled? I'm not really familiar with Kconfig but I assume Kconfig will confirm that the dependencies are satisfied
before HUGETLBFS is enabled. Or am I miss something?

Thank.
.

