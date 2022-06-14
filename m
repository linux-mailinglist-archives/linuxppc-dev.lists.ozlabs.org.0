Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 082C854AA89
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 09:26:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMg3X6tq0z3cg3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 17:26:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMg385BcPz306d
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 17:26:11 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LMg320zS8z9tBr;
	Tue, 14 Jun 2022 09:26:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tydUD9wXKsef; Tue, 14 Jun 2022 09:26:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LMg32020vz9tBX;
	Tue, 14 Jun 2022 09:26:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E1A868B766;
	Tue, 14 Jun 2022 09:26:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Co_muVH59YpW; Tue, 14 Jun 2022 09:26:05 +0200 (CEST)
Received: from [192.168.204.246] (unknown [192.168.204.246])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 735208B763;
	Tue, 14 Jun 2022 09:26:05 +0200 (CEST)
Message-ID: <c76598b5-2d60-ea22-d590-4cc6998a8830@csgroup.eu>
Date: Tue, 14 Jun 2022 09:26:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW1BBVENIIDIvMl0gdWlvOnBvd2VycGM6bXBjODV4?=
 =?UTF-8?Q?x=3a_l2-cache-sram_uio_driver_implementation?=
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Wenhu Wang <wenhu.wang@hotmail.com>, Greg KH <gregkh@linuxfoundation.org>
References: <20220609102855.272270-1-wenhu.wang@hotmail.com>
 <SG2PR01MB295139AA7360917B2C4846E19FA79@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
 <YqHy1uXwCLlJmftr@kroah.com>
 <SG2PR01MB2951EA9ED70E5F766DD26A069FAA9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
 <efebcb50-0481-622a-894c-7000999aacc6@csgroup.eu>
In-Reply-To: <efebcb50-0481-622a-894c-7000999aacc6@csgroup.eu>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 14/06/2022 à 09:18, Christophe Leroy a écrit :
> 
> 
> Le 14/06/2022 à 08:09, Wenhu Wang a écrit :
>>>> +static const struct vm_operations_struct uio_cache_sram_vm_ops = {
>>>> +#ifdef CONFIG_HAVE_IOREMAP_PROT
>>>
>>> Same here.
>>>
>>
>> I tried to eliminate it in mainline
>> See: [PATCH v2] mm: eliminate ifdef of HAVE_IOREMAP_PROT in .c files
>> https://lkml.org/lkml/2022/6/10/695
>>
> 
> I looked at that patch.
> 
> I don't think you can just drop the #ifdef in function 
> __access_remote_vm() in mm/memory.c
> 
> You have to replace it with something like:
> 
>      if (!IS_ENABLED(CONFIG_HAVE_IOREMAP_PROT))
>          break;
> 


Another thing in that patch:

By making generic_access_phys() a static inline, it means that everytime 
you refer to the address of that function in a vm_operations_struct 
struct, the compiler has to provide an outlined instance of the 
function. It means you'll likely have several instances of a 
generic_access_phys().

What you could do instead is to add the following at the start of 
generic_access_phys() in mm/memory.c :

	if (!IS_ENABLED(CONFIG_HAVE_IOREMAP_PROT))
		return 0;
