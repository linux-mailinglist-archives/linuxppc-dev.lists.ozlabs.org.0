Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 607889489A4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 08:55:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdPFR2lvfz3d24
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 16:55:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WdPF42FZNz30TQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2024 16:54:46 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WdPDw3G4Jz9sRy;
	Tue,  6 Aug 2024 08:54:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9C1_uF5rH1in; Tue,  6 Aug 2024 08:54:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WdPDw1q2qz9sRs;
	Tue,  6 Aug 2024 08:54:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1743F8B76C;
	Tue,  6 Aug 2024 08:54:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 9ed2RUntKXGp; Tue,  6 Aug 2024 08:54:40 +0200 (CEST)
Received: from [192.168.234.84] (unknown [192.168.234.84])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B17788B763;
	Tue,  6 Aug 2024 08:54:39 +0200 (CEST)
Message-ID: <f4ae0d9e-5d1f-4b5e-92b9-aabb513e3097@csgroup.eu>
Date: Tue, 6 Aug 2024 08:54:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftest/powerpc/benchmark: remove requirement libc-dev
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au,
 npiggin@gmail.com, shuah@kernel.org
References: <20240805083008.1300853-1-maddy@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240805083008.1300853-1-maddy@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/08/2024 à 10:30, Madhavan Srinivasan a écrit :
> Currently exec-target.c file is linked as static and this
> post a requirement to install libc dev package to build.
> Without it, build-breaks when compiling selftest/powerpc/benchmark.
> 
>    CC       exec_target
> /usr/bin/ld: cannot find -lc: No such file or directory
> collect2: error: ld returned 1 exit status
> 
> exec_target.c is using "syscall" library function which
> could be replaced with a inline assembly and the same is
> proposed as a fix here.
> 
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
>   tools/testing/selftests/powerpc/benchmarks/Makefile    |  2 +-
>   .../testing/selftests/powerpc/benchmarks/exec_target.c | 10 ++++++++--
>   2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/powerpc/benchmarks/Makefile b/tools/testing/selftests/powerpc/benchmarks/Makefile
> index 1321922038d0..ca4483c238b9 100644
> --- a/tools/testing/selftests/powerpc/benchmarks/Makefile
> +++ b/tools/testing/selftests/powerpc/benchmarks/Makefile
> @@ -18,4 +18,4 @@ $(OUTPUT)/context_switch: LDLIBS += -lpthread
>   
>   $(OUTPUT)/fork: LDLIBS += -lpthread
>   
> -$(OUTPUT)/exec_target: CFLAGS += -static -nostartfiles
> +$(OUTPUT)/exec_target: CFLAGS += -nostartfiles
> diff --git a/tools/testing/selftests/powerpc/benchmarks/exec_target.c b/tools/testing/selftests/powerpc/benchmarks/exec_target.c
> index c14b0fc1edde..20027a23b594 100644
> --- a/tools/testing/selftests/powerpc/benchmarks/exec_target.c
> +++ b/tools/testing/selftests/powerpc/benchmarks/exec_target.c
> @@ -7,10 +7,16 @@
>    */
>   
>   #define _GNU_SOURCE
> -#include <unistd.h>
>   #include <sys/syscall.h>
>   
>   void _start(void)
>   {
> -	syscall(SYS_exit, 0);
> +	asm volatile (
> +		"li %%r0, %[sys_exit];"
> +		"li %%r3, 0;"
> +		"sc;"
> +		:
> +		: [sys_exit] "i" (SYS_exit)
> +		: "r0", "r3"
> +	);

That looks ok because SYS_exit() is not supposed to return, but in the 
general case you should take a lot more precautions regarding which 
registers get clobbered when using sc.

Maybe it is worth a comment.

Christophe

>   }
