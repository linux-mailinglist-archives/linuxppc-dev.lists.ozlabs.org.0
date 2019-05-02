Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F141141A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 09:25:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vmyR58KyzDqTN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 17:25:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="FeqAubAK"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vmx60wNlzDq74
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 17:24:41 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44vmx06S8Lz9v0B5;
 Thu,  2 May 2019 09:24:36 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=FeqAubAK; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id w-82r1tBlzxt; Thu,  2 May 2019 09:24:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44vmx05QGrz9v0B4;
 Thu,  2 May 2019 09:24:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556781876; bh=G48SgTD8MZ7+zweAo8RFqAosj90VXu0rwEgFUQxNSew=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FeqAubAK5XKD82KCZj1diB10IxkVrKOKtgXy9Mk9wDtdouGln3Xdviu/ttUSOBv+M
 ZSDINo+m8k29cnXLxBV46gKgmmu6ghlRgmqnV9qfyRN3j8KD10e5LlIsyRPJdvpp6L
 S08avm9zPreoUEzPzi6MAyyOqGVEvy0PkQYtqv4Y=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B03BC8B74C;
 Thu,  2 May 2019 09:24:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id G1ANH9jVu9tn; Thu,  2 May 2019 09:24:37 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 52B378B880;
 Thu,  2 May 2019 09:24:37 +0200 (CEST)
Subject: Re: [PATCH 2/3] powerpc/module32: Use symbolic instructions names.
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <23167861f6095456b4ba3b52c55a514201ca738f.1556534520.git.christophe.leroy@c-s.fr>
 <14f88b27ff94f2d5a07a8cbc33ec75e2f8af9cf9.1556534520.git.christophe.leroy@c-s.fr>
 <20190429115431.GN8599@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <e1b55a87-cde0-895b-4cef-2c1ae9b63763@c-s.fr>
Date: Thu, 2 May 2019 09:24:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429115431.GN8599@gate.crashing.org>
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



Le 29/04/2019 à 13:54, Segher Boessenkool a écrit :
> On Mon, Apr 29, 2019 at 10:43:27AM +0000, Christophe Leroy wrote:
>> To increase readability/maintainability, replace hard coded
>> instructions values by symbolic names.
> 
>> +	/* lis r12,sym@ha */
>> +#define ENTRY_JMP0(sym)	(PPC_INST_ADDIS | __PPC_RT(R12) | PPC_HA(sym))
>> +	/* addi r12,r12,sym@l */
>> +#define ENTRY_JMP1(sym)	(PPC_INST_ADDI | __PPC_RT(R12) | __PPC_RA(R12) | PPC_LO(sym))
> 
> Those aren't "jump" instructions though, as the name suggests...  And you
> only have names for the first two of the four insns.  ("2" and "3" were
> still available ;-) )

Well, the idea was to say they are defining the jump destination.
Anyway, as they are used only once, let's put it directly in.

> 
>> -	entry->jump[0] = 0x3d800000+((val+0x8000)>>16); /* lis r12,sym@ha */
>> -	entry->jump[1] = 0x398c0000 + (val&0xffff);     /* addi r12,r12,sym@l*/
>> -	entry->jump[2] = 0x7d8903a6;                    /* mtctr r12 */
>> -	entry->jump[3] = 0x4e800420;			/* bctr */
>> +	entry->jump[0] = ENTRY_JMP0(val);
>> +	entry->jump[1] = ENTRY_JMP1(val);
>> +	entry->jump[2] = PPC_INST_MTCTR | __PPC_RS(R12);
>> +	entry->jump[3] = PPC_INST_BCTR;
> 
> Deleting the comment here is not an improvement imo.

Ok, I'll leave them in as I did for module64

Christophe

> 
> 
> Segher
> 
