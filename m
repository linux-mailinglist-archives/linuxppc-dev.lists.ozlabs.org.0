Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4194D67E9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 18:42:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFYDY4KFSz3bZM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 04:42:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFYD530Hpz2yxW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 04:42:26 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KFYCy73Mxz9sSC;
 Fri, 11 Mar 2022 18:42:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WrQjQF5eHTLp; Fri, 11 Mar 2022 18:42:22 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KFYCy6Gp1z9sSB;
 Fri, 11 Mar 2022 18:42:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BF6D48B78F;
 Fri, 11 Mar 2022 18:42:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qP7-8FDy9ixD; Fri, 11 Mar 2022 18:42:22 +0100 (CET)
Received: from [192.168.202.87] (unknown [192.168.202.87])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 39AA18B763;
 Fri, 11 Mar 2022 18:42:22 +0100 (CET)
Message-ID: <5b5840ab-e8ee-fa34-06e0-ca6269f2e211@csgroup.eu>
Date: Fri, 11 Mar 2022 18:42:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCHv5 0/3] enable nr_cpus for powerpc
Content-Language: fr-FR
To: Pingfan Liu <kernelfans@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <1521088912-31742-1-git-send-email-kernelfans@gmail.com>
 <CAFgQCTu3NRA1vi6auftHeXBWvPWgZRRURLHB6u7ih0TnkrzXrQ@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <CAFgQCTu3NRA1vi6auftHeXBWvPWgZRRURLHB6u7ih0TnkrzXrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: cascardo@canonical.com, kexec@lists.infradead.org,
 gpiccoli@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/03/2018 à 06:28, Pingfan Liu a écrit :
> Maintainers, ping? Any comment?

This series doesn't apply anymore, and it has build failure report from 
the robot.

If it's still relevant, please rebase and fix.

Christophe

> 
> Thanks
> 
> On Thu, Mar 15, 2018 at 12:41 PM, Pingfan Liu <kernelfans@gmail.com> wrote:
>> This topic has a very long history. It comes from Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
>> For v3: https://patchwork.ozlabs.org/patch/834860/
>> I hope we can acquire it for "kexec -p" soon.
>>
>> V4->V5:
>>    improve the [1/3] implementation based on Benjamin's suggestion.
>>
>> Mahesh Salgaonkar (1):
>>    ppc64 boot: Wait for boot cpu to show up if nr_cpus limit is about to
>>      hit.
>>
>> Pingfan Liu (2):
>>    powerpc, cpu: partially unbind the mapping between cpu logical id and
>>         its seq in dt
>>    powerpc, cpu: handling the special case when boot_cpuid greater than
>>      nr_cpus
>>
>>   arch/powerpc/include/asm/paca.h    |  3 +++
>>   arch/powerpc/include/asm/smp.h     |  2 ++
>>   arch/powerpc/kernel/paca.c         | 19 ++++++++++++++-----
>>   arch/powerpc/kernel/prom.c         | 27 ++++++++++++++++-----------
>>   arch/powerpc/kernel/setup-common.c | 35 ++++++++++++++++++++++++++++++++---
>>   5 files changed, 67 insertions(+), 19 deletions(-)
>>
>> --
>> 2.7.4
>>
