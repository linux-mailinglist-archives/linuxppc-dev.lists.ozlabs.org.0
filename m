Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C0B108637
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 02:14:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Lpw310HfzDqbp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 12:14:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="fdiVaXFm"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Lpsj0FV6zDqZq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 12:12:07 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id e17so6275477pgd.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Nov 2019 17:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=fUxnjYVvwcgXB0p2/65XHwblJekP3byuP5LlZ092IOo=;
 b=fdiVaXFm4SFErN5LBs46ss2lcb9UcioTJsOpP5jwXMHthSV7SwNTKDK8vkJsUL9o9u
 fWrrOBOXE5fVoh3eSUi8pYXMcfOu57mpkE5xiuC6+wlLC/MjRaqPMC/2ftb4A5Aul0pP
 qGJpzO/giydCspj4CX9k4ULtYJO0Jz2XWFiPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=fUxnjYVvwcgXB0p2/65XHwblJekP3byuP5LlZ092IOo=;
 b=rP0xgaFo7OJeAs0rqfLh/TuWWcbZdkBp0/LM9xSQ6aovcsPoUcIiy4hVj7sy3mheS2
 0LpMZYshEQyznfuxxsLNC07zcORK9BM1g+dSRtyBflfQaZbnLKv/H7VyTtNopEivBzpX
 n05lXaRZFQHAOk3rYca5ouLcx6Z8b5qwaR8xvVSdyKntG28gDGe6xBID0VwhU2CtUV5y
 AViCun42LeboWtYSLPbRGGVc1lhJNHHmO0EHYY2RBn7Z07dD+FvomI70bBfwDAhKFz4c
 jTYIeSw9zob26l+GUftcWUGWIaJtmprhmUKpcIe4zHjCoqKMs8oUxDzwbcfnKEfPOpbq
 Ln5Q==
X-Gm-Message-State: APjAAAUsEj/85l0UsPvwSF0YxSF2v0jh3W0jBuOrh81afbr54lCRS8M3
 1hgtWsY98NCnRpSHE5jzbgZBEjlwwNA=
X-Google-Smtp-Source: APXvYqwOMDDms24hepE4EzFIffoon4ml+adRTnU609UHYVCG2sJO86Xhzmv9lBcNYl6lxghjJSjUzw==
X-Received: by 2002:a63:e60e:: with SMTP id g14mr29153291pgh.80.1574644325696; 
 Sun, 24 Nov 2019 17:12:05 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-c5e4-a8fb-2787-cd48.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:c5e4:a8fb:2787:cd48])
 by smtp.gmail.com with ESMTPSA id u9sm5692040pfm.102.2019.11.24.17.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Nov 2019 17:12:04 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Michael Ellerman <mpe@ellerman.id.au>, Bart Van Assche <bvanassche@acm.org>,
 Qian Cai <cai@lca.pw>
Subject: Re: lockdep warning while booting POWER9 PowerNV
In-Reply-To: <87ef0vpfbc.fsf@mpe.ellerman.id.au>
References: <1567199630.5576.39.camel@lca.pw>
 <9b8b287a-4ae1-ca9b-cff1-6d93672b6893@acm.org>
 <87ef0vpfbc.fsf@mpe.ellerman.id.au>
Date: Mon, 25 Nov 2019 12:12:01 +1100
Message-ID: <87v9r8g3oe.fsf@dja-thinkpad.axtens.net>
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
Cc: Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

>>> Once in a while, booting an IBM POWER9 PowerNV system (8335-GTH) would generate
>>> a warning in lockdep_register_key() at,
>>> 
>>> if (WARN_ON_ONCE(static_obj(key)))
>>> 
>>> because
>>> 
>>> key = 0xc0000000019ad118
>>> &_stext = 0xc000000000000000
>>> &_end = 0xc0000000049d0000
>>> 
>>> i.e., it will cause static_obj() returns 1.
>>
>> (back from a trip)
>>
>> Hi Qian,
>>
>> Does this mean that on POWER9 it can happen that a dynamically allocated 
>> object has an address that falls between &_stext and &_end?
>
> I thought that was true on all arches due to initmem, but seems not.
>
> I guess we have the same problem as s390 and we need to define
> arch_is_kernel_initmem_freed().
>
> Qian, can you try this:
>
> diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
> index 4a1664a8658d..616b1b7b7e52 100644
> --- a/arch/powerpc/include/asm/sections.h
> +++ b/arch/powerpc/include/asm/sections.h
> @@ -5,8 +5,22 @@
>  
>  #include <linux/elf.h>
>  #include <linux/uaccess.h>
> +
> +#define arch_is_kernel_initmem_freed arch_is_kernel_initmem_freed
> +
>  #include <asm-generic/sections.h>
>  
> +extern bool init_mem_is_free;
> +
> +static inline int arch_is_kernel_initmem_freed(unsigned long addr)
> +{
> +	if (!init_mem_is_free)
> +		return 0;
> +
> +	return addr >= (unsigned long)__init_begin &&
> +		addr < (unsigned long)__init_end;
> +}
> +
>  extern char __head_end[];
>  
>  #ifdef __powerpc64__
>

This also fixes the following syzkaller bug:
https://syzkaller-ppc64.appspot.com/bug?id=cfdf75cd985012d0124cd41e6fa095d33e7d0f6b
https://github.com/linuxppc/issues/issues/284

Would you like me to do up a nice commit message for it?

Regards,
Daniel

>
> cheers
