Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F8519A5F7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 09:11:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48scmx6cx9zDqKh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 18:11:13 +1100 (AEDT)
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
 header.s=mail header.b=TxtpxE0O; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48scfc4hHpzDqv8
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 18:05:44 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48scfX1Flxz9v9vW;
 Wed,  1 Apr 2020 09:05:40 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=TxtpxE0O; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id oUWU8ClbUtFF; Wed,  1 Apr 2020 09:05:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48scfX00mTz9v9vV;
 Wed,  1 Apr 2020 09:05:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585724740; bh=5Fr6a41jwvLb6f6snVAMPm05DPoHZ6HdhWE6bi2fA4Y=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=TxtpxE0OLS+oPjGQ+Iz3BgbbyKg98h5fUHYliby0DBphyPCEbalxpn3JVkXrUIYgw
 bSzgVSh3F7ZLcwZ2Jn5/z7ssu1qqQzfdRvfhB4ahQVRTNYyukPkxMXADRPQakrdCIm
 8kFRkarwSwmqcyX3ZppnB/6v4biWYs97cd+49gQE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 993748B7B3;
 Wed,  1 Apr 2020 09:05:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ltQB2BylwNYc; Wed,  1 Apr 2020 09:05:40 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6FB718B778;
 Wed,  1 Apr 2020 09:05:37 +0200 (CEST)
Subject: Re: [PATCH v2 03/16] powerpc/watchpoint: Introduce function to get nr
 watchpoints dynamically
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
References: <20200401061309.92442-1-ravi.bangoria@linux.ibm.com>
 <20200401061309.92442-4-ravi.bangoria@linux.ibm.com>
 <7851b702-8a93-11a8-6553-e0a51967dfc0@c-s.fr>
 <b6ff59ce-8251-c50f-1c0e-b1f54fccb09f@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <589df2d6-8fd0-8dab-9197-497610f0873b@c-s.fr>
Date: Wed, 1 Apr 2020 09:05:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <b6ff59ce-8251-c50f-1c0e-b1f54fccb09f@linux.ibm.com>
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
Cc: apopple@linux.ibm.com, mikey@neuling.org, peterz@infradead.org,
 oleg@redhat.com, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 paulus@samba.org, jolsa@kernel.org, fweisbec@gmail.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/04/2020 à 08:50, Ravi Bangoria a écrit :
> 
> 
> On 4/1/20 11:59 AM, Christophe Leroy wrote:
>>
>>
>> Le 01/04/2020 à 08:12, Ravi Bangoria a écrit :
>>> So far we had only one watchpoint, so we have hardcoded HBP_NUM to 1.
>>> But future Power architecture is introducing 2nd DAWR and thus kernel
>>> should be able to dynamically find actual number of watchpoints
>>> supported by hw it's running on. Introduce function for the same.
>>> Also convert HBP_NUM macro to HBP_NUM_MAX, which will now represent
>>> maximum number of watchpoints supported by Powerpc.
>>
>>
>> Everywhere else in the code, it is called 'breakpoint', not 'watchpoint'.
>>
>> Wouldn't it be more consistent to call the function nr_bp_slots() 
>> instead of nr_wp_slots() ?
>>
>> Especially as we are likely going to extend your changes to support 
>> DABR2 in addition to DABR on BOOK3S/32.
> 
> Sure. I don't have strong onion for nr_wp_slots() and I can rename it to
> nr_bp_slots(). but...
> 
> Even though existing code uses breakpoint and watchpoint interchangeably,
> I'm using wp/watchpoint to represent data-breakpoint, to distinguish it
> from instruction-breakpoint (CIABR). So IMHO, nr_wp_slots() should return
> number DAWRs/DABRs and nr_bp_slots() should return number of CIABRs. Is
> that okay?
> 


Yes that makes sense too. Up to you.

Christophe
