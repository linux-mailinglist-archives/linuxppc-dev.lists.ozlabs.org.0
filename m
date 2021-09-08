Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D64403320
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 05:53:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H47XM12csz2yNl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 13:53:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GLJfR0NM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=o451686892@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=GLJfR0NM; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H47Wf3b7rz2xgN
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Sep 2021 13:52:45 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id x19so893282pfu.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Sep 2021 20:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=WSt+UMhq7R7h5hSLb95oV8jytbQKlUJH1lEwRLVcxwc=;
 b=GLJfR0NMco+oS1HHyphViWc/H8Wf/bLjCDcmbtta6hyb801Md0ubjqPMWp6WdPvWq/
 /NuGfVD1j9+XuSUMOGQz/eTCVbohXJ+Qkv9I2QMqTdEHfklDHNcvxpVFOWfbJPymvNFD
 btC1KFw4ADbCa7XAeGte2pPkaEU5kZ7GcfmYZBMz4nJuY9zvGtKXL5+PeF7cVlAHFI2G
 +TP44OHlZU2UYl/1A7zxdCsPyN+6gq/V8DFaKk1ZAfOPXKPdX2/k8aXmhsfoLio/obd/
 fRBEBNg4S22eyDDVR3hvYvwYI6y0QYJteRexx8hn81tf7J0GoryM+zimw3uyq3VlSa06
 cc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=WSt+UMhq7R7h5hSLb95oV8jytbQKlUJH1lEwRLVcxwc=;
 b=AoieUOpAnNSt0gBeYWDlu9VL9aWSj8IrbQuA7ZY1066PT2xL465PWtuYGzdqkmlKie
 VWSjeA97Ke2Jzxnkac2wy3gj1m2KWDhr+aFml/+7+zkaZIeG8uR3DgBDyCkBQv3+U376
 IkgMdFLnkQ3gbRjueyw3zyMixiDW21BegXYxdHFq4DYTE8/43DYeFJaUzPL6ZSYFqVLD
 XiaQ/5/T/JTUAO92p2WfLr0I9Ftl9olajsVgNPt2xfVSlGO+/w0RDRQ3lpYTHdwPqnXa
 EtkxI++6NZdcByh8pQz/XVgGulsclFQFsh3XNFh9IoRWQY8YGqIzQm82ekq2fCeO2zUX
 Bn9g==
X-Gm-Message-State: AOAM530OpdSH6su2r3zNoZoh+LFj3cJ2w/pOQAVmhJAorEKE2vSzQQbx
 23MzlfpMlx5wDe/EG9ttDzc=
X-Google-Smtp-Source: ABdhPJzsF7/ZmS0a3POWsiDv6cT4l+YoAuvMs8kxVeVkGFJVzJ1fBZkDxrQQPMspQMKZVPXO7C92+Q==
X-Received: by 2002:a63:30d:: with SMTP id 13mr1668901pgd.289.1631073162944;
 Tue, 07 Sep 2021 20:52:42 -0700 (PDT)
Received: from [192.168.30.11] ([173.248.225.217])
 by smtp.gmail.com with ESMTPSA id p4sm647725pgc.15.2021.09.07.20.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 20:52:42 -0700 (PDT)
Subject: Re: [PATCH v3] ftrace: Cleanup ftrace_dyn_arch_init()
To: LEROY Christophe <christophe.leroy@csgroup.eu>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
References: <20210907100524.1454928-1-o451686892@gmail.com>
 <MRZP264MB298824D80E6C0ADCB5EA1D9AEDD39@MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM>
From: Weizhao Ouyang <o451686892@gmail.com>
Message-ID: <f33570e2-a67d-b0cf-f127-040ccd9e5da9@gmail.com>
Date: Wed, 8 Sep 2021 11:52:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <MRZP264MB298824D80E6C0ADCB5EA1D9AEDD39@MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM>
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
Cc: Rich Felker <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 "x86@kernel.org" <x86@kernel.org>, Russell King <linux@armlinux.org.uk>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Mackerras <paulus@samba.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks for reply.

