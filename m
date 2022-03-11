Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F19D94D6486
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 16:26:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFVCM6qlQz3bbJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 02:26:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFVBy3GR2z2yLg
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 02:26:16 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KFVBs5k0Pz9sSC;
 Fri, 11 Mar 2022 16:26:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qp6YRxrFMoxK; Fri, 11 Mar 2022 16:26:13 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KFVBs4vlZz9sS8;
 Fri, 11 Mar 2022 16:26:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9754A8B78F;
 Fri, 11 Mar 2022 16:26:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id WtYrdfl9TIqQ; Fri, 11 Mar 2022 16:26:13 +0100 (CET)
Received: from [192.168.202.87] (unknown [192.168.202.87])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8FD818B763;
 Fri, 11 Mar 2022 16:26:12 +0100 (CET)
Message-ID: <cca14ed0-0fc3-a286-9b06-621cff20a447@csgroup.eu>
Date: Fri, 11 Mar 2022 16:26:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] kexec/powerpc: fix exporting memory limit
Content-Language: fr-FR
To: Nikita Yushchenko <nyushchenko@dev.rtsoft.ru>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <1394115854-11709-1-git-send-email-nyushchenko@dev.rtsoft.ru>
 <1394153258.21206.1.camel@concordia> <201403070838.07820@blacky.localdomain>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <201403070838.07820@blacky.localdomain>
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
Cc: yadviga@dev.rtsoft.ru, Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 lugovskoy@dev.rtsoft.ru, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Anton Blanchard <anton@samba.org>, Hari Bathini <hbathini@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/03/2014 à 05:38, Nikita Yushchenko a écrit :
>> On Thu, 2014-03-06 at 18:24 +0400, Nikita Yushchenko wrote:
>>> When preparing dump-capturing kernel, kexec userspace tool needs to
>>> know actual amount of memory used by the running kernel. This may
>>> differ from extire available DRAM for a couple of reasons. To address
>>> this issue, kdump kernel support code injects several attributes into
>>> device tree that are later captured by userspace kexec tool via /proc
>>> interface.
>>>
>>> One such attrubute is 'chosen/linux,memory_limit' that is used to pass
>>> memory limit of the running kernel.
>>>
>>> This was initialized using kernel's 'memory_limit' variable, that is
>>> set by early init code based on mem= kernel parameter and other
>>> reasons.
>>>
>>> But there are cases when memory_limit variable does not contain proper
>>> information. One such case is when !CONFIG_HIGHMEM kernel runs on
>>> system with memory large enough not to fit into lowmem.
>>
>> Why doesn't the !CONFIG_HIGHMEM code update memory_limit to reflect
>> reality.
> 
> I guess because memory_limit is used for ... well, memory limit, set by
> mem=. And for the rest memblock is used (and it *is* updated).
> 
> And code elsewhere does use memblock, see e.g. numa_enforce_memory_limit()
> in arch/powerpc/mm/numa.c
> 
> In MMU init (MMU_init() in arch/powerpc/mm/init_32.c -which is the point
> where final memory configuration is set) memblock, not memory_limit, is
> both used and updated.


We still have this patch as "New" in patchwork.

I don't know if it is relevant but directory structure has changed so if 
still needed this patch needs rebase.

Christophe
