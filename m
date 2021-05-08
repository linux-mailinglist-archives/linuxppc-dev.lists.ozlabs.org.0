Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF23377130
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 12:17:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FcjtT5bzgz3cNP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 20:17:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=srs0=qqpx=kd=csgroup.eu=christophe.leroy@ozlabs.org;
 receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FcjrX5Wcpz305y
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 20:15:56 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by ozlabs.org (Postfix) with ESMTP id 4FcjrQ4w5Bz9sX1
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 20:15:50 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4FcjrQ4Wk4z9sX2; Sat,  8 May 2021 20:15:50 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4FcjrQ1wQvz9sX1
 for <linuxppc-dev@ozlabs.org>; Sat,  8 May 2021 20:15:48 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FcjrK11TFz9sbl;
 Sat,  8 May 2021 12:15:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vTPLGFDN1VI3; Sat,  8 May 2021 12:15:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FcjrJ70pMz9sbk;
 Sat,  8 May 2021 12:15:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CAFA88B774;
 Sat,  8 May 2021 12:15:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vhUBODFnxePy; Sat,  8 May 2021 12:15:44 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7E13A8B76B;
 Sat,  8 May 2021 12:15:44 +0200 (CEST)
Subject: Re: Kernel crosscompilers
To: Arnd Bergmann <arnd@arndb.de>
References: <be7c92b2-43c2-0d8a-6e8c-ac92e7e07bfc@csgroup.eu>
 <CAK8P3a3OdcSQQGKxRob3A6qfh8tVD1JtLdcTp9i25SizqWpiXA@mail.gmail.com>
 <19e791d9-3226-4c13-b6e8-cdabdaaa0268@csgroup.eu>
 <CAK8P3a3V=y8tHkN6JSpA54bKAOZv9RK04WcVE9LPL0r-WE0Nmw@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <b6fad6f3-6390-54a3-f0c8-30b7476c686a@csgroup.eu>
Date: Sat, 8 May 2021 12:15:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3V=y8tHkN6JSpA54bKAOZv9RK04WcVE9LPL0r-WE0Nmw@mail.gmail.com>
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
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 08/05/2021 à 11:43, Arnd Bergmann a écrit :
> On Sat, May 8, 2021 at 8:46 AM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>> Something is going wrong with asm goto output. I implemented get_user() helpers with asm goto this
>> cycle (commit 5cd29b1fd3e8). I tested it with CLANG before submitting, it was working.
> 
> BTW, can you point me to those patches? I think it would be nice if we
> could eventually
> converge parts of get_user()/put_user() implementation on something
> that works for all
> architectures, we do seem to rewrite these way too often. Ideally we'd
> have something
> in asm-generic that provides all the wrappers, and just requires an
> architecture to
> implement the inline asm helpers for each of the sizes.
> 

The series that is merged for 5.13 is here: 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=233250&state=*

And of course the result is just 
https://github.com/linuxppc/linux/blob/master/arch/powerpc/include/asm/uaccess.h
and all its history at 
https://github.com/linuxppc/linux/commits/master/arch/powerpc/include/asm/uaccess.h

The fix from today here: 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/cf0a050d124d4f426cdc7a74009d17b01d8d8969.1620465917.git.christophe.leroy@csgroup.eu/

I made a try to use asm-generic/uaccess.h a few weeks ago, but it was not conclusive. I can't 
remember the details, but I can have a new look at it next week if you are interested with the details.

Christophe
