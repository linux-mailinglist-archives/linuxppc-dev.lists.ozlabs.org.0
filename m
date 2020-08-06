Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 918AC23D801
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 10:31:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMhY555Z9zDqZT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 18:31:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMhRQ1Cm2zDqYt
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 18:26:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BMhRP4lKpz8sWN
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 18:26:41 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BMhRP3KvZz9sTR; Thu,  6 Aug 2020 18:26:41 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BMhRN6gwbz9sTC
 for <linuxppc-dev@ozlabs.org>; Thu,  6 Aug 2020 18:26:40 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BMhRJ63ndz9v0TJ;
 Thu,  6 Aug 2020 10:26:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id hom7Xzisoprr; Thu,  6 Aug 2020 10:26:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BMhRJ4pysz9v0TH;
 Thu,  6 Aug 2020 10:26:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CE0498B7FA;
 Thu,  6 Aug 2020 10:26:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ogWtvypUuRuD; Thu,  6 Aug 2020 10:26:37 +0200 (CEST)
Received: from [172.25.230.102] (po15451.idsi0.si.c-s.fr [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ACD218B75E;
 Thu,  6 Aug 2020 10:26:37 +0200 (CEST)
Subject: Re: [PATCH] powerpc/40x: Fix assembler warning about r0
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20200722022422.825197-1-mpe@ellerman.id.au>
 <bc70ddd8-d48d-d939-dce0-5aa8b8cf87d8@csgroup.eu>
 <87o8noy0sc.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <7faebe28-07f9-b5df-6b6d-a25342e2bcad@csgroup.eu>
Date: Thu, 6 Aug 2020 10:26:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87o8noy0sc.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/08/2020 à 04:18, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Le 22/07/2020 à 04:24, Michael Ellerman a écrit :
>>> The assembler says:
>>>     arch/powerpc/kernel/head_40x.S:623: Warning: invalid register expression
>>
>> I get exactly the same with head_32.S, for the exact same reason.
> 
> Ah yep, I see it. I mostly build pmac32_defconfig which doesn't have
> BDI_SWITCH enabled.
> 
> Send a patch? :)

Done.

> 
> Do we still need the BDI_SWITCH code? Is it likely anyone still has one,
> that works?

I have three (One for 83xx and two for 8xx) and they work, allthough I'm 
using them only for Uboot and for very very very early Linux boot 
debugging (Last time I used it with Linux was when implementing KASAN)

Christophe
