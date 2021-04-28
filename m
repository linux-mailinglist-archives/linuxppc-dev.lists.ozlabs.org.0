Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5951D36D04D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 03:32:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVLjQ2bM3z309c
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 11:32:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=VN50HrwC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=VN50HrwC; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVLhz2pqVz2y86
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Apr 2021 11:32:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=SqlHofKHbcf7zyddy4pQ8lzJWiN+AIC7N+ecIrU8yyQ=; b=VN50HrwCUXQ6XtB/L61qeQiBLF
 pYbCnotm+9lEmi1eVoioF4rQsIc9kW7gkTeM2OW43nwuypifKHqXR5aEyaUJmTXg4UIjE/ANBebBU
 Rwm1FglK7g5Gb5TpjHSySnksdg908yhwFtO2U6nmpDI/LHWKJABdf286EjewyQJ0fFFqh0bD6+bEZ
 eHU4CcoUtP1YgDTRsnjAWGhPg7XY4jjNhReqxVpTZZiRSxZAMqGA75NQIIO5mg/+Vz5Pg2NJvJb3l
 rji/OAwUKJ1dKvrv5KyT9lZrdMXX8pDcYXQ41S1lzngF/80ztM4M0a4xstefhm8FR5n3nQWJLlA61
 dvfZyLSA==;
Received: from [2601:1c0:6280:3f0::df68]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lbZ3W-007h8P-Eb; Wed, 28 Apr 2021 01:32:06 +0000
Subject: Re: powerpc{32,64} randconfigs
From: Randy Dunlap <rdunlap@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
References: <45afab41-cc5f-dffa-712a-d5fb1a9d0a23@infradead.org>
 <21339633-16cb-c2ec-1517-2f5c4897fba1@csgroup.eu>
 <c973768b-8fe5-a5a4-ccfc-ebc109b6eb80@infradead.org>
Message-ID: <fe9e2c87-60fb-0f15-f9d9-17d70930ff9a@infradead.org>
Date: Tue, 27 Apr 2021 18:31:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <c973768b-8fe5-a5a4-ccfc-ebc109b6eb80@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/20/21 11:45 PM, Randy Dunlap wrote:
> On 4/20/21 11:37 PM, Christophe Leroy wrote:
>>
>>
>> Le 21/04/2021 à 01:31, Randy Dunlap a écrit :
>>> --- linux-next-20210420.orig/arch/powerpc/kernel/vdso64/Makefile
>>> +++ linux-next-20210420/arch/powerpc/kernel/vdso64/Makefile
>>> @@ -30,7 +30,7 @@ ccflags-y := -shared -fno-common -fno-bu
>>>   asflags-y := -D__VDSO64__ -s
>>>     targets += vdso64.lds
>>> -CPPFLAGS_vdso64.lds += -P -C -U$(ARCH)
>>> +CPPFLAGS_vdso64.lds += -P -C -U$(SRCARCH)
>>
>> Maybe it would be better to do -Upowerpc like in VDSO32
>>
> 
> OK, thanks for getting that done. :)
> 
>>>     # link rule for the .so file, .lds has to be first
>>>   $(obj)/vdso64.so.dbg: $(src)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday.o FORCE
>>> --- linux-next-20210420.orig/arch/powerpc/Makefile

Just to wrap this up, I got this method working also.
Thanks for all of your help, Christophe.

-- 
~Randy

