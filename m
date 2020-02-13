Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFEC15B957
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 07:10:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48J5hl4Cf1zDqSq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 17:10:15 +1100 (AEDT)
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
 header.s=mail header.b=Bo8PZYyO; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48J5fp27rzzDq62
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2020 17:08:33 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48J5fg1vBSz9txqP;
 Thu, 13 Feb 2020 07:08:27 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Bo8PZYyO; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id W3ooT9PICKBs; Thu, 13 Feb 2020 07:08:27 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48J5fg0KvXz9txpx;
 Thu, 13 Feb 2020 07:08:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581574107; bh=AKmjbGNoqXYmXrUzT0AKVVfZXpSdbAFvNtOP0PQkAVk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Bo8PZYyOEZ7qD+MevGwQsu8UvvqAisxHMQmlLFbb5ZCOOdcEU4xLcfXvv0aEn1OwF
 3fkTo5JOrKAuArtvzKFZe5s3giihd2TCJnKCFWYoV92r76w9omaLNFtSsL82MjHDrb
 voS3bNq/47yELGACslffHb3qsSDzMPtFyeJQjXQU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D2FE68B752;
 Thu, 13 Feb 2020 07:08:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 5eeoAwa3yMGD; Thu, 13 Feb 2020 07:08:27 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2F9C88B795;
 Thu, 13 Feb 2020 07:08:27 +0100 (CET)
Subject: Re: [PATCH v7 4/4] powerpc: Book3S 64-bit "heavyweight" KASAN support
To: Daniel Axtens <dja@axtens.net>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 kasan-dev@googlegroups.com, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
References: <20200213004752.11019-1-dja@axtens.net>
 <20200213004752.11019-5-dja@axtens.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <67370fc6-8fe8-c5ba-d97a-4a4c399b0ae0@c-s.fr>
Date: Thu, 13 Feb 2020 07:08:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200213004752.11019-5-dja@axtens.net>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/02/2020 à 01:47, Daniel Axtens a écrit :
> KASAN support on Book3S is a bit tricky to get right:
> 
>   - It would be good to support inline instrumentation so as to be able to
>     catch stack issues that cannot be caught with outline mode.
> 
>   - Inline instrumentation requires a fixed offset.
> 
>   - Book3S runs code in real mode after booting. Most notably a lot of KVM
>     runs in real mode, and it would be good to be able to instrument it.
> 
>   - Because code runs in real mode after boot, the offset has to point to
>     valid memory both in and out of real mode.
> 
>      [ppc64 mm note: The kernel installs a linear mapping at effective
>      address c000... onward. This is a one-to-one mapping with physical
>      memory from 0000... onward. Because of how memory accesses work on
>      powerpc 64-bit Book3S, a kernel pointer in the linear map accesses the
>      same memory both with translations on (accessing as an 'effective
>      address'), and with translations off (accessing as a 'real
>      address'). This works in both guests and the hypervisor. For more
>      details, see s5.7 of Book III of version 3 of the ISA, in particular
>      the Storage Control Overview, s5.7.3, and s5.7.5 - noting that this
>      KASAN implementation currently only supports Radix.]
> 
> One approach is just to give up on inline instrumentation. This way all
> checks can be delayed until after everything set is up correctly, and the
> address-to-shadow calculations can be overridden. However, the features and
> speed boost provided by inline instrumentation are worth trying to do
> better.
> 
> If _at compile time_ it is known how much contiguous physical memory a
> system has, the top 1/8th of the first block of physical memory can be set
> aside for the shadow. This is a big hammer and comes with 3 big
> consequences:
> 
>   - there's no nice way to handle physically discontiguous memory, so only
>     the first physical memory block can be used.
> 
>   - kernels will simply fail to boot on machines with less memory than
>     specified when compiling.
> 
>   - kernels running on machines with more memory than specified when
>     compiling will simply ignore the extra memory.
> 
> Implement and document KASAN this way. The current implementation is Radix
> only.
> 
> Despite the limitations, it can still find bugs,
> e.g. http://patchwork.ozlabs.org/patch/1103775/
> 
> At the moment, this physical memory limit must be set _even for outline
> mode_. This may be changed in a later series - a different implementation
> could be added for outline mode that dynamically allocates shadow at a
> fixed offset. For example, see https://patchwork.ozlabs.org/patch/795211/
> 
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Balbir Singh <bsingharora@gmail.com> # ppc64 out-of-line radix version
> Cc: Christophe Leroy <christophe.leroy@c-s.fr> # ppc32 version
> Signed-off-by: Daniel Axtens <dja@axtens.net>

Reviewed-by: <christophe.leroy@c-s.fr> # focussed mainly on 
Documentation and things impacting PPC32

