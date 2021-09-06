Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0D0401D5A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Sep 2021 16:58:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H3BP529x1z2yn8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Sep 2021 00:58:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LXgp52W5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=o451686892@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=LXgp52W5; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H3BNJ3mYvz2xtN
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Sep 2021 00:58:07 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id d5so4471530pjx.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Sep 2021 07:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=e7Lxz1rTUMVMiOxDU3ihYWK5WPfaNeZ9K8ew2EFVN6M=;
 b=LXgp52W5k+6e+E1lD/+fnmwROVu0im0ZTbRaTGFRUHoee98niPkmedBSPuoaU+C901
 xA0zVCRtm3ZstMaY0r+bfrLwX0h4lJRwjHZSrSd7VMiiQmuNR4VJb4KIkfYgNr45+6R/
 Ytm3SgdnIw+8vdyNM7Qrbyc2ZfHYtokHyF9mvUbjZBpqaG9aV9hVDtVpCH7AesyMXvxe
 UqoY/NFf7dqJ+B2r0NE5QZJnHLwexfdT+iciJQG7/AjInHtDs1ZoecQ7oAJRB4rOv/f9
 sTenECUfv5Z+O8xZpmI3XfSxkSvYjZ+DMUZOgmuBqGpnmkHpr4lFbj1WgmAnvQDDLG1o
 HBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=e7Lxz1rTUMVMiOxDU3ihYWK5WPfaNeZ9K8ew2EFVN6M=;
 b=a1+a/I4UJIBsRhr6dQm0ceJy2ZbU25Qv9cgdCqIVuJ/M7hTOiwPFQW3Opox1h2eqkZ
 VnNIpGAgtjwtGeCsIX3l9tZ4jN54mmCGS3mY8wwlbqce/A3HK3/rEwxVUo3CG3RULTrh
 EiCylN08if8EnWAINqcubSAbei4c8lJMAzg+NnVyvaQZEYLjzKwaqjnqDS9CwQPup+Lw
 ceSK9tYfAiAy+dOYFUkaq+sKhDQg5ct0WjiEJpe+yBX2FGBTJC68SDdP+JW7Mok8pyiS
 3uPI+x5Wp+9Ppnrw2d/5vRbqgHPzfBWMges2aUreFUpx/K8BMRHjgkUrpxiA2ZeMRdUj
 w6Bg==
X-Gm-Message-State: AOAM533LYCImIZ7orDXQPGbRHiuAHeKZInIgKyeVrirANqndgf93G1Fm
 11THMSLjP0zZkEO6OQTIKSI=
X-Google-Smtp-Source: ABdhPJx4U2UXdqmjv3wFeCTa6pX3ETSedWET7Gxlb8aTpJkm1WYcBE+shFcj4K1cKKYWsG7A6RIebw==
X-Received: by 2002:a17:902:8648:b029:129:dda4:ddc2 with SMTP id
 y8-20020a1709028648b0290129dda4ddc2mr11168934plt.4.1630940282178; 
 Mon, 06 Sep 2021 07:58:02 -0700 (PDT)
Received: from owniadeMacBook-Pro.local ([8.21.11.90])
 by smtp.gmail.com with ESMTPSA id p3sm7607183pfw.71.2021.09.06.07.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 07:58:01 -0700 (PDT)
Subject: Re: [PATCH v2] ftrace: Cleanup ftrace_dyn_arch_init()
To: Michael Ellerman <mpe@ellerman.id.au>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
References: <20210906111626.1259867-1-o451686892@gmail.com>
 <87v93dn5qh.fsf@mpe.ellerman.id.au>
From: Weizhao Ouyang <o451686892@gmail.com>
Message-ID: <87b80cd6-f20f-a673-f438-faff5d7d4334@gmail.com>
Date: Mon, 6 Sep 2021 22:57:53 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87v93dn5qh.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Nick Hu <nickhu@andestech.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2021/9/6 22:22, Michael Ellerman wrote:
> Weizhao Ouyang <o451686892@gmail.com> writes:
>> Most of ARCHs use empty ftrace_dyn_arch_init(), introduce a weak common
>> ftrace_dyn_arch_init() to cleanup them.
>>
>> Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
>> Acked-by: Heiko Carstens <hca@linux.ibm.com> (s390)
>>
>> ---
>>
>> Changes in v2:
>> -- correct CONFIG_DYNAMIC_FTRACE on PowerPC
>> -- add Acked-by tag
>> diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
>> index debe8c4f7062..d59f67c0225f 100644
>> --- a/arch/powerpc/include/asm/ftrace.h
>> +++ b/arch/powerpc/include/asm/ftrace.h
>> @@ -61,6 +61,10 @@ struct dyn_arch_ftrace {
>>  };
>>  #endif /* __ASSEMBLY__ */
>>  
>> +#ifdef CONFIG_DYNAMIC_FTRACE
>> +int __init ftrace_dyn_arch_init(void);
>> +#endif /* CONFIG_DYNAMIC_FTRACE */
>> +
>>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
>>  #define ARCH_SUPPORTS_FTRACE_OPS 1
>>  #endif
> That breaks the build for powerpc:
>
>   /linux/arch/powerpc/include/asm/ftrace.h: Assembler messages:
>   /linux/arch/powerpc/include/asm/ftrace.h:65: Error: unrecognized opcode: `int'
>   make[4]: *** [/linux/scripts/Makefile.build:352: arch/powerpc/kernel/trace/ftrace_64.o] Error 1
>   make[3]: *** [/linux/scripts/Makefile.build:514: arch/powerpc/kernel/trace] Error 2
>   make[2]: *** [/linux/scripts/Makefile.build:514: arch/powerpc/kernel] Error 2
>   make[1]: *** [/linux/Makefile:1861: arch/powerpc] Error 2
>   make[1]: *** Waiting for unfinished jobs....
>
> It needs to be inside an #ifndef __ASSEMBLY__ section.
>
> cheers

Thanks for reply, I'll fix it up.
