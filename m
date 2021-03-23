Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C18A345774
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 06:45:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4L19001Fz3bn2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 16:45:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4L0k4yxjz30LJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 16:44:38 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F4L0g1BgSz9ty3k;
 Tue, 23 Mar 2021 06:44:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id xbkvXfPDcdXX; Tue, 23 Mar 2021 06:44:35 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F4L0g02wbz9ty3M;
 Tue, 23 Mar 2021 06:44:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B43258B7AE;
 Tue, 23 Mar 2021 06:44:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id C10NKDQba7Ie; Tue, 23 Mar 2021 06:44:35 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3AFE38B75F;
 Tue, 23 Mar 2021 06:44:35 +0100 (CET)
Subject: Re: [PATCH] tools: testing: Remove duplicate include of sched.h
To: Wan Jiabing <wanjiabing@vivo.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Shuah Khan <shuah@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210323033413.284420-1-wanjiabing@vivo.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <218e9c09-e245-9565-a233-a210c49ae590@csgroup.eu>
Date: Tue, 23 Mar 2021 06:44:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323033413.284420-1-wanjiabing@vivo.com>
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
Cc: kael_w@yeah.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/03/2021 à 04:34, Wan Jiabing a écrit :
> sched.h has been included at line 33.
> So we remove the duplicate one at line 36.

Can you please send a single patch for all files in tools/testing/selftests/powerpc/

Thanks
Christophe

> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>   tools/testing/selftests/powerpc/mm/tlbie_test.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/powerpc/mm/tlbie_test.c b/tools/testing/selftests/powerpc/mm/tlbie_test.c
> index f85a0938ab25..48344a74b212 100644
> --- a/tools/testing/selftests/powerpc/mm/tlbie_test.c
> +++ b/tools/testing/selftests/powerpc/mm/tlbie_test.c
> @@ -33,7 +33,6 @@
>   #include <sched.h>
>   #include <time.h>
>   #include <stdarg.h>
> -#include <sched.h>
>   #include <pthread.h>
>   #include <signal.h>
>   #include <sys/prctl.h>
> 
