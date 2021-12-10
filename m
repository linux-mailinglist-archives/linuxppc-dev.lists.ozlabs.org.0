Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 805A6471E64
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 23:56:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC0Pq2ftzz3cbr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 09:56:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lRJVrFA1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12f;
 helo=mail-lf1-x12f.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lRJVrFA1; dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9g9f5Wf8z3bjD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 05:56:38 +1100 (AEDT)
Received: by mail-lf1-x12f.google.com with SMTP id cf39so7611002lfb.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 10:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OLTFQmX2Kf2e3cZmLG4jxsS1bq2aSoDXpxl5QnKq9FU=;
 b=lRJVrFA11Fu94g9aC4quIzKTIJBQHb56jvC3UHQRYxQnYMhhiqHXe+HNIaU6izZboH
 h0BDFCIwI4bVAz64DQVVsH0MSKsIo5r3rhYcpSgEs+F8SRLOvGUk6MezYqtprOuHSHY+
 xZjhnDgdSP0x9ihrSMtshGYvbNVvxVMeCabfWJNzXp5+bcL+U+5yCBZgtjUoQy5c5Srk
 XvThuXHF65j6/Qpyivd03hsOvMnXYmDchKWNvnb9km4xj+cql2CnI3JZSdhbiWgBDsX+
 pJV/q1mj1vSBgnFw5Nf3SQ1PcuWrLHkWB0ABMsx7hJcTqhLbY3gqIMN0WZdDvJ/sUnhK
 zo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OLTFQmX2Kf2e3cZmLG4jxsS1bq2aSoDXpxl5QnKq9FU=;
 b=1f5uKvUaLQNhWBQz2ew9n+iNNUHODr3DeAh1N1B7VxExRWa1ieObWV+0s44O1nemkS
 aWAqlGx8JuufPTaj8BKNyNdfu1SNv+QPHemf2uXs9mRf6SJjixa34u06e3GbPRYZF9E/
 PPeeMZj38FpVFqVDo+zm6BlWVLXf1hrVKV+u5jB6Ajtl3us+KjIiSvIo+//BW4Ec91+Q
 NPng1j1qJs6lrcN1acv/NZbMGmHypi5QsgQTJ7rn0Lb088HIHhVpGQtUeqrBsnHKVpMX
 0kM8X373X/gEU1KZQkMaxozJGcZKITMjgb1U5u1sPZjug+KxH58J27Q4j95Y/6mdX0yC
 KOVw==
X-Gm-Message-State: AOAM532hBtwnhJ0PEfaC9Zmi3Tjf4FbLaOf9nF3nSKxY2JN3G1IobYsP
 eWnMTiAy6gDp81pWr1gtIKU=
X-Google-Smtp-Source: ABdhPJx4BKlEbZ+Eghk+XJYmXdOJaHtYRLuIKsc/RB19AF8hnZocVzO0VkIjSpmfvEqny0BWm7yDgw==
X-Received: by 2002:ac2:5101:: with SMTP id q1mr8849810lfb.319.1639162594092; 
 Fri, 10 Dec 2021 10:56:34 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id b10sm416126lfj.230.2021.12.10.10.56.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 10:56:33 -0800 (PST)
Subject: Re: [PATCH v4 07/25] reboot: Remove extern annotation from function
 prototypes
To: "Rafael J. Wysocki" <rafael@kernel.org>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-8-digetx@gmail.com>
 <CAJZ5v0i=zgubEtF5-Wnaqa5FMnfVUdSnEmD11-LAuYCH8ZCwrA@mail.gmail.com>
 <acf8289e-6ab8-6eda-ec06-e9044ddd9a92@gmail.com>
 <CAJZ5v0gvuteY4EtXWTKmh4-Wt-Z_dPcqfDLwc-ja1uovbV3rpw@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <bafcaa92-5bd1-874c-c5ff-a72ebc98945d@gmail.com>
Date: Fri, 10 Dec 2021 21:56:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0gvuteY4EtXWTKmh4-Wt-Z_dPcqfDLwc-ja1uovbV3rpw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 13 Dec 2021 09:47:48 +1100
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, Santosh Shilimkar <ssantosh@kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Thierry Reding <thierry.reding@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Stefano Stabellini <sstabellini@kernel.org>, alankao@andestech.com,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Lee Jones <lee.jones@linaro.org>, linux-m68k@lists.linux-m68k.org,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-parisc@vger.kernel.org,
 Linux PM <linux-pm@vger.kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Guo Ren <guoren@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

10.12.2021 21:35, Rafael J. Wysocki пишет:
> On Fri, Dec 10, 2021 at 7:16 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 10.12.2021 21:09, Rafael J. Wysocki пишет:
>>> On Fri, Nov 26, 2021 at 7:02 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>>>
>>>> There is no need to annotate function prototypes with 'extern', it makes
>>>> code less readable. Remove unnecessary annotations from <reboot.h>.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>
>>> I'm not sure that this is really useful.
>>>
>>> Personally, I tend to respect the existing conventions like this.
>>>
>>> Surely, this change is not required for the rest of the series to work.
>>
>> Problem that such things start to spread all over the kernel with a
>> copy-paste approach if there is nobody to clean up the code.
>>
>> This is not a common convention and sometimes it's getting corrected [1].
>>
>> [1] https://git.kernel.org/linus/6d7434931
> 
> In separate patches outside of series adding new features, if one is
> so inclined.
> 

Alright, I'll drop this patch then because it can't be done in parallel
without creating the merge conflict. I'll try not to forget to come back
to this later on.
