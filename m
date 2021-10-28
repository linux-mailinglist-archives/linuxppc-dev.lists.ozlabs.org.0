Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2EB43F436
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 03:02:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgPL44D32z3c9h
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 12:02:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=USVIOuLF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::232;
 helo=mail-lj1-x232.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=USVIOuLF; dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgJgk1y0nz2x9V;
 Fri, 29 Oct 2021 08:32:48 +1100 (AEDT)
Received: by mail-lj1-x232.google.com with SMTP id q16so13085140ljg.3;
 Thu, 28 Oct 2021 14:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FNhb8m0Up8WrlODFU5XusWNjgw7FYM5tGcizMhHIPzY=;
 b=USVIOuLFNftY9TSlAv8GQB7acWI1sWWXinRBTyt58drm2RaLh5La11nG4ixMTMewfR
 mX32BgQ2N30EhppM8q0HGzyhqJFMUCJMnblCfs4t5KonQ44KE0wlYv2W8rFYqs4V2koj
 XX371v1ONZUx01vnBeB6kBqd5XtkGxjVTj1e6iP0L3n7qnRFNsZrpRBj/O9TAqf3J13f
 DVFT1FMABW5ltJOUpFKPkQHX+APbXjkM1X+NMw4LCmok7h64fUY8hoIatZpEbYmauo9R
 3tzIe6iUnZRzMnNPnMBZ+KjZo2BGgmZ8KUvvaXZMV9Llm3C259zfQ4YRn+8CQPkkCOFN
 RJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FNhb8m0Up8WrlODFU5XusWNjgw7FYM5tGcizMhHIPzY=;
 b=FsgLbqzsIRXFc8vpRWj7ipCUUumXxkcum9qfW8NRt7HXqW9MECOWGmjcTbSe9jua4z
 IwT83VsXAKgYaD24zJHDVTIRATlPFQTkwo6hTnvO6Z2ZSCE0iz7PJhFy2XdM0TCw6HQ+
 zR2My/B6Rtxu7h4eB6DnuE/pD7hbo+VToy+LNQQcfe4JPu9DAvhanjM44aGk8gE5vzJV
 XmPdjws/r+XLwATokaD1RM+7wBYHlNE2cXz19KypyCjXhUl/RcedCg1MBOk0ZV8G5Yry
 9eoAgcb+4ZQMHttKm5cyiqH9iC1QwsZZrh3+iog3/QXe9917nUQOdnUVLWxIMdfPxXwW
 NF3A==
X-Gm-Message-State: AOAM531kSimYnVkN1sJeZHmF/MzmWkgYEjrx5hvCYvtqFWJP331OdSXc
 YM8OGG+AUNOsHM3Iok4keXk=
X-Google-Smtp-Source: ABdhPJwcWGds1J/UVngHunSwfN7ztb9W9OVxlAX827dktWLGe1JrS01AY9nWnDg96vqg3wWMmL+l6Q==
X-Received: by 2002:a2e:9b0e:: with SMTP id u14mr7220400lji.247.1635456760396; 
 Thu, 28 Oct 2021 14:32:40 -0700 (PDT)
Received: from [192.168.2.145] (46-138-44-18.dynamic.spd-mgts.ru.
 [46.138.44.18])
 by smtp.googlemail.com with ESMTPSA id bi14sm474384lfb.290.2021.10.28.14.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 14:32:39 -0700 (PDT)
Subject: Re: [PATCH v2 03/45] notifier: Add
 atomic/blocking_notifier_has_unique_priority()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-4-digetx@gmail.com>
 <YXqCz/utp2DFJJ45@smile.fi.intel.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c5fb7590-03a7-0eea-4040-07472a5c9710@gmail.com>
Date: Fri, 29 Oct 2021 00:32:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YXqCz/utp2DFJJ45@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 29 Oct 2021 12:02:21 +1100
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
 linux-ia64@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Tali Perry <tali.perry1@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Thierry Reding <thierry.reding@gmail.com>, Guo Ren <guoren@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-sh@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Tony Lindgren <tony@atomide.com>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-pm@vger.kernel.org,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-acpi@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org,
 Nancy Yuen <yuenn@google.com>, linux-arm-kernel@lists.infradead.org,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Nick Hu <nickhu@andestech.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

28.10.2021 14:00, Andy Shevchenko пишет:
> On Thu, Oct 28, 2021 at 12:16:33AM +0300, Dmitry Osipenko wrote:
>> Add atomic/blocking_notifier_has_unique_priority() helpers which return
>> true if given handler has unique priority.
> 
> ...
> 
>> +/**
>> + *	atomic_notifier_has_unique_priority - Checks whether notifier's priority is unique
>> + *	@nh: Pointer to head of the atomic notifier chain
>> + *	@n: Entry in notifier chain to check
>> + *
>> + *	Checks whether there is another notifier in the chain with the same priority.
>> + *	Must be called in process context.
>> + *
>> + *	Returns true if priority is unique, false otherwise.
> 
> Why this indentation?

This is the same doc-comment style used by this file in general. I
haven't tried to invent anything new.


> ...
> 
>> +	/*
>> +	 * This code gets used during boot-up, when task switching is
>> +	 * not yet working and interrupts must remain disabled.  At
> 
> One space is enough.

This comment is replicated multiple times over this source file. You can
find it before each down_write(). I borrowed the text as-is, for
consistency.
