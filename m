Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FBA87E2F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 17:38:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464qBt422YzDqWX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2019 01:38:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="XiJKbl8O"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464q823m8GzDqMh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Aug 2019 01:35:46 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 464q7x3x3Rz9v0Xm;
 Fri,  9 Aug 2019 17:35:41 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=XiJKbl8O; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ZfxJ1eKhQBmK; Fri,  9 Aug 2019 17:35:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 464q7x2jsnz9v0XK;
 Fri,  9 Aug 2019 17:35:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565364941; bh=MW9yLrwQEfrYZbXEf6+OUywwvutO0iJiW13AR54u9Wc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XiJKbl8Oy7jjy4aE0j6AIV/WKd5cmHO2RRbBlSohQqXkiXvGCJkSaCvPNYdeMQCM7
 O3AImR4Xwn43+oxzxMwgB3YJ5cOkhSb+qKU1ahD3DPbjUjaUWX4FXCVZRLB6DG662v
 lmMa4O0K8a95OkzxAZECo30JiVsP7+sZBXhxsaOg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0DAF08B8C1;
 Fri,  9 Aug 2019 17:35:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qwWvU-4DqhAu; Fri,  9 Aug 2019 17:35:42 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C2FD98B8BB;
 Fri,  9 Aug 2019 17:35:42 +0200 (CEST)
Subject: Re: [PATCH 4/4] powerpc: Book3S 64-bit "heavyweight" KASAN support
To: Daniel Axtens <dja@axtens.net>
References: <20190806233827.16454-1-dja@axtens.net>
 <20190806233827.16454-5-dja@axtens.net>
 <372df444-27e7-12a7-0bdb-048f29983cf4@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a47d9112-775f-1e04-3ff4-08681b4a6349@c-s.fr>
Date: Fri, 9 Aug 2019 17:35:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <372df444-27e7-12a7-0bdb-048f29983cf4@c-s.fr>
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
Cc: aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 kasan-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Daniel,

Le 07/08/2019 à 18:34, Christophe Leroy a écrit :
> 
> 
> Le 07/08/2019 à 01:38, Daniel Axtens a écrit :
>> KASAN support on powerpc64 is interesting:
>>
>>   - We want to be able to support inline instrumentation so as to be
>>     able to catch global and stack issues.
>>
>>   - We run a lot of code at boot in real mode. This includes stuff like
>>     printk(), so it's not feasible to just disable instrumentation
>>     around it.
> 
> Have you definitely given up the idea of doing a standard implementation 
> of KASAN like other 64 bits arches have done ?
> 
> Isn't it possible to setup an early 1:1 mapping and go in virtual mode 
> earlier ? What is so different between book3s64 and book3e64 ?
> On book3e64, we've been able to setup KASAN before printing anything 
> (except when using EARLY_DEBUG). Isn't it feasible on book3s64 too ?
> 

I looked at it once more, and cannot find that "We run a lot of code at 
boot in real mode. This includes stuff like printk()".

Can you provide exemples ?

AFAICS, there are two things which are run in real mode at boot:
1/ prom_init() in kernel/prom_init.c
2/ early_setup() in kernel/setup_64.c

1/ KASAN is already inhibited for prom_init(), and prom_init() only uses 
prom_printf() to display stuff.
2/ early_setup() only call a subset of simple functions. By regrouping 
things in a new file called early_64.c as done for PPC32 with 
early_32.c, we can easily inhibit kasan for those few stuff. printk() is 
not used there either, there is even a comment at the startup of 
early_setup() telling /* -------- printk is _NOT_ safe to use here ! 
------- */. The only things that perform display is the function 
udbg_printf(), which is called only when DEBUG is set and which is 
linked to CONFIG_PPC_EARLY_DEBUG. We already discussed that and agreed 
that CONFIG_PPC_EARLY_DEBUG could be made exclusive of CONFIG_KASAN.

Once early_setup() has run, BOOK3S64 goes in virtual mode, just like 
BOOK3E does.

What am I missing ?

Thanks
Christophe
