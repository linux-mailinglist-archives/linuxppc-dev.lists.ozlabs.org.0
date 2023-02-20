Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CAA69C5F6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 08:29:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKvDV2w6xz3cS4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 18:28:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKvCv4HKlz3bT1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 18:28:24 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4PKvCk3PQtz9sVj;
	Mon, 20 Feb 2023 08:28:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fdDzw5b5m4H1; Mon, 20 Feb 2023 08:28:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4PKvCk2Yr7z9sVf;
	Mon, 20 Feb 2023 08:28:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 481128B76E;
	Mon, 20 Feb 2023 08:28:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id KJbmKU7i1vCq; Mon, 20 Feb 2023 08:28:18 +0100 (CET)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 24A048B763;
	Mon, 20 Feb 2023 08:28:18 +0100 (CET)
Message-ID: <c4d5cb6c-bf8f-fbc1-78ca-475f9578c551@csgroup.eu>
Date: Mon, 20 Feb 2023 08:28:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3] powerpc/boot: Don't always pass -mcpu=powerpc when
 building 32-bit uImage
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
References: <20220820105200.30425-1-pali@kernel.org>
 <20220828095659.4061-1-pali@kernel.org>
 <e3cb2642-20e4-6c26-104d-329a04260946@csgroup.eu>
 <c8d657db-02da-7840-5b40-755e47277a2c@csgroup.eu>
 <20220828174135.rcql4uiunqbnn5gh@pali>
 <d49c5905-ff68-00e9-ddaf-d60d5e5ebe65@csgroup.eu>
 <20221208191602.diywrt3g2f6zmt4s@pali>
 <aca70dc9-2185-9def-7bc0-b415bec8a5c6@csgroup.eu>
 <20221224174452.xxlkmos7yoy3qn42@pali> <20230122111931.hgcsc72fk6alrmzu@pali>
 <da635f99-ce3f-18e8-cf7d-7fd5923c8451@csgroup.eu>
In-Reply-To: <da635f99-ce3f-18e8-cf7d-7fd5923c8451@csgroup.eu>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 25/01/2023 à 08:40, Christophe Leroy a écrit :
> 
> 
> Le 22/01/2023 à 12:19, Pali Rohár a écrit :
>> On Saturday 24 December 2022 18:44:52 Pali Rohár wrote:
>>> On Thursday 08 December 2022 19:57:39 Christophe Leroy wrote:
>>>> Le 08/12/2022 à 20:16, Pali Rohár a écrit :
>>>>>
>>>>> With "[PATCH v1] powerpc/64: Set default CPU in Kconfig" patch from
>>>>> https://lore.kernel.org/linuxppc-dev/3fd60c2d8a28668a42b766b18362a526ef47e757.1670420281.git.christophe.leroy@csgroup.eu/
>>>>> this change does not throw above compile error anymore.
>>>>
>>>>
>>>> That patch should land in powerpc/next soon. When it has landed, could
>>>> you resent this patch so that snowpatch checks the build again ?
>>>
>>> Yes. But I'm still waiting because patch is not in powerpc/next yet.
>>
>> Seems that it still has not landed. Any suggestions to move forward?
> 
> Hi
> 
> I just reposted to see if it passed the CI tests this time.

It is now in the tree.

Christophe
