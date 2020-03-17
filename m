Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 355D7188BE9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 18:19:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hg070l3MzDqYJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 04:19:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=edVSWYia; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hfGY16MBzDqPl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 03:47:15 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48hfGM5Cz9zB09ZX;
 Tue, 17 Mar 2020 17:47:07 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=edVSWYia; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id njCKhkKL8GbJ; Tue, 17 Mar 2020 17:47:07 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48hfGM48TszB09ZV;
 Tue, 17 Mar 2020 17:47:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584463627; bh=JsfnXC/cnJsuXWRqx1TwBBaG9YgLMK3pw2NWMP79MMg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=edVSWYia3WgoAWxJueDngYrDM6YB8liD5IapHEPAvxvpuVIPS5fcq2U2XkF9/AnsU
 SMTVyae6LoLClyQAvXUQV8YRkcibhq/XcxkeVCCqWxMJmd8jbBS8OdA2B4LWUzYQVu
 9t8KZ0sVM/a39S+fpyZhyPjU59kK0jfeK8/c+GHU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C6F548B851;
 Tue, 17 Mar 2020 17:47:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 51wPl3YqcNGk; Tue, 17 Mar 2020 17:47:07 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C8E9E8B846;
 Tue, 17 Mar 2020 17:47:04 +0100 (CET)
Subject: Re: [PATCH] mm/hugetlb: Fix build failure with HUGETLB_PAGE but not
 HUGEBTLBFS
To: Mike Kravetz <mike.kravetz@oracle.com>, Baoquan He <bhe@redhat.com>
References: <7e8c3a3c9a587b9cd8a2f146df32a421b961f3a2.1584432148.git.christophe.leroy@c-s.fr>
 <20200317082550.GA3375@MiWiFi-R3L-srv>
 <60117fd7-46ff-326b-34f1-0c7087111ca7@c-s.fr>
 <a31c86c9-2f86-4f40-a367-5953037ee137@oracle.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <ff480af2-d376-3b99-ba9e-36397ecde232@c-s.fr>
Date: Tue, 17 Mar 2020 17:47:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a31c86c9-2f86-4f40-a367-5953037ee137@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: Nick Piggin <npiggin@suse.de>, Andi Kleen <ak@suse.de>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, Adam Litke <agl@us.ibm.com>,
 Nishanth Aravamudan <nacc@us.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 17/03/2020 à 17:40, Mike Kravetz a écrit :
> On 3/17/20 1:43 AM, Christophe Leroy wrote:
>>
>>
>> Le 17/03/2020 à 09:25, Baoquan He a écrit :
>>> On 03/17/20 at 08:04am, Christophe Leroy wrote:
>>>> When CONFIG_HUGETLB_PAGE is set but not CONFIG_HUGETLBFS, the
>>>> following build failure is encoutered:
>>>
>>>   From the definition of HUGETLB_PAGE, isn't it relying on HUGETLBFS?
>>> I could misunderstand the def_bool, please correct me if I am wrong.
>>
>> AFAIU, it means that HUGETLBFS rely on HUGETLB_PAGE, by default HUGETLB_PAGE is not selected when HUGETLBFS is not. But it is still possible for an arch to select HUGETLB_PAGE without selecting HUGETLBFS when it uses huge pages for other purpose than hugetlb file system.
>>
> 
> Hi Christophe,
> 
> Do you actually have a use case/example of using hugetlb pages without
> hugetlbfs?  I can understand that there are some use cases which never
> use the filesystem interface.  However, hugetlb support is so intertwined
> with hugetlbfs, I am thinking there would be issues trying to use them
> separately.  I will look into this further.
> 

Hi Mike,

Series https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=164620

And especially patch 39 to 41.

Thanks
Christophe
