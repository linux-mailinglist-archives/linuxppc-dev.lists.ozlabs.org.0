Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC24EA440
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 20:30:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473JSh6yBzzF4ln
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 06:30:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="TrJAltYS"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473JQf0pVMzF4gF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 06:28:23 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 473JQV58zdzB09ZV;
 Wed, 30 Oct 2019 20:28:18 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=TrJAltYS; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id iXswy5aqM3Cz; Wed, 30 Oct 2019 20:28:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 473JQV3x7fzB09ZS;
 Wed, 30 Oct 2019 20:28:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1572463698; bh=ETokkupD46fOqlNm37kOMe+hG1J9xpIjHaEC+LfiVeY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=TrJAltYSIt4J02S1w/Mp4rD1r8mebAnu7YyWhYjgDw3eJ74nOa6jTB1PVKY7/BSfr
 kPMowTuZeTwMxpwoFdyQYhtzf5g9XwqAc2INQ2OSu8do83JzS/TjO4EUWDhndJdPUZ
 r3Yt3G+byPB+HhmB0cZuEPwv1Tx3HiAK7Szz6n3E=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7A6338B8A2;
 Wed, 30 Oct 2019 20:28:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id mVfLfeFFNn-0; Wed, 30 Oct 2019 20:28:18 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DE0178B8A1;
 Wed, 30 Oct 2019 20:28:17 +0100 (CET)
Subject: Re: [PATCH v5 0/5] Implement STRICT_MODULE_RWX for powerpc
To: Kees Cook <keescook@chromium.org>
References: <20191030073111.140493-1-ruscur@russell.cc>
 <53461d29-ec0c-4401-542e-6d575545da38@c-s.fr>
 <201910301128.E7552CDD@keescook>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <776c0722-eb8c-622a-a70b-f19ae07c1dc3@c-s.fr>
Date: Wed, 30 Oct 2019 20:28:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <201910301128.E7552CDD@keescook>
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, npiggin@gmail.com,
 joel@jms.id.au, linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/10/2019 à 19:30, Kees Cook a écrit :
> On Wed, Oct 30, 2019 at 09:58:19AM +0100, Christophe Leroy wrote:
>>
>>
>> Le 30/10/2019 à 08:31, Russell Currey a écrit :
>>> v4 cover letter: https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-October/198268.html
>>> v3 cover letter: https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-October/198023.html
>>>
>>> Changes since v4:
>>> 	[1/5]: Addressed review comments from Michael Ellerman (thanks!)
>>> 	[4/5]: make ARCH_HAS_STRICT_MODULE_RWX depend on
>>> 	       ARCH_HAS_STRICT_KERNEL_RWX to simplify things and avoid
>>> 	       STRICT_MODULE_RWX being *on by default* in cases where
>>> 	       STRICT_KERNEL_RWX is *unavailable*
>>> 	[5/5]: split skiroot_defconfig changes out into its own patch
>>>
>>> The whole Kconfig situation is really weird and confusing, I believe the
>>> correct resolution is to change arch/Kconfig but the consequences are so
>>> minor that I don't think it's worth it, especially given that I expect
>>> powerpc to have mandatory strict RWX Soon(tm).
>>
>> I'm not such strict RWX can be made mandatory due to the impact it has on
>> some subarches:
>> - On the 8xx, unless all areas are 8Mbytes aligned, there is a significant
>> overhead on TLB misses. And Aligning everthing to 8M is a waste of RAM which
>> is not acceptable on systems having very few RAM.
>> - On hash book3s32, we are able to map the kernel BATs. With a few alignment
>> constraints, we are able to provide STRICT_KERNEL_RWX. But we are unable to
>> provide exec protection on page granularity. Only on 256Mbytes segments. So
>> for modules, we have to have the vmspace X. It is also not possible to have
>> a kernel area RO. Only user areas can be made RO.
> 
> As I understand it, the idea was for it to be mandatory (or at least
> default-on) only for the subarches where it wasn't totally insane to
> accomplish. :) (I'm not familiar with all the details on the subarchs,
> but it sounded like the more modern systems would be the targets for
> this?)
> 

Yes I guess so.

I was just afraid by "I expect powerpc to have mandatory strict RWX"

By the way, we have an open issue #223 namely 'Make strict kernel RWX 
the default on 64-bit', so no worry as 32-bit is aside for now.

Christophe
