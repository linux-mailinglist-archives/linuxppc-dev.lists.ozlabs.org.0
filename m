Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E05E813FAE9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 22:00:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zGmt2gtGzDqxc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 08:00:30 +1100 (AEDT)
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
 header.s=mail header.b=SD6U3h6U; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zBmT405zzDqVZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 04:59:53 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47zBmN5N54z9v4gc;
 Thu, 16 Jan 2020 18:59:48 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=SD6U3h6U; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id EJWppnBr9WvY; Thu, 16 Jan 2020 18:59:48 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47zBmN44pnz9v4gT;
 Thu, 16 Jan 2020 18:59:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579197588; bh=IindQu42iENkFluTxFQueQVsDRT1L9tio2zY26H9ooU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=SD6U3h6UXcUuVSAFLlW6xTpgLah4GnfwkGmyYPfYMJEZ80vWz5QKjLUAJrqbLUTPG
 FHu5B9HP7RgOIk7EhNh31YeJb4FEx+y8aJnktskyHe7iF3+iFf5JvawY+g5g9uqjxF
 PgKwNxeR1X6+lUsmGgkzOI/BXQUo3iKSj9by4vDk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 43AEF8B82C;
 Thu, 16 Jan 2020 18:59:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id x7-gj-n_L5z9; Thu, 16 Jan 2020 18:59:50 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BFD998B82A;
 Thu, 16 Jan 2020 18:59:49 +0100 (CET)
Subject: Re: [PATCH vdsotest] Use vdso wrapper for gettimeofday()
To: Nathan Lynch <nathanl@linux.ibm.com>
References: <0eddeeb64c97b8b5ce0abd74e88d2cc0303e49c6.1579090596.git.christophe.leroy@c-s.fr>
 <871rrzjq5j.fsf@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <01e576b8-fe93-1026-5b39-f878297d6835@c-s.fr>
Date: Thu, 16 Jan 2020 18:59:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <871rrzjq5j.fsf@linux.ibm.com>
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
Cc: Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 16/01/2020 à 17:56, Nathan Lynch a écrit :
> Hi Christophe,
> 
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> To properly handle errors returned by gettimeofday(), the
>> DO_VDSO_CALL() macro has to be used, otherwise vdsotest
>> misinterpret VDSO function return on error.
>>
>> This has gone unnoticed until now because the powerpc VDSO
>> gettimeofday() always succeed, but while porting powerpc to
>> generic C VDSO, the following has been encountered:
> 
> Thanks for this, I'll review it soon.
> 
> Can you point me to patches for the powerpc generic vdso work?
> 

Sure.

v3 is at 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=152867

I added you in v4 destinees.

Christophe
