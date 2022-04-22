Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E81A50B3AE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Apr 2022 11:13:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kl7xM31PXz3bcZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Apr 2022 19:13:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Kluun7t1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kl7wk4vg3z2yp5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Apr 2022 19:12:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Kluun7t1; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Kl7wf0njlz4xXS;
 Fri, 22 Apr 2022 19:12:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1650618771;
 bh=TAQU4yACc/OpJ4CrlRCjZa4rq8YrRjfIqrgtYmrgmq8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Kluun7t1yUg109zhUX0NKdQDXUS57TjUMNfWa33hSC3kQoiszVF4V4VbMEt6kNQLS
 VMSD8Lv9ktUSJAoTylgu1kmx2DeejrCGR5Ov1ws0dHU/ggozuXn6xPUTp1BLvcogCN
 tSEj8ybnDEIRnhoQCSlCQ+utsfavEI6puFSK/x4C0xCJPfiYDwFLT4xvZ59M3SJpSv
 GI2foayEyAw1DN+7qMxZjjQPpwQ5PmVI99eUbiubs9X65wSHK4NXtTieLOjEaw5pss
 3lBgp0arVWxkjvR0IgWdhTMoPS6SUrCH4wmY/kfyFBJcoGKQcbwsHqXEysY4k9oBDH
 Z2Je52wsOeogA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Ingo Molnar <mingo@redhat.com>, Paul
 Mackerras <paulus@samba.org>, Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v1 06/22] powerpc/ftrace: Inline ftrace_modify_code()
In-Reply-To: <1650261933.e8kr43zvw0.naveen@linux.ibm.com>
References: <cover.1648131740.git.christophe.leroy@csgroup.eu>
 <3b651381f4c53988ede62f4a1505e7e8ccab56b4.1648131740.git.christophe.leroy@csgroup.eu>
 <1650261933.e8kr43zvw0.naveen@linux.ibm.com>
Date: Fri, 22 Apr 2022 19:12:44 +1000
Message-ID: <87wnfh8os3.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
> Christophe Leroy wrote:
>> Inlining ftrace_modify_code(), it increases a bit the
>> size of ftrace code but brings 5% improvment on ftrace
>> activation.
>> 
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>  arch/powerpc/kernel/trace/ftrace.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
>> index 41c45b9c7f39..98e82fa4980f 100644
>> --- a/arch/powerpc/kernel/trace/ftrace.c
>> +++ b/arch/powerpc/kernel/trace/ftrace.c
>> @@ -53,7 +53,7 @@ ftrace_call_replace(unsigned long ip, unsigned long addr, int link)
>>  	return op;
>>  }
>> 
>> -static int
>> +static inline int
>>  ftrace_modify_code(unsigned long ip, ppc_inst_t old, ppc_inst_t new)
>>  {
>>  	ppc_inst_t replaced;
>
> I thought gcc was free to inline functions without the need for 
> 'inline'.

Yes it is.

> On the flip side, don't we need __always_inline if we want to force 
> inlining?

Yes. Since ac7c3e4ff401 ("compiler: enable CONFIG_OPTIMIZE_INLINING forcibly").

cheers
