Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4773AAF3C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 11:01:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5GHf4bN6z3c2M
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 19:01:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=srs0=g4gi=ll=csgroup.eu=christophe.leroy@ozlabs.org;
 receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5GHH0pCRz2yXW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 19:00:42 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by ozlabs.org (Postfix) with ESMTP id 4G5GHC0blbz9sWM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 19:00:39 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G5GHB74ZDz9sWH; Thu, 17 Jun 2021 19:00:38 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4G5GHB4TMxz9sW6
 for <linuxppc-dev@ozlabs.org>; Thu, 17 Jun 2021 19:00:33 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G5GH26wqnzB56g;
 Thu, 17 Jun 2021 11:00:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BdNSe2CPqUcK; Thu, 17 Jun 2021 11:00:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G5GH162Czz9yvh;
 Thu, 17 Jun 2021 11:00:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C933D8B806;
 Thu, 17 Jun 2021 11:00:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pfs-TSJJDOw0; Thu, 17 Jun 2021 11:00:29 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8FFA78B804;
 Thu, 17 Jun 2021 11:00:29 +0200 (CEST)
Subject: Re: [PATCH] selftests/powerpc: Add a test of sigreturn vs VDSO
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <48p3cX2lj3z9sRN@ozlabs.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <ebcb7845-d037-aad7-ac56-9b172be7160a@csgroup.eu>
Date: Thu, 17 Jun 2021 11:00:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <48p3cX2lj3z9sRN@ozlabs.org>
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



Le 26/03/2020 à 13:06, Michael Ellerman a écrit :
> On Wed, 2020-03-04 at 11:04:02 UTC, Michael Ellerman wrote:
>> There's two different paths through the sigreturn code, depending on
>> whether the VDSO is mapped or not. We recently discovered a bug in the
>> unmapped case, because it's not commonly used these days.
>>
>> So add a test that sends itself a signal, then moves the VDSO, takes
>> another signal and finally unmaps the VDSO before sending itself
>> another signal. That tests the standard signal path, the code that
>> handles the VDSO being moved, and also the signal path in the case
>> where the VDSO is unmapped.
>>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> 
> Applied to powerpc next.
> 
> https://git.kernel.org/powerpc/c/a0968a025c04702427a4aee2c618f451a5098cd8
> 
> cheers
> 

Doesn't work anymore since the split of VDSO and VVAR.

Christophe
