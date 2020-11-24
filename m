Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 462D32C2364
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 11:58:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgLc727VdzDqDd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 21:58:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=SSOV3AHK; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgLYy2tkbzDqQG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 21:56:48 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id e8so6227684pfh.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 02:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ho+OU1gWIbxlU6vkFFYhPItLBY/4CgC1Ux1l0SznRAg=;
 b=SSOV3AHKcYwB6+VVY1RKwf3eonAoK6VB7pgCtKHR8LD3fRuhXLehOkIUQSnbQIDI4/
 p3q0lllVhyARw/nFniVJuSZDSA1nyuupwNNDJFfBpDHPMhOE1FaqJl/r4F+EjejdwGh6
 JcTYJjpYmkK5vvITW2a+tZh4AjKcXiOtBFjVSdkurRhJSjv91DLg2qu+cCdrKbmCH2ek
 XlPQWnIeN1dG8UEFO7U6FU5ocZw0syYsyS7a7xM2lRPAMw13hOx8/vzLXyLbY8/o4EiN
 9GUnx1vWcyBeLGNll61sm78qt98gQpFgpeGDJx/kqBx4w5ovOS0zJDPQfVVMkvsWOSLZ
 1UcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ho+OU1gWIbxlU6vkFFYhPItLBY/4CgC1Ux1l0SznRAg=;
 b=XAdfHBQO7FrFdKGhCyewfImWGZdfGdlyKFPfZ+zaSsnUXtZjUHo5dv24lXEybhhn51
 84hnHcwyVbAUH6OiOYcbVgsxwNksO4EcImmIIUYXP8DT13Hc+6E2Oxbhhj2GQSzb+uYz
 ggViw4HCrDHKUotU1Y+yNTZcxYw60UyTbrbgQxjExfQXFMTexGP40C3OI0HpzO3rehCc
 PZNzjb59oav66Fc/xKx18YrhMAUobgoKoMl0rEUR+hwC09EVnd8jaHVVNnGj7r4RMtFZ
 XOVpE9r5JFXHcIu7s7moewsD1dNata0JfEzlXkvdbtRzyi6W44qqa31waJc2NBTuijv2
 zGPQ==
X-Gm-Message-State: AOAM530z44HHat447cT9bKO/FwLtqI/nN4WNfI+kqZhjJQ5/9mIx0LiD
 CGJi477HMWlv78EWHqzh0o0v2Rxo6nEEqQ==
X-Google-Smtp-Source: ABdhPJx7aupXyGjbsXOlPp/GgIVXYWhXASJLws7GvUy6w0exJM/+0lrVY6h+M0ix3HjuU4jTiROcvg==
X-Received: by 2002:a17:90b:4398:: with SMTP id
 in24mr4069757pjb.188.1606215404113; 
 Tue, 24 Nov 2020 02:56:44 -0800 (PST)
Received: from [0.0.0.0] (124-171-134-245.dyn.iinet.net.au. [124.171.134.245])
 by smtp.gmail.com with UTF8SMTPSA id
 j10sm1087588pji.29.2020.11.24.02.56.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 02:56:43 -0800 (PST)
Subject: Re: [PATCH kernel v4 2/8] genirq/irqdomain: Clean legacy IRQ
 allocation
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20201124061720.86766-1-aik@ozlabs.ru>
 <20201124061720.86766-3-aik@ozlabs.ru>
 <CAHp75VfV4mG23C9Ep1vNLk2oBjB=LTQGyU=fhWPhw4PX-Ci-7A@mail.gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <38b803db-2d67-dfa0-7e7b-e4ce816576ad@ozlabs.ru>
Date: Tue, 24 Nov 2020 21:56:36 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:84.0) Gecko/20100101
 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfV4mG23C9Ep1vNLk2oBjB=LTQGyU=fhWPhw4PX-Ci-7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Marc Zyngier <maz@kernel.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Oliver O'Halloran <oohall@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/24/20 8:19 PM, Andy Shevchenko wrote:
> On Tue, Nov 24, 2020 at 8:20 AM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>
>> There are 10 users of __irq_domain_alloc_irqs() and only one - IOAPIC -
>> passes realloc==true. There is no obvious reason for handling this
>> specific case in the generic code.
>>
>> This splits out __irq_domain_alloc_irqs_data() to make it clear what
>> IOAPIC does and makes __irq_domain_alloc_irqs() cleaner.
>>
>> This should cause no behavioral change.
> 
>> +       ret = __irq_domain_alloc_irqs_data(domain, virq, nr_irqs, node, arg, affinity);
>> +       if (ret <= 0)
>>                  goto out_free_desc;
> 
> Was or wasn't 0 considered as error code previously?

Oh. I need to clean this up, the idea is since this does not allocate 
IRQs, this should return error code and not an irq, I'll make this explicit.

> 
>>          return virq;
> 
>>   out_free_desc:
>>          irq_free_descs(virq, nr_irqs);
>>          return ret;
> 

-- 
Alexey
