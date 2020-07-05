Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C01B1214E45
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jul 2020 19:54:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0GYC5JkZzDqVB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 03:54:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0GWW4Sq7zDqCK
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 03:52:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B0GWV4mnkz8tWb
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 03:52:54 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B0GWV12D9z9sSd; Mon,  6 Jul 2020 03:52:54 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B0GWT5WpXz9sPF
 for <linuxppc-dev@ozlabs.org>; Mon,  6 Jul 2020 03:52:53 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4B0GWL1WR1z9tyPL;
 Sun,  5 Jul 2020 19:52:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id V_KhQkkJwpw0; Sun,  5 Jul 2020 19:52:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4B0GWL0fMFz9tyPK;
 Sun,  5 Jul 2020 19:52:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EF0F88B780;
 Sun,  5 Jul 2020 19:52:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id lsEM1ItNQNVD; Sun,  5 Jul 2020 19:52:50 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 997028B75B;
 Sun,  5 Jul 2020 19:52:50 +0200 (CEST)
Subject: Re: [PATCH 3/5] selftests/powerpc: Update the stack expansion test
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20200703141327.1732550-1-mpe@ellerman.id.au>
 <20200703141327.1732550-3-mpe@ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <8f6c5175-32ce-34a2-873d-b5fb3a5d7c4c@csgroup.eu>
Date: Sun, 5 Jul 2020 19:52:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200703141327.1732550-3-mpe@ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, hughd@google.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/07/2020 à 16:13, Michael Ellerman a écrit :
> Update the stack expansion load/store test to take into account the
> new allowance of 4096 bytes below the stack pointer.

[I didn't receive patch 2, don't know why, hence commenting patch 2 here.]

Shouldn't patch 2 carry a fixes tag and be Cced to stable for 
application to previous kernel releases ?

Christophe

> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>   .../selftests/powerpc/mm/stack_expansion_ldst.c        | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/powerpc/mm/stack_expansion_ldst.c b/tools/testing/selftests/powerpc/mm/stack_expansion_ldst.c
> index 0587e11437f5..95c3f3de16a1 100644
> --- a/tools/testing/selftests/powerpc/mm/stack_expansion_ldst.c
> +++ b/tools/testing/selftests/powerpc/mm/stack_expansion_ldst.c
> @@ -186,17 +186,17 @@ static void test_one_type(enum access_type type, unsigned long page_size, unsign
>   	// But if we go past the rlimit it should fail
>   	assert(test_one(DEFAULT_SIZE, rlim_cur + 1, type) != 0);
>   
> -	// Above 1MB powerpc only allows accesses within 2048 bytes of
> +	// Above 1MB powerpc only allows accesses within 4096 bytes of
>   	// r1 for accesses that aren't stdu
> -	assert(test_one(1 * _MB + page_size - 128, -2048, type) == 0);
> +	assert(test_one(1 * _MB + page_size - 128, -4096, type) == 0);
>   #ifdef __powerpc__
> -	assert(test_one(1 * _MB + page_size - 128, -2049, type) != 0);
> +	assert(test_one(1 * _MB + page_size - 128, -4097, type) != 0);
>   #else
> -	assert(test_one(1 * _MB + page_size - 128, -2049, type) == 0);
> +	assert(test_one(1 * _MB + page_size - 128, -4097, type) == 0);
>   #endif
>   
>   	// By consuming 2MB of stack we test the stdu case
> -	assert(test_one(2 * _MB + page_size - 128, -2048, type) == 0);
> +	assert(test_one(2 * _MB + page_size - 128, -4096, type) == 0);
>   }
>   
>   static int test(void)
> 
