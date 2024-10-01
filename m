Return-Path: <linuxppc-dev+bounces-1708-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7030598BBCD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2024 14:08:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHxY7615Fz2xJ5;
	Tue,  1 Oct 2024 22:08:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727784507;
	cv=none; b=CjpqsGOA+ZVE28rHDWWQA5B2dT95qxr3iAOgdG2/8QnBVu1Z550BEeJeOJRlWiJZwdJUIMBJFtVMUxem278WxDOvETu/IUz39LlMbCoxp2AvAQpWmxDCBVxmTj0LQcv2RZN63muuuQpVgUw50Hm7UVewesICTcwJM18MnLAyqEup4KPwgMOzMmYZQ3rZ8RM+DbylzWsuApRwt8jqGDKqA0mLol6g8VErmmJjJ4pcbj0h1RoSyW8Exz+Rj85cmde+0YyuQXR6+0E55tME24vDDeDb8L1Z6AV1D5XlxZjiw6vF2VUMaJ1FeWqXZzf3P4l3qP5JgrDqE4OkMerMQYRWCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727784507; c=relaxed/relaxed;
	bh=yhzEjbqjVc5TXkw6reHCEZ+/p2ZVIXM1UnzJdTwXkcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JJ2XANmMFNolbAMVNwRkJ/L1r5v1GIBZJ/QUMjWt9+V/n567h+g6xS6/93vuE6P8VUupeL4uaqc7oDpEgR/sR6zHjtTzya62KnILBlGwK6LzxdHk0YzrkBixj2j1hVvV8V313neFPS2Ad/QR14v3UkoIlSkDY7WGFYIjjp0FBOwXGIntmKaviEUuN7lD6D9mWAxPboMRuFdbuy1cgN1puPljT5y3D36BJh638C2nSj/5qkHHUgC/yS70q6LwvPiVajyxRQDDt4rTHa09Ib4CzLsmSHok02tIB1w+8F6e6GenbwV2YOegCLhjOt4Z23n3YvkjLEp+J+IbRWixx/X4CQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHxY659qgz2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2024 22:08:25 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XHxXz5KvCz9sRk;
	Tue,  1 Oct 2024 14:08:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CpCsvAqWB3yv; Tue,  1 Oct 2024 14:08:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XHxXz4XmTz9sPd;
	Tue,  1 Oct 2024 14:08:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 87E3E8B770;
	Tue,  1 Oct 2024 14:08:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id CYV2A-JBknUu; Tue,  1 Oct 2024 14:08:19 +0200 (CEST)
Received: from [192.168.232.216] (unknown [192.168.232.216])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2A15B8B766;
	Tue,  1 Oct 2024 14:08:19 +0200 (CEST)
Message-ID: <8e6c75db-5c98-4f82-8151-5f86c53f4cf2@csgroup.eu>
Date: Tue, 1 Oct 2024 14:08:18 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] powerpc/sstep: Unexport analyze_instr,
 emulate_vsx_load, emulate_vsx_store
To: Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Paul Mackerras <paulus@ozlabs.org>, linux-kernel@vger.kernel.org
References: <8ecdbd907a8a92cbf9c7308df13f9d19f5ba5621.1727777273.git.msuchanek@suse.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <8ecdbd907a8a92cbf9c7308df13f9d19f5ba5621.1727777273.git.msuchanek@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 01/10/2024 à 12:08, Michal Suchanek a écrit :
> There is no modular user of analyze_instr, and the latter two are only
> used by sstep itself.

analyze_instr() is used in arch/powerpc/kvm/emulate_loadstore.c which 
can be a module as far as I can see in Makefile:

common-objs-y += powerpc.o emulate_loadstore.o

kvm-book3s_64-module-objs := \
	$(common-objs-y) \
	book3s.o \
	book3s_rtas.o \
	$(kvm-book3s_64-objs-y)

kvm-objs-$(CONFIG_KVM_BOOK3S_64) := $(kvm-book3s_64-module-objs)

config KVM_BOOK3S_64
	tristate "KVM support for PowerPC book3s_64 processors"


> 
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
>   arch/powerpc/lib/sstep.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index e65f3fb68d06..a0557b0d9a24 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -863,7 +863,6 @@ void emulate_vsx_load(struct instruction_op *op, union vsx_reg *reg,
>   		break;
>   	}
>   }
> -EXPORT_SYMBOL_GPL(emulate_vsx_load);
>   NOKPROBE_SYMBOL(emulate_vsx_load);
>   
>   void emulate_vsx_store(struct instruction_op *op, const union vsx_reg *reg,
> @@ -955,7 +954,6 @@ void emulate_vsx_store(struct instruction_op *op, const union vsx_reg *reg,
>   		break;
>   	}
>   }
> -EXPORT_SYMBOL_GPL(emulate_vsx_store);
>   NOKPROBE_SYMBOL(emulate_vsx_store);
>   
>   static nokprobe_inline int do_vsx_load(struct instruction_op *op,
> @@ -3172,7 +3170,6 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>   	op->val = SRR1_PROGTRAP;
>   	return 0;
>   }
> -EXPORT_SYMBOL_GPL(analyse_instr);
>   NOKPROBE_SYMBOL(analyse_instr);
>   
>   /*

