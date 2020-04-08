Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 017371A28CE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 20:45:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yCs90k54zDqpv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 04:45:49 +1000 (AEST)
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
 header.s=mail header.b=NP4vVqLF; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yCqF1BV4zDql8
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 04:44:08 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48yCq806xYz9tyNb;
 Wed,  8 Apr 2020 20:44:04 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=NP4vVqLF; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id DFnRMcqSirFQ; Wed,  8 Apr 2020 20:44:03 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48yCq761Y4z9tyNP;
 Wed,  8 Apr 2020 20:44:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586371443; bh=ZAl6zCSOSqdLIzN0CS5pfj10+TdT4jV0yk4gND9TUH8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=NP4vVqLFTBKUne1Hl7bQkfDTp5c5ljdrVA0YeWznXvMHE4nNSgPznnopNYO2zhMKg
 jCXE/9uIbHYtmjKgGqlGMldnW4oQxJ5SoewR3EJbWILfbtbjGiyy4BaymzqE6nN8oV
 4L5TsuSzn2zdZ4x3nM8SgfiTFZVTQTj8EaALB5AU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D5AE88B7A0;
 Wed,  8 Apr 2020 20:44:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CRetKCmn3mDq; Wed,  8 Apr 2020 20:44:03 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D8DF08B75B;
 Wed,  8 Apr 2020 20:44:02 +0200 (CEST)
Subject: Re: [PATCH v5 18/21] powerpc64: Add prefixed instructions to
 instruction data type
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <20200406080936.7180-1-jniethe5@gmail.com>
 <20200406080936.7180-19-jniethe5@gmail.com> <7182352.hY56U9iWWN@townsend>
 <4a8cf8b1-63e7-0b68-dede-48454bf5a4a7@c-s.fr>
 <20200408181101.GG26902@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <7e93f6e2-9bcf-654d-9260-e9206f9949ba@c-s.fr>
Date: Wed, 8 Apr 2020 20:43:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200408181101.GG26902@gate.crashing.org>
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
Cc: Alistair Popple <alistair@popple.id.au>, npiggin@gmail.com,
 bala24@linux.ibm.com, Jordan Niethe <jniethe5@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 08/04/2020 à 20:11, Segher Boessenkool a écrit :
> On Mon, Apr 06, 2020 at 12:25:27PM +0200, Christophe Leroy wrote:
>>> 	if (ppc_inst_prefixed(x) != ppc_inst_prefixed(y))
>>> 		return false;
>>> 	else if (ppc_inst_prefixed(x))
>>> 		return !memcmp(&x, &y, sizeof(struct ppc_inst));
>>
>> Are we sure memcmp() is a good candidate for the comparison ? Can we do
>> simpler ? Especially, I understood a prefixed instruction is a 64 bits
>> properly aligned instruction, can we do a simple u64 compare ? Or is GCC
>> intelligent enough to do that without calling memcmp() function which is
>> heavy ?
> 
> A prefixed insn is *not* 8-byte aligned, it is 4-byte aligned, fwiw.

Ah, yes, I read too fast https://patchwork.ozlabs.org/patch/1266721/

It's not 64 bits, it is 64 bytes.

> 
> memcmp() isn't as heavy as you fear, not with a non-ancient GCC at least.
> But this could be written in a nicer way, sure :-)
> 
> 
> Segher
> 

Christophe
