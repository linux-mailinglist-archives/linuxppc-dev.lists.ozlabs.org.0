Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E9A322C88
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 15:39:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DlMC75VnWz3cRQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 01:39:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DlMBq4T3wz30L1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 01:39:27 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DlMBc1zF8z9v03w;
 Tue, 23 Feb 2021 15:39:20 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id GvmprBS3eRvr; Tue, 23 Feb 2021 15:39:20 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DlMBc0wYkz9v03t;
 Tue, 23 Feb 2021 15:39:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CC93A8B81F;
 Tue, 23 Feb 2021 15:39:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id hGfLDZpiA6Q7; Tue, 23 Feb 2021 15:39:21 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1520C8B80B;
 Tue, 23 Feb 2021 15:39:21 +0100 (CET)
Subject: Re: [PATCH for 5.10] powerpc/32: Preserve cr1 in exception prolog
 stack check to fix build error
To: Greg KH <greg@kroah.com>
References: <f6d16f3321f1dc89b77ada1c7d961fae4089766e.1613120077.git.christophe.leroy@csgroup.eu>
 <YCqFn/4YuT+445xW@kroah.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d0b1ff43-59e0-29a4-1bd0-47bcfff8effa@csgroup.eu>
Date: Tue, 23 Feb 2021 15:39:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YCqFn/4YuT+445xW@kroah.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, fedora.dm0@gmail.com, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/02/2021 à 15:30, Greg KH a écrit :
> On Fri, Feb 12, 2021 at 08:57:14AM +0000, Christophe Leroy wrote:
>> This is backport of 3642eb21256a ("powerpc/32: Preserve cr1 in
>> exception prolog stack check to fix build error") for kernel 5.10
>>
>> It fixes the build failure on v5.10 reported by kernel test robot
>> and by David Michael.
>>
>> This fix is not in Linux tree yet, it is in next branch in powerpc tree.
> 
> Then there's nothing I can do about it until that happens :(
> 

It now is in Linus' tree, see 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3642eb21256a317ac14e9ed560242c6d20cf06d9

Thanks
Christophe
