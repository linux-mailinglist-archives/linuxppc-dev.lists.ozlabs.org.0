Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F85A14E903
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 07:59:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4887Pk17ghzDqdx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 17:59:38 +1100 (AEDT)
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
 header.s=mail header.b=jTZK3fEZ; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4887ND5vTszDqBN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2020 17:58:20 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4887N76kRdzB09ZD;
 Fri, 31 Jan 2020 07:58:15 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=jTZK3fEZ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id TQmu1wzwnnpb; Fri, 31 Jan 2020 07:58:15 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4887N75VM7zB09ZC;
 Fri, 31 Jan 2020 07:58:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580453895; bh=E/UTGg1s6b1EYySKa+amKSGPOfF0kUbXPz2zxvIF7cg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jTZK3fEZYE6QtuREWRsaTnslBL9ihw9XPwf4Edt2vBlM2x00xoUnbwKN4NDbsaxbY
 wp3Dmd2jnsnWrHOYKD3qWZL/Q2l+IESBAsZJczmCo2kQY8GolXsCzlejesZFBXFn5q
 i/drXngqIiYsyxR2Vzbe11BWcYLeUOEIwha/Z4SA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9DBDB8B88A;
 Fri, 31 Jan 2020 07:58:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1xrAjDn3g1SS; Fri, 31 Jan 2020 07:58:16 +0100 (CET)
Received: from [172.25.230.105] (po15451.idsi0.si.c-s.fr [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 78AF38B884;
 Fri, 31 Jan 2020 07:58:16 +0100 (CET)
Subject: Re: [PATCH] lkdtm: Test KUAP directional user access unlocks on
 powerpc
To: Russell Currey <ruscur@russell.cc>, keescook@chromium.org,
 mpe@ellerman.id.au
References: <20200131053157.22463-1-ruscur@russell.cc>
 <1b40cea6-0675-731a-58b1-bdc65f1e495e@c-s.fr>
 <0b016861756cbe27e66651b5c21229a06558cb57.camel@russell.cc>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <c05a4327-0c81-0e3e-d93a-9d62183b146c@c-s.fr>
Date: Fri, 31 Jan 2020 07:58:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <0b016861756cbe27e66651b5c21229a06558cb57.camel@russell.cc>
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
Cc: kernel-hardening@lists.openwall.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 31/01/2020 à 07:53, Russell Currey a écrit :
> On Fri, 2020-01-31 at 07:44 +0100, Christophe Leroy wrote:
>>
>> Le 31/01/2020 à 06:31, Russell Currey a écrit :
>>> +	pr_info("attempting bad read at %px with write allowed\n",
>>> ptr);
>>> +	tmp = *ptr;
>>> +	tmp += 0xc0dec0de;
>>> +	prevent_write_to_user(ptr, sizeof(unsigned long));
>>
>> Does it work ? I would have thought that if the read fails the
>> process
>> will die and the following test won't be performed.
> 
> Correct, the ACCESS_USERSPACE test does the same thing.  Splitting this
> into separate R and W tests makes sense, even if it is unlikely that
> one would be broken without the other.
> 

Or once we are using user_access_begin() stuff, we can use 
unsafe_put_user() and unsafe_get_user() which should return an error 
instead of killing the caller.

Christophe
