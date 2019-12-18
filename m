Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABC5124934
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 15:13:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dH6k00jzzDqcD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 01:13:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="oWvc6zF1"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dH4Y45wgzDqYJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 01:11:41 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id p27so1021621pli.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 06:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=5OhHylg1TPaS47GWjrsnP2qwXLa5vXD4hGq2zAGcEfs=;
 b=oWvc6zF1ihRDNoGErmk2HnXeDznlrEO1N1u9jrY/Z/Uy46t0B1ppRJYfWJv8QXE7db
 xo6XAY7i+TLMKj3BeG0h4t7lr5ER9a15uQe5vSqlT8SDammaArDjUOJFP2GmMZ9gqnzF
 z+vOvB/gZxxe8Vtknz6bbmlOklifvUV3vBmuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=5OhHylg1TPaS47GWjrsnP2qwXLa5vXD4hGq2zAGcEfs=;
 b=m0HBQHwY+4BffBpYxe+ORqFVNTVAUfy3y0PoTYNI2ji3wiX+6ccol2Cmx/gtZ4G7eI
 qQxwLlGu7ehujgkXPtZ9uCoSGUUFCK9eFIECfIOkmn82heyd7roXKKr9mM/6qaE6S0pr
 vgxqeesEN6oo6SUnlK7/xGnfw1N88WUu8X9jhzSMS22wMsxfbf9bTsHo5rMOJ5XLK5M2
 PQsiRl5R7NI2DZkniojW4LqFT7V24V6TZ7JeSmjGYGUT7pQ7wkbGuDZGdq7/a7CZ2+Jz
 geJCc69u0TFPCTDeEMS01j27KVfJGWHOCdwKUMZoyQoicnx9HPBUeZl/RCkB2cb8K9Ja
 Mzig==
X-Gm-Message-State: APjAAAVJ8itCwkC/W9IPV2rY19lxTFQpUnmSB089xBeolwyx5A7lTKkk
 VmltBmAkgWnQzVJMTsNywzWvQw==
X-Google-Smtp-Source: APXvYqwukeiV0v6+KS+yMuVFNifu19LOoW/2ya5bfEU+3And/oSH6XBzRlEKXUHlILALMTatf4LyKw==
X-Received: by 2002:a17:90a:8545:: with SMTP id a5mr2994553pjw.3.1576678297757; 
 Wed, 18 Dec 2019 06:11:37 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-a084-b324-40b3-453d.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:a084:b324:40b3:453d])
 by smtp.gmail.com with ESMTPSA id r3sm3538735pfg.145.2019.12.18.06.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 06:11:36 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 18/18] powerpc/fault: Use analyse_instr() to check for
 store with updates to sp
In-Reply-To: <20191126052141.28009-19-jniethe5@gmail.com>
References: <20191126052141.28009-1-jniethe5@gmail.com>
 <20191126052141.28009-19-jniethe5@gmail.com>
Date: Thu, 19 Dec 2019 01:11:33 +1100
Message-ID: <87immdu3je.fsf@dja-thinkpad.axtens.net>
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
Cc: alistair@popple.id.au, Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe <jniethe5@gmail.com> writes:

> A user-mode access to an address a long way below the stack pointer is
> only valid if the instruction is one that would update the stack pointer
> to the address accessed. This is checked by directly looking at the
> instructions op-code. As a result is does not take into account prefixed
> instructions. Instead of looking at the instruction our self, use
> analyse_instr() determine if this a store instruction that will update
> the stack pointer.
>
> Something to note is that there currently are not any store with update
> prefixed instructions. Actually there is no plan for prefixed
> update-form loads and stores. So this patch is probably not needed but
> it might be preferable to use analyse_instr() rather than open coding
> the test anyway.

Yes please. I was looking through this code recently and was
horrified. This improves things a lot and I think is justification
enough as-is.

Regards,
Daniel
>
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>  arch/powerpc/mm/fault.c | 39 +++++++++++----------------------------
>  1 file changed, 11 insertions(+), 28 deletions(-)
>
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index b5047f9b5dec..cb78b3ca1800 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -41,37 +41,17 @@
>  #include <asm/siginfo.h>
>  #include <asm/debug.h>
>  #include <asm/kup.h>
> +#include <asm/sstep.h>
>  
>  /*
>   * Check whether the instruction inst is a store using
>   * an update addressing form which will update r1.
>   */
> -static bool store_updates_sp(unsigned int inst)
> +static bool store_updates_sp(struct instruction_op *op)
>  {
> -	/* check for 1 in the rA field */
> -	if (((inst >> 16) & 0x1f) != 1)
> -		return false;
> -	/* check major opcode */
> -	switch (inst >> 26) {
> -	case OP_STWU:
> -	case OP_STBU:
> -	case OP_STHU:
> -	case OP_STFSU:
> -	case OP_STFDU:
> -		return true;
> -	case OP_STD:	/* std or stdu */
> -		return (inst & 3) == 1;
> -	case OP_31:
> -		/* check minor opcode */
> -		switch ((inst >> 1) & 0x3ff) {
> -		case OP_31_XOP_STDUX:
> -		case OP_31_XOP_STWUX:
> -		case OP_31_XOP_STBUX:
> -		case OP_31_XOP_STHUX:
> -		case OP_31_XOP_STFSUX:
> -		case OP_31_XOP_STFDUX:
> +	if (GETTYPE(op->type) == STORE) {
> +		if ((op->type & UPDATE) && (op->update_reg == 1))
>  			return true;
> -		}
>  	}
>  	return false;
>  }
> @@ -278,14 +258,17 @@ static bool bad_stack_expansion(struct pt_regs *regs, unsigned long address,
>  
>  		if ((flags & FAULT_FLAG_WRITE) && (flags & FAULT_FLAG_USER) &&
>  		    access_ok(nip, sizeof(*nip))) {
> -			unsigned int inst;
> +			unsigned int inst, sufx;
> +			struct instruction_op op;
>  			int res;
>  
>  			pagefault_disable();
> -			res = __get_user_inatomic(inst, nip);
> +			res = __get_user_instr_inatomic(inst, sufx, nip);
>  			pagefault_enable();
> -			if (!res)
> -				return !store_updates_sp(inst);
> +			if (!res) {
> +				analyse_instr(&op, uregs, inst, sufx);
> +				return !store_updates_sp(&op);
> +			}
>  			*must_retry = true;
>  		}
>  		return true;
> -- 
> 2.20.1
