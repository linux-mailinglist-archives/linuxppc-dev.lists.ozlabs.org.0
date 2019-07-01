Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D3B5C0FD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 18:19:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45csy414CqzDqbW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 02:19:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="PLoMI9e7"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45csw96m9szDqY0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 02:17:28 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45csw26sBCz9tyqt;
 Mon,  1 Jul 2019 18:17:22 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=PLoMI9e7; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 9JGwoCBLnlI6; Mon,  1 Jul 2019 18:17:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45csw25Kqhz9tyqs;
 Mon,  1 Jul 2019 18:17:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1561997842; bh=zW0G/HFfBmagzmdo02rkmdpv+xYMQUMXSlQ5sEgDVKs=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=PLoMI9e7SG6tGJBtwPMLWVpyY5ehunr9diVbESr6712ttaO7VWkqJWLu5Qp3Dyv7I
 e5HSEcsR/9js0h8Yl2MS8M/4q/oucsFUPLyAZlxEw8pO1uwrHQ3XCB550WRn2zf6Ql
 K1zu6Dpo8fDjw7Xm3MBa1q0rJi9w8Uo3BP+zjVr4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 72F558B7B1;
 Mon,  1 Jul 2019 18:17:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id OQiJZ4JnsADM; Mon,  1 Jul 2019 18:17:23 +0200 (CEST)
Received: from [172.25.230.107] (po15451.idsi0.si.c-s.fr [172.25.230.107])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 56BE08B7AF;
 Mon,  1 Jul 2019 18:17:23 +0200 (CEST)
Subject: Re: Can I compile Linux Kernel 5.2-rc7 for PowerPC on Intel/AMD x86
 hardware?
To: Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <SG2PR01MB2141EE2AEA0C727527DAC4B087F90@SG2PR01MB2141.apcprd01.prod.exchangelabs.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <da969d6f-d5cb-88d7-77b5-54d804a067d7@c-s.fr>
Date: Mon, 1 Jul 2019 18:17:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <SG2PR01MB2141EE2AEA0C727527DAC4B087F90@SG2PR01MB2141.apcprd01.prod.exchangelabs.com>
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



Le 01/07/2019 à 15:39, Turritopsis Dohrnii Teo En Ming a écrit :
> Good evening from Singapore,

Good evening afternoon from Paris,

> 
> Can I compile Linux Kernel 5.2-rc7 for PowerPC on Intel/AMD x86 hardware, for example, AMD Ryzen 9 3950X, with 16 CPU cores and 32 threads?

Yes you can

> 
> Is it called cross-compiling?


Yes it is, you can get cross compilers at 
https://mirrors.edge.kernel.org/pub/tools/crosstool/

Thanks
Christophe

> 
> Thank you.
> 
> -----BEGIN EMAIL SIGNATURE-----
> 
> The Gospel for all Targeted Individuals (TIs):
> 
> [The New York Times] Microwave Weapons Are Prime Suspect in Ills of
> U.S. Embassy Workers
> 
> Link: https://www.nytimes.com/2018/09/01/science/sonic-attack-cuba-microwave.html
> 
> ********************************************************************************************
> 
> Singaporean Mr. Turritopsis Dohrnii Teo En Ming's Academic
> Qualifications as at 14 Feb 2019
> 
> [1] https://tdtemcerts.wordpress.com/
> 
> [2] https://tdtemcerts.blogspot.sg/
> 
> [3] https://www.scribd.com/user/270125049/Teo-En-Ming
> 
> -----END EMAIL SIGNATURE-----
> 
