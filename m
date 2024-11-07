Return-Path: <linuxppc-dev+bounces-2980-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 706E39C0421
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 12:33:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xkg1Y2RGFz3bjq;
	Thu,  7 Nov 2024 22:33:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730979201;
	cv=none; b=luiihdcdN+m+0OD+LMIwSY85f72kOViId62EQTs1w7g93UjdNKsWjGEhVvpV2iTX/UdCuwnklhEQmNG7xen2ltCBEiTjADXYYb2VEgTdzbYJrFYSR5YHIIBw/9FwTy8a48CJ46NHF+FrRGCEAnpFTtmQ+nNsrNVLDBhY2K7b64uzuW1KKBb5pFrnyX4ynbYi/SD8wEn4p+9kscn4AgmQsdBsaGWd2FD6RoNbHkJfRounYe7SRwKEogWIcIdA8xheRRxFaxzLrsOYKKvm8U7iOVl8LFL1tIxdfxU8pjrzfVOg+fNhpWA6j0tpT8tPjZXSAFymHQCOlIvIaRPsWbvwzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730979201; c=relaxed/relaxed;
	bh=iL3mXwOzRJMGYTrIBbmMA0dc++2KLzludX/mlvGVKMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UZp2LjjilZlcJbFt06guCB2VTnoqmyk4AOP5vQB0DfRSM+8CaABhyMMGFamJvvRJYAV7e4WZbQLIu23k907wj0zlbuXdQVrZUH2k1qzP7LQpFsyzMrFR1rTnZ41jjHBZ2CbvsQyJ+6Z1wRolLGPDO2KUu2RDOs26OO6UlD6vpnqAv+9mIrPvNDXerxPlIbjskekV6Re8Z82mMfbxLOsPsBczey/Hd1FKTv2RGIjgOsp1v6MjPPxiYe4IRyA+r3SvOZoetQ24nTZtDgIG0aVkw/DecqKM4mjmbh7LiH02iEuKVhcuescX75qV9HAWAa03bfvb8EK7IlulLmC2ienFNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xkg1X1ztCz2yMv
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 22:33:19 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Xkg1Q1hLcz9sSL;
	Thu,  7 Nov 2024 12:33:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5xrcSFGIfoJs; Thu,  7 Nov 2024 12:33:14 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Xkg1Q0p7cz9sSK;
	Thu,  7 Nov 2024 12:33:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0C3108B77B;
	Thu,  7 Nov 2024 12:33:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id OMnLZ6-ruVde; Thu,  7 Nov 2024 12:33:13 +0100 (CET)
Received: from [192.168.232.148] (unknown [192.168.232.148])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9F2208B77A;
	Thu,  7 Nov 2024 12:33:13 +0100 (CET)
Message-ID: <ed3a5d53-af06-498f-a8fe-0fe1e3a293bc@csgroup.eu>
Date: Thu, 7 Nov 2024 12:33:12 +0100
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
Subject: Re: [PATCH -next] powerpc/machdep: Remove duplicated include in svm.c
To: Michael Ellerman <mpe@ellerman.id.au>,
 Yang Li <yang.lee@linux.alibaba.com>, npiggin@gmail.com, naveen@kernel.org,
 maddy@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>
References: <20241107010259.46308-1-yang.lee@linux.alibaba.com>
 <87msibcmeb.fsf@mpe.ellerman.id.au>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <87msibcmeb.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 07/11/2024 à 12:29, Michael Ellerman a écrit :
> Yang Li <yang.lee@linux.alibaba.com> writes:
>> The header files linux/mem_encrypt.h is included twice in svm.c,
>> so one inclusion of each can be removed.
>>
>> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
>> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11750
>> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
>> ---
>>   arch/powerpc/platforms/pseries/svm.c | 1 -
>>   1 file changed, 1 deletion(-)
> 
> The two includes only appear in linux-next, and they both come from
> different trees. They are required in each tree to avoid breaking the
> build.
> 
> So no one can merge this patch until the two trees are merged into mainline.

But can't those two trees coordinate the patches so that the include 
goes at the same place avoiding duplication at merge ?

Christophe

