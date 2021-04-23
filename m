Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB01368CA3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 07:27:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRN903dJBz30Fc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 15:27:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRN8h0tmQz2xfk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 15:27:29 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FRN8Z0YrMz9tyPN;
 Fri, 23 Apr 2021 07:27:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id OR3vsWWRNQTX; Fri, 23 Apr 2021 07:27:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FRN8Y6h6fz9tyPM;
 Fri, 23 Apr 2021 07:27:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 155498B795;
 Fri, 23 Apr 2021 07:27:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Rw4RqgR549KC; Fri, 23 Apr 2021 07:27:27 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CAFC88B765;
 Fri, 23 Apr 2021 07:27:26 +0200 (CEST)
Subject: Re: [PATCH kernel] powerpc/makefile: Do not redefine $(CPP) for
 preprocessor
To: Daniel Axtens <dja@axtens.net>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 linuxppc-dev@lists.ozlabs.org
References: <20210422092737.895392-1-aik@ozlabs.ru>
 <87mttqylho.fsf@dja-thinkpad.axtens.net>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <593f0a59-c91e-573a-e37c-b710ca7891f8@csgroup.eu>
Date: Fri, 23 Apr 2021 07:27:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <87mttqylho.fsf@dja-thinkpad.axtens.net>
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



Le 23/04/2021 à 00:58, Daniel Axtens a écrit :
>> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
>> index c9d2c7825cd6..3a2f2001c62b 100644
>> --- a/arch/powerpc/Makefile
>> +++ b/arch/powerpc/Makefile
>> @@ -214,7 +214,6 @@ KBUILD_CPPFLAGS	+= -I $(srctree)/arch/$(ARCH) $(asinstr)
>>   KBUILD_AFLAGS	+= $(AFLAGS-y)
>>   KBUILD_CFLAGS	+= $(call cc-option,-msoft-float)
>>   KBUILD_CFLAGS	+= -pipe $(CFLAGS-y)
>> -CPP		= $(CC) -E $(KBUILD_CFLAGS)
> 
> I was trying to check the history to see why powerpc has its own
> definition. It seems to date back at least as far as merging the two
> powerpc platforms into one, maybe it was helpful then. I agree it
> doesn't seem to be needed now.
> 

I digged a bit deaper. It has been there since the introduction of arch/ppc/ in Linux 1.3.45
At the time, there was the exact same CPP definition in arch/mips/Makefile

The CPP definition in mips disappeared is Linux 2.1.44pre3.
Since that version, ppc has been the only one with such CPP re-definition.

> Snowpatch claims that this breaks the build, but I haven't been able to
> reproduce the issue in either pmac32 or ppc64 defconfig. I have sent it
> off to a fork of mpe's linux-ci repo to see if any of those builds hit
> any issues: https://github.com/daxtens/linux-ci/actions
> 

By the way, I find snowpatch quite useless these days. It seems to delete the reports a few minutes 
after the test. We are less than one day after the patch was submitted and the report of the build 
failures are already gone.

Christophe
