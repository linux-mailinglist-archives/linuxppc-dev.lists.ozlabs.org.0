Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C5218B9CD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 15:54:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jqgx6Ps8zDrNX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 01:54:53 +1100 (AEDT)
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
 header.s=mail header.b=witbiSuG; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jpqS5pxmzDqlR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 01:16:18 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48jpqJ4Zdnz9tym3;
 Thu, 19 Mar 2020 15:16:12 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=witbiSuG; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id XbCRxJPuXQ5k; Thu, 19 Mar 2020 15:16:12 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48jpqJ3MwQz9tylr;
 Thu, 19 Mar 2020 15:16:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584627372; bh=Pc3Zp6RcNRELIbFsuWJ1AM6GLwe8PYn9FEq9uPAl95M=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=witbiSuGtUsf6/uaua7yWVXOJbS3K3s19LwHJ9JIEjG9TYox//Q7derm/lVzUouGS
 Yj5gNuPEDsHe4FAQ33BTrYgOIiMAQWh8jIxC6TB4BwetAJcGyeRe4Hc9Vwhw0JNKKM
 Lxkmnh5GtFZhaVpmwNzVGksZvvkXH/Wd8I9w4JSg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6F38F8B84D;
 Thu, 19 Mar 2020 15:16:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ukh2860n-fLR; Thu, 19 Mar 2020 15:16:13 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CFEF08B850;
 Thu, 19 Mar 2020 15:16:10 +0100 (CET)
Subject: Re: [PATCH v11 4/8] powerpc/perf: consolidate valid_user_sp
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Michal Suchanek <msuchanek@suse.de>
References: <cover.1584613649.git.msuchanek@suse.de>
 <1b612025371bb9f2bcce72c700c809ae29e57392.1584613649.git.msuchanek@suse.de>
 <CAHp75VcMkPeJ6exroipnxvf-7g-C8QbVm0bAnp=rk505_nxySw@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <8775f299-be1b-3457-c59d-e4f61d8223e5@c-s.fr>
Date: Thu, 19 Mar 2020 15:16:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcMkPeJ6exroipnxvf-7g-C8QbVm0bAnp=rk505_nxySw@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Gustavo Luiz Duarte <gustavold@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Jiri Olsa <jolsa@redhat.com>,
 Rob Herring <robh@kernel.org>, Michael Neuling <mikey@neuling.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 "linux-fsdevel @ vger . kernel . org --in-reply-to="
 <20200225173541.1549955-1-npiggin@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jordan Niethe <jniethe5@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicholas Piggin <npiggin@gmail.com>, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Eric Richter <erichte@linux.ibm.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/03/2020 à 14:35, Andy Shevchenko a écrit :
> On Thu, Mar 19, 2020 at 1:54 PM Michal Suchanek <msuchanek@suse.de> wrote:
>>
>> Merge the 32bit and 64bit version.
>>
>> Halve the check constants on 32bit.
>>
>> Use STACK_TOP since it is defined.
>>
>> Passing is_64 is now redundant since is_32bit_task() is used to
>> determine which callchain variant should be used. Use STACK_TOP and
>> is_32bit_task() directly.
>>
>> This removes a page from the valid 32bit area on 64bit:
>>   #define TASK_SIZE_USER32 (0x0000000100000000UL - (1 * PAGE_SIZE))
>>   #define STACK_TOP_USER32 TASK_SIZE_USER32
> 
> ...
> 
>> +static inline int valid_user_sp(unsigned long sp)
>> +{
>> +       bool is_64 = !is_32bit_task();
>> +
>> +       if (!sp || (sp & (is_64 ? 7 : 3)) || sp > STACK_TOP - (is_64 ? 32 : 16))
>> +               return 0;
>> +       return 1;
>> +}
> 
> Perhaps better to read
> 
>    if (!sp)
>      return 0;
> 
>    if (is_32bit_task()) {
>      if (sp & 0x03)
>        return 0;
>      if (sp > STACK_TOP - 16)
>        return 0;
>    } else {
>      ...
>    }
> 
>    return 1;
> 
> Other possibility:

I prefer this one.

> 
>    unsigned long align = is_32bit_task() ? 3 : 7;

I would call it mask instead of align

>    unsigned long top = STACK_TOP - (is_32bit_task() ? 16 : 32);
> 
>    return !(!sp || (sp & align) || sp > top);
> 

Christophe
