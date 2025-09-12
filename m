Return-Path: <linuxppc-dev+bounces-12087-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A02B55004
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 15:50:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNbRL0lqkz3dGl;
	Fri, 12 Sep 2025 23:50:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757685037;
	cv=none; b=AQfAp2niAzLVxjWhOR+mh4DfQS2FYOsCbqmFaaF3y60z/P9uFADIe2/7acpTGjmItj8s/XTl8u++c3EharwwFSyUkvIl9Nh72cp5S2MsCQL2uYLf6cthRxqlB1l1iQnDsfKzpLauX7IMZI1K9BBFN89PSuWXB8BA+Dtde2jp+G6jqym23/0G6Atlq2Jd3klcp50BB1QC7Zx/dcNlEIympN01GfsHhKFohiy2rj+1iQrlvM+ZAaWgtKR/Rb5f1KktRI1J0W1WnxAytILK/plWdB5rRCKdaOZ+PoJSwTlp3OiTmeAUmS2GnrmR/WNnAmdMJ1Dhy58I8AMjSGS6nKxdcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757685037; c=relaxed/relaxed;
	bh=MTNx9O9cOYnq7nWBjon+6UqrNSUS1ug8uAcIkULcfv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KzU/IFNb4gBQQF3g9SGJoEwpzF77Au2MFwp9UI5NRIfUd39WUW/TCI2aPS/THAl/BUmXM7YDVYjwdhlcyxf4n7NqP9tLq/O+7tQVzmpGLoQEgnqcNfHxrAUeh76xK6PpsHvosjJQ8OEqrRgEMxS9UFxbeGPswTd20ssZcKAjlH4vLcaSZtbTwUeER3mROLizJFP3oDx7zgfXqvCFcMM/7YBvdOO6VDHWu7If6qF5laGiqrj5/ZzCW4ug6mTwA1DI+E+yfYc7u+6U8EgGIlpBHoQO8JDSItGPDzpZ52Vrjt5iLZvicb644g02l94jnw2+DOh3mP0nS9rphmlb24s+pw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNbRK1Z6fz3dDy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 23:50:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cNb583xjNz9sj9;
	Fri, 12 Sep 2025 15:34:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ANH-naw3LRi; Fri, 12 Sep 2025 15:34:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cNb5837Bsz9sj8;
	Fri, 12 Sep 2025 15:34:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 507FB8B7A7;
	Fri, 12 Sep 2025 15:34:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id U1ZvI99EDa4A; Fri, 12 Sep 2025 15:34:52 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 33E138B764;
	Fri, 12 Sep 2025 15:34:51 +0200 (CEST)
Message-ID: <73b75b17-adde-44f0-b252-5a7ea2f9d138@csgroup.eu>
Date: Fri, 12 Sep 2025 15:34:50 +0200
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] powerpc/32: Fix unpaired stwcx. on interrupt exit
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <6040b5dbcf5cdaa1cd919fcf0790f12974ea6e5a.1757666244.git.christophe.leroy@csgroup.eu>
 <aMQfD5M5yNmYxLho@gate>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <aMQfD5M5yNmYxLho@gate>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Segher,

Le 12/09/2025 à 15:24, Segher Boessenkool a écrit :
> Hi!
> 
> On Fri, Sep 12, 2025 at 10:37:34AM +0200, Christophe Leroy wrote:
>>   BEGIN_FTR_SECTION
>> +	lwarx   r0,0,r1
>> +END_FTR_SECTION_IFSET(CPU_FTR_NEED_PAIRED_STWCX)
>>   	stwcx.	r0,0,r1		/* to clear the reservation */
>> -FTR_SECTION_ELSE
>> -	lwarx	r0,0,r1
>> -ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
> 
> Hrm.  So this is for V'ger (mpc7450)?  What kind of issues does that
> old thing have with unpaired larx/stcx., some performance impact?

No idea, The original commit (from 2007) only says "some processors can 
have issues if this stwcx to address A occurs while the reservation is 
already held to a different address B".

> 
> The extra "dummy" larx has serious performance impact itself, on most
> implementations (also on all newer stuff).

To be honnest I don't know. I just discovered I made a mistake when I 
implemented C interrupt exit and this patch is aiming at restoring the 
previous behaviour.

If you think this is pointless then no problem, I can instead just 
remove the impossible case and that's it.

What is odd to begin with is that we have two features that seems to 
address the same problem but in a slightly different way
- CPU_FTR_NEED_PAIRED_STWCX for PPC32
- CPU_FTR_STCX_CHECKS_ADDRESS for PPC64

What do you recommend ?

Christophe

