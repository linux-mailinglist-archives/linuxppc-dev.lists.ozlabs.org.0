Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CD1DDD75
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Oct 2019 11:21:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46wvRK1W4CzDqlm
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Oct 2019 20:21:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46wvPR2cYmzDqXB
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2019 20:20:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="EP/fa6gI"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46wvPQ5hdVz8x3j
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2019 20:20:10 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 46wvPQ4mg9z9sP7; Sun, 20 Oct 2019 20:20:10 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="EP/fa6gI"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46wvPN1Gnsz9sP6
 for <linuxppc-dev@ozlabs.org>; Sun, 20 Oct 2019 20:20:06 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46wvPB5sTgz9tytd;
 Sun, 20 Oct 2019 11:19:58 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=EP/fa6gI; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id OzAjmNyw9rap; Sun, 20 Oct 2019 11:19:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46wvPB4n3yz9v09C;
 Sun, 20 Oct 2019 11:19:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1571563198; bh=lPrfKKQ/hvKea72SX24ztEsO+A5Ntht0u2mnTiczGhQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=EP/fa6gIet8gJqhNzaJhy4l8GUuKx0kx8NFlX9nX4T4Q9Ttd3HK9UCfr1uDjTet6+
 WwuH6tyWSw9WcNTL0G69eVmm/LKLWPv0B36FcxbpO7sHFAaYTXDYyzJlSA0djf0uYW
 vRowabocnGCOUdBCA4VYzx6/WHVCOtk6qZf/KzBE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9302C8B7A6;
 Sun, 20 Oct 2019 11:20:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 76_ZywE7MRTK; Sun, 20 Oct 2019 11:20:01 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 10A9D8B788;
 Sun, 20 Oct 2019 11:20:01 +0200 (CEST)
Subject: Re: passing NULL to clock_getres (VDSO): terminated by unexpected
 signal 11
To: Andreas Schwab <schwab@linux-m68k.org>
References: <0fc22a08-31d9-e4d1-557e-bf5b482a9a20__6444.28012180782$1571503753$gmane$org@c-s.fr>
 <87v9skcznp.fsf@igel.home>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <ed65e4c6-2fe0-2f5c-f667-5a81b19eb073@c-s.fr>
Date: Sun, 20 Oct 2019 11:20:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87v9skcznp.fsf@igel.home>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/10/2019 à 21:18, Andreas Schwab a écrit :
> On Okt 19 2019, Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> 
>> Hi Nathan,
>>
>> While trying to switch powerpc VDSO to C version of gettimeofday(), I'm
>> getting the following kind of error with vdsotest:
>>
>> passing NULL to clock_getres (VDSO): terminated by unexpected signal 11
>>
>> Looking at commit a9446a906f52 ("lib/vdso/32: Remove inconsistent NULL
>> pointer checks"), it seems that signal 11 is expected when passing NULL
>> pointer.
>>
>> Any plan to fix vdsotest ?
> 
> Passing NULL to clock_getres is valid, and required to return
> successfully if the clock id is valid.
> 

Do you mean the following commit is wrong ?

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/lib/vdso?id=a9446a906f52292c52ecbd5be78eaa4d8395756c

Christophe
