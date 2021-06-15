Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF4D3A777E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 09:01:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3zkm2Lycz309C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 17:01:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3zkN6ch6z2xfN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 17:01:14 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G3zkG2nzhzB9VX;
 Tue, 15 Jun 2021 09:01:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vOWfko6GyBBp; Tue, 15 Jun 2021 09:01:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G3zkG1sbQz9t3p;
 Tue, 15 Jun 2021 09:01:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 073EF8B7A2;
 Tue, 15 Jun 2021 09:01:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Vmwdfs1dKPwR; Tue, 15 Jun 2021 09:01:04 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8C5758B7A0;
 Tue, 15 Jun 2021 09:01:04 +0200 (CEST)
Subject: Re: [PATCH 7/7] powerpc/signal: Use unsafe_copy_siginfo_to_user()
To: Christoph Hellwig <hch@infradead.org>
References: <b813c1f4d3dab2f51300eac44d99029aa8e57830.1623739212.git.christophe.leroy@csgroup.eu>
 <8b4b640746523f5efb1c9a9fd97465bac4f00cae.1623739212.git.christophe.leroy@csgroup.eu>
 <YMhO4oiqh4F+ZEW8@infradead.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <68f4251c-2803-67b8-e8df-1a977ec368ba@csgroup.eu>
Date: Tue, 15 Jun 2021 09:00:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMhO4oiqh4F+ZEW8@infradead.org>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/06/2021 à 08:55, Christoph Hellwig a écrit :
>> @@ -836,14 +830,19 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
>>   		asm("dcbst %y0; sync; icbi %y0; sync" :: "Z" (mctx->mc_pad[0]));
>>   	}
>>   	unsafe_put_sigset_t(&frame->uc.uc_sigmask, oldset, failed);
>> +#ifndef CONFIG_COMPAT
>> +	unsafe_copy_siginfo_to_user(&frame->info, &ksig->info, failed);
>> +#endif
>>   
>>   	/* create a stack frame for the caller of the handler */
>>   	unsafe_put_user(regs->gpr[1], newsp, failed);
>>   
>>   	user_access_end();
>>   
>> -	if (copy_siginfo_to_user(&frame->info, &ksig->info))
>> +#ifdef CONFIG_COMPAT
>> +	if (copy_siginfo_to_user32(&frame->info, &ksig->info))
>>   		goto badframe;
>> +#endif
> 
> Shouldn't the compat case be handled the same way?
> 

It would be best, but it is not that easy to convert. So for the time being it is left aside, anyway 
compat is for compatibility, so performance doesn't matter so much.
