Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8216C195EEB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 20:42:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48psgs2BrczDr3l
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 06:42:17 +1100 (AEDT)
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
 header.s=mail header.b=UmPB4mYQ; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48psdq6tKLzDr27
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 06:40:29 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48psdj6FPtz9v9tm;
 Fri, 27 Mar 2020 20:40:25 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=UmPB4mYQ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id pXv00MUVG3Es; Fri, 27 Mar 2020 20:40:25 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48psdj51pZz9v1ZZ;
 Fri, 27 Mar 2020 20:40:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585338025; bh=DCSv8DbnGpn5aHFahSgwtsGtomty11eRaVBE6Ew/W4w=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UmPB4mYQrpklxPYdwFyOATEr2PEK5OWQRm36B09UXtSOtmAPzwnKNp/MEdKTCTue8
 1vA+NEeOpytBZiL1/g1bQesmKBGB1ZiDUipM1J0MxqHrZwuzgIZiXdA4zish0TOcBm
 +CE5Y6+prBe9g6GjDQ/PW0QwRgoiUzY1g6Oi/F9E=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B488E8B829;
 Fri, 27 Mar 2020 20:40:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id POAV7JQ6fC-J; Fri, 27 Mar 2020 20:40:25 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6B15B8B822;
 Fri, 27 Mar 2020 20:40:24 +0100 (CET)
Subject: Re: [PATCH v2] powerpc xmon: use `dcbf` inplace of `dcbi` instruction
 for 64bit Book3S
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <20200326061522.33123-1-bala24@linux.ibm.com>
 <caf285b1-172e-7116-b2ed-3645f36264ed@c-s.fr>
 <a0d623ad8347c6b88ef25c4de1ac5ed736037025.camel@linux.ibm.com>
 <9a3c084a-9e86-ff37-111c-6f1a8f0989fc@c-s.fr>
 <20200327181928.GJ22482@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <3e7e5431-e7e4-1a53-fbd8-2449d1e42b49@c-s.fr>
Date: Fri, 27 Mar 2020 20:40:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200327181928.GJ22482@gate.crashing.org>
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
Cc: ravi.bangoria@linux.ibm.com, Balamuruhan S <bala24@linux.ibm.com>,
 paulus@samba.org, sandipan@linux.ibm.com, jniethe5@gmail.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 27/03/2020 à 19:19, Segher Boessenkool a écrit :
> On Fri, Mar 27, 2020 at 04:12:13PM +0100, Christophe Leroy wrote:
>> Maybe you could also change invalidate_dcache_range():
>>
>> 	for (i = 0; i < size >> shift; i++, addr += bytes) {
>> 		if (IS_ENABLED(CONFIG_PPC_BOOK3S_64))
>> 			dcbf(addr);
>> 		else
>> 			dcbi(addr);
>> 	}
> 
> But please note that flushing is pretty much the opposite from
> invalidating (a flush (dcbf) makes sure that what is in the cache now
> ends up in memory, while an invalidate (dcbi) makes sure it will *not*
> end up in memory).  (Both will remove the addressed cache line from the
> data caches).
> 
> So you cannot blindly replace them; in all cases you need to look and
> see if it does what you need here.
> 
> (dcbi is much harder to use correctly -- it can race very easily -- so
> in practice you will be fine most of the time; but be careful around
> startup code and the like).
> 

At the time being, invalidate_dcache_range() is used in only one place, 
and that's a place for PPC32 only. So I was just suggesting that just in 
case. Maybe there is no point in bothering with that at the time being.

Christophe
