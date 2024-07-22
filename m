Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1EC939302
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2024 19:14:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSRj555pCz3d96
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 03:14:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSRhj4bwDz3c47
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 03:14:11 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WSRhZ3b8Vz9sSt;
	Mon, 22 Jul 2024 19:14:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XdQgWNNfizAM; Mon, 22 Jul 2024 19:14:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WSRhZ1w7tz9sSs;
	Mon, 22 Jul 2024 19:14:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EE2188B773;
	Mon, 22 Jul 2024 19:14:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id XOyPcpf4z-1J; Mon, 22 Jul 2024 19:14:05 +0200 (CEST)
Received: from [192.168.233.78] (unknown [192.168.233.78])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5FBF68B76D;
	Mon, 22 Jul 2024 19:14:05 +0200 (CEST)
Message-ID: <3b4feef7-35c3-4afd-aa08-73871b404835@csgroup.eu>
Date: Mon, 22 Jul 2024 19:14:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc/fsl/qbman: remove unused struct 'cgr_comp'
To: Michael Ellerman <mpe@ellerman.id.au>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Sean Anderson <sean.anderson@linux.dev>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20240528231123.136664-1-linux@treblig.org>
 <336239e6-4369-44ea-a60c-d300cf6e6f81@linux.dev> <Zp2QtPET9649y9pA@gallifrey>
 <878qxtx527.fsf@mail.lhotse>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <878qxtx527.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, camelia.groza@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 22/07/2024 à 09:24, Michael Ellerman a écrit :
> "Dr. David Alan Gilbert" <linux@treblig.org> writes:
>> * Sean Anderson (sean.anderson@linux.dev) wrote:
>>> On 5/28/24 19:11, linux@treblig.org wrote:
>>>> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>>>>
>>>> 'cgr_comp' has been unused since
>>>> commit 96f413f47677 ("soc/fsl/qbman: fix issue in
>>>> qman_delete_cgr_safe()").
>>>>
>>>> Remove it.
>>>>
>>>> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
>>>> ---
>>>>   drivers/soc/fsl/qbman/qman.c | 5 -----
>>>>   1 file changed, 5 deletions(-)
>>>>
>>>> diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
>>>> index 7e9074519ad2..4dc8aba33d9b 100644
>>>> --- a/drivers/soc/fsl/qbman/qman.c
>>>> +++ b/drivers/soc/fsl/qbman/qman.c
>>>> @@ -2546,11 +2546,6 @@ int qman_delete_cgr(struct qman_cgr *cgr)
>>>>   }
>>>>   EXPORT_SYMBOL(qman_delete_cgr);
>>>>   
>>>> -struct cgr_comp {
>>>> -	struct qman_cgr *cgr;
>>>> -	struct completion completion;
>>>> -};
>>>> -
>>>>   static void qman_delete_cgr_smp_call(void *p)
>>>>   {
>>>>   	qman_delete_cgr((struct qman_cgr *)p);
>>>
>>> Reviewed-by: Sean Anderson <sean.anderson@linux.dev>
>>
>> Hi Sean,
>>    Do you know who will pick this one up?
>>    I got a notification a while ago from a patchwork at
>>    linuxppc-dev marked 'Handled elsewhere' - but I'm not
>> sure where.
> 
> drivers/soc/fsl was orphaned, but Christophe has recently volunteered to
> look after it.
> 
> This patch looks trivial so I can just pick it up if you like Christophe?
> 

Sure Michael, you can pick it up.

Thanks
Christophe
