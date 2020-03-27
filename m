Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE5419599A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 16:14:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48plkx2vLNzDrFS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 02:14:33 +1100 (AEDT)
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
 header.s=mail header.b=QsL2BJrh; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48plhm0XQKzDr85
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 02:12:37 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48plhZ5rGbzB09bG;
 Fri, 27 Mar 2020 16:12:30 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=QsL2BJrh; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id h-Hu4XtkcCgC; Fri, 27 Mar 2020 16:12:30 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48plhZ4VMwzB09b1;
 Fri, 27 Mar 2020 16:12:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585321950; bh=Yh6kFbTymoc5HnyL2CYkktE3CPUvXDinNlvDAngSsw8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QsL2BJrhEmJOzNkEeEk2SILTsi1Jo4Ld+vcoP/vpxiR24hjCvLV3phygjrNLlWoIy
 2+RVDcF2HjDRibsTiPlliBCg0lH7qUq+Y2wrV78WPy+HRLulN3ZeSdKSTQlV52uW2b
 cose9f+p3j3id83An+h5L4UQLnKkWzUDrgyCPBZI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A13958B829;
 Fri, 27 Mar 2020 16:12:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id O4Jswomm32Kx; Fri, 27 Mar 2020 16:12:31 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 853DF8B822;
 Fri, 27 Mar 2020 16:12:30 +0100 (CET)
Subject: Re: [PATCH v2] powerpc xmon: use `dcbf` inplace of `dcbi` instruction
 for 64bit Book3S
To: Balamuruhan S <bala24@linux.ibm.com>, mpe@ellerman.id.au
References: <20200326061522.33123-1-bala24@linux.ibm.com>
 <caf285b1-172e-7116-b2ed-3645f36264ed@c-s.fr>
 <a0d623ad8347c6b88ef25c4de1ac5ed736037025.camel@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <9a3c084a-9e86-ff37-111c-6f1a8f0989fc@c-s.fr>
Date: Fri, 27 Mar 2020 16:12:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <a0d623ad8347c6b88ef25c4de1ac5ed736037025.camel@linux.ibm.com>
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com, paulus@samba.org,
 sandipan@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 27/03/2020 à 10:03, Balamuruhan S a écrit :
> On Fri, 2020-03-27 at 07:48 +0100, Christophe Leroy wrote:
>>
>> Le 26/03/2020 à 07:15, Balamuruhan S a écrit :
>>> Data Cache Block Invalidate (dcbi) instruction was implemented back in
>>> PowerPC
>>> architecture version 2.03. It is obsolete and attempt to use of this
>>> illegal
>>> instruction results in a hypervisor emulation assistance interrupt. So,
>>> ifdef
>>> it out the option `i` in xmon for 64bit Book3S.
>>
>> I don't understand. You say two contradictory things:
>> 1/ You say it _was_ added back.
>> 2/ You say it _is_ obsolete.
>>
>> How can it be obsolete if it was added back ?
> 
> I actually learnt it from P8 and P9 User Manual,
> 
> The POWER8/POWER9 core does not provide support for the following optional or
> obsolete instructions (attempted use of these results in a hypervisor emulation
> assistance interrupt):
> • tlbia - TLB invalidate all
> • tlbiex - TLB invalidate entry by index (obsolete)
> • slbiex - SLB invalidate entry by index (obsolete)
> • dcba - Data cache block allocate (Book II; obsolete)
> • dcbi - Data cache block invalidate (obsolete)
> • rfi - Return from interrupt (32-bit; obsolete)
> 

Then that's exactly what you have to say in the coming log.

Maybe you could also change invalidate_dcache_range():

	for (i = 0; i < size >> shift; i++, addr += bytes) {
		if (IS_ENABLED(CONFIG_PPC_BOOK3S_64))
			dcbf(addr);
		else
			dcbi(addr);
	}




Christophe