On 2021/9/7 23:55, LEROY Christophe wrote:
>
>> -----Message d'origine-----
>> De : Linuxppc-dev <linuxppc-dev-
>> bounces+christophe.leroy=csgroup.eu@lists.ozlabs.org> De la part de Weizhao
>> Ouyang
>>
>> Most of ARCHs use empty ftrace_dyn_arch_init(), introduce a weak common
>> ftrace_dyn_arch_init() to cleanup them.
>>
>> Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
>> Acked-by: Heiko Carstens <hca@linux.ibm.com> (s390)
>> Acked-by: Helge Deller <deller@gmx.de> (parisc)
>>
>> ---
>> Changes in v3:
>> -- fix unrecognized opcode on PowerPC
>>
>> Changes in v2:
>> -- correct CONFIG_DYNAMIC_FTRACE on PowerPC
>> -- add Acked-by tag
>>
>> ---
>>  arch/arm/kernel/ftrace.c          | 5 -----
>>  arch/arm64/kernel/ftrace.c        | 5 -----
>>  arch/csky/kernel/ftrace.c         | 5 -----
>>  arch/ia64/kernel/ftrace.c         | 6 ------
>>  arch/microblaze/kernel/ftrace.c   | 5 -----
>>  arch/mips/include/asm/ftrace.h    | 2 ++
>>  arch/nds32/kernel/ftrace.c        | 5 -----
>>  arch/parisc/kernel/ftrace.c       | 5 -----
>>  arch/powerpc/include/asm/ftrace.h | 4 ++++
>>  arch/riscv/kernel/ftrace.c        | 5 -----
>>  arch/s390/kernel/ftrace.c         | 5 -----
>>  arch/sh/kernel/ftrace.c           | 5 -----
>>  arch/sparc/kernel/ftrace.c        | 5 -----
>>  arch/x86/kernel/ftrace.c          | 5 -----
>>  include/linux/ftrace.h            | 1 -
>>  kernel/trace/ftrace.c             | 5 +++++
>>  16 files changed, 11 insertions(+), 62 deletions(-)
>>
>> diff --git a/arch/mips/include/asm/ftrace.h b/arch/mips/include/asm/ftrace.h
>> index b463f2aa5a61..ed013e767390 100644
>> --- a/arch/mips/include/asm/ftrace.h
>> +++ b/arch/mips/include/asm/ftrace.h
>> @@ -76,6 +76,8 @@ do {                                                \
>>
>>
>>  #ifdef CONFIG_DYNAMIC_FTRACE
>> +int __init ftrace_dyn_arch_init(void);
>> +
> Why ?
>
>
>>  static inline unsigned long ftrace_call_adjust(unsigned long addr)
>>  {
>>       return addr;
>> diff --git a/arch/powerpc/include/asm/ftrace.h
>> b/arch/powerpc/include/asm/ftrace.h
>> index debe8c4f7062..b05c43f13a4d 100644
>> --- a/arch/powerpc/include/asm/ftrace.h
>> +++ b/arch/powerpc/include/asm/ftrace.h
>> @@ -126,6 +126,10 @@ static inline void this_cpu_enable_ftrace(void) { }
>>  static inline void this_cpu_set_ftrace_enabled(u8 ftrace_enabled) { }
>>  static inline u8 this_cpu_get_ftrace_enabled(void) { return 1; }
>>  #endif /* CONFIG_PPC64 */
>> +
>> +#ifdef CONFIG_DYNAMIC_FTRACE
>> +int __init ftrace_dyn_arch_init(void);
>> +#endif /* CONFIG_DYNAMIC_FTRACE */
> Why ?
>
>>  #endif /* !__ASSEMBLY__ */
>>
>>  #endif /* _ASM_POWERPC_FTRACE */
>> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
>> index 832e65f06754..f1eca123d89d 100644
>> --- a/include/linux/ftrace.h
>> +++ b/include/linux/ftrace.h
>> @@ -573,7 +573,6 @@ ftrace_set_early_filter(struct ftrace_ops *ops, char
>> *buf, int enable);
>>
>>  /* defined in arch */
>>  extern int ftrace_ip_converted(unsigned long ip);
>> -extern int ftrace_dyn_arch_init(void);
> Why removing that ?
>
> Have you tried to build kernel/trace/ftrace.o with C=2 ? It will likely tell you that the function is not declared and that it should be static

Yes I missed this check. Under the situation, the function should be static.

> We could eventually consider that in the past, this generic declaration was unrelevant because the definitions where in the arch specific sections.
> Now that you are implementing a generic weak version of this function, it would make sense to have a generic declaration as well.
>
> I really don't see the point in duplicating the declaration of the function in the arch specific headers.

I use declaration in arch specific headers in tend to clarify the arch has implement ftrace_dyn_arch_init().
Anyway, it maybe pointless, a generic declaration is enough. Will update it later.

>>  extern void ftrace_replace_code(int enable);
>>  extern int ftrace_update_ftrace_func(ftrace_func_t func);
>>  extern void ftrace_caller(void);
> Christophe
>
> CS Group - Document Interne
