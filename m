Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE65E758A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 16:53:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471zl64KtbzDr2d
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 02:53:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 471zhp0VSgzDqJT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 02:51:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="VLDqKNVO"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 471zhn6hnCz8syv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 02:51:05 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 471zhn6JyYz9sPK; Tue, 29 Oct 2019 02:51:05 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="VLDqKNVO"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 471zhl2Dsyz9sP4
 for <linuxppc-dev@ozlabs.org>; Tue, 29 Oct 2019 02:51:02 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 471zhX5hrXz9tym7;
 Mon, 28 Oct 2019 16:50:52 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=VLDqKNVO; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id flNDJNaxLvii; Mon, 28 Oct 2019 16:50:52 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 471zhX4fsBz9tym6;
 Mon, 28 Oct 2019 16:50:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1572277852; bh=64GnMuo56zHeG9k6b8Hbg7OjOuUKAbVDvrd5uT32tz0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VLDqKNVOnve8w4+SVCBiHIY8tUG7zbik4bCLvGfaU9bDZiTXi4N28fC6i6Pb49uJq
 LD0bwddwTDKLmlIRnrOWNg40/YGzpWq4AGRc4o9xv6TtuKEWxDWnhQM5fCvk61Nz8y
 EE5IOHnh8dVs55xry+HQDjsScJeiXmhbfTz2+2zI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DFA4C8B938;
 Mon, 28 Oct 2019 16:50:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vQa82cbw7owJ; Mon, 28 Oct 2019 16:50:57 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A76A58B942;
 Mon, 28 Oct 2019 16:50:57 +0100 (CET)
Subject: Re: passing NULL to clock_getres (VDSO): terminated by unexpected
 signal 11
To: Nathan Lynch <nathanl@linux.ibm.com>
References: <0fc22a08-31d9-e4d1-557e-bf5b482a9a20@c-s.fr>
 <87wocolvox.fsf@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <cd44b39f-321f-dcb8-e5c5-00cfa36af7ee@c-s.fr>
Date: Mon, 28 Oct 2019 16:50:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87wocolvox.fsf@linux.ibm.com>
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
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 28/10/2019 à 16:46, Nathan Lynch a écrit :
> Hi Christophe,
> 
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
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
> I'm afraid other work has kept me from following up on this promptly,
> sorry. I've read the thread here:
> 
> https://lore.kernel.org/linuxppc-dev/87v9skcznp.fsf@igel.home/
> 
> And it looks like vdsotest does not need a fix (and in fact found a bug)
> -- correct?
> 

Yes that's correct, thanks.
Christophe
