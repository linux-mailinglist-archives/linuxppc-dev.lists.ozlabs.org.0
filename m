Return-Path: <linuxppc-dev+bounces-12978-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD674BE6E89
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 09:20:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnx6Z0JYkz2yMh;
	Fri, 17 Oct 2025 18:20:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760685605;
	cv=none; b=ku6R0tHni2ih692QwNELE4pPG4C02adt+fVXYShQetKj/IE56nKB3rMRde5y26IuEADdBjPuOn+066TGbekXDjZKa4rceN/gSyysNfHiIWN7az2clt1taj+U+ykUXgpebe5m0Nfld8QhKLGrgJ8j+5RQ7issg+DyCOeFm8q7JzZom0dgZyFE+/Iwqf0LLfdQzf1lws2vXhhXpvl/m9cIabsdvMH5ooPrAwbXyOqffsGXCcWcbRuZpt4rBT25mPMXAwS9No2UPlIHj2g8ZehSSANKQNrtp/8PMaR5EurRaXR2375X2yF5lb9GIgkncyerZI3CHKU/3zUzizNVJ4wBow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760685605; c=relaxed/relaxed;
	bh=pbjo9qcx04pCWCblszCGbcgc3/dJXq6RCRA0RyvJj4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DszR+1uBGg5XFNT7xDD0xMGnvewbuwR2BHGwk8QVeE8Xqzc6lZm+Hp0+Z35TFkuA9nr3KXjQvLqVtAiXWvBNZvGYJpJXfIOnJrxSvjGiIp58Is00eVsjKXVBUMoHbUI0j7dkYhRvz0Fk4mtEw1GBkSwgQNaoX6fsUvykpyQ1Jy4lwgk+brPJ/5Wzsf8xHU2rn2mdEVwf+zfLlO9QmR5iz+Ln53eWe/JJDblki7VTEZNV9oB2YoiV4CZDVWAII0DB6Ys7v5gwSfgYpvtNR3vJGW4OgllUCGHSE3zwrsRUvK742NeEdXJGeo9F85fYlzOIZDLdOassJdoLcppXRBCs6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnx6Y0xLlz2xQ5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 18:20:04 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cnwQq1jDJz9sST;
	Fri, 17 Oct 2025 08:49:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RFjPPOnsb9An; Fri, 17 Oct 2025 08:49:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cnwQq0pngz9sSS;
	Fri, 17 Oct 2025 08:49:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 037C38B773;
	Fri, 17 Oct 2025 08:49:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id cxZ0vjnTr-9q; Fri, 17 Oct 2025 08:49:06 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AC3D78B763;
	Fri, 17 Oct 2025 08:49:06 +0200 (CEST)
Message-ID: <bd6fbf70-bf31-4b95-86db-68c0626a3338@csgroup.eu>
Date: Fri, 17 Oct 2025 08:49:06 +0200
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel failing to build on 32-bit powerpc
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 debian-powerpc <debian-powerpc@lists.debian.org>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-stable <stable@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <eb8a89e43f01a920244bde9252cbe4f5c0e2d75a.camel@physik.fu-berlin.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <eb8a89e43f01a920244bde9252cbe4f5c0e2d75a.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

Le 16/10/2025 à 21:03, John Paul Adrian Glaubitz a écrit :
> Hi,
> 
> could someone investigate the following build failure on powerpc [1], please?
> 
> In file included from /build/reproducible-path/linux-6.16.12/kernel/sched/build_policy.c:64:
> /build/reproducible-path/linux-6.16.12/kernel/sched/ext_idle.c: In function ‘is_bpf_migration_disabled’:
> /build/reproducible-path/linux-6.16.12/kernel/sched/ext_idle.c:893:14: error: ‘const struct task_struct’ has no member named ‘migration_disabled’
>    893 |         if (p->migration_disabled == 1)
>        |              ^~
> /build/reproducible-path/linux-6.16.12/kernel/sched/ext_idle.c:896:25: error: ‘const struct task_struct’ has no member named ‘migration_disabled’
>    896 |                 return p->migration_disabled;
>        |                         ^~
> 

I guess 6.16.12 is missing commit cac5cefbade9 ("sched/smp: Make SMP 
unconditional")

Christophe

