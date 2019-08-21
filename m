Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 974C297855
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 13:52:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46D5cs68yZzDr8g
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 21:52:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="HvVs/yaQ"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D5b532MJzDqC0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 21:50:56 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46D5Zy67rpzB09b3;
 Wed, 21 Aug 2019 13:50:50 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=HvVs/yaQ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ywIX-tXvc-mO; Wed, 21 Aug 2019 13:50:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46D5Zy53lvzB09b2;
 Wed, 21 Aug 2019 13:50:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566388250; bh=7RP7bC0Mb79ze8O7NICNrze709hQamG70VPvErmYljc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=HvVs/yaQ04JU4Jl1JqigHX5ohMGAgtCOizipBqzrnHdn7GEmOYjQwOMLiod1EiKXD
 eYxse9i2hw/qfeooYPx7rIY9D1evLN1TYdVGj52b93U+zhu8TAvmKYqCfw5xsE5bIl
 TtzXoiSUJAKIMtY8xAmsJcxMNyIfDSxWopo66q8Q=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AE5678B7E7;
 Wed, 21 Aug 2019 13:50:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id XxaowlNMu_d0; Wed, 21 Aug 2019 13:50:52 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 920A68B7E0;
 Wed, 21 Aug 2019 13:50:52 +0200 (CEST)
Subject: Re: [PATCH] powerpc/vdso64: inline __get_datapage()
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Santosh Sivaraj <santosh@fossix.org>
References: <6662919bd80773aaf339e85b14af1ea1ddbfd841.camel@kernel.crashing.org>
 <20190821092959.16066-1-santosh@fossix.org>
 <20190821114423.GC31406@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <b7cc5d77-dfca-1cf7-f316-636a4f603b04@c-s.fr>
Date: Wed, 21 Aug 2019 13:50:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821114423.GC31406@gate.crashing.org>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/08/2019 à 13:44, Segher Boessenkool a écrit :
> Hi!
> 
> On Wed, Aug 21, 2019 at 02:59:59PM +0530, Santosh Sivaraj wrote:
>> except for a couple of calls (1 or 2 nsec reduction), there are no
>> improvements in the call times. Or is 10 nsec the minimum granularity??
>>
>> So I don't know if its even worth updating vdso64 except to keep vdso32 and
>> vdso64 equal.
> 
> Calls are cheap, in principle...  It is the LR stuff that can make it
> slower on some cores, and a lot of calling sequence stuff may have
> considerable overhead of course.

On an 8xx, a taken branch is 2 cycles and a non taken branch in 1 cycle 
(+ the refetch if that was not the anticipate branch).

> 
>> +.macro get_datapage ptr, tmp
>> +	bcl	20,31,888f
>> +888:
>> +	mflr	\ptr
>> +	addi	\ptr, \ptr, __kernel_datapage_offset - 888b
>> +	lwz	\tmp, 0(\ptr)
>> +	add	\ptr, \tmp, \ptr
>> +.endm
> 
> (You can just write that as
> 	bcl 20,31,$+4
> 	mflr \ptr
> etc.  Useless labels are useless :-) )

Nice trick. Will use that.

> 
> One thing you might want to do to improve performance is to do this without
> the bcl etc., because you cannot really hide the LR latency of that.  But
> that isn't very many ns either...  Superscalar helps, OoO helps, but it is
> mostly just that >100MHz helps ;-)

Good idea. Did you have a look at my vdso32 similar patch ? 
https://patchwork.ozlabs.org/patch/1148274/

Do you have any idea on how to avoid that bcl/mflr stuff ?

Christophe
