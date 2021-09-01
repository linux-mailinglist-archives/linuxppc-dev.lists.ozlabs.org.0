Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 919913FE108
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 19:16:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H09hL51gPz2ypZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 03:16:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H09gw2SrMz2xY5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 03:16:08 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4H09gn3fvdz9sTH;
 Wed,  1 Sep 2021 19:16:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A4nTBzrDwr2W; Wed,  1 Sep 2021 19:16:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4H09gn2gf8z9sTG;
 Wed,  1 Sep 2021 19:16:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2DC9D8B842;
 Wed,  1 Sep 2021 19:16:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id XLRTn4NdfDDj; Wed,  1 Sep 2021 19:16:05 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CA8D58B841;
 Wed,  1 Sep 2021 19:16:04 +0200 (CEST)
Subject: Re: [PATCH v2 2/2] selftests/powerpc: Add scv versions of the basic
 TM syscall tests
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210901165418.1412891-1-npiggin@gmail.com>
 <20210901165418.1412891-2-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <f99fa6c6-cebe-c261-0971-0f485cbcea2d@csgroup.eu>
Date: Wed, 1 Sep 2021 19:15:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210901165418.1412891-2-npiggin@gmail.com>
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
Cc: Eirik Fuller <efuller@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/09/2021 à 18:54, Nicholas Piggin a écrit :
> The basic TM vs syscall test code hard codes an sc instruction for the
> system call, which fails to cover scv even when the userspace libc has
> support for it.
> 
> Duplicate the tests with hard coded scv variants so both are tested
> when possible.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   .../selftests/powerpc/tm/tm-syscall-asm.S     | 46 +++++++++++++++++++
>   .../testing/selftests/powerpc/tm/tm-syscall.c | 36 ++++++++++++---
>   2 files changed, 75 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/testing/selftests/powerpc/tm/tm-syscall-asm.S b/tools/testing/selftests/powerpc/tm/tm-syscall-asm.S
> index bd1ca25febe4..849316831e6a 100644
> --- a/tools/testing/selftests/powerpc/tm/tm-syscall-asm.S
> +++ b/tools/testing/selftests/powerpc/tm/tm-syscall-asm.S
> @@ -2,6 +2,10 @@
>   #include <ppc-asm.h>
>   #include <asm/unistd.h>
>   
> +/* ppc-asm.h does not define r0 or r1 */
> +#define r0 0
> +#define r1 1
> +

See https://github.com/gcc-mirror/gcc/blob/master/gcc/config/rs6000/ppc-asm.h

It doesn't not define r1 but it defines r0.

And it defines 'sp' as register 1.

>   	.text
>   FUNC_START(getppid_tm_active)
>   	tbegin.
> @@ -26,3 +30,45 @@ FUNC_START(getppid_tm_suspended)
>   1:
>   	li	r3, -1
>   	blr
> +
> +FUNC_START(getppid_scv_tm_active)
> +	mflr	r0
> +	std	r0,16(r1)
> +	stdu	r1,-32(r1)
> +	tbegin.
> +	beq 1f
> +	li	r0, __NR_getppid
> +	scv	0
> +	tend.
> +	addi	r1,r1,32
> +	ld	r0,16(r1)
> +	mtlr	r0
> +	blr
> +1:
> +	li	r3, -1
> +	addi	r1,r1,32
> +	ld	r0,16(r1)
> +	mtlr	r0
> +	blr
> +
> +FUNC_START(getppid_scv_tm_suspended)
> +	mflr	r0
> +	std	r0,16(r1)
> +	stdu	r1,-32(r1)
> +	tbegin.
> +	beq 1f
> +	li	r0, __NR_getppid
> +	tsuspend.
> +	scv	0
> +	tresume.
> +	tend.
> +	addi	r1,r1,32
> +	ld	r0,16(r1)
> +	mtlr	r0
> +	blr
> +1:
> +	li	r3, -1
> +	addi	r1,r1,32
> +	ld	r0,16(r1)
> +	mtlr	r0
> +	blr
> diff --git a/tools/testing/selftests/powerpc/tm/tm-syscall.c b/tools/testing/selftests/powerpc/tm/tm-syscall.c
> index becb8207b432..9a822208680e 100644
> --- a/tools/testing/selftests/powerpc/tm/tm-syscall.c
> +++ b/tools/testing/selftests/powerpc/tm/tm-syscall.c
> @@ -19,24 +19,37 @@
>   #include "utils.h"
>   #include "tm.h"
>   
> +#ifndef PPC_FEATURE2_SCV
> +#define PPC_FEATURE2_SCV               0x00100000 /* scv syscall */
> +#endif
> +
>   extern int getppid_tm_active(void);
>   extern int getppid_tm_suspended(void);
> +extern int getppid_scv_tm_active(void);
> +extern int getppid_scv_tm_suspended(void);
>   
>   unsigned retries = 0;
>   
>   #define TEST_DURATION 10 /* seconds */
>   #define TM_RETRIES 100
>   
> -pid_t getppid_tm(bool suspend)
> +pid_t getppid_tm(bool scv, bool suspend)
>   {
>   	int i;
>   	pid_t pid;
>   
>   	for (i = 0; i < TM_RETRIES; i++) {
> -		if (suspend)
> -			pid = getppid_tm_suspended();
> -		else
> -			pid = getppid_tm_active();
> +		if (suspend) {
> +			if (scv)
> +				pid = getppid_scv_tm_suspended();
> +			else
> +				pid = getppid_tm_suspended();
> +		} else {
> +			if (scv)
> +				pid = getppid_scv_tm_active();
> +			else
> +				pid = getppid_tm_active();
> +		}
>   
>   		if (pid >= 0)
>   			return pid;
> @@ -82,15 +95,24 @@ int tm_syscall(void)
>   		 * Test a syscall within a suspended transaction and verify
>   		 * that it succeeds.
>   		 */
> -		FAIL_IF(getppid_tm(true) == -1); /* Should succeed. */
> +		FAIL_IF(getppid_tm(false, true) == -1); /* Should succeed. */
>   
>   		/*
>   		 * Test a syscall within an active transaction and verify that
>   		 * it fails with the correct failure code.
>   		 */
> -		FAIL_IF(getppid_tm(false) != -1);  /* Should fail... */
> +		FAIL_IF(getppid_tm(false, false) != -1);  /* Should fail... */
>   		FAIL_IF(!failure_is_persistent()); /* ...persistently... */
>   		FAIL_IF(!failure_is_syscall());    /* ...with code syscall. */
> +
> +		/* Now do it all again with scv if it is available. */
> +		if (have_hwcap2(PPC_FEATURE2_SCV)) {
> +			FAIL_IF(getppid_tm(true, true) == -1); /* Should succeed. */
> +			FAIL_IF(getppid_tm(true, false) != -1);  /* Should fail... */
> +			FAIL_IF(!failure_is_persistent()); /* ...persistently... */
> +			FAIL_IF(!failure_is_syscall());    /* ...with code syscall. */
> +		}
> +
>   		gettimeofday(&now, 0);
>   	}
>   
> 
