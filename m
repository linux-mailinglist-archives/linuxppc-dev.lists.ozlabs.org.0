Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0514A35F957
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 19:02:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FL80j6yx4z3c31
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 03:02:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FL80N4Jyjz2yRR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 03:02:12 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FL80J09CXzB09ZG;
 Wed, 14 Apr 2021 19:02:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id xPWafQU7SZFF; Wed, 14 Apr 2021 19:02:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FL80H4r9FzB09ZC;
 Wed, 14 Apr 2021 19:02:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 500948B7D0;
 Wed, 14 Apr 2021 19:02:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6Ef4GAIzEXxj; Wed, 14 Apr 2021 19:02:09 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7B6468B7C4;
 Wed, 14 Apr 2021 19:02:08 +0200 (CEST)
Subject: Re: [PATCH v2 0/5] powerpc/rtas: miscellaneous cleanups
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210408140630.205502-1-nathanl@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <231da5db-efdd-0ddd-9ad8-4ddd2bc03ddf@csgroup.eu>
Date: Wed, 14 Apr 2021 19:02:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210408140630.205502-1-nathanl@linux.ibm.com>
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, aik@ozlabs.ru,
 aneesh.kumar@linux.ibm.com, npiggin@gmail.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 08/04/2021 à 16:06, Nathan Lynch a écrit :
> This is a reroll of the series posted here:
> https://lore.kernel.org/linuxppc-dev/20210114220004.1138993-1-nathanl@linux.ibm.com/
> 
> Originally this work was prompted by failures on radix MMU PowerVM
> guests when passing buffers to RTAS that lay outside of its idea of
> the RMA. In v1 I approached this as a problem to be solved in Linux,
> but RTAS development has since decided to change their code so that
> the RMA restriction does not apply with radix.
> 
> So in v2 I retain the cleanups and discard the more significant change
> which accommodated the misbehaving RTAS versions.

Is there a link with https://github.com/linuxppc/issues/issues/252 ?

> 
> Changes since v1:
> - Correct missing conversion of RTAS_RMOBUF_MAX ->
>    RTAS_USER_REGION_SIZE in in_rmo_buf().
> - Remove unnecessary braces in rtas_syscall_filter_init().
> - Leave expression of RTAS_WORK_AREA_SIZE as-is instead of changing
>    the factors in a confusing way, per discussion with Alexey.
> - Drop "powerpc/rtas: constrain user region allocation to RMA"
> 
> Nathan Lynch (5):
>    powerpc/rtas: improve ppc_rtas_rmo_buf_show documentation
>    powerpc/rtas-proc: remove unused RMO_READ_BUF_MAX
>    powerpc/rtas: remove ibm_suspend_me_token
>    powerpc/rtas: move syscall filter setup into separate function
>    powerpc/rtas: rename RTAS_RMOBUF_MAX to RTAS_USER_REGION_SIZE
> 
>   arch/powerpc/include/asm/rtas.h |  6 +++---
>   arch/powerpc/kernel/rtas-proc.c | 15 +++++++++++----
>   arch/powerpc/kernel/rtas.c      | 34 +++++++++++++++++----------------
>   3 files changed, 32 insertions(+), 23 deletions(-)
> 
