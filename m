Return-Path: <linuxppc-dev+bounces-6932-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD1AA5DADB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Mar 2025 11:50:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZCS7z6436z3br5;
	Wed, 12 Mar 2025 21:50:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741776607;
	cv=none; b=MG+sa55OLrrCxpZd0Wx/bSDNTt6QMLt9+wsYe5zWt8RXkgZDh5040/gEExlF0bTo7xLSzTjVqt7msXMedEJnPsUkE8e00+YwIFsrveTdZwcnU9dl4J6pAPmqHtLLc1hGOFFfFRfRFjG0w6Sw3Zz4sdEmQckTtaqtu7cO+xgfYYqMfms332P/jSRd0yC8Gq7H/p8F5Mpa28ksDzo5ZjFgNRlIlFM+2VM3zqTy+N4w90kVqnR4bx9ayrYKsu789RFVPM0wfDEycdeCOrLZa71OgBQWbKAujiEme8q+XxBG/zuFotrsuTlNX85qoFeGQyMk9MsnXzeoELgRwHPgULT6og==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741776607; c=relaxed/relaxed;
	bh=iYb8BLhObhcFQyDF7JALbCYObFTanr4UORyBS9ikBLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BEFJ9bjoeLBwO0naN8MhtMqIQuwqBCdF5fb8jODP7Avgy1TjzKp8Do1gBkLqBNOf0YpgFdZ5EBmAc1dauWnVpx1J86eki9I1JsKDumsgXQJgQvBqWqrzY05WU5e3sBtPE4ULRiD06fP4LRosizLet+jpZAU4XPbo0i9oDqGTxkH9PtlAL4Y4VO9sBvFshai5qTry+Q+ZgeJLAOxsknJlda8D2Kd0NVvvZhZtgVaLyUGgQ5Ix3qupnEQcp3hECtNs7hT3YcTRATxVXxDDAWvDEGMmk4/ns0eBGZdX6oGpX3k4cOkWAzX8v0uTE4+94G0/cyyyxd68yZhthkVZboamVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZCS7y2nW8z3bmf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 21:50:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4ZCRPX36Yhz9sgW;
	Wed, 12 Mar 2025 11:16:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sWOjLZKmmSMT; Wed, 12 Mar 2025 11:16:48 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4ZCRPX25Rsz9sgS;
	Wed, 12 Mar 2025 11:16:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 34E478B768;
	Wed, 12 Mar 2025 11:16:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id GVHOBlTWoH6b; Wed, 12 Mar 2025 11:16:48 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DEF2F8B763;
	Wed, 12 Mar 2025 11:16:47 +0100 (CET)
Message-ID: <e5a67a3a-f2ca-45b7-b227-267477c62ccb@csgroup.eu>
Date: Wed, 12 Mar 2025 11:16:47 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next-20250307] Build Failure
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>
References: <70ba4e80-53c4-4583-82f3-2851e0829aa6@linux.ibm.com>
 <5ab103b4-70f0-454e-bca6-0bfc66d143f5@csgroup.eu>
 <c0a716d0-6811-4b1b-b008-d4e97900cb0e@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <c0a716d0-6811-4b1b-b008-d4e97900cb0e@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 12/03/2025 à 11:11, Venkat Rao Bagalkote a écrit :
> 
> On 12/03/25 4:20 am, Christophe Leroy wrote:
>>
>>
>> Le 09/03/2025 à 13:38, Venkat Rao Bagalkote a écrit :
>>> Greetings!!,
>>>
>>> I see linux-next-20250307 fails to build on IBM Power9 and Power10 
>>> servers.
>>>
>>>
>>> Errors:
>>>
>>> In file included from ^[[01m^[[K<command-line>^[[m^[[K:
>>> ^[[01m^[[K./usr/include/cxl/features.h:11:10:^[[m^[[K 
>>> ^[[01;31m^[[Kfatal error: ^[[m^[[Kuuid/uuid.h: No such file or directory
>>>     11 | #include ^[[01;31m^[[K<uuid/uuid.h>^[[m^[[K
>>>        |          ^[[01;31m^[[K^~~~~~~~~~~~~^[[m^[[K
>>
>> This is unreadable. Please avoid fancy colors that add escapes to 
>> logs. You can unset LANG environment var before building in order to 
>> get pastable stuff.
>>
>> By the way I don't think it is a kernel issue because nowhere in the 
>> kernel you have uuid/uuid.h
>>
>> But can you provide your .config (the actual one, not an old one from 
>> kernel 6.0.0-rc3 like last time) and tell which version of GCC you are 
>> using.
>>
> Attached are the two config files on both CI nodes build failures were 
> reported.
> 
> On both the CI nodes gcc version is 11.5.0.
> 
> Below data are from the failure nodes.
> 
> commit-time: 2025-03-07 20:31:46 +1100
> commit-id: 0a2f889128969dab41861b6e40111aa03dc57014
> version: 6.14.0-rc5-next-20250307-auto
> 

Sorry I'm still puzzled with your config files.


The one named p10_build_failure contains:

# Linux/powerpc 6.3.0-rc3 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="gcc (GCC) 8.4.1 20200928 (Red Hat 8.4.1-1)"


The one named p10_kdump_config_build_failure contains:

# Linux/powerpc 6.3.0 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-18)"


You are talking about CI nodes, do you have an online link to the full 
report ?

Christophe

