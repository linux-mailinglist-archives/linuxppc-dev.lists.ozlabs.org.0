Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C95716FF43
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 13:48:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SFwl6XhTzDqZC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 23:48:55 +1100 (AEDT)
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
 header.s=mail header.b=EBCfj8g9; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SDxh5hHszDqcK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 23:04:40 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48SDxc4p9rz9txW1;
 Wed, 26 Feb 2020 13:04:36 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=EBCfj8g9; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id nDphmj0PYDWa; Wed, 26 Feb 2020 13:04:36 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48SDxc3Y7cz9txVB;
 Wed, 26 Feb 2020 13:04:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582718676; bh=iBDRtJqj8+RLwsXxk1q4sBZWsYibq9STHtiaZIrsCtU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=EBCfj8g9ufMcIT4ZxPebcV0g3e6XcAaolPUUeOeqW/yxxKiLGcaPVw6IpPU/+y6cf
 cJ9JdkH/qMfJG05Fcc9il87lfraXy3f97IX2TpXyIBUZr/UNsqHjBs7QZapc4DjLwe
 rM9XWNOIIUuw+J097cF6p21X6CBD94jw8TyES8Ks=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BCF8D8B844;
 Wed, 26 Feb 2020 13:04:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id n5azio8iaWTP; Wed, 26 Feb 2020 13:04:37 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F2C3D8B776;
 Wed, 26 Feb 2020 13:04:36 +0100 (CET)
Subject: Re: [RFC PATCH v2 04/12] powerpc/ptrace: split out VSX related
 functions.
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, mikey@neuling.org
References: <cover.1561735587.git.christophe.leroy@c-s.fr>
 <920fe735d5f3dd882331b36a895bb756bd415fe7.1561735587.git.christophe.leroy@c-s.fr>
 <875zfw1cmo.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <34ecb581-d7e7-c5f3-8f5e-9de91e435cea@c-s.fr>
Date: Wed, 26 Feb 2020 13:04:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <875zfw1cmo.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/02/2020 à 11:51, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> diff --git a/arch/powerpc/kernel/ptrace/ptrace-novsx.c b/arch/powerpc/kernel/ptrace/ptrace-novsx.c
>> new file mode 100644
>> index 000000000000..55fbbb4aa9d7
>> --- /dev/null
>> +++ b/arch/powerpc/kernel/ptrace/ptrace-novsx.c
>> @@ -0,0 +1,83 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/sched.h>
>> +#include <linux/mm.h>
>> +#include <linux/smp.h>
>> +#include <linux/errno.h>
>> +#include <linux/ptrace.h>
>> +#include <linux/regset.h>
>> +#include <linux/tracehook.h>
>> +#include <linux/elf.h>
>> +#include <linux/user.h>
>> +#include <linux/security.h>
>> +#include <linux/signal.h>
>> +#include <linux/seccomp.h>
>> +#include <linux/audit.h>
>> +#include <trace/syscall.h>
>> +#include <linux/hw_breakpoint.h>
>> +#include <linux/perf_event.h>
>> +#include <linux/context_tracking.h>
>> +#include <linux/nospec.h>
>> +
>> +#include <linux/uaccess.h>
>> +#include <linux/pkeys.h>
>> +#include <asm/page.h>
>> +#include <asm/pgtable.h>
>> +#include <asm/switch_to.h>
>> +#include <asm/tm.h>
>> +#include <asm/asm-prototypes.h>
>> +#include <asm/debug.h>
>> +#include <asm/hw_breakpoint.h>
> 
> I suspect we probably don't need all those headers anymore. But I guess
> we'll clean them up in future, as it's very tedious work to trim the list.

Ok, I did it.

> 
>> +
>> +#include <kernel/ptrace/ptrace-decl.h>
> 
> It's preferable to use:
> 
> #include "ptrace-decl.h"
> 

Ok, done.

Christophe
