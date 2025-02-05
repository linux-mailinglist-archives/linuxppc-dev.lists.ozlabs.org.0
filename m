Return-Path: <linuxppc-dev+bounces-5873-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D27A296A8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2025 17:50:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yp5nW1mjBz305C;
	Thu,  6 Feb 2025 03:50:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738774207;
	cv=none; b=XFwdtF34//e1IxqryRrbf57HQ6c+T3ZXhBDLndaEjFN61+Et3+uZQ1NperICJDbbH0/wUZ/SyVtGri/aZB6UX/7KQ2lnL8ad5xwoZWzshv0MXwT95bP3YcbTHbXo1GPajf1hYww0hqi9vTZgyrhYy6I8pWWqvWa+ES3N++HlbEqmWEB1zXz1Tw2FplVQPyVhecl10gqmt2tJ/3xwcJyeUcDDtIasy58U7s2avJjuVwdya7igpV1F3qTF2HRE2UpR/ynNZh8HmuqCVqNGbDp3P1439lioqrdzdKD2VrLU/lXjo7ZPvEhhWcqf6duEPOZ7wA05TAXpN1nc0olC3/F97g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738774207; c=relaxed/relaxed;
	bh=VYAWjgogZK/L2UH0JmEMhO7I4g3KpjDtkLDmHPcwrls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RGsJeG2cvP9kBGiFLurE7SafobsYVxIsL5uFn/PnHxuJGUfkt5ehC6WXDtPTZPYct3sm5t1K8321Ljg9Bz5KXjtn7iJaJMTlc4nrQKOTzjJdVZ/2Kk11hPngl5j2JaBdow5VNF36v+Q3wYdGmOQLupL6ELe4Tn54qmUDKDL8/Eujo9QsDDV0vw/gOSQ5dp7Kd6zoMeyi1xkYuCpopeof5laYvdihrYYsI0CKJBRY2bWZhTPVEPbIzmdWxHgTe/LdJOItEaNr/Rrc27aHu9/fg+zVD3n4+8PErYcHmgabcOB845bdrJqhmO/mErXtOVzDgxbYlDgfZCG0inXNGhobUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yp5nV0sW9z2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2025 03:50:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Yp5Sz0LYsz9sRk;
	Wed,  5 Feb 2025 17:35:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rJSb9hOvWj2M; Wed,  5 Feb 2025 17:35:46 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Yp5Sy6Fjjz9rvV;
	Wed,  5 Feb 2025 17:35:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C8A5B8B76C;
	Wed,  5 Feb 2025 17:35:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 1oTP_T_1tXfX; Wed,  5 Feb 2025 17:35:46 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4BE3B8B763;
	Wed,  5 Feb 2025 17:35:46 +0100 (CET)
Message-ID: <08a51873-7510-4552-9bb1-3ea7ef9fbc2d@csgroup.eu>
Date: Wed, 5 Feb 2025 17:35:44 +0100
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
To: Miaohe Lin <linmiaohe@huawei.com>, kernel test robot <lkp@intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <202501240611.LDmD2nkj-lkp@intel.com>
 <29cf621d-db67-6c5c-0dc5-ebe79edc6cc6@huawei.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <29cf621d-db67-6c5c-0dc5-ebe79edc6cc6@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 05/02/2025 à 03:39, Miaohe Lin a écrit :
> On 2025/1/24 6:24, kernel test robot wrote:
>> tree:   https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C9284805dd2a148bd1d7e08dd458e511f%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638743199757464439%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=LU9lidWjjJE3vf0TPBp1wIvUFpjnpPKq2zQVxu4Ru%2F0%3D&reserved=0 master
>> head:   d0d106a2bd21499901299160744e5fe9f4c83ddb
>> commit: f8142cf94d4737ea0c3baffb3b9bad8addcb9b6b hugetlb: make hugetlb depends on SYSFS or SYSCTL
>> date:   2 years, 4 months ago
>> config: powerpc-kismet-CONFIG_HUGETLBFS-CONFIG_PPC_8xx-0-0 (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20250124%2F202501240611.LDmD2nkj-lkp%40intel.com%2Fconfig&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C9284805dd2a148bd1d7e08dd458e511f%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638743199757478112%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=9%2B4B2T41tw4xvlAkYIeOEhK9PrH17GM7KrhEOyKDxMM%3D&reserved=0)
>> reproduce: (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20250124%2F202501240611.LDmD2nkj-lkp%40intel.com%2Freproduce&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C9284805dd2a148bd1d7e08dd458e511f%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638743199757485680%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=SDjSwdEccwtqN8L4VzuYnAhq3nchpJdBi%2FaJGloeZ40%3D&reserved=0)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Foe-kbuild-all%2F202501240611.LDmD2nkj-lkp%40intel.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C9284805dd2a148bd1d7e08dd458e511f%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638743199757493154%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=DdGGMh1x6g6a%2F7hcgqmSBASk14QpA4%2F%2FmI2ztozklts%3D&reserved=0
> 
> Thanks for report. Sorry for late respond. I was on my Spring Festival vacation.
> 
>>
>> kismet warnings: (new ones prefixed by >>)
>>>> kismet: WARNING: unmet direct dependencies detected for HUGETLBFS when selected by PPC_8xx
>>     WARNING: unmet direct dependencies detected for HUGETLBFS
>>       Depends on [n]: (X86 || IA64 || SPARC64 || ARCH_SUPPORTS_HUGETLBFS [=y] || BROKEN [=n]) && (SYSFS [=n] || SYSCTL [=n])
>>       Selected by [y]:
>>       - PPC_8xx [=y] && <choice>
> 
> I am a bit confused. HUGETLBFS depends on SYSFS or SYSCTL. How can it be selected while SYSFS [=n] || SYSCTL [=n]?
> Or am I miss something?

CONFIG_HUGETLBFS is selected by CONFIG_PPC_8xx, see commit 34536d780683 
("powerpc/8xx: Add a function to early map kernel via huge pages")

Christophe


