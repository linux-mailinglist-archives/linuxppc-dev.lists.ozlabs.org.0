Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E62B04BFADD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 15:23:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K31cf1hy4z3bbN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 01:23:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K31cD3KG8z2xsc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 01:23:22 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4K31c80XrNz9sSK;
 Tue, 22 Feb 2022 15:23:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WN1arV81VE_3; Tue, 22 Feb 2022 15:23:19 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4K31c76sfQz9sSG;
 Tue, 22 Feb 2022 15:23:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DC2968B778;
 Tue, 22 Feb 2022 15:23:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id EGWq3rOP56Dx; Tue, 22 Feb 2022 15:23:19 +0100 (CET)
Received: from [192.168.7.78] (unknown [192.168.7.78])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 986568B764;
 Tue, 22 Feb 2022 15:23:19 +0100 (CET)
Message-ID: <468b04e9-4fa6-883d-fb9a-96a1371c6d8d@csgroup.eu>
Date: Tue, 22 Feb 2022 15:23:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] powerpc/bpf: Reallocate BPF registers to volatile
 registers when possible on PPC64
Content-Language: fr-FR
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210727065539.299598-1-jniethe5@gmail.com>
 <20210727065539.299598-3-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20210727065539.299598-3-jniethe5@gmail.com>
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
Cc: naveen.n.rao@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 27/07/2021 à 08:55, Jordan Niethe a écrit :
> Implement commit 40272035e1d0 ("powerpc/bpf: Reallocate BPF registers to
> volatile registers when possible on PPC32") for PPC64.
> 
> When the BPF routine doesn't call any function, the non volatile
> registers can be reallocated to volatile registers in order to avoid
> having to save them/restore on the stack. To keep track of which
> registers can be reallocated to make sure registers are set seen when
> used.
> 
> Before this patch, the test #359 ADD default X is:
>     0:   nop
>     4:   nop
>     8:   std     r27,-40(r1)
>     c:   std     r28,-32(r1)
>    10:   xor     r8,r8,r8
>    14:   rotlwi  r8,r8,0
>    18:   xor     r28,r28,r28
>    1c:   rotlwi  r28,r28,0
>    20:   mr      r27,r3
>    24:   li      r8,66
>    28:   add     r8,r8,r28
>    2c:   rotlwi  r8,r8,0
>    30:   ld      r27,-40(r1)
>    34:   ld      r28,-32(r1)
>    38:   mr      r3,r8
>    3c:   blr
> 
> After this patch, the same test has become:
>     0:   nop
>     4:   nop
>     8:   xor     r8,r8,r8
>     c:   rotlwi  r8,r8,0
>    10:   xor     r5,r5,r5
>    14:   rotlwi  r5,r5,0
>    18:   mr      r4,r3
>    1c:   li      r8,66
>    20:   add     r8,r8,r5
>    24:   rotlwi  r8,r8,0
>    28:   mr      r3,r8
>    2c:   blr
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>

If this series is still applicable, it needs to be rebased of Naveen's 
series https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=286000

Christophe

