Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A0612A05F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 12:14:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hts95G4VzDqJh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 22:14:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="MvKlVWsI"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47htq50w0zzDqJN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 22:12:30 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47htpw3bjjz9tyXM;
 Tue, 24 Dec 2019 12:12:24 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=MvKlVWsI; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id DhOumcXGkzWb; Tue, 24 Dec 2019 12:12:24 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47htpw28BKz9tyXL;
 Tue, 24 Dec 2019 12:12:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1577185944; bh=Bn7IZfCcqw5bT2ttt8/4pM+iuD9f7XixnnqnooPsUO8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MvKlVWsI0nhGXz1jiEzJgtsO3vre9b9taOd50nQEl4NtQ8XZ3gLcegD4mGQBWSKK2
 TTyqxkgAFFOLrKfmRrtzeuOO6v+SE4+x6E4aUxR22pmu3jsA79yAvhgE5ex0ylbUmL
 FwCieuRAWn5hiSJ/qG7Zj3Zqlf5cj4c53n1w9sSA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6C3B18B783;
 Tue, 24 Dec 2019 12:12:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ZGl4WaMQ75fX; Tue, 24 Dec 2019 12:12:25 +0100 (CET)
Received: from [192.168.232.53] (unknown [192.168.232.53])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 685338B782;
 Tue, 24 Dec 2019 12:12:24 +0100 (CET)
Subject: Re: [RFC PATCH v2 07/10] lib: vdso: don't use READ_ONCE() in
 __c_kernel_time()
To: Andy Lutomirski <luto@kernel.org>
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
 <fc1ff722c7cbe63a63ae02ade3a714d2049d54a5.1577111367.git.christophe.leroy@c-s.fr>
 <CALCETrV1TWD4iMoGFX6abxXFukz081Y2XaXy6p1KJBNLpp6ZTA@mail.gmail.com>
From: christophe leroy <christophe.leroy@c-s.fr>
Message-ID: <abc4b4a6-d355-4dfd-a207-603e877b2b23@c-s.fr>
Date: Tue, 24 Dec 2019 12:12:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CALCETrV1TWD4iMoGFX6abxXFukz081Y2XaXy6p1KJBNLpp6ZTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Antivirus: Avast (VPS 191223-0, 23/12/2019), Outbound message
X-Antivirus-Status: Not-Tested
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
Cc: Arnd Bergmann <arnd@arndb.de>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/12/2019 à 02:58, Andy Lutomirski a écrit :
> On Mon, Dec 23, 2019 at 6:31 AM Christophe Leroy
> <christophe.leroy@c-s.fr> wrote:
>>
>> READ_ONCE() forces the read of the 64 bit value of
>> vd[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec allthough
>> only the lower part is needed.
> 
> Seems reasonable and very unlikely to be harmful.  That being said,
> this function really ought to be considered deprecated -- 32-bit
> time_t is insufficient.
> 
> Do you get even better code if you move the read into the if statement?

Euh ...

How can you return t when time pointer is NULL if you read t only when 
time pointer is not NULL ?

Christophe
