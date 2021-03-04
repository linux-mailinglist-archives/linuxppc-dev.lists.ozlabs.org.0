Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5941A32D679
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 16:25:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrvnW2Mh5z3dDy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 02:25:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Drvn66df3z3cbZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 02:24:55 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Drvmy1RXQzB09ZZ;
 Thu,  4 Mar 2021 16:24:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ho3sY1I-wauT; Thu,  4 Mar 2021 16:24:50 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Drvmx5sgGzB09ZW;
 Thu,  4 Mar 2021 16:24:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EA2E18B816;
 Thu,  4 Mar 2021 16:24:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id hRFfu02BTibG; Thu,  4 Mar 2021 16:24:51 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7270C8B812;
 Thu,  4 Mar 2021 16:24:51 +0100 (CET)
Subject: Re: [PATCH v2] powerpc/32: remove bogus ppc_select syscall
To: Arnd Bergmann <arnd@arndb.de>
References: <2daa39fa210d971863a6f9ac7c81849764e7a261.1614862233.git.christophe.leroy@csgroup.eu>
 <CAK8P3a2=qOG1iLhw2fi=r128bRMdfNx4BseXONiS7vrnbVvr6w@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <aca143f6-fcfc-d89f-bb00-26e90257fbf6@csgroup.eu>
Date: Thu, 4 Mar 2021 16:24:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2=qOG1iLhw2fi=r128bRMdfNx4BseXONiS7vrnbVvr6w@mail.gmail.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, halesh.sadashiv@ap.sony.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 04/03/2021 à 16:17, Arnd Bergmann a écrit :
> On Thu, Mar 4, 2021 at 1:51 PM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> The ppc_select function was introduced in linux-2.3.48 in order to support
>> code confusing the legacy select() calling convention with the standard one.
>> Even 24 years ago, all correctly built code should not have done this and
>> could have easily been phased out. Nothing that was compiled later should
>> actually try to use the old_select interface, and it would have been broken
>> already on all ppc64 kernels with the syscall emulation layer.
>>
>> This patch brings the 32 bit compat ABI and the native 32 bit ABI for
>> powerpc into a consistent state, by removing support for both the
>> old_select system call number and the handler for it.
>>
>> The bug report triggering this came from
>> Halesh Sadashiiv <halesh.sadashiv@ap.sony.com>, who discovered that the
>> 32 bit implementation of ppc_select would in case of a negative number
>> of file descriptors incorrectly return -EFAULT instead of -EINVAL.
>> There seems to be no way to fix this problem in a way that would
>> keep broken pre-1997 binaries running.
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> Cc: Halesh Sadashiiv <halesh.sadashiv@ap.sony.com>
>> [chleroy: Rebased and updated the number of years elapsed in the commit message]
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>> First version was in 2008, at that time it was rejected, see
>> http://patchwork.ozlabs.org/project/linuxppc-dev/patch/200809240839.14902.arnd@arndb.de/
> 
> The patch from 2008 did two things:
> 
> - it removed the ppc32 specific 'select' syscall at #82
> - it fixed the generic '_newselect' syscall at #142
> 
> Back then, the decision was to only address the second issue, which
> got merged in commit dad2f2fb0fc7 ("powerpc: Fix wrong error code from
> ppc32 select syscall").
> 
> It is probably ok to remove the old select system call now, but
> my changelog text no longer makes sense, as the patch has nothing
> to do with the bug that was reported back then.
> 

I understood that the original reported bug was that calling that version of select() with a 
negative value as first parametre would lead to a -EFAULT instead of -EINVAL. That's exactly the 
case here, if you set n = -1 you get into this (unsigned long)n > 4096 then the buffer is at 
0xffffffff and access_ok() won't grand access to it so the return value will be -EFAULT instead of 
-EINVAL.

Am I missing something ?

Christophe
